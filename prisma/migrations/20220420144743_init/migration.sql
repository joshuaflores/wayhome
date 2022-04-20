-- CreateTable
CREATE TABLE "User" (
    "id" text NOT NULL,
    "email" text NOT NULL,
    "createdAt" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp(3) NOT NULL,
    "password" text NOT NULL,
    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ListingSource" (
    "id" text NOT NULL,
    "source" text NOT NULL,
    "data" jsonb,
    "dateLastCheked" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "listingId" text NOT NULL,
    CONSTRAINT "ListingSource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Listing" (
    "id" text NOT NULL,
    "address" text NOT NULL,
    "status" text,
    "mlsNumber" text,
    "sources" jsonb,
    "details" jsonb,
    "detailsPatch" jsonb,
    "syndicates" jsonb,
    "createdAt" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp(3) NOT NULL,
    CONSTRAINT "Listing_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User" ("email");

-- CreateIndex
CREATE UNIQUE INDEX "ListingSource_source_key" ON "ListingSource" ("source");

-- CreateIndex
CREATE UNIQUE INDEX "Listing_mlsNumber_key" ON "Listing" ("mlsNumber");

-- AddForeignKey
ALTER TABLE "ListingSource"
    ADD CONSTRAINT "ListingSource_listingId_fkey" FOREIGN KEY ("listingId") REFERENCES "Listing" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

