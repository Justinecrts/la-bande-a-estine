class CartheadbandsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
end
