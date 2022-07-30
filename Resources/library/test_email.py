import os
from robot.libraries.BuiltIn import BuiltIn
from datetime import datetime, date
from imap_tools import MailBox, A, AND, OR, NOT

class test_email():
    def download_pdf_email(self, email, password, sender, topic, current_datetime):
        filename = ""
        foldername = "email_attachments/"
        date_time_obj = datetime.strptime(current_datetime,'%y-%m-%d %H:%M:%S')
        BuiltIn().log('request email at time: ' + str(date_time_obj.replace(tzinfo=None)))
        try:
            mb = MailBox('outlook.office365.com').login(str(email), str(password))
            messages = mb.fetch(criteria=AND(seen=False, from_=str(sender), date_gte=date.today()),reverse =True, limit=1, mark_seen=True, bulk=True)
            for msg in messages:
                BuiltIn().log('email receive time is: ' + str(msg.date.replace(tzinfo=None)))
                if  msg.date.replace(tzinfo=None) <= date_time_obj.replace(tzinfo=None):
                    BuiltIn().log("email is older than expected")
                    if  msg.subject==str(topic):
                        for att in msg.attachments:
                            if att.filename.endswith('.pdf'):
                                filename = att.filename
                                files = att.payload
                                foldername = foldername + filename
                                with open(foldername, "wb") as fp:
                                    fp.write(files)
                                BuiltIn().log('download pdf path is: ' + str(foldername))
                                return  foldername
                            else:
                                BuiltIn().log('Not found pdf file')
                    else:
                        BuiltIn().log('Not found email subject ${topic}')
                else:
                    BuiltIn().log('The lasted email is newer than expected')
        except Exception as error:
            return error