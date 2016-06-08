<?php
class ControllerModulePvnmCookiePolicy extends Controller {
	public function index($setting) {
		$data['module_id'] = $setting['module_id'];
		$data['heading_title'] = html_entity_decode($setting['title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		$data['message'] = html_entity_decode($setting['message'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		$data['button'] = html_entity_decode($setting['button'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		$data['text_color'] = $setting['text_color'];
		$data['border_color'] = $setting['border_color'];
		$data['background_color'] = $setting['background_color'];
		$data['image'] = DIR_IMAGE . $setting['image'];
		$data['position'] = $setting['position'];
		$data['repeat'] = $setting['repeat'];
		$data['notice_position'] = $setting['notice_position'];

    	if (!isset($this->request->cookie['pvnm_cookie_policy_' . $setting['module_id']])) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/pvnm_cookie_policy.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/pvnm_cookie_policy.tpl', $data);
			} else {
				return $this->load->view('default/template/module/pvnm_cookie_policy.tpl', $data);
			}
		}
	}

    public function add(){
		if (isset($this->request->post['cookie'])) {
			setcookie('pvnm_cookie_policy_' . $this->request->post['cookie'], base64_encode(serialize($_SERVER['REMOTE_ADDR'] . $this->request->post['cookie'])), time() + 60 * 60 * 24 * 999, '/', $this->request->server['HTTP_HOST']);

			$json = array();

			$this->response->setOutput(json_encode($json));
		}
    }
}
