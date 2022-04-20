import { Link } from "@remix-run/react";
import { Stack } from "@chakra-ui/react";

import { useOptionalUser } from "~/utils";

export default function Index() {
  const user = useOptionalUser();
  return (
    <Stack>
      {user ? (
        <Link to="/admin">Ad Manager</Link>
      ) : (
        <div className="space-y-4 sm:mx-auto sm:inline-grid sm:grid-cols-2 sm:gap-5 sm:space-y-0">
          <Link to="/join">Sign up</Link>
          <Link to="/login">Log In</Link>
        </div>
      )}
    </Stack>
  );
}
