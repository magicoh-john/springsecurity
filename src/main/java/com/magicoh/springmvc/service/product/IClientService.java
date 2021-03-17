package com.magicoh.springmvc.service.product;


import java.util.List;

import com.magicoh.springmvc.dto.Category;
import com.magicoh.springmvc.dto.Client;

public interface IClientService
{
	public List<Client> getClientList();
	public List<Client> getClientsByName(String client_name);
	public Client getClient(int client_id);
//	public void insertCategory(Category category);
//	public void updateCategory(Category category);
//	public void deleteCategory(int category_id);
}
