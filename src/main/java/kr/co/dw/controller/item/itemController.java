package kr.co.dw.controller.item;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.service.item.itemService;
import kr.co.dw.utils.DWUtils;

@Controller
@RequestMapping("/item")
public class itemController {

   @Autowired
   private itemService iService;
   
   
   private String uploadPath = "C:"+File.separator+"upload";
   
   @RequestMapping(value = "/read/{iId}", method = RequestMethod.GET)
   public String read(@PathVariable("iId") int iId, Model model) {
      
      ItemDTO item = iService.read(iId);
      model.addAttribute("item", item);
      return "/item/read";
   }
   
   @Transactional
   @RequestMapping(value = "/list", method = RequestMethod.GET,produces = "text/plain; charset=UTF-8")
   public String list(Model model) {
      
      List<ItemDTO> list = iService.select();
      
      

      
      model.addAttribute("list", list);
      
      return "/item/list";
   }
   
   
   @RequestMapping(value = "/insert", method = RequestMethod.POST)
   public ResponseEntity<String> insert(MultipartHttpServletRequest request) {
      ResponseEntity<String> entity = null;
      String iId = request.getParameter("iId");
      int id = Integer.parseInt(iId);
      String iName = request.getParameter("iName");
      String iPrice = request.getParameter("iPrice");
      int Price = Integer.parseInt(iPrice);
      String iDc = request.getParameter("iDc");
      int DC = Integer.parseInt(iDc);
      String iCount = request.getParameter("iCount");
      int Count = Integer.parseInt(iCount);
      
      
      try {
         Map<String, MultipartFile>map = request.getFileMap();
         List<String> filenameList = new ArrayList<String>();
         Set<String> set = map.keySet();
         Iterator<String> it = set.iterator();
         while (it.hasNext()) {
            String key = it.next();
            MultipartFile file = map.get(key);
            String uploadedFilename = DWUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
            filenameList.add(uploadedFilename);
            entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
            
         }
      
         String ifilename = filenameList.get(0);
         
         ItemDTO iDto = new ItemDTO(id, iName, Price, DC, Count, null, ifilename);
         
         iDto.setIfilename(filenameList);
         iService.insert(iDto);
         
         
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
   
   @RequestMapping(value = "/insert", method = RequestMethod.GET)
   public String insertui() {
      return "/item/insert";
   }
   
}