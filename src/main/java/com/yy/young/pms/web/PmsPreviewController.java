package com.yy.young.pms.web;

import com.yy.young.common.util.Result;
import com.yy.young.interfaces.log.annotation.Log;
import com.yy.young.pms.model.Communication;
import com.yy.young.pms.model.PmsUser;
import com.yy.young.pms.service.IPmsPreviewService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author hu_xuanhua_hua
 * @ClassName: PreviewController
 * @Description: TODO
 * @date 2018-09-19 19:17
 * @versoin 1.0
 **/
@Controller
@RequestMapping("/pms/pmspreview")
public class PmsPreviewController {
    @Resource(name = "pmsPreviewService")
    IPmsPreviewService pmsPreviewService;//数据层服务
    @Log("查询单条")
    @RequestMapping({"/getPmsUserById"})
    @ResponseBody
    public Object getPmsUserById(String id, HttpServletRequest request) throws Exception {
      PmsUser pmsUser =  pmsPreviewService.getPmsUserById(id);
       Communication communication =  pmsPreviewService.getCommunicationById(id);
       pmsUser.setCommunication(communication);
        return new Result(pmsUser);
    }
}
