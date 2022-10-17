package bit.data.service;

import bit.data.dao.ComFeedCmtDaoInter;
import bit.data.dto.ComFeedCmtDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComFeedCmtService implements ComFeedCmtServiceInter{
    @Autowired
    ComFeedCmtDaoInter cmtDaoInter;

    @Override
    public void insertFeedCmt(ComFeedCmtDto dto) {
        cmtDaoInter.insertFeedCmt(dto);
    }

    @Override
    public List<ComFeedCmtDto> selectFeedCmt(int fd_id){
        return cmtDaoInter.selectFeedCmt(fd_id);
    }
}
