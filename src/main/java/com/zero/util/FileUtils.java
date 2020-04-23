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

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zero.ufboard.vo.UFBoardVO;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "../../../../webapp/resources/image/UF";
	private static final String uploadPath = "/home/pc12/jweb-workspace/zero/src/main/webapp"; // �쎒�꽌踰꾩쓽 臾쇰━�쟻�씤 寃쎈줈

	public String processMultifile(Part part, String path) throws IOException {

		if (part != null && part.getSize() > 0) {

			String originalName = part.getSubmittedFileName();
			System.out.println(originalName);
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

	public void fileInfo2Board(UFBoardVO board, MultipartHttpServletRequest mpRequest) throws Exception {
		Part multi = mpRequest.getPart("ufImg1File");
		String new_img_name = null;
		new_img_name = processMultifile(multi, "/resources/image/uf");
		if (new_img_name != null)
			board.setUfImg1(new_img_name);

		multi = mpRequest.getPart("ufImg2File");
		new_img_name = processMultifile(multi, "/resources/image/uf");
		if (new_img_name != null)
			board.setUfImg2(new_img_name);

		multi = mpRequest.getPart("ufImg3File");
		new_img_name = processMultifile(multi, "/resources/image/uf");
		if (new_img_name != null)
			board.setUfImg3(new_img_name);

		multi = mpRequest.getPart("ufImg4File");
		new_img_name = processMultifile(multi, "/resources/image/uf");
		if (new_img_name != null)
			board.setUfImg4(new_img_name);

		multi = mpRequest.getPart("ufImg5File");
		new_img_name = processMultifile(multi, "/resources/image/uf");
		if (new_img_name != null)
			board.setUfImg5(new_img_name);

		multi = mpRequest.getPart("ufImg6File");
		new_img_name = processMultifile(multi, "/resources/image/uf");
		if (new_img_name != null)
			board.setUfImg6(new_img_name);

		multi = mpRequest.getPart("ufImg7File");
		new_img_name = processMultifile(multi, "/resources/image/uf");
		if (new_img_name != null)
			board.setUfImg7(new_img_name);

		multi = mpRequest.getPart("ufImg8File");
		new_img_name = processMultifile(multi, "/resources/image/uf");
		if (new_img_name != null)
			board.setUfImg8(new_img_name);

	}

	public List<Map<String, Object>> parseInsertFileInfo(UFBoardVO boardVO, MultipartHttpServletRequest mpRequest)
			throws Exception {

		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		int ufNum = boardVO.getUfNum();

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
				listMap.put("ufNum", ufNum);
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
