package org.mine.www.vo;

public class WordBookVO
{
	private int wordbook_num;
	private String wordbook_word;
	private String wordbook_wordcheck;

	public int getWordbook_num()
	{
		return wordbook_num;
	}

	public void setWordbook_num(int wordbook_num)
	{
		this.wordbook_num = wordbook_num;
	}

	public String getWordbook_word()
	{
		return wordbook_word;
	}

	public void setWordbook_word(String wordbook_word)
	{
		this.wordbook_word = wordbook_word;
	}

	public String getWordbook_wordcheck()
	{
		return wordbook_wordcheck;
	}

	public void setWordbook_wordcheck(String wordbook_wordcheck)
	{
		this.wordbook_wordcheck = wordbook_wordcheck;
	}

	@Override
	public String toString()
	{
		return "WordBookVO [wordbook_num=" + wordbook_num + ", wordbook_word=" + wordbook_word + ", wordbook_wordcheck=" + wordbook_wordcheck + "]";
	}
}
