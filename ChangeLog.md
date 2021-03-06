# 1.17b15
* The flag `-emdbed-image img1 -embed-image imd2` etc to embed image in HTML.    
**(Dec-27-2013)**

* The flag `-d` is changed to `-domain`. Added new option `-disposition` to specify the type of content disposition.  
**(Dec-22-2013)**  

* `-enc` flag is changed to `-enc-type` which is used for encoding type of one line messages. This option can be used with `-M` or `-attach`.  
**(Dec-08-2013)**  

* Major changes on how things work. Now each of one line message can have its own character set, mime type and encoding type. Before there was not way to distinguish the messages.  The optiopn -attach option also behaves the same way.  

* Fixes Issue 29. A file can be included as body of the mail with the flag `-msg-body file`. The character set and mime type can be specified with -cs and -mime-type flags but files can not be encoded.  

* Fixes Issue 37. A new flags `-mime-type "type"` can be used to specify the MIME type. Default is text/plain. It can be used with -M or -attach.  
**(Dec-08-2013)**  

* Fixes Issue 36. Only specify filename with `-attach`. Specify other MIME * parameters with appropriate flags.  
**(Dec-07-2013)**  

* Fixes Issue 35. The default encoding type is base64. If no encoding should be used, specify encoding type with `-enc-type  "none"`.   
**(Dec-07-2013)**  

* Fixess Issue 34. Try the current addrinfo in `connect()`, mistakenly the first one was used. If `getaddrinfo()` returned multiple results and if connect() to first address failed, the rest of the addresses were not tried.  Patch sent by Peter Liu.   
**(Nov-27-2013)**  

* Fixes Issue 30. Support custom Content-type header and to support Conent-ID. The custom Conent-type can be specified with the option `-conent-type` and the Conent-ID of the attachment can be specified as fifth value of the -attach option. Thanks to skalogryz for supplying the patch.  
**(Nov-06-2013)**.  

* Fixes Issue 26. Added options `-4` and `-6` to force using IPv4 or IPv6 address of the SMTP server.   
**(Oct-20-2013)**  

# 1.17b14
* Multiline input with `-M` was completely broken.  
	**(Oct-20-2013)**

# 1.17b13
* Changed Copyright to more flexible BSD from GNU GPL. Added `-copyright` flag.  
**(Oct-12-2013)**

* SMTP authentication was broken if the username and passwords are long enough to create longer than 60 characters base64 encoded string. A newline was added after 60 characters causing authentication to fail.
Fixes Issue 20. Fixes Issue 22.  
**(Oct-12-2013)**

* Support DESTDIR during installation. Fixes Issue 5.  

* Don't show SSL info in quiet mode. Fixes Issue 21.  
**(Oct-12-2013)**

* New ommand line option -enc for Content-Transfer-Encoding. If your one line text message with -M is non-ascii, you should use -enc base64. Note: non-ascii input from windows cmd does not work at this time, 
	however it works fine in linux and mac.  
**(Jul-01-2013)**

# 1.17b12
* Add \r\n to multiple one line messages specified by `-M`.  Possible Fix for Issue 12.

* Do not show attachments in verbose mode. The option -show_attach   will enable it. Fixes Issue 13.  
**(Jun-16-2013)**

# 1.17b11
* mailsend writes "Mail sent successfully" message on stdout in interactive mode even if -quiet flag is used. Fixes Issue 6.  
**(May-05-2013)**

# 1.17b10
* If there are some kind of socket error, print the error message. If  a log file is specified with -log, the error will be written there.  
**(Mar-23-2013)**

* modified Makefile.in to support make -j. Fixes Issue 4.  

* fixed several warnings  
**(Apr-27-2013)**

# 1.17b9
* There was a bug if multiple attachments were specified. The temp file was  
	created only once and was removed. The bug shows up in Windows.

* The flag -l is changed to -list.  

* A new flag -log is added for logging status messages to a file.   It is very alpha at the moment. User -v to see anything useful. The log messages are time stamped.  
**(Mar-16-2013)**

# 1.17b8
* Print more error messages.  
**(Mar-06-2013)**

# 1.17b7
* Print some error message with errno.  
**(Mar-06-2013)**

# 1.17b6
* MIME temp file was created on current working directory. Now go through some  huristics to determine the path.  
**(Mar-05-2013)**

# 1.17b5
* `getaddrinfo()` was not found in ws2_32 dll in Windows 2000.  included  Wspiapi.h header in msock library as per Microsoft <http://support.microsoft.com/kb/955045>. Thanks to Bob R for reporting the issue. It's a Windows only change.  
**(Feb-21-2013)**

# 1.17b4
* Added flag -H "header" to add custom headers. For example:   -H "X-Priority: 1" -H "Importance: high". Requested by David Young.  
**(Feb-12-2013)**

# 1.17b3
* Individual auth flags were not working.  
**(Jan-21-2013)**

# 1.17b2
* IPv6 address was printed wrong.  
**(Aug-26-2012)**

# 1.17b1
* IPv6 support for all platforms.  
**(Aug-25-2012)**

* Multiple one line message can be added with -M, for example:  `-M "message line 1" -M message line 2"`  
**(Aug-26-2012)**

* First cut of debian package.  

* After sending SMTP EOM, the status code was not checked. It is possible  that the server has rejected the mail due to message too large etc. Thanks to Peter Soppe for reporting it.  
**(Aug-24-2012)**

* Do not enforce authentication just because server supports it.  Do it only if the user wants it.  
**(Jun-29-2012)**

* Added flag `-ct <seconds>` for connect timeout with SMTP server. The   default default timeout is 5 seconds.

* Exit with 0 if everything went well otherwise exit with 1 in case   of error.

* created man page. Added install target to Makefile.  
**(July-05-2012)**

# 1.16
* Added support for SMTP over SSL with -ssl. It is different than   STARTTLS in the sense that it is not part of SMTP protocol, the entire connection is encrypted from start to end. Note: No checking is performed on certificate. At this time, smtp.gmail.com does SMTP over SSL on port 465.  
**(Feb-27-2012)**

* Cleaned up examples. Examples can be seen with -ex, before at least -exa  was needed.   
**(Feb-27-2012)**

* Created Makefile.nmake for MS Visual Studio 10.  
**(Feb-28-2012)**

# 1.15b5
* New flag '-name "Your Name"' can be used to add your name in the  From header, e.g. -f jdoe@example.com -name "John Doe" will create the From header as: From: John Doe <jdoe@example.com>  
**(Apr-24-2007)**

* Changed >> to [C] and << to [S] in debug output to represent Client and  Server respectively.  
**(Apr-25-2007)**

* The flags '-d domain' is not mandatory anymore. If not specified  "localhost" will be used as domain in HELO or EHLO.  
**(Apr-25-2007)**

# 1.15b4
* When using -info and -smtp, message was wrong.  

* Greetings can be multi line. Thanks to Keith B Smith.  

* Some server don't say ESMTP in the greetings, but still  supports it. In that case force EHLO with -esmtp.  Again Thanks to Keith B Smith.

* The flag `-ex` is now `-example`.  
**(Mar-18-2007)**
    
# 1.15b3
* Compiled on Windows with openssl 0.9.7l.  
* If addresses are specified in a file with -l, do not ask for To. Addresses  int he file not not validated howerver.

# 1.15b2
* New flag -ex show examples.  

* New flag -info to show SMTP server info.  

* Few bug fixes   
**(Feb-18-2007)**

# 1.15a
* Added support for AUTH CRAM-MD5, AUTH PLAIN and AUTH LOGIN  autentication.  
**(Feb-17-2007)**

* Added support for AUTH PLAIN  
**(Feb-11-2007)**

* The flag "-a" is changed to "-attach"  
**(Feb-11-2007)**

* The flags "-m" is gone. There is no need for it anymore,  as   attachment type can be changed with i or a with the flag -a. If you want a "body" text, specify it with -a "file.txt,text/plain,i" as the first attachment.  
**(Feb-11-2007)**

* STARTTLS support. If the SMTP server supports it, enable it in mailsend  with flag "-starttls".  
**(Feb-11-2007)**  

# 1.14
* Content-disposition can be changed to attachment or inline.  Example: -a * "file.gif,image/gif,i". The default is attachment.  -a * "file.gif,image.gif,a" is same as a "file.gif,image/gif"  
**(Feb-06-2007)**

* Bcc was broken  
**(Nov-03-2006)**

# 1.13
* If no subject is specified with -sub, it'll be empty. Before  the default subject was "hello!"  
**(Jun-25-2006)**

* The flag -M was broken.  Thanks to Amnon S for reporting it.  
**(Jun-25-2006)**

* For text attachments, Content-Disposition was always inline. Now it'll  be attachment.  Thanks to Danny Casier.  
**(May-21-2006)**

# 1.12
* mailsend was not adding Date header. Some SMTP servers does not add it  either. Now by default it'll add the Date header (make sure your clock is set properly). If you don't want mailsend to add Date header, use the flag +D. Thanks to Mr S J Hannan for the bug report.  
**(May-20-2006)**

# 1.11
* Attachment seperator character is changed to a , from :. Because in  Windows drive is specified with :. Thanks to Jeppe Teglgaard Mohr for pointing it out. Example:  -a "c:\file.gif,image/gif"   
**(Apr-23-2006)**

* The flag -m is back. This option can be used to attach a text or html  file as a blody (inline). Example: -m "file.html,text/html". It is the caller's responsibily to make sure file type is correct. mailsend will not verify if the file is binary or text.  
**(Apr-23-2006)**

* New flag -rrr to request read receipts. Suggested by marc hubaut.  
**(May-14-2006)**

* New flag -rt to add Reply-To header.  
**(May-14-2006)**

# 1.10
* If the attachment type was text/plain, <CR><LF> was not added after  Content-Disposition line which caused attachment to be ignored by some mail readers. 
