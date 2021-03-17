package com.magicoh.springmvc.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.magicoh.springmvc.dao.IProductMapperDao;
import com.magicoh.springmvc.dto.Category;
import com.magicoh.springmvc.dto.Client;

@Service
public class ClientServiceImpl implements IClientService
{
	@Autowired
	private IProductMapperDao bbsMapper;

	@Override
	public List<Client> getClientList()
	{
		List<Client> bbsList = bbsMapper.selectClientList();
		return bbsList;
	}

	@Override
	public Client getClient(int client_id)
	{
		Client client = bbsMapper.selectClient(client_id);
		return client;
	}

	@Override
	public List<Client> getClientsByName(String client_name) {
		List<Client> clientList = bbsMapper.selectClientsByName(client_name);
		return clientList;
	}	

	
	
}
