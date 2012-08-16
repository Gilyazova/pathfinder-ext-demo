# encoding: utf-8
require 'spec_helper'

describe "identity_cards/index.xml.erb" do
  before do

    @sex_id = 1
    @moscow_place_code = '770000000000'
    person = FactoryGirl.create(:person)
    rp = FactoryGirl.create(:russian_passport, :person => person, sex_id: @sex_id, birth_place_code: @moscow_place_code)
    @type_id = 1
    @number = '1111'
    @serie = '222222'
    @issue_date = DateTime.new(2001, 5, 11)
    @issuer = 'Организация выдающая паспорта РФ'
    @issuer_code = '123456'
    @reason_id = 2
    @state_id = 1

    rp.identity_card.number = @number
    rp.identity_card.serie = @serie
    rp.identity_card.issue_date = @issue_date
    rp.identity_card.issuer = @issuer
    rp.identity_card.issuer_code = @issuer_code
    rp.identity_card.issue_place_code = @moscow_place_code
    rp.identity_card.reason_id = @reason_id
    rp.identity_card.state_id = @state_id
    rp.identity_card.type_id = @type_id


    rp.identity_card.save
    @identity_cards = PaginableArray.new(person.identity_cards)
    @xml = Nokogiri::XML.parse(render)
  end

  it 'should be rendered' do
    lambda { render }.should_not raise_error

    @xml.xpath('//identity_cards/russian_passport/type/code').text.should == @type_id.to_s

    @xml.xpath('//identity_cards/russian_passport/number').text.should == @number
    @xml.xpath('//identity_cards/russian_passport/serie').text.should == @serie

    @xml.xpath('//identity_cards/russian_passport/issue_date').text.should == @issue_date.strftime("%Y-%m-%d")
    @xml.xpath('//identity_cards/russian_passport/issuer').text.should == @issuer
    @xml.xpath('//identity_cards/russian_passport/issuer_code').text.should == @issuer_code

    @xml.xpath('//identity_cards/russian_passport/region/code').text.should == @moscow_place_code

    @xml.xpath('//identity_cards/russian_passport/reason/code').text.should == @reason_id.to_s
    @xml.xpath('//identity_cards/russian_passport/state/code').text.should == @state_id.to_s


    @xml.xpath('//identity_cards/russian_passport/sex/code').text.should == @sex_id.to_s
    @xml.xpath('//identity_cards/russian_passport/birth_place/code').text.should == @moscow_place_code



  end
end
