*** settings ***
Library        ${CURDIR}/../Resources/library/test_email.py
Library        RPA.PDF
Library        Pdf2TextLibrary
Library        DateTime
Library        ImapLibrary2

*** Keywords ***
Open email and download pdf by custom library
    [Documentation]     This method use custom library and works both TH and EN subject (document from https://github.com/ikvk/imap_tools)
    [Arguments]         ${email_username}     ${email_password}     ${email_sender}      ${topic}       ${current_time}
    ${download_path}     test_email.download pdf email    ${email_username}     ${email_password}     ${email_sender}      ${topic}     ${current_time}
    [Return]            ${download_path}

Get current date and time
    ${date data}                      DateTime.Get current date
    ${datetime_format}                DateTime.Convert date     ${date data}        result_format=%y-%m-%d %H:%M:%S
    [Return]            ${datetime_format}

Verify download path has pdf and decrypt pdf
    [Arguments]     ${download_path}     ${dob}
    Verify download folder has pdf       ${download_path}
    ${decrypt_pdf}         Decrypt pdf with date of birth     ${download_path}      ${dob}

Decrypt pdf with date of birth
    [Documentation]     Decrypt pdf password with dob of that account
    [Arguments]     ${pdf_path}     ${dob}
    ${decrypt_pdf_path}           BuiltIn.Catenate    SEPARATOR=    ${pdf_path}    _decrypt.pdf
    ${success}                    RPA.PDF.Decrypt pdf     ${pdf_path}     ${decrypt_pdf_path}      ${dob}
    [Return]                      ${decrypt_pdf_path}

Verify download folder has pdf
    [Arguments]     ${download_path}
    BuiltIn.Should not be equal     ${download_path}        None

Verify pdf contain my name
    [Arguments]     ${pdf_path}
    ${detail_pdf}                Pdf2TextLibrary.Convert pdf to txt      ${pdf_path}
    BuiltIn.Should contain       ${detail_pdf}           thanasornsawan

Open email and download pdf by ImapLibrary2
    [Documentation]     This method works only EN subject and outlook
    [Arguments]     ${email_username}     ${email_password}     ${email_sender}      ${topic}
    ImapLibrary2.Open mailbox    host=outlook.office365.com        user=${email_username}   password=${email_password}
    ${result_index}     ImapLibrary2.Wait for email     sender=${email_sender}   subject=${topic}      status=unseen
    ImapLibrary2.Walk multipart email           ${result_index}
    ${email_payload}    ImapLibrary2.Get multipart payload
    email_page.Verify email has attachment      ${email_payload}
    ${download_path}    email_page.Download pdf from email          ${email_payload}
    ImapLibrary2.Mark email as read             ${result_index} 
    Close mailbox
    [Return]            ${download_path}

Download pdf from email
    [Documentation]     In email payload has 2 boundaries (multipart) and pdf content is in last index of payload or payload[1].
    ...                 The result of content type will be application/octet-stream not pdf because of binary in email.
    ...                 The payload that has pdf content was encode in base64 but after decode,the content still be byte object.
    ...                 Because of byte object,it need to create file as binary file to convert it back to pdf format
    [Arguments]         ${email_payload}
    ${pdf_name}         BuiltIn.Set variable     ${email_payload[1].get_filename()}
    ${pdf_payload_decode_bases64}      BuiltIn.Set variable    ${email_payload[1].get_payload(decode=True)}
    ${download_path}     BuiltIn.Catenate        SEPARATOR=    ${CURDIR}/../../../email_attachments/     ${pdf_name}
    OperatingSystem.Create binary file           ${download_path}       ${pdf_payload_decode_bases64}
    [Return]             ${download_path}

Verify email has attachment
    [Arguments]         ${email_payload}
    ${email_has_attachment}     BuiltIn.Set variable            ${email_payload[1].get_content_disposition()}
    BuiltIn.Should be equal     ${email_has_attachment}     	attachment