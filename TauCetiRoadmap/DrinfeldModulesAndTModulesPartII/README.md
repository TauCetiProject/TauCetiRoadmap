# Roadmap: drinfeld modules, t-motives and characteristic-p special values, part II

**Summary.** Develop the multiple-depth extension of the Carlitz special-value theory over every polynomial ring A = 𝔽_q[θ], with q a prime power. The build passes from power sums and Carlitz multiple polylogarithms through product relations, Brown generation and Frobenius difference systems to Thakur’s basis theorem, Todd’s dimension formula, the Hoffman-like basis for alternating values, and the complete description of linear relations. It includes the Carlitz and Frobenius foundations, Ngo Dac’s independent small-weight theorems, direct alternating small-weight bounds, and the construction and dimension bound for finite-place values.

## Scope and ownership

This Part II develops the multiple-depth extension of depth-one Carlitz special values. Its foundation targets in §0.0 construct the Carlitz products, analytic field, exponential, logarithm, period, Ω, effective dual t-motives and Frobenius interfaces used by Layers 0–5. The power-sum degree theorem belongs to §0.2, the generating-series identity to §3.2, and finite-place specialisation to §5.14. The multiple-depth targets include both the direct MZV route and the CMPL route to the basis theorem. These constructions constitute the Carlitz special-value foundation needed for this extension; the elliptic-sheaf carrier and its comparison with one-leg shtukas belong to GlobalShtukasAndFunctionFieldLanglands §2.7.

Mathlib’s `Composition`, `Composition.blocks`, `Composition.length`, `Composition.blocksFun`, `composition_card`, `Polynomial`, `Polynomial.Monic`, `RatFunc`, `RatFunc.inftyValuation`, `RatFunc.CompletionAtInfty`, `Finsupp`, `Submodule.span`, `Nat.choose` and `FiniteField.sum_pow_units` already supply the generic composition, coefficient, valuation and linear-algebra objects. They are consumed without a second carrier or a second proof of their basic APIs. The positive-index operations below extend `Composition`; their weight is its parameter and their depth is its length. The free index space is a native finitely supported function space.

Tau Ceti’s `TauCeti.RingTheory.PowerSeries.TateAlgebra` supplies the normed restricted-series structure at radius one. RestrictedPowerSeries §§0.1–0.3, 1.1–1.2, 2.1 and 7.2 supply the general restricted and entire-series interfaces. The ring E here is the arithmetic subring of those entire series with algebraic coefficients contained in one finite extension of K∞; its arithmetic conditions and Frobenius statements are constructed in §0.0, using that general entire-series theory.

PeriodsAndSpecialValues §PS.9.1–§PS.9.4 owns classical real MZVs, their word encodings and their products. Its §PS.9.2 is also the owner of the generic positive-index harmonic (stuffle) product. Its ordered merges with multiplicity are consumed here; §1.3 constructs their integral form and coefficient extension to characteristic p, extending the rational presentation without a second ordered-merge construction. Layer 1 extends coefficients integrally and adds the q-shuffle correction and the two function-field realisations. Their analytic carriers and admissibility condition differ from the function-field series here; no real-period theorem is a prerequisite. FunctionFieldArithmetic Layers 0–5 and GlobalShtukasAndFunctionFieldLanglands Layers 0–3 own global fields, curve arithmetic and shtukas. The present objects are special-value series for A = 𝔽_q[θ], with degree characters and the Carlitz denominators, not the divisor zeta function or automorphic L-functions. Gamma values with CM periods and Anderson class formulas are depth-one topics outside these layers; no target here uses them.

PadicDifferentialEquationsAndRigidCohomology §RD.0.33 owns algebraic closedness of the completed algebraic closure in every characteristic; ReductiveGroupsPartII §RG2.3.7 owns Lang’s theorem. Section 0.0 uses these general theorems on the Carlitz coefficient field and on GL_ℓ, respectively.

## Conventions

Let F be any finite field, q = |F| = pᵉ ≥ 2, A = F[θ] and K = F(θ), with θ transcendental. No assertion specializes q to p. All index entries are positive integers; the empty index has weight and depth zero. Fixed-weight indices use `Composition w`; arbitrary indices are their disjoint union. Characters lie in Fˣ and are raised to degrees. Sums at negative degrees are zero for nonempty indices, while the truncated empty sum is one for every integer cutoff.

Use v∞(θ) = −1 and |θ|∞ = q. The completion is `RatFunc.CompletionAtInfty F`; its native declaration retains an explicit `DecidableEq (RatFunc F)` binder. This choice of equality changes no mathematical hypothesis. C∞ is the completed algebraic closure constructed in §0.0; K̄ is the algebraic closure of K inside it. The coefficient field F and its native polynomial and completion constructions use an arbitrary Lean universe; a common overfield E may use an independent universe. The natural-number and finite composition index types are small.

Put ℓ₀ = D₀ = 1, ℓ_d = ∏ᵢ₌₁^d(θ − θ^(qⁱ)), [i] = θ^(qⁱ) − θ, and D_d = ∏ᵢ₌₁^d[i]^(qᵈ⁻ⁱ). Thus ℓ₁ = −D₁. Fix ρ with ρᑫ⁻¹ = −θ, put Ω(t) = ρ⁻ᑫ∏_(i≥1)(1 − t/θ^(qⁱ)), and π̃ = Ω(θ)⁻¹. Then Ω⁽⁻¹⁾ = (t − θ)Ω. The twist raises coefficients to qⁿ-th powers and fixes t; a negative twist uses the unique inverse Frobenius on K̄. Multiplying the chosen period by ξ ∈ Fˣ does not change its (q−1)-st power.

The symbols deg and degθ use −∞ at zero; the natural degree is used only for monic, hence nonzero, polynomial summands. Bounds containing q−1 use q ≥ 2. The coefficients H_n and Γ_n are indexed only at n ≥ 1. Collapse T_i uses i ≥ 1; zero padding in prefix comparisons is not an extra zero part. In `thakurIndices`, the default last entry at the empty list is zero, so it is admitted exactly in weight zero when q ≥ 2. All reciprocal polynomial factors are nonzero because θ is transcendental and every monic polynomial is nonzero. The period and Carlitz products are nonzero by §0.0. (CCM23 §2.1–§2.2, CCM23 line 277; CHANG14 §5.1, CHANG14 line 633; AT09 §2.2, AT09 line 147.)

A matrix acts on a column from the left, and a trivialisation satisfies Ψ⁽⁻¹⁾ = ΦΨ (IKLNDP24 §2.2.1, IKLNDP24 line 3500). For Anderson–Thakur polynomials use H_n where Anderson–Thakur and Chang write Hₙ₋₁; Γ_n is the Carlitz factorial of n−1. A general effective dual t-motive here means a finite free K̄[t]-module with an injective inverse-Frobenius semilinear action whose cokernel is killed by a power of t−θ; finite generation over K̄[σ] is not imposed.

**Checks.**

- In K = F_q(θ), the element θ has no q-th root: its valuation is −1, whereas a q-th power has valuation divisible by q. The inverse twist of t+θ is t+θ^(1/q) in K̄[t], with valuation −1/q on the new coefficient. This fixes the inverse-twist domain and excludes treating K as perfect.
- At q = 3, ℓ₁ = θ−θ³ and D₁ = θ³−θ, so ℓ₁ + D₁ = 0 and ℓ₁ − D₁ = 2ℓ₁ ≠ 0. Reversing this sign changes the fundamental relation.
- The two-term series a + bt has forward twist aᑫ + bᑫt, whereas its q-th power is aᑫ + bᑫtᑫ. In particular t twists to t and its q-th power is tᑫ. This fixes which variable is held constant in every layer.
- At q = 3, Ω⁽¹⁾(θ) = −π̃⁻¹/D₁, and ζ_A(2)/π̃² = −1/D₁. Also v∞(π̃) = −3/2; replacing the period by a scalar in K∞ cannot preserve this value.
- In depth one, Φ = ((t−θ,0),(Q⁽⁻¹⁾(t−θ),1)) and ψ = (Ω,𝔏(1;Q))ᵀ. Its second row is Q⁽⁻¹⁾(t−θ)Ω + 𝔏(1;Q), fixing the lower-triangular convention and its essential factor t−θ.
- At q = 4, the entry 2 is q-indivisible although p = 2 divides it. At q = 1 there is no finite field and the denominator q−1 is not licensed. The zero ring is excluded by `Field`.

## Exact supplier contracts

### From Mathlib

- `Composition` in `Mathlib/Combinatorics/Enumerative/Composition.lean`: positive block lists with prescribed sum, `Composition.length`, `Composition.blocksFun`, their positivity and sum laws, `Composition.sizeUpTo`, and `composition_card`. Its empty composition is present at weight zero; no real-MZV admissibility condition is included.
- `Polynomial` in `Mathlib/Algebra/Polynomial/Basic.lean`, `Polynomial.Monic` in `Mathlib/Algebra/Polynomial/Degree/Defs.lean`, and `RatFunc` in `Mathlib/FieldTheory/RatFunc/Defs.lean`: A, K and the polynomial coefficient maps. Monicity means leading coefficient one and excludes zero over a field.
- `RatFunc.inftyValuation`, `RatFunc.inftyValuation.polynomial`, `RatFunc.inftyValuation.X`, `RatFunc.inftyValuation.X_inv` and `RatFunc.CompletionAtInfty` in `Mathlib/FieldTheory/RatFunc/Valuation.lean`: the multiplicative integer-valued infinity valuation and its completion. Passing to |·|∞ = q to the degree is a normalization; the native value group is not the real numbers. The completion derives `Field` and `Algebra (RatFunc F)`.
- `Submodule.span` in `Mathlib/LinearAlgebra/Span/Defs.lean`, `Finsupp` in `Mathlib/Data/Finsupp/Defs.lean`, `Finsupp.single` in `Mathlib/Data/Finsupp/Single.lean`, `LinearIndependent`, `Module.finrank`, `HasSum` and `tsum`: finite support, spans, dimensions and convergence on the native carriers. `Finsupp.single a b` sends a to b and every other index to 0; for b = 0 its support is empty.
- `Submodule.mul` and `Submodule.mul_le` in `Mathlib/Algebra/Algebra/Operations.lean`: the product M·N of two submodules of an algebra is the span of the products mn, and M·N ≤ P exactly when every such product lies in P. For M = N = K·1 inside K∞ the product is K·1 again.
- `iSupIndep` in `Mathlib/Order/SupIndep.lean`: a family of submodules is independent when each meets the supremum of the others only in zero. Over K̄, the lines spanned by 1 and by a nonzero x are independent exactly when x ∉ K̄; for x = −1/D₁ they coincide.
- `FiniteField.card'` in `Mathlib/FieldTheory/Finite/Basic.lean` identifies the cardinality of a finite field as a positive power of a prime. At F₄ it gives 4 = 2², matching the q-versus-p Check.
- `Nat.choose` in `Mathlib/Data/Nat/Choose/Basic.lean` and `FiniteField.sum_pow_units` in `Mathlib/FieldTheory/Finite/Basic.lean`: binomial coefficients and the sum of natural powers over Fˣ. Negative powers are transferred by the inversion bijection. At q = 3, the sums of first and second powers of units are 0 and 2 = −1; the exponent-zero sum is also −1.

- `FiniteField.frobeniusAlgHom` in `Mathlib/FieldTheory/Finite/Basic.lean` and `Polynomial.mapRingHom` and `Polynomial.comp` in `Mathlib/Algebra/Polynomial/Eval/Defs.lean` give the forward coefficient twist on K̄[t] used in the forward-twisted form of §4.6 and the θ-substitution used in §4.1. The first map acts by x ↦ xᑫ on an F-algebra, and its polynomial coefficient map fixes t. On t + θ it gives t + θᑫ.

- `spectralNorm.normedField`, `spectralNorm.normedAlgebra`, `spectralNorm_extends` and `spectralNorm_unique` in `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean`: the multiplicative extension of the norm to an algebraic field extension of a complete nontrivially normed nonarchimedean field. Apply them to the algebraic closure before its completion. The norm on K∞ used here is normalised by |θ|∞ = q; its multiplicative native integer-valued valuation and this real norm have the same topology.

### From Tau Ceti

`TauCeti.PowerSeries.norm_eq_gaussNorm`, `TauCeti.PowerSeries.norm_coeff_mul_pow_le`, `TauCeti.PowerSeries.norm_C` and `TauCeti.PowerSeries.norm_X`, in `TauCeti/RingTheory/PowerSeries/TateAlgebra.lean`, give the radius-one Gauss norm on `PowerSeries.IsRestricted.subring`. For every ultrametric normed ring R and radius c > 0, the first three statements apply; the variable-norm formula also assumes `NormOneClass R`. The restricted subring is complete when R is complete. At radius one over C∞, ‖1 + at‖ is max(1,|a|); at a = 0 it is one. These facts do not supply an arithmetic coefficient twist or the finite-extension condition defining E.

### From TauCetiRoadmap.RestrictedPowerSeries

Sections 0.1–0.3 and 1.1–1.2 supply native restricted-series coefficient and Gauss structures; §2.1 supplies evaluation where the radius condition permits it; §7.2 supplies entire series at every positive radius, their evaluation and their maps to restricted series. The polynomial t has value θ at θ, even though |θ|∞ = q > 1 and a radius-one restricted series alone need not be evaluable there. Every use of evaluation at θ or θ^(qʲ) in Layer 3 therefore consumes entire-ness, not only membership of the Tate algebra. The arithmetic specialisation and twist formulas are the targets of §0.0.

### From TauCetiRoadmap.PeriodsAndSpecialValues

Section PS.9.2 supplies ordered merges of positive-index words with their integer multiplicities, multilinear concatenation, and the rational harmonic product on the free word module; PS.9.1 fixes the positive-index and empty-word conventions. Section 1.3 extends these same multiplicities to arbitrary commutative coefficient rings; there is no ring map from ℚ to a field of characteristic p. Its recursion is ∅ ∗ P = P and (a,s) ∗ (b,t) = [a,s ∗ (b,t)] + [b,(a,s) ∗ t] + [a+b,s ∗ t]. At [1] ∗ [1], the integer coefficient of [1,1] is 2; it becomes zero in characteristic two and stays 2 in characteristic three. No analytic real-MZV theorem is required.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

Section RD.0.33 supplies the completed algebraic closure of a complete nontrivially valued nonarchimedean field, and its algebraic closedness in every characteristic. Use it for K∞. The construction retains the unique extension of the absolute value; the resulting field is perfect. At q = 3 its element θ^(1/3) has valuation −1/3. Mathlib’s `IsAlgClosed.of_denseRange` in `Mathlib/Analysis/Normed/Field/Dense.lean` assumes characteristic zero, so it does not discharge this instance.

### From TauCetiRoadmap.ReductiveGroupsPartII

Section RG2.3.7, Lang’s theorem, supplies surjectivity of g ↦ g⁻¹F(g) for a smooth geometrically connected finite-type group over F_q. In §0.0 use GL_ℓ: after base change of the Lang morphism to the algebraically closed coefficient field K̄, this solves the matrix equation U⁽⁻¹⁾b₀U⁻¹ = I for b₀ ∈ GL_ℓ(K̄). The extension from F̄_q-points follows because the Lang morphism is of finite type, its image contains all closed points, and surjectivity is stable under algebraically closed field extension. In rank one write u = v^q; the equation becomes v^(q−1) = b₀. For b₀ = 1, v = u = 1 works. For b₀ = −θ, take v = ρ and u = ρ^q: u^(1/q)b₀/u = ρ(−θ)/ρ^q = 1. Connectedness is essential: the Lang map on the constant group of order two is 1 and misses its other element.

## How to read the build

Layer 0 first constructs the Carlitz and Frobenius foundations in §0.0, then fixes positive indices, degree characters, both power-sum realisations and their value spaces. Layer 1 develops products on the shared index space. Layer 2 derives finite, homogeneous relation reductions and the generation theorems. Layer 3 builds the analytic deformations and translates relations into Frobenius equations. Layer 4 determines the solution spaces. Layer 5 combines spanning and independence into bases, dimensions and relation kernels. The direct small-weight proof and the two full-basis proofs use the same earlier constructions; each target’s needs distinguish statement data from its indicated proof route.

## Layer 0: indices, power sums and multiple-depth values

The constructions use arbitrary finite F and every positive index. In particular the leading entry one is permitted, and both ordinary and alternating series use the completion at infinity.

### 0.0 Carlitz and Frobenius foundations

#### Carlitz products and the analytic field

Define ℓ_d and D_d by the finite products in the conventions, for d ≥ 0. The simple acceptance definition `carlitzDenominator` is ℓ_d in K. Specialise the completed-algebraic-closure construction of PadicDifferentialEquationsAndRigidCohomology §RD.0.33 to K∞, writing the result C∞, with compatible isometric embeddings K → K∞ → C∞ and K → K̄ → C∞; K̄ is the algebraic closure of K inside C∞. Equip it with the unique extended absolute value and use PadicDifferentialEquationsAndRigidCohomology §RD.0.33 to make it an algebraically closed complete field (PAP08 §1.1.1 and §2.1, PAP08 line 25; ABP04 §2.1, ABP04 line 275). This is a valued-field construction; it imposes no geometric moduli condition.

The interface includes the following facts.

- ℓ₀ = D₀ = 1, ℓ_(d+1) = ℓ_d(θ − θ^(q^(d+1))) and D_(d+1) = (θ^(q^(d+1)) − θ)D_d^q.
- Every ℓ_d and D_d is nonzero; |ℓ_d|∞ = q^(q(q^d−1)/(q−1)) and |D_d|∞ = q^(dq^d).
- The embeddings preserve the chosen valuation and field operations; C∞ is complete and algebraically closed, and the induced embedding of K̄ identifies it with the elements algebraic over K.

**Checks.**

- At d = 0 the two products and their norms are 1; a product indexed from zero would contain θ−θ and wrongly vanish.
- At q = 3, ℓ₁ = θ−θ³, D₁ = θ³−θ, and both norms are 27. At d = 2 the norm exponents are 12 and 18, respectively; interchanging ℓ and D fails here.
- θ has valuation −1 in all three embedded fields. Its q-th root has valuation −1/q in C∞ and is outside K∞, whose nonzero valuations are integral. Thus C∞ cannot be replaced by K∞.

*Needs:* Mathlib `RatFunc.CompletionAtInfty`, `AlgebraicClosure`, `UniformSpace.Completion`; PadicDifferentialEquationsAndRigidCohomology §RD.0.33; RestrictedPowerSeries §§0.1–0.3 and 1.1 for the subsequent series constructions. Product formulas: AT09 §1.1, AT09 line 84.

#### Carlitz exponential and logarithm

Define e_C : C∞ → C∞ by e_C(z) = Σ_(d≥0) z^(q^d)/D_d and log_C on |z|∞ < q^(q/(q−1)) by log_C(z) = Σ_(d≥0) z^(q^d)/ℓ_d. Prove convergence of the first series everywhere and of the second exactly on that open disc, F_q-linearity, e_C(θz) = θe_C(z)+e_C(z)^q, and e_C(log_C(z)) = z on the logarithm disc. Construct a nonzero period π̃ generating its kernel as an A-module, and prove e_C(z) = z∏_(0≠a∈A)(1−z/(aπ̃)), with convergence uniformly on bounded discs (PAP08 §§1.2.1–1.2.2 and 3.3.4, PAP08 lines 119 and 572; AT90 §§2.1–2.2 and 2.5, AT90 line 378).

The interface includes the following facts.

- Both maps are additive and F_q-linear on their domains, have derivative one at zero, and e_C(z) = z+z^q/D₁+ higher terms.
- The logarithm disc is stable under addition and multiplication by F_q; the inverse identity has the specified source disc and target C∞.
- The exponential kernel is exactly π̃A, and changing the generator by a unit of A leaves this lattice and the product unchanged.

**Checks.**

- At z = 0 both series give 0 and the inverse identity gives 0 = 0; the zero map fails the coefficient of z, which is 1.
- The first two exponential terms are z+z^q/D₁. Their coefficients in e_C(θz) and θe_C(z)+e_C(z)^q at z^q agree because θ^q/D₁ = θ/D₁+1.
- The logarithm term has norm q^(q/(q−1)) times (|z|∞/q^(q/(q−1)))^(q^d). At the boundary this is the nonzero constant q^(q/(q−1)), so the open disc cannot be closed.
- At q = 3 the unit −1 changes π̃ to −π̃, and (−π̃)A = π̃A. A proposed generator θπ̃ spans θπ̃A, which omits π̃ and is rejected by the kernel equality.

*Needs:* §0.0 (Carlitz products and the analytic field); RestrictedPowerSeries §§2.1 and 7.2.

#### Arithmetic series and twist

Use the supplied entire-series ring on C∞ and its radius-one restricted subring T. Define E as the subring of entire series whose coefficients lie in K̄ and together generate a finite extension of K∞. Define the coefficient twist f ↦ f⁽ⁿ⁾ for n ∈ ℤ by raising coefficients to qⁿ-th powers and fixing t. Construct the induced automorphisms of T, E, their fraction fields and K̄(t) (PAP08 §§2.2.3–2.2.5, PAP08 lines 281 and 325; ABP04 §§2.2–2.3, ABP04 line 297).

The interface includes the following facts.

- Twists preserve addition and multiplication, compose by addition of their integer exponents, and have inverse the negative twist; their Gauss norms satisfy ‖f⁽ⁿ⁾‖ = ‖f‖^(qⁿ).
- E is closed under the ring operations and twists; evaluation of its elements at every point of C∞ agrees with evaluation in the supplied entire-series ring.
- For σ the inverse twist, T^σ = E^σ = F_q[t] and Frac(T)^σ = K̄(t)^σ = F_q(t) (PAP08 §2.2.5 and Lemma 3.3.2, PAP08 lines 346 and 564).

**Checks.**

- For a+bt, the forward twist is a^q+b^qt; its q-th power instead has second term b^qt^q. At f = t, these give t and t^q.
- The polynomial t+θ lies in E; its inverse twist is t+θ^(1/q), outside K[t]. Restricting inverse Frobenius to K would fail.
- A σ-fixed restricted series has coefficients in F_q of norm 0 or 1. The coefficients tend to zero, so only finitely many are nonzero; Σ_(n≥0)t^n is fixed formally but is outside T. The fixed rational function 1/t lies in Frac(T) and not T.

*Needs:* §0.0 (analytic field); RestrictedPowerSeries §§0.1–0.3, 1.1–1.2, 2.1 and 7.2; Tau Ceti radius-one Gauss norm contract.

#### Omega and period

For each ρ ∈ K̄ with ρ^(q−1) = −θ, construct Ω(t) = ρ^(−q)∏_(i≥1)(1−t/θ^(q^i)) and identify π̃ = Ω(θ)⁻¹ with a generator of the exponential kernel. Prove that Ω belongs to E and is a unit of T; its zeros are precisely θ^(q^i), i ≥ 1, all simple (PAP08 §3.3.4, PAP08 line 572; ABP04 §3.1.2, ABP04 line 372).

The interface includes the following facts.

- Ω⁽⁻¹⁾ = (t−θ)Ω and Ω⁽ᵈ⁾(θ) = π̃⁻¹/ℓ_d for d ≥ 0.
- v∞(π̃) = −q/(q−1), π̃ ∈ ρK∞ˣ, and π̃^(q−1) lies in K∞.
- Replacing ρ by ξρ, ξ ∈ F_qˣ, multiplies π̃ by ξ and leaves π̃^(q−1) unchanged; evaluation Ω(θ) is nonzero.

**Checks.**

- The inverse twist of the constant factor is ρ⁻¹; the new i = 0 factor is 1−t/θ. Relative to Ω the factor is ρ^(q−1)(1−t/θ) = t−θ, fixing its sign.
- At q = 3, Ω⁽¹⁾(θ) = −π̃⁻¹/D₁ and v∞(π̃) = −3/2; replacing ℓ₁ by D₁ changes the sign of this value.
- Ω(θ) ≠ 0, whereas Ω(θ^q) = 0 of order one. A constant nonzero series cannot satisfy these two evaluations.

*Needs:* §0.0 (Carlitz exponential and logarithm; arithmetic series and twist); RestrictedPowerSeries §7.2.

#### Effective dual t-motives

Define an effective dual t-motive as a finite free K̄[t]-module with an injective inverse-Frobenius semilinear operator σ and cokernel killed by (t−θ)^N for some N ≥ 0. Morphisms are K̄[t]-linear maps commuting with σ. Construct its matrix presentation on a chosen basis: σ(m) = Φm, and a change m′ = Bm gives Φ′ = B⁽⁻¹⁾ΦB⁻¹. A rigid analytic trivialisation is Ψ ∈ GL_r(T) with Ψ⁽⁻¹⁾ = ΦΨ (IKLNDP24 Definition 2.1 and §2.2.1, IKLNDP24 line 3454; CPY19 §2.2, CPY19 line 224).

The interface includes the following facts.

- The module, semilinear operator, equivariant morphisms, identities and composition form a category; the trivial rank-one object has Φ = (1).
- A finite free matrix presentation defines such an object exactly when its cokernel is killed by a power of t−θ and its determinant is nonzero, equivalently det Φ = c(t−θ)^m with c ∈ K̄ˣ and m ≥ 0.
- Basis changes and trivialisation changes respect the displayed equations; direct sums and tensor products preserve the defining conditions.

**Checks.**

- Rank zero has determinant 1 and cokernel 0. The rank-one matrices (1) and (t−θ) are allowed, while (0) fails injectivity and (t) has cokernel supported at the wrong point.
- The rank-one trivial object is allowed although its K̄[σ]-span of one basis vector does not generate all its t-powers; finite generation over K̄[σ] is not part of this definition.
- In rank one a constant basis change B = (b) gives Φ′ = b^(1/q)Φ/b and Ψ′ = bΨ when m′ = bm. Both sides of the new trivialisation equation are b^(1/q)ΦΨ. Omitting inverse twist in the basis change gives the wrong constant.

*Needs:* §0.0 (arithmetic series and twist); Mathlib finite free modules and matrices.

#### Anderson t-modules and logarithmic subspaces

For every field L extending K and integer d ≥ 0, define an Anderson t-module on G_a^d by an F_q-algebra homomorphism ϕ : F_q[t] → Mat_d(L[τ]), with τc = c^qτ and ∂ϕ_t−θI nilpotent. Its morphisms are F_q-linear algebraic-group maps commuting with the action. Define its exponential and formal logarithm as the unique mutually inverse formal F_q-linear series with linear coefficient I and ϕ_a exp_G = exp_G ∂ϕ_a. For a chosen K-embedding L → C∞, prove that exp_G : Lie G(C∞) → G(C∞) is entire and functorial; the logarithm identities hold on their convergence domains. Define uniformizability in this analytic setting as surjectivity of exp_G. For G defined over K̄, define regularity as the existence of a single integer ν ≥ 0 such that G[a](K̄) is free of rank ν over F_q[t]/(a) for every nonzero a (CM21 §2.2 and Definition 6.3.1, CM21 lines 372 and 1819; allowing d = ν = 0 includes the zero object).

For an effective dual t-motive that is additionally finite free over K̄[σ], construct the associated t-module using M/(σ−1)M; if M has a K̄[σ]-basis ν_i and y = Σ_i(Σ_j a_ijσ^j)ν_i, the coordinate map sends y to (Σ_j a_ij^(q^j))_i. Its kernel is (σ−1)M and its induced t-action is the required algebraic additive-polynomial action (CM21 §2.3, CM21 line 438). For any nonempty finite family M_i containing one such N, with each M_i/N either zero or again finite free over both K̄[t] and K̄[σ], construct the coproduct identifying the copies of N; prove these freeness properties persist, and that rigid analytic triviality persists when each M_i and N is rigid analytically trivial (CM21 Proposition 2.4.5 and Proposition 2.5.3, CM21 lines 543 and 602). Prove that a rigid analytically trivial finite-free Anderson dual motive has a uniformizable associated t-module (CM21 Remark 2.5.2, CM21 line 600), and prove the discrete free period-lattice description and regularity of these uniformizable objects (CM21 §6.3, CM21 lines 1825–1837).

Prove Yu’s sub-t-module theorem: for a regular t-module G over K̄ and Z ∈ Lie G(C∞) with exp_G(Z) ∈ G(K̄), the smallest K̄-defined ∂ϕ_t-invariant C∞-linear subspace containing Z is Lie H(C∞) for a connected algebraic sub-t-module H of G defined over K̄ (CM21 Theorem 1.3.2, CM21 line 203). This is a target for every regular t-module, independent of its special-value application.

The interface includes the following facts.

- The t-module category has composition, direct sums, differential and the displayed functorial exponential and logarithm maps, with specified domains.
- The n-th Carlitz tensor t-module, for n ≥ 1, has ϕ_t = θI+N+Eτ, where N has ones on the superdiagonal and E has its only nonzero entry 1 at (n,1); it is uniformizable and regular.
- The dual-motive quotient construction and the nonempty finite coproduct have their quotient maps, universal property and compatibility with the t-action; no finite K̄[σ]-generation is inferred for an arbitrary effective dual t-motive.
- For a uniformizable object attached to a rank-r dual motive, its period lattice has rank r and G[a](K̄) ≃ (F_q[t]/(a))^r. Yu’s subspace theorem applies under its separate regularity and algebraic-point hypotheses.

**Checks.**

- At d = 0 the exponential and logarithm are the unique maps on a point, with ν = 0 and one torsion point. A positive-rank requirement would delete this zero object.
- At n = 1 the tensor action is θ+τ, recovering e_C(θz) = θe_C(z)+e_C(z)^q. At n = 2 its differential is ((θ,1),(0,θ)), whose nilpotent part squares to zero and is not zero.
- For n = 1 and a = t, the equation θx+x^q = 0 has q distinct roots, so its torsion is a one-dimensional F_q-space. Reversing the differential and Frobenius matrices does not give this action.
- The coproduct of N and N over N is N, with quotient map (x,y) ↦ x+y and relation (n,−n); it is not N⊕N. For Yu’s theorem at Z = 0 the minimal subspace and H are zero.

*Needs:* §0.0 (effective dual t-motives; analytic field; arithmetic series and twist); Mathlib additive polynomials and semilinear algebra. The coordinate formulas, quotient and coproduct constructions and the logarithmic-subspace theorem are targets here, as specified above.

#### Entireness and lifting

Prove the entireness criterion: for Φ ∈ Mat_ℓ(K̄[t]) with det Φ(0) ≠ 0 and ψ ∈ T^ℓ satisfying ψ⁽⁻¹⁾ = Φψ, every coordinate of ψ lies in E (ABP04 Proposition 3.1.3, ABP04 line 409). Prove ABP lifting: if det Φ = c(t−θ)^m with c ∈ K̄ˣ and m ≥ 0, ψ ∈ E^ℓ satisfies that equation, and a row ρ ∈ Mat_(1×ℓ)(K̄) has ρψ(θ) = 0, there is P ∈ Mat_(1×ℓ)(K̄[t]) with P(θ) = ρ and Pψ = 0 (ABP04 Theorem 3.1.1, ABP04 line 346). These are two distinct theorems on the arithmetic ring E, using the supplied analytic ring.

**Checks.**

- For Φ = ((t−θ,0),(t−θ,1)), det Φ = t−θ and det Φ(0) = −θ ≠ 0. Its column (Ω,𝓛(1)) has second-row equation 𝓛(1)⁽⁻¹⁾ = (t−θ)Ω+𝓛(1).
- For Φ = I₂, ψ = (1,1)ᵀ and ρ = (1,−1), the lift P = (1,−1) has Pψ = 0 and P(θ) = ρ.
- The zero square matrix has determinant zero and fails both hypotheses. The nonzero determinant c(t−θ)^m evaluates to c(−θ)^m ≠ 0 at zero, so lifting's determinant condition implies the entireness determinant condition.

*Needs:* §0.0 (arithmetic series and twist); for the first route, ReductiveGroupsPartII §RG2.3.7 (Lang’s theorem for GL_ℓ and coefficient extension), and algebraic coefficient descent by the finite-field matrix equation and restricted-series coefficient estimates (ABP04 proof of Proposition 3.1.3, ABP04 lines 416–469); RestrictedPowerSeries §§1.1 and 7.2.

#### Rational Frobenius comparisons

For Φ_i ∈ Mat_(r_i)(K̄[t]) with det Φ_i = c_i(t−θ)^(m_i), c_i ∈ K̄ˣ, and U ∈ Mat_(r_1×r_2)(K̄(t)) satisfying U⁽⁻¹⁾Φ₂ = Φ₁U, prove that the monic least common denominator of U's entries belongs to F_q[t] (CPY19 Proposition 2.2.1, CPY19 line 245). For Φ ∈ GL_n(K̄(t)) and two Ψ,Ψ′ ∈ GL_n(Frac(T)) satisfying X⁽⁻¹⁾ = ΦX, prove Ψ′ = ΨC for a unique C ∈ GL_n(F_q(t)) (PAP08 §4.1.6, PAP08 line 1033). This fixes right multiplication by the constant matrix.

**Checks.**

- With Φ₁ = Φ₂ = (1) and U = (1/t), the denominator is t ∈ F_q[t] although U is not polynomial. U = (1/(t−θ)) fails because its inverse twist has denominator t−θ^(1/q).
- For Φ = I, Ψ = I and Ψ′ = diag(t,1), the unique C is diag(t,1). Replacing t by t−θ fails the fixedness equation.
- Right multiplication matters: for Ψ = ((Ω,0),(𝓛(1),1)) and C = ((1,1),(0,1)), ΨC = ((Ω,Ω),(𝓛(1),𝓛(1)+1)), while CΨ = ((Ω+𝓛(1),1),(𝓛(1),1)). These differ in the top-right entry Ω versus 1.

*Needs:* §0.0 (arithmetic series and twist); Mathlib rational functions and matrix inverses. The denominator route follows the Frobenius orbit of a pole away from θ; it cannot create infinitely many poles of one rational function (CPY19 proof, CPY19 lines 251–274).

### 0.1 Indices, arrays and their orders

q = p^e a fixed prime power; entries of indices are positive integers. Use `Composition` for a fixed-weight index, whose underlying data is a finite list s = (s_1, …, s_r) of positive integers, r ≥ 0, with weight wt(s) = s_1 + ⋯ + s_r and depth dep(s) = r; the empty index ∅ has weight and depth 0, and s_i := 0 for i > r is used only in comparisons. For nonempty s put s_+ = (s_1, …, sᵣ₋₁) and s_− = (s_2, …, s_r); (s, t) is concatenation, and q^({m}) denotes m consecutive entries q. Prefix dominance: s ≤ t iff wt(s) = wt(t) and s_1 + ⋯ + s_i ≤ t_1 + ⋯ + t_i for every i ≥ 1. For a nonempty index, the collapse T_i(s) = (s_1 + ⋯ + s_h, sₕ₊₁, …, s_r), with h = min(i,r) and i ≥ 1; put T_i(∅) = ∅, so T_1(s) = s, and s + t is the coordinatewise sum of the zero-padded sequences, trailing zeros dropped (not concatenation). For a fixed prime power q, Init(s) = (s_1, …, s_i) with i maximal such that s_1, …, s_i ≤ q, and initial tuples are compared in the lexicographic order of finite lists, a proper prefix being smaller. For k ≥ 1, s is k-admissible iff s_1, …, s_k ≤ q (zero-padded) and s is not of the form (s_1, …, s_r) with r ≤ k, s_1, …, sᵣ₋₁ ≤ q and s_r = q; ∅ is k-admissible. An array (ε; s) is an index s of depth r together with ε = (ε_1, …, ε_r) ∈ (F_q^×)^r; its character is χ(ε) = ε_1⋯ε_r, the sum of arrays is (εε′; s + t) with ε_i := 1 past the depth, and (ε; s) ≤ (ε′; t) iff χ(ε) = χ(ε′) and s ≤ t (a preorder). (ND21, §2.1, p. 5 (order ≤, T_i); Definition 2.11, p. 11 (Init); Definition 3.1, p. 14 (k-admissibility) (ND21 line 217); IKLNDP24, §1.1.1–1.1.2 and Remark 1.1, pp. 7–8; §1.1.5, p. 10 (sum of arrays); Definition 1.8, p. 21 (IKLNDP24 line 313); CCM23, §2.1, (2.1.2)–(2.1.3), p. 6 (indices, I_w, concatenation, s_+, s_−); Definition 2.1.4, p. 7 (the bracket on H) (CCM23 line 250)).

The interface includes the following facts.

- The prefix-dominance relation s ≤ t: equal weight and dominated prefix sums.
- For nonempty s, T_i collapses the first min(i,dep(s)) entries; the empty index stays empty and T_1 is the identity.
- Init(s), the longest initial segment with entries ≤ q.
- k-admissibility of s.
- s ≤ t implies dep(s) ≥ dep(t).
- s ≤ t implies T_k(s) ≤ T_k(t) for every k ≥ 1.
- An index of weight w ≥ 1 is w-admissible iff it lies in I^T_w.
- χ(ε) = ε_1⋯ε_r for an array (ε; s).

One proof route is the following. Represent an index as a list of positive integers; weight and depth are its sum and length. Prefix dominance is reflexive and transitive, and antisymmetric among indices of one weight; if s ≤ t then (u, s) ≤ (u, t), u + s ≤ u + t, T_k(s) ≤ T_k(t) for every k, and dep(s) ≥ dep(t) (Im–Kim–Le–Ngo Dac–Pham Remark 1.1: a shorter index of the same weight would have a strictly smaller final prefix sum). If T_i(s) ≤ T_i(t) then T_k(s) ≤ T_k(t) for all k ≥ i (Ngo Dac §2.1). For integers x > i > 0, (x − i, (i) + c) ≤ (x, c); for nonempty a and any b, (a_1, a_− + b) ≤ a + b; these are the support bounds used by the product expansions. An index of weight w ≥ 1 is w-admissible iff it lies in Thakur's family I^T_w (entries ≤ q, last entry < q).

**Checks.**

- T_1(∅) = ∅ and T_3(1,2) = (3). Treating an empty prefix sum as an actual part would create the forbidden index (0); failing to truncate the collapse index would ask for an absent entry.
- wt(2, 1, 3) = 6 and dep(2, 1, 3) = 3.
- (1, 2) ≤ (2, 1) holds and (2, 1) ≤ (1, 2) fails.
- (1, 3) and (2, 1, 1) are incomparable for prefix dominance although (1, 3) is lexicographically smaller.
- wt(∅) = dep(∅) = 0, Init(∅) = ∅ and ∅ is k-admissible for every k.
- For every q, (q) is not 1-admissible and (q, 1) is 1-admissible.
- (1, 2) ≤ (2, 1) but (2, 1) is not ≤ (1, 2); (1, 3) and (2, 1, 1) are incomparable although (1, 3) precedes (2, 1, 1) lexicographically.
- Init(q + 1, 1) = ∅ and Init(q, q, 1) = (q, q, 1); (q) is not 1-admissible while (q, 1) is.

*Needs:* Mathlib `Composition`.

### 0.2 Power sums of both realisations

θ transcendental over F_q, so the sums lie in K = F_q(θ); ε_i ∈ F_q^×. Let A = F_q[θ], K = F_q(θ), A_(+,d) the finite set of monic polynomials of degree d, ℓ_0 = 1 and ℓ_d = ∏ᵢ₌₁ᵈ(θ − θ^(q^i)). For d ∈ Z and an array (ε; s) of depth r ≥ 1 put
S_d(ε; s) = Σ ε_1^(deg a_1)⋯ε_r^(deg a_r) a_1^(−s_1)⋯a_r^(−s_r) ∈ K, over a_i ∈ A_+ with d = deg a_1 > ⋯ > deg a_r ≥ 0,
Si_d(ε; s) = Σ ε_1^(d_1)⋯ε_r^(d_r) ℓ_(d_1)^(−s_1)⋯ℓ_(d_r)^(−s_r) ∈ K, over integers d = d_1 > ⋯ > d_r ≥ 0,
both zero when d < r − 1, and S_(<d) = Σ_(0 ≤ j < d) S_j, Si_(<d) = Σ_(0 ≤ j < d) Si_j for nonempty arrays. For the empty array, S_(<d)(∅) = Si_(<d)(∅) = 1 for every d ∈ Z, and S_d(∅) = Si_d(∅) is 1 for d = 0 and 0 otherwise. Trivial characters give S_d(s), Si_d(s). One has S_d(ε; s) = S_d(ε_1; s_1) S_(<d)(ε_−; s_−), Si_d(ε; s) = Si_d(ε_1; s_1) Si_(<d)(ε_−; s_−), S_d(ε; s) = ε^d S_d(s) and Si_d(ε; s) = ε^d ℓ_d⁻ˢ in depth one for d ≥ 0. (ND21, §2.1, pp. 5–6 (ND21 line 217); IKLNDP24, §1.1.3–1.1.4, pp. 8–9 (IKLNDP24 line 369); CCM23, Definition 2.2.2 and the identities after it, pp. 7–8 (CCM23 line 293)).

The interface includes the following facts.

- S_d(ε; s) ∈ K.
- S_(<d)(ε; s) ∈ K.
- Si_d(ε; s) ∈ K.
- Si_(<d)(ε; s) ∈ K.
- S_d(ε; s) = S_d(ε_1; s_1) S_(<d)(ε_−; s_−), and likewise for Si.
- For nonempty arrays, S_(<d) = Σ_(0 ≤ j < d) S_j.
- S_(<d)(∅) = 1 for every d ∈ Z.
- S_d(ε; s) = 0 when d < dep(s) − 1.
- For d ≥ 0 in depth one S_d(ε; s) = ε^d S_d(s) and Si_d(ε; s) = ε^d ℓ_d⁻ˢ.

One proof route is the following. For d ≥ 0, A_(+,d) has q^d elements; for d < 0 it is empty. Thus every S_d is a finite sum in K; Si_d is a finite sum over decreasing nonnegative integer sequences below d. The factorisations follow by separating the first summation variable; the convention S_(<d)(∅) = 1 for every d ∈ Z is what makes the depth-one case d = 0 of the factorisation correct. In depth one, ε^(deg a) = ε^d for every a ∈ A_(+,d), and ε^(d_1) = ε^d, giving the character factor.

**Checks.**

- At q = 4, ∏_(a∈F₄)(θ+a) = θ⁴−θ has derivative 1, so S₁(1) = 1/(θ⁴−θ), with leading term θ⁻⁴. Using p = 2 in place of q would give θ⁻² and the wrong denominator.
- S_0(s) = Si_0(s) = 1 for every s ≥ 1 in depth one, and S_d(s) = 0 for d < 0. Also S_(<−1)(∅) = Si_(<−1)(∅) = 1, while S_(<−1)(s) = Si_(<−1)(s) = 0 for nonempty s.
- For q = 2, S_1(1) = (θ² + θ)⁻¹.
- S_0((s)) = S_0(s) S_(<0)(∅) = 1: with S_(<0)(∅) = 0 the factorisation would give 0. This forces the value 1 at d = 0; our uniform convention gives 1 for every integer d.
- For q = 3, S_1(−1; 1) = −S_1(1).
- For q = 2, S_1(1) = θ⁻¹ + (θ + 1)⁻¹ = (θ² + θ)⁻¹ and S_1(1, 1) = S_1(1)S_0(1) = S_1(1).

*Needs:* §0.1; §0.0 (Carlitz products); Mathlib `Polynomial.Monic`; Mathlib `RatFunc`.

For the depth-one sums prove Carlitz’s identity S_d(n) = ℓ_d^(−n) for every d ≥ 0 and 1 ≤ n ≤ q, and prove S_d(k) ≠ 0 and degθ S_(d+1)(k) < degθ S_d(k) for every k ≥ 1 and d ≥ 0. The first is the small-exponent identity; the second is the general prime-power degree theorem used in §0.5 (IKLNDP24 Lemma 1.2, IKLNDP24 line 453; THAKUR09P proof of Theorem 1 and proof of Theorem 4, THAKUR09P lines 354 and 455; SHEATS98 Theorem 1.2, SHEATS98 line 143). For k ≥ 1 and d ≥ 1, use the admissible tuples (m₁,…,m_d) with all m_i > 0 divisible by q−1 and with (k−1)+m₁+⋯+m_d adding without carries in base p. Prove that the weighted sum m₁+2m₂+⋯+dm_d has a unique minimum and that −degθ S_d(k) = dk + min(m₁+2m₂+⋯+dm_d); prove strict descent by restricting a minimizing tuple for d+1. At d = 0 the tuple is empty and the degree is zero (THAKUR09P proof of Theorem 1, part II, THAKUR09P lines 354–396; SHEATS98 Theorem 1.2 and Lemma 1.3, SHEATS98 lines 143–150). The API includes the no-carry and divisibility membership criterion, existence and uniqueness of the minimizing tuple, the degree formula, and strict degree descent. The native finite sum is `powerSum`, and `powerSum_degree_descent` states nonvanishing and strict degree descent for every k > 0.

**Checks for the depth-one identities.**

- At q = 2 and k = 1, degrees at d = 0,1,2 are 0, −2, −6, while ℓ₀ = 1 and ℓ₁ = θ²+θ give the same two initial values 1 and (θ²+θ)⁻¹.
- At q = 3 and d = 1, S₁(1) = −D₁⁻¹ and S₁(2) = D₁⁻². At k = 4, S₁(4) = D₁⁻⁴−D₁⁻², distinct from ℓ₁⁻⁴; this excludes extending the small-exponent identity past q.
- At q = 2, k = 1 and d = 2, (m₁,m₂) = (2,1) is admissible with weighted sum 4, giving degree −(2+4) = −6; (1,2) has weighted sum 5. At k = 2, (1,2) fails because (k−1)+1+2 has a binary carry. For d = 0 the empty tuple gives S₀(k) = 1.
- In one degree the minimal admissible m₁ is 2 at q = 3, k = 1, giving degree −3; at q = 4, k = 2 the positive-exponent sum is still nonzero although p divides k. Replacing divisibility by q−1 with divisibility by p−1 would lose the constant-field power-sum condition: the unit sums at exponent 1 in F₄ and F₂ are 0 and 1, respectively.

*Needs:* §0.0 (Carlitz products); the depth-one finite sums of this subsection; Mathlib `FiniteField.sum_pow_units`, finite-field binomial identities and polynomial degrees.

### 0.3 Thakur multiple zeta values

The valuation at ∞ normalised by v_∞(θ) = −1; K_∞ is the completion of K at ∞. For an index s of depth r ≥ 1, Thakur's multiple zeta value is ζ_A(s) = Σ_(d ≥ 0) S_d(s) ∈ K_∞ = F_q((1/θ)), that is the sum of a_1^(−s_1)⋯a_r^(−s_r) over monic a_1, …, a_r with deg a_1 > ⋯ > deg a_r. The series converges since |S_d(s)|_∞ ≤ q^(−d s_1) (|·|_∞ normalised by |θ|_∞ = q); ζ_A(∅) = 1. Its weight and depth are those of s; in depth one these are the Carlitz zeta values ζ_A(n) = Σ_(a ∈ A_+) a⁻ⁿ. (ND21, §1.2, pp. 2–3, and §2, p. 5 (ND21 line 74); CCM23, §1.2, equation (1.2.1), p. 2 (CCM23 line 53); IKLNDP24, §0.2.1, p. 3, and §1.1.3, p. 8 (IKLNDP24 line 95)).

The declaration `multipleZeta` is the alternating series on native polynomial tuples; specializing every character to one gives this ordinary value.

The interface includes the following facts.

- ζ_A(s) ∈ K_∞ for an index s.
- ζ_A(∅) = 1.
- ζ_A(s) = Σ_(d ≥ 0) S_d(s) in K_∞.
- |S_d(s)|_∞ ≤ q^(−d s_1) for nonempty s.
- ζ_A((n)) is the Carlitz zeta value Σ_(a ∈ A_+) a⁻ⁿ.

One proof route is the following. Each term a_1^(−s_1)⋯a_r^(−s_r) with deg a_1 = d has absolute value at most q^(−d s_1), and an ultrametric finite sum is bounded by its largest term, so |S_d(s)|_∞ ≤ q^(−d s_1) → 0. Hence the series converges (unconditionally) in K_∞ and equals the sum over strictly degree-decreasing tuples of monic polynomials. The identity at 1 uses §0.2 (depth-one power sums) with exponent 1 and the logarithm series of §0.0 (Carlitz exponential and logarithm); 1 is inside its convergence disc.

**Checks.**

- ζ_A(1) = log_C(1), the Carlitz logarithm of §0.0 at 1.
- ζ_A(∅) = 1.
- For q = 2, ζ_A(1)² = ζ_A(2).
- Unlike real multiple zeta values no admissibility s_1 ≥ 2 is needed: ζ_A(1) and ζ_A(1, 1) converge.
- ζ_A(1) = Σ_(d ≥ 0) ℓ_d⁻¹ = log_C(1) (§0.2 (depth-one power sums)).
- For q = 2, ζ_A(1)² = ζ_A(2), since squaring is additive in characteristic 2.

*Needs:* §0.2; Mathlib `RatFunc.CompletionAtInfty`; Mathlib `RatFunc.inftyValuation`; §0.2 (depth-one power sums); §0.0 (Carlitz exponential and logarithm).

### 0.4 Harada’s alternating multiple zeta values

ε_i ∈ F_q^×. For an array (ε; s) of depth r ≥ 1, the alternating multiple zeta value is ζ_A(ε; s) = Σ_(d ≥ 0) S_d(ε; s) = Σ ε_1^(deg a_1)⋯ε_r^(deg a_r) a_1^(−s_1)⋯a_r^(−s_r) ∈ K_∞, the sum over monic a_1, …, a_r with deg a_1 > ⋯ > deg a_r; ζ_A(∅; ∅) = 1. Its weight, depth and character are those of the array, and ζ_A((1, …, 1); s) = ζ_A(s). (IKLNDP24, §0.2.2, p. 4; §4.1.1, p. 43 (IKLNDP24 line 148)).

The general series is `multipleZeta`; the coefficients ε are elements of Fˣ, rather than arbitrary field elements.

The interface includes the following facts.

- ζ_A(ε; s) ∈ K_∞.
- ζ_A((1, …, 1); s) = ζ_A(s).
- ζ_A(ε; s) = Σ_(d ≥ 0) S_d(ε; s).
- ζ_A(ε; n) = Σ_(d ≥ 0) ε^d S_d(n).

One proof route is the following. Convergence as for ζ_A(s), since |ε_i| = 1. The trivial character recovers Thakur’s values.

**Checks.**

- With ε = (1, …, 1), ζ_A(ε; s) = ζ_A(s).
- For q = 2, F_2^× = {1}, so every alternating value is a Thakur value.
- For q = 3, ζ_A(−1; 1) − ζ_A(1) = −2Σ_(d odd) ℓ_d⁻¹ ≠ 0 (its leading term has valuation q = 3), so the twist by ε^(deg a) is not trivial.
- For q = 2 every character is trivial and the alternating values are Thakur’s values.

*Needs:* §0.2; §0.3.

### 0.5 Thakur’s nonvanishing theorem

s of depth r ≥ 1; q any prime power. For every prime power q and every index s of positive depth, ζ_A(s) ≠ 0; likewise ζ_A(ε; s) ≠ 0 for every array. More precisely, if for each k ≥ 1 the degrees deg_θ S_d(k) (d ≥ 0) are finite and strictly decreasing in d, then the term Sᵣ₋₁(s_1)Sᵣ₋₂(s_2)⋯S_0(s_r) is the unique term of largest degree in Σ_(d_1 > ⋯ > d_r ≥ 0) S_(d_1)(s_1)⋯S_(d_r)(s_r). (THAKUR09P, Theorem 4 and its proof, §5.2, p. 542; Theorems 1–2, §4, pp. 540–541 (THAKUR09P line 445); ND21, §1.2, p. 3 (ND21 line 120); IKLNDP24, §2.2.2, after (2.5), p. 29 (IKLNDP24 line 3623)).

The headline signature is `multipleZeta_ne_zero`.

One proof route is the following. For 1 ≤ k ≤ q, S_d(k) = ℓ_d⁻ᵏ has degree −k(q + q² + ⋯ + q^d), which is strictly decreasing in d (§0.2 (depth-one power sums)). For general k, Thakur shows S_d(k) ≠ 0 and −deg S_d(k) strictly increasing in d: for q prime from his recursion for the degrees, and for general q from the minimal-decomposition formula or Sheats’s degree inequality (Thakur 2009, proof of Theorem 4). The general-q degree theorem is a target of §0.2. Given strict monotonicity, the degree of S_(d_1)(s_1)⋯S_(d_r)(s_r) over d_1 > ⋯ > d_r ≥ 0 is uniquely maximised at d_i = r − i, so no cancellation can occur and ζ_A(s) ≠ 0; the character factors have absolute value 1, so the same argument applies to ζ_A(ε; s).

The signature also includes the empty weight-zero array, whose value is 1 ≠ 0.

**Checks.**

- ζ_A(1) has leading term 1; for q = 2, ζ_A(1, 1) has leading term S_1(1) = (θ² + θ)⁻¹ of degree −2.

*Needs:* §0.3; §0.4; §0.2 (depth-one power sums); §0.2 (power-sum degrees).

### 0.6 Carlitz multiple polylogarithms

C_∞ and its absolute value from §0.0; ℓ_d from §0.0. For an index s of depth r ≥ 1, the Carlitz multiple polylogarithm is the series Li_s(z_1, …, z_r) = Σ_(d_1 > ⋯ > d_r ≥ 0) z_1^(q^(d_1))⋯z_r^(q^(d_r)) / (ℓ_(d_1)^(s_1)⋯ℓ_(d_r)^(s_r)), converging on its domain D_s ⊂ C_∞^r, which contains the polydisc D′_s = {|z_i|_∞ < q^(s_i q/(q−1))}. Its values at 1 are Li(s) = Li_s(1, …, 1) = Σ_(d ≥ 0) Si_d(s) ∈ K_∞, with Li(∅) = 1; for an array, Li(ε; s) = Σ_(d ≥ 0) Si_d(ε; s) ∈ K_∞ (alternating Carlitz multiple polylogarithm). If γ_i ∈ F̄_q satisfies γ_iᑫ⁻¹ = ε_i, then Li_s(γ_1, …, γ_r) = γ_1⋯γ_r Li(ε; s). In depth one Li_n is Anderson–Thakur’s n-th Carlitz polylogarithm and Li_1 = log_C. (CHANG14, §5.1, Definitions 5.1.1 and 5.1.3, Remark 5.1.4, p. 13 (CHANG14 line 614); CCM23, §2.2, equation (2.2.1), p. 7, and the identities after Definition 2.2.2, p. 8 (CCM23 line 293); IKLNDP24, §0.3.2, p. 5; §1.1.3–1.1.4, pp. 8–9; §2.2.3, (2.6)–(2.7), p. 29 (IKLNDP24 line 208)).

Precisely, for positive depth r, D_s is the set of tuples z such that for every real η > 0 there is N ∈ ℕ with ∏_j (|z_j|∞ / q^(q s_j/(q−1)))^(q^(d_j)) < η for every d₁ > ⋯ > d_r ≥ 0 with d₁ ≥ N. This is the full convergence domain, by the displayed term norm and completeness. D_∅ is the single empty tuple. Thus the construction determines D_s itself, not only the contained polydisc D′_s (CHANG14 Definition 5.1.3, CHANG14 line 652).

The denominator `carlitzDenominator` is ℓ_d and `multiplePolylog` states the degree-character values at constant roots; the analytic function at arbitrary points remains this subsection’s full target.

The interface includes the following facts.

- The series Li_s(z_1, …, z_r) on its convergence domain.
- Li(s) = Li_s(1, …, 1) ∈ K_∞.
- Li(ε; s) ∈ K_∞.
- Li(ε; s) = Σ_(d ≥ 0) Si_d(ε; s).
- Li_1 = log_C on the disc |z| < q^(q/(q−1)).
- Li_s(γ_1, …, γ_r) = γ_1⋯γ_r Li(ε; s) when γ_iᑫ⁻¹ = ε_i.
- Li(∅) = 1.

One proof route is the following. |ℓ_i^n|_∞ = q^(nq(q^i − 1)/(q − 1)) (from the product defining ℓ_i and |θ|_∞ = q), so the general term has absolute value q^(q(s_1 + ⋯ + s_r)/(q−1)) ∏_j |z_j/θ^(q s_j/(q−1))|^(q^(d_j)), which tends to 0 on D′_s (Chang (5.1.2) and Remark 5.1.4). For γᑫ⁻¹ = ε one has γ^(q^d) = γ·ε^((q^d − 1)/(q − 1)) = γ ε^d, because 1 + q + ⋯ + qᵈ⁻¹ ≡ d mod q − 1. Hence Li_s(γ) = Σ γ_1 ε_1^(d_1)⋯γ_r ε_r^(d_r)/(ℓ_(d_1)^(s_1)⋯) = γ_1⋯γ_r Li(ε; s).

**Checks.**

- At q = 3 and s = (2,2), z = (1,θ⁴) lies in D_s: on d₁=d₂+1 its normalized exponent is −8·3^(d₂), and a larger d₁ only decreases it. It is outside D′_s because |θ⁴|∞ = 3⁴ > 3³. A zero second coordinate makes the full series zero, so whole-tuple convergence alone cannot imply prefix convergence without the stated nonzero-coordinate hypothesis.
- Li_1(z) = log_C(z), so Li(1) = log_C(1) = ζ_A(1).
- Li(∅) = 1 and Li((1, …, 1); s) = Li(s).
- For q = 3, Li(4) ≠ ζ_A(4): in u = θ⁻¹, their difference begins u⁶, since S₁(4) begins 2u⁶ and ℓ₁⁻⁴ begins u¹². The identity of §0.8 needs every entry ≤ q.
- For q = 3, γ = √−1 ∈ F_9 and ε = −1, Li_1(γ) = γ Li(−1; 1).
- Li_1(z) = Σ_d z^(q^d)/ℓ_d = log_C(z), and Li(1) = log_C(1) = ζ_A(1).

*Needs:* §0.2; §0.0 (Carlitz products); §0.0 (analytic field); §0.0 (Carlitz exponential and logarithm).

### 0.7 Nonvanishing of Carlitz polylogarithm values

u ∈ D′_s ∩ (C_∞^×)^r. For an index s of depth r ≥ 1 and u ∈ D′_s with every u_i ≠ 0, the general term of Li_s(u) has a unique term of largest absolute value, at (d_1, …, d_r) = (r − 1, …, 0); hence Li_s(u) ≠ 0. In particular Li(s) ≠ 0 and Li(ε; s) ≠ 0 for every array, and 𝔏-type normalised values γ_1⋯γ_r Li(ε; s)/π̃ʷᵗ⁽ˢ⁾ are nonzero. (CHANG14, Remark 5.1.5, p. 13 (CHANG14 line 614)).

One proof route is the following. By the absolute value of the general term in §0.6, each factor |u_j/θ^(q s_j/(q−1))| is < 1, so raising it to q^(d_j) with d_j as small as possible maximises the term; the strictly decreasing constraint forces d_j = r − j. A unique maximal term in an ultrametric sum gives a nonzero sum. Roots of unity γ_i have absolute value 1 < q^(s_i q/(q−1)).

**Checks.**

- Li(1) = Σ_d ℓ_d⁻¹ has leading term 1.

*Needs:* §0.6.

The degree-character nonvanishing headline, including the empty array, is `multiplePolylog_ne_zero`.

### 0.8 Carlitz’s identity: MZVs equal CMPL values on Thakur’s range

Every entry s_i ≤ q. Using the depth-one identity of §0.2, for every array (ε; s) with s_i ≤ q for all i and every d ∈ Z, S_d(ε; s) = Si_d(ε; s) and S_(<d)(ε; s) = Si_(<d)(ε; s), hence ζ_A(ε; s) = Li(ε; s); in particular ζ_A(s) = Li(s) for s ∈ I^T_w and for s ∈ I^0_w, and 𝔏ᴸⁱ_d(s) = 𝔏^ζ_d(s), 𝔏ᴸⁱ_(<d)(s) = 𝔏^ζ_(<d)(s) for such s. (IKLNDP24, Lemma 1.2 and its proof, pp. 9–10 (IKLNDP24 line 453); CCM23, Remark 2.2.6, p. 8 (CCM23 line 345)).

One proof route is the following. The depth-one identity is §0.2 (depth-one power sums); with characters, both sides acquire the factor ε^d. Induct on depth using S_d(ε; s) = S_d(ε_1; s_1)S_(<d)(ε_−; s_−) and the same factorisation of Si_d; the tail (ε_−; s_−) again has entries ≤ q. Sum over d ≥ 0 for the values.

**Checks.**

- For q = 3, Li(1,2) = ζ_A(1,2), while Li(4) − ζ_A(4) begins θ⁻⁶. Removing the entry bound gives the wrong coefficient at θ⁻⁶.

*Needs:* §0.2; §0.3; §0.4; §0.6; §0.2 (depth-one power sums).

### 0.9 Weight-graded spans of zeta and polylogarithm values

K̄ the algebraic closure of K in C_∞ (§0.0). For w ≥ 1 let Z_w, AZ_w, L_w and AL_w be the K-linear spans in K_∞ of ζ_A(s), ζ_A(ε; s), Li(s) and Li(ε; s) over indices (arrays) of weight w; put Z_0 = AZ_0 = L_0 = AL_0 = K and Z = Σ_(w ≥ 0) Z_w (similarly AZ, L, AL). For descent statements let 𝒵_w ⊂ C_∞ be the K̄-span of the weight-w values. One has Z_w ⊂ AZ_w and L_w ⊂ AL_w, and each weight space is finite-dimensional: there are 2ʷ⁻¹ indices at weight w ≥ 1 and one at weight zero. (ND21, §1.2, p. 3 (ND21 line 120); IKLNDP24, §0.2.2, p. 4; §1.1, after Proposition 1.3, p. 14 (IKLNDP24 line 148); CHANG14, §2.2, p. 5 (CHANG14 line 189)).

The native spaces are `zetaSpace`, `alternatingZetaSpace`, `polylogSpace` and `alternatingPolylogSpace`.

The interface includes the following facts.

- Z_w ⊂ K_∞ as a K-submodule.
- AZ_w ⊂ K_∞.
- L_w and AL_w ⊂ K_∞.
- Z_w ≤ AZ_w and L_w ≤ AL_w.
- Each weight space is finite-dimensional over K.
- Z_0 = K.

One proof route is the following. The spans are submodules of K_∞ over K (and of C_∞ over K̄). At w ≥ 1 there are 2ʷ⁻¹ compositions of w and (q − 1)^r characters per index of depth r; at w = 0 there is one empty array. Thus every spanning family is finite.

**Checks.**

- Z_1 = K·ζ_A(1), of dimension 1.
- For q = 2, AZ_w = Z_w and AL_w = L_w.
- Weight 3 has four indices (3), (2, 1), (1, 2), (1, 1, 1).
- Z_w is a K-span. For q > 2 and ρ ∈ K̄ with ρᑫ⁻¹ = −θ, the element ρζ_A(1) belongs to 𝒵_1 but not to K_∞: v_∞(ζ_A(1)) = 0 and v_∞(ρ) = −1/(q − 1).
- Z_1 = K·ζ_A(1); for q = 2, AZ_w = Z_w.

*Needs:* §0.3; §0.4; §0.6; Mathlib `Submodule.span`; Mathlib `Composition`; §0.7; §0.0 (Omega and period).

### 0.10 Thakur, small-entry and Hoffman-type index families

q a fixed prime power. For w ≥ 1: I_w is the set of indices of weight w; Thakur’s family I^T_w = J_w = {s ∈ I_w : s_i ≤ q for i < dep(s), s_(dep(s)) < q}; the small-entry family I^0_w = {s ∈ I_w : every s_i < q}; the Hoffman-type family IND_w = J′_w = I′_w = {s ∈ I_w : q ∤ s_i for every i}; I^T_0 = IND_0 = {∅}. For arrays: AT_w = {(ε; s) : s ∈ J_w}, AS_w = {(ε; s) : s ∈ J′_w}, AJ^1_w = {(ε; s) : s ∈ J_w, ε_i = 1 whenever s_i = q}. The block map ι : J′_w → J_w sends (h_1q + r_1, …, h_nq + r_n), 0 < r_i < q, to (q^({h_1}), r_1, …, q^({h_n}), r_n), and ϕ : AS_w → AJ^1_w does the same on arrays, placing ε_i over r_i and 1 over the inserted entries q. In weight 0 all these sets are {∅}, resp. {(∅; ∅)}. (ND21, §1.2, Conjecture 1.6 and Theorem B, p. 3; §6, Lemma 6.1, p. 22 (ND21 line 120); CCM23, §2.1 and Proposition 2.1.1, p. 6 (CCM23 line 250); IKLNDP24, §1.3.2, p. 23; §1.4.1–1.4.2, pp. 24–25 (IKLNDP24 line 3086)).

The finite composition predicates are `thakurIndices`, `indivisibleIndices` and `smallEntryIndices`.

The interface includes the following facts.

- I^T_w as a finite set.
- I^0_w.
- IND_w.
- ι : IND_w → I^T_w.
- ι is a weight-preserving bijection.
- Consecutive subwords of elements of I^0 (resp. IND) lie in I^0 (resp. IND).
- For w ≤ q, I^T_w = I^0_w = IND_w.

One proof route is the following. ι is a weight-preserving bijection: an element of J_w parses uniquely into blocks, each a run of q’s ending in an entry < q, and each block (q^({h}), r) comes from the entry hq + r. ϕ is a bijection by the same parsing, the characters riding on the entries r_i. Consecutive subwords of elements of I^0_w (resp. IND_w) lie in I^0 (resp. IND) of their weight; Thakur’s family is not prefix-closed: (q, 1) ∈ I^T_(q+1) but (q) ∉ I^T_q.

**Checks.**

- For q = 2, I^T_3 = {(1, 1, 1), (2, 1)} and IND_3 = {(1, 1, 1), (3)}.
- For q = 3, I^T_4 = {(1,1,1,1), (1,1,2), (1,2,1), (2,1,1), (2,2), (3,1)} and ι(4) = (3, 1).
- (q, 1) ∈ I^T_(q+1) but its prefix (q) ∉ I^T_q.
- IND excludes multiples of q, not of p: for q = 4 the index (2) lies in IND_2.
- For w < q all three families equal the set of all compositions of w.
- For q = 2, I^T_3 = {(1, 1, 1), (2, 1)} and IND_3 = {(1, 1, 1), (3)}, with ι(3) = (2, 1).

*Needs:* §0.1; Mathlib `Composition`.

### 0.11 The counting sequences d(w), s(w), t(w) and c(w)

q ≥ 2. For q ≥ 2 define the following integer-indexed sequences: d(w) = 0 for w < 0, d(0) = 1, d(w) = 2ʷ⁻¹ for 1 ≤ w < q, d(q) = 2ᑫ⁻¹ − 1 and d(w) = Σᵢ₌₁ᑫ d(w − i) for w > q; s(w) = (q − 1)qʷ⁻¹ for 1 ≤ w < q, s(q) = (q − 1)(qᑫ⁻¹ − 1), s(w) = (q − 1)Σᵢ₌₁ᑫ⁻¹ s(w − i) + s(w − q) for w > q (with s(0) = 1 and s(w) = 0 for w < 0 in the recursion); t(w) = (q − 1)qʷ⁻¹ for 1 ≤ w < q, t(q) = (q − 1)(qᑫ⁻¹ − 1), t(w) = (q − 1)Σᵢ₌₁ᑫ t(w − i) for w > q; s(0) = t(0) = 1; and c(0) = 1, c(w) = 0 for w < 0, c(w) = Σᵢ₌₁ᑫ⁻¹ c(w − i) for w ≥ 1, the number of compositions of w with parts < q (Ngo Dac writes d^0(w) = |T^0_w|). (ND21, Conjecture 1.5 and the remark after it, p. 3; Theorem B, p. 3 (d^0(w) = |T^0_w|) (ND21 line 120); CCM23, Conjecture 1.2.2, p. 3 (CCM23 line 102); IKLNDP24, Theorem A, p. 4; §1.3.2, pp. 23–24 (t(w)); §1.4.2, pp. 24–25 (s(w)) (IKLNDP24 line 148)).

The native counting definitions `toddNumber` and `alternatingNumber` give d(w) and s(w) at nonnegative weights by the finite counts in §0.12; the recurrence characterization here identifies them with the stated sequences.

The interface includes the following facts.

- d(w).
- s(w).
- t(w).
- c(w).
- d(w) = Σᵢ₌₁ᑫ d(w − i) for every w ≠ 0, q (with d(n) = 0 for n < 0).
- For q = 2, d(w + 2) = d(w + 1) + d(w) for w ≥ 1.

One proof route is the following. Each sequence is defined by strong recursion on w. For w ≠ 0, q the recursion d(w) = Σᵢ₌₁ᑫ d(w − i) holds with the conventions d(0) = 1, d(w < 0) = 0 (Ngo Dac §1.2).

**Checks.**

- For q = 2, d(1), …, d(5) = 1, 1, 2, 3, 5.
- For q = 3, d(4) = 6 and s(4) = 46.
- d(q) = 2ᑫ⁻¹ − 1, one less than the 2ᑫ⁻¹ compositions of q, since (q) is excluded.
- s(w) ≠ t(w) in general: for q = 3, t(4) = 2(t(3) + t(2) + t(1)) = 48 while s(4) = 46.
- For q = 2, d(w) is the Fibonacci sequence 1, 1, 2, 3, 5, … (w = 1, 2, …); for q = 3, d(1), …, d(4) = 1, 2, 3, 6 and s(1), …, s(4) = 2, 6, 16, 46.
- c(w) is not d(w): at q = 3, c(4) = 5 while d(4) = 6, the extra Thakur index being (3, 1); at q = 2, c(3) = 1 while d(3) = 2, only (1, 1, 1) having all entries below q; at q = 4, c(5) = c(4) + c(3) + c(2) = 7 + 4 + 2 = 13 while d(5) = 14, the extra index being (4, 1).
- t(w) is not s(w) beyond the first difference: at q = 3, t(5) = 2(48 + 16 + 6) = 140 whereas s(5) = 2(46 + 16) + 6 = 130; at q = 4, t(5) = 3(189 + 48 + 12 + 3) = 756 whereas s(5) = 3(189 + 48 + 12) + 3 = 750. The extra terms count the q − 1 characters allowed on an entry q, against the single character one.

*Needs:* no earlier target; the sequences are defined by recursion.

### 0.12 Counting Thakur and Hoffman index sets

q ≥ 2. For every w ≥ 0: |I^T_w| = |IND_w| = d(w), |I^0_w| = c(w), |AT_w| = t(w), and |AS_w| = |AJ^1_w| = s(w). (ND21, Lemma 6.1(1) and its proof, p. 22 (ND21 line 1333); CCM23, Proposition 2.1.1, p. 6; Remark after Conjecture 1.2.3, p. 3 (CCM23 line 250); IKLNDP24, §1.3.2, pp. 23–24; §1.4.2, pp. 24–25 (IKLNDP24 line 3086)).

One proof route is the following. Split an element of IND_w by its first entry: 1 ≤ s_1 ≤ q − 1 leaves an element of IND_(w−s_1), and s_1 > q gives (s_1 − q, s_2, …) ∈ IND_(w−q); so |IND_w| = Σᵢ₌₁ᑫ |IND_(w−i)| for w > q, with the initial values counted directly (Ngo Dac Lemma 6.1(1)). ι is a bijection IND_w → I^T_w (§0.10). AS_w has (q − 1)ᵈᵉᵖ⁽ˢ⁾ arrays over each s ∈ IND_w; splitting by the first entry gives the s(w) recursion, and ϕ identifies AS_w with AJ^1_w; AT_w is counted the same way, the first entry q now carrying q − 1 characters.

**Checks.**

- For q = 3 and w = 4 the counts are 6, 6, 46 and 48 for I^T, IND, AS and AT.

*Needs:* §0.10; §0.11.

### 0.13 Carlitz’s evaluation of ζ_A(q − 1)

e_C the Carlitz exponential with kernel π̃A (§0.0). With π̃ = 1/Ω(θ) the Carlitz period of §0.0 and D_1 = θ^q − θ, ζ_A(q − 1) = Li(q − 1) = −π̃ᑫ⁻¹/D_1. The right side does not depend on the chosen nonzero (q − 1)-th root of −θ, since π̃ᑫ⁻¹ ∈ K_∞ (§0.0 (Omega and period)). More generally z/e_C(z) = 1 + Σ_(m ≥ 1, (q−1) | m) ζ_A(m)(z/π̃)^m near z = 0. (IKLNDP24, proof of Theorem 3.4, last step, p. 42 (IKLNDP24 line 4453); CCM23, proof of Theorem 5.2.1, p. 25 (CCM23 line 1370)).

One proof route is the following. By §0.0 (Carlitz exponential and logarithm) applied to the lattice π̃A (§0.0 (Omega and period)), e_C(z) = z∏_(0 ≠ a ∈ A)(1 − z/(aπ̃)). e_C is F_q-linear with derivative 1, so the logarithmic derivative gives 1/e_C(z) = 1/z + Σ_(a ≠ 0) 1/(z − aπ̃) = 1/z − Σ_(n ≥ 1) zⁿ⁻¹ Σ_(a ≠ 0)(aπ̃)⁻ⁿ. Writing a = cb with c ∈ F_q^× and b monic, Σ_(a ≠ 0) a⁻ⁿ = (Σ_(c ∈ F_q^×) c⁻ⁿ) ζ_A(n), and Σ_(c) c⁻ⁿ is −1 if (q − 1) | n and 0 otherwise (Mathlib FiniteField.sum_pow_units); this gives the generating identity. Since e_C(z) = z + z^q/D_1 + O(z^(q²)), z/e_C(z) = 1 − zᑫ⁻¹/D_1 + O(z²⁽ᑫ⁻¹⁾); comparing the coefficient of zᑫ⁻¹ gives ζ_A(q − 1)/π̃ᑫ⁻¹ = −1/D_1. ζ_A(q − 1) = Li(q − 1) by §0.8, since q − 1 ≤ q.

**Checks.**

- For q = 2, ζ_A(1) = −π̃/(θ² + θ), and for q = 3, ζ_A(2) = −π̃²/(θ³ − θ); the two signs follow from π̃ᑫ⁻¹ = −θ^q∏_(i ≥ 1)(1 − θ^(1−q^i))⁻⁽ᑫ⁻¹⁾.

*Needs:* §0.3; §0.8; §0.0 (Carlitz exponential and logarithm); §0.0 (Omega and period); Mathlib `FiniteField.sum_pow_units`.

### 0.14 Eulerian values

π̃ from §0.0; v_∞ extended to C_∞. An element z ∈ C_∞ is Eulerian of weight w ≥ 1 if z ∈ K·π̃^w; this is independent of the choice of the period, which changes by a factor in F_q^× (§0.0 (Omega and period)). Since v_∞(π̃) = −q/(q − 1), the valuation of π̃^w is an integer iff (q − 1) | w. Hence, if (q − 1) ∤ w, no nonzero element of C_const := ⋃_(n ≥ 1) F_(q^n)((1/θ)) ⊂ C_∞ (which contains K_∞) has the form cπ̃^w with c ∈ F̄_q(θ); in particular a nonzero element of K_∞ is never Eulerian of weight w. (With coefficients c ∈ K̄ the analogue fails: ρ⁻ʷπ̃^w lies in K_∞.) (CCM23, Lemma 5.1.1, second hypothesis, p. 22, and the end of its proof, p. 24 (CCM23 line 1155); IKLNDP24, §3.3, opening, p. 36 (IKLNDP24 line 4065); CHANG14, Corollary 2.3.3 and Corollary 5.5.5, pp. 6 and 19 (CHANG14 line 234)).

The interface includes the following facts.

- z is Eulerian of weight w: z ∈ K·π̃^w.
- If c ∈ F̄_q(θ)^× and cπ̃^w ∈ C_const, then (q − 1) | w; in particular a nonzero Eulerian element of K_∞ of weight w has (q − 1) | w.
- Eulerian elements of weight w form a K-subspace of C_∞.
- ζ_A(q − 1) is Eulerian of weight q − 1.

One proof route is the following. |π̃|_∞ = q^(q/(q−1)) (§0.0 (Omega and period)), so v_∞(π̃^w) = −wq/(q − 1), an integer iff (q − 1) | wq iff (q − 1) | w, as gcd(q, q − 1) = 1. Elements of F̄_q(θ)^× and of C_const^× have integer valuations, so cπ̃^w ∈ C_const with c ≠ 0 forces v_∞(π̃^w) ∈ Z. π̃ ∈ ρ·K_∞^× with ρᑫ⁻¹ = −θ (from the product formula of §0.0 (Omega and period)), which shows that the restriction on the coefficient field cannot be dropped. C_const denotes the union of the finite constant-field Laurent series fields; no identification with the full Laurent series field over F̄_q is needed.

**Checks.**

- ζ_A(q − 1) = −D_1⁻¹π̃ᑫ⁻¹ is Eulerian of weight q − 1.
- 0 is Eulerian of every weight.
- For q > 2, ζ_A(1) is not Eulerian of weight 1, since π̃ ∉ K_∞.
- For q = 2, ζ_A(1) = −π̃/D_1 is Eulerian of weight 1.
- ζ_A(q − 1) is Eulerian of weight q − 1; for q = 2 every weight is divisible by q − 1.

*Needs:* §0.0 (Omega and period); §0.0 (Omega and period); §0.13.

### Examples

At q = 2, weight three has four compositions, but Iᵀ₃ = {(1,1,1),(2,1)} and IND₃ = {(1,1,1),(3)}. At q = 3, the six weight-four basis indices and their 46 alternating q-indivisible arrays distinguish the ordinary and alternating dimensions.

### Dependencies

The exact target needs above specify each mathematical object and proof-route input. Foundation inputs: §0.0 (Carlitz products), §0.0 (analytic field), §0.0 (Carlitz exponential and logarithm), §0.0 (Omega and period), §0.0 (Carlitz exponential and logarithm), §0.0 (Omega and period), §0.2 (depth-one power sums), §0.2 (power-sum degrees), Mathlib Composition, Mathlib FiniteField.sum_pow_units, Mathlib Polynomial.Monic, Mathlib RatFunc, Mathlib RatFunc.CompletionAtInfty, Mathlib RatFunc.inftyValuation, Mathlib Submodule.span.

## Layer 1: products and value algebras

The product identities retain correction coefficients and multiplicities in characteristic p. Coefficients of formal relations lie in K; their product structure constants lie in the prime field.

### 1.1 Chen’s correction coefficients

q = p^e; the coefficients are reduced modulo p. For positive integers a, b and 1 ≤ j < a + b, Δ^([j])_(a,b) = (−1)ᵃ⁻¹binom(j − 1, a − 1) + (−1)ᵇ⁻¹binom(j − 1, b − 1) ∈ F_p when (q − 1) | j, and Δ^([j])_(a,b) = 0 otherwise (binomial coefficients with a negative lower entry or lower entry above the upper are zero). Δ^([j])_(a,b) = Δ^([j])_(b,a), and Δ^([j])_(a,b) = 0 for all j when a + b ≤ q. Define the coefficient to be zero also outside the displayed range 0 < j < a+b. (ND21, §2.1, display after (2.1), p. 6 (ND21 line 265); CCM23, §2.3, (2.3.2), p. 9; Remark 2.3.4, p. 9 (CCM23 line 402); IKLNDP24, §4.1.1, (4.2), p. 44 (IKLNDP24 line 4656)).

The interface includes the following facts.

- Δ^([j])_(a,b) as an element of F_p (or of ZMod p).
- Δ^([j])_(a,b) = Δ^([j])_(b,a).
- Δ^([j])_(a,b) = 0 for every j when a + b ≤ q.
- Δ^([j])_(a,b) = 0 unless (q − 1) | j and 0 < j < a + b.

One proof route is the following. Symmetry is visible from the formula. If a + b ≤ q, the only j < a + b divisible by q − 1 is j = q − 1 with a + b = q; then binom(q − 2, a − 1) = binom(q − 2, b − 1) and the signs (−1)ᵃ⁻¹, (−1)ᵇ⁻¹ are opposite when q is odd (a + b = q odd), while for q even 2 = 0; so the coefficient vanishes.

**Checks.**

- For q = 2, Δ^([1])_(1,2) = 1 and Δ^([2])_(1,2) = 0.
- For q = 3, Δ^([2])_(2,2) = 1 in F_3.
- Δ^([q−1])_(1,q−1) = 0, the case a + b = q.
- The condition (q − 1) | j cannot be dropped: for q = 3, Δ^([1])_(1,2) = 0 although the binomial expression (−1)^0 binom(0, 0) + (−1)^1 binom(0, 1) equals 1.
- For q = 2, Δ^([1])_(1,2) = 1 and Δ^([2])_(1,2) = 0; for q = 3, Δ^([2])_(2,2) = −2 = 1.

*Needs:* §0.1; Mathlib `Nat.choose`.

### 1.2 Chen’s equal-degree product formula

a, b ≥ 1; ε, ε′ ∈ F_q^×. For positive integers a, b and every d ∈ Z, S_d(a)S_d(b) = S_d(a + b) + Σ_(0<j<a+b) Δ^([j])_(a,b) S_d(a + b − j, j). With characters, S_d(ε; a)S_d(ε′; b) = S_d(εε′; a + b) + Σ_j Δ^([j])_(a,b) S_d(εε′, 1; a + b − j, j) (Harada). In particular S_d(a)S_d(b) = S_d(a + b) when a + b ≤ q. (ND21, §2.1, (2.1) and the display after it, p. 6; Remark 2.2(2), p. 8 (ND21 line 265); CCM23, §2.3, (2.3.2), p. 9 (CCM23 line 402); IKLNDP24, §4.1.1, (4.1)–(4.2) and Remark 4.1, pp. 43–44 (IKLNDP24 line 4531)).

One proof route is the following. For d < 0 both sides vanish; for d = 0 there are no off-diagonal pairs and the depth-two sums vanish. For d ≥ 1 write S_d(a)S_d(b) as a sum over pairs (u, v) of monic degree-d polynomials; the diagonal u = v gives S_d(a + b). For u ≠ v set h = u − v, so 0 ≠ h has degree < d and both (u, h) and (v, h) parametrise the off-diagonal pairs; partial fractions give 1/(u^a v^b) = Σₘ₌₁ᵃ (−1)^b binom(a + b − m − 1, b − 1)/(u^m hᵃ⁺ᵇ⁻ᵐ) + Σₘ₌₁ᵇ (−1)ᵇ⁻ᵐ binom(a + b − m − 1, a − 1)/(v^m hᵃ⁺ᵇ⁻ᵐ), an integer identity valid in every characteristic. Every nonzero h of degree < d is uniquely cg with c ∈ F_q^× and g monic, so Σ_(0 ≠ h, deg h < d) h⁻ʲ = −S_(<d)(j) when (q − 1) | j and 0 otherwise (Mathlib FiniteField.sum_pow_units). Writing j = a + b − m for the exponent of h, the u-sum and the v-sum combine (using that j is even when q is odd, so the signs match) into exactly Δ^([j])_(a,b)S_d(a + b − j)S_(<d)(j) = Δ^([j])_(a,b)S_d(a + b − j, j). Characters: every monic of degree d carries ε^d, ε′^d, giving the factor (εε′)^d on both sides; the low-weight case is §1.1.

**Checks.**

- For q = 2, S_d(1)S_d(2) = S_d(3) + S_d(2, 1), and for q = 3, S_d(2)² = S_d(4) + S_d(2, 2) .
- S_d(1)² = S_d(2) for every q.

*Needs:* §1.1; §0.2; Mathlib `FiniteField.sum_pow_units`.

### 1.3 The index space and the q-shuffle product

Coefficients in K; Δ from §1.1. Work in native `Finsupp` on the positive-index carrier, denoted H, with H_w its weight-w subspace, [s] its basis vector and Supp(P) its finite support. Use the multilinear concatenation from PeriodsAndSpecialValues §PS.9.2, so [s,0] = 0 while [s,∅] = [s]. The box-plus map ⊞ : H × H → H is bilinear with ∅ ⊞ P = P ⊞ ∅ = 0 and s ⊞ n = (s_+, s_r + n_1, n_−). Let ∗ = ∗ᴸⁱ be the integral extension of the supplied ordered merges, specialised to K. The q-shuffle product ∗^ζ has the same unit and recursion plus the correction D^ζ_(s,n) = Σⱼ₌₁^(s_1+n_1−1) Δ^([j])_(s_1,n_1)[s_1 + n_1 − j, (j) ∗^ζ (s_− ∗^ζ n_−)] (Dᴸⁱ := 0). The q-shuffle product is commutative, preserves weight, and every u in its support has max(dep s,dep n) ≤ dep u ≤ dep s + dep n; the harmonic statements follow by integral coefficient extension of the same ordered-merge combinatorics. (CCM23, §2.1, Definition 2.1.4 and Remark 2.1.5, pp. 6–7; §2.3, pp. 8–9; Definition 3.1.1 and Remark 3.1.2, pp. 10–11; Proposition A.1.1 and Corollary A.1.2, pp. 26–27 (CCM23 line 250)).

Construct the coefficient extension of the ordered-merge multiplicities of PeriodsAndSpecialValues §PS.9.2: for every commutative ring R, its product on positive-index words with coefficients in R is obtained by mapping each integer multiplicity along ℤ → R. Prove compatibility with every ring homomorphism R → S, associativity, commutativity, the empty-index unit, weight homogeneity and the depth bounds, by the same ordered-merge bijections. No map ℚ → R is used. This is an extension of the supplied rational presentation, with the same words and merge operation (CCM23 Definition 2.3.3 and Proposition 2.3.5, CCM23 line 402).

The interface includes the following facts.

- s ⊞ n = (s_+, s_r + n_1, n_−), ∅ ⊞ P = 0.
- The q-shuffle product ∗^ζ with correction D^ζ.
- The q-shuffle product of P and Q equals the q-shuffle product of Q and P.
- The q-shuffle product sends H_w × H_(w′) to H_(w+w′).
- Every support index of the q-shuffle product has depth between the maximum and sum of the two input depths.
- D^ζ_(s,n) = 0 when s_1 + n_1 ≤ q.

One proof route is the following. The q-shuffle product is defined by recursion on dep(s) + dep(n); the harmonic product uses the supplied ordered merges; the correction term only calls products of smaller total depth. Weight homogeneity and the depth bounds follow by induction on dep(s) + dep(n) (Chang–Chen–Mishiba Proposition A.1.1, Corollary A.1.2). Commutativity of the q-shuffle follows from the symmetry of its recursion and of Δ^([j])_(a,b). If s_1 + n_1 ≤ q then D^ζ_(s,n) = 0, so the two products agree on indices with all entries summing below q at each step.

**Checks.**

- [1] ∗ [1] = 2[1, 1] + [2].
- [∅] ∗^• P = P for both products.
- For q = 2, [1] ∗^ζ [2] = [1, 2] + [3].
- (n) ⊞ P is not [n] + P: (2) ⊞ [1, 1] = [3, 1].
- [1] ∗ [1] = 2[1, 1] + [2]; for q = 2, [1] ∗^ζ [2] = [1, 2] + [2, 1] + [3] + [2, 1] = [1, 2] + [3] (characteristic 2 coefficients).

*Needs:* PeriodsAndSpecialValues §PS.9.2 (ordered merges); §0.1; §1.1; Mathlib `Finsupp`.

### 1.4 The realisation maps

H from §1.3. For • ∈ {Li, ζ}, put Sᴸⁱ_d(s) = ℓ_d⁻ˢ and S^ζ_d(s) = S_d(s) (d ≥ 0). The K-linear maps 𝔏^•_d, 𝔏^•_(<d) : H → K and 𝔏^• : H → K_∞ are given on indices of positive depth by the sums of S^•_(d_1)(s_1)⋯S^•_(d_r)(s_r) over d = d_1 > ⋯ > d_r ≥ 0 (requiring d ≥ dep(s) − 1), over d > d_1 > ⋯ > d_r ≥ 0, and over all d_1 > ⋯ > d_r ≥ 0; on ∅, 𝔏^•_d(∅) = 1 iff d = 0, 𝔏^•(∅) = 1, and 𝔏^•_(<d)(∅) = 1 for every d ∈ Z. Then 𝔏^•_d = 𝔏^•_(<d+1) − 𝔏^•_(<d) on positive-depth indices, 𝔏^• = lim_d 𝔏^•_(<d), 𝔏^•_d(s)𝔏^•_(<d)(P) = 𝔏^•_d([s, P]) for s ≥ 1, 𝔏ᴸⁱ(s) = Li(s) and 𝔏^ζ(s) = ζ_A(s). (CCM23, Definition 2.2.2 and the identities after it, pp. 7–8 (CCM23 line 293)).

The interface includes the following facts.

- 𝔏^•_d : H → K.
- 𝔏^•_(<d) : H → K.
- 𝔏^• : H → K_∞.
- 𝔏^•(P) = lim_(d → ∞) 𝔏^•_(<d)(P).
- 𝔏^•_d(s)𝔏^•_(<d)(P) = 𝔏^•_d([s, P]) for s ≥ 1.
- 𝔏^ζ(s) = ζ_A(s) and 𝔏ᴸⁱ(s) = Li(s).

One proof route is the following. The sums are finite for 𝔏_d, 𝔏_(<d) and converge in K_∞ for 𝔏 by §0.3 and §0.6. The listed identities are rearrangements of these sums; the tail identity uses the empty-truncation convention.

**Checks.**

- 𝔏^•(∅) = 1 and 𝔏^•_d(∅) = 0 for d ≠ 0.
- 𝔏ᴸⁱ(s) = 𝔏^ζ(s) for s = (1, 2) and q ≥ 2.
- For q = 3, 𝔏ᴸⁱ(4) − 𝔏^ζ(4) begins θ⁻⁶, so the two realisations are distinct maps despite having equal weight spans.
- 𝔏^•_0(s) = 0 for every s of depth ≥ 2.
- 𝔏^ζ_d(s) = 𝔏ᴸⁱ_d(s) whenever all entries of s are ≤ q (§0.8).

*Needs:* §1.3; §0.2; §0.3; §0.6.

### 1.5 The realisations are algebra homomorphisms

Products and realisations from §1.3 and §1.4. For • ∈ {Li, ζ}, all P, Q ∈ H, all positive-depth indices s, n and every d ∈ Z: 𝔏^•(P)𝔏^•(Q) = 𝔏^•(P ∗^• Q); 𝔏^•_(<d)(P)𝔏^•_(<d)(Q) = 𝔏^•_(<d)(P ∗^• Q); and 𝔏^•_d(s)𝔏^•_d(n) = 𝔏^•_d([s_1 + n_1, s_− ∗^• n_−]) + 𝔏^•_d(D^•_(s,n)). Thus ∗ realises the stuffle relations of CMPL values and ∗^ζ realises Thakur’s q-shuffle relations of MZVs. (CCM23, Proposition 2.3.5 and its proof, pp. 9–10 (CCM23 line 402); THAKUR10, Theorem 3, p. 1978 (THAKUR10 line 205)).

One proof route is the following. The fixed-degree formula reduces to depth one: for • = Li, ℓ_d^(−s_1)ℓ_d^(−n_1) = ℓ_d^(−(s_1+n_1)); for • = ζ, §1.2. The truncated formula is proved by induction on d, splitting 𝔏^•_(<d)(s)𝔏^•_(<d)(n) according to which leading degree is larger, using the fixed formula for equal leading degrees and the induction hypothesis for the tails. The value formula follows by letting d → ∞. At d = 0 the tail factor must be read with 𝔏^•_(<0)(∅) = 1; the identities themselves hold as stated.

**Checks.**

- 𝔏^ζ((1))² = 𝔏^ζ(2[1, 1] + [2]), i.e. ζ_A(1)² = ζ_A(2) + 2ζ_A(1, 1).

*Needs:* §1.3; §1.4; §1.2.

### 1.6 Controlled product expansions of power sums

Arrays of positive depth; characters in F_q^×. For arrays (ε; s), (ε′; t) there are finitely many coefficients and arrays, independent of d, such that for every d ∈ Z: (1) S_d(ε; s)S_d(ε′; t) = Σ f_i S_d(μ_i; u_i), (2) S_(<d)(ε; s)S_(<d)(ε′; t) = Σ f′_i S_(<d)(μ′_i; u′_i), (3) S_d(ε; s)S_(<d)(ε′; t) = Σ f″_i S_d(μ″_i; u″_i), with coefficients in F_p for indices (trivial characters; Thakur, Ngo Dac) and in F_q for arrays (as Im–Kim–Le–Ngo Dac–Pham state; the same induction gives F_p), every array ≤ (ε; s) + (ε′; t) in the preorder of §0.1 (so of the same character and weight) and of depth ≤ dep(s) + dep(t); the same holds for Si in place of S, where the expansion is the stuffle expansion. For trivial characters and nonempty a, the mixed expansion has the form S_d(a)S_(<d)(b) = Σ f″_i S_d(a_1, c_i) with c_i ≤ a_− + b. (ND21, Proposition 2.1 and its proof, pp. 6–8; (2.7), p. 8 (ND21 line 265); IKLNDP24, Proposition 1.3 and its proof, pp. 10–14; Proposition 4.2, p. 44 (IKLNDP24 line 597); THAKUR10, Theorem 3, p. 1978 (THAKUR10 line 205); THAKUR-UPDATES, Entry 36, pp. 7–8 (THAKUR-UPDATES line 276)).

One proof route is the following. Induct on dep(s) + dep(t) as in Thakur 2010 Theorem 3 (with the corrected induction) and Ngo Dac Proposition 2.1: the base case is §1.2 (for S) or the identity Si_d(ε; s)Si_d(ε′; t) = Si_d(εε′; s + t) (for Si). The author’s correction, credited to Shuhui Shi, proves the mixed identity first at each depth, then the equal-degree identity; use that order. For (1) factor off the leading entries and expand the tails by (2); for (2) split by the larger leading degree; (3) follows from (2). Each step preserves character and weight and keeps the prefix sums dominated, using the calculus of §0.1.

**Checks.**

- For q = 3, S_1(1)S_1(1) = S_1(2).

*Needs:* §0.1; §0.2; §1.2.

### 1.7 The algebras of zeta and polylogarithm values

Weight spaces from §0.9. Z = Σ_w Z_w, AZ = Σ_w AZ_w, L = Σ_w L_w and AL = Σ_w AL_w are K-subalgebras of K_∞, and Z_w Z_(w′) ⊂ Z_(w+w′), AZ_w AZ_(w′) ⊂ AZ_(w+w′), L_w L_(w′) ⊂ L_(w+w′), AL_w AL_(w′) ⊂ AL_(w+w′); the product of two values is an F_p-combination (F_q for alternating values) of values of the added weight and of depth at most the sum of the depths. (THAKUR10, Theorem 3(ii)–(iii), p. 1978 (THAKUR10 line 205); IKLNDP24, §1.1, after Proposition 1.3, p. 14; §4.1.1, after Proposition 4.2, p. 44 (IKLNDP24 line 1643); CCM23, §1.2, p. 2 (CCM23 line 53)).

The headline `zeta_space_mul_le` states the two inclusions Z_w Z_(w′) ⊂ Z_(w+w′) and AZ_w AZ_(w′) ⊂ AZ_(w+w′) for all w, w′ ≥ 0, as inclusions of K-submodules of K∞ under the product of submodules; weight zero is the scalar space K.

One proof route is the following. Sum the expansions of §1.6 over d: ζ_A(ε; s)ζ_A(ε′; t) = Σ_(d,e)S_d S_e splits by d > e, d < e and d = e into values of concatenated or summed arrays. Equivalently apply §1.5 to [s] ∗^• [n].

**Checks.**

- Unit: ζ_A(∅) = 1 lies in Z_0 = K and ζ_A(∅)ζ_A(s) = ζ_A(s) has weight 0 + wt(s); likewise Li(∅) = 1 in L_0. A definition of Z as Σ_(w≥1) Z_w would omit 1 and give no unital subalgebra.
- For q = 3, ζ_A(1)² = ζ_A(2) + 2ζ_A(1, 1) in Z_2, of depth at most 1 + 1. The uncorrected guess ζ_A(1)² = ζ_A(2) fails: the difference 2ζ_A(1, 1) has leading term 2S_1(1) = 2ℓ_1⁻¹, of valuation 3. All entries are ≤ q, so the same identity reads Li(1)² = Li(2) + 2Li(1, 1) in L_2.
- For q = 2, ζ_A(1)ζ_A(2) = ζ_A(3) + ζ_A(1, 2), the realisation of [1] ∗^ζ [2] = [1, 2] + [3]. Applying the stuffle expansion [1, 2] + [2, 1] + [3] to MZVs would add ζ_A(2, 1) ≠ 0 (§0.5); the stuffle expansion is the one realised by CMPLs, Li(1)Li(2) = Li(1, 2) + Li(2, 1) + Li(3).
- Alternating values, q = 3: ζ_A(−1; 1)² = ζ_A(2) + 2ζ_A(−1, −1; 1, 1) in AZ_2. The product of two values of character −1 is a combination of arrays of character 1, and the q-shuffle correction vanishes here because q − 1 = 2 does not divide 1.

*Needs:* §0.9; §1.6; §1.5.

### 1.8 Period powers lie in the weight spaces

D_1 = θ^q − θ. For w = m(q − 1) with m ≥ 1, π̃^w = (−D_1)^m ζ_A(q − 1)^m = (−D_1)^m Li(q − 1)^m, and this element lies in Z_w ∩ L_w; for w = 0, π̃^0 = 1 ∈ Z_0 = K. (CCM23, proof of Theorem 5.2.1, p. 25 (CCM23 line 1370); IKLNDP24, proof of Theorem 3.4, last step, p. 42 (IKLNDP24 line 4453)).

One proof route is the following. §0.13 gives π̃ᑫ⁻¹ = −D_1 ζ_A(q − 1) = −D_1 Li(q − 1). Raise to the m-th power and use §1.7: ζ_A(q − 1)^m ∈ Z_(m(q−1)) and Li(q − 1)^m ∈ L_(m(q−1)).

**Checks.**

- For q = 2, π̃^w ∈ Z_w for every w ≥ 1.

*Needs:* §0.13; §1.7.

### Examples

At q = 2, [1] ∗ [2] = [1,2] + [2,1] + [3], whereas [1] ∗ᶻ [2] = [1,2] + [3]. At q = 3, the coefficient of S_d(2,2) in S_d(2)² is −2 = 1, so an uncorrected stuffle formula gives the wrong zeta product.

### Dependencies

Earlier layer 0. The exact target needs above specify each mathematical object and proof-route input. External inputs: PeriodsAndSpecialValues §PS.9.2 (ordered merges), Mathlib FiniteField.sum_pow_units, Mathlib Finsupp, Mathlib Nat.choose.

## Layer 2: binary relations and generation

The operators act on identities at every integer degree, including degree −1. Their purpose is the mathematical generation theorem and its integral transition congruences.

### 2.1 Binary relations between power sums

Coefficients in K; the identity is required for every integer d, including negative d. Fix a realisation (Thakur power sums S_d, or Carlitz power sums Si_d, of arrays). A binary relation of weight w is a pair of finitely supported K-coefficient families (a_i) on arrays (ε_i; s_i) and (b_j) on arrays (ε′_j; t_j), all of weight w, such that Σ_i a_i S_d(ε_i; s_i) + Σ_j b_j S_(d+1)(ε′_j; t_j) = 0 for every d ∈ Z; it is fixed when every b_j = 0. They form a K-vector space BR_w. In the formal setting of §§1.3–1.4, P^• = {(P, Q) ∈ H ⊕ H : 𝔏^•_d(P) + 𝔏^•_(d+1)(Q) = 0 for all d ∈ Z} and P^•_w = P^• ∩ (H_w ⊕ H_w), both entries homogeneous of weight w. Summing over d, a binary relation gives the linear relation Σ a_i ζ_A(ε_i; s_i) + Σ b_j ζ_A(ε′_j; t_j) = 0 (resp. with Li, resp. 𝔏^•(P) + 𝔏^•(Q) = 0). (ND21, Definition 2.3 and Remark 2.4, pp. 8–9 (ND21 line 392); IKLNDP24, Definition 1.4, p. 14; Definition 4.3, p. 44 (IKLNDP24 line 1643); CCM23, Appendix A.2, (A.2.1)–(A.2.2), p. 27 (CCM23 line 1465)).

The interface includes the following facts.

- A binary relation of weight w in a fixed realisation.
- A binary relation is fixed precisely when all its shifted coefficients vanish.
- Summing over d gives Σ a_i ζ_A(ε_i; s_i) + Σ b_j ζ_A(ε′_j; t_j) = 0.
- BR_w is a K-vector space.
- P^•_w ⊂ H_w ⊕ H_w.

One proof route is the following. BR_w and P^•_w are subspaces since the defining identities are linear. Summation: Σ_(d ∈ Z)(Σ a_i S_d + Σ b_j S_(d+1)) = Σ a_i ζ_A(ε_i; s_i) + Σ b_j ζ_A(ε′_j; t_j), the shift d ↦ d + 1 being harmless over all of Z (Ngo Dac Remark 2.4).

**Checks.**

- The weight-zero pair ([∅],−[∅]) has R(−1)=−1 and R(0)=1. Its summed value relation is 1−1=0, but it is not a binary relation; summing identities is a one-way implication.
- ([q], −ℓ_1[1, q − 1]) lies in P^ζ_q and in Pᴸⁱ_q.
- The zero pair is a fixed binary relation of every weight.
- For q = 2, S_d(2) + S_(d+1)(1, 1) = 0 fails at d = 0 (it equals 1 + (θ² + θ)⁻¹), while S_d(2) + D_1 S_(d+1)(1, 1) = 0 holds for every d: the identity is required for every d with the exact coefficients.
- A pair whose entries have different weights is not in any P^•_w.
- R_1 of §2.2 is a binary relation of weight q that is not fixed.

*Needs:* §0.2; §1.4.

### 2.2 Thakur’s fundamental relation R_1

d ∈ Z; ε ∈ F_q^×. For every d ∈ Z, S_d(q) + D_1 S_(d+1)(1, q − 1) = 0 and Si_d(q) + D_1 Si_(d+1)(1, q − 1) = 0, where D_1 = θ^q − θ = −ℓ_1; with characters, Si_d(ε; q) + ε⁻¹D_1 Si_(d+1)(ε, 1; 1, q − 1) = 0 (the relation R_ε), and the same for S. Hence ζ_A(q) + D_1 ζ_A(1, q − 1) = 0 = Li(q) + D_1 Li(1, q − 1). (THAKUR09R, Theorem 5, §2.7.7, p. 2326, and its proof, §3.4.6, p. 2332 (THAKUR09R line 274); ND21, (2.8), p. 8 (ND21 line 392); IKLNDP24, §1.2, relation R_ε, p. 14; §4.1.2, p. 44 (IKLNDP24 line 1643); CCM23, Example A.2.3, p. 27 (CCM23 line 1465); LRT14, Theorem 3.1(2), p. 3 (LRT14 line 105)).

One proof route is the following. For d < 0 both terms vanish. For d ≥ 0, Si_(d+1)(1, q − 1) = ℓ_(d+1)⁻¹Σⱼ₌₀ᵈℓ_j¹⁻ᑫ, and one proves Σⱼ₌₀ᵈℓ_j¹⁻ᑫ = −(θ − θ^(qᵈ⁺¹))/(D_1 ℓ_dᑫ⁻¹) by induction on d: for d = 0 both sides are 1, and the inductive step reduces to −(θ − θ^(qᵈ⁺¹))^q + θ^q − θ = θ^(qᵈ⁺²) − θ. Since ℓ_(d+1) = ℓ_d(θ − θ^(qᵈ⁺¹)), this gives D_1 Si_(d+1)(1, q − 1) = −ℓ_d⁻ᑫ = −Si_d(q). The S version follows by §0.8, all entries being ≤ q; the character version multiplies both terms by ε^d. Sum over d (§2.1).

**Checks.**

- For q = 2, ζ_A(2) = D_1 ζ_A(1, 1) (signs are irrelevant in characteristic 2); the constant and first nonconstant coefficients of both sides are 1 and 1.

*Needs:* §0.2; §0.8; §2.1; §0.0 (Carlitz products).

### 2.3 Todd’s operators B*, C and the cancellation operator BC

Binary relations from §2.1; expansions from §1.6. Let R be a binary relation of weight w, R(d): Σ a_i S_d(ε_i; s_i) + Σ b_j S_(d+1)(ε′_j; t_j) = 0. For an array (σ; v) of depth one, B*_(σ,v)(R) is the fixed relation of weight w + v obtained from S_d(σ; v)·Σ_(e<d)R(e), namely Σ a_i S_d(σ, ε_i; v, s_i) + Σ b_j S_d(σ, ε′_j; v, t_j) + Σ b_j S_d(σ; v)S_d(ε′_j; t_j) = 0, the last product expanded by §1.6; B*_(Σ,V) = B*_(σ_1,v_1) ∘ ⋯ ∘ B*_(σ_n,v_n) (B*_0 is not defined). For an array (Σ; V) of weight v, C_(Σ,V)(R) is the binary relation of weight w + v obtained from R(d)·S_(<d+1)(Σ; V). For ε ∈ F_q^×, BC_(ε,q)(R) = B*_(ε,q)(R) − Σ_j b_j C_(ε′_j,t_j)(R_ε), whose equal-degree terms cancel, leaving Σ a_i S_d(ε, ε_i; q, s_i) + Σ bⱼₖ S_(d+1)(ε, ε″ⱼₖ; 1, tⱼₖ) = 0 with (ε″ⱼₖ; tⱼₖ) ≤ (1; q − 1) + (ε′_j; t_j). In the formal setting the same operators B^•_s, C^•_s and BC^(•,m)_q (m-fold iterate, BC^(•,m)_q(P, Q) = ([q^({m}), P], L_1^m α^(•,m)_q(Q))) act on H_(>0) ⊕ H_(>0). (ND21, §2.2: B*_v and Proposition 2.5, p. 9; Corollaries 2.6–2.7, p. 9; C_W and Proposition 2.8, p. 10; BC_q and Proposition 2.10, p. 11 (ND21 line 457); IKLNDP24, §1.2.1–1.2.3, pp. 14–17; Lemma 1.5, p. 15; §4.1.2, pp. 45–47 (IKLNDP24 line 1643); CCM23, Appendix A.3, definitions before Proposition A.3.1 and the proposition, pp. 27–29 (CCM23 line 1465)).

The interface includes the following facts.

- B*_(σ,v)(R), a fixed relation of weight w + v.
- C_(Σ,V)(R), a binary relation of weight w + wt(V).
- BC_(ε,q)(R) = B*_(ε,q)(R) − Σ_j b_j C_(ε′_j,t_j)(R_ε).
- On a fixed relation B*_(σ,v) prepends (σ; v).
- If v + (t_j)_1 ≤ q for all j the product term is S_d(σε′ⱼ₁; v + tⱼ₁, …).
- The shifted part of BC_(ε,q)(R) is supported on (ε, ·; 1, u) with u ≤ (q − 1) + t_j.
- B^•_s, C^•_s and BC^(•,m)_q map P^•_w into P^•_(w+wt(s)) and P^•_(w+mq).

One proof route is the following. B*: multiply Σ_(e<d)R(e) = Σ a_i S_(<d)(ε_i; s_i) + Σ b_j (S_(<d) + S_d)(ε′_j; t_j) by S_d(σ; v) and use S_d(σ; v)S_(<d)(x) = S_d(σ, x). C: multiply R(d) by S_(<d+1)(Σ; V) = S_(<d)(Σ; V) + S_d(Σ; V) and expand by §1.6; coefficients stay in K, only the structure constants lie in F_p. BC: by definition of C on R_ε, the terms S_d(ε, ε′_j; q, t_j) + S_d(ε; q)S_d(ε′_j; t_j) of B*_(ε,q)(R) cancel; what remains is the fixed part and the shifted part −Σ b_j ε⁻¹D_1 S_(d+1)(ε; 1)S_(<d+1)(1; q − 1)S_(<d+1)(ε′_j; t_j). Small heads: if v + (t_j)_1 ≤ q for every j then S_d(σ; v)S_d(ε′_j; t_j) = S_d(σε′ⱼ₁; v + tⱼ₁, …), and if R is fixed then B*_(σ,v) only prepends (σ; v) (Ngo Dac Corollaries 2.6–2.7; Im–Kim–Le–Ngo Dac–Pham Lemmas 1.5 and 4.4). Each operator sends binary relations to binary relations of the shifted weight (Chang–Chen–Mishiba Proposition A.3.1).

**Checks.**

- B*_1(R_1) is the fixed relation S_d(1, q) + D_1 S_d(1, 1, q − 1) + D_1 S_d(2, q − 1) = 0, the last term coming from S_d(1)S_d(1, q − 1) = S_d(2, q − 1) by the small-head rule 1 + 1 ≤ q.
- C_∅ is the identity, and B*_∅ is the identity.
- B*_0 is not defined: the operator needs a positive head v ≥ 1.
- For q = 2, C₍₁₎(R_1) has the coefficient θ² − θ on S_(d+1)(1, 2): the coefficients of C lie in K, not in F_p.
- BC_q(R_1) = B*_(q)(R_1) − D_1C_((1,q−1))(R_1), the coefficient D_1 being the shifted coefficient b of R_1; its fixed part is S_d(q, q). At q = 2 and d = 1 the fixed parts of B*_(2)(R_1), C_((1,1))(R_1) and S_1(2, 2) are 0, D_1⁻³ and D_1⁻², and indeed 0 − D_1·D_1⁻³ = D_1⁻² in characteristic two.
- Subtracting C_((1,q−1))(R_1) without the coefficient D_1 leaves (D_1 − 1)(S_d(q, 1, q − 1) + S_d(q)S_d(1, q − 1)) in the fixed part besides S_d(q, q): at q = 2 and d = 1 its fixed part is 0 − D_1⁻³ ≠ D_1⁻², and the formal coefficient of [2, 1, 1] is D_1 − 1 instead of 0.

*Needs:* §2.1; §2.2; §1.6; §1.3.

### 2.4 The controlled form of C_W(R_1)

W, (Σ; V) nonempty; R_1, R_ε from §2.2. For a nonempty index W = (w_1, W_−), C_W(R_1) has the form S_d(q + w_1, W_−) + Σ_i a_i S_d(s_i) + Σ_i b_i S_(d+1)(1, t_i) = 0 with a_i, b_i ∈ K, s_i ≤ (q) + W and (s_i)_1 < q + w_1, and t_i ≤ (q − 1) + W. For arrays (Im–Kim–Le–Ngo Dac–Pham Proposition 1.6), C_(Σ,V)(R_ε) = Si_d(εσ_1, Σ_−; q + v_1, V_−) + Si_d(ε, Σ; q, V) + Σ_i b_i Si_(d+1)(ε, ε_i; 1, t_i) with b_i ∈ A divisible by D_1 and (ε_i; t_i) ≤ (1; q − 1) + (Σ; V). (ND21, Lemma 2.9 and its proof, p. 10 (ND21 line 554); IKLNDP24, Proposition 1.6 and its proof, p. 16; Proposition 4.5, p. 46 (IKLNDP24 line 2082)).

One proof route is the following. By the definition of C, C_W(R_1) is S_d(q, W) + S_d(q)S_d(W) + D_1 S_(d+1)(1)S_(<d+1)(q − 1)S_(<d+1)(W) = 0. Expand S_d(q)S_d(W) by §1.6: the leading term is S_d(q + w_1, W_−), the others have first entry < q + w_1 and are ≤ (q) + W; the term S_d(q, W) also joins the a_iS_d(s_i), since (q, W) ≤ (q) + W and its first entry is q < q + w_1. Expand S_(<d+1)(q − 1)S_(<d+1)(W) by §1.6 into S_(<d+1)(t_i) with t_i ≤ (q − 1) + W, and absorb S_(d+1)(1). For Si the product Si_d(ε; q)Si_d(Σ; V) is exactly Si_d(εσ_1, Σ_−; q + v_1, V_−), so no further terms appear, and the shifted coefficients are ε⁻¹D_1 times F_q-structure constants, hence in D_1A.

**Checks.**

- For W = (1), C₍₁₎(R_1) has leading term S_d(q + 1).

*Needs:* §2.3; §2.2; §1.6.

### 2.5 The reduction step for a bad index

s_k > q in case (1); s_k = q terminal in case (2). (1) Let s = (s_1, …, s_r) with s_1, …, sₖ₋₁ ≤ q and s_k > q. Then ζ_A(s) = Σ a_i ζ_A(s′_i) + Σ b_i ζ_A(t′_i) + Σ c_i ζ_A(u_i) with a_i, b_i, c_i ∈ K, every index t on the right has dep(t) ≥ dep(s) and T_k(t) ≤ T_k(s), and: type 1 indices have Init(s′) ≻ Init(s), or Init(s′) = Init(s) and s′_k < s_k; type 2 indices have t′_1 + ⋯ + t′_ℓ < s_1 + ⋯ + s_ℓ for k ≤ ℓ ≤ dep(s); type 3 indices have Init(u) ≻ Init(s). (2) If every entry of s is ≤ q and s_k = q is the last entry (k = r), the same holds with only types 2 (prefix sums up to k strictly smaller) and 3. (3) For arrays and the Si (Im–Kim–Le–Ngo Dac–Pham Proposition 1.7(1)), with any chosen ε ∈ F_q^×: Li(ε; s) = −Li(ε′; s′) + Σ b_i Li(ε′_i; t′_i) + Σ c_i Li(μ_i; u_i), with b_i, c_i ∈ A divisible by D_1 and the single type-1 array (ε′; s′) = (ε_1, …, εₖ₋₁, ε, ε⁻¹ε_k, εₖ₊₁, …; s_1, …, sₖ₋₁, q, s_k − q, sₖ₊₁, …); every array on the right has depth ≥ dep(s) and T_k ≤ T_k(s), the type-1 and type-2 arrays have prefix sums strictly smaller than those of s at every length ℓ with k ≤ ℓ ≤ dep(s), and type-3 arrays have Init(u) ≻ Init(s). When Init(s) = s and the last entry is q (Proposition 1.7(2)) there is no type-1 term. (4) For the S of arrays (Proposition 4.6) the same holds except that type 1 is a K-combination Σ a_i ζ_A(ε′_i; s′_i) with Init(s′_i) ≽ Init(s) and (s′_i)_k < s_k, all coefficients lying in K. (ND21, Propositions 2.12–2.13 and their proofs, pp. 11–14 (ND21 line 647); IKLNDP24, Proposition 1.7 and its proof, pp. 17–21; Proposition 4.6, pp. 47–52 (IKLNDP24 line 2286)).

One proof route is the following. Put W = (s_k − q, sₖ₊₁, …, s_r) and start from C_W(R_1) (§2.4), whose leading term is S_d(s_k, …, s_r); for (3) start from C_(Σ,V)(R_ε) with the chosen ε, whose second term is the type-1 array. Let j < k be maximal with s_j < q (s_0 := 0), so sⱼ₊₁ = ⋯ = sₖ₋₁ = q; apply BC_q k − j − 1 times, controlling the shifted indices by t ≤ (q^({k−j−1}), s_k − 1, sₖ₊₁, …). If j ≥ 1 apply B*_(s_j) (small-head rule, as s_j < q) and then B*_(s_1) ∘ ⋯ ∘ B*_(sⱼ₋₁) (fixed relations); if j = 0 skip B*_(s_j) and sum the relation directly, then sum over d. The three families of terms are the three types; their properties follow from the support bounds of §1.6 and the dominance calculus of §0.1. For (2) use W = ∅ (C_∅(R_1) = R_1); for (3) run the same construction with R_ε and the chosen ε, noting that the C-terms of Si carry no extra fixed terms and that every coefficient stays in D_1A.

**Checks.**

- For s = (q + 1), summing C₍₁₎(R_1) over d gives ζ_A(q + 1) = −ζ_A(q, 1) − ζ_A(2, q − 1) − D_1(ζ_A(1, q − 1, 1) + ζ_A(1, 1, q − 1) + ζ_A(1, q)); the term ζ_A(2, q − 1) comes from S_d(q)S_d(1) = S_d(q + 1) + S_d(2, q − 1) (§1.2, Δ^([q−1])_(q,1) = binom(q − 2, 0) = 1). Here (q, 1) is the type-1 index and the four others are of type 2, their first entries 2 and 1 being smaller than q + 1; a type-2 index need not begin with 1. At q = 3 and d = 0 the fixed-degree relation reads 1 + 0 + 0 + D_1ℓ_1⁻¹ = 0. At q = 2 the two copies of ζ_A(2, 1) and of ζ_A(1, 1, 1) cancel and the relation is ζ_A(3) = D_1ζ_A(1, 2), as in §2.9.

*Needs:* §2.4; §2.3; §2.1; §0.1.

### 2.6 Reduction to k-admissible indices

k ≥ 1. For every k ≥ 1 and every index s, ζ_A(s) is a K-linear combination of ζ_A(t) with t k-admissible, wt(t) = wt(s), dep(t) ≥ dep(s) and T_k(t) ≤ T_k(s). The same holds for Li(ε; s) and for ζ_A(ε; s) in terms of k-admissible arrays of the same weight. The reduction terminates: at fixed weight and fixed k, each step strictly decreases (s_1 + ⋯ + s_k; reverse lexicographic rank of Init(s) in the finite set of initial tuples of weight ≤ w; the entry after Init(s)) in the lexicographic order. (ND21, Definition 3.1 and Proposition 3.2 with its proof, pp. 14–16 (ND21 line 828); IKLNDP24, Proposition 1.9 and its proof, pp. 21–23; Proposition 4.7, pp. 52–54 (IKLNDP24 line 2845)).

One proof route is the following. For ζ_A(s), induct on k; for the array versions the cited statements give only “same weight, k-admissible”, the depth and T_k bounds holding by the same proof. For k = 1: if s_1 ≤ q then s is 1-admissible or s = (q), handled by R_1; if s_1 > q use C_((s_1 − q, s_2, …))(R_1) and induct on s_1. For k ≥ 2 assume the statement for k − 1, so s may be taken (k − 1)-admissible but not k-admissible, hence dep(s) ≥ k; induct on s_1 + ⋯ + s_k. Apply §2.5 (case (1) or (2)); type 2 terms have smaller s_1 + ⋯ + s_k and are handled by induction; terms with equal sum are of type 1 or 3, with Init weakly increasing. Init(s) ≼ q^({k}) lies in a finite set, so Init eventually stabilises; then only type 1 steps occur and the entry after Init strictly decreases, which cannot continue forever.

**Checks.**

- k = w applied to an index of weight w gives indices in I^T_w (§0.1).

*Needs:* §2.5; §2.2; §0.1.

### 2.7 Brown’s theorem in positive characteristic

w ≥ 1. For every w ≥ 1, the family {ζ_A(s) : s ∈ I^T_w} spans Z_w over K; hence dim_K Z_w ≤ d(w) (Ngo Dac’s Theorem A). Likewise AT_w spans AL_w (the weak Brown theorem for ACMPLs), {ζ_A(ε; s) : (ε; s) ∈ AT_w} spans AZ_w, and {Li(s) : s ∈ I^T_w} spans L_w (trivial characters). The proof supplies a finite homogeneous expression for every value. (ND21, Theorem A, p. 3, and its proof, p. 16 (ND21 line 120); IKLNDP24, Proposition 1.10, p. 24; Proposition 4.8, p. 54 (IKLNDP24 line 3228); CCM23, Remark 1.2.5, p. 3 (CCM23 line 102)).

The headline signatures are `brown_spanning` and `alternating_brown_spanning`.

One proof route is the following. Apply §2.6 with k = w; a w-admissible index of weight w lies in I^T_w (§0.1). |I^T_w| = d(w) by §0.12. The alternating and CMPL versions are the same argument with the array forms of the reduction step; the CMPL version is the trivial-character specialisation of the ACMPL one, the operators preserving characters.

At weight zero the two headline spanning statements have the single empty array with value 1 and span K, in agreement with the native signatures.

**Checks.**

- For q = 2 the finite reduction gives ζ_A(3) = (θ² + θ)²(ζ_A(1, 1, 1) + ζ_A(2, 1)) .
- For w < q, I^T_w = IND_w is the set of all compositions of w; at w = q both exclude only (q), and the theorem reduces to R_1.

*Needs:* §2.6; §0.12; §0.9; §0.10.

### 2.8 The bridge between zeta values and polylogarithm values

w ≥ 0. For every w ≥ 0, AZ_w = AL_w and Z_w = L_w. (IKLNDP24, Theorem 4.9, p. 54 (IKLNDP24 line 6420); CCM23, Corollary 3.2.5, p. 12 (CCM23 line 561)).

The two equalities are stated together in `value_space_bridges`.

One proof route is the following. By §2.7, AZ_w is spanned by the AMZVs of AT_w and AL_w by the ACMPLs of AT_w. Arrays of AT_w have all entries ≤ q, so their AMZV and ACMPL agree (§0.8). Restricting to trivial characters gives Z_w = L_w from the CMPL version of the weak Brown theorem.

**Checks.**

- Li(q + 1) ∈ Z_(q+1) although Li(q + 1) ≠ ζ_A(q + 1).

*Needs:* §2.7; §0.8; §0.9.

### 2.9 The Thakur decomposition and the rewriting operator U^•

H, ∗^•, ⊞ and D^• from §1.3. Every index has a unique decomposition s = (s^T, q^({m}), s′) with s^T ∈ I^T (Thakur’s family of any weight, or ∅), m ≥ 0, and s′ = ∅ or s′_1 > q; put Init(s) = (s^T, q^({m})) and, if s′ ≠ ∅, s″ = (s′_1 − q, s′_−). For • ∈ {Li, ζ} let α^•_q(P) = [1, (q − 1) ∗^• P] with iterates α^(•,m)_q (α^(•,0)_q = id). The K-linear map U^• : H → H is U^•(s) = −[s^T, q^({m+1}), s″] + L_1ᵐ⁺¹[s^T, α^(•,m+1)_q(s″)] + L_1ᵐ⁺¹(s^T ⊞ α^(•,m+1)_q(s″)) − [s^T, q^({m}), D^•_(q,s″)] if s′ ≠ ∅, and U^•(s) = L_1^m[s^T, α^(•,m)_q(∅)] + L_1^m(s^T ⊞ α^(•,m)_q(∅)) if s′ = ∅, with L_1 = θ − θ^q. Write U^• = U^•_1 + U^•_2 + U^•_3 for the bracket terms, the ⊞ term and the correction term. U^• preserves weight and fixes every index of I^T. (CCM23, §3.1, (3.1.3)–(3.1.4) and Example 3.1.5, p. 11; §3.2, (3.2.1), Definition 3.2.2 and Remark 3.2.3, p. 11; Appendix A.3, definitions of Init, U_1, U_2, U_3, pp. 29–30 (CCM23 line 515)).

The interface includes the following facts.

- The unique (s^T, m, s′) with s = (s^T, q^({m}), s′).
- α^•_q(P) = [1, (q − 1) ∗^• P].
- The operator U^• : H → H.
- U^•(s) = s for s ∈ I^T.
- U^•(H_w) ⊂ H_w.
- U^• = U^•_1 + U^•_2 + U^•_3 with the three explicit components.

One proof route is the following. The decomposition is unique: (s^T, q^({m})) is Ngo Dac’s Init(s), and s^T is Init(s) with its maximal terminal run of q’s removed, m being the length of that run. Each component is a finite combination of indices of the weight of s (Chang–Chen–Mishiba Remark 3.2.3). For s ∈ I^T, m = 0 and s′ = ∅, so U^•(s) = [s^T, α^(•,0)_q(∅)] + (s^T ⊞ ∅) = [s] + 0.

**Checks.**

- For s = (q − 1, q, q, q + 1, 1), s^T = (q − 1), m = 2, s″ = (1, 1).
- U^•(∅) = ∅ and U^•(s) = s for every s ∈ I^T.
- For s = (q): m = 1, s′ = ∅ and U^•(q) = L_1[α^•_q(∅)] = L_1[1, q − 1].
- s^T is not Init(s): for s = (1, q, q), Init(s) = (1, q, q) while s^T = (1), m = 2 and s′ = ∅.
- For s = (q − 1, q, q, q + 1, 1): s^T = (q − 1), m = 2, s′ = (q + 1, 1), s″ = (1, 1).

*Needs:* §1.3; §0.10; §0.1.

### 2.10 The rewriting theorem

• ∈ {Li, ζ}. For • ∈ {Li, ζ} and every P ∈ H: (1) 𝔏^•(U^•(P)) = 𝔏^•(P); (2) there is an explicit e ≥ 0 with Supp((U^•)^e(P)) ⊂ I^T. Consequently {𝔏^•(s) : s ∈ I^T_w} spans Z^•_w = 𝔏^•(H_w), and Zᴸⁱ_w = Z^ζ_w = Z_w. (CCM23, Theorem 3.2.4 and Corollary 3.2.5, pp. 11–12; Theorem A.3.2, p. 29; Lemma A.3.7 and Theorem A.3.8, pp. 30–31 (CCM23 line 515)).

One proof route is the following. (1): for s ∉ I^T with s′ ≠ ∅, the relation BC^(•,m)_q(C^•_(s″)(R_1)), followed by B^•_(s^T) when s^T ≠ ∅, lies in P^•_(wt(s)) by §2.3, and its realisation reads 𝔏^•(s) − 𝔏^•(U^•(s)) = 0 (Chang–Chen–Mishiba (A.3.3)–(A.3.4)); for s′ = ∅ (then m ≥ 1) use BC^(•,m−1)_q(R_1) ((A.3.5)–(A.3.6)). (2): for s ∉ I^T every n ∈ Supp(U^•(s)) has dep(n) > dep(s) (component U_1), or dep(n) = dep(s) and Init(n) > Init(s) (U_2), or dep(n) = dep(s), Init(n) ≥ Init(s) and n_(ℓ+1) < s_(ℓ+1) with ℓ = dep Init(s) (U_3) (Lemma A.3.7). The triple (dep; Init; −entry after Init) lives in a finite totally ordered set at fixed weight, so the iteration stops (Theorem A.3.8). Ngo Dac’s spanning theorem is recovered, simultaneously for both realisations, together with Zᴸⁱ_w = Z^ζ_w from §0.8 on I^T.

**Checks.**

- At q = 2, U^ζ(3) = D₁[1,2] and (U^ζ)²(3) = D₁²([1,1,1]+[2,1]), with both final indices in Iᵀ₃. A reduction that omits the box-plus term loses the coefficient of [2,1].

*Needs:* §2.9; §2.3; §2.2; §1.5; §0.8.

### 2.11 The Hoffman-type generating set

w ≥ 1. For every w ≥ 1, Z_w is spanned by the values Li(s) with s ∈ IND_w. (CCM23, Theorem 3.2.6 and its proof, p. 12 (CCM23 line 561)).

One proof route is the following. Choose e ≫ 0 with (Uᴸⁱ)^e(H_w) ⊂ span I^T_w over F_p[L_1] (§2.10), and let U = (u_(s,n)) ∈ Mat_(d(w))(F_p[L_1]) with (Uᴸⁱ)^e(s) = Σ_(n ∈ I^T_w) u_(s,n)[n] for s ∈ IND_w. For s = (m_1q + n_1, …, m_rq + n_r) ∈ IND_w, Dᴸⁱ = 0 gives Uᴸⁱ(s) ≡ −[s^T, q, s″] modulo L_1, so (Uᴸⁱ)^e(s) ≡ (−1)^(m_1+⋯+m_r)[ι(s)] modulo L_1. ι is a bijection (§0.10), so det U ≡ ±1 modulo L_1 and det U ≠ 0; hence the Li(s), s ∈ IND_w, span the same space as the ζ_A(n), n ∈ I^T_w, which is Z_w by §2.10.

**Checks.**

- For w ≤ q, IND_w = I^T_w and the statement is §2.10.

*Needs:* §2.10; §0.10; §0.12.

### 2.12 The strong Brown theorem for alternating polylogarithms

w ≥ 1; characters in F_q^×. For every w ≥ 1, the ACMPL values Li(ε; s) with (ε; s) ∈ AS_w span AL_w; hence dim_K AL_w ≤ s(w). More precisely, for each (ε; s) ∈ AT_w let (ε′; s′) ∈ AS_w be its contraction: parse s into blocks, each a run of q’s ending in an entry < q, replace the i-th block (q^({h_i − 1}), r_i) by the single entry (h_i − 1)q + r_i (so ι(s′) = s), and let ε′_i be the product of the characters of the i-th block. Then Li(ε′; s′) = Σ_((ϵ; t) ∈ AT_w) a^((ε;s))_(ϵ,t) Li(ϵ; t) with every a ∈ A, a ≡ ±1 modulo D_1 for (ϵ; t) = (ε; s) and a ≡ 0 modulo D_1 otherwise. The contraction is many-to-one onto AS_w, and the t(w) × t(w) matrix (a^((ε;s))_(ϵ,t)), with rows indexed by AT_w (repeated left-hand sides allowed), is invertible. (IKLNDP24, Theorem 1.11 and its proof, p. 25 (IKLNDP24 line 3327)).

The spanning headline is `strong_brown_spanning`.

One proof route is the following. Fix (ε; s) ∈ AT_w and use the finite reduction of §2.6 with k = w on its contraction (ε′; s′), using §2.5 (3) at every step, also at the first step in place of C(R_1). Every coefficient is −1 on a type-1 edge and lies in D_1A otherwise, so the coefficient of a leaf is congruent modulo D_1 to the product along its all-type-1 path. Splitting the m-th q off the i-th entry of s′, choose the free character in the reduction step equal to the character of the corresponding entry of (ε; s); the all-type-1 chain then ends at (ε; s) with sign (−1)^(n−ℓ), and every other leaf of AT_w is reached through a non-type-1 edge. This gives the congruences for every row; the t(w) × t(w) matrix is congruent modulo D_1 to a diagonal matrix with entries ±1, so its determinant is not divisible by D_1 and the matrix is invertible over K. Inverting it expresses every Li(ϵ; t), (ϵ; t) ∈ AT_w, as a K-combination of the Li(ε′; s′), which lie in AS_w; with the weak Brown theorem (§2.7: AT_w spans AL_w), AS_w spans AL_w. The bijection ϕ is only used for |AS_w| = s(w) (§0.12).

At weight zero the strong Brown signature has just the empty array, value 1 and span K.

**Checks.**

- For w ≤ q, AS_w = AT_w and the statement is the weak Brown theorem. The two sets first differ at w = q + 1, where (q + 1) lies in AS_(q+1) but not in AT_(q+1). At q = 2 and w = 3, AS_3 consists of (3) and (1, 1, 1) and AT_3 of (2, 1) and (1, 1, 1); both have d(3) = 2 elements, since F₂ˣ is trivial.

*Needs:* §2.5; §2.6; §2.7; §0.10; §0.12.

### 2.13 The next-weight relation ζ_A(2q − 1) + D_1 ζ_A(1, 2q − 2) = 0

q ≥ 2. For every prime power q and every d ∈ Z, S_d(2q − 1) + D_1 S_(d+1)(1, 2q − 2) = 0; hence ζ_A(2q − 1) + D_1 ζ_A(1, 2q − 2) = 0. For q > 2 both indices lie in IND_(2q−1), so the MZVs indexed by IND_w are not independent at w = 2q − 1. (ND21, Remark 6.3, p. 24 (ND21 line 1421); LRT14, Theorem 3.1(2), p. 3 (LRT14 line 105); IKLNDP24, Remark 4.14, p. 58 (IKLNDP24 line 6766)).

One proof route is the following. Expand C_((q−1))(R_1) = S_d(q, q − 1) + S_d(q)S_d(q − 1) + D_1 S_(d+1)(1)S_(<d+1)(q − 1)² = 0. By §1.2, Δ^([q−1])_(q,q−1) = −1 and Δ^([2q−2])_(q,q−1) = 0, so S_d(q)S_d(q − 1) = S_d(2q − 1) − S_d(q, q − 1), which cancels the first term. S_(<d+1)(q − 1)² = 2S_(<d+1)(q − 1, q − 1) + Σ_(i ≤ d)S_i(q − 1)², and S_i(q − 1)² = S_i(2q − 2) + 2(−1)^q S_i(q − 1, q − 1) (Δ^([q−1])_(q−1,q−1) = 2(−1)^q); the coefficient 2(1 + (−1)^q) of S_(<d+1)(q − 1, q − 1) vanishes in characteristic p, so S_(<d+1)(q − 1)² = S_(<d+1)(2q − 2) and C_((q−1))(R_1) is the claimed relation. Equivalently, this is the case n = 0, s_1 = s_2 = 1, k_1 = 0 of Lara Rodríguez–Thakur Theorem 3.1(2): ζ(1, 2q − 2) = ζ(2q − 1)/ℓ_1, with ℓ_1 = −D_1. For q > 2, neither 2q − 1 nor 2q − 2 is divisible by q.

**Checks.**

- At d = 0 the relation has value 1 + D₁/ℓ₁ = 0. At q = 2 this is 1 + 1 = 0; at q = 3 this is 1 − 1 = 0. The omitted-D₁ formula has value 1 + ℓ₁⁻¹ ≠ 0.

*Needs:* §2.3; §2.2; §1.2; §0.10.

### Examples

For q = 2, the fixed fundamental relation is ζ_A(2) + D₁ζ_A(1,1) = 0. For q = 3, the contraction of (3,1) is (4); its leading reduction coefficient is −1 modulo D₁. The other reduction coefficients are divisible by D₁, so a diagonal residue matrix has nonzero determinant.

### Dependencies

Earlier layers 0 and 1, including §0.0 (Carlitz products). Each target’s needs specify its statement and proof-route inputs.

## Layer 3: deformation periods and ABP independence

Polynomial tuples satisfy the termwise Gauss bound whenever all tails of a period matrix are used. The weaker whole-tuple condition is used only for initial-prefix columns and for the Frobenius specialisation of the full series (§3.5 (1)), where the stated decay implication suffices.

### 3.1 Anderson–Thakur polynomials and Carlitz factorials

q ≥ 2; t an independent variable. Let [k] = θ^(q^k) − θ and D_k = ∏_(ℓ=1)ᵏ[ℓ]^(q^(k−ℓ)) (D_0 = 1; this is the D_k of §0.0 = ∏_(j<k)(θ^(q^k) − θ^(q^j))). For n ≥ 1 write n − 1 = Σ_j n_j q^j in base q and put Γ_n = ∏_j D_j^(n_j) (the Carlitz factorial of n − 1). Let γ_0(t) = 1 and γ_j(t) = ∏_(ℓ=1)ʲ(θ^(q^j) − t^(q^ℓ)). The Anderson–Thakur polynomials α_n(t) ∈ A[t] are defined by Σ_(n ≥ 1) α_n(t)x^n/Γ_n = x(1 − Σ_(j ≥ 0) γ_j(t)x^(q^j)/D_j)⁻¹, and H_n(t) ∈ A[t] is α_n with θ and t interchanged. (In Anderson–Thakur and Chang the same polynomial is called Hₙ₋₁; this roadmap uses Ngo Dac’s and Im–Kim–Le–Ngo Dac–Pham’s indexing.) Then deg_θ H_n ≤ (n − 1)q/(q − 1) < nq/(q − 1), so ‖H_n‖ < |θ|^(nq/(q−1)); H_n = 1 for 1 ≤ n ≤ q; and H_(q+k−1) = (t^q − t) + (k − 1)(t^q − θ^q) for 1 < k ≤ q, so that H_(2q−1) = θ^q − t. (ND21, §4.2, p. 17 (ND21 line 1002); ND21, §6, p. 24 (ND21 line 1421); IKLNDP24, §2.2.2, (2.4), p. 28 (IKLNDP24 line 3563); CHANG14, Theorem 5.5.1, p. 18 (CHANG14 line 901)).

The interface includes the following facts.

- Γ_n = ∏_j D_j^(n_j) with n − 1 = Σ n_j q^j.
- H_n ∈ A[t] (Ngo Dac indexing).
- deg_θ H_n ≤ (n − 1)q/(q − 1).
- H_n = 1 for 1 ≤ n ≤ q.
- H_(q+k−1) = (t^q − t) + (k − 1)(t^q − θ^q) for 1 < k ≤ q; in particular H_(2q−1) = θ^q − t.
- Γ_n = 1 for n ≤ q.

One proof route is the following. Expanding the geometric series, the coefficient of x^n for n ≤ q comes only from the j = 0 term, so α_n/Γ_n = 1 and Γ_n = 1, whence H_n = 1. For n = q + k − 1 with 1 < k ≤ q exactly one factor γ_1 x^q/D_1 can occur (two would need degree 2q > n − 1), in k − 1 positions, so α_n/Γ_n = 1 + (k − 1)γ_1/D_1 with Γ_n = D_1; hence α_n = (θ^q − θ) + (k − 1)(θ^q − t^q) and H_n follows by swapping θ and t. The degree bound is Anderson–Thakur’s estimate (3.7.3), as quoted by Ngo Dac §4.2, Chang Theorem 5.5.1 and Im–Kim–Le–Ngo Dac–Pham (2.4).

**Checks.**

- H_1 = H_q = 1.
- For q = 3, H_4 = 2t^3 − t − θ^3.
- Γ_(q+1) = D_1 = θ^q − θ.
- The indexing is shifted from Anderson–Thakur’s: with their convention H_0 = 1 is the polynomial attached to s = 1, so citing their H_s for exponent s is off by one.
- H_1 = ⋯ = H_q = 1 and, for q = 3, H_4 = t^3 − t + t^3 − θ^3 = 2t^3 − t − θ^3.
- At k = q the coefficient k − 1 = q − 1 is −1 in F_p: for q = 3 and n = 5 the expansion gives α_5/Γ_5 = 1 + 2γ_1/D_1 with Γ_5 = D_1 (5 − 1 = 1·3 + 1), so α_5 = θ³ − θ + 2(θ³ − t³) = t³ − θ and H_5 = θ³ − t, of θ-degree 3 ≤ (5 − 1)·3/2 = 6. Extending H_n = 1 beyond n = q would instead give H_5 = 1 and lose the t-dependence used by the two-row system of §4.7.

*Needs:* §0.0 (Carlitz products); Mathlib `Polynomial`.

### 3.2 Anderson–Thakur interpolation of power sums

s ≥ 1, d ≥ 0; H_s in Ngo Dac’s indexing. For s ≥ 1 and d ≥ 0, (H_s Ω^s)⁽ᵈ⁾(θ) = Γ_s S_d(s)/π̃^s, where f⁽ᵈ⁾ raises coefficients to the q^d-th power (§0.0 (arithmetic series and twist)) and Ω, π̃ = 1/Ω(θ) are as in §0.0. With a character, if γ ∈ F̄_q satisfies γᑫ⁻¹ = ε, then (γH_sΩ^s)⁽ᵈ⁾(θ) = γε^d Γ_s S_d(s)/π̃^s. (CHANG14, Theorem 5.5.1, p. 18 (CHANG14 line 901); ND21, §4.2, (4.2), p. 17 (ND21 line 1002); CH21, §2.4, Proposition 2.12, p. 13 (CH21 line 593)).

One proof route is the following. This is Anderson–Thakur’s interpolation formula (Anderson–Thakur 1990, (3.7.3)–(3.7.4); Anderson–Thakur 2009, 2.4.1), as stated in Chang 2014 Theorem 5.5.1; its proof expresses S_d(s) through the coefficients of the Carlitz exponential and the polynomials γ_j. The generating-series identity below gives S_d(s) = α_s(θ^(q^d))/(Γ_sℓ_dˢ), and (Ω^s)⁽ᵈ⁾(θ) = π̃⁻ˢ/ℓ_dˢ with H_s⁽ᵈ⁾(θ) = α_s(θ^(q^d)) turns it into the displayed formula. The character version follows from γ^(q^d) = γε^d (§0.6).

**Checks.**

- For s ≤ q, H_s = 1 and Γ_s = 1, and the formula reads Ω⁽ᵈ⁾(θ)^s = S_d(s)/π̃^s, i.e. ℓ_d⁻ˢπ̃⁻ˢ = S_d(s)π̃⁻ˢ, which is Carlitz’s identity, since Ω⁽ᵈ⁾ = Ω/𝕃_d with 𝕃_d(θ) = ℓ_d.

*Needs:* §3.1; §0.2; §0.0 (Omega and period); §0.0 (arithmetic series and twist); the generating-series theorem of this subsection.

Prove the power-sum generating identity in K[[x]]: Σ_(n≥1) S_d(n)x^(n−1) = ℓ_d⁻¹(1 − Σ_(0≤j≤d) γ_j(θ^(q^d))(x/ℓ_d)^(q^j)/D_j)⁻¹ for every d ≥ 0, with γ_j as in §3.1. Also prove γ_j(θ^(q^d)) = 0 for j > d (AT90 §§3.6–3.7, (3.6.4), (3.7.1)–(3.7.4), printed pp. 185–186, AT90 line 750; AT09 §2.4.1, AT09 line 220). Its constant denominator is 1, so the formal inverse exists. Coefficient comparison gives S_d(n) = α_n(θ^(q^d))/(Γ_nℓ_d^n), and proves the interpolation formula above.

**Checks for the generating identity.**

- At d = 0, γ₀ = 1 and γ_j(θ) = 0 for j ≥ 1, so both sides are (1−x)⁻¹ with constant coefficient 1.
- At d = 1, both constant coefficients are ℓ₁⁻¹ and the right side is (ℓ₁+x^q−x)⁻¹. Its x coefficient at q = 3 is ℓ₁⁻², agreeing with S₁(2).
- At d = 1 and j = 2, the factor with i = 1 in γ₂(θ^q) is θ^(q²)−(θ^q)^q = 0; omitting that factor would add a spurious x^(q²) term.

*Needs:* §3.1; §0.2 (depth-one power sums); §0.0 (Carlitz products); Mathlib formal power series.

### 3.3 Chang’s deformation series

Q_j ∈ K̄[t] with the termwise bound. Let 𝕃_0(t) = 1 and 𝕃_d(t) = ∏ᵢ₌₁ᵈ(t − θ^(q^i)), so 𝕃_d(θ) = ℓ_d and Ω⁽ᵈ⁾ = Ω/𝕃_d. For an index s of depth r ≥ 1 and Q = (Q_1, …, Q_r) ∈ K̄[t]^r with the termwise bound ‖Q_j‖ < |θ|^(q s_j/(q−1)) for every j (Gauss norm), Chang’s series is 𝔏(s; Q) = Σ_(d_1 > ⋯ > d_r ≥ 0)(Ω^(s_r)Q_r)^((d_r))⋯(Ω^(s_1)Q_1)^((d_1)) = Ωʷᵗ⁽ˢ⁾Σ_(d_1 > ⋯ > d_r ≥ 0)Q_r^((d_r))⋯Q_1^((d_1))/(𝕃_(d_r)^(s_r)⋯𝕃_(d_1)^(s_1)), with 𝔏(∅) = 1. Special cases: Q = (H_(s_1), …, H_(s_r)) gives Ngo Dac’s L(s); Q = (γ_1H_(s_1), …) with γ_iᑫ⁻¹ = ε_i gives 𝔏(s; ε); Q = (γ_1, …, γ_r) gives 𝔏𝔦(s; ε); Q = (1, …, 1) gives Chang–Chen–Mishiba’s 𝓛(s). The termwise bound holds for every consecutive sub-tuple, so every series 𝔏(s_j, …, s_k; Q_j, …, Q_k) is defined. (CHANG14, Lemma 5.3.1, (5.3.2), p. 14 (CHANG14 line 674); ND21, §4.2, (4.1), pp. 17–18 (ND21 line 1002); IKLNDP24, §2.2.1, (2.1)–(2.2), p. 27; §2.2.2–2.2.3, pp. 28–29 (IKLNDP24 line 3501); CCM23, §5, opening, pp. 21–22 (CCM23 line 1082)).

The interface includes the following facts.

- 𝕃_d(t) = ∏ᵢ₌₁ᵈ(t − θ^(q^i)).
- 𝔏(s; Q) ∈ T under the termwise bound.
- 𝔏(s; Q) = Ωʷᵗ⁽ˢ⁾Σ Q_r^((d_r))⋯Q_1^((d_1))/(𝕃_(d_r)^(s_r)⋯𝕃_(d_1)^(s_1)).
- 𝔏(∅) = 1.
- 𝔏(s_1, …, s_k; Q)⁽⁻¹⁾ = 𝔏(s_1, …, s_k; Q) + Q_k⁽⁻¹⁾(t − θ)^(s_k)Ω^(s_k)𝔏(s_1, …, sₖ₋₁; Q), the recursion behind Ψ⁽⁻¹⁾ = ΦΨ.
- Ω⁽ᵈ⁾ = Ω/𝕃_d for d ≥ 0.
- Every consecutive sub-tuple satisfies the termwise bound, so its series is defined.

One proof route is the following. Ω⁽⁻¹⁾ = (t − θ)Ω gives Ω⁽¹⁾ = Ω/(t − θ^q) and inductively Ω⁽ᵈ⁾ = Ω/𝕃_d, whence the second expression. The twist raises the absolute values of coefficients to the q^d-th power, so ‖f⁽ᵈ⁾‖ = ‖f‖^(q^d) for the Gauss norm, and ‖Ω‖ = |ρ|⁻ᑫ = |θ|^(−q/(q−1)) since every factor 1 − t/θ^(q^i) has Gauss norm 1. Under the termwise bound the general term has Gauss norm ∏_j c_j^(q^(d_j)) with c_j = ‖Q_j‖/|θ|^(q s_j/(q−1)) < 1, so the series converges in the Tate algebra T of §0.0, for the tuple and for each consecutive sub-tuple. ‖H_n‖ < |θ|^(nq/(q−1)) (§3.1) and |γ| = 1 show that the four special cases satisfy the bound.

**Checks.**

- 𝓛(1) = ΩΣ_(d ≥ 0)𝕃_d⁻¹.
- 𝔏(∅) = 1.
- For s = (q − 1, q − 1) and Q = (1, θᑫ⁺¹) the whole-tuple condition holds but ‖Q_2‖ = qᑫ⁺¹ > |θ|ᑫ violates the termwise bound and the tail series 𝔏((q − 1); (θᑫ⁺¹)) diverges.
- 𝕃_1(θ) = θ − θ^q = ℓ_1.
- 𝓛(1) = Ω Σ_(d ≥ 0) 𝕃_d⁻¹, and 𝔏((1); (H_1)) = 𝓛(1) since H_1 = 1.

*Needs:* §3.1; §0.0 (Omega and period); §0.0 (arithmetic series and twist); §0.0 (Carlitz products).

### 3.4 Entireness of Chang’s series

Either the termwise bound; or, for the initial-sub-tuple assertion only, Q_j ≠ 0 and ∏_j (‖Q_j‖/|θ|^(q s_j/(q−1)))^(q^(d_j)) → 0 as d_1 > ⋯ > d_r ≥ 0 and d_1 → ∞. Under the termwise bound, 𝔏(s; Q) lies in the ring E of §0.0: its coefficients are algebraic over K, generate a finite extension of K_∞, and the series converges on all of C_∞. The same holds for every consecutive sub-tuple. More generally, if every Q_j is nonzero and the whole-tuple decay condition of Chang Lemma 5.3.1 holds, the series for the tuple and every initial sub-tuple are entire; no claim about arbitrary tails is made under that weaker condition. (CHANG14, Lemma 5.3.1 and its proof, pp. 14–15 (CHANG14 line 674); ND21, §4.2, p. 18 (ND21 line 1073); CCM23, §5, p. 22 (CCM23 line 1155)).

One proof route is the following. By §3.3, 𝔏(s; Q) and the series of all its consecutive sub-tuples lie in T, and Ω ∈ T (§0.0 (Omega and period)). The vector ψ = (Ω^(s_1+⋯+s_r), 𝔏(s_1; Q_1)Ω^(s_2+⋯+s_r), …, 𝔏(s_1, …, sᵣ₋₁; …)Ω^(s_r), 𝔏(s; Q))^T has entries in T and, by the twist recursion of §3.3, satisfies ψ⁽⁻¹⁾ = Φψ for the lower bidiagonal Φ ∈ Matᵣ₊₁(K̄[t]) with diagonal (t − θ)^(sₖ₊₁+⋯+s_r) and subdiagonal Q_k⁽⁻¹⁾(t − θ)^(s_k+⋯+s_r); det Φ is a power of t − θ, so det Φ(0) ≠ 0. §0.0 (entireness and lifting) (Anderson–Brownawell–Papanikolas Proposition 3.1.3) gives ψ ∈ Eʳ⁺¹: every entry is entire with algebraic coefficients generating a finite extension of K_∞; in particular 𝔏(s; Q) ∈ E. Sub-tuples are treated the same way (Chang’s proof of Lemma 5.3.1 follows this route). For the weaker whole-tuple condition put c_j = ‖Q_j‖/|θ|^(q s_j/(q−1)) > 0. To test a prefix of length k, shift all its summation indices by r−k and append the fixed indices r−k−1, …, 0. The whole-tuple norm is a fixed positive constant times the qʳ⁻ᵏ-th power of the prefix norm. Thus decay for the whole tuple implies decay for every prefix. This puts the displayed first-column vector in T, and the same equation and §0.0 (entireness and lifting) put it in E; convergence of the other columns is unnecessary (Chang Lemma 5.3.1, proof, p. 15).

**Checks.**

- 𝓛(s) ∈ E for every index s (Chang–Chen–Mishiba §5, p. 22).

- At q = 2 and s = (1), Q = 1, the entire series has value −1/D₁ at θ and 1/D₁² at θ². A radius-one-only evaluation rule would not license the first evaluation because |θ|∞ = 2.

*Needs:* §3.3; §0.0 (arithmetic series and twist); §0.0 (entireness and lifting); §0.0 (Omega and period).

### 3.5 Specialisations of Chang’s series

For (1), Q ∈ K̄[t]^r with the whole-tuple decay condition of §3.4, which the termwise bound implies; for (2), the four special tuples, which satisfy the termwise bound; γ_iᑫ⁻¹ = ε_i. (1) If Q ∈ K̄[t]^r satisfies ∏_j (‖Q_j‖/|θ|^(q s_j/(q−1)))^(q^(d_j)) → 0 as d_1 > ⋯ > d_r ≥ 0 and d_1 → ∞ (Chang–Papanikolas–Yu (2.3.1)), then 𝔏(s; Q)(θ^(q^j)) = 𝔏(s; Q)(θ)^(q^j) for every j ≥ 0; if some Q_i = 0, the series is 0 and both sides vanish. (2) At t = θ: 𝔏(s; H)(θ) = Γ_s ζ_A(s)/π̃ʷᵗ⁽ˢ⁾ with Γ_s = Γ_(s_1)⋯Γ_(s_r); 𝔏(s; ε)(θ) = γ_1⋯γ_r Γ_s ζ_A(ε; s)/π̃ʷᵗ⁽ˢ⁾; 𝔏𝔦(s; ε)(θ) = γ_1⋯γ_r Li(ε; s)/π̃ʷᵗ⁽ˢ⁾; 𝓛(s)(θ) = Li(s)/π̃ʷᵗ⁽ˢ⁾. (CHANG14, Lemma 5.3.5, p. 16; Theorem 5.5.2, (5.5.3), p. 18 (CHANG14 line 792); CPY19, Proposition 2.3.3, p. 7 (CPY19 line 302); ND21, (4.2), p. 17; (5.4), p. 20 (ND21 line 1002); IKLNDP24, (2.3), p. 27; (2.5) and (2.7), p. 29 (IKLNDP24 line 3501); CCM23, §5, p. 22 (CCM23 line 1155); CH21, §2.4, Proposition 2.12, p. 13 (CH21 line 593)).

One proof route is the following. (1): assume every Q_i ≠ 0, so that by §3.4 the series of the tuple and of every initial sub-tuple are entire. Split the sum at d_r < j and d_r ≥ j. For fixed d_r < j the terms group into (Ω^(s_r)Q_r)⁽ᵈʳ⁾·𝔏(s_1, …, sᵣ₋₁; Q_1, …, Qᵣ₋₁)⁽ᵈʳ⁺¹⁾; the second factor is entire and the first, Ω^(s_r)Q_r⁽ᵈʳ⁾/𝕃_(d_r)^(s_r), vanishes at θ^(q^j) to order s_r. The remaining part is the j-fold twist of 𝔏(s; Q), whose value at θ^(q^j) is 𝔏(s; Q)(θ)^(q^j) because the series is entire. Only the first column of the period matrix is used, so no tail series is needed (Chang Lemma 5.3.5 for constant Q, Chang–Papanikolas–Yu Proposition 2.3.3 under (2.3.1), CPY19 lines 275 and 325). (2): at θ, (ΩˢQ)⁽ᵈ⁾(θ) = π̃⁻ˢQ⁽ᵈ⁾(θ)/ℓ_d^s; for Q = H use §3.2 term by term; for Q = γ use γ^(q^d) = γε^d; multiply over the r factors and sum over d_1 > ⋯ > d_r ≥ 0.

**Checks.**

- For s = (1) and Q = 1, 𝓛(1)(θ) = Li(1)/π̃ = ζ_A(1)/π̃.
- At q = 2, s = (1) and Q = 1, the values at θ and θ² are −D₁⁻¹ and D₁⁻², so (1) holds at j = 1: (−D₁⁻¹)² = D₁⁻².
- At q = 3, s = (2, 2) and Q = (1, t + θ⁴), the whole-tuple exponent −3·3^(d_1) + 3^(d_2) is at most −8·3^(d_2) on d_1 > d_2 and tends to −∞, while ‖Q_2‖ = 3⁴ > 3³ violates the termwise bound. Part (1) applies to 𝔏(s; Q); the tail series 𝔏((2); (t + θ⁴)) has general term of Gauss norm 3^(3^d) and receives no specialisation.
- For Q = (1, 0) every summand vanishes, so 𝔏(s; Q) = 0 and both sides of (1) are 0; nothing about the prefix (1) follows from this.

*Needs:* §3.3; §3.4; §3.2; §0.3; §0.4; §0.6.

### 3.6 The dual t-motives attached to an index

Termwise bound on Q; K̄ perfect, so the effective dual t-motive of §0.0 is defined. For (s; Q) as in §3.3, Φ_(s,Q) ∈ Matᵣ₊₁(K̄[t]) is the lower bidiagonal matrix with diagonal entries (t − θ)^(sₖ₊₁+⋯+s_r) (k = 0, …, r; the last is 1) and subdiagonal entries Q_k⁽⁻¹⁾(t − θ)^(s_k+⋯+s_r) (k = 1, …, r). Ψ_(s,Q) ∈ GLᵣ₊₁(T) is lower triangular with (k, j)-entry 𝔏(sⱼ₊₁, …, s_k; Qⱼ₊₁, …, Q_k)Ω^(sₖ₊₁+⋯+s_r) for j ≤ k (the empty series being 1), so the diagonal is Ω^(sₖ₊₁+⋯+s_r) and the last row is (𝔏(s; Q), 𝔏(s_2, …; Q_2, …), …, 𝔏(s_r; Q_r), 1). Then Ψ_(s,Q)⁽⁻¹⁾ = Φ_(s,Q)Ψ_(s,Q), all entries of Ψ lie in E, and det Φ_(s,Q) = (t − θ)^(Σₖ₌₀ʳ⁻¹(sₖ₊₁+⋯+s_r)). The K̄[t]-module M_(s,Q) = K̄[t]ʳ⁺¹ with σ acting by Φ_(s,Q) is an effective dual t-motive (§0.0) and Ψ_(s,Q) is a rigid analytic trivialisation; M′_(s,Q) is given by the upper-left r × r block, with trivialisation the upper-left block of Ψ. (ND21, Definition 4.1, p. 16; §4.2, displays of Φ_s and Ψ_s, pp. 17–18 (ND21 line 954); IKLNDP24, Definition 2.1, p. 26; §2.2.1, pp. 27–28 (IKLNDP24 line 3454)).

The interface includes the following facts.

- Φ_(s,Q) ∈ Matᵣ₊₁(K̄[t]).
- Ψ_(s,Q) ∈ GLᵣ₊₁(T).
- Ψ_(s,Q)⁽⁻¹⁾ = Φ_(s,Q)Ψ_(s,Q).
- det Φ_(s,Q) is a power of t − θ.
- M_(s,Q), an effective dual t-motive given by Φ_(s,Q).
- Ψ_(s,Q) is a rigid analytic trivialisation in the sense of §0.0 (rational Frobenius comparisons).

One proof route is the following. Twisting by −1 lowers every summation index by one; separating the terms whose last index becomes −1 gives 𝔏(sⱼ₊₁, …, s_k)⁽⁻¹⁾ = 𝔏(sⱼ₊₁, …, s_k) + Q_k⁽⁻¹⁾(t − θ)^(s_k)Ω^(s_k)𝔏(sⱼ₊₁, …, sₖ₋₁); with Ω⁽⁻¹⁾ = (t − θ)Ω this is the (k, j) entry of Ψ⁽⁻¹⁾ = ΦΨ. det Φ is the product of the diagonal entries, a power of t − θ; so (t − θ)^N kills M/σM and M is an effective dual t-motive. Ψ is lower triangular with unit-multiple diagonal entries Ω^(…) ∈ T^×, hence invertible over T; its entries lie in E by §3.4.

**Checks.**

- For s = (1), Ψ⁽⁻¹⁾ = ΦΨ reads Ω⁽⁻¹⁾ = (t − θ)Ω and 𝔏(1; Q)⁽⁻¹⁾ = Q⁽⁻¹⁾(t − θ)Ω + 𝔏(1; Q).
- For s = (2, 1), det Φ = (t − θ)³(t − θ)¹ = (t − θ)^4.
- For depth zero M is the trivial motive 1 with Φ = (1).
- M_(s,Q) need not be finitely generated over K̄[σ]; only the broader effective definition of §0.0 is used.
- For s = (1), Φ = [[t − θ, 0], [Q_1⁽⁻¹⁾(t − θ), 1]] and Ψ = [[Ω, 0], [𝔏(1; Q_1), 1]].

*Needs:* §3.3; §3.4; §0.0 (effective dual t-motives); §0.0 (rational Frobenius comparisons); §0.0 (Omega and period).

### 3.7 Chang’s MZ property

E, the twist and the ABP condition from §0.0; π̃ from §0.0. A nonzero Z ∈ C_∞ has the MZ property of weight w ≥ 1 if there are d ≥ 2, Φ ∈ Mat_d(K̄[t]) and ψ ∈ E^d with ψ⁽⁻¹⁾ = Φψ such that: (1) det Φ = c(t − θ)^m with c ∈ K̄^× and m ≥ 0; (2) the last column of Φ is (0, …, 0, 1)^T; (3) ψ(θ) has first entry π̃⁻ʷ and last entry cZ/π̃^w for some c ∈ K^×; (4) for every N ≥ 1, every entry of ψ(θ^(q^N)) except the last vanishes, and the last is (cZ/π̃^w)^(q^N). (CHANG14, Definition 3.4.1 and Proposition 3.4.4, pp. 8–9 (CHANG14 line 329)).

The interface includes the following facts.

- Z has the MZ property of weight w, witnessed by (Φ, ψ).
- Z_1Z_2 has the MZ property of weight w_1 + w_2.
- cZ has the MZ property of the same weight for c ∈ K^×.
- An MZ-property value is nonzero.

One proof route is the following. The data (Φ, ψ) is a witness; the weight is determined by Z (a consequence of §3.9). Products: if Z_i have the MZ property of weight w_i, Kronecker products of the witnesses give the MZ property of weight Σ m_iw_i for Z_1^(m_1)⋯Z_n^(m_n) (Chang Proposition 3.4.4).

**Checks.**

- Li(1) has the MZ property of weight 1.
- ζ_A(q − 1)^2 has the MZ property of weight 2(q − 1).
- 0 never has the MZ property.
- If Z has it, so has aZ for a ∈ K^× (change c).
- Li(1) has the MZ property of weight 1 with Φ = [[t − θ, 0], [t − θ, 1]] and ψ = (Ω, 𝓛(1))^T.

*Needs:* §0.0 (arithmetic series and twist); §0.0 (Omega and period).

### 3.8 Zeta and polylogarithm values have the MZ property

The termwise bound for polynomial Q. The additional general-point assertion uses nonzero algebraic u satisfying Chang’s whole-tuple convergence condition D_s; nonvanishing is required in both cases. For (s; Q) as in §3.3 with 𝔏(s; Q)(θ) ≠ 0, the value π̃ʷᵗ⁽ˢ⁾𝔏(s; Q)(θ) has the MZ property of weight wt(s). In particular every nonzero Li_s(u) with u ∈ D_s ∩ (K̄^×)^r, every ζ_A(s), and every ζ_A(ε; s) and Li(ε; s) whose total character χ(ε) is trivial has the MZ property of weight wt(s); for a general array the normalised values γ_1⋯γ_rΓ_sζ_A(ε; s) and γ_1⋯γ_rLi(ε; s) (γ_iᑫ⁻¹ = ε_i) have it, and so has every nontrivial monomial in such values, with the total weight. (CHANG14, Proposition 5.4.1 and its proof, pp. 16–17 (CHANG14 line 792); IKLNDP24, §2.2.1, paragraph before Proposition 2.3, p. 28 (IKLNDP24 line 3563); ND21, §4.2 and §5.2, pp. 17–20 (ND21 line 1002)).

One proof route is the following. Take Φ = Φ_(s,Q) and ψ the first column of Ψ_(s,Q) (§3.6): ψ⁽⁻¹⁾ = Φψ, det Φ is a power of t − θ, and the last column of Φ is (0, …, 0, 1)^T. ψ(θ) has first entry Ω(θ)ʷᵗ⁽ˢ⁾ = π̃⁻ʷᵗ⁽ˢ⁾ and last entry 𝔏(s; Q)(θ); at θ^(q^N), N ≥ 1, every entry carrying a positive power of Ω vanishes and the last entry is 𝔏(s; Q)(θ)^(q^N) (§3.5). For the larger domain D_s take Q = u and use only Chang’s first column: §3.4 gives convergence and entire-ness of every prefix under the whole-tuple condition, and §3.5 (1) (Chang Lemma 5.3.5, p. 16, for constant u) gives the specialisation of the full series at θ^(q^N). This proves the same witness conditions without assuming that the full tail matrix Ψ exists on D_s. The named values are the cases Q = u (Chang Proposition 5.4.1), Q = H, γH and γ, using §0.5 and §0.7 for nonvanishing. The constant c of the definition must lie in K^×: c = Γ_s ∈ K^× for ζ_A(s), and γ_1⋯γ_r is a (q − 1)-th root of χ(ε), so it lies in F_q^× ⊂ K^× exactly when χ(ε) = 1; otherwise one keeps the normalised value with c = 1. Monomials: §3.7.

**Checks.**

- ζ_A(q − 1) has the MZ property of weight q − 1, witnessed by Φ = [[(t − θ)ᑫ⁻¹, 0], [(t − θ)ᑫ⁻¹, 1]] (H_(q−1) = 1) and ψ = (Ωᑫ⁻¹, 𝔏((q − 1); (1)))^T.

*Needs:* §3.7; §3.6; §3.5; §0.5; §0.7; §3.4.

### 3.9 Chang’s descent theorem and the graded algebra of values

MZ-property values as in §3.7. Let w_1, …, w_ℓ be distinct positive integers and V_i a finite set of MZ-property values of weight w_i, each V_i K-linearly independent. Then {1} ∪ V_1 ∪ ⋯ ∪ V_ℓ is K̄-linearly independent. Moreover, if Z_1, …, Z_n have the MZ property of the same weight w and π̃^w, Z_1, …, Z_n are K̄-linearly dependent, they are K-linearly dependent. Consequences: (a) MZ-property values of one weight are K-independent iff K̄-independent (Im–Kim–Le–Ngo Dac–Pham Proposition 2.3); (b) the K̄-algebra 𝒵 generated by all MZVs is graded, 𝒵 = K̄ ⊕ ⊕_(w ≥ 1)𝒵_w, and defined over K (K̄ ⊗_K Z → 𝒵 is bijective), and the same holds for the algebra generated by the nonzero CMPL values Li_s(u), u ∈ D_s ∩ (K̄^×)^r, when its weight-w piece is the span of the monomials of total weight w in these values (Chang Theorems 2.2.1 and 5.4.3); (c) if ζ_A(s)/π̃ʷᵗ⁽ˢ⁾ ∈ K̄ then it lies in K. (CHANG14, Theorem 3.4.5, p. 9, with proof in §§4.1–4.2, pp. 9–12; Proposition 4.3.1, p. 12; Theorem 2.2.1, p. 5; Theorem 5.4.3, p. 17; Corollary 5.5.5, p. 19 (CHANG14 line 385); IKLNDP24, Proposition 2.3, p. 28 (IKLNDP24 line 3563); CCM23, Remark 1.2.6, p. 3; proof of Lemma 5.1.1, p. 23 (CCM23 line 102)).

The headline `zeta_algebra_graded` states the grading in (b) for MZVs (Chang Theorem 2.2.1(1), CHANG14 line 220). In any field E containing K∞ and an algebraic closure K̄ of K whose two K-embeddings agree, the K̄-spans 𝒵_w ⊂ E of the weight-w MZVs, w ≥ 0, form an independent family of K̄-subspaces; 𝒵_0 = K̄ is spanned by ζ_A(∅) = 1. C∞ is one such field, and an automorphism of K̄ over K carries one compatible pair of embeddings to any other, so independence does not depend on E. Together with `thakur_basis` and `thakur_basis_algebraicClosure` it gives that the union over all weights of the Thakur families is K̄-linearly independent and that K̄ ⊗_K Z → 𝒵 is bijective (Chang Theorem 2.2.1(2)).

One proof route is the following. Step I (separation of the top weight w_1 > ⋯): form the block-diagonal system with blocks (t − θ)^(w_1 − w_i)Φᵢⱼ and vectors Ω^(w_1 − w_i)ψᵢⱼ (entries in E, since Ω ∈ E by §3.4); apply ABP lifting (§0.0 (entireness and lifting)) to a relation, normalise, and specialise at θ^(q^N), where the lower-weight blocks vanish, to get a K̄-relation inside V_1. Step II (descent from K̄ to K in one weight): lift a K̄-relation by ABP, divide by the last coordinate, compare the twisted and untwisted lifts; the coefficients become σ-invariant rational functions, hence lie in F_q(t) (§0.0 (arithmetic series and twist)), and specialising gives a K-relation, contradicting the hypothesis. The same argument with the extra entry 1 in place of a weight-w block gives the statement with π̃^w (Chang Proposition 4.3.1). (b): in each weight w ≥ 1 choose a K-basis V_w of Z_w consisting of MZVs (Z_w is spanned by finitely many of them, §0.9). Every element of V_w is a nonzero MZV with the MZ property of weight w (§3.8), so by the first statement {1} ∪ ⋃_w V_w is K̄-linearly independent. Hence the sum K̄ + Σ_w 𝒵_w is direct and K̄ ⊗_K Z_w → 𝒵_w is bijective. By the homogeneous multiplication of §1.7 the K̄-span of all MZVs is closed under products, so it is the algebra 𝒵. For CMPL values at algebraic points a product of monomials is a monomial of the summed weight, and every monomial of total weight w has the MZ property of weight w (§3.8). The same argument applies to a K-basis of monomials in each weight, since a linear relation involves only finitely many basis elements. (c) is the case n = 1 of the statement with π̃^w.

**Checks.**

- (a) applied to I^T_w and the basis theorem gives that I^T_w is a K̄-basis of 𝒵_w (Chang–Chen–Mishiba Remark 1.2.6).
- At q = 3 the Thakur families of weights 0, 1, 2 are {∅}, {(1)} and {(1, 1), (2)}. The grading makes the four values 1, ζ_A(1), ζ_A(1, 1), ζ_A(2) K̄-linearly independent; the three separate one-weight statements allow a relation between the groups, such as one expressing ζ_A(2) through 1 and ζ_A(1).
- The weight cannot be replaced by a normalisation: at q = 3, ζ_A(2)/π̃² = −1/D₁ lies in K, so the K̄-span of the normalised weight-2 value meets the span of 1. The grading is a property of the values themselves, not of ratios by period powers.
- Since ζ_A(q − 1) = −π̃^(q−1)/D₁ (§0.13), π̃^(q−1) lies in 𝒵_(q−1), and the grading gives π̃^(q−1) ∉ K̄ = 𝒵_0, in agreement with the transcendence of π̃.

*Needs:* §3.7; §3.8; §3.4; §1.7; §0.9; §0.0 (entireness and lifting); §0.0 (arithmetic series and twist); §0.0 (Omega and period).

### 3.10 The merged prefix system of a putative relation

As stated; for Chang–Chen–Mishiba one takes Q = 1 and I = 𝔦(M) ∖ M for a set M of weight-w indices. Fix w ≥ 1, finitely many pairs (s_i; Q_i), i = 1, …, n, with wt(s_i) = w and Q_i ∈ K̄[t]^(dep(s_i)) satisfying the termwise bound, and coefficients a, a_1, …, a_n ∈ A, with a_i(t) = a_i|_(θ=t) ∈ F_q[t]. Let I be {∅} union the set of proper prefixes (t; Q) of the pairs. In particular I = {∅} when n = 0. Define Φ′ ∈ Mat_(|I|)(K̄[t]) by Φ′_(∅,∅) = (t − θ)^w, Φ′_((t;Q),(t;Q)) = (t − θ)ʷ⁻ʷᵗ⁽ᵗ⁾, Φ′_((t;Q),(t′;Q′)) = Qₗₐₛₜ⁽⁻¹⁾(t − θ)^(w−wt(t′)) when (t′; Q′) is (t; Q) with its last entry removed, and 0 otherwise; the row v with v_((t;Q)) = Σ_i a_i(t)Q_(i,last)⁽⁻¹⁾(t − θ)ʷ⁻ʷᵗ⁽ᵗ⁾ over the i whose penultimate prefix is (t; Q); and Φ = [[Φ′, 0], [v, 1]]. Define Ψ′ by Ψ′_(∅,∅) = Ω^w and Ψ′_((t;Q),(t′;Q′)) = 𝔏(t after t′; Q after Q′)Ωʷ⁻ʷᵗ⁽ᵗ⁾ when (t′; Q′) is a prefix of (t; Q), 0 otherwise; the row f with f_((t;Q)) = Σ_i a_i(t)𝔏(s_i after t; Q_i after Q) over the i having (t; Q) as a proper prefix; and Ψ = [[Ψ′, 0], [f, 1]]. Finally Φ̃ = diag(1, Φ) and ψ̃ = (1, (Ψ′_((t;Q),∅))_((t;Q) ∈ I), f_∅)^T. Then Ψ⁽⁻¹⁾ = ΦΨ, Ψ ∈ GL_(|I|+1)(T) with entries in E, det Φ = (t − θ)^(Σ_((t;Q) ∈ I)(w − wt(t))), ψ̃⁽⁻¹⁾ = Φ̃ψ̃, ψ̃ ∈ E^(|I|+2), and the last coordinate of ψ̃(θ) is Σ_i a_i𝔏(s_i; Q_i)(θ). (ND21, §5.1 (Step 1), pp. 18–19 (ND21 line 1073); CCM23, proof of Lemma 5.1.1, pp. 22–23 (CCM23 line 1155); IKLNDP24, proof of Theorem 2.4, Step 1, pp. 30–31 (IKLNDP24 line 3676)).

The interface includes the following facts.

- The set I of proper prefixes, including ∅.
- Φ = [[Φ′, 0], [v, 1]].
- Ψ = [[Ψ′, 0], [f, 1]].
- Ψ⁽⁻¹⁾ = ΦΨ.
- det Φ is a power of t − θ.
- ψ̃ = (1, (Ψ′_(t,∅))_t, f_∅)^T with ψ̃⁽⁻¹⁾ = Φ̃ψ̃.
- The last coordinate of ψ̃(θ) is Σ a_i𝔏(s_i; Q_i)(θ).

One proof route is the following. Each block of Φ′, Ψ′ restricted to the prefixes of one pair is Φ′_(s_i,Q_i), Ψ′_(s_i,Q_i) of §3.6, so the equation Ψ′⁽⁻¹⁾ = Φ′Ψ′ holds blockwise, and the merged rows agree because a prefix determines its own entries. The last row: f⁽⁻¹⁾ = vΨ′ + f is the defining recursion of the suffix series, as in §3.6. Φ′ is lower triangular for the order by length, with diagonal powers of t − θ; Ψ′ is lower triangular with diagonal Ωʷ⁻ʷᵗ⁽ᵗ⁾ ∈ T^×. Entries of Ψ lie in E by §3.4; the value of f_∅ at θ is Σ a_i𝔏(s_i; Q_i)(θ) by definition.

**Checks.**

- With no pairs, I = {∅}, v = f = 0 and Φ = diag((t−θ)^w,1), Ψ = diag(Ω^w,1). The augmented vector is (1,Ω^w,0)ᵀ. This prevents an empty union from deleting the root coordinate.
- With every polynomial coordinate equal to 1 (the Chang–Chen–Mishiba case, a prefix (t; 1, …, 1) being written t): for s_1 = (1, 2) and s_2 = (3), I = {∅, (1)}.
- For a single pair of depth one, I = {∅} and Φ = [[(t − θ)^w, 0], [a_1(t)Q⁽⁻¹⁾(t − θ)^w, 1]].
- Again with all polynomial coordinates 1: for s_1 = (1, 2), s_2 = (2, 1) of weight 3, I = {∅, (1), (2)}; for s_1 = (1, 1, 1), s_2 = (1, 2), I = {∅, (1), (1, 1)}, the prefix (1) being shared.
- Prefixes are merged as pairs, not as indices: at q = 3, the pairs ((1, 1, 1); (1, 1, 1)) and ((1, 2); (θ, 1)) satisfy the termwise bound (‖θ‖ = 3 < 3^(3/2)), and I = {∅, ((1); (1)), ((1, 1); (1, 1)), ((1); (θ))} has four elements: the length-one index prefixes agree but their polynomial prefixes differ. Merging by indices alone would give three rows and a Φ′ whose off-diagonal entry at (1) could not carry both Q⁽⁻¹⁾ = 1 and Q⁽⁻¹⁾ = θ^(1/3).
- Without the extra coordinate 1, a relation with nonzero constant term a cannot be fed to the ABP criterion; ψ̃ adds it.
- For one pair s = (1, q − 1), Q = 1, the system has I = {∅, (1)} and is the system of Chang–Chen–Mishiba Example 4.3.2 before solving.

*Needs:* §3.6; §3.3; §3.4.

### 3.11 The ABP independence criterion for zeta-type periods

(LW) and (LD) as stated; the termwise bound on all Q_i. In the setting of §3.10, assume (LW) for each weight w′ < w the values 𝔏(t; Q)(θ), (t; Q) ∈ I of weight w′, are K-linearly independent (in particular nonzero), and (LD) a + Σ_i a_i𝔏(s_i; Q_i)(θ) = 0 with a, a_i ∈ A not all zero. Then: there are b ∈ F_q[t] ∖ {0} and δ_0, δ_((t;Q)) ∈ K̄[t] with δ_0⁽⁻¹⁾ = δ_0 and [[Id, 0], [δ, 1]]⁽⁻¹⁾[[Φ′, 0], [bv, 1]] = [[Φ′, 0], [0, 1]][[Id, 0], [δ, 1]] (δ = (δ_((t;Q)))); there is ν ∈ F_q[t]^(|I|) with δΨ′ + bf = ν; and for every (t; Q) ∈ I, f_((t;Q))(θ) = ν_((t;Q))(θ)/b(θ) ∈ K. For Ngo Dac’s case (Q = H, a = 0) and Chang–Chen–Mishiba’s case (Q = 1, Σ a_s Li(s) = cπ̃^w, so a = −c after clearing π̃) this is the rationality step of their proofs. Im–Kim–Le–Ngo Dac–Pham state the setup with constant tuples Q_i; the proof uses only the Frobenius specialisation, the descent of §3.9 and the §0.0 inputs, so it applies to every Q with the termwise bound, which is this roadmap’s formulation. (IKLNDP24, Theorem 2.4, p. 29, Remark 2.5, p. 30, and the proof, pp. 30–33 (IKLNDP24 line 3623); ND21, §5.2 (Step 2), pp. 20–21 (ND21 line 1184); CCM23, Theorem 4.1.1, p. 13; proof of Lemma 5.1.1, pp. 22–24 (CCM23 line 601)).

One proof route is the following. Apply ABP lifting (§0.0 (entireness and lifting)) to (Φ̃, ψ̃) and ρ = (a, 0, …, 0, 1): det Φ̃ is a power of t − θ with constant 1, and ρψ̃(θ) = 0 by (LD); get a polynomial row h with hψ̃ = 0 and h(θ) = ρ, and put g = h/h_last, regular at θ. B = g − g⁽⁻¹⁾Φ̃ has last entry 0 and Bψ̃ = gψ̃ − (gψ̃)⁽⁻¹⁾ = 0, i.e. B_0 + Σ B_((t;Q))𝔏(t; Q)Ωʷ⁻ʷᵗ⁽ᵗ⁾ = 0. Specialise at θ^(q^j), j ≫ 0, where Ω vanishes: B_0 = 0; dividing by Ω^(w−w_0) for the largest prefix weight w_0 and specialising gives a K̄-relation among the 𝔏(t; Q)(θ)^(q^j) of weight w_0, which is trivial by (LW) and §3.9 (a); so those B vanish, and descending through the weights all B vanish. Then the unipotent gauge equation holds; by §0.0 (rational Frobenius comparisons) the common denominator b of the entries lies in F_q[t]; with δ = b·(entries), X = [[Id, 0], [δ, 1]][[Ψ′, 0], [bf, 1]] satisfies X⁽⁻¹⁾ = diag(Φ′, 1)X, so by uniqueness of rigid trivialisations (§0.0 (rational Frobenius comparisons), which expresses every solution as Ψ times a constant matrix) X = diag(Ψ′, 1)[[Id, 0], [ν, 1]] with ν over F_q(t); δΨ′ + bf = ν lies in T, so ν ∈ F_q[t] (§0.0 (arithmetic series and twist)). Specialise δΨ′ + bf = ν at θ^(q^j): δΨ′ vanishes there, and b, ν, a_i are fixed by twisting, so the Frobenius specialisation of §3.5 gives b(θ)^(q^j)f(θ)^(q^j) = ν(θ)^(q^j); take q^j-th roots, using b(θ) ≠ 0 because θ is transcendental over F_q.

**Checks.**

- For the two indices (w) and (k, q − 1) with Q = H and a = 0 the gauge equation is Ngo Dac’s two-row system (6.3)–(6.4) (§4.7).

- At q = 2, the relation ζ_A(2)+D₁ζ_A(1,1) = 0 gives f_∅(θ) = 0 and f₍₁₎(θ) = D₁Li(1)/π̃ = 1. Omitting the suffix row would lose this nonzero rational coordinate.

*Needs:* §3.10; §3.5; §3.9; §0.0 (entireness and lifting); §0.0 (rational Frobenius comparisons); §0.0 (arithmetic series and twist).

### 3.12 The Eulerian suffix constraint

The setting and conclusion of §3.11. Every index called part of the support has nonzero coefficient; repeated indices are collected first. Under the conclusion of §3.11: (1) if (q − 1) ∤ w and the 𝔏-values come from ACMPL or CMPL periods, then a = 0. (2) For CMPL values (Q = 1) and a nonempty proper prefix s ∈ 𝔦(M): Σ_(s′) a_((s,s′))Li(s′) ∈ K·π̃ʷ⁻ʷᵗ⁽ˢ⁾, so either Σ_(s′) a_((s,s′))Li(s′) = 0 or (q − 1) | (w − wt(s)); if for every nonempty prefix the suffix values Li(s′), (s, s′) ∈ Supp, are K-independent, then every index in the support has (q − 1) | s_2, …, s_r. (3) For MZVs (Q = H), every nonempty proper prefix t gives Σ_i a_iΓ_(suffix_i)ζ_A(suffix_i) ∈ K·π̃ʷ⁻ʷᵗ⁽ᵗ⁾, with i ranging over its support and Γ_(suffix_i) the product of the suffix factorials. If these suffix values are K-independent then the sum is nonzero and (q − 1) | (w − wt(t)). In particular, after discarding zero coefficients, if t belongs to exactly one s_i, then ζ_A(s_i after t)/π̃ʷ⁻ʷᵗ⁽ᵗ⁾ ∈ K, and (q − 1) divides the suffix weight; for indices in I^0_w this forces every entry of s_i after the first position not shared with another index to equal q − 1. (CCM23, Lemma 5.1.1(1) and its proof, pp. 22–24 (CCM23 line 1155); ND21, §5.3 (Step 3), pp. 21–22; §6, Step 3, (6.1), p. 23 (ND21 line 1245); IKLNDP24, §3.3, opening and the consequence of Theorem 2.4, pp. 36–37 (IKLNDP24 line 4065)).

One proof route is the following. f_((s;1))(θ) = Σ_(s′) α_((s,s′))(θ)𝓛(s′)(θ) = Σ_(s′)a_((s,s′))Li(s′)/π̃ʷ⁻ʷᵗ⁽ˢ⁾ lies in K by the criterion and §3.5. A nonzero element of K_∞ that is Eulerian of weight w − wt(s) forces (q − 1) | (w − wt(s)) (§0.14); the support statement follows when the suffix values are independent. For (1): the constant a corresponds to aπ̃^w, and a nonzero a would make π̃^w a combination of elements of C_const = ⋃_n F_(q^n)((1/θ)), impossible for (q − 1) ∤ w by §0.14. For (3), the period specialisation gives f_t(θ) = (Σ_i a_iΓ_(suffix_i)ζ_A(suffix_i))/π̃ʷ⁻ʷᵗ⁽ᵗ⁾ ∈ K. Each factorial is nonzero, so independence of the suffixes makes its numerator nonzero. For an isolated tail this is automatic from nonvanishing. Successive isolated tails, when all entries are < q, force each later entry to equal q − 1.

**Checks.**

- For q = 2 every weight is divisible by q − 1 and the constraint is empty.

*Needs:* §3.11; §3.5; §0.14; §0.5.

### Examples

For s = (2,1), the determinant exponent of Φ is 3 + 1 = 4. For q = 3 and Q = (1,θ⁴), the normalized Gauss exponents for s = (2,2) are −3 and +1; the whole tuple decays along decreasing degree tuples, but the last-coordinate series alone grows. This separates a valid first column from an invalid full matrix.

### Dependencies

Earlier layers 0, 1 (§1.7 is used only by §3.9). The exact target needs above specify each mathematical object and proof-route input. Foundation inputs: §0.0 (Carlitz products), §0.0 (Omega and period), §0.0 (Omega and period), §3.2 (generating series), §0.0 (effective dual t-motives), §0.0 (entireness and lifting), §0.0 (arithmetic series and twist), §0.0 (arithmetic series and twist), §0.0 (rational Frobenius comparisons), §0.0 (entireness and lifting), §0.0 (arithmetic series and twist), §0.0 (rational Frobenius comparisons), §0.0 (arithmetic series and twist), Mathlib Polynomial.

## Layer 4: Frobenius difference solution spaces

The fixed parameter t and the coefficient θ have different Frobenius behaviour. The solution spaces are over F(t); polynomial solutions are localized only when that is explicitly stated.

### 4.1 The Frobenius difference systems (E_M) and their solution spaces

w ≥ 0; M a nonempty finite set of weight-w indices. Let R = {f/g : f ∈ K̄[t], 0 ≠ g ∈ F_q[t]} ⊂ K̄(t), an F_q(t)-algebra stable under the coefficient twist f ↦ f⁽¹⁾ (which fixes F_q(t)). For an index s let 𝔦(s) = {∅, (s_1), (s_1, s_2), …, s} and for a set M let 𝔦(M) = ∪_(s ∈ M)𝔦(s). For w ≥ 0 and ∅ ≠ M ⊂ I_w, the system (E_M) for (ε_s)_(s ∈ 𝔦(M)) ∈ R^(𝔦(M)) is ε_s⁽¹⁾ = (ε_s + Σ ε_((s,n)))(t − θ)ʷ⁻ʷᵗ⁽ˢ⁾ for s ∈ 𝔦(M), the sum over positive integers n with (s, n) ∈ 𝔦(M). Let IND°_0 = {∅} and, for w > 0, IND°_w = {s ∈ IND_w : (q − 1) | s_2, …, s_(dep(s))}; (E_w) is (E_M) for M = IND°_w, and X_w ⊂ R^(𝔦(IND°_w)) is its set of solutions, an F_q(t)-vector space. For arrays of a fixed character ε with γᑫ⁻¹ = ε, the twisted system of Im–Kim–Le–Ngo Dac–Pham asks for δ_((t;ε)) ∈ K̄[t] with δ_((t;ε)) = (δ_((t;ε)) + Σ δ_(child))⁽⁻¹⁾(t − θ)ʷ⁻ʷᵗ⁽ᵗ⁾ at nonempty prefixes and with the children terms multiplied by γ⁽⁻¹⁾ at ∅, δ at a full index being its coefficient a_i(t). (CCM23, §4.2, the ring R and (E_M) with Remark 4.2.1, p. 14; §4.3, (4.3.1), Example 4.3.2, Definition 4.3.3 and Remark 4.3.4, pp. 15–16 (CCM23 line 643); IKLNDP24, proof of Theorem 3.4, (3.4)–(3.5), pp. 37–38 (IKLNDP24 line 4114)).

The interface includes the following facts.

- R = K̄[t] localised at F_q[t] ∖ {0}.
- 𝔦(M), closed under prefixes.
- The system (E_M) as a predicate on R^(𝔦(M)).
- IND°_w.
- X_w as an F_q(t)-subspace of R^(𝔦(IND°_w)).
- For s ∈ M a solution has ε_s ∈ F_q(t).

One proof route is the following. R is stable under twisting because g⁽¹⁾ = g for g ∈ F_q[t]; F_q(t)-linear combinations of solutions are solutions since the twist fixes F_q(t). For s ∈ M the equation reads ε_s⁽¹⁾ = ε_s, so ε_s ∈ F_q(t) (§0.0 (arithmetic series and twist)).

The native descended carrier is `frobeniusSolutionSpace`, the kernel of the F(t)-linear map `frobeniusResidual`; it is not linear over K(t) = F(θ, t), since substituting θ^q for θ does not commute with multiplication by θ. Its coordinates are polynomial functions in θ with coefficients in F(t), indexed by lists; `reducedPrefixes` is precisely the prefix tree of IND°_w. Coordinates outside that finite tree are zero. At a prefix u, the residual is f_u(θᑫ) − (f_u(θ) + Σ_(1≤n≤w) f_((u,n))(θ))(t−θ)ʷ⁻ʷᵗ⁽ᵘ⁾. This is the original X_w after the descent of §4.3, with no degree truncation and no extra solutions: restriction to the tree and zero extension are inverse F(t)-linear maps. In this polynomial presentation the coefficient parameter t is `RatFunc.X`; the polynomial variable is θ. The residual has source and target the native module of list-indexed polynomials.

**Checks.**

- X_0 = F_q(t).
- IND°_q = {(1, q − 1)} and 𝔦(IND°_q) = {∅, (1), (1, q − 1)}.
- For q ≥ 3, IND°_(2q−2) = {(q − 1, q − 1), (2q − 2)}.
- IND°_w differs from IND_w: for q = 3, (1, 1) ∈ IND_2 but (1, 1) ∉ IND°_2 since q − 1 = 2 does not divide 1.
- (E_0) is ε_∅⁽¹⁾ = ε_∅ and X_0 = F_q(t); for w = q, IND°_q = {(1, q − 1)} and (E_q) has three equations; for q ≥ 3 and w = 2q − 2, IND°_w = {(q − 1, q − 1), (2q − 2)} and (E_w) has four equations.
- Scalars of the residual: in weight zero the tree is {∅}. The root coordinate f = 1 has residual 1 − 1 = 0 and t·f has residual t − t = 0, but θ·f has residual θ^q − θ ≠ 0 although θ times the residual of f is 0. So `frobeniusResidual` is F(t)-linear and not F(θ, t)-linear.

*Needs:* §0.10; §0.0 (arithmetic series and twist); §0.0 (arithmetic series and twist).

### 4.2 Monic Frobenius descent

deg_t F ≥ 1 is essential; for a general subring B the twist f ↦ f⁽¹⁾ is the coefficientwise q-th power map, which needs no perfectness. Let F = Σᵢ₌₀ⁿ f_i t^i and G be in A[t], with n = deg_t F ≥ 1 and f_n ∈ F_q^×. If ε ∈ R satisfies ε⁽¹⁾ = εF + G, then ε ∈ F_q(t)[θ]; if ε ∈ K̄[t], then ε ∈ A[t]. More generally, if a subring B of a field of characteristic p is stable under q-th powers, F ∈ B[t] is monic of positive degree, G ∈ B[t], and a polynomial δ over the field satisfies δ⁽¹⁾ = Fδ + G, then δ ∈ B[t]. The twisted variant: if εδ = δ⁽⁻¹⁾(t − θ)^m + F⁽⁻¹⁾ with ε ∈ F_q^×, m ≥ 1, δ ∈ K̄[t] and F ∈ F_q[t, θ] (resp. F̄_q[t, θ]), then δ ∈ F_q[t, θ] (resp. F̄_q[t, θ]); the proof uses ε^q = ε. (CCM23, Lemma 4.2.2 and its proof, pp. 14–15 (CCM23 line 643); IKLNDP24, Lemma 3.3 and its proof, pp. 34–35 (IKLNDP24 line 3949); ND21, §6, Step 3, p. 23 (ND21 line 1379)).

One proof route is the following. Multiply ε by a common denominator g ∈ F_q[t] (g⁽¹⁾ = g) to assume ε ∈ K̄[t] of t-degree m; then G has t-degree m + n. Comparing coefficients of t^i for i = m + n, m + n − 1, …: the top coefficients give aᵢ₋ₙf_n = −g_i − Σ_(j > i−n)a_jfᵢ₋ⱼ, which determines a_m, aₘ₋₁, … successively in A; once i ≤ m the extra term a_i^q appears but involves an already determined coefficient, so every coefficient lies in A (Chang–Chen–Mishiba Lemma 4.2.2). The general and twisted versions are the same descending induction (Im–Kim–Le–Ngo Dac–Pham Lemma 3.3, after Kuan–Lin). Positive degree matters: over B = F_2, F = 1 and G = 1, a root δ ∈ F_4 of δ² − δ = 1 solves δ⁽¹⁾ = δ + 1 without lying in F_2.

**Checks.**

- Applied to Ngo Dac’s equation δ_2⁽¹⁾ = (t − θ^q)ᑫ⁻¹(δ_2 + a_2) it puts δ_2 in A[t].

- Positive degree cannot be dropped: over B = F₂, F = G = 1 and α ∈ F₄ with α² = α+1, both sides of δ⁽¹⁾ = Fδ+G equal α+1, but δ = α is outside B[t].

*Needs:* §4.1; §0.0 (arithmetic series and twist).

### 4.3 The θ-degree bound for solutions

As in §4.1 and §4.2. If (ε_s) ∈ R^(𝔦(M)) solves (E_M) (w ≥ 0, ∅ ≠ M ⊂ I_w), then ε_s ∈ F_q(t)[θ] and deg_θ ε_s ≤ (w − wt(s))/(q − 1) for every s ∈ 𝔦(M). In the twisted form, a solution δ ∈ F_q[t, θ] of εδ = δ⁽⁻¹⁾(t − θ)^m + F⁽⁻¹⁾ has deg_θ δ ≤ max{qm/(q − 1), deg_θ F/q}. (CCM23, Lemma 4.2.3 and its proof, pp. 14–15 (CCM23 line 643); IKLNDP24, Lemma 3.3, second assertion, pp. 34–35 (IKLNDP24 line 3949)).

One proof route is the following. Induct on w − wt(s). For s ∈ M, ε_s ∈ F_q(t). Otherwise the children ε_((s,n)) lie in F_q(t)[θ] by induction; after multiplying the equation by a common denominator g ∈ F_q[t] of ε_s and of the children (g⁽¹⁾ = g), §4.2 applies with F = (t − θ)ʷ⁻ʷᵗ⁽ˢ⁾ and G = g(t − θ)ʷ⁻ʷᵗ⁽ˢ⁾Σε_((s,n)) ∈ A[t], so ε_s ∈ F_q(t)[θ]. If deg_θ ε_s exceeded (w − wt(s))/(q − 1), then deg_θ ε_s⁽¹⁾ = q deg_θ ε_s would exceed both deg_θ(ε_s(t − θ)ʷ⁻ʷᵗ⁽ˢ⁾) and the degrees of the other terms (bounded by induction), a contradiction. The twisted bound is the same comparison of θ-degrees after twisting once.

**Checks.**

- For s ∈ M the bound gives deg_θ ε_s ≤ 0, consistent with ε_s ∈ F_q(t).

*Needs:* §4.1; §4.2.

### 4.4 The key lemma: relations give solutions of (E_M)

Coefficients a_s cleared to lie in A (so a_s|_(θ=t) ∈ F_q[t]); w > 0 for (2) to be non-trivial. Let w ≥ 0, ∅ ≠ M ⊂ I_w and P = Σ a_s[s] ∈ H with a_s ∈ K and Supp(P) ⊂ M. Suppose Li_P(1) = Σ a_s Li(s) ∈ K·π̃^w and, for each 0 ≤ ℓ < w, the values Li(s), s ∈ 𝔦(M) ∩ I_ℓ, are K-linearly independent. Then (1) for each s ∈ 𝔦(M), Σ_(s′) a_((s,s′))Li(s′) = 0 or (q − 1) | (w − wt(s)) (§3.12); and (2) (E_M) has a solution (ε_s) ∈ F_q(t)[θ]^(𝔦(M)) with ε_s = a_s|_(θ=t) for every s ∈ M. (CCM23, Lemma 5.1.1 and its proof, pp. 22–24 (CCM23 line 1155)).

One proof route is the following. Apply §3.11 to the pairs (s; 1), s ∈ M, with a = −c where Li_P(1) = cπ̃^w; its hypotheses are the assumptions. The gauge equation [[Id, 0], [g, 1]]⁽⁻¹⁾[[Φ′, 0], [v, 1]] = [[Φ′, 0], [0, 1]][[Id, 0], [g, 1]] has rational entries with denominator in F_q[t] (§0.0 (rational Frobenius comparisons)); put ε_s = g_s⁽⁻¹⁾ for s ∈ 𝔦(M) ∖ M and ε_s = a_s|_(θ=t) for s ∈ M. Reading the gauge equation row by row gives exactly (E_M); §4.3 puts the solution in F_q(t)[θ].

**Checks.**

- For M = {(w)} the system is ε_∅⁽¹⁾ = (ε_∅ + ε_((w)))(t − θ)^w, ε_((w))⁽¹⁾ = ε_((w)).

*Needs:* §3.11; §3.12; §4.1; §4.3; §0.0 (rational Frobenius comparisons).

### 4.5 The dimension of the solution space X_w

w ≥ 0. For every w ≥ 0, X_w is finite-dimensional over F_q(t), and dim_(F_q(t))X_w = 1 if (q − 1) | w and 0 otherwise. When w = ℓ(q − 1), a generator (η_(ℓ;s)) can be chosen with η_(ℓ;∅) = Σᵢ₌₀^(ℓ)b_(ℓi)(t − θ)^i, b_(ℓℓ) = 1 and b_(ℓi) ∈ T·F_p[T]_((T)) for i < ℓ, where T = t − t^q and F_p[T]_((T)) is the localisation at (T). (CCM23, Theorem 4.3.5 and its proof, pp. 16–21 (CCM23 line 753)).

One proof route is the following. By §4.3, X_w ⊂ F_q(t)[θ]^(𝔦(IND°_w)) with deg_θ ε_∅ ≤ ℓ when w = ℓ(q − 1) + s′, 0 ≤ s′ < q − 1. The equations at nonempty prefixes (ℓ − j)(q − 1) [+ s′] are copies of (E_(j(q−1))), so by induction on ℓ the children of ∅ are f_j·(normalised generators of lower weight), f_j ∈ F_q(t). Write ε_∅ = Σ a_i(t − θ)^i and substitute into the root equation; using t − θ^q = T + (t − θ)^q with T = t − t^q and comparing coefficients of (t − θ)^ν for ν = iq (i < ℓ − m) and ν ≥ w gives a square (or one-larger) linear system U(a, f)^T = a_ℓ b over F_p[T]_((T)). In the divisible case write ℓ = mq + n with 0 ≤ n < q; there are ℓ root coefficients and ℓ−m child coefficients, hence 2ℓ−m unknowns and equations. det(U mod T) = ±1 by the explicit block structure (identity, then −Id_n and m blocks −Id_(q−1) with inserted unit rows), so U is invertible over the local ring: the solution is unique up to the free parameter a_ℓ when (q − 1) | w, and zero when (q − 1) ∤ w.

The headline `frobenius_solution_dimension` states finite generation over F(t) together with this dimension on the descended carrier; a zero natural finrank alone would not exclude an infinite-dimensional space. At q = 3 and ℓ = 7 = 2·3+1, the coefficient system has 7+5 = 12 unknowns; 2(ℓ−m) would give 10 and omits two unknowns (CCM23 proof of Theorem 4.3.5, CCM23 line 855).

**Checks.**

- X_0 = F_q(t); for q = 2 every weight is divisible by q − 1 and X_w is a line; for q = 3 and w = 5, X_5 = 0.

- At w = q−1, the polynomial solution with root coordinate tᑫ−θ and leaf coordinate t−tᑫ gives tᑫ−θᑫ on both sides, since their sum is t−θ. At q = 3 and w = 1, a degree-zero root a gives a = (a+b)(t−θ), forcing a+b = 0 and a = b = 0.

*Needs:* §4.1; §4.3.

### 4.6 Solutions of the character-twisted system

Finite support of distinct weight-w arrays with q dividing none of their entries, later entries divisible by q − 1, and characters (ε, 1, …, 1); b = 1 after clearing a common denominator. In the twisted system of §4.1 attached to a putative relation a + Σ a_i𝔏𝔦(s_i; ε_i)(θ) = 0 with s_i ∈ J′_w and all ε_i of character ε under the explicit reduced-support hypotheses (q − 1) | sᵢ₂, … and ε_i = (ε, 1, …, 1): every solution has, at each nonempty prefix t with m_t = (w − wt(t))/(q − 1), the form δ_t = f_t(X^(m_t) + Σ_(i<m_t)P_(t,i)(T)X^i) with X = t^q − θ^q, T = t − t^q, f_t ∈ F_q[t], P_(t,i) ∈ F_q(y) of y-adic valuation ≥ 1, and the f of children are F_q(T)-multiples of f_t. If (q − 1) ∤ w, or (q − 1) | w and ε ≠ 1, the only solution is zero; if (q − 1) | w and ε = 1, any two polynomial solutions are proportional over F_q(t). Thus their span in the localised ambient space has dimension at most one; existence of a nonzero solution for an arbitrary chosen support is not asserted. (IKLNDP24, proof of Theorem 3.4, §3.3 claims 1)–2), Case 1 and Case 2 with its subcases, pp. 37–42 (IKLNDP24 line 4114)).

After one forward coefficient twist the vanishing part reads as follows on the full reduced tree 𝔦(IND°_w) of §4.1. Let w > 0, ε ∈ Fˣ, γ ∈ K̄ with γ^(q−1) = ε, and let δ be a family of polynomials in K̄[t] indexed by lists, zero outside `reducedPrefixes` and satisfying at every node l of that tree δ_l⁽¹⁾ = (δ_l + c_l Σ_(1≤n≤w) δ_((l,n)))(t − θ^q)^(w − wt(l)), with c_∅ = γ and c_l = 1 otherwise. If (q − 1) ∤ w or ε ≠ 1, then δ = 0. The forward twist is bijective on K̄[t], so this system is equivalent to the inverse-twisted system of §4.1 (IKLNDP24 (3.4)–(3.5), lines 4164–4171). At a leaf the equation reads δ_l⁽¹⁾ = δ_l, so leaf coordinates lie in F_q[t]. A smaller support extends by zero to a solution on the full tree. When ε = 1 one has γ ∈ F_qˣ, and dividing the root coordinate by γ gives the untwisted system, whose polynomial solutions lie in X_w of §4.5 after δ ↦ δ⁽⁻¹⁾.

One proof route is the following. Induct on m_t: at leaves δ = a_i(t) ∈ F_q[t]; at an inner prefix, §4.2 and §4.3 give δ_t ∈ K[t] of θ-degree ≤ m_tq and divisible by (t − θ)^((q−1)m_t); write δ_t = F(t − θ)^((q−1)m_t) with deg_θ F ≤ m_t. Since F(t − θ)^((q−1)m_t) lies in F_q[t, θ^q], F = Σ_(0 ≤ i ≤ m_t/q)f_(m_t−iq)(t − θ)^(m_t−iq) with f ∈ F_q[t], so F(t − θ)^((q−1)m_t) = Σ f_(m_t−iq)X^(m_t−i) and F⁽¹⁾ = Σ f_(m_t−iq)(T + X)^(m_t−iq); comparing powers of X gives a linear system with matrix B over F_q(y), y = T, whose diagonal entries are ±1 and whose subdiagonal entries have positive y-adic valuation, whence the stated form. At the root, with the extra factor γ⁽⁻¹⁾ = γ/ε: if (q − 1) ∤ w a θ-degree comparison forces deg_θ δ ≤ mq and the same triangular system has only the zero solution. If (q − 1) | w, comparing the top coefficient gives εf_m = f_m; so ε ≠ 1 forces f_m = 0 and then everything vanishes, while ε = 1 leaves one free parameter. The comparison proves uniqueness up to a rational factor when solutions exist. Multiplying a polynomial solution by an arbitrary element of F_q(t) need not preserve polynomiality, and a smaller support can force the free parameter to vanish.

**Checks.**

- For q = 2 the character is trivial; after ε_t = δ_t⁽⁻¹⁾ and localising at F_q[t] ∖ {0}, the system on the full reduced support is (E_w). A smaller support is extended by zero.
- Weight zero must be excluded: the tree is {∅}, the root equation is δ_∅⁽¹⁾ = δ_∅, and δ_∅ = 1 is a nonzero solution for every ε. No weight-zero array has a nontrivial character.
- At q = 3 and w = 2 the reduced tree is {∅, (2)}, since (1, 1) has a later entry not divisible by 2. With γ = 1, δ_∅ = t³ − θ³ and δ_((2)) = t − t³ solve the system: the root equation has t³ − θ⁹ = (t − θ³)³ on both sides, and the leaf has coefficients in F_3. With γ² = −1 (so ε = −1) the same pair leaves the root residual (1 − γ)(t − t³)(t − θ³)² ≠ 0, as the vanishing statement requires.

*Needs:* §4.1; §4.2; §4.3.

The vanishing headline on the full tree, with positive weight, the displayed root equation, support restriction and coefficient twist, is `twisted_system_rigidity`.

### 4.7 Ngo Dac’s two-row system in weights q < w ≤ 2q − 1

q > 2; H_k = H_(q−1) = 1 and H_w = (t^q − t) + (k − 1)(t^q − θ^q) (§3.1). Let q > 2, w = q + k − 1 with 2 ≤ k ≤ q (so q < w ≤ 2q − 1), and let δ_1, δ_2 ∈ K̄[t], a_1, a_2 ∈ F_q[t] satisfy δ_1 = (δ_1 + δ_2H_k + a_1H_w)⁽⁻¹⁾(t − θ)^w and δ_2 = (δ_2 + a_2H_(q−1))⁽⁻¹⁾(t − θ)ᑫ⁻¹ (Ngo Dac (6.3)–(6.4)). Then a_2 = 0; for 2 ≤ k < q − 1 and for k = q (w = 2q − 1, H_w = θ^q − t) the only solution is δ_1 = δ_2 = 0, a_1 = a_2 = 0, while for k = q − 1 the solutions with a_2 = 0 are δ_2 = 0, δ_1 = a(t − θ)²ᑫ, a_1 = a(t^q − t) with a ∈ F_q[t] (the Eulerian weight 2q − 2). In particular there is no solution with a_1a_2 ≠ 0. In detail: δ_1, δ_2 ∈ A[t]; δ_2 = f(θ^q − t^q) and a_2 = f(t^q − t) for a unique f ∈ F_q[t]; deg_θ δ_1 ≤ ⌊qw/(q − 1)⌋; and the coefficient comparisons in θ force f = 0. Consequently, for q > 2, ζ_A(2q − 1) and ζ_A(q, q − 1) are K-linearly independent, so ζ_A(q, q − 1) is not a K-multiple of ζ_A(2q − 1). (ND21, §6, Step 3, (6.2)–(6.5), pp. 23–24 (ND21 line 1379); for k = q, the separation used in IKLNDP-NOTE §5.9.1, p. 30 (IKLNDP-NOTE line 1836), which is also the case i = q, j = 1 excluded by LND-ZETALIKE, Theorem 1.3, p. 4 (LND-ZETALIKE line 157)).

One proof route is the following. Twisting once and §4.2 put δ_1, δ_2 in A[t]; a θ-degree comparison bounds deg_θ δ_2 ≤ q and deg_θ δ_1 ≤ ⌊qw/(q − 1)⌋. Second row: (θ^q − t^q, t^q − t) is a particular solution; the difference Δ = (t^q − t)δ_2 − a_2(θ^q − t^q) satisfies Δ = Δ⁽⁻¹⁾(t − θ)ᑫ⁻¹, so Δ = 0 by t-degree; evaluating at t = β ∈ F_q shows t^q − t divides a_2, giving the unique f. First row: δ_1 is divisible by (t − θ)^w, with an integral quotient of θ-degree ≤ 1 (k < q − 1) or ≤ 2 (k = q − 1); write δ_1 = (aθ + b)(t − θ)^w, resp. (aθ² + bθ + c)(t − θ)^w, with a, b, c ∈ F_q[t]. Interior case: comparing the coefficients of θ^k and θᵏ⁻¹ gives a = b = 0, then θ^q gives f = (k − 1)a_1, and finally (t^q − t)a_1 = 0, so a_1 = 0 and f = 0. Endpoint: the coefficients of θ²ᑫ⁻¹, θ²ᑫ⁻² give aθ² + bθ + c = a(t − θ)²; with h = a(t^q − t) − a_1 one obtains h[(t − θ^q)² − (t − θ)²ᑫ] = (θ^q − t^q)f(t^q − t); substituting θ = t gives h = 0, and then f = 0, so a_2 = 0 and a_1 = a(t^q − t). Conversely these are solutions, by the identity (t^q − t)[(t^q − t) − 2(t^q − θ^q)] = (t − θ^q)² − (t^q − θ^q)². Boundary case k = q: here ⌊qw/(q − 1)⌋ = 2q + 1, so δ_1 = (aθ² + bθ + c)(t − θ)^(2q−1); twisting the first row once and cancelling (t − θ^q)^(2q−1) gives aθ^(2q) + bθ^q + c = (aθ² + bθ + c)(t − θ)^(2q−1) + f(θ^q − t^q) + a_1(θ^q − t). The coefficients of θ^(2q+1), θ^(2q) and θ^(2q−1) on the right are −a, −b (once a = 0) and −c (once a = b = 0), while the left has no such terms (2q − 1 > q as q > 2); so a = b = c = 0. What remains is (f + a_1)θ^q − ft^q − a_1t = 0, whence a_1 = −f, f(t^q − t) = 0 and f = a_1 = a_2 = 0. For the consequence, a relation a_1Γ_(2q−1)ζ_A(2q − 1) + a_2Γ_qΓ_(q−1)ζ_A(q, q − 1) = 0 with a_1, a_2 ∈ A not both zero has both coefficients nonzero by §0.5; §3.11 applied to the pairs ((2q − 1); H) and ((q, q − 1); H) with a = 0, where I = {∅, (q)} and (LW) is the nonvanishing of ζ_A(q) (§0.5, §3.5), turns it into the k = q system with b·a_1(t) and b·a_2(t) nonzero, which is impossible. Ngo Dac’s argument only needs the absence of solutions with a_2 ≠ 0, since the putative relation involves both indices with nonzero coefficients (§5.3).

**Checks.**

- For q = 3, w = 4 (k = 2), take a = 1: a_1 = t³ − t, a_2 = δ_2 = 0 and δ_1 = (t − θ)^6 satisfy both rows. This catches the false assertion that every solution is zero; a_2 ≠ 0 is what the independence proof excludes.
- For q = 3 and k = 3 (w = 5), H_5 = θ³ − t and δ_1 = (aθ² + bθ + c)(t − θ)⁵. After a = b = c = 0 the first row leaves the residual (f + a_1)θ³ − ft³ − a_1t, which vanishes only for f = a_1 = 0 since t³ − t ≠ 0; unlike the Eulerian endpoint k = 2 there is no nonzero solution. So ζ_A(3, 2) is not a K-multiple of ζ_A(5), whereas ζ_A(5) = −D_1ζ_A(1, 4) is (§2.13).

*Needs:* §4.2; §4.3; §3.1; §3.11; for the consequence also §0.5 and §3.5.

The headline `two_row_rigidity` states a₂ = δ₂ = 0 and the exact Eulerian line when k = q−1, with δ₁ = a(t−θ)^(2q), a₁ = a(t^q−t) for a ∈ F_q[t]; at other k in 2 ≤ k ≤ q it gives δ₁ = a₁ = 0. Its equations use the equivalent forward twist on K̄[t], fix t, and use the explicit H_(q+k−1) of §3.1.

### Examples

At q = 3, X₅ has dimension zero while X₄ has dimension one. In the two-row endpoint at q = 3 and w = 4, δ₁ = (t−θ)⁶, a₁ = t³−t and δ₂ = a₂ = 0 give a nonzero solution. Only solutions with a₂ ≠ 0 are excluded by that argument.

### Dependencies

Earlier layers 0, 3. The exact target needs above specify each mathematical object and proof-route input. Foundation inputs: §0.0 (arithmetic series and twist; rational Frobenius comparisons).

## Layer 5: independence, bases and dimensions

Every spanning family has fixed weight. Linear relations have collected distinct support and nonzero coefficients on that support; smaller-weight induction supplies both prefix and suffix independence.

### 5.1 Independence of small-entry multiple zeta values

w ≥ 1. For every w ≥ 1 the MZVs ζ_A(s), s ∈ I^0_w (every entry < q), are K-linearly independent, hence K̄-linearly independent; so dim_K Z_w ≥ |I^0_w| = c(w). (ND21, Theorem B, p. 3, and its proof, §5, pp. 18–22; Remark 5.1, p. 22 (ND21 line 120)).

The K-independence headline is `small_entry_independent`.

One proof route is the following. Induct on w; for w = 1, ζ_A(1) ≠ 0. A relation with a single index is impossible by §0.5, so assume a relation Σ a_iΓ_(s_i)ζ_A(s_i) = 0, a_i ∈ A ∖ {0}, with at least two indices. I^0 is closed under taking prefixes (§0.10), so by induction and §3.9 the lower-weight prefix values are independent: (LW) holds, and §3.11 applies with Q = H and a = 0. By §3.12 (3), every entry of s_i after its first unshared position equals q − 1. Choose two indices with a common prefix of maximal length m; their remaining entries after position m + 1 all equal q − 1 and their weights agree, so their (m + 1)-th entries are congruent modulo q − 1 and lie in [1, q − 1], hence equal, contradicting maximality.

The native signature includes w = 0: I⁰₀ = {∅} and the family consists of 1, which is K-linearly independent.

**Checks.**

- For q = 2, I^0_w = {(1, …, 1)} and the theorem says ζ_A(1, …, 1) ≠ 0.

*Needs:* §3.11; §3.12; §3.9; §3.8; §0.5; §0.10; §0.12.

### 5.2 Thakur’s basis through weight q

1 ≤ w ≤ q. For 1 ≤ w ≤ q, I^T_w = I^0_w and {ζ_A(s) : s ∈ I^T_w} is a K-basis of Z_w; dim_K Z_w = d(w). (ND21, Corollary C, p. 4 (ND21 line 171)).

One proof route is the following. For w ≤ q, an index of weight w all of whose entries are ≤ q and whose last entry is < q has all entries < q, unless it is (q), which lies in neither family; so I^T_w = I^0_w. Spanning is §2.7 and independence §5.1; the count is §0.12.

**Checks.**

- dim_K Z_1 = 1, dim_K Z_2 = 2 for q > 2, and dim_K Z_q = 2ᑫ⁻¹ − 1.

*Needs:* §5.1; §2.7; §0.12.

### 5.3 Independence of q-indivisible MZVs through weight 2q − 2

q > 2, w ≤ 2q − 2. For q > 2 and 1 ≤ w ≤ 2q − 2, the MZVs ζ_A(s), s ∈ IND_w, are K-linearly independent. (ND21, Theorem 6.2 and its proof, pp. 22–24; Remark 6.3, p. 24 (ND21 line 1333)).

The bounded-weight headline is `q_indivisible_independent`, retaining q > 2 and w ≤ 2q−2.

One proof route is the following. Induct on w. For w ≤ q, IND_w = I^0_w and §5.1 applies. For q < w ≤ 2q − 2, apply strong induction also to the prefixes and suffixes of each supported index, all of which remain q-indivisible and have smaller weight. Prefix independence supplies (LW). For each nonempty proper prefix t, §3.12 (3) gives a factorial-weighted suffix combination in K·π̃ʷ⁻ʷᵗ⁽ᵗ⁾; suffix independence and nonzero collected coefficients make this combination nonzero. Thus (q − 1) | (w − wt(t)). Comparing successive prefixes forces every entry after the first to be divisible by q − 1. With w ≤ 2q − 2 this leaves only (w) and (k, q − 1), k = w − q + 1 ∈ [2, q − 1], so the relation is a_1Γ_wζ_A(w) + a_2ζ_A(k, q − 1) = 0 with a_1, a_2 ≠ 0 (single-index relations being excluded as in §5.1). Its gauge equation is the two-row system, which has no solution with nonzero a_1, a_2 (§4.7).

The native signature includes w = 0 as well: IND₀ = {∅}, with the independent value 1; its stated upper weight bound and q > 2 remain unchanged.

**Checks.**

- At w = 2q − 1 the statement fails: ζ_A(2q − 1) + D_1ζ_A(1, 2q − 2) = 0 (§2.13).

*Needs:* §5.1; §3.11; §3.12; §4.7; §0.10.

### 5.4 Thakur’s basis through weight 2q − 2

1 ≤ w ≤ 2q − 2. For every prime power q and 1 ≤ w ≤ 2q − 2, {ζ_A(s) : s ∈ I^T_w} is a K-basis of Z_w, and dim_K Z_w = d(w). (ND21, Theorem D, p. 4, and its proof, p. 24 (ND21 line 171)).

One proof route is the following. For q = 2, 2q − 2 = q and this is §5.2. For q > 2, §5.3 gives d(w) = |IND_w| independent elements of Z_w, while §2.7 gives dim_K Z_w ≤ d(w) with I^T_w spanning; so I^T_w is a basis.

**Checks.**

- For q = 3, w = 4: I^T_4 = {(1,1,1,1), (1,1,2), (1,2,1), (2,1,1), (2,2), (3,1)} is a basis of Z_4 and dim_K Z_4 = 6.

*Needs:* §5.3; §5.2; §2.7; §0.12.

### 5.5 The CMPL basis indexed by IND_w

w ≥ 0 (IND_0 = {∅}, Li(∅) = 1). For every w ≥ 0, the values Li(s), s ∈ IND_w, form a K-basis of Z_w. (CCM23, Theorem 5.2.1 and its proof, p. 25 (CCM23 line 1370)).

The headline signature `cmpl_ind_basis` states independence and the exact span.

One proof route is the following. They span Z_w by §2.11; it remains to show independence, by induction on w (w = 0 is clear). Let P = Σ α_s(θ)[s] be a relation supported on IND_w. IND is prefix-closed, so the lower-weight hypothesis of §4.4 holds by induction; part (1) and induction give Supp(P) ⊂ IND°_w, and part (2) with M = IND°_w gives (ε_s) ∈ X_w with ε_s = α_s on IND°_w. If (q − 1) ∤ w, X_w = 0 (§4.5), so P = 0. If (q − 1) | w, π̃^w ∈ Z_w (§1.8), so by §2.11 there is P_w ≠ 0 supported on IND_w with Li_(P_w)(1) = π̃^w; the key lemma gives Supp(P_w) ⊂ IND°_w and a solution (ε′_s) ∈ X_w; X_w is a line, so (ε_s) = α(ε′_s) and P = α(θ)P_w, whence 0 = Li_P(1) = α(θ)π̃^w and α = 0.

**Checks.**

- For q = 3, IND_4 = {(4), (2, 2), (2, 1, 1), (1, 2, 1), (1, 1, 2), (1, 1, 1, 1)} gives six independent values Li(s) spanning Z_4.

*Needs:* §2.11; §4.4; §4.5; §1.8; §0.10.

### 5.6 Thakur’s basis theorem and Todd’s dimension formula

w ≥ 1. For every w ≥ 1, {ζ_A(s) : s ∈ I^T_w} is a K-basis of Z_w; hence dim_K Z_w = d(w) (Todd’s dimension conjecture, the analogue of Zagier’s conjecture) and Thakur’s basis conjecture (the analogue of Hoffman’s) holds. The same family is a K̄-basis of the K̄-span 𝒵_w of the weight-w MZVs. (CCM23, Theorem 1.2.4, p. 3; §5.3, p. 25; Remark 1.2.6, p. 3 (CCM23 line 102); IKLNDP24, Theorem B, p. 5; §4.3.2, p. 54 (IKLNDP24 line 208)).

The K-basis headline is `thakur_basis`; `todd_dimension` states its dimension formula. Their weight-zero cases include the empty basis index and the one-dimensional scalar space.

One proof route is the following. {ζ_A(s) : s ∈ I^T_w} spans Z_w (§2.7), and dim_K Z_w = |IND_w| = d(w) by §5.5 and §0.12; a spanning family of d(w) elements in a space of dimension d(w) is a basis. Independently, Im–Kim–Le–Ngo Dac–Pham obtain dim_K Z_w ≥ d(w) from CMPLs (§5.12) and conclude with Ngo Dac’s spanning theorem. K̄: the elements have the MZ property of weight w (§3.8), so K-independence implies K̄-independence (§3.9 (a)).

The algebraic-closure headline is `thakur_basis_algebraicClosure`. It states independence and equality of the two K̄-spans in any common overfield E of K∞ and an algebraic closure of K whose K-embeddings agree. Both scalar-tower compatibilities are explicit in its signature; C∞ is one such overfield. Changing E does not change a linear dependence in the common compositum.

**Checks.**

- dim_K Z_w for q = 2 is the Fibonacci number d(w); for q = 3, dim_K Z_5 = d(4) + d(3) + d(2) = 11.

*Needs:* §5.5; §2.7; §0.12; §3.9; §3.8.

### 5.7 All linear relations among multiple zeta values

w ≥ 1. For w ≥ 1 let 𝔏^ζ_w : H_w → Z_w be the realisation and R_w = Span_K{[s] − U^ζ(s) : s ∈ I_w ∖ I^T_w}. Then Ker 𝔏^ζ_w = R_w, and Ker(𝔏^ζ : H → K_∞) = ⊕_(w ≥ 1)R_w. After extension of scalars to K̄, the same relations generate all K̄-linear relations among MZVs. (CCM23, Theorem 5.4.2 and its proof, pp. 25–26 (CCM23 line 1370)).

One proof route is the following. R_w ⊂ Ker 𝔏^ζ_w by §2.10 (1); since U^ζ fixes I^T, R_w = Span{P − U^ζ(P) : P ∈ H_w}. With e from §2.10 (2), P ≡ U^ζ(P) ≡ ⋯ ≡ (U^ζ)^e(P) modulo R_w, so H_w/R_w is spanned by the image of I^T_w. Hence d(w) ≥ dim H_w/R_w ≥ dim H_w/Ker 𝔏^ζ_w = dim Z_w = d(w) (§5.6), forcing Ker 𝔏^ζ_w = R_w. Across weights, Chang’s grading theorem (§3.9 (b)) shows that a relation among MZVs of mixed weights splits into homogeneous relations, giving ⊕R_w; over K̄ the same argument applies to 𝒵 = K̄ ⊗_K Z.

**Checks.**

- For w = q, R_q contains [q] − L_1[1, q − 1], which is R_1.
- At q = 2, I_1 = I^T_1 = {(1)}, so R_1 = 0, of dimension 1 − 1 = 0. The plausible wrong choice R_w = H_w would put [1] in the kernel, although ζ_A(1) ≠ 0.
- At q = 2, R_2 has the basis [2] − U^ζ(2) = [2] + D_1[1, 1], realised by ζ_A(2) + D_1ζ_A(1, 1) = 0; its dimension is 2 − 1 = 1.
- At q = 2, R_3 has the basis [1, 2] + D_1([1, 1, 1] + [2, 1]) and [3] + D_1[1, 2] (from U^ζ(1, 2) and U^ζ(3) of §2.9–§2.10), with distinct pivots [1, 2] and [3]; both realise to zero, and the dimension is 4 − 2 = 2.

*Needs:* §5.6; §2.10; §2.9; §1.4; §3.9.

### 5.8 Character splitting of relations among ACMPL periods

(q − 1)-th roots fixed once for all. If ε_1, …, ε_n ∈ F_q^× are distinct and γ_i ∈ F̄_q are (q − 1)-th roots of ε_i, then γ_1, …, γ_n are linearly independent over K_∞ = F_q((1/θ)). Consequently, if Σ_i a_i𝔏𝔦(s_i; ε_i)(θ) = 0 with a_i ∈ K and all s_i of weight w, then for each character ε the subsum over the i with χ(ε_i) = ε vanishes. (IKLNDP24, Lemmas 3.1 and 3.2 with proofs, pp. 33–34 (IKLNDP24 line 3844)).

One proof route is the following. If ε generates F_q^×, Xᑫ⁻¹ − ε is irreducible over F_q (a factor of degree d would give γ^(gcd(d, q−1)) ∈ F_q^×, contradicting that ε generates), so 1, γ, …, γᑫ⁻² are F_q-independent; every γ_i is an F_q^×-multiple of a power γ^(k_i) with distinct k_i. F_q(γ) and F_q((1/θ)) are linearly disjoint over F_q (constant field extension), so F_q-independence passes to K_∞-independence. By §3.5, 𝔏𝔦(s_i; ε_i)(θ) = γᵢ₁⋯γ_(iℓ_i)Li(ε_i; s_i)/π̃^w, and γᵢ₁⋯γ_(iℓ_i) is a (q − 1)-th root of χ(ε_i); grouping by character and applying the independence of the roots gives the subsums.

**Checks.**

- For q = 3, γ = √−1 and 1 are independent over F_3((1/θ)).

*Needs:* §3.5; §0.6.

The root independence headline is `character_roots_independent`, stated in any field E containing K∞ with the given (q−1)-st power equations.

### 5.9 Relations among normalised ACMPL periods

w ≥ 1. Let w ≥ 1 and consider K-linear relations a + Σ_i a_i𝔏𝔦(s_i; ε_i)(θ) = 0 with a, a_i ∈ K and s_i ∈ J′_w (no entry divisible by q). They form a K-vector space of dimension at most one, every nonzero relation has a ≠ 0, forces (q − 1) | w, and involves only arrays with trivial character ε_i = (1, …, 1); if (q − 1) | w there is exactly one such relation with a = 1. In particular the ACMPL values Li(ε; s), (ε; s) ∈ AS_w, are K-linearly independent. (IKLNDP24, Theorem 3.4, p. 35, and its proof, §3.3, pp. 36–42; Remark 3.5, p. 36 (IKLNDP24 line 4010)).

One proof route is the following. Induct on w. For w = 1 and q > 2 use §5.8 and §3.12 (1); for q = 2, Li(1) = ζ_A(1) = −π̃/D_1. Work by strong induction on this relations theorem for the normalised periods, with distinct arrays and nonzero collected coefficients. Character splitting leaves one total character. The absence of homogeneous relations in smaller weight gives (LW) for the prefix periods. For each nonempty prefix, the independence criterion makes its suffix combination a scalar in K; the induction hypothesis applied to that lower-weight relation, including its constant term, forces every supported suffix character to be trivial and its weight divisible by q − 1. Varying the prefix therefore gives later characters 1 and later entries divisible by q − 1. This uses the full induction hypothesis, beyond the valuation conclusion of §3.12; that lemma also gives a = 0 when (q − 1) ∤ w. The gauge equation is the twisted system; §4.6 shows it has no nonzero solution unless (q − 1) | w and ε = 1, in which case any solutions are proportional over F_q(t), so the relations form a space of dimension ≤ 1 with trivial characters. The leaf coordinates determine the coefficients. Embed every support in the full finite family AS_w, assigning zero to omitted coefficients. Rational proportionality in this one ambient system specialises to K-proportionality of its relation coefficients, so the full relation space has dimension at most one. The relation with nonzero constant term constructed in the next step then excludes every nonzero homogeneous relation. Existence when w = m(q − 1): expand Li(q − 1)^m in AS_w by §2.12; since Li(q − 1) = −D_1⁻¹π̃ᑫ⁻¹ (§0.13), this gives (−D_1)⁻ᵐπ̃^w − Σ a_i Li(ε_i; s_i) = 0 with a ≠ 0. The operators of §1 preserve characters, so this expansion involves only trivial characters and is a relation of the required form. Independence of AS_w: a K-relation among the Li(ε; s) of mixed characters becomes, by the period formula, a K̄-relation among the 𝔏𝔦-values; since these have one weight and are K-independent with a = 0 by the first part, §3.9 (a) makes them K̄-independent.

**Checks.**

- For q = 2 and w = 1 the relation is 1 + D_1𝔏𝔦((1); (1))(θ) = 0, i.e. π̃ + D_1 Li(1) = 0.

*Needs:* §5.8; §3.11; §3.12; §4.6; §2.12; §0.13; §3.9.

### 5.10 The Hoffman-like basis of alternating polylogarithm values

w ≥ 1. For every w ≥ 1, the ACMPL values Li(ε; s), (ε; s) ∈ AS_w, form a K-basis of AL_w; hence dim_K AL_w = s(w). (IKLNDP24, Theorem 3.6 and its proof, p. 36 (IKLNDP24 line 4065)).

The headline `alternating_hoffman_basis` states independence and the span AZ_w; §2.8 identifies it with AL_w.

One proof route is the following. Independence: §5.9. Spanning: §2.12. Count: §0.12.

The native signature includes weight zero, with the single empty-character value 1 and both alternating spaces equal to K.

**Checks.**

- dim_K AL_1 = q − 1, spanned by Li(ε; 1), ε ∈ F_q^×.

*Needs:* §5.9; §2.12; §0.12.

### 5.11 The dimension of alternating multiple zeta values

w ≥ 1. For every w ≥ 1, dim_K AZ_w = s(w), and the ACMPL values Li(ε; s), (ε; s) ∈ AS_w, which lie in AZ_w, form a K-basis of AZ_w. (IKLNDP24, Theorem A, p. 4; §4.2, p. 54 (IKLNDP24 line 148)).

The dimension headline is `alternating_dimension`.

One proof route is the following. AZ_w = AL_w (§2.8), and §5.10.

At weight zero the native signature has dim_K AZ₀ = s(0) = 1.

**Checks.**

- dim_K AZ_1 = q − 1; for q = 3, dim_K AZ_4 = 46; for q = 2, dim_K AZ_w = d(w).

*Needs:* §5.10; §2.8.

### 5.12 The lower bound dim_K Z_w ≥ d(w) through CMPLs

w ≥ 1. For every w ≥ 1, the CMPL values Li(s), s ∈ J′_w = IND_w, lie in Z_w and are K-linearly independent; hence dim_K Z_w ≥ d(w). (IKLNDP24, Proposition 4.10 and its proof, pp. 54–55 (IKLNDP24 line 6420)).

One proof route is the following. Li(s) ∈ Z_w: by the trivial-character version of §2.7 every CMPL of weight w is a K-combination of Li(t), t ∈ J_w = I^T_w, and Li(t) = ζ_A(t) ∈ Z_w (§0.8). Independence: the trivial-character case of §5.9. |J′_w| = d(w) (§0.12).

**Checks.**

- For w ≤ q this is §5.2.

*Needs:* §5.9; §2.7; §0.8; §0.12.

### 5.13 Direct bounds for alternating MZVs in small weights

The stated weight ranges. (1) For w ≤ 2q − 2, the AMZVs ζ_A(ε; s) with (ε; s) ∈ AT^1_w = AJ^1_w span AZ_w, so dim_K AZ_w ≤ s(w) without ACMPLs. The direct spanning target has the range w ≤ 2q − 2. (2) For every q and w ≤ 3q − 2, the AMZVs in the explicit set AT′_w are K-linearly independent; for w ≤ 3q − 3 moreover |AT′_w| = s(w), so dim_K AZ_w ≥ s(w). Here AT′_w consists of the ζ_A(ε; s) with characters 1 over the entries q and 2q − 1 and with s ∈ I′_w: for w ≤ 2q − 2, the indices with no entry equal to q; for 2q − 1 ≤ w ≤ 3q − 3, those with no entry in {q, 2q − 1, 2q} or with exactly one consecutive pair (q − 1, q); for w = 3q − 2 and q > 2, those with no entry in {q, 2q − 1, 2q, 3q − 2}, those other than (q − 1, q − 1, q) with exactly one consecutive pair equal to (q − 1, q) or (2q − 2, q), and (q − 1, 2q − 1); for q = 2 and w = 4, exactly (2, 1, 1), (1, 2, 1) and (1, 3), all characters being trivial. With §5.11, AT^1_w (w ≤ 2q − 2) and AT′_w (w ≤ 3q − 3) are bases of AZ_w consisting of AMZVs; at the endpoint w = 3q − 2 the cardinality equality is not part of the statement. (IKLNDP24, Proposition 4.11 and its proof, pp. 55–57; Remark 4.12 and Proposition 4.13, p. 57; Remark 4.14, p. 58 (IKLNDP24 line 6495); IKLNDP-NOTE, the definition of I′_w and J′_w, p. 3 (IKLNDP-NOTE line 191); Propositions 1.3–1.4 and Theorems 1.5–1.6, pp. 3–4 (IKLNDP-NOTE line 262); §3.2, p. 12 (bijection); §4.1, pp. 12–14; §§5.1–5.10, pp. 15–35 (IKLNDP-NOTE line 970)).

One proof route is the following. (1): show by induction on depth and first entry that ζ_A(ε, λ; U, q + w_1, W_−) and ζ_A(ε; U, q, W) lie in the span of AT^1_w, using the explicit expansion of B*_(ε,U)C_(λ,W)(R_ε), with U = ∅ treated by summing C_(λ,W)(R_ε) directly; the condition w ≤ 2q − 2 keeps the expansion short. For (2), use strong induction on w and closure under deleting the last entry (the Note, Proposition 1.4(2)) to supply (LW). Character splitting and the rational suffix combinations reduce support: below 2q − 1 this is the two-row argument of §4.7 with a common root of the total character; in the range 2q − 1 ≤ w ≤ 3q − 3, Lemmas 5.2–5.5 of the Note restrict suffix weights to multiples of q − 1 and remove later nontrivial characters, apart from the explicit exceptional (q − 1,q) block. For w = 2q − 1 the remaining prefixes are ∅, (1), (q − 1) and (q − 1,1), with the last two carrying the possible split characters. For w = 2q the shortlist is (2,q − 1,q − 1), (2,2q − 2), (q + 1,q − 1); for 2q + 1 ≤ w ≤ 3q − 3 replace these first entries by w − 2q + 2 and w − q + 1 and allow (w). The two-row endpoint shows ζ_A(q − 1,q − 1) and ζ_A(2q − 2) are not proportional, removing the double-tail candidate. Monic descent bounds the remaining root quotient by degree 3 in θ. Comparing θ^q and constant coefficients, separately at q = 3 and w = 3q − 3, forces a coefficient assumed in the support to vanish (the Note §§5.6–5.8, pp. 22–29). At w = 3q − 2 and q > 2 the same two steps apply: Lemmas 5.2 and 5.5 of the Note give a shortlist of ten array shapes, the rational suffix combinations with the k = q − 1 case of §4.7 (the Note’s Corollary 5.1) and the weight-(3q − 3) case remove most of them; the candidate (q − 1, q, q − 1) is removed because at the prefix (q − 1) its suffix combination involves ζ_A(2q − 1), ζ_A(1, 2q − 2) and ζ_A(q, q − 1), the first two being proportional (§2.13) while ζ_A(q, q − 1) is not a K-multiple of ζ_A(2q − 1) (the k = q case of §4.7; IKLNDP-NOTE line 1836); and monic descent bounds the root coordinate by θ-degree 3q + 1 before the final coefficient comparison (the Note §5.9, pp. 29–33, IKLNDP-NOTE line 1739). At q = 2 and w = 4 the three indices (2, 1, 1), (1, 2, 1), (1, 3) are treated directly: (LW) uses the independence of ζ_A(1, 2) and ζ_A(2, 1), which follows from the weight-three relation D_1ζ_A(1, 1, 1) + D_1ζ_A(2, 1) + ζ_A(1, 2) = 0 and the weight-three case (the Note §5.10, pp. 33–35). |AT^1_w| = s(w) (§0.12) and, for w ≤ 3q − 3, |AT′_w| = s(w) (the Note, Proposition 1.4).

The native predicate `directIndices` describes I′_w for w ≤ 3q − 2, including the endpoint family for q > 2 and the three listed indices for q = 2. The word “exactly one” quantifies over adjacent positions of the composition; above weight 3q − 2 there is no asserted independence theorem. The headline signatures are `direct_small_weight_spanning` and `direct_small_weight_independent`; the latter holds for every finite field, q = 2 included.

Its interface identifies I′_w with the no-q family below 2q−1, with the stated excluded-entry or unique-pair family up to 3q−3, and with the endpoint family at 3q−2, and attaches character one exactly to entries q and 2q−1. It gives the equality |AT′_w| = s(w) for w ≤ 3q − 3 only.

**Checks for this family.**

- At q = 3, w = 4, I′₄ has the six compositions listed for IND₄ and its arrays number 46. Unrestricted compositions give 54 arrays in that weight and do not define AT′₄.
- At q = 3, w = 5, the forbidden singleton (5) is replaced by the pair (2,3), with character one over 3. The weighted count is 130; allowing either character over 3 would add two arrays.
- At q = 3, w = 6, (2,3,1) and (1,2,3) are admitted, whereas (3,2,1) is excluded. The weighted count is 368. A test for merely having an entry 3 would admit the third tuple and lose the prescribed adjacency.
- At q = 3, w = 7 = 3q − 2, the family has 37 indices and 1040 arrays, whereas s(7) = 1042: (4,3) and (2,5) are admitted, while (7) and (2,2,3) are excluded. Independence holds there, but the family is not a basis of AZ_7.
- At q = 2, w = 4, the family is exactly (2,1,1), (1,2,1), (1,3), three indices, equal to d(4) = 3. Extending the weight-three rule instead would select (1,1,1,1), (1,1,2), (1,2,1), which are dependent: ζ_A(1,1,2) + D_1(ζ_A(1,1,1,1) + ζ_A(1,2,1)) = 0.

Both native small-weight signatures include the zero-weight empty array, whose value is 1; the positive-weight ranges above are their substantive assertions.

**Checks.**

- For q = 3 and w = 4 ≤ 2q − 2, AT^1_4 has 46 elements and is a basis of AZ_4.
- The weight bound of (1) is not covered by (2): at q = 3 and w = 5 = 2q − 1, the index (3, 2) lies in I^T_5 but not in I′_5, and (2, 3) lies in I′_5 but not in I^T_5 (its last entry is q). Both families have 130 = s(5) arrays, so spanning by AT^1_5 would be equivalent to its independence, which the independence of AT′_5 does not give.

*Needs:* §5.11; §2.3; §2.2; §2.13; §3.11; §0.12; §5.8; §4.2; §4.3; §4.7.

### 5.14 An upper bound for v-adic multiple zeta values

v a finite place of K = F_q(θ). Let v be a finite place of K, w ≥ 1, and Z_(v,w) the K-span of the v-adic MZVs ζ_A(s)_v of weight w (Chang–Mishiba). Then dim_K Z_(v,w) ≤ d(w) − d(w − (q − 1)), with d(0) = 1 and d(n) = 0 for n < 0; the K̄-span satisfies the same bound for dim_(K̄). (CCM23, Corollary 1.2.7 and the paragraph before it, p. 4 (CCM23 line 150)).

One proof route is the following. Chang–Mishiba supply the weightwise K-linear specialisation, and Chang–Chen–Mishiba supply its algebra compatibility: there is a surjective K-algebra homomorphism Z → Z_v, ζ_A(s) ↦ ζ_A(s)_v, whose kernel contains the principal ideal generated by ζ_A(q−1) (CM21 Theorem 1.2.2, CM21 line 149; CCM-ALG Theorem 1.2.3, CCM-ALG line 176); the construction and specialisation targets below specify these maps. Multiplication by the nonzero element ζ_A(q − 1) ∈ Z_(q−1) embeds Z_(w−(q−1)) into Z_w (Z ⊂ K_∞ is a domain; §1.7), and its image lies in the kernel of Z_w → Z_(v,w). So dim Z_(v,w) ≤ dim Z_w − dim Z_(w−(q−1)) = d(w) − d(w − q + 1) by §5.6.

**Checks.**

- For w < q − 1 the bound is d(w); for w = q − 1 it is d(q − 1) − 1 = 2ᑫ⁻² − 1.

*Needs:* §5.6; §1.7; §0.13; the finite-place construction of this subsection.

Construct the finite-place realisation as follows. For every finite place v take the valued completion K_v and C_v, its completed algebraic closure using PadicDifferentialEquationsAndRigidCohomology §RD.0.33. Define the Carlitz multiple star polylogarithm by the weak inequalities d₁ ≥ ⋯ ≥ d_r ≥ 0 in the series of §0.6. Construct its convergence on the open v-adic unit polydisc and its continuation to every algebraic tuple in the closed unit polydisc. The continuation uses the logarithm of the associated t-module and agrees with the convergent series on their common domain; its definition is independent of the auxiliary nonzero a ∈ F_q[t] used to move the point into the logarithm disc (CM21 §6.1.2 and §6.2, CM21 lines 1680–1766).

For every index s, use the coefficients of the Anderson–Thakur polynomials to prove the finite identity Γ_sζ_A(s) = Σ_l b_l(−1)^(dep(s_l)−1)Li⋆_(s_l)(u_l), with b_l ∈ A, u_l ∈ A^(dep(s_l)), wt(s_l) = wt(s) and dep(s_l) ≤ dep(s). Define ζ_A(s)_v by this same expression with the continued v-adic star values divided by Γ_s ≠ 0. The specified expression is the one obtained by expanding the H_(s_i) and then applying inclusion–exclusion to adjacent degree equalities (CM21 Theorem 5.2.5, Remark 5.2.6 and Definition 6.1.1, CM21 lines 1404, 1412 and 1691). Construct the associated logarithmic points and coproduct t-modules, prove their infinity and finite-place logarithm formulas and regularity, and apply Yu’s theorem of §0.0 to show that every K-linear relation in one weight survives this realisation (CM21 Theorem 6.2.4 and Theorem 6.4.1, CM21 lines 1766 and 1851). Prove multiplicativity by the corresponding logarithmic-point product identities, giving a surjective K-algebra map Z → Z_v, with its weightwise surjections and ζ_A(q−1) in its kernel (CCM-ALG Theorem 1.2.3, CCM-ALG line 176). Here Z_v is the span of 1 and all these constructed values, rather than a quotient defined only by the desired kernel property.

The interface includes the following facts.

- The star-series value, continuation and its auxiliary-choice independence have source the stated polydiscs and target C_v; at integral points in K_v^r, in particular at the A-valued interpolation points, the value lies in K_v. Algebraic integral points over an extension take values in C_v and need not give an element of K_v.
- ζ_A(∅)_v = 1, and the positive-depth values agree with the displayed Anderson–Thakur expression; the specialisation maps are K-linear in each weight and form the stated K-algebra homomorphism.
- If q−1 divides n > 0 then ζ_A(n)_v = 0; the entire ideal ζ_A(q−1)Z is killed. The dimension bound above holds over K and after spanning over K̄ in C_v.

**Checks for the finite-place construction.**

- At depth one with n ≤ q, Γ_n = H_n = 1, so the expression is Li⋆_n(1)_v, the continued depth-one value. For n = q−1 it is 0; at q = 2 all positive depth-one weights are killed.
- In depth two, the weak-degree series satisfies Li⋆_(a,b)(x,y) = Li_(a,b)(x,y)+Li_(a+b)(xy) on a common convergence disc, since equal degrees give the second term. At x = y = 0 all three values are zero; at leading degrees (0,0) the star term is xy and the strict series has no such term. This fixes the inclusion–exclusion sign.
- At q = 2, the relation ζ_A(2)+D₁ζ_A(1,1) = 0 specialises to D₁ζ_A(1,1)_v = 0, hence ζ_A(1,1)_v = 0 because D₁ ≠ 0 in K_v, even when v divides D₁; invertibility in K_v does not require an integral unit.
- At q = 2 and v = θ, let α ∈ F₄ ∖ F₂ and z = θ²α. The convergent depth-one value begins θ²α+ terms of valuation at least 3, since v(ℓ_d) = d and 2·2^d−d ≥ 3 for d ≥ 1. Its quotient by θ² has residue α, so it is outside F₂((θ)). An algebraic integral point alone does not force the value to lie in K_v.
- At q = 3, weights 1,2,3,4 have upper bounds 1,1,2,4; at q = 2 the bounds at weights 1,2,3 are 0,0,1. These use d(n) = 0 for n < 0 rather than natural subtraction of the index.

*Needs:* §0.0 (Anderson t-modules, coproducts and Yu’s theorem); §0.6; §3.1–§3.2; §1.7; §3.9; §5.6 for the bound; PadicDifferentialEquationsAndRigidCohomology §RD.0.33; CM21 §§4–6 and CCM-ALG §§3–5 for the stated constructions and comparison targets.

### Examples

At q = 3 the ordinary dimensions in weights one through five are 1, 2, 3, 6, 11; the alternating dimensions through weight four are 2, 6, 16, 46. At a finite place and w = q−1, the bound loses exactly the one-dimensional product of ζ_A(q−1) with Z₀.

### Dependencies

Earlier layers 0, 1, 2, 3, 4. The exact target needs above specify each mathematical object and proof-route input. External inputs: PadicDifferentialEquationsAndRigidCohomology §RD.0.33; the finite-place realisation and algebra compatibility are constructed in §5.14.

## Downstream consumers

The basis, grading and relation-kernel theorems supply a common characteristic-p special-value library for subsequent transcendence and arithmetic-period applications. A consumer takes the weight spaces of §0.9, their algebra structure from §1.7, the comparison from §2.8, and the basis and dimension statements of §5.5–§5.14. Finite-place applications use the constructed specialisation of §5.14; they do not infer a finite-place evaluation from convergence at infinity.

## Worked examples

At q = 2, ζ_A(1) = log_C(1), ζ_A(1)² = ζ_A(2), and ζ_A(2) + D₁ζ_A(1,1) = 0. Weight three has the two Thakur basis elements ζ_A(1,1,1) and ζ_A(2,1), while the CMPL basis uses Li(1,1,1) and Li(3). The ordinary and alternating dimensions agree because F₂ˣ has one element.

At q = 3, weight four has Iᵀ₄ = {(1,1,1,1),(1,1,2),(1,2,1),(2,1,1),(2,2),(3,1)}. The q-indivisible compositions replace (3,1) by (4). Their depths contribute 2⁴ + 3·2³ + 2² + 2 = 46 alternating arrays, while all arrays on Iᵀ₄ contribute 16 + 24 + 4 + 4 = 48. This distinguishes the strong and weak Brown generating families. The basis theorem gives dim_K Z₄ = 6 and dim_K AZ₄ = 46.

The negative-control relation ζ_A(2q−1) + D₁ζ_A(1,2q−2) = 0 lies entirely in IND_(2q−1) when q > 2. It prevents replacing the CMPL basis on IND by the corresponding MZVs beyond Ngo Dac’s weight range. The Thakur family still gives a basis in every weight.

## References

All numbered locators refer to the versions specified here; parenthesized source-id line locators identify the numbered text of that version. The displayed definitions and claims are restated in this roadmap’s own words.

- **ND21.** Tuan Ngo Dac, *On Zagier–Hoffman's conjectures in positive characteristic*. HAL hal-03298790v1 (manuscript dated 29 March 2021, 26 printed pages after the HAL cover); Annals of Mathematics 194 (2021), no. 1, 361–392, doi:10.4007/annals.2021.194.1.6. Locators are the printed manuscript pages. [Text](https://hal.science/hal-03298790v1/document).
- **CCM23.** Chieh-Yu Chang, Yen-Tsung Chen and Yoshinori Mishiba, *On Thakur's basis conjecture for multiple zeta values in positive characteristic*. arXiv:2205.09929v2 (11 July 2022, 32 pages); Forum of Mathematics, Pi 11 (2023), e26, doi:10.1017/fmp.2023.26 (the published version numbers statements by section: arXiv Theorem 1.2.4 = published Theorem 1.5, Theorem 5.4.2 = Theorem 5.3). [Text](https://arxiv.org/abs/2205.09929v2).
- **IKLNDP24.** Bo-Hae Im, Hojin Kim, Khac Nhuan Le, Tuan Ngo Dac and Lan Huong Pham, *Zagier–Hoffman's conjectures in positive characteristic*. arXiv:2205.07165v2 (10 June 2024, 60 pages); Forum of Mathematics, Pi 12 (2024), doi:10.1017/fmp.2024.18 (the published version numbers the introduction as §1, so its section numbers are one more than the preprint's: arXiv Theorem 3.4 = published Theorem 4.4). [Text](https://arxiv.org/abs/2205.07165v2).
- **IKLNDP-NOTE.** Bo-Hae Im, Hojin Kim, Khac Nhuan Le, Tuan Ngo Dac and Lan Huong Pham, *Note on linear independence of alternating multiple zeta values in positive characteristic*. HAL hal-04240841v3 (30 July 2024); Acta Mathematica Vietnamica 49 (2024), 485–521, doi:10.1007/s40306-024-00554-4. Locators are the printed pages of the HAL version. [Text](https://hal.science/hal-04240841v3/document).
- **CHANG14.** Chieh-Yu Chang, *Linear independence of monomials of multizeta values in positive characteristic*. arXiv:1207.2326 (20 pages); Compositio Mathematica 150 (2014), 1789–1808. [Text](https://arxiv.org/abs/1207.2326v4).
- **CPY19.** Chieh-Yu Chang, Matthew A. Papanikolas and Jing Yu, *An effective criterion for Eulerian multizeta values in positive characteristic*. arXiv:1411.0124 (32 pages); Journal of the European Mathematical Society 21 (2019), 405–440. [Text](https://arxiv.org/abs/1411.0124v2).
- **THAKUR09R.** Dinesh S. Thakur, *Relations between multizeta values for F_q[t]*. International Mathematics Research Notices 2009, no. 12, 2318–2346 (author's copy); doi:10.1093/imrn/rnp018. [Text](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/imrnrelation.pdf).
- **THAKUR10.** Dinesh S. Thakur, *Shuffle relations for function field multizeta values*. International Mathematics Research Notices 2010, no. 11, 1973–1980 (author's copy); doi:10.1093/imrn/rnp202. The higher-depth induction is corrected in the author's updates list. [Text](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/shufflepub.pdf).
- **THAKUR09P.** Dinesh S. Thakur, *Power sums with applications to multizeta and zeta zero distribution for F_q[t]*. Finite Fields and Their Applications 15 (2009), 534–552 (author's copy); doi:10.1016/j.ffa.2009.04.002. [Text](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/ffafinal.pdf).
- **CH21.** Yen-Tsung Chen and Ryotaro Harada, *On lower bounds of the dimensions of multizeta values in positive characteristic*. arXiv:2012.00340; Documenta Mathematica 26 (2021), 537–559. [Text](https://arxiv.org/abs/2012.00340v1).
- **LRT14.** José Alejandro Lara Rodríguez and Dinesh S. Thakur, *Zeta-like multizeta values for F_q[t]*. arXiv:1312.4928; Indian Journal of Pure and Applied Mathematics 45 (2014), 787–801. [Text](https://arxiv.org/abs/1312.4928v1).
- **LND-ZETALIKE.** Huy Hung Le and Tuan Ngo Dac, *Zeta-like multiple zeta values in positive characteristic*. HAL hal-03093398v2; Mathematische Zeitschrift 301 (2022), 2037–2057. Locators are the printed pages of the HAL version. [Text](https://hal.science/hal-03093398).
- **PAP08.** Matthew A. Papanikolas, *Tannakian duality for Anderson–Drinfeld motives and algebraic independence of Carlitz logarithms*. arXiv:math/0506078v2; Inventiones Mathematicae 171 (2008), 123–174. [Text](https://arxiv.org/abs/math/0506078v2).
- **ABP04.** Greg W. Anderson, W. Dale Brownawell and Matthew A. Papanikolas, *Determination of the algebraic relations among special Γ-values in positive characteristic*. arXiv:math/0207168; Annals of Mathematics 160 (2004), 237–313. [Text](https://arxiv.org/abs/math/0207168v1).
- **THAKUR-UPDATES.** Dinesh S. Thakur, *Corrections and updates to publications*. Author’s continuously maintained corrections list; entry 36, pp. 7–8. [Text](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/updates.pdf).

- **AT90.** Greg W. Anderson and Dinesh S. Thakur, *Tensor powers of the Carlitz module and zeta values*. Annals of Mathematics 132 (1990), 159–191, doi:10.2307/1971503. Product, exponential, logarithm and period conventions: §§1.1, 2.1–2.2, 2.5; generating series and interpolation: §§3.6–3.7, (3.6.4) and (3.7.1)–(3.7.4), pp. 185–186. [Author-hosted text](https://www.sas.rochester.edu/mth/sites/dinesh-thakur/AT.pdf).
- **AT09.** Greg W. Anderson and Dinesh S. Thakur, *Multizeta values for F_q[t], their period interpretation, and relations between them*. arXiv:0902.1180v1; International Mathematics Research Papers 2009, doi:10.1093/imrp/rnp010. Products and coefficient field: §1.1, p. 2; period and factorials: §§2.1–2.3, p. 4; interpolation: §2.4.1, p. 5. [Text](https://arxiv.org/abs/0902.1180v1).
- **SHEATS98.** Jeffrey T. Sheats, *The Riemann hypothesis for the Goss zeta function for F_q[T]*. Journal of Number Theory 71 (1998), 121–157; arXiv:math/9801158v1. Theorem 1.2 and Lemma 1.3, pp. 5–6 of the preprint, give uniqueness of the optimal no-carry decomposition; THAKUR09P proof of Theorem 4 uses its degree consequence. [Text](https://arxiv.org/abs/math/9801158v1).
- **CM21.** Chieh-Yu Chang and Yoshinori Mishiba, *On a conjecture of Furusho over function fields*. Inventiones Mathematicae 223 (2021), 49–102; arXiv:1710.10849v2. Theorem 1.3.2, p. 5; §§2.2–2.5; §§4–6; Theorems 5.2.5, 6.2.4 and 6.4.1; Definition 6.1.1. [Text](https://arxiv.org/abs/1710.10849v2).
- **CCM-ALG.** Chieh-Yu Chang, Yen-Tsung Chen and Yoshinori Mishiba, *Algebra structure of multiple zeta values in positive characteristic*. arXiv:2007.08264v1. Theorem 1.2.3, p. 4, and §§3–5 give multiplicative specialisation; CM21 Theorem 1.2.2 gives the weightwise linear map. [Text](https://arxiv.org/abs/2007.08264v1).
