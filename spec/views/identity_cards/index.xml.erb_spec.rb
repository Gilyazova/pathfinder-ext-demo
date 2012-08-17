# encoding: utf-8
require 'spec_helper'

describe "identity_cards/index.xml.erb" do

    context 'russian_passport' do
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

        rp.build_identity_card(person: person,
            number: @number,
            serie: @serie,
            type_id: @type_id,
            issue_date: @issue_date,
            issuer_code: @issuer_code,
            issuer: @issuer,
            issue_place_code: @moscow_place_code,
            reason_id: @reason_id,
            state_id: @state_id
        )

        rp.save
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


    context 'foreign_passport' do
      before do
        
        I18n.locale = :ru
        @sex_id = 1
        @moscow_place_code = '770000000000'
        person = FactoryGirl.create(:person)
        fp = FactoryGirl.create(:foreign_passport, birth_place_code: @moscow_place_code)
        @type_id = 2
        @number = '1111'
        @serie = '222222'
        @issue_date = DateTime.new(2011, 5, 11)
        @issuer = 'Организация выдающая заграничные паспорта'
        @issuer_code = '1234567'
        @reason_id = 1
        @state_id = 1

        @first_name = 'Иван'
        @last_name = 'Иванов'
        @middle_name = 'Иванович'

        @first_name_latin = I18n.transliterate(@first_name)
        @last_name_latin = I18n.transliterate(@last_name)

        fp.build_identity_card(person: person,
            number: @number,
            serie: @serie,
            type_id: @type_id,
            issue_date: @issue_date,
            issuer_code: @issuer_code,
            issuer: @issuer,
            issue_place_code: @moscow_place_code,
            reason_id: @reason_id,
            state_id: @state_id
        )

        fp.first_name = @first_name.clone
        fp.last_name = @last_name
        fp.middle_name = @middle_name

        fp.first_name_latin = @first_name_latin
        fp.last_name_latin = @last_name_latin

        # fp.identity_card.save
        fp.save
        @identity_cards = PaginableArray.new(person.identity_cards)
        @xml = Nokogiri::XML.parse(render)
      end

      it 'should be rendered' do
        lambda { render }.should_not raise_error

        # @xml.xpath('//identity_cards/foreign_passport/first_name').text.should == @first_name
        @xml.xpath('//identity_cards/foreign_passport/last_name').text.should == @last_name
        @xml.xpath('//identity_cards/foreign_passport/middle_name').text.should == @middle_name
        @xml.xpath('//identity_cards/foreign_passport/first_name_latin').text.should == @first_name_latin
        @xml.xpath('//identity_cards/foreign_passport/last_name_latin').text.should == @last_name_latin

        @xml.xpath('//identity_cards/foreign_passport/type/code').text.should == @type_id.to_s

        @xml.xpath('//identity_cards/foreign_passport/number').text.should == @number
        @xml.xpath('//identity_cards/foreign_passport/serie').text.should == @serie

        @xml.xpath('//identity_cards/foreign_passport/issue_date').text.should == @issue_date.strftime("%Y-%m-%d")
        @xml.xpath('//identity_cards/foreign_passport/issuer').text.should == @issuer
        @xml.xpath('//identity_cards/foreign_passport/issuer_code').text.should == @issuer_code

        @xml.xpath('//identity_cards/foreign_passport/region/code').text.should == @moscow_place_code

        @xml.xpath('//identity_cards/foreign_passport/reason/code').text.should == @reason_id.to_s
        @xml.xpath('//identity_cards/foreign_passport/state/code').text.should == @state_id.to_s

        @xml.xpath('//identity_cards/foreign_passport/birth_place/code').text.should == @moscow_place_code
      end
    end


end
