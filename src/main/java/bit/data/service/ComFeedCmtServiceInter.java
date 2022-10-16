package bit.data.service;

import bit.data.dto.ComFeedCmtDto;

import java.util.List;

public interface ComFeedCmtServiceInter {

    public void insertFeedCmt(ComFeedCmtDto dto);
    public List<ComFeedCmtDto> selectFeedCmt(int fd_id);
}
