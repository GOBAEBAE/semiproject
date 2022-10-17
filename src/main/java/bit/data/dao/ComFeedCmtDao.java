package bit.data.dao;

import bit.data.dto.ComFeedCmtDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ComFeedCmtDao implements ComFeedCmtDaoInter {

    @Autowired
    SqlSession session;

    String ns = "bit.data.dao.ComFeedCmtDao.";
    @Override
    public void insertFeedCmt(ComFeedCmtDto dto) {
        session.insert(ns+"insertFeedCmt",dto);
    }

    @Override
    public List<ComFeedCmtDto> selectFeedCmt(int fd_id) {
        return session.selectList(ns+"selectFeedCmt",fd_id);
    }
}
