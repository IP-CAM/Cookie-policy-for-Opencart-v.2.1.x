<?php
class ControllerModulePvnmCookiePolicy extends Controller {
	private $error = array();

    public function index() {
        $this->load->language('module/pvnm_cookie_policy');

        $this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('view/javascript/pvnm/jquery-minicolors/jquery.minicolors.css');
		$this->document->addScript('view/javascript/pvnm/jquery-minicolors/jquery.minicolors.min.js');

		$this->load->model('extension/module');
		$this->load->model('tool/image');
		$this->load->model('localisation/language');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!empty($this->request->post['module'])) {
				foreach ($this->request->post['module'] as $key => $module) {
					if (!isset($module['module_id'])) {
						$this->model_extension_module->addModule('pvnm_cookie_policy', $this->request->post['module'][$key]);
					} else {
						$this->model_extension_module->editModule($module['module_id'], $this->request->post['module'][$key]);
					}
				}
			}

			if (!empty($this->request->post['delete'])) {
				foreach ($this->request->post['delete'] as $delete) {
					$this->model_extension_module->deleteModule($delete);
				}
			}

			$this->session->data['success'] = $this->language->get('text_success');

			if (!isset($this->request->get['module_id']) || empty($this->request->post['module'])) {
				$this->response->redirect($this->url->link('module/pvnm_cookie_policy', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->response->redirect($this->url->link('module/pvnm_cookie_policy', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL'));
			}
		}

		$data['heading_title'] = $this->language->get('heading_title');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['tab_settings'] = $this->language->get('tab_settings');
		$data['tab_help'] = $this->language->get('tab_help');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_documentation'] = $this->language->get('text_documentation');
		$data['text_developer'] = $this->language->get('text_developer');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_tab_module'] = $this->language->get('text_tab_module');
		$data['text_top_left'] = $this->language->get('text_top_left');
		$data['text_top_center'] = $this->language->get('text_top_center');
		$data['text_top_right'] = $this->language->get('text_top_right');
		$data['text_center_left'] = $this->language->get('text_center_left');
		$data['text_center_center'] = $this->language->get('text_center_center');
		$data['text_center_right'] = $this->language->get('text_center_right');
		$data['text_bottom_left'] = $this->language->get('text_bottom_left');
		$data['text_bottom_center'] = $this->language->get('text_bottom_center');
		$data['text_bottom_right'] = $this->language->get('text_bottom_right');
		$data['text_no_repeat'] = $this->language->get('text_no_repeat');
		$data['text_repeat_x'] = $this->language->get('text_repeat_x');
		$data['text_repeat_y'] = $this->language->get('text_repeat_y');
		$data['text_repeat'] = $this->language->get('text_repeat');
		$data['text_notice_top'] = $this->language->get('text_notice_top');
		$data['text_notice_bottom'] = $this->language->get('text_notice_bottom');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_title'] = $this->language->get('entry_title');
		$data['entry_message'] = $this->language->get('entry_message');
		$data['entry_button'] = $this->language->get('entry_button');
		$data['entry_text_color'] = $this->language->get('entry_text_color');
		$data['entry_border_color'] = $this->language->get('entry_border_color');
		$data['entry_background_color'] = $this->language->get('entry_background_color');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_image_position'] = $this->language->get('entry_image_position');
		$data['entry_repeat'] = $this->language->get('entry_repeat');
		$data['entry_notice_position'] = $this->language->get('entry_notice_position');
		$data['entry_status'] = $this->language->get('entry_status');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
   		);

   		$data['breadcrumbs'][] = array(
       		'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
   		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/pvnm_cookie_policy', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/pvnm_cookie_policy', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/pvnm_cookie_policy', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/pvnm_cookie_policy', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id'])) {
			$data['module_id'] = $this->request->get['module_id'];
		}

		$data['modules'] = array();

		$modules = $this->model_extension_module->getModulesByCode('pvnm_cookie_policy');

		if (!empty($modules)) {
			foreach ($modules as $module) {
				$setting = json_decode($module['setting'], true);

				$data['modules'][] = array(
					'module_id' 	=> $module['module_id'],
					'name' 			=> $module['name'],
					'setting' 		=> $setting
				);

				$setting = '';
			}
		}

		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['token'] = $this->session->data['token'];
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		$data['module_row'] = 1;

		if (count($modules) + 1 > $data['module_row']) {
			$data['module_row'] = count($modules) + 1;
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/pvnm_cookie_policy.tpl', $data));
    }

	protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/pvnm_cookie_policy')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

		return !$this->error;
    }
}
