package com.java.serviceimpl;

import com.java.entity.AEAssociation;
import com.java.entity.ImageBean;
import com.java.entity.PageBean;
import com.java.entity.StudentAndAsso;
import com.java.service.AEAssoService;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.java.dao.AEAssoDao;

@Service("aeassoService")
public class AEAssoServiceImpl implements AEAssoService {
	@Resource
	private AEAssoDao aeassoDao;
	@Override
	public AEAssociation addApplication(AEAssociation aea) {
		// TODO �Զ����ɵķ������
		return aeassoDao.addApplication(aea);
	}
	@Override
	public List<AEAssociation> checkEstablish(AEAssociation aea) {
		// TODO �Զ����ɵķ������
		return aeassoDao.checkEstablish(aea);
	}
	
	@Override
	public int selectCount(int userid) {
		return aeassoDao.selectCount(userid);
	}
	
	@Override
	public List<AEAssociation> findByPage(HashMap<String,Object> map) {	
		return aeassoDao.findByPage(map);
	}
	@Override
	public int selectAllCount() {
		// TODO �Զ����ɵķ������
		return aeassoDao.selectAllCount();
	}
	@Override
	public List<AEAssociation> findAllByPage(HashMap<String, Object> map) {
		// TODO �Զ����ɵķ������
		return aeassoDao.findAllByPage(map);
	}
	@Override
	public AEAssociation listDetailsById(int assoid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.listDetailsById(assoid);
	}
	@Override
	public ImageBean listView(String assoid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.listView(assoid);
	}
	@Override
	public void applyJoinAsso(StudentAndAsso saa) {
		// TODO �Զ����ɵķ������
		aeassoDao.applyJoinAsso(saa);
	}
	@Override
	public int selectJoinCount(int userid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.selectJoinCount(userid);
	}
	@Override
	public List<StudentAndAsso> findJoinByPage(HashMap<String, Object> map) {
		// TODO �Զ����ɵķ������
		return aeassoDao.findJoinByPage(map);
	}
	@Override
	public AEAssociation findJoinById(int assoid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.findJoinById(assoid);
	}
	@Override
	public StudentAndAsso checkIsApply(int userid, int assoid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.checkIsApply(userid,assoid);
	}
	@Override
	public int selectAcceptCount(int userid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.selectAcceptCount(userid);
	}
	@Override
	public List<StudentAndAsso> findAcceptByPage(HashMap<String, Object> map) {
		// TODO �Զ����ɵķ������
		return aeassoDao.findAcceptByPage(map);
	}
	@Override
	public int selectMyAssoCount(int userid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.selectMyAssoCount(userid);
	}
	@Override
	public StudentAndAsso findMyAssoByPage(HashMap<String, Object> map) {
		// TODO �Զ����ɵķ������
		return aeassoDao.findMyAssoByPage(map);
	}
	@Override
	public int selectMemberCount(int assoId) {
		// TODO �Զ����ɵķ������
		return aeassoDao.selectMemberCount(assoId);
	}
	@Override
	public List<StudentAndAsso> findAllUserByPage(HashMap<String, Object> userMap) {
		// TODO �Զ����ɵķ������
		return aeassoDao.findAllUserByPage(userMap);
	}
	@Override
	public AEAssociation checkAsso(int assoid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.checkAsso(assoid);
	}
	@Override
	public void revokeCreateAsso(int assoid) {
		// TODO �Զ����ɵķ������
		aeassoDao.revokeCreateAsso(assoid);
	}
	@Override
	public StudentAndAsso checkJoinId(int applyid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.checkJoinId(applyid);
	}
	@Override
	public void revokeJoinAsso(int applyid) {
		// TODO �Զ����ɵķ������
		aeassoDao.revokeJoinAsso(applyid);
	}
	@Override
	public StudentAndAsso checkJoinById(int assoid, int userid){
		// TODO �Զ����ɵķ������
		return aeassoDao.checkJoinById(assoid,userid);
	}
	@Override
	public void optionApply(int applyid, String op) {
		// TODO �Զ����ɵķ������
		aeassoDao.optionApply(applyid,op);
	}
	@Override
	public int checkAssoLeaderById(int userid, int assoid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.checkAssoLeaderById(userid,assoid);
	}
	@Override
	public void updateNotice(int assoid, String notice) {
		// TODO �Զ����ɵķ������
		aeassoDao.updateNotice(assoid,notice);
	}
	@Override
	public void modifyViewsById(HashMap<String, Object> map) {
		// TODO �Զ����ɵķ������
		aeassoDao.modifyViewsById(map);
	}
	@Override
	public void deletememberById(int applyid) {
		// TODO �Զ����ɵķ������
		aeassoDao.deletememberById(applyid);
	}
	@Override
	public StudentAndAsso checkmemberById(int applyid) {
		// TODO �Զ����ɵķ������
		return aeassoDao.checkmemberById(applyid);
	}
	@Override
	public void modifyPositionById(int applyid, String assoposition) {
		// TODO �Զ����ɵķ������
		aeassoDao.modifyPositionById(applyid,assoposition);
	}
	@Override
	public void modifySaaLeader(int assoid, int leaderid) {
		// TODO �Զ����ɵķ������
		aeassoDao.modifySaaLeader(assoid,leaderid);
	}
	@Override
	public void modifyAeaLeader(int assoid, int leaderid) {
		// TODO �Զ����ɵķ������
		aeassoDao.modifyAeaLeader(assoid,leaderid);
	}
	@Override
	public void modifyLeaderPosition(int userid, int assoid) {
		// TODO �Զ����ɵķ������
		aeassoDao.modifyLeaderPosition(userid,assoid);
	}

}
