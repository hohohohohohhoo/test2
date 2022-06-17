package kr.co.dw.service.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.repository.item.ItemDAO;

@Service
public class itemServiceImpl implements itemService{

	@Autowired
	private ItemDAO iDao;

	@Override
	@Transactional
	public void insert(ItemDTO iDto) {
		// TODO Auto-generated method stub
		iDao.insert(iDto);
		List<String> list = iDto.getIfilename();
		for(int i = 0 ; i < list.size();i++) {
			String filename = list.get(i);
			int iId = iDto.getiId();
			iDao.upload(iId,filename);
		}
	}

	@Override
	public List<ItemDTO> select() {
		// TODO Auto-generated method stub
		return iDao.select();
	}
	
	@Override
	public List<String> getfile(int iId) {
		// TODO Auto-generated method stub
		return iDao.getfile(iId);
	}
	@Override
	public ItemDTO read(int iId) {
		// TODO Auto-generated method stub
		return iDao.read(iId);
	}
	
}
