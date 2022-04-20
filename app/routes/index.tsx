import { Link } from "@remix-run/react";
import { Stack } from "@chakra-ui/react";

import { useOptionalUser } from "~/utils";

export default function Index() {
  const user = useOptionalUser();
  console.log(user);

  return (
    <Stack>
      {user ? (
        <Link to="/admin">Ad Manager</Link>
      ) : (
        <Link to="/login">Log In</Link>
      )}
    </Stack>
  );
}
