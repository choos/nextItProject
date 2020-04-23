
package com.zero.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Part;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.reply.vo.ReplyVO;

@Component("ReviewFileUtils")
public class ReviewFileUtils {

	private static final String filePath = "../../../../webapp/resources/image/reviewPhoto";
	private static final String uploadPath = "/home/pc12/jweb-workspace/zero/src/main/webapp"; // �쎒�꽌踰꾩쓽 臾쇰━�쟻�씤 寃쎈줈

	private final Logger logger = LoggerFactory.getLogger(getClass());

	/*
	 * path = "�쎒�꽌踰� 湲곗��쑝濡� �빐�꽌 洹� �씠�븯 寃쎈줈 path = "/resources/image/uf"
	 */
	public String processMultifile(Part part, String path) throws IOException {

		if (part != null && part.getSize() > 0) {
			String originalName = part.getSubmittedFileName();
			logger.debug("originalName={}", originalName);
			String extName = originalName.substring(originalName.lastIndexOf("."));
			String fileName = UUID.randomUUID().toString().replace("-", "") + extName;
			String filePath = uploadPath + path;
			System.out.println("filePath = {}, fileName = {}" + filePath + ",  " + fileName);

			org.apache.commons.io.FileUtils.copyInputStreamToFile(part.getInputStream(), new File(filePath, fileName));
			return path + "/" + fileName;
		} else {
			return null;
		}
	}

	public void fileInfo2Board(ReplyVO board, MultipartHttpServletRequest mpRequest) throws Exception {
		Part multi = mpRequest.getPart("reviewImgFile");
		String new_img_name = null;
		new_img_name = processMultifile(multi, "/resources/image/reviewPhoto");
		if (new_img_name != null)
			board.setSrContentImg(new_img_name);
		logger.debug("�돱�꽕�엫~~~~~~~~~~~~~~~~~~~{}", board);
	}

	public List<Map<String, Object>> parseInsertFileInfo(ReplyVO boardVO, MultipartHttpServletRequest mpRequest)
			throws Exception {

		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		int srNum = boardVO.getSrNum();

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("srNum", srNum);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
