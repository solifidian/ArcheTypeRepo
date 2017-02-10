package com.booking.common.util.email;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.apache.log4j.Logger;

public class Emailsend {
  private static Logger logger = Logger.getLogger(Emailsend.class);

  public void smtpInit(SimpleEmail email) {
    String googleUserName = null;
    String googlePassword = null;

    /*
     * try { File file = new File("util.properties"); FileInputStream fis = new
     * FileInputStream(file.getAbsoluteFile());
     * 
     * Properties pro = new Properties(); pro.load(fis);
     */
    googleUserName = "psyche2823@gmail.com";
    googlePassword = "booking1234";

    email.setHostName("smtp.gmail.com");
    email.setSmtpPort(587);
    email.setAuthentication(googleUserName, googlePassword);

    /*
     * } catch (IOException e) { e.printStackTrace(); }
     */

  }

  public boolean sendEmail(EmailVO vo) {
    long beginTime = System.currentTimeMillis();
    SimpleEmail email = new SimpleEmail();
    smtpInit(email);
    boolean su = false;
    String rt = "failure";
    try {
      email.setSSL(true);
      email.setTLS(true);



      email.addTo(vo.getEmailTo(), vo.getEmailToName(), "UTF-8");
      email.setFrom(vo.getEmailFrom(), vo.getEmailFromName(), "UTF-8");
      email.setSubject(vo.getEmailSubject());
      email.setMsg(vo.getEmailMsg());

      rt = email.send();
      su = true;
      System.out.println("이메일 발송완료");
    } catch (EmailException i) {
      logger.warn("error", i);
      su = false;
    } finally {
      long execTime = System.currentTimeMillis() - beginTime;
      logger.info("exec time:" + execTime);
      logger.info("RT  MSG" + rt);

    }
    return su;
  }

}
