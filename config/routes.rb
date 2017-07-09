Rails.application.routes.draw do
  concern :additional do
    get :unapproval, on: :collection
    get :draft, on: :member
  end
  resources :members
  resources :fan_comments
  resources :reviews, concerns: :additional
  resources :authors
  resources :users, concerns: :additional
  resources :books
  get 'hello/index', to: 'hello#index'
  get 'hoge/piyo', to: 'hello#index'
  get 'hello/index'
  get 'hello/view'
  get 'hello/nothing'
  get 'hello/app_var'
  get 'hello/list'
  
  #４章
  get 'view/keyword'
  post 'keyword/search'# TODO: 後で実装？
  get 'view/form_tag'
  post 'view/create' # TODO: 後で実装？
  get 'view/form_for'
  get 'view/field'
  get 'view/html5'
  get 'view/select'
  get 'view/col_select'
  get 'view/group_select'
  get 'view/select_tag'
  get 'view/select_tag2'
  get 'view/col_select2'
  get 'view/group_select2'
  get 'view/dat_select'
  get 'view/col_radio'
  get 'view/fields'
  get 'view/simple_format'
  get 'view/truncate'
  get 'view/excerpt'
  get 'view/highlight'
  get 'view/conc'
  get 'view/sanitize'
  get 'view/format'
  get 'view/number_to'
  get 'view/datetime'
  get 'view/link'
  get 'view/urlfor'
  get 'view/new'
  get 'members/login'
  get 'view/linkif'
  get 'view/current'
  get 'view/detail'
  get 'view/mailto'
  get 'view/image_tag'
  get 'view/audio'
  get 'view/video'
  get 'view/path'
  get 'view/capture'
  get 'view/tag'
  get 'view/content_tag'
  get 'view/helper'
  get 'view/helper2'
  get 'view/helper3'
  get 'view/provide'
  get 'view/multi'
  get 'view/relation'
  get 'view/download'
  get 'view/quest'
  get 'view/nest'
  get 'view/partial_basic'
  get 'view/partial_param'
  get 'view/partial_col'
  get 'view/partial_spacer'
  
  #５章
  get 'record/find'
  get 'record/find_by'
  get 'record/find_by2'
  get 'record/where'
  get 'record/keyword'
  post 'record/ph1'
  get 'record/not(/:id)' => 'record#not'
  get 'record/where_or'
  get 'record/order'
  get 'record/reorder'
  get 'record/select'
  get 'record/select2'
  get 'record/offset'
  get 'record/page(/:id)' => 'record#page'
  get 'record/last'
  get 'record/groupby'
  get 'record/havingby'
  get 'record/where2'
  get 'record/unscope'
  get 'record/unscope2'
  get 'record/none(/:id)' => 'record#none'
  get 'record/pluck'
  get 'record/exists'
  get 'record/scope'
  get 'record/def_scope'
  get 'record/count'
  get 'record/average'
  get 'record/groupby2'
  get 'record/literal_sql'
  get 'record/update_all'
  get 'record/update_all2'
  get 'record/destroy_all'
  get 'record/transact'
  get 'record/enum_rec'
  get 'record/keywd'
  post 'record/keywd_process'
  get 'record/belongs'
  get 'record/hasmany'
  get 'record/hasone'
  get 'record/has_and_belongs'
  get 'record/has_many_through'
  get 'record/cache_counter'
  get 'record/memorize'
  get 'record/assoc_includes'
  
  #第６章
  get 'ctrl/para(/:id)' => 'ctrl#para'
  get 'ctrl/para_array'
  get 'ctrl/req_head'
  get 'ctrl/req_head2'
  get 'ctrl/upload'
  post 'ctrl/upload_process'
  get 'ctrl/updb(/:id)' => 'ctrl#updb'
  patch 'ctrl/updb_process(/:id)' => 'ctrl#updb_process'
  get 'ctrl/show_photo(/:id)' => 'ctrl#show_photo'
  get 'ctrl/log'
  get 'ctrl/get_xml'
  get 'ctrl/get_json'
  get 'ctrl/cookie'
  post 'ctrl/cookie_rec'
  get 'ctrl/session_show'
  post 'ctrl/session_rec'
  get 'ctrl/index'
  get 'ctrl/index2'
  get 'login/index'
  post 'login/auth'
  get 'login/logout'
end
