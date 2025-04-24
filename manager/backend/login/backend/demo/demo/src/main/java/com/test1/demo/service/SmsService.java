package com.test1.demo.service;

import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import net.nurigo.sdk.NurigoApp;
import org.springframework.stereotype.Service;

@Service
public class SmsService {

    private final DefaultMessageService messageService;

    public SmsService() {
        this.messageService = NurigoApp.INSTANCE.initialize(
                "NCSQLNRUHBWUMPYA",    // 🔁 너의 API Key
                "PJWXOND3C3XXICBINIAGGPBI41QOQDA4", // 🔁 너의 API Secret
                "https://api.coolsms.co.kr"
        );
    }

    public void sendSms(String to, String text) {
        Message message = new Message();
        message.setFrom("01093632926");  // 🔁 등록된 발신 번호
        message.setTo(to);
        message.setText(text);

        SingleMessageSendingRequest request = new SingleMessageSendingRequest(message);
        SingleMessageSentResponse response = this.messageService.sendOne(request);

        System.out.println("문자 전송 결과: " + response);
    }
}
