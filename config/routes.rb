GrayLadyApp::Application.routes.draw do
  root to: "scraper#index"
  get "scraper/index"
  get "scraper/links"
  get "scraper/pictures"
end
