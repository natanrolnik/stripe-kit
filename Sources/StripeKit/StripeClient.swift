//
//  StripeClient.swift
//  Stripe
//
//  Created by Andrew Edwards on 4/30/19.
//

import NIO
import AsyncHTTPClient

public final class StripeClient {
    // MARK: - CORE RESOURCES
    public var customers: CustomerRoutes
    public var events: EventRoutes
    public var files: FileRoutes
    public var fileLinks: FileLinkRoutes
    public var paymentIntents: PaymentIntentRoutes
    public var setupIntents: SetupIntentsRoutes
    public var setupAttempts: SetupAttemptRoutes
    public var refunds: RefundRoutes
    public var tokens: TokenRoutes
    public var ephemeralKeys: EphemeralKeyRoutes
    
    // MARK: - PAYMENT METHODS
//    public var sources: SourceRoutes
    
    // MARK: - CHECKOUT
    public var sessions: SessionRoutes
    
    // MARK: - PaymentLink
    public var paymentLinks: PaymentLinkRoutes
    
    // MARK: - Products
    public var products: ProductRoutes
    public var prices: PriceRoutes
    public var coupons: CouponRoutes
    public var promotionCodes: PromotionCodesRoutes
    public var discounts: DiscountRoutes
    public var taxCodes: TaxCodeRoutes
    public var taxRates: TaxRateRoutes
    public var shippingRates: ShippingRateRoutes
    
    var handler: StripeAPIHandler
    
    /// Returns a StripeClient used to interact with the Stripe APIs.
    /// - Parameter httpClient: An `HTTPClient`used to communicate wiith the Stripe API
    /// - Parameter apiKey: A Stripe API key.
    public init(httpClient: HTTPClient, apiKey: String) {
        handler = StripeAPIHandler(httpClient: httpClient, apiKey: apiKey)

        customers = StripeCustomerRoutes(apiHandler: handler)
        events = StripeEventRoutes(apiHandler: handler)
        files = StripeFileRoutes(apiHandler: handler)
        fileLinks = StripeFileLinkRoutes(apiHandler: handler)
        paymentIntents = StripePaymentIntentRoutes(apiHandler: handler)
        setupIntents = StripeSetupIntentsRoutes(apiHandler: handler)
        setupAttempts = StripeSetupAttemptRoutes(apiHandler: handler)
        refunds = StripeRefundRoutes(apiHandler: handler)
        tokens = StripeTokenRoutes(apiHandler: handler)
        ephemeralKeys = StripeEphemeralKeyRoutes(apiHandler: handler)

//        sources = StripeSourceRoutes(apiHandler: handler)
        
        sessions = StripeSessionRoutes(apiHandler: handler)
        
        paymentLinks = StripePaymentLinkRoutes(apiHandler: handler)
        
        products = StripeProductRoutes(apiHandler: handler)
        prices = StripePriceRoutes(apiHandler: handler)
        coupons = StripeCouponRoutes(apiHandler: handler)
        promotionCodes = StripePromotionCodesRoutes(apiHandler: handler)
        discounts = StripeDiscountRoutes(apiHandler: handler)
        taxCodes = StripeTaxCodeRoutes(apiHandler: handler)
        taxRates = StripeTaxRateRoutes(apiHandler: handler)
        shippingRates = StripeShippingRateRoutes(apiHandler: handler)
    }
}
