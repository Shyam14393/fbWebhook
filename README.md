public function verify_token(Request $request)
{
    $mode  = $request->get('hub_mode');
    $token = $request->get('hub_verify_token');
    $challenge = $request->get('hub_challenge');

    if ($mode === "subscribe" && $this->token and $token === $this->token) {
        return response($challenge,200);
    }
    return response("Invalid token!", 400);
}
