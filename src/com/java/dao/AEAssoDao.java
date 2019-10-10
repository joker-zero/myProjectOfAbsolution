package com.java.dao;

import java.util.HashMap;
import java.util.List;

import com.java.entity.AEAssociation;
import com.java.entity.ImageBean;
import com.java.entity.StudentAndAsso;


public interface AEAssoDao {
	public AEAssociation addApplication(AEAssociation aea);

	public List<AEAssociation> checkEstablish(AEAssociation aea);

	int selectCount(int userid);
    /**
     * 分页操作，调用findByPage limit分页方法
     * @param map
     * @return
     */
    List<AEAssociation> findByPage(HashMap<String,Object> map);

	public int selectAllCount();

	public List<AEAssociation> findAllByPage(HashMap<String, Object> map);

	public AEAssociation listDetailsById(int assoid);

	public ImageBean listView(String assoid);

	public void applyJoinAsso(StudentAndAsso saa);

	public int selectJoinCount(int userid);

	public List<StudentAndAsso> findJoinByPage(HashMap<String, Object> map);

	public AEAssociation findJoinById(int assoid);

	public StudentAndAsso checkIsApply(int userid, int assoid);

	public int selectAcceptCount(int userid);

	public List<StudentAndAsso> findAcceptByPage(HashMap<String, Object> map);

	public int selectMyAssoCount(int userid);

	public StudentAndAsso findMyAssoByPage(HashMap<String, Object> map);

	public int selectMemberCount(int assoId);

	public List<StudentAndAsso> findAllUserByPage(HashMap<String, Object> userMap);

	public AEAssociation checkAsso(int assoid);

	public void revokeCreateAsso(int assoid);

	public StudentAndAsso checkJoinId(int applyid);

	public void revokeJoinAsso(int applyid);

	public StudentAndAsso checkJoinById(int assoid, int userid);

	public void optionApply(int applyid, String op);

	public int checkAssoLeaderById(int userid, int assoid);

	public void updateNotice(int assoid, String notice);

	public void modifyViewsById(HashMap<String, Object> map);

	public void deletememberById(int applyid);

	public StudentAndAsso checkmemberById(int applyid);

	public void modifyPositionById(int applyid, String assoposition);

	public void modifySaaLeader(int assoid, int leaderid);

	public void modifyAeaLeader(int assoid, int leaderid);

	public void modifyLeaderPosition(int userid, int assoid);

}
