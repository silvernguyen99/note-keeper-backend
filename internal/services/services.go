package services

import (
	"net/http"
	"note-keeper-backend/config"
	"note-keeper-backend/internal/stores"
)

type Service struct {
	cfg       *config.Config
	mainStore *stores.MainStore
}

func New(
	config *config.Config,
	mainStore *stores.MainStore,
) *Service {
	s := &Service{
		cfg:       config,
		mainStore: mainStore,
	}

	return s
}

func (s *Service) Run() {
	http.HandleFunc("/login_using_social_access_token", LoginUsingSocialAccessToken)
	http.HandleFunc("/logout", Logout)
	http.ListenAndServe(":8090", nil)
}
