class AccountGlobalObject < DataObject

#  include Navigation
#  include DateFactory
  include StringFactory


  attr_accessor :description,

  def initialize(browser, opts={})
    @browser = browser

    defaults = {
        cornell_university: 'yes',

        description:          random_alphanums(20, 'AFT'),
        new_chart_code:           'IT - Ithaca Campus', #TODO grab this from config file
        new_number:               '1000710', #TODO get from config
        supervisor_principal_name:  'jaraujo',
        manager_principal_name: 'warriaga',
        org_cd:               'BI',
        sub_fnd_group_code:   '',
        acct_expire_date:     '',
        postal_cd:            '14853',
        city:                 'Ithaca',
        state:                'NY',
        address:              'Cornell University',
        contintuation_coa_code: '',
        contintuation_acct_number: '',
        income_stream_financial_cost_cd:  'IT - Ithaca Campus',
        income_stream_account_number:     '0142900',
        cfda_number:          '',
        higher_ed_funct_cd:   '',
        sufficient_funds_cd:    'C - Consolidation',
        trans_processing_sufficient_funds_code: '',
        labor_benefit_rate_category_code: ''
    }
    set_options(defaults.merge(opts))
  end

  def create
    visit(MainPage).object_code
    on ObjectCodePage do |page|
      #page.description.focus
      #page.alert.ok if page.alert.exists? # Because, y'know, sometimes it doesn't actually come up...
      fill_out page, :description

      #page.add_account_detail
      #createCornellAccountGlobalObject  if cornell_university == 'yes'

      page.save
      @document_id = page.document_id
    end
  end