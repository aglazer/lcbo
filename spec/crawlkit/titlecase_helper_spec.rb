# coding: utf-8
require 'spec_helper'

describe LCBO::CrawlKit::TitleCaseHelper do
  @expectations = {
    'PURPLE DRANK'                     => 'Purple Drank',
    'BEST-WINE EVAR!'                  => 'Best-Wine Evar!',
    'MONDAVI TO-KALON FUMÉ BLANC'      => 'Mondavi To-Kalon Fumé Blanc',
    'ÉVE PICARD'                       => 'Éve Picard',
    'R. PHILLIPS NIGHT HARVEST SHIRAZ' => 'R. Phillips Night Harvest Shiraz',
    '02 OPUS ONE NAPA VALLEY C.V.B.G'  => '02 Opus One Napa Valley C.V.B.G.',
    'LONDON XXX'                       => 'London XXX',
    'SOME NICE VQA WINE'               => 'Some Nice VQA Wine',
    'A PRODUCT NAME (WITH STUPID CRAP' => 'A Product Name',
    'A PRODUCT NAME (FROM FRANCE)'     => 'A Product Name',
    '(V) SOME PRODUCT (FROM FRANCE'    => 'Some Product',
    '(V) A PRODUCT ** (FROM FRANCE)'   => 'A Product',
    'SOMEONE\'S PRODUCT'               => 'Someone\'s Product',
    'CUVÉE DE L\'ÉCUSSON BRUT'         => 'Cuvée de L\'Écusson Brut',
    'SECULAR IPA'                      => 'Secular IPA' }

  @expectations.each_pair do |input, expectation|
    it "should convert: #{input.inspect} to: #{expectation.inspect}" do
      LCBO::CrawlKit::TitleCaseHelper[input].must_equal expectation
    end
  end

end
