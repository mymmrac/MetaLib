package utils

import (
	googleAuthIDTokenVerifier "github.com/futurenda/google-auth-id-token-verifier"
	"os"
)

var gVerify googleAuthIDTokenVerifier.Verifier
var GoogleClientId string

func InitGoogle() {
	GoogleClientId = os.Getenv("GOOGLE_CLIENT_ID")
	gVerify = googleAuthIDTokenVerifier.Verifier{}
}

func VerifyGoogleID(token string) error {
	return gVerify.VerifyIDToken(token, []string{GoogleClientId})
}

func DecodeGoogleToken(token string) (*googleAuthIDTokenVerifier.ClaimSet, error) {
	return googleAuthIDTokenVerifier.Decode(token)
}
