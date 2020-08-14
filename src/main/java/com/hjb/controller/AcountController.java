package com.hjb.controller;

import com.zhuozhengsoft.pageoffice.FileSaver;
import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hjb.service.Servicezhuanzhuang;
import org.w3c.dom.Document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.util.List;

//@RequestMapping("AcountController.do")
@Controller
public class AcountController {

    @Value("${posyspath}")
    private String poSysPath;
    @Value("${popassword}")
    private String poPassWord;
    private Servicezhuanzhuang servicezhuanzhuang;
    private static final long serialVersionUID = -758686623642845302L;
    @RequestMapping("/Todemo")
    public String Todemo(){return "demo";}
    @RequestMapping("/ToWord")
    public String ToWord(){return "Word";}
    public Servicezhuanzhuang getServicezhuanzhuang() {
        return servicezhuanzhuang;
    }
    @Autowired
    public void setServicezhuanzhuang(Servicezhuanzhuang servicezhuanzhuang) {
        this.servicezhuanzhuang = servicezhuanzhuang;
    }


    @RequestMapping("/AcountController/zhuanzhang")
    public String  zhuanzhuang(int id1,int id2,int money,ModelMap map) {

//		String result=servicezhuanzhuang.zhuanzhuang(id1, id2, money);
//		map.put("result", result);
        System.out.println();
        return "/login.jsp";
    }
    @RequestMapping("/AcountController/login")
    public String login(){
        return "/index.jsp";
    }
    @RequestMapping("/savefile")
    public  void  savefile(HttpServletRequest request, HttpServletResponse response){
        FileSaver fs = new FileSaver(request, response);
        fs.saveToFile(request.getServletContext().getRealPath("upload/") +"/"+ fs.getFileName());
        fs.close();
        System.out.println("come in savefile!");

    }
    @RequestMapping("/PoiWordToHtml")
    public void PoiWordToHtml()throws Throwable{
       /* final String path = "D:\\";
        final String file = "UML模型.doc";
        InputStream input = new FileInputStream(path + file);
        HWPFDocument wordDocument = new HWPFDocument(input);
        WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(
                DocumentBuilderFactory.newInstance().newDocumentBuilder()
                        .newDocument());
        wordToHtmlConverter.setPicturesManager(new PicturesManager() {
            public String savePicture(byte[] content, PictureType pictureType,
                                      String suggestedName, float widthInches, float heightInches) {
                return suggestedName;
            }
        });
        wordToHtmlConverter.processDocument(wordDocument);
        List pics = wordDocument.getPicturesTable().getAllPictures();
        if (pics != null) {
            for (int i = 0; i < pics.size(); i++) {
                Picture pic = (Picture) pics.get(i);
                try {
                    pic.writeImageContent(new FileOutputStream(path
                            + pic.suggestFullFileName()));
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                }
            }
        }
        Document htmlDocument = wordToHtmlConverter.getDocument();
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        DOMSource domSource = new DOMSource(htmlDocument);
        StreamResult streamResult = new StreamResult(outStream);
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer serializer = tf.newTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
        serializer.setOutputProperty(OutputKeys.INDENT, "yes");
        serializer.setOutputProperty(OutputKeys.METHOD, "html");
        serializer.transform(domSource, streamResult);
        outStream.close();
        String content = new String(outStream.toByteArray());
        FileUtils.writeStringToFile(new File(path, "UML模型.html"), content, "utf-8");*/
    }
}
