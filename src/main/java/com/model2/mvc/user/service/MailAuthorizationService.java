package com.model2.mvc.user.service;

import com.model2.mvc.common.util.RandomSerialGenerator;
import com.model2.mvc.mail.MailAgent;
import com.model2.mvc.mail.MailTransferException;
import com.model2.mvc.user.domain.MailAuthorizationInfo;
import com.model2.mvc.user.repository.MailAuthorizationRepository;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class MailAuthorizationService {
    private final MailAuthorizationRepository mailAuthorizationRepository;
    private final MailAgent mailAgent;

    public void sendAuthenticationMail(String receiverMailAddress) throws MailTransferException {
        JSONObject metadata = readMailMetadata();
        String generatedCode = RandomSerialGenerator.generate(40);
        this.mailAgent.send(receiverMailAddress,
                            new java.util.Date(),
                            (String)metadata.get("subject"),
                            (String)metadata.get("message"),
                            (String)metadata.get("authenticationURL") +
                            generatedCode +
                            "&authenticatedEmail=" +
                            receiverMailAddress);
        MailAuthorizationInfo mailAuthorizationInfo = new MailAuthorizationInfo();
        mailAuthorizationInfo.setEmail(receiverMailAddress);
        mailAuthorizationInfo.setAuthenticationCode(generatedCode);
        this.mailAuthorizationRepository.save(mailAuthorizationInfo);
    }

    private JSONObject readMailMetadata() {
        InputStream is = getClass().getClassLoader().getResourceAsStream("constants/authenticate-mail.json");
        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line).append("\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
        return (JSONObject)JSONValue.parse(sb.toString());
    }

    public boolean checkValidCode(String email, String code) {
        Optional<MailAuthorizationInfo> byEmail = this.mailAuthorizationRepository.findByEmail(email);
        if (byEmail.isPresent()) {
            MailAuthorizationInfo info = byEmail.get();
            if (info.getAuthenticationCode().equals(code)) {
                info.setAuthenticated(true);
                return true;
            }
        }
        return false;
    }

    public boolean checkAuthorization(String email) {
        Optional<MailAuthorizationInfo> infoOptional = this.mailAuthorizationRepository.findByEmail(email);
        if (infoOptional.isPresent()) {
            MailAuthorizationInfo info = infoOptional.get();
            return info.isAuthenticated();
        }
        return false;
    }

    public void removeAuthenticationInfo(String email) {
        this.mailAuthorizationRepository.deleteByEmail(email);
    }
}
