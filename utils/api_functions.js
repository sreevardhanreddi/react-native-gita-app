import {axiosInst} from './axios_utils';

export const getChapters = async () => {
  try {
    const data = await axiosInst('chapters');
    console.log('------------------- chapters -------------------');
    console.log(data.data);
    return data.data;
  } catch (error) {
    throw error;
  }
};

export const getVersesInChapter = async chapterNumber => {
  try {
    const data = await axiosInst(`chapters/${chapterNumber}/verses`);
    console.log(
      `------------- verses in chapter ${chapterNumber} -------------`,
    );
    console.log(data.data);
    return data.data;
  } catch (error) {
    throw error;
  }
};
