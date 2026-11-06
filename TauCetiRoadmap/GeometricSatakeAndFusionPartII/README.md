# Roadmap: geometric Satake and fusion, part II — integral local models

**Summary.** This continuation of GeometricSatakeAndFusion builds the scheme geometry of integral local models: polynomial Schubert closures, integral Hodge embeddings, canonical normal representatives, formal-curve tangent spans and rational Schubert curves. It compares the EL and unitary Drinfeld models, proves connectedness of geometric tubes for every dominant bound, and obtains normal minuscule models with geometrically reduced special fibre at every prime. Nearby cycles of IC_μ give the central parahoric test function and its Satake-parameter characterization for every dominant bound, all reductive groups and all primes; minuscule bounds use the normal scheme model and constant sheaf. The input Grassmannians, finite admissible loci and generic Satake theory are those of GeometricSatakeAndFusion; its stopping point for this continuation is the v-sheaf local model and its reduced perfected special fibre.

## Scope and ownership

GeometricSatakeAndFusion owns, in the polynomial Beilinson–Drinfeld extension of GS0 specified in the supplier contracts, the polynomial modification functor, its ind-projectivity and fibres, and its closed-immersion criterion (gap:polynomial-bd-projectivity; gap:polynomial-closed-immersion-criterion). This roadmap owns polynomial local-model closures and their comparisons with integral v-sheaves; the Hodge-induced scheme maps and their closedness; normal scheme representability; tangent spaces spanned by formal curves; same-residue-field curves; integral EL/PEL quotient models and Drinfeld comparisons; local-model tube connectedness; and the application of central nearby cycles to local-model trace functions. The final representability and tube theorems include wild ramification and primes 2 and 3. The classical and tame intermediate theorems retain their own hypotheses.

GeometricSatakeAndFusion GS0, §0.6 “Generic Schubert bounds”, §0.32 “Integral parahoric ind-properness” and §0.37 “Bounded admissible affine flag loci”, owns the Grassmannians, the connected-level and central comparisons of the integral Grassmannians and the perfect admissible locus A_(𝒢,μ); GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres” and §4.18 “Functoriality of integral local models”, owns the v-closure local model, its functoriality, the identification of its reduced special fibre with the admissible locus and the bounded nearby-cycle comparison. Those constructions and the general v-special-fibre theorem are imported, including the comparison to the admissible Witt locus. Section 0.4 below fixes notation and tests that contract; §3.4 adds the comparison with the unperfected polynomial special fibre and, for minuscule bounds, the identification of its perfection with the admissible Witt locus. GeometricSatakeAndFusion GS2 supplies convolution and the central-sheaf theory specified in the contracts; this roadmap proves its local-model consequences. This roadmap does not construct Zhu's independent rational Gelfand commutativity constraint, metaplectic Satake, or the rational Witt Satake equivalence over algebraically closed residue fields larger than an algebraic closure of a finite field.

ReductiveGroups §10B owns induced modules, Weyl modules and their integral lattices. ReductiveGroupsPartII RG2.0a–RG2.4 owns Weil restriction, valued roots, buildings, full fixers, parahoric group schemes, Lang's theorem and admissible-set combinatorics. RootSystemsPartII §§4.3–4.4 owns the invariant integral coroot-orbit step and its export to the ambient and coinvariant cocharacter lattices. Their representation and stabilizer extensions are the supplier contracts stated below. R-smooth full-fixer embeddings are requested from ReductiveGroupsPartII (gap:r-smooth-full-fixer-embeddings); the modular minuscule tests are requested from RootSystemsPartII as the minuscule-bounds continuation of its §1.1 integral dominance, which its Downstream consumers name and its §§4.3–4.4 do not contain (gap:minuscule-dominance-tests, gap:minuscule-root-coefficients, gap:minuscule-cartan-coefficients). The requests below do not enlarge the scope of RG2.3 or of RootSystemsPartII §§4.3–4.4. PELModuli M0 owns the rational endomorphism algebra, involution and trace pairing, and M0.18 owns the Kottwitz determinant condition as a polynomial identity over arbitrary bases, which §6.3 imposes for the local order; Layer 6 adds ramified local chains with their polarization line, rather than another generic PEL datum. The trace form in §2.8 is a general finite-separable, multiple-summand restriction theorem, beyond the fixed arithmetic trace lattices in PELModuli M0.

ModularCurves §0G owns represented finite Grassmannians. SchemeAndStackFoundations §§0.8, 0.17–0.21, 0.26, 0.28, 0.30, 1.1 and 4.7–4.14 owns the commutative algebra, descent, normalization and algebraization used here. DiamondsAndVStacksPartII §§D10.8–D10.15 owns closure and recovery from v-sheaves; §§D11.1–D11.20 owns kimberlites, tubes and the normality criterion. This roadmap applies those theorems to local models without restating their general conclusions.

The module tangent carrier, linear span, algebra trace and quotient-rank Grassmannian already in the library are reused under their pinned names below. [Suggested.lean](Suggested.lean) records the geometric headlines and their missing carriers; the complete targets are in this README.

## Conventions

Let p be prime, F a finite extension of ℚ_p, O_F its DVR, π_F a uniformizer, and k_F its finite residue field. A connected reductive F-group G has a geometric cocharacter conjugacy class {μ}, reflex field E, and a specified smooth affine level 𝒢 with connected component 𝒢° parahoric. Full facet fixers and connected parahorics are distinguished. A comparison changes reflex base explicitly. The unrestricted tube theorem permits every dominant μ; a scheme representative in mixed characteristic is asserted for minuscule μ. The zero cocharacter and the trivial group are allowed.

Write Mᵛ for the imported v-closure, Mᵖᵒˡ for the polynomial schematic closure, Mʷⁿ for the weakly normal representative, Mᶜᵃⁿ for a normal scheme representative, and Mⁿᵃⁱᵛᵉ for an EL/PEL determinant locus. Equal-characteristic companion schemes, their perfections, Witt flags and their v-sheaves are compared by specified morphisms. Equality of their geometric points alone does not identify their scheme structures. Every scheme is locally noetherian where a Serre or normalization criterion is invoked; the finite-type and proper hypotheses in the layers supply this condition.

For a torus T/K, R-smoothness means that its schematic closure in the Weil restriction of the lft Néron model of T over a finite splitting extension is smooth; the condition is independent of that extension. The reductive-group hypothesis concerns the centralizer of a maximal split torus after maximal unramified completion (KPZ §2.1.4, p. 10; KPZ line 440).

Highest weights ν lie in X*(T); cocharacters λ and μ lie in X_*(T). After a choice of Borel, λ≤μ means that μ−λ is a nonnegative integral combination of simple coroots in the same component. For PGL₂, X_*(T)=ℤ and the positive coroot is 2: 0≤2, but 0 and 1 are incomparable. Passing only to the real cone loses this distinction. Every root-orbit sum counts distinct orbit members. For an apartment action in the Bruhat–Tits convention, a loop translation t^ν acts by −ν; for GL₂, diag(t,t⁻¹) has cocharacter (1,−1) and apartment displacement (−1,1) (GL §3, p. 5; GL line 225).

Our flag convention chooses a weight-one subspace of rank d in rank h, where 0≤d≤h. Mathlib's `Module.Grassmannian R M n` records quotient rank n: the corresponding subspace problem uses n=h−d. SW's weight-one quotient has rank d and kernel rank h−d; its comparison uses the opposite parabolic and duality. KZ's weights 0,−1 use the inverse cocharacter. For h=3,d=1, the subspace has rank 1 and the SW kernel rank 2; for KZ's diag(π_F⁻¹,1,1), reducing π_F·diag(π_F⁻¹,1,1)Λ modulo π_F gives the line spanned by e₁. Repeating a faithful Hodge representation uses m≥1, and a determining lattice period has r≥1. Its total ranks are rh and rd. On the zero vector space the unique alternating form is nondegenerate; an embedding obtained by repeating a nontrivial representation requires positive multiplicity.

The geometric tangent space at a rational point is the residue-field dual of the cotangent space. Its formal-curve span is a linear span, not the set of individual derivatives. For xy=0 the two axis derivatives (1,0) and (0,1) span k², whereas their sum (1,1) is not a curve derivative. Cartan signs use E=((0,1),(0,0)), H=diag(1,−1), F=((0,0),(1,0)): conjugation by ((1,0),(1,1)) sends E to E−H−F. The Dᴴ detecting coefficient −2m requires p≠2. Layer 4 states root-direction results in their wider characteristic range and marks the odd-characteristic Dᴴ Cartan argument explicitly.

Use F_ℓ coefficients, ℓ≠p, in the tube argument, and ℚ_ℓ coefficients in the monodromy and trace argument. For geometric Frobenius, ℚ_ℓ(1) has eigenvalue q⁻¹. Choose a square root r_q of q in the coefficient field and use r_q⁻¹ for the half Tate twist. For a smooth generic fibre of dimension d, normalized IC is ℚ_ℓ[d](d/2), so its trace τ and the unshifted constant-sheaf trace φ satisfy τ=(−1)^d q^(−d/2)φ. In dimensions 0 and 1 their values on smooth support are respectively (φ,τ)=(1,1) and (1,−q^(−1/2)). Normalize each Hecke algebra with its indicated compact open of volume 1; changes between parahoric and hyperspecial levels use the normalized idempotent, not simultaneous conflicting choices of one Haar measure. Since q≥2, every power of q and r_q used as a denominator is nonzero. These conventions are those of PZ §9.d.1–§9.d.3, pp. 74–76 (PZ line 3065 and PZ line 3118), with the negative Tate exponent forced by (9.9).

All objects live in fixed universes closed under the indicated finite field extensions, finite products and bounded moduli constructions. Full loop spaces are ind-objects; schemes and sheaf complexes used in a proof are first restricted to finite Schubert bounds. No unrestricted set of all schemes, all universes or all sheaves is used.

A label gap:name in a *Needs:* line cites the paragraph “What X must provide (gap:name)” of Exact supplier contracts: an input that this roadmap takes from the earlier roadmap X, with the hypotheses stated there, in addition to the sections of X cited by number.

## Exact supplier contracts

### From Mathlib

Use the pin f6090c7095e1e56b3464c1daba5f24631f1290d2. `Submodule.span` in Mathlib/LinearAlgebra/Span/Defs.lean:46 is the submodule generated by a set, used for actual geometric derivative vectors. `Algebra.trace` in Mathlib/RingTheory/Trace/Defs.lean:70 is the linear trace of multiplication, with its commutative-ring and algebra instances; separability and finite dimension enter the nondegeneracy assertion in §2.8. `Module.Grassmannian` in Mathlib/RingTheory/Grassmannian.lean:66 bundles a submodule, a finite projective quotient and a fixed quotient rank at every prime; over a zero ring its rank condition has no primes to test. The geometric applications have a nonzero DVR or field base and use representability from ModularCurves §0G. The finite-separable trace-pairing input is `traceForm_nondegenerate`, Mathlib/RingTheory/Trace/Basic.lean:501, with both `FiniteDimensional` and `Algebra.IsSeparable`. The scheme carrier is `AlgebraicGeometry.Scheme`, Mathlib/AlgebraicGeometry/Scheme.lean:40; it alone carries no affine-loop moduli or nearby-cycle construction. `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono`, Mathlib/AlgebraicGeometry/ZariskisMainTheorem.lean:392, supplies the proper-monomorphism criterion on finite scheme bounds.

### From Tau Ceti

Use the pin 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. `TauCeti.AlgebraicGeometry.ZariskiTangentSpace` in TauCeti/AlgebraicGeometry/TangentSpace/Basic.lean:65 is the residue-field linear dual of the cotangent space of a scheme stalk; regularity is not a condition of that definition. `Derivation.adjointWeightSpace` in TauCeti/Algebra/AlgebraicGroup/Tangent/RootSpace.lean:100 is the adjoint weight submodule for a homomorphism from a diagonalizable group, with finite projective Hopf cotangent module. The classical group, valued roots, Chevalley coordinates and loop comparison are additional geometric inputs specified below.

### From TauCetiRoadmap.ModularCurves

Section 0G supplies the represented relative Grassmannian, affine charts, gluing, universal quotient and base change for a finite locally free module. It is consumed with quotient rank h−d for our rank-d subspace convention and quotient rank d for SW. These two uses are related by kernels and duality; they are not the same rank convention.

### From TauCetiRoadmap.SchemeAndStackFoundations

Sections 0.8, 0.17–0.21 and 0.30 supply DVR flatness, Serre conditions, depth, excellence, finite normalization and normal schemes; §1.1 supplies descent of modules and their maps, and §§4.7–4.10 supply formal completion and proper algebraization. Section 4.13 supplies the scheme forms of Serre's criteria. Section 0.26 supplies weakly normal schemes, used for the representative of §3.6, and §0.28 the ideal-sheaf quotient comparison used for schematic images in §2.3. Sections 0.17–0.18 supply the Serre S₂ condition, its étale-local stability and connectedness after removing codimension ≥2, used in §7.3. Section 4.10’s algebraization of compatible morphisms supplies the scheme isomorphisms of §§6.5–6.6: algebraize a formal isomorphism and its inverse, then use uniqueness for both composites. Equivariance follows from the prescribed generic equivariance and schematic generic density of the flat group-action source. The application of these results requires normal generic fibre as well as reduced special fibre.

What SchemeAndStackFoundations must provide (gap:pointed-tangent-chain-rule): Give the derivative of pointed scheme morphisms and its chain rule on Tau Ceti’s Zariski tangent carrier, for the formal curves of §4.1.

What SchemeAndStackFoundations must provide (gap:trait-normality): For a noetherian scheme flat over a DVR with normal generic fibre and geometrically reduced special fibre, give the normality criterion used in §§0.5, 1.3 and 6.5.

What SchemeAndStackFoundations must provide (gap:finite-weak-normalization): In §0.26, give finite absolute weak normalization of the excellent flat local-model closures with characteristic-zero generic fibre used in §3.6. This is the absolute weak-normalization contract that DiamondsAndVStacksPartII states for §0.26 (finiteness for excellent rings with characteristic-zero generic fields), applied to these closures.

What SchemeAndStackFoundations must provide (gap:s2ification-connectedness): In §§0.17–0.18, for a reduced equidimensional excellent weakly normal finite-type scheme X over a perfect field with geometrically unibranch irreducible components, prove that X is S₂ if and only if at every geometric point x the graph of irreducible components of the strict local scheme at x, joined when they meet in codimension one, is connected, equivalently the finite S₂-ification has singleton geometric fibres, and show compatibility with completion (GL Lemma 3.3 and Proposition 3.4, pp. 6–7; GL line 255).

What SchemeAndStackFoundations must provide (gap:fpqc-normality-descent): In §§0.30, 1.1 and 4.13, prove that normality descends along an fpqc covering of locally noetherian schemes, as used in §7.6.

### From TauCetiRoadmap.ReductiveGroups

Section 10B, “Induction, Weyl modules and simple heads”, supplies the induced modules ∇(λ)=Ind_(B⁻)^G k_λ and the Weyl modules Δ(λ)=∇(−w₀λ)* of a split connected reductive group over a field, their arbitrary-field base change, the integral Weyl lattices with their freeness and action equations, the highest-weight lines and the Weyl characters. Its distinction between the ordinary dual and the contravariant dual D_τ, with D_τΔ(λ)≅∇(λ), is retained: in characteristic p, Δ(λ) and ∇(λ) are not interchanged. This supplies the Weyl modules of §§4.6–4.9 and the split Weyl lattices of §2.2; for SL₂ the Weyl module of the fundamental weight is the standard representation k².

### From TauCetiRoadmap.ReductiveGroupsPartII

RG2.0a.1–RG2.0a.2 supply finite-flat Weil restriction of affine groups, torsors and their trivializations; use it for a polynomial finite-flat divisor, without asserting arbitrary nonaffine Weil restriction. RG2.1.2–RG2.1.5 supply valued roots, multipliable unitary roots, π₁ and z-extensions. RG2.2.2–RG2.2.4 supply facet comparisons, toral building maps, descent and classical lattice-chain realizations. RG2.3.3–RG2.3.5 supply connected parahorics, full fixers, tame fixed points and classical stabilizer schemes; RG2.3.7 supplies Lang and compatible lifting. RG2.4.1–RG2.4.3 supply affine Weyl groups, Bruhat order, lengths and admissible sets. RG2.3.1, “Big-cell criteria” and “Quotients of group schemes over a DVR”, supplies the integral Chevalley big cell and the quotient of a smooth group scheme by a closed flat subgroup over a DVR, used in §3.7; RG2.5.1–RG2.5.2 supply the dual group with its Galois action and the L-group used in §8.4. Maps under central covers include the integral parahoric morphism and common reflex base.

What ReductiveGroupsPartII must provide (gap:classical-hodge-cover-classification): Give the Galois-equivariant classical minuscule representation classification constructing the prime-to-p Hodge cover in §1.5.

What ReductiveGroupsPartII must provide (gap:stable-weyl-lattices): For a split reductive Z_p-group H₀, a DVR R over Z_p with characteristic-zero fraction field L and a finite-dimensional minuscule representation V of H₀ over L, prove that any two full R-lattices in V to which the representation extends as group-scheme homomorphisms from H₀ over R are conjugate by the centralizer of the image of H₀ over L in GL(V), allowing repeated highest weights, for §§2.2 and 3.3 (KPZ Lemma 3.3.10, p. 22; KPZ line 977).

What ReductiveGroupsPartII must provide (gap:r-smooth-full-fixer-embeddings): Give the R-smooth centralizer and integral full-fixer closed-embedding theorems with their field-extension hypotheses used in §7.7.

What ReductiveGroupsPartII must provide (gap:symplectic-toral-factorization): Give the symplectic factorization of toral building embeddings, retaining division-centralizer multiplicities and each summand’s building translation, for §2.6.

What ReductiveGroupsPartII must provide (gap:polynomial-representation-descent): Give polynomial lifts of the toral integral representations with specialization to the prescribed lattice chains and equivariant descent for §§2.4, 2.6 and 3.3.

What ReductiveGroupsPartII must provide (gap:polynomial-parahoric-lifts): Give the polynomial parahoric lifts for the Weil-restricted tame factors and their central, fixed-point and divisor-specialization comparisons used by §§1.1–2.4 and 2.6 and the Iwahori comparison of §3.6.

What ReductiveGroupsPartII must provide (gap:translation-stabilizer-jets): For a rational translation at the stated very special companion level, give smooth connected finite jet quotients of the positive-loop stabilizer intersection and compatible lifting along their pro-unipotent kernels.

The sign witness is diag(t,t⁻¹), with cocharacter (1,−1), apartment displacement (−1,1), and determinant valuation 0. A nonzero translation belongs to the Laurent loop group; its conjugator in §5.4 belongs to the positive loop group.

### From TauCetiRoadmap.RootSystemsPartII

Section 4.3, “The existential orbit-sum step”, supplies, for distinct fixed dominant endpoints λ<μ whose difference lies in the positive integral coroot monoid, a positive root whose distinct-orbit sum β is nonzero and fixed with λ<λ+β≤μ, applied to the flipped (coroot) pairing. Section 4.4, “Ambient cocharacters, central directions and torsion”, retains the central coordinate of the endpoints and lifts the step from the real realization to the actual coinvariant cocharacter lattice, torsion included, under its stated injectivity and equivariance hypotheses on the root lifts. Neither section identifies roots with root-subgroup morphisms. In A₂ with reversal, the selected simple orbit sums to α₁+α₂ once; an artificial period four must not give twice this root.

What RootSystemsPartII must provide (gap:minuscule-dominance-tests): Give dominance detection in the integral coroot coset by the type-dependent minuscule weight sets of §4.4, on the simply connected cover.

What RootSystemsPartII must provide (gap:minuscule-root-coefficients): Give the minuscule root-string coefficient computation identifying the FM root bound j_α with k_α in §4.7 at the stated characteristics.

What RootSystemsPartII must provide (gap:minuscule-cartan-coefficients): Give the minuscule Cartan detecting-weight calculation of §4.9, retaining the Dᴴ endpoint and p≠2 hypotheses.

### From TauCetiRoadmap.GeometricSatakeAndFusion

GS0 §0.6 “Generic Schubert bounds” supplies bounded generic diamonds and minuscule flags. GS0 §0.32 “Integral parahoric ind-properness” supplies closed integral Grassmannian maps, minuscule connected-level invariance and central comparison. GS0 §0.37 “Bounded admissible affine flag loci” supplies the perfect admissible locus A_(𝒢,μ) with its membership, closed-inclusion and union API. GS4 §4.17 “Integral local models and admissible special fibres” supplies the v-model 𝓜_(𝒢,μ) as the v-closure of the generic Schubert bound, with no minuscule or tameness hypothesis, and the identification of its reduced perfect special fibre with A_(𝒢,μ); GS4 §4.18 “Functoriality of integral local models” supplies its functoriality under model morphisms, the induced maps of admissible loci and compatibility with identity, composition and common reflex-field base change. GS0 §0.29 “Equal-characteristic Schubert models and coefficient comparison” supplies reduced-word algebraic Demazure resolutions. GS0 §0.38 “Relative-position flag correspondences” supplies convolution incidence on bounded perfect models; geometric connectedness of the admissible projection fibres is the narrower gap below. GS4 §4.17 “Integral local models and admissible special fibres” also supplies the bounded nearby-cycle comparison and its constant-term compatibility (AGLR Proposition 6.13, p. 39; AGLR line 2180). GS2's convolution and rigidity, GS4's generic Satake equivalence, and GS4 §4.14 “Canonical pinned dual identification” and §4.16 “Normalized integral Satake equivalence”, which supply the pinned dual group with its Weil action used in §8.4, are consumed with the local-model central-sheaf contracts below; no argument deduces their inputs from the connected-tube conclusion of Layer 7.

What GeometricSatakeAndFusion must provide (gap:algebraic-loop-representability): Give arbitrary-field fpqc algebraic Grassmannians and twisted partial affine flags on the shared GS0 carriers.

What GeometricSatakeAndFusion must provide (gap:polynomial-bd-projectivity): In GS0’s polynomial BD extension, define the torsor modification functor Fl^P for smooth affine O_(K₀)[u]-groups with geometrically connected fibres and monic divisor P, and prove ind-projectivity with generic Grassmannian and companion affine-flag fibres for the specified polynomial parahoric lifts and Eisenstein divisors (LEV Definition 4.1.1, Proposition 4.1.4 and Theorem 4.2.10, pp. 20, 28; LEV line 791).

What GeometricSatakeAndFusion must provide (gap:negative-big-cells): Give the algebraic negative-loop big-cell chart and its root and torus coordinates used in §4.3.

What GeometricSatakeAndFusion must provide (gap:prime-to-p-central-components): Give the neutral-component comparison of algebraic affine flags under prime-to-p central covers, including the nonreduced test rings used in §§1.4 and 5.3.

What GeometricSatakeAndFusion must provide (gap:algebraic-schubert-normality): Give algebraic Schubert normality, geometric unibranchness and normal Cohen–Macaulay components in the prime-to-p companion range.

What GeometricSatakeAndFusion must provide (gap:schubert-geometric-unibranchness): In GS0 §0.31, “Witt affine flags and components”, for every connected reductive G over a p-adic field, every parahoric level and every residue characteristic, prove that every Schubert perfect variety of the partial affine flag variety over the algebraically closed residue field is normal with perfectly smooth dense open orbit, so that every finite-type deperfection of it, and every irreducible component of a Bruhat-union Schubert scheme, is geometrically unibranch even when it is not normal; and deduce, through the Witt Grassmannian of the split form, that the generic Schubert bound Gr_≤μ over C has lowest IC cohomology sheaf H^(−〈2ρ,μ〉)(IC_μ)=F_ℓ (AGLR Proposition 3.7, p. 21, AGLR line 1222; GL Lemma 5.1, p. 10, GL line 420, and Lemma 5.4, pp. 10–11, GL line 459; HLR Theorem 1.1, p. 2, HLR line 69, and Proposition 3.4, p. 11, HLR line 526).

What GeometricSatakeAndFusion must provide (gap:algebraic-compatible-schubert-splitting): For split SL_n and Sp_(2n) over an algebraically closed field of positive characteristic, supply Frobenius splittings of finite affine Schubert bounds compatible with every Schubert subvariety, so scheme-theoretic intersections of finite Schubert unions in a common bound are reduced. This is the affine-flag extension of GS0 §0.29 “Equal-characteristic Schubert models and coefficient comparison” used in §2.5 (GORGL Corollary 3.4.4, p. 19, GORGL line 643; GORSP Theorem 3.3, p. 9, GORSP line 352).

What GeometricSatakeAndFusion must provide (gap:algebraic-demazure-fibres): In GS0’s algebraic extension of §0.38 “Relative-position flag correspondences”, prove geometric connectedness of the fibres of the Iwahori-to-parahoric projection of admissible loci, using the reduced-word resolutions from §0.29 “Equal-characteristic Schubert models and coefficient comparison” (GL Lemma 5.2, p. 10; GL line 430).

What GeometricSatakeAndFusion must provide (gap:algebraic-coherence): In GS0’s algebraic Schubert prefix, for G=∏Res_(K_i/F)H_i with each H_i tamely split, any parahoric level, any dominant geometric cocharacter class μ and p∤|π₁(G^der)|, prove that for n≫0 the dimension of global sections of the n-th power of the ample determinant line bundle on the reduced μ-admissible Schubert union in the companion affine flag over k((u)) equals that on the generic Schubert bound Gr_≤μ, so the special fibre of the polynomial closure of §1.2 is that reduced union (PZ (8.19), PZ line 2659; LEV Theorem 4.3.2, p. 29, LEV line 1243, and LEV line 1389).

What GeometricSatakeAndFusion must provide (gap:algebraic-admissible-cohen-macaulay): In GS0’s algebraic Schubert prefix, for a split group over k((t)) with simply connected derived group, Iwahori level and any dominant μ, prove that the equal-characteristic local model is normal with Frobenius-split reduced special fibre, and that this special fibre, the μ-admissible union, is Cohen–Macaulay, hence S₂ (GL Theorem 2.1, p. 4, GL line 149; GL Corollary 3.5, p. 7, GL line 288–297).

What GeometricSatakeAndFusion must provide (gap:generic-algebraic-schubert-normality): In GS0’s algebraic Schubert prefix, for every connected reductive group over a characteristic-zero field and every geometric dominant bound μ defined over its reflex field, prove geometric normality of the algebraic affine Schubert bound Gr_≤μ, used as the normal generic fibre in §1.3 (PR Theorem 8.4, p. 38, PR line 1419; LEV line 1029).

What GeometricSatakeAndFusion must provide (gap:polynomial-closed-immersion-criterion): Give the polynomial BD closed-immersion criterion from closed generic group maps and the specified neutral schematic-closure condition on the companion fibre.

What GeometricSatakeAndFusion must provide (gap:central-nearby-cycles-algebraicity): Give algebraicity and bounded constructibility of local-model central nearby cycles over F_ℓ for every ℓ≠p before local-model tube connectedness.

What GeometricSatakeAndFusion must provide (gap:central-nearby-cycles-perversity): Give perverse t-exactness of local-model central nearby cycles over F_ℓ for every ℓ≠p independently of local-model tube connectedness.

What GeometricSatakeAndFusion must provide (gap:extremal-wakimoto-filtration): Give the central nearby-cycle Wakimoto filtration with its extremal weights over F_ℓ for every ℓ≠p used in §7.4.

What GeometricSatakeAndFusion must provide (gap:wakimoto-constant-term-multiplicities): Give constant-term multiplicities of the extremal Wakimoto factors over F_ℓ for every ℓ≠p used in §7.4.

What GeometricSatakeAndFusion must provide (gap:rational-central-nearby-cycles): In the GS2 early central prefix, give the rational central nearby-cycle convolution isomorphism on bounded integral v-local models for every reductive group and dominant μ (AGLR Proposition 6.17, pp. 40–41; AGLR line 2239).

What GeometricSatakeAndFusion must provide (gap:very-special-faithful-cohomology): Give faithfulness of cohomology at very special level for the rational central sheaves used to control splitting-field inertia in §8.1.

What GeometricSatakeAndFusion must provide (gap:wild-admissible-closedness): In GS0’s canonical deperfection extension, for the acceptable Hodge datum of §7.7 with p>2, p∤|π₁(G^der)| and R-smooth centralizer, prove that the special-fibre map between canonical deperfected admissible loci induced by 𝒢→Res_(O_K/O_F)𝒢₀ for the specified finite splitting extension K/F is a closed immersion.

The Hodge witness has GL₂ bound (1,0), Schubert dimension 1, generic flag P¹, and normalized IC trace −q^(−1/2); the Tate normalization is identical in Layer 8.

### From TauCetiRoadmap.DiamondsAndVStacksPartII

Sections D10.8–D10.9 supply proper monomorphisms and v-closures; D10.12 supplies full faithfulness for proper flat normal schemes, D10.13 its absolutely weakly normal form, D10.14 flat-closure comparison, and D10.15 the uniqueness of a proper flat normal model with prescribed diamond together with the existence and uniqueness of the scheme morphism to Gr(d,Λ)_(O_E) with prescribed diamond under an integral Hodge embedding. Sections D11.5, D11.11–D11.14 and D11.16–D11.20 supply tubes, rich smelted kimberlites, component comparison, π-adic triples and the proper criterion. D11.4 supplies the kimberlite of a formal scheme, used in §7.8. D11.20's normality criterion is applied after an algebraically closed residue extension. D11.14's closed-specialization hypothesis is satisfied by the perfectly finite-type admissible locus.

What DiamondsAndVStacksPartII must provide (gap:general-tube-cohomology): In D11, give the three comparisons of GL Theorem 4.7 for a prekimberlite over a rank-one valuation ring, spatial generic diamond of finite cohomological dimension, perfectly finite-type reduction and ℓ-torsion coefficients with ℓ≠p, retaining algebraicity of nearby cycles for the comparison with the étale-neighbourhood limit (GL pp. 8–9; GL line 391).

What DiamondsAndVStacksPartII must provide (gap:connected-fibre-tube-transfer): In D11, for a surjective morphism X→Y of rich p-adic kimberlites over Spd O_F with perfectly finite-type reductions and geometrically connected reduction fibres, prove that connected geometric tubes of X imply connected geometric tubes of Y (GLE22 Lemma 5.26, p. 45; GLE22 line 2293).

### From TauCetiRoadmap.PELModuli

M0 supplies rational EL/PEL algebras, involutions, alternating trace forms and lattice duality. M0.18, “The Kottwitz determinant condition”, supplies the determinant Det_(O|M) of the generic element of an order O acting on a locally free module M and the determinant condition as an equality of polynomials, which on nonreduced bases and in positive characteristic is not implied by equality of traces; §6.3 forms Det_(O_B|t_Λ) for the local order O_B and imposes the condition on every O_E-scheme. Layer 6 uses the same rational objects with ramified local orders and chains. The polarization line is retained in the torsor equivalence.

What PELModuli must provide (gap:ramified-local-pel-data): Give the local EL/PEL order, involution, connected generic similitude group and permitted ramified lattice-chain data, including the nonsplit unitary self-dual or almost self-dual level and its inverse-different trace pairing, without a good-reduction or prime-to-discriminant restriction.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Sections 2.1–2.3 and 2.6–2.10 supply hearts, recollement, intermediate extension, affine t-exactness, boundary support estimates and IC over F_ℓ. These coefficient hypotheses suffice for the low-degree Wakimoto stalk argument; the weight and rational decomposition theorems in Layer 5 of that supplier are not inputs to it.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

LPV.0 §§0.1–0.8 and LPV.6 §§6.1–6.2 supply trait nearby cycles, inertia, proper base change, duality and perverse exactness. LPV.1 supplies monodromy and its admissible filtrations. Section 1.10, “The semisimple trace of Frobenius”, supplies admissible inertia filtrations, the semisimple inertia trace independent of the admissible filtration and of the Frobenius lift, its additivity in equivariant short exact sequences and distinguished triangles, and its sign change under shift. The geometric-Frobenius trace convention is q⁻¹ on the Tate line; on a two-dimensional unipotent block with eigenvalues q⁻¹ and 1 the graded semisimple trace is q⁻¹+1, whereas the trace of raw invariants is q⁻¹.

What LefschetzPencilsAndVanishingCycles must provide (gap:semisimple-proper-pushforward): In LPV.1 §1.10 and LPV.6, for a proper equivariant morphism between finite-type schemes over a finite residue field and a bounded constructible rational ℓ-adic complex with admissible inertia action, prove that the semisimple trace of proper pushforward equals the sum of semisimple stalk traces over the rational points of each fibre, with geometric Frobenius (PZ §9.d.1–§9.d.2, pp. 74–75; PZ line 3064).

### From TauCetiRoadmap.ClassicalAdicEtaleCohomology

Section 4.5a, “Nearby-cycle and perverse coefficient comparisons”, in its comparison with nearby cycles of the adic generic fibre, identifies scheme nearby cycles with formal specialization from the adic generic fibre, respecting inertia. Use its normalized bounded constructible rational ℓ-adic realization, with uniform cohomological and Tor bounds. The D11 cohomology-comparison contract then identifies these formal nearby cycles with v-sheaf nearby cycles under its algebraicity hypotheses. For xy=π, both comparisons give R⁰ΨΛ=Λ and R¹ΨΛ=Λ(−1), so geometric Frobenius on R¹ has eigenvalue q.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.1 supplies compact-open Hecke convolution; SR.4.1 supplies normalized spherical Satake, including the chosen q^(1/2). Use SR.3.2 for the categorical Bernstein centre only at its stated scope.

What SmoothRepresentationsOfLocalGroups must provide (gap:parahoric-satake-central-functions): In the SR.3.2 parahoric-centre extension, for every connected reductive G, connected parahoric P, finite-dimensional algebraic L-group representation V and lift Φ of geometric Frobenius, construct the central function z_(Φ,V) characterized on irreducible P-spherical representations π by trace(s_Φ(π)|V), over algebraically closed characteristic-zero coefficients and independently of local-model traces (HAI15 Theorem 1.1 and Definition 9.1, pp. 1, 19–20; HAI15 line 24 and HAI15 line 742; AGLR (8.7), pp. 52–53; AGLR line 2953).

What SmoothRepresentationsOfLocalGroups must provide (gap:centre-constant-term-injectivity): In the SR.3.2 parahoric-centre extension, for a minimal F-Levi M whose split torus apartment contains the facet of P, put P_M=P∩M(F) and prove that normalized constant term Z(H(G(F),P))→Z(H(M(F),P_M)) is injective and carries z_(Φ,V) to z_(Φ,V restricted to the L-group of M) (HAI14 §11.11, pp. 44–45; HAI14 line 1896; AGLR (8.9)–(8.10), AGLR line 2974).

What SmoothRepresentationsOfLocalGroups must provide (gap:inner-form-central-support): In the SR.3.2 parahoric-centre extension, for G anisotropic modulo centre, identify normalized inner-form transfer from its quasi-split inner form on central functions with fibre sums along the Kottwitz map, with the single-support specialization used in §8.4 when V has irreducible restriction to the dual group extended by inertia (HAI14 Proposition 11.12.6, p. 48; HAI14 line 2087; AGLR (8.14), AGLR line 3006).

What SmoothRepresentationsOfLocalGroups must provide (gap:parahoric-level-change): In the SR.3.2 parahoric-centre extension, for an Iwahori I contained in a connected parahoric P, prove that convolution with the normalized P-idempotent identifies their Hecke centres compatibly with Satake-parameter central functions (HAI14 Theorem 11.10.1, p. 44; HAI14 line 1888).

What SmoothRepresentationsOfLocalGroups must provide (gap:unramified-bernstein-spherical): In the SR.4.1 parahoric-centre extension, for unramified G identify the parahoric centre with the hyperspecial spherical Hecke algebra through the Bernstein isomorphism and normalized level change (PZ Theorem 9.16, p. 76; PZ line 3132; HAI14 Theorem 11.10.1, p. 44; HAI14 line 1888).

What SmoothRepresentationsOfLocalGroups must provide (gap:companion-hecke-comparison): In the SR.4.1 companion comparison extension, for the tame Pappas–Zhu companion datum identify the parahoric Hecke algebras through their matching Iwahori–Weyl basis and parameters, compatibly with Bernstein elements and normalized parahoric idempotents (PZ §9.d.2–§9.d.3, pp. 75–76; PZ line 3091).

## How to read the build

Layer 0 fixes data, conventions and model specifications. Layer 1 constructs polynomial closures and their geometric comparison inputs. Layer 2 proves polynomial Hodge embeddings and restriction-of-scalars embeddings into possibly nonminuscule Schubert-bound closures before Layer 3 uses normal recovery to identify canonical schemes; the general weakly normal model and its smooth open of maximal orbits are constructed there independently of connected tubes. Layer 4 studies root and Cartan tangent directions, and Layer 5 builds rational curves using the invariant coroot step. Layer 6 gives chain torsors and Drinfeld comparisons. In Layer 7, general tube cohomology precedes the Wakimoto stalk calculation, which precedes connected tubes and unrestricted minuscule normality; the acceptable good-embedding application follows that theorem. Layer 8 applies nearby cycles to monodromy and the normalized central test function. Each “Needs” line specifies the statement's data and the inputs of its displayed proof route; a different proof can use a different subset.

## Layer 0: data and conventions

### 0.1 Local model data and morphisms

A minuscule local model datum is (F,G,{μ},𝒢): F is a finite extension of Q_p, G/F is connected reductive, {μ} is a geometric minuscule conjugacy class, E/F is its reflex field, and 𝒢 is smooth affine with generic fibre G and connected component 𝒢° parahoric. Permit the full facet fixer as a quasiparahoric level. A local model datum with general bound is the same quadruple (F,G,{μ},𝒢) with {μ} any geometric dominant conjugacy class of cocharacters, E its reflex field; the minuscule datum is the special case, required exactly where a statement says minuscule; the polynomial Schubert-bound closures of §1.2, the imported v-models of §0.4, the kimberlites of §3.5, the tubes of §7.5 and the nearby cycles of Layer 8 use general bounds. A morphism is a group morphism carrying {μ} to the indicated class and extending over the specified integral models; it is not, by definition, a closed immersion on local models. Write ℱ_(G,{μ}) for the generic flag variety: the E-variety of parabolic subgroups of G of the type determined by {μ} under the flag convention of §0.2, obtained by descent from a splitting field. Over a field over which G splits and μ has a representative it is the parabolic quotient G/P_μ; no E-rational representative of μ and no E-rational parabolic is assumed. If such a representative exists over E, ℱ_(G,{μ}) is identified with the corresponding quotient G/P_μ. (KP, §2.1, p. 150, KP line 1253; KPZ, §3.1.1, pp. 15–16; KPZ line 686; KZ, §3.1.1, p. 18; Definition 3.1.6(1), p. 19; KZ line 811).

One proof proceeds as follows. Bundle the reductive-group, facet and connected-parahoric data; add the cocharacter orbit and its field of definition. Compose the generic and integral morphisms and check compatibility on generic fibres.

The construction has the following properties:

- Return E as the fixed field of the stabilizer of {μ}.
- Composable integral morphisms compose with the same generic composite.
- Replace 𝒢 by 𝒢° without changing (F,G,{μ}).
- An isomorphism of group, cocharacter and integral level data induces an isomorphism of data.

**Checks.**

- For GL₂ and μ=(1,0), E=F and the generic flag variety is P¹_F.
- For μ=0 the generic flag variety is Spec F.
- For a quaternion division algebra D over F, G=PGL₁(D)=D^×/F^× and the class of (1,0) on G over a splitting field, the class is Galois-stable, so E=F; ℱ_(G,{μ}) is the Severi–Brauer conic of D, which has no F-point because D is not split, while over a splitting field it is P¹. Writing G/P_μ over F with an F-parabolic would produce a rational coset that does not exist.
- The GL₂ class (2,0) is excluded from the minuscule datum (〈(2,0),α〉=2 for the positive root α) but is a datum with general bound, the one used in the polynomial Schubert-bound construction of §1.2 and the general v-model of Layer 3; its reflex field is F and its generic Schubert bound has dimension 〈2ρ,(2,0)〉=2.

Changing the connected component of the level is an explicit comparison, not equality of the ambient Grassmannians.

*Needs:* ReductiveGroupsPartII RG2.2; ReductiveGroupsPartII RG2.3.

### 0.2 Hodge and abelian type; cocharacter conventions

A local Hodge representation ρ:G↪GL(V) is faithful, minuscule as a representation, contains scalar homotheties in its image, and carries μ to diag(z·1_d,1_(h−d)), h=dim_F V. A datum is of abelian type when its adjoint pair is isomorphic to that of a Hodge datum. The flag convention here selects the weight-one rank-d subspace. For SW quotient data the weight-one quotient has rank d and its kernel has rank h−d; use the opposite parabolic/dual representation to compare. KZ uses weights (0,−1); record inversion of μ and the resulting flag identification instead of identifying the two subspaces. (KPZ, Definitions 3.1.2–3.1.3, p. 16; §3.1.9, p. 17; KPZ line 700; KZ, local Hodge embedding defined after Remark 3.1.3, p. 18; Definition 3.1.6(2), p. 19; KZ line 856; SW, Definition 21.6.8, pp. 200–201; SW line 7685).

One proof proceeds as follows. Attach the representation and its scalar and weight conditions to the datum. Use kernels and annihilators to derive the rank and opposite-parabolic dictionary.

The construction has the following properties:

- The representation induces the closed generic flag map to the rank-d subspace Grassmannian.
- For every positive integer m, the m-fold direct sum has ranks (mh,md), remains faithful and has the same reflex field.
- Inverting the cocharacter exchanges the chosen parabolic with its opposite; dualizing identifies quotient and annihilator conventions.
- Forget the central lift and retain the adjoint pair.

**Checks.**

- The standard GL_h representation with μ=(1^d,0^(h−d)) is Hodge.
- For h=3,d=1 a weight-one quotient has a rank 2 kernel, not a rank 1 kernel.
- The faithful GL₂ standard representation with μ=(2,0) fails the Hodge weight condition.
- For G=GL₂, the empty direct sum has rank 0 and kernel all of G, so multiplicity 0 fails faithfulness.

For h=3,d=1 the SW kernel has rank 2.

*Needs:* §0.1; ModularCurves §0G.

### 0.3 Quasi-tame, essentially tame and non-exceptional data

Call G quasi-tame if G≅∏ Res_(K_i/F)H_i with K_i/F finite and H_i splitting tamely over K_i. Call G essentially tame (KZ: acceptable) when G^ad is quasi-tame. The standard range is p>2, abelian type, essentially tame, and classical with triality excluded. For a standard datum, (NE) additionally excludes quaternionic D-type factors and type-A factors Res_(K/F)PGL_m(D) with p dividing the index of the central division algebra D. This predicate is exported for the very-good-embedding continuation; no very-good-embedding theorem is claimed here. (KPZ, §§3.1.4–3.1.6, p. 16; condition(NE), §6.1, p. 62; KPZ line 712; KZ, §3.1.2, p. 18; KZ line 819).

One proof proceeds as follows. Separate tameness over K_i from ramification of K_i/F. Express exclusions on adjoint simple factors and prove invariance under isomorphism of adjoint pairs.

The construction has the following properties:

- A quasi-tame group is essentially tame.
- The quasi-tame and essentially tame predicates are factorwise for finite products.
- An isomorphism of adjoint pairs preserves (NE).
- Standard data supply p>2 without asserting that every acceptable group is itself quasi-tame.

**Checks.**

- Res_(K/F)GL_n is quasi-tame even when K/F is wildly ramified.
- A split GL_n Hodge datum is non-exceptional.
- A type-A factor PGL_m(D) with index(D)=p is excluded by (NE), even though p is odd.

A wildly ramified K_i/F is allowed when H_i is split.

*Needs:* §0.2; ReductiveGroupsPartII RG2.1.

### 0.4 The imported bounded integral local model

Use the notation Mᵛ_(𝒢,μ) for the integral v-closure of the generic closed Schubert bound in the integral Grassmannian over Spd O_E, constructed in GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”. For arbitrary dominant μ its generic fibre is Gr_≤μ; when μ is minuscule it is the flag diamond. The following properties specify the imported object consumed throughout the layers. (AGLR, §1.1, pp. 2–3; Definition 4.11, Proposition 4.14 and Proposition 4.16, pp. 30–31; AGLR line 1671; GLX, §3.2, pp. 18–19 (v3); GLX line 749; SW, Conjecture 21.4.1 and Proposition 21.4.3, p. 195; SW line 7488).

The construction has the following properties:

- Restriction to Spd E recovers Gr_≤μ.
- The inclusion into the integral Grassmannian is a closed immersion, and Mᵛ is proper over Spd O_E.
- For minuscule μ, 𝒢° and 𝒢 have canonically isomorphic closures.
- A central surjection carrying a minuscule lift μ̃ to μ identifies closures after O_E→O_Ẽ (SW, Proposition 21.5.1, pp. 196–197; SW line 7543).

**Checks.**

- The GL₂ bound (1,0) has generic fibre (P¹_E)^♦.
- For μ=0 the closure is Spd O_E.
- For SL₂→PGL₂, the dominant cocharacter diag(z,z⁻¹) maps to 2∈X_*(PGL₂)=ℤ. The minuscule PGL₂ class 1 has no SL₂ lift, since 2n=1 has no integral solution. Thus this central comparison cannot be applied to that class. The central-cocharacter GL₁→1 comparison with μ=0 has both closures Spd O_F.

A central cocharacter gives a point over Spd O_E; a nonminuscule bound is not renamed a flag variety.

*Needs:* §0.1; GeometricSatakeAndFusion GS0, §0.6 “Generic Schubert bounds”; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS4, §4.18 “Functoriality of integral local models”; DiamondsAndVStacksPartII §D10.9.

### 0.5 Specification of the scheme representative

For minuscule μ, an integral scheme representative consists of a flat projective O_E-scheme M with a specified closed immersion M^♦↪Gr_(𝒢,Spd O_E) inducing an isomorphism M^♦≅M^v_(𝒢,μ), whose generic restriction is the given flag embedding. The final local-model specification also requires geometrically reduced special fibre. It then has normal generic fibre and is normal; uniqueness is relative to the specified comparison map and uses normal proper-scheme full faithfulness. Keep the intermediate weakly normal representative distinct until reducedness and normality are proved. (SW, Conjecture 21.4.1 and Remark 21.4.2, p. 195; SW line 7491; KPZ §3.1.7, p. 16, KPZ line 741; AGLR, Theorem 7.22, pp. 49–50; Lemma 7.27, p. 51; AGLR line 2776).

One proof proceeds as follows. Bundle the scheme and its specified diamond isomorphism with the v-closure. Apply the specified trait normality lemma only after reducedness is available; then invoke normal full faithfulness.

The construction has the following properties:

- Return M_E≅ℱ_(G,{μ}) with its comparison map.
- The integral level action is the unique action whose diamond is the action on the closure.
- Two normal proper representatives with these specified maps are uniquely isomorphic over O_E; this is DiamondsAndVStacksPartII §D10.15(1), applied to the composite of the two specified comparison maps.
- Finite reflex-field base change agrees when the base-changed scheme remains normal with geometrically reduced special fibre.

**Checks.**

- For the one-lattice GL₂ line datum M=P¹_(O_F), with one irreducible special-fibre component.
- Blow up P¹_(O_F) at a rational special-fibre point. The result is regular, flat and projective, and its special fibre has two reduced components, each of multiplicity 1. Its diamond maps onto Mᵛ but collapses the exceptional P¹ to that point. Distinct geometric points of this P¹ have the same image, so the comparison is not a monomorphism and the blow-up is excluded.
- For a central cocharacter M=Spec O_E.
- The conic x²=π_E yz in P²_(O_E) is flat, since its equation is not divisible by π_E, and its generic fibre is a smooth conic with the rational point [0:1:0], hence P¹_E. Its special fibre x²=0 is a double line, so it fails the reduced-fibre specification, although it is even normal: on z=1 the equation x²=π_E y is a rank-3 quadric cone in the coordinates x,π_E,y with an isolated singular point.

Weak normalization alone does not certify the final scheme specification.

*Needs:* §0.4; DiamondsAndVStacksPartII §D10.12; DiamondsAndVStacksPartII §D10.15; SchemeAndStackFoundations §§0.8, 0.30 and 4.13; gap:trait-normality.

### 0.6 Good integral Hodge embeddings

An integral Hodge embedding is a Hodge representation together with a closed group-scheme embedding 𝒢↪GL(Λ), Λ an O_F-lattice in V. It is good if the functorial map of scheme local models is a closed immersion into the rank-d Grassmannian over O_E. The chain variant uses GL(𝓛) and its local model; a chosen positive period with r terms yields tot(𝓛)=⊕_(i=0)^(r−1)Λ_i and the r-fold representation. Goodness is a condition on the local-model map, separate from closedness of the group map. (KPZ, Definition 3.4.4 and the chain variant, pp. 28–29; KPZ line 1234; KZ, Definition 3.1.6, p. 19; KZ line 856).

One proof proceeds as follows. Form the integral Hodge map on v-sheaves, and when the relevant scheme models are normal lift it by proper full faithfulness. Form the finite period total lattice, retaining the incidence and rank conditions.

The construction has the following properties:

- Return the closed local-model morphism and its prescribed generic flag map.
- Transport of the integral representation and lattice along an isomorphism preserves goodness.
- The local-model map restricts to the flag map of the Hodge representation.

**Checks.**

- The identity one-lattice GL_h Hodge embedding is good.
- For a two-term GL₂ line chain the total map has target Gr(2,Λ₀⊕Λ₁).
- Over a characteristic-zero field k, the normalization Spec k[t]→Spec k[t²,t³] is finite, birational and bijective on geometric points. The ring map misses t, so the map is not a closed immersion. This tests the distinction between normalization of an image and goodness; it is not asserted to arise from a Hodge embedding.

The dimension and rank after summing a period are (rh,rd).

*Needs:* §0.2; §0.5; ReductiveGroupsPartII RG2.3.

### Examples

For GL₂ and μ=(1,0), E=F, h=2,d=1 and the generic flag is P¹. For μ=0 it is a point. For h=3,d=1, a quotient has kernel rank 2; the two flag conventions therefore require the explicit dual/opposite comparison (KPZ §3.1, pp. 15–17; KPZ line 686; SW line 7685).

### Dependencies

ReductiveGroupsPartII RG2.2; ReductiveGroupsPartII RG2.3; ModularCurves §0G; ReductiveGroupsPartII RG2.1; GeometricSatakeAndFusion GS0, §0.6 “Generic Schubert bounds”; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS4, §4.18 “Functoriality of integral local models”; DiamondsAndVStacksPartII §D10.9; DiamondsAndVStacksPartII §D10.12; DiamondsAndVStacksPartII §D10.15; SchemeAndStackFoundations §§0.8, 0.30 and 4.13; gap:trait-normality. The internal section references above give the additional ordering within this layer.

## Layer 1: polynomial closures and comparisons

### 1.1 Polynomial modification input

Let K₀/F be finite unramified, P(u)∈O_(K₀)[u] monic and 𝓗 smooth affine over O_(K₀)[u] with geometrically connected fibres. Write Fl^P_(𝓗,0) for the polynomial torsor modification functor requested from GeometricSatakeAndFusion GS0 and Fl^P_𝓗 for its restriction of scalars to O_F. In the local-model application G=Res_(K/F)H, H is tamely split over K, the lift specializes u↦π_K and P=E_K(u). The ind-projectivity and generic/companion fibre contracts are invoked only for this specified polynomial parahoric lift (KPZ §§3.2.2–3.2.5, p. 18; KPZ line 793; LEV Definition 4.1.1, Proposition 4.1.4 and Theorem 4.2.10, pp. 20, 28; LEV line 791).

**Checks.**

- For GL₁, a modification of degree m at u−π specializes to t^m; m=0 gives the neutral point.
- For P=1 the trivialization is global, so the modification is uniquely trivial; this is outside the Eisenstein-divisor fibre assertion.
- For the additive group over k at t=0 the quotient is t⁻¹k[t⁻¹], containing a nonproper affine-line family; smooth connected fibres alone cannot imply ind-projectivity.

*Needs:* §0.1; ReductiveGroupsPartII RG2.0a; ReductiveGroupsPartII RG2.3; gap:polynomial-bd-projectivity; gap:polynomial-parahoric-lifts.

### 1.2 Schematic local-model closure

For quasi-tame G with a specified polynomial parahoric lift and any dominant geometric cocharacter class {ν} with reflex field E, define M^pol_(𝒢,ν) as the schematic closure of the generic closed Schubert bound Gr_≤ν in the polynomial Grassmannian over O_E. Use the local model datum with general bound of §0.1. For ∏ Res_(K_i/F)H_i take the product of the factor closures after extension from each factor reflex field to E. This closure is flat and projective with generic fibre Gr_≤ν; when ν is minuscule this fibre is the flag ℱ_(G,{ν}) of §0.1. It is distinguished from both an EL/PEL naive determinant model and the canonical normal minuscule model. (LEV Definition 4.2.1 and Proposition 4.2.6, pp. 23–24; LEV line 949 and LEV line 1007; minuscule specialization: KPZ Definition 3.2.6 and §3.2.8, p. 19, KPZ line 839; KP §2.1.1, p. 150, KP line 1235).

One proof proceeds as follows. Choose a finite projective bounded piece containing Gr_≤ν. Take the schematic closure; torsion-freeness over O_E supplies flatness. Construct factorwise closure and compare generic Schubert bounds after reflex base change.

The construction has the following properties:

- The generic fibre is Gr_≤ν, specializing to the prescribed flag variety for minuscule ν.
- The structure morphism is flat projective over O_E.
- The generic closed Schubert bound is schematically dense in M^pol.
- Product data give the product of factor models over the compositum reflex field.

**Checks.**

- One-lattice GL₂, μ=(1,0), gives P¹_(O_F).
- The zero bound gives Spec O_E.
- For hyperspecial GL₂ and ν=(2,0), the generic Schubert bound has dimension 〈2ρ,ν〉=2, whereas the finite flag GL₂/P_ν is P¹ of dimension 1; only the Schubert bound defines this closure.
- For K/F ramified quadratic, G=Res_(K/F)GL₂, Λ=O_K² and the central class with weights (1,1) at one embedding of K and (0,0) at the other: its reflex field is K, its generic Schubert bound is one point and its closure is Spec O_K. The EL determinant locus of §6.3 instead has the A¹-family of special-fibre quotients computed there, so it is not the schematic closure of its generic fibre.

The construction does not assert normality when p divides the derived fundamental group.

*Needs:* §1.1; §0.1 (general bound); GeometricSatakeAndFusion GS0, §0.6 “Generic Schubert bounds”; gap:algebraic-loop-representability; SchemeAndStackFoundations §0.8.

### 1.3 Normality and admissible special fibre

Use the local model datum with general bound of §0.1. If G is quasi-tame, μ is dominant and p∤|π₁(G^der)|, M^pol_(𝒢,μ) is normal and its geometric special fibre is reduced, with the μ-admissible orbit stratification in the companion twisted affine flag. Each geometric irreducible component is normal, Cohen–Macaulay and Frobenius split. After any finite reflex-field extension the base-changed model remains normal. No assertion here makes the whole reducible special fibre normal, and the component statement is not used as a proof of whole-fibre Cohen–Macaulayness. (LEV, Theorem 4.2.7, pp. 24–25, LEV line 1024, for every dominant μ, and Theorem 4.3.2, p. 29, LEV line 1243; minuscule specialization: KPZ, Theorem 3.2.9 and footnote 5, p. 19; KPZ line 859; KP, Theorem 2.1.2 and Corollary 2.1.3, pp. 150–151; KP line 1279).

One proof proceeds as follows. Import the common algebraic affine-flag Schubert normality, Demazure, admissible-set and coherence interfaces specified at GS0. Use Levin’s global convolution/coherence argument to identify the reduced special fibre and its components. For finite reflex extension preserve geometric reducedness; apply the specified trait normality criterion, using geometric normality of the generic Schubert bound Gr_≤μ (gap:generic-algebraic-schubert-normality); for minuscule μ this bound is the smooth flag.

An Iwahori special fibre can be reducible; test component normality separately.

For hyperspecial GL₂ and the non-minuscule μ=(2,0), the admissible set is {t^(2,0),t^(1,1)} and the special fibre is the two-dimensional Schubert variety of t^(2,0) (dimension 〈2ρ,μ〉=〈(1,−1),(2,0)〉=2) containing the point of t^(1,1); it is irreducible, reduced and normal, with one singular point, and equals the special fibre of the constant model Gr_≤(2,0) over O_F. For μ=(1,0) the statement gives P¹_(O_F).

*Needs:* §1.2; §0.1 (general bound); gap:algebraic-schubert-normality; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; gap:algebraic-coherence; gap:generic-algebraic-schubert-normality; ReductiveGroupsPartII RG2.1; SchemeAndStackFoundations §§0.17, 0.30 and 4.13; gap:trait-normality; gap:polynomial-parahoric-lifts.

### 1.4 Polynomial adjoint and derived-isogeny comparisons

In the tame setting of KP §2.2, the morphism of rigidified polynomial groups G̲→G̲^ad extends over the polynomial parahorics and induces ad_* on closures after the reflex extension E^ad⊂E. If p∤|π₁(G^der)|, ad_* identifies the local model of G with the normalization of the base change of the adjoint local model to O_E, equivalently of the schematic image of ad_* (KP Proposition 2.2.4); the normality of the source used here is KP Theorem 2.1.2, which needs this hypothesis. If a central isogeny G^der→G′^der identifies the adjoint cocharacter data and parahoric facets as in §2.2.5, and p∤|π₁(G′^der)|, the corresponding models become isomorphic after the specified common reflex extension (Proposition 2.2.7). Retain the integral central quotient of derived parahorics; the generic isogeny alone is insufficient. (KP, Propositions 2.2.2,2.2.4,2.2.7, pp. 152–155; KP line 1340).

Precisely, assume G splits over a tamely ramified extension of Q_p (KP §2.1.1, §2.2.3). p∤|π₁(G^der)| for the adjoint comparison (KP Proposition 2.2.4). For the derived comparison, require tame splitting, a central isogeny G^der→G′^der inducing the indicated adjoint isomorphism, corresponding adjoint cocharacter classes, corresponding building points and the resulting integral derived-parahoric quotient, and p∤|π₁(G′^der)|.

One proof proceeds as follows. Use the polynomial central-quotient map and derived parahoric quotient from their reductive-group owner. On generic flags obtain the isomorphism onto the image; on special flags use the neutral-component central-isogeny comparison to obtain quasi-finiteness. Proper plus quasi-finite gives finite; normality identifies the normalization. Apply this on both sides of the derived comparison.

All comparisons carry their reflex base changes; no isomorphism of complete affine flags is inferred.

*Needs:* §1.3; ReductiveGroupsPartII RG2.3; gap:prime-to-p-central-components; SchemeAndStackFoundations §§0.20–0.21 and 0.30; gap:polynomial-parahoric-lifts.

### 1.5 An auxiliary prime-to-p Hodge cover

For a standard local abelian-type pair with μ^ad nontrivial on every F-simple adjoint factor, there is a Hodge pair (G′,μ′) with the same adjoint pair, p∤|π₁(G′^der)|, G′=∏Res_(K_i/F)H′_i with H′_i tamely split, and E′=E^ad. Each H′_i has a faithful minuscule representation whose restriction of scalars is a Hodge embedding. This theorem constructs the cover and generic representation; it does not import PRLSV’s very-good integral embedding, whose proof uses the separate display-theoretic KPZ §6. (KPZ, Proposition 3.2.11, p. 19; KPZ line 864; PRLSV, Proposition 7.2.1, proof through the generic construction, pp. 53–55; PRLSV line 2194).

One proof proceeds as follows. Use the specified classical minuscule representation classification and Galois descent to choose a Galois-stable list of weights. Adjoin the scalar torus to the faithful image of the simply connected cover; choose the central lift giving weights 0,1. Check the derived kernel has order at most 2 in the D case, hence prime to the odd residue characteristic; track the reflex stabilizer.

Separate the proof of the generic cover from the very-good-embedding conclusion of PRLSV Proposition 7.2.1.

*Needs:* §0.3; §0.2; ReductiveGroupsPartII RG2.1; gap:classical-hodge-cover-classification.

### 1.6 The one-lattice GL representative

For GL(Λ) and minuscule μ=(1^d,0^(h−d)), the local-model v-sheaf is the diamond of the smooth projective Grassmannian of rank-d subspaces (equivalently rank-(h−d) quotients). With the SW quotient convention of rank d use the opposite flag Grassmannian of kernels of rank h−d. This supplies the GL case needed for normal schematic closure recovery. (SW, Proposition 21.6.9 and proof of Corollary 21.6.10, pp. 201–203; SW line 7710).

One proof proceeds as follows. Build the modification from the kernel of the universal quotient after B_dR⁺→R. Use the integral Grassmannian closed-immersion criterion; its generic fibre is the minuscule flag. Smoothness and flatness of the Grassmannian make its generic fibre schematically dense, so the image is exactly the v-closure.

For h=3,d=1 distinguish P² of lines from the SW rank 1 quotient description by the duality dictionary.

*Needs:* §0.4; SchemeAndStackFoundations §0.8; ModularCurves §0G; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”.

### Examples

The one-lattice GL₂ closure is P¹ over O_F. At Iwahori level the GL₂ line model has two P¹ special-fibre components meeting at a node. Thus component normality gives normal branches, not normality of the whole reducible fibre; its two local branches have equation xy=0 (KP Theorem 2.1.2, p. 151; KP line 1279; SW line 7622).

### Dependencies

ReductiveGroupsPartII RG2.0a; ReductiveGroupsPartII RG2.3; gap:polynomial-bd-projectivity; gap:polynomial-parahoric-lifts; SchemeAndStackFoundations §0.8; gap:algebraic-schubert-normality; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; gap:algebraic-coherence; gap:generic-algebraic-schubert-normality; ReductiveGroupsPartII RG2.1; SchemeAndStackFoundations §§0.17, 0.30 and 4.13; gap:trait-normality; gap:prime-to-p-central-components; SchemeAndStackFoundations §§0.20–0.21 and 0.30; gap:classical-hodge-cover-classification; ModularCurves §0G; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; GeometricSatakeAndFusion GS0, §0.6 “Generic Schubert bounds”; gap:algebraic-loop-representability. The internal section references above give the additional ordering within this layer.

## Layer 2: polynomial Hodge and Schubert-bound embeddings

### 2.1 Closed polynomial model embedding into a split form

Assume p>2, G=Res_(K/F)H with H tamely split and classical without triality, μ minuscule, and x generic in its facet. For every adjoint simple factor Res_(L/K)PGL_m(D), with L/K tame, m≥1 and D a central division L-algebra, require p∤index(D). ReductiveGroupsPartII RG2.3.5, “Tame realization of stabilizers as fixed points of hyperspecial models”, supplies a point x′ with the same full fixer 𝓗_(x′)=𝓗_x and a tame Galois splitting extension K̃/K over which x′ is hyperspecial (KPZ §2.1.1, §2.2.1 and Proposition 2.2.2, pp. 10–11; KPZ line 418, KPZ line 464 and KPZ line 480). Use the hyperspecial model at x′ and its lattices. The resulting polynomial parahoric morphism into the Weil-restricted split form induces a closed immersion M^pol_(𝒢,μ)→M^pol_(Res_(O_K̃/O_F)H₀,μ̃)⊗_(O_Ẽ)O_E. Here 𝒢=Res_(O_K/O_F)𝓗_x=Res_(O_K/O_F)𝓗_(x′), and μ̃ is induced by this group embedding. (KPZ §§3.3.1–3.3.7, pp. 20–21; KPZ line 906).

One proof proceeds as follows. Import the replacement x′, equality of full fixers and integral fixed-point embedding contracts with their p>2, classical, non-triality and index hypotheses. Tame Γ-fixed points are smooth; compare the polynomial parahoric with the neutral component of the closure. Use the specified Pappas–Zhu proper-monomorphism criterion on bounded closures, not merely a pointwise inclusion.

**Checks.**

- For split GL₂ at a hyperspecial vertex, the splitting extension is K itself and the comparison is the identity on P¹.
- With p=3 and index(D)=3, PGL₂(D) has positive relative rank but is excluded: the forbidden index is 3, independently of m=2.
- For PGL₂(D) with index(D)=2 at p=3, the index condition reads 3∤2; the remaining facet hypotheses still apply.
- In the reduced apartment of split GL₂/Q₃, the alcove coordinate s=√2−1 remains irrational after multiplication by every finite ramification index e, so the original x never becomes a vertex. Choose x′ with coordinate 1/4 in the same alcove and the same central coordinate: both full fixers are the Iwahori. The tame Galois extension Q₃(ζ₄,3^(1/4))/Q₃ has e=4 and sends x′ to coordinate 1, a hyperspecial vertex. This tests equality of fixers rather than equality of points.

*Needs:* §1.2; ReductiveGroupsPartII RG2.0a; ReductiveGroupsPartII RG2.2; ReductiveGroupsPartII RG2.3; gap:polynomial-closed-immersion-criterion; gap:polynomial-parahoric-lifts.

### 2.2 Minuscule Weyl-lattice model embedding

Retain all hypotheses of §2.1, its chosen replacement point x′ with 𝓗_(x′)=𝓗_x, and the tame Galois extension making x′ hyperspecial. For a faithful minuscule H-representation ρ₁ as in KPZ §3.3.11, whose composed cocharacter over K̃ is minuscule, choose the split Weyl-module Z_p-form H₀↪GL(Λ₀). It gives a closed immersion of the Weil-restricted polynomial BD Grassmannians, and consequently of the bounded closure models, after the appropriate reflex extension. The representation-theoretic input is uniqueness, up to the representation centralizer, of lattices to which the minuscule representation extends as a group-scheme homomorphism over the DVR, not uniqueness of all lattices stable under integral points. (KPZ, §§3.3.9–3.3.13, Lemma 3.3.10, Proposition 3.3.14, pp. 22–23; KPZ line 958).

One proof proceeds as follows. Use the integral minuscule Weyl-lattice and reductive closed-immersion theorems from the integral representation supplier. Compare the Γ-stable lattices of the hyperspecial model at x′ with the split Weyl lattices via their centralizer. Construct the torsor map; apply the closed-BD criterion and restrict to schematic generic closures.

Repeated isotypic factors allow centralizer changes; a fixed chosen basis is not canonical. Stability under integral points is weaker than extension of the group scheme: let G_m act on Z₃³ with weights (0,2,1) and put Λ=Z₃e₁+Z₃(e₁+e₂)/3+Z₃e₃. A unit u sends (e₁+e₂)/3 to u²(e₁+e₂)/3+((1−u²)/3)e₁, and (1−u²)/3∈Z₃ because u²≡1 mod 3, so Λ is stable under G_m(Z₃); but the coaction coefficient (1−T²)/3 is not in Z₃[T,T⁻¹], so the representation does not extend to G_m over Z₃ on Λ. The diagonal centralizer preserves weight-split lattices, so Λ is not conjugate to Z₃³ by it.

*Needs:* §2.1; ReductiveGroupsPartII RG2.0a; ReductiveGroups §10B, “Induction, Weyl modules and simple heads”; gap:algebraic-loop-representability; gap:polynomial-closed-immersion-criterion; gap:stable-weyl-lattices; gap:polynomial-parahoric-lifts.

### 2.3 Restriction of structure on local models

For finite K/F, an O_K-lattice Λ⊂V of rank n, and minuscule μ of Res_(K/F)GL(V) with reflex field E, let ρ:Res_(K/F)GL(V)↪GL(V as F-space) be restriction of scalars and let ν be the dominant representative of ρ∘μ. The integral restriction embedding induces a closed immersion M^pol_(Res GL(Λ),μ)→M^pol_(GL(Λ as O_F-module),ν)⊗_(O_F)O_E. The target is the Schubert-bound closure of §1.2, even when ν is not minuscule; its generic fibre is Gr_≤ν, while the source generic fibre is the minuscule flag for Res_(K/F)GL(V). This includes ramified K/F. If every embedding-wise μ has weights 0 and 1 with weight-one multiplicity d_τ, then ν is minuscule, the total weight-one subspace rank is Σ_τ d_τ, and the corresponding quotient rank is n[K:F]−Σ_τ d_τ. In the SW weight-one quotient convention its rank is Σ_τ d_τ. (KPZ §3.3.18, Proposition 3.3.20 and proof, pp. 24–25, KPZ line 1036 and KPZ line 1078; general-bound target: LEV Definition 4.2.1, p. 23, LEV line 960).

One proof proceeds as follows. Construct the closed group embedding by the O_K-endomorphism equations. For the polynomial comparison use O_F[v]→O_(K₀)[u], v↦E_K(u)+π_F, and the finite-flat torsor restriction theorem specified at RG2.0a. The modification map sends the generic source bound into Gr_≤ν: over a splitting field it takes the direct sum of the embedding-wise lattices and preserves the dominance bound. Schematic generic density therefore makes the map on closures factor through M^pol_(GL,ν). The companion affine-flag map is locally closed on the relevant component; ind-properness makes its restriction to the bounded source proper, hence closed. Its generic restriction is a closed immersion by the lattice description with its O_K-action. The bounded properness and special-fibre closed immersion give the integral closed immersion by the PZ criterion and Nakayama, as in the cited proof.

The restriction map has the following properties:

- Its generic map is the restriction of the polynomial modification map to the source flag, with target Gr_≤ν.
- It is equivariant for the integral restriction embedding, and its prescribed generic map determines it by schematic density.
- When all embedding-wise weights are 0 and 1, it is the flag embedding with total weight-one rank Σ_τ d_τ; no single quotient rank describes a general ν.

**Checks.**

- For K/F unramified quadratic, V=K and μ=(2,0), the torus source flag is one point. Its image ν=(2,0) has GL₂ root pairing 2 and Schubert dimension 2; GL₂/P_ν has dimension 1 and is not the target generic fibre.
- For the same torus and μ=(1,0), ν=(1,0), the source flag is one point, the target is P¹ and the total weight-one rank is 1.
- For [K:F]=e with constant embedding-wise weights 0,1 of weight-one multiplicity d in rank n, the total subspace rank is ed and the quotient rank is e(n−d); at d=0 both Schubert bounds are points, with quotient rank en.

*Needs:* §1.2; ReductiveGroupsPartII RG2.0a; gap:polynomial-bd-projectivity; gap:polynomial-closed-immersion-criterion; gap:algebraic-loop-representability; SchemeAndStackFoundations §0.28; ModularCurves §0G.

### 2.4 Closed embeddings after a representation power

For quasi-tame classical G, p>2, and a Hodge representation of the product form of KPZ (3.3.24), a direct sum ρ^(⊕m) with m≥1 admits an O_F-lattice Λ and a quasiparahoric 𝒢′ with (𝒢′)°=𝒢° such that 𝒢′↪GL(Λ) is closed and M^pol_(𝒢,μ)≅M^pol_(𝒢′,μ)↪Gr(md,Λ)_(O_E) is closed, with dimensions interpreted for the resulting power. The theorem permits changing the full fixer. If π₁(G)_I is torsion-free, or x is generic in its facet and every adjoint factor Res_(L/K)PGL_m(D) has division index prime to p, one can take 𝒢′=𝒢 as in Remark 3.3.26. (KPZ, Theorem 3.3.25, Remark 3.3.26, pp. 26–27; KPZ line 1125).

One proof proceeds as follows. In the unobstructed case compose the three closed model embeddings. In general pass to a finite unramified field making G quasi-split, choose the Γ-stable generic facet fixer there and use its descended quasiparahoric. Restrict scalars and sum the lattices. Descend the prescribed model map using schematic density and separatedness.

A theorem for the connected component must not be silently promoted to the original full fixer.

*Needs:* §2.1; §2.2; §2.3; §0.2; ReductiveGroupsPartII RG2.3; SchemeAndStackFoundations §1.1; gap:polynomial-representation-descent.

### 2.5 Standard GL and GSp chain incidence models

For a standard periodic O_F-lattice chain Λ_(i+r)=π_FΛ_i, with π_FΛ₀⊂Λ_(r−1)⊂⋯⊂Λ₀ in V and the standard minuscule bound of subspace rank d, the GL local model represents rank-d locally direct summands F_i⊂Λ_i⊗R, compatible with all transitions and period identifications. It is the flat closure of the diagonal generic Grassmannian in ∏_(i=0)^(r−1)Gr(d,Λ_i). Prove that this incidence scheme is flat over O_F and hence equals that flat closure; incidence equations alone do not establish flatness (GORGL Theorem 4.5.3 and Corollary 4.5.4, p. 37; GORGL line 1406). (KP, §2.3.4 and (2.3.9), pp. 157–159; KP line 1523; SW, Definitions 21.6.1,21.6.8, pp. 199–201; SW line 7622).

One proof proceeds as follows. Construct the closed incidence subfunctor of the finite product of Grassmannians. For a nonempty partial period I, write M_(I,k) for the partial-chain special fibre, embedded in its companion partial affine flag Fl_I. Let pr_I:Fl_full→Fl_I be the ambient full-to-partial flag projection and define X_I=Fl_full×_(Fl_I)M_(I,k). The map X_I→M_(I,k) is a smooth surjection, with fibres the finite flag varieties of refinements. Prove X_I reduced by expressing its lattice conditions as scheme-theoretic intersections of Schubert unions within a finite Schubert bound, and use a splitting compatible with all of these Schubert ideals. Smooth surjective descent gives reducedness of M_(I,k). Separately, the maximal components have dense affine charts whose generic points lift to the generic fibre; reducedness of the special fibre and this lifting imply flatness. The same component argument handles the complete period. The scheme X_I is an ambient special-fibre inverse image, rather than the complete-chain integral incidence model. Identify the generic diagonal, then use schematic density to identify its flat closure (GORGL Corollary 3.4.4, p. 19, Theorem 4.5.1, pp. 35–36, Theorem 4.5.3 and Corollary 4.5.4, p. 37; GORGL line 643, GORGL line 1325, GORGL line 1406 and GORGL line 1414).

The construction has the following properties:

- Compatible locally direct summands over one period, with periodic extension, give a point.
- Evaluation at Λ_i gives the morphism to Gr(d,Λ_i).
- Points are equal when their summands for one full period agree.
- Pullback of summands and transition compatibilities gives base change.
- The square defining X_I is cartesian on all k-algebras, including nonreduced ones; X_I→M_(I,k) parametrizes the ambient full-flag refinements of the retained partial flag.
- The projection X_I→M_(I,k) is smooth and surjective, so reducedness descends from X_I; this projection imposes no minuscule incidence conditions at the omitted indices.

**Checks.**

- A single-lattice period yields Gr(d,Λ₀); for d=0 or d=dim V each period has a unique choice and the incidence model is Spec O_F.
- For Λ₁=Oe₁⊕πOe₂⊂Λ₀=O², d=1, the closed fibre is the two-component incidence curve.
- For I the full period, pr_I is the identity and X_I=M_(I,k); its refinement fibres are points.
- For a one-lattice GL₂ period I and d=1, M_(I,k)=P¹ and every fibre of X_I→M_(I,k) is P¹, parametrizing a refinement of the retained lattice. Unlike the two-lattice incidence model, it does not have refinement fibres of dimensions 1 and 0.
- For d=0 in rank 2 and a one-lattice period, M_(I,k)=Spec k while X_I=P¹; the omitted refinement is still free. Over k[ε]/ε², the refinements [1:0] and [1:ε] are distinct with the same geometric point, so a description only on geometric points would lose the cartesian moduli condition.
- Two rank-d summands failing a chain inclusion compatibility are not a point even though they define a point of the product.
- For the GL₂ equation x₁y₀=π_Fx₀y₁ below, the model map forgetting F₁ has special-fibre P¹ above F₀=[1:0] and a single point above F₀=[0:1], whereas its generic fibre is an isomorphism. It is not smooth. On x₀=y₁=1 the equation is xy=π_F, which is flat with reduced special fibre xy=0; flatness does not require a smooth model forgetful map.

For GL₂ Iwahori and d=1, take F₀=[x₀:y₀] and F₁=[x₁:y₁] in the bases (e₁,e₂) and (e₁,π_Fe₂). The incidence equation is x₁y₀=π_Fx₀y₁. Thus the special fibre has the two projective-line components x₁=0 and y₀=0; on x₀=y₁=1 their intersection has equation x₁y₀=π_F.

For a standard periodic self-dual chain in a symplectic O_F-space of rank 2n with n≥1, define the GSp incidence scheme by the same transition and period equations on rank-n direct summands, with F_(Λ*) the annihilator of F_Λ under the perfect dual-lattice pairing. Prove flatness over O_F for every residue characteristic and equality with the flat closure of the generic Lagrangian Grassmannian. The forgetful map to the GL incidence scheme is a closed immersion. One route realizes the special fibre in the symplectic affine flag, proves reducedness by compatible Schubert splitting, and lifts the generic points of its maximal components (GORSP §2 and Theorem 2.1, pp. 3–4; GORSP line 95 and GORSP line 149; KP §2.3.4, p. 157; KP line 1523).

Its API consists of the following properties:

- Each evaluation is a rank-n locally direct summand, and dual-lattice evaluations are mutual annihilators.
- Transition, periodicity and annihilator conditions commute with base change; the map forgetting annihilators is a closed immersion into the GL chain scheme.
- The incidence scheme is flat and has the prescribed generic Lagrangian Grassmannian, so it equals its schematic generic closure.

**Checks.**

- In rank 2, GSp₂=GL₂ and the line-chain equation remains x₁y₀=π_Fx₀y₁, including at p=2.
- For a single symplectic lattice of rank 4 the model is the Lagrangian Grassmannian of dimension 3, whereas Gr(2,4) has dimension 4; the annihilator condition is essential.
- In the standard symplectic basis e₁,e₂,f₁,f₂, the plane spanned by e₁,f₁ has pairing value 1 and is excluded in every characteristic, including 2; a rank condition alone would admit it.

*Needs:* §1.2; ReductiveGroupsPartII RG2.3; ModularCurves §0G; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; gap:algebraic-loop-representability; gap:algebraic-schubert-normality; gap:algebraic-compatible-schubert-splitting; SchemeAndStackFoundations §§0.8 and 1.1. The route includes the ambient refinement projection, the scheme-theoretic Schubert-intersection realization of X_I and lifting of maximal component generic points.

### 2.6 The tame symplectic lattice-chain embedding

For the KP §2.3.1 symplectic Hodge representation over Q_p with p>2, G tamely split, p∤|π₁(G^der)|, x a building point and the constructed toral building maps ι,s satisfying (2.3.2), the integral fixer maps 𝒢_x↪GSp(𝓛)↪GL(𝓛) are closed and induce M^pol_G↪M^pol_(GSp,z)_(O_E)↪M^pol_(GL,y)_(O_E). The polynomial representation must specialize to the actual lattice chain of ι(x); an arbitrary lattice is not substituted. (KP, Lemma 2.3.3, Proposition 2.3.7, pp. 156–161; KP line 1474).

One proof proceeds as follows. Import the symplectic factorization of the toral building map and the polynomial lift of its integral representation. These require the Satake symplectic classification and projective freeness contracts, recorded as supplier gaps. In the unramified splitting decomposition retain the degree m_j of every centralizer division algebra, every Galois twist and the m_j translated lattice-chain copies; otherwise the source representation and its building point have the wrong dimension. Over the maximal unramified extension verify the neutral-component closure condition (*) in k[[u]]. Apply the PZ criterion and descend closedness and the morphism via flat generic density.

The condition (*) is over k[[u]], not a second generic fibre k((u)).

*Needs:* §1.3; ReductiveGroupsPartII RG2.2; ReductiveGroupsPartII RG2.3; gap:polynomial-closed-immersion-criterion; §2.5; gap:symplectic-toral-factorization; gap:polynomial-representation-descent; gap:polynomial-parahoric-lifts.

### 2.7 Period-total Grassmannian embedding

For lattices Λ_i of a finite determining segment and ranks d_i, the direct-sum map ∏Gr(d_i,Λ_i)→Gr(Σd_i,⊕Λ_i) is a closed immersion. Its image is the locus stable under the summand idempotents with the prescribed component ranks. Composing the chain incidence map with this map and the tame symplectic embedding proves KP Corollary 2.3.16. For the polarized total lattice of KP §2.3.15 retain the index range of 2r−1+a terms, its pairing and duality scalings; the target rank is half the total dimension. No argument changes a non-vertex building point into a hyperspecial vertex by just repeating its representation. (KP, §2.3.15 and Corollary 2.3.16, p. 162; KP line 1755; KPZ, Lemma 2.3.1, p. 12; chain variant after Definition 3.4.4, p. 29; KPZ line 562).

One proof proceeds as follows. Cut out idempotent stability as closed equations; fixed summand ranks select open-and-closed components in that closed locus. Recover each summand by the idempotent image, proving the functorial inverse onto the image. Compose the symplectic, chain-incidence and product embeddings; generic density identifies the composite with the representation-induced map.

Consequently a chain integral Hodge embedding of §0.6 is good if and only if its period-total embedding is good: the total model map is the chain model map followed by the closed immersion above, and a morphism whose composite with a closed immersion is a closed immersion is itself one. For r=2, h=2 and d=1 the closed map is P¹×P¹→Gr(2,4).

For two rank 1 summands of rank 2 lattices the target is Gr(2,Λ₀⊕Λ₁); requiring only total rank 2 admits wrong component ranks.

*Needs:* §2.5; §2.6; §0.6; ModularCurves §0G.

### 2.8 Trace symplectic restriction of scalars

For a finite separable extension K/F, a finite-dimensional K-space V and a nondegenerate alternating K-bilinear form ψ on V, the F-form Ψ((v_i),(w_i))=Tr_(K/F)(Σ_i ψ(v_i,w_i)) on V^r is nondegenerate alternating. It yields the restriction-of-scalars symplectic embedding for the subgroup of the product similitude groups whose multipliers are one common element of F×. Independent K×-multipliers do not preserve a single F-similitude factor. The form assertion permits r=0, when its carrier is the zero space; the faithful restriction-of-scalars group embedding uses r≥1 and dim_K V>0. A symplectic similitude in this assertion includes its multiplier, which is uniquely determined in positive dimension. (KZ, Proposition 3.1.12, p. 21; KZ line 926).

One proof proceeds as follows. Alternation follows by trace linearity. For nonzero v choose w with ψ(v,w)≠0, then scale w using nondegeneracy of the separable trace pairing. The common F-multiplier pulls through the trace; test the absence of that common multiplier on a split product after scalar extension.

For K=F and r=1 recover ψ exactly: on the standard plane Ψ(e₁,e₂)=1. For r=0 or V=0 the form is zero on the zero space and is nondegenerate, but no unique multiplier is determined. For K=F_p(t^(1/p)) over F_p(t), the inseparable field trace is zero, so tracing the standard symplectic plane gives a degenerate zero form. Over a split pair of planes, multipliers 1 and 2 produce diagonal alternating blocks with those two scalars and no common multiplier; this excludes the whole product of independent similitude groups.

*Needs:* `Algebra.trace`; ReductiveGroupsPartII RG2.0a.

### Examples

For a two-lattice GL₂ period and d=1, the total ambient module has rank 4 and the target is Gr(2,4). The product image is P¹×P¹, with component ranks (1,1). The idempotent-stable plane Λ₀⊕0 has ranks (2,0) and is outside that image. For a quaternion centralizer splitting into a rank-2 irreducible, two copies recover dimension 4; a single copy has the wrong dimension (KP §2.3, pp. 158–162; KP line 1755).

### Dependencies

ReductiveGroupsPartII RG2.0a; ReductiveGroupsPartII RG2.2; ReductiveGroupsPartII RG2.3; gap:polynomial-closed-immersion-criterion; gap:polynomial-parahoric-lifts; gap:algebraic-loop-representability; ReductiveGroups §10B, “Induction, Weyl modules and simple heads”; gap:stable-weyl-lattices; SchemeAndStackFoundations §0.28; ModularCurves §0G; SchemeAndStackFoundations §1.1; gap:polynomial-representation-descent; gap:symplectic-toral-factorization; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; gap:algebraic-schubert-normality; gap:algebraic-compatible-schubert-splitting; SchemeAndStackFoundations §§0.8 and 1.1; `Algebra.trace`. The internal section references above give the additional ordering within this layer.

## Layer 3: canonical and weakly normal representatives

### 3.1 The canonical model in the classical abelian-type range

For standard data, split G^ad into factors on which μ^ad is nontrivial and trivial. Apply the auxiliary Hodge-cover construction to the first part and set M^can=M^pol_(𝒢′,μ′)⊗_(O_E′)O_E. This is a flat projective normal scheme with geometrically reduced special fibre, independent up to unique equivariant isomorphism respecting the given diamond comparison of all auxiliary choices, and (M^can)^♦=M^v_(𝒢,μ). Its normal geometric special-fibre components are Cohen–Macaulay. The factors with trivial μ contribute the point; no hypothesis of nontrivial μ is imposed on the final theorem. (KPZ, §3.2.12, (3.2.13), Theorem 3.2.15, p. 20; proof §3.4.2, p. 28; KPZ line 882).

One proof proceeds as follows. Remove the μ-trivial adjoint factors and form the prime-to-p auxiliary closure. The polynomial embedding theorem, proved before this identification, embeds it into the ordinary GL Grassmannian. Invoke the D10 normal-closure recovery theorem using GS0’s closed integral-Grassmannian map and the proved GL case. Apply the imported minuscule central-surjection and connected-level comparisons, then normal full faithfulness, to obtain the canonical model and uniqueness.

The construction has the following properties:

- Give the specified equivariant isomorphism (M^can)^♦≅M^v.
- Any two auxiliary choices have a unique comparison inducing the identity on the generic flag and on M^v.
- The perfected geometric special fibre has the μ-admissible strata in the Witt flag.
- Central lifts and common reflex extensions give the comparison induced by their v-sheaf comparison.

**Checks.**

- Adding an adjoint factor with μ=0 changes neither the nontrivial-factor model nor its dimension. In particular a GL₂ line datum times a μ=0 factor still has dimension 1.
- When G itself is quasi-tame with p∤|π₁(G^der)|, the canonical model agrees with its polynomial closure.
- Let p=3, F′/F a ramified quadratic extension and G=PU₃(F′/F), with Hermitian form x₁x̄₃+x₂x̄₂+x₃x̄₁, minuscule class (1,0,0) and the parahoric fixing O_(F′)³. Here |π₁(G^der)|=3. The reduced polynomial special fibre is the nonnormal two-dimensional quasi-minuscule Schubert variety; the raw polynomial model is nonnormal and its special fibre is nonreduced. Its canonical normal representative therefore differs from the raw model (KPZ Remark 3.2.14, p. 20, KPZ line 891; HLR Example 9.4 and Corollary 9.2(2), pp. 37–38, HLR line 1860 and HLR line 1816).

The proof order is polynomial embeddings → normal recovery → canonical representability.

*Needs:* §1.5; §1.3; §2.4; §1.6; §0.5; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; DiamondsAndVStacksPartII §D10.15.

### 3.2 Integral Hodge maps and normalizations of images

Let (F,G,{μ},𝒢) be a minuscule local model datum of Hodge type with an integral Hodge embedding 𝒢↪GL(Λ), and let M be a normal flat projective O_E-scheme with a specified isomorphism M^♦≅M^v as in §0.5. The scheme map M→Gr(d,Λ)_(O_E) whose diamond is the functoriality map M^v→M^v_(GL(Λ),μ_d) exists and is unique by DiamondsAndVStacksPartII §D10.15(2); its hypothesis M^v_(GL(Λ),μ_d)=Gr(d,Λ)^♦ is §1.6, and its existence needs only that M is proper, flat and normal. This roadmap proves that this map identifies M with the normalization of its schematic image. Goodness is the stronger assertion that this map is a closed immersion. The diagram of geometric special-fibre points with the Witt Grassmannians commutes. For standard data the theorem applies to M=M^can of §3.1; for the acceptable data of §7.7 it applies to the normal model of §7.6; its proof uses neither construction. (KPZ, §3.1.9 and diagram(3.1.10), p. 17; KPZ line 761).

One proof proceeds as follows. Take the scheme map supplied by D10.15(2). Use generic closed immersion, properness and geometric-fibre injectivity to get a finite birational map onto the image. Normality of the source gives the normalization; identify the point map by specialization functoriality.

Normalizing an image is not the same statement as image normality. The theorem does not require the standard range: for p=5, G=G_m×H with H simply connected of trialitarian type D₄ split by a tame cubic extension, V the scalar twist of the Galois-stable sum of the three eight-dimensional minuscule representations and μ(z)=(z,1), the datum is of Hodge type with h=d=24 but outside the standard range; the target Gr(24,Λ) is a point and the normalization map is the identity.

*Needs:* §0.5; §0.6; §1.6; DiamondsAndVStacksPartII §D10.15; DiamondsAndVStacksPartII §D10.12; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; SchemeAndStackFoundations §§0.20–0.21 and 0.30; ModularCurves §0G.

### 3.3 Good embeddings cut out by descent endomorphisms

Assume p>2, G=Res_(K/F)H, p∤|π₁(G^der)|, tamely split classical H without triality, x generic in its facet, no adjoint factor Res_(L/K)PGL_m(D) with p dividing index(D), and the stated faithful minuscule product Hodge representation. Choose x′ with 𝓗_(x′)=𝓗_x and a tame Galois splitting field K̃/K making x′ hyperspecial, as in §2.1. For a Γ-stable Weyl lattice Λ̃ of that hyperspecial model, the restricted integral representation is good. The full fixer, after the specified restriction of structure, is the intersection of the Weil-restricted split group with the centralizers of the Γ-actions t_γ and of multiplications t_a for O_F-algebra generators a of O_K̃. The comparison diagram with the invariant lattice chain (π̃^iΛ̃)^Γ and its total lattice has every arrow closed. (KPZ, Proposition 3.4.6 and Remark 3.4.7, pp. 29–30; KPZ line 1278).

One proof proceeds as follows. Use the integral descent equations to identify the group cutout. Apply the stable Weyl-lattice comparison and the three polynomial closed embeddings. After canonical model identification in Layer 3, transfer these maps through normal full faithfulness. Check each arrow separately, including the Weil-split arrow.

Commuting with Γ alone misses the O_K̃-linearity equations.

*Needs:* §2.2; §2.3; §2.4; §2.7; §0.6; §3.1; gap:stable-weyl-lattices; gap:polynomial-representation-descent.

### 3.4 Algebraic and Witt special-fibre interfaces

For the quasi-tame prime-to-p polynomial model and every dominant bound, the special fibre is the reduced admissible union in the equal-characteristic companion partial affine flag, with Bruhat closure relations (§1.3). For a minuscule bound, and if p=2 assuming in addition that G has no odd unitary factor over the completed maximal unramified extension, identify the perfection of that special fibre with the admissible Witt locus. The identification is the unique equivariant isomorphism of depth-zero perfect Schubert schemes, obtained after passing to the adjoint group. Depth zero means that the positive loop group L⁺𝒢 acts through its quotient by the first congruence subgroup, the perfection of the special fibre 𝒢_k̄ of the parahoric group scheme; 𝒢_k̄ is smooth and connected but in general not reductive, and the action does not factor through its maximal reductive quotient. The isomorphism is equivariant for the identification 𝒢_k̄≅𝒢′_k̄ of the reductions of the Witt parahoric and of its equal-characteristic companion. Compare that map with the reduced v-special-fibre identification supplied by GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”. The resulting square of comparison morphisms commutes over the common residue base. This comparison does not assert equality of the unperfected companion scheme and the perfect Witt scheme, and it makes no perfect-scheme identification for non-minuscule bounds; the general-bound v-special-fibre identification is the separate GS4 theorem. (KZ, §5.2.1, pp. 48–49; KZ line 2120; AGLR, Lemma 3.15, p. 24, AGLR line 1356, and the depth-zero step in the proof of Theorem 3.16, p. 25, AGLR line 1414; AGLR, Theorem 6.16, pp. 39–40; AGLR line 2214).

One proof proceeds as follows. Apply the polynomial reduced-special-fibre theorem to the companion model. For minuscule μ, pass to the adjoint group, check that every translation λ in the admissible set moves each affine root by at most 1, so the admissible locus has depth zero, and apply the depth-zero comparison of perfect Schubert schemes through Demazure resolutions and their Picard groups. Use the imported admissible Witt and v-special-fibre identifications to compare the perfection maps, retaining Frobenius descent.

Keep generic flag, companion special scheme, perfected Witt locus and v-special fibre in different types.

**Checks.**

- For hyperspecial GL₂ and μ=(1,0), the first congruence subgroup acts trivially on the lines of k², so the admissible locus P¹ has depth zero and both sides are the perfected P¹.
- For hyperspecial GL₂ and μ=(2,0), (1+pE₁₂)e₂=e₂+pe₁ does not lie in p²We₁⊕We₂, so the first congruence subgroup moves the point t^(2,0) and the depth is positive; this bound receives no perfect-scheme identification here.
- For μ=0 both sides are the base point.
- At Iwahori level for GL₂ and μ=(1,0), with Λ₀=O²⊃Λ₁=Oe₁⊕π_FOe₂, the first congruence subgroup, the kernel of 𝒢(O_F̆)→𝒢(k̄), lies in 1+π_FM₂(O_F̆) and fixes every line of Λ₀/π_FΛ₀ and of Λ₁/π_FΛ₁, so the depth is zero. The reduction of 1+aE₁₂, a∈k̄, lies in the unipotent radical of 𝒢_k̄, whose maximal reductive quotient is the diagonal torus; it reduces to the identity in the basis (e₁,π_Fe₂) of Λ₁, so it preserves the component on which F₁=[0:1] is fixed, but on that component it moves F₀=[0:1] in Λ₀/π_FΛ₀ to [a:1]. The action therefore factors through 𝒢_k̄ and not through its reductive quotient.

*Needs:* §1.3; §3.1; GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; ReductiveGroupsPartII RG2.4.

### 3.5 General-bound local-model kimberlites

For any connected reductive group over a p-adic field, parahoric level and dominant bound μ, M^v is a flat proper π-adic kimberlite; (M^v,Gr_≤μ) is rich smelted. By GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”, its reduction is the perfectly finite-type admissible locus A_(𝒢,μ) of GS0, §0.37 “Bounded admissible affine flag loci”. Specialization is surjective. Apply the D11 proper-kimberlite criterion and verify its density, formalization of C-valued sections, and spatial generic-fibre hypotheses explicitly. No tangent or minuscule condition is used. (AGLR, Proposition 4.14 and Remark 4.15, pp. 30–31; AGLR line 1701; GLX, §3.2, p. 19; Theorem 3.8, p. 22 (v3); GLX line 749).

One proof proceeds as follows. Use the bounded integral Grassmannian properness and generic density to verify the proper criterion. Formalize geometric generic points by the extension property of bounded modifications. Use GS4’s identification of the reduction for this arbitrary bound; perfect finite type gives the local noetherian and cJ finiteness used for richness.

Specialization onto a nonempty closed stratum is surjective even for a nonminuscule bound.

*Needs:* §0.4; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; DiamondsAndVStacksPartII §D11.19; DiamondsAndVStacksPartII §D11.17; DiamondsAndVStacksPartII §D11.11.

### 3.6 General minuscule weak normal representability

For any connected reductive G over F finite over Q_p, any parahoric 𝒢 and minuscule μ, there is a unique flat projective weakly normal O_E-model M^wn of ℱ_(G,{μ}), with a specified equivariant diamond isomorphism (M^wn)^♦≅M^v. No p≥5, tame or abelian-type restriction is present. This theorem stops at weak normality; Layer 7 proves normality and geometrically reduced special fibre. (AGLR, Theorem 7.22 and proof, pp. 49–50; AGLR line 2776).

One proof proceeds as follows. In the polynomial-lift range compare generic and special fibres and their specialization maps at Iwahori level, using AGLR 7.13,7.19–7.21 and the D11 triple theorem. Descend through the Iwahori-to-parahoric v-cover; compare the actual closed equivalence relations on both sides. For arbitrary G embed into a Weil-restricted split group and take the absolute weak normalization of the flat flag closure in its scheme model. Use the polynomial-lift and weak-normalization supplier contracts for these comparisons.

This intermediate theorem must not use the final tube normality theorem in its proof.

*Needs:* §3.5; §1.6; DiamondsAndVStacksPartII §D11.18; DiamondsAndVStacksPartII §D10.13; SchemeAndStackFoundations §§0.26 and 0.30; gap:finite-weak-normalization; SchemeAndStackFoundations §1.1; ReductiveGroupsPartII RG2.3; gap:polynomial-parahoric-lifts.

### 3.7 The smooth open of maximal admissible orbits

For every connected reductive G over F finite over Q_p, every parahoric 𝒢 and minuscule μ, the weakly normal representative M^wn of §3.6 has an open subscheme M^(wn,∘) that is smooth over O_E, whose geometric special fibre is the union of the maximal admissible orbits and is dense in the geometric special fibre of M^wn. The maximal orbits are those of the translations [λ] for the rational conjugates λ∈W₀·μ over the completed maximal unramified extension F̆. Over O_C, M^(wn,∘) is the union of the charts 𝒢_(O_C)/P⁻_λ, where P⁻_λ is the schematic closure in 𝒢_(O_C) of the repeller parabolic of λ in G_C; P⁻_λ is smooth affine with connected fibres and is the stabilizer of [λ]. The open is a scheme-level statement: smoothness of the perfected maximal strata alone does not provide it. (AGLR, Definition 7.5, Lemma 7.6 and Remark 7.7, p. 43, AGLR line 2395 and AGLR line 2405; AGLR (7.55), p. 51, AGLR line 2848; GL Lemma 1.2, p. 2, GL line 61).

One proof proceeds as follows. Over a finite extension of F̆ splitting G and defining λ, construct P⁻_λ as the flat closure of the repeller parabolic and prove it smooth with connected fibres by decomposing it into flat closures of root groups, each a product of fibres of smooth maps between Weil restrictions of affine lines, together with the torus part; identify its special fibre with the stabilizer of the translation in the affine flag by a dimension count. Form the quotient of the parahoric model by this smooth closed subgroup over the DVR, base change to O_C and glue the charts along schematic gluing maps. The diamond of the union is the open sub-v-sheaf of M^v given by the maximal orbits; full faithfulness of the diamond functor on weakly normal schemes and the identification of the perfected special fibre with the admissible locus identify it with an open subscheme of M^wn and descend it to O_E. Density follows because every irreducible component of the admissible locus is the closure of a maximal orbit.

**Checks.**

- For hyperspecial GL₂ and μ=(1,0), M^wn=P¹_(O_E) is smooth and the open is all of P¹: the special fibre is a single orbit and P⁻_λ is the parabolic subgroup scheme of GL₂ over O_E.
- At Iwahori level for GL₂ and μ=(1,0), the special fibre consists of two P¹ meeting at a point. The two maximal orbits are the complements of that point, and the open is the model minus the node, where the chart xy=π_E is smooth over O_E; the node itself, with special fibre xy=0, is not O_E-smooth and is excluded.
- For a ramified quadratic extension O_E[t]/(t²−π_E), the scheme is normal and finite flat, its perfected special fibre is a smooth point, but its special fibre k[t]/t² is not smooth and it has no O_E-smooth open meeting the special fibre. Thus the assertion is not a consequence of normality together with smoothness of the perfected special fibre.

*Needs:* §3.6; §3.5; GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; ReductiveGroupsPartII RG2.1; ReductiveGroupsPartII RG2.3.1, “Big-cell criteria”; ReductiveGroupsPartII RG2.3.1, “Quotients of group schemes over a DVR”; ReductiveGroupsPartII RG2.4; DiamondsAndVStacksPartII §D10.13; SchemeAndStackFoundations §1.1.

### Examples

For a nodal cubic, normalization is finite and bijective away from the singular point but does not make the image normal. For the cusp Spec k[t²,t³] in characteristic zero, its normalization Spec k[t] is finite, birational and a universal homeomorphism, but the inclusion k[t²,t³]⊂k[t] is not surjective. This is the distinction used by the integral Hodge map: the existence of a closed diamond map does not prove a closed scheme immersion (FHLR Lemma 5.27, p. 34; FHLR line 1540; KPZ line 761).

### Dependencies

GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; DiamondsAndVStacksPartII §D10.15; DiamondsAndVStacksPartII §D10.12; SchemeAndStackFoundations §§0.20–0.21 and 0.30; ModularCurves §0G; gap:stable-weyl-lattices; gap:polynomial-representation-descent; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; DiamondsAndVStacksPartII §D11.19; DiamondsAndVStacksPartII §D11.17; DiamondsAndVStacksPartII §D11.11; DiamondsAndVStacksPartII §D11.18; DiamondsAndVStacksPartII §D10.13; SchemeAndStackFoundations §§0.26 and 0.30; gap:finite-weak-normalization; SchemeAndStackFoundations §1.1; ReductiveGroupsPartII RG2.3; gap:polynomial-parahoric-lifts; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; ReductiveGroupsPartII RG2.1; ReductiveGroupsPartII RG2.3.1, “Big-cell criteria”; ReductiveGroupsPartII RG2.3.1, “Quotients of group schemes over a DVR”; ReductiveGroupsPartII RG2.4. The internal section references above give the additional ordering within this layer.

## Layer 4: formal curves and Schubert tangent spaces

### 4.1 Formal-curve tangent span

For a finite-type k-scheme X and k-point x, let C_(X,x) be the set of pointed k-morphisms γ:Spec k[[a]]→X taking the closed point to x. Define T^cur_x X as the k-submodule of the Zariski tangent space T_xX generated by dγ(∂/∂a) for γ∈C_(X,x). Curve-spanned means T^cur_x X=T_xX. This does not mean every vector is the derivative of one formal curve. Use the native linear span of the actual derivative family; a freely chosen vector family does not specify the geometric span. (KPZ, Definition 4.1.4 and Remark 4.1.5, p. 31; KPZ line 1347).

One proof proceeds as follows. Use the scheme tangent space and the specified tangent functor on pointed morphisms. Generate a submodule by the derivative family; functoriality follows from the tangent chain rule.

The construction has the following properties:

- A vector belongs iff it is a finite k-linear combination of formal-curve derivatives.
- A pointed scheme map sends curve span into curve span by its tangent map.
- A pointed scheme isomorphism identifies curve spans.
- At a smooth rational point, étale coordinates lift coordinate lines and the curve span is the whole tangent space.

**Checks.**

- At 0 of A¹ the curve a↦a gives curve span k.
- At the point of Spec k[ε]/ε² every formal curve kills ε in its pullback to k[[a]], so curve span=0 although the tangent space is one-dimensional.
- For xy=0 at 0, the two axes span k², but no formal curve has derivative (1,1).
- For x²+xyz=0 at 0, the curve span is exactly x=0 inside T₀≅k³.

A union of derivative directions can span a plane without every plane vector lying on a curve.

*Needs:* `Submodule.span`; `TauCeti.AlgebraicGeometry.ZariskiTangentSpace`; gap:pointed-tangent-chain-rule.

### 4.2 Reduced tangent cones and a curve obstruction

For X finite type over k, x rational, every nonzero derivative of a pointed formal curve is a k-point of the reduced tangent cone in T_xX. Thus curve spanning implies that the reduced-cone k-points span T_xX. For X: x²+xyz=0 at the origin, T₀X=k³ and T^cur₀X={x=0}; this X is reduced and reducible, not normal. (KPZ, Remark 4.1.5, p. 31; KPZ line 1350).

One proof proceeds as follows. Substitute the formal curve into every defining equation and take its first nonzero homogeneous term at the derivative. For the example, if (f,g,h) is a curve then f(f+gh)=0 in the domain k[[a]], so f=0 or f=−gh∈(a²). The y- and z-axes show that all of the plane x=0 lies in the span.

The origin has tangent dimension 3 and curve-span dimension 2.

*Needs:* §4.1.

### 4.3 Big-cell tangent coordinates and weights

Let k be algebraically closed of arbitrary characteristic, G split reductive, T⊂B a split pair and λ dominant. At t^λ the map from t^λL⁻⁻G t^(−λ) to Gr_G sending g to gt^λ is an open chart at t^λ. With a Chevalley basis, the tangent is the direct sum over roots α of t^(〈λ,α〉−1)k[t^(−1)]X_α and the Cartan term t^(−1)k[t^(−1)]Lie(T). Rotation×T acts with the corresponding affine-root weights; the tangent of S_μ and its curve span are stable subspaces with these weight decompositions. (KPZ, §4.1.7, p. 32; KPZ line 1371).

One proof proceeds as follows. Import the algebraic loop big-cell chart, not the diamond flag chart of GS0. Differentiate the root subgroup coordinates and torus loop coordinates at the identity and conjugate by t^λ. Use torus diagonalizability to project the curve span onto weights; a projection belongs to a span, not necessarily to a single curve.

The exponent for x_α(t^(−j)a) after translation is 〈λ,α〉−j.

*Needs:* §4.1; gap:algebraic-loop-representability; gap:negative-big-cells; `Derivation.adjointWeightSpace`; ReductiveGroupsPartII RG2.1.

### 4.4 Mod-p abelian cocharacters and minuscule tests

For split classical adjoint-simple root data use Bourbaki labels. A dominant coweight is of mod-p abelian type when: in A it is any sum of dominant minuscule coweights; in B or C it is a nonnegative multiple of the unique minuscule coweight; in D^R it is rω₁∨; in D^H it is sω_(n−1)∨+tω_n∨, r,s,t≥0. For products require this factorwise. The finite minuscule test-weight sets are S_A={all fundamental weights}, S_B={ω_n}, S_C={ω₁}, S_(D^R)={ω_(n−1),ω_n}, S_(D^H)={ω₁,ω_(n−1),ω_n}; tests are on the simply connected derived cover, not necessarily characters of the original adjoint group. (KPZ, Definition 4.1.2, p. 31, KPZ line 1338; proof of Theorem 4.2.3 in §4.2.15, pp. 37–39, KPZ line 1612).

One proof proceeds as follows. Import finite root data, their Bourbaki coordinates and the simply connected weight lattice. Bundle the permitted cocharacter family and type-dependent finite test set. Apply the prime-to-p derived central-isogeny tangent comparison before using test representations unavailable on G itself.

The construction has the following properties:

- The condition is checked on adjoint-simple factors.
- Return the specified finite minuscule weight set on the simply connected cover.
- For ν dominant in the μ-coroot coset, ν≤μ iff 〈μ−ν,ω〉≥0 for every ω∈S.
- The summed embedding-wise cocharacter of an abelian-type reductive restriction-of-scalars datum belongs to this family.

**Checks.**

- In C₂ with coroots α₁∨=e₁−e₂, α₂∨=e₂ and ω₁=e₁, take μ=2ω₂∨=(1,1). For ν=0 the difference (1,1)=α₁∨+2α₂∨ is a nonnegative coroot combination and the ω₁-test is 1. For the dominant ν=(2,0) the difference (−1,1)=−α₁∨ lies in the coroot lattice, the ω₁-test is −1 and ν is rejected, whereas the wrong test weight ω₂=e₁+e₂ gives 0 and would accept it.
- In D₄ take μ=2ω₄∨=(1,1,1,1) and ν=2ω₃∨=(1,1,1,−1), both in the D^H family. The difference 2e₄=α₄∨−α₃∨ has even coordinate sum, so it is in the coroot lattice, and its S_(D^H)-tests against ω₁,ω₃,ω₄ are (0,−1,1): ν is rejected by ω₃. Interchanging the endpoints gives (0,1,−1), rejected by ω₄. The singleton {ω₁}, or either spin weight alone, misses one of the two cases.
- In B₃, μ=(2,0,0), ν=(1,1,0) lie in the same coroot coset: the spin test is (2−1−1)/2=0, and the other fundamental tests are 1 and 0. For μ=(1,0,0), ν=0 all tests are nonnegative but the difference has odd coordinate sum, so it is outside the coroot lattice; inequalities alone do not impose that congruence.

B and C exchange the coweight and weight roles; test the listed spin and standard weights.

*Needs:* §0.3; ReductiveGroupsPartII RG2.1; gap:minuscule-dominance-tests.

### 4.5 Affine-root curves and their tangent interval

For dominant λ≤μ in the integral coroot order set k_α=max{j≥0:(λ−jα∨)^dom≤μ}. For 1≤j≤k_α the polynomial map A¹_k→Gr_G, a↦t^λx_α(t^(−j)a), lies in S_μ, passes through t^λ and has derivative t^(〈λ,α〉−j)X_α. Define Φ^cur_(λ,μ) as these root/exponent pairs. The bound is finite; no factorization using a^(−1) is used at a=0. (KPZ, §4.2.1 and Proposition 4.2.2, pp. 32–33; KPZ line 1404).

One proof proceeds as follows. Use the rank-one root homomorphism and its loop factorization on a≠0 to identify the relative position. The inequality for k_α places every such relative position below μ. Use closedness of S_μ to include 0 and differentiate the explicit formula.

The construction has the following properties:

- The value at 0 is t^λ.
- The derivative at 0 is t^(〈λ,α〉−j)X_α.
- Allowed exponents are exactly 1≤j≤k_α for the curve directions listed here.
- The map factors through S_μ and hence through the formal-curve span after completion at 0.

**Checks.**

- For SL₂ and λ=μ=α∨: j=0,1,2 give λ−jα∨=α∨,0,−α∨ with dominant representatives α∨,0,α∨, all ≤α∨, while j=3 gives 2α∨>μ, so k_α=2; and λ+jα∨≤α∨ forces j=0, so k_(−α)=0. The positive root supplies the two curves j=1,2 with derivatives t¹X_α and t⁰X_α, and the negative root supplies none; a count depending only on 〈λ,α〉, or symmetric in ±α, would be wrong.
- For SL₂, λ=0, μ=α∨, k_α=1 and the derivative is t^(−1)X_α.
- In the same SL₂ example j=2 is outside the allowed interval and the generic relative position exceeds μ.

At j=0 the stated root-direction list does not acquire an extra zero-order tangent.

*Needs:* §4.3; §4.4; gap:algebraic-loop-representability; ReductiveGroupsPartII RG2.1.

### 4.6 Finkelberg–Mirković representation bounds

Let G be split connected reductive over the algebraically closed field k, and for a dominant weight ν∈X^*(T)^+ let V(ν)=Δ(ν)=∇(−w₀ν)* be the Weyl module of ReductiveGroups §10B, where ∇(λ)=Ind_(B⁻)^G k_λ has highest weight λ for the positive Borel B. For an R-point (𝓔,φ) of Gr_G put 𝓔(ν)=𝓔×^G V(ν), and let 𝓔⁰(ν) be the bundle of the trivial torsor. The point lies in S^FM_μ when t^〈μ,−w₀ν〉φ(𝓔(ν))⊂𝓔⁰(ν)⊂t^〈μ,−ν〉φ(𝓔(ν)) inside 𝓔(ν)[1/t] for every dominant ν. Both inclusions are imposed. S^FM_μ is a closed projective subscheme of Gr_G containing S_μ, so T_(t^λ)S_μ⊂T_(t^λ)S^FM_μ. Neither equality of schemes nor reducedness of the FM bound is assumed in characteristic p. The reduction to G^der simply connected is made in the theorems that use the bound. (KPZ, Definition 4.2.6, (4.2.7), Remark 4.2.8, pp. 34–35; KPZ line 1481).

One proof proceeds as follows. Use the Weyl modules Δ(ν) of ReductiveGroups §10B, with their integral lattices and base change, and the associated-bundle functor to translate a modification to lattices. Realize each inclusion as a closed condition in a bounded lattice Grassmannian; a faithful representation bounds the result in a projective piece. Verify the generic Schubert orbit satisfies both inequalities, then use closure.

The construction has the following properties:

- Supply the first inclusion for every dominant ν.
- Supply the second inclusion for every dominant ν.
- S_μ is a closed subfunctor of the FM bound.
- Both lattice inclusions commute with extension of the coefficient k-algebra.

**Checks.**

- For λ=μ the torus point t^μ satisfies both bounds.
- On the neutral component and μ=0 the bounds force every tested lattice to be standard.
- For SL₂ in characteristic p, the degree-p Weyl representation is not freely interchangeable with its contragredient induced module; the construction must retain both original inclusions.

Do not replace Weyl-module duals by Weyl modules of dual highest weight in positive characteristic.

*Needs:* §4.3; ReductiveGroupsPartII RG2.1; ReductiveGroups §10B, “Induction, Weyl modules and simple heads”; gap:algebraic-loop-representability; ModularCurves §0G.

### 4.7 Root tangent equality using minuscule test modules

Assume k algebraically closed of characteristic p, allowing p=2, G split classical, p∤|π₁(G^der)|, μ mod-p abelian and λ dominant with λ≤μ. The root weights of T_(t^λ)S_μ are exactly Φ^cur_(λ,μ), and the same root-weight list occurs in the FM tangent bound. To prove the upper bound it is enough to use the minuscule test set S after reduction to the simply connected derived group: j_α=min{〈μ,ω〉−〈λ,ω′〉: ω∈S, ω′ and ω′+α are weights of V(ω)} equals k_α. Weyl-module duals are never replaced by Weyl modules of the dual highest weight. (KPZ, Theorem 4.2.3, p. 33; Proposition 4.2.10, p. 35; Proposition 4.2.13, Remark 4.2.16, Corollary 4.2.19, pp. 36–39; KPZ line 1427).

One proof proceeds as follows. Use the prime-to-p central-isogeny and product tangent comparisons to reduce to an adjoint-simple root system with simply connected derived group. Differentiate both FM inequalities in minuscule Weyl modules; their root strings have length at most 1 so the relevant Chevalley coefficient is ±1. Apply the specified finite minuscule dominance tests and root-string combinatorics to identify j_α=k_α. Combine with the explicit curve lower bound.

The theorem includes quaternionic D; the exclusion enters only the general Cartan statement.

*Needs:* §4.5; §4.6; §4.4; ReductiveGroupsPartII RG2.1; ReductiveGroups §10B, “Induction, Weyl modules and simple heads”; gap:minuscule-root-coefficients.

### 4.8 Cartan directions from conjugated root curves

In the root tangent theorem’s range, over any positive characteristic, define C^cur_(λ,μ)=⊕_(i≥1)t^(−i)span_k{H_α: α simple, i≤k_(−α)} inside the Cartan loop term. It lies in T^cur_(t^λ)S_μ: conjugate suitable root curves by x_(−α)(1) in the stabilizer and take their rotation×T weight projections. With a fixed Chevalley convention Ad(x_(−α)(1))X_α has a nonzero H_α component; the signs of all three components are not assumed positive. (KPZ, §4.3.1 and (4.3.6), pp. 40–41; KPZ line 1737).

One proof proceeds as follows. Choose negative simple root curves with the stated translation indices. Use the rank-one adjoint identity and stability of the Schubert variety under the relevant positive-loop element. Project to the torus-zero weight in the span of curves to obtain H_α terms.

The construction has the following properties:

- The coefficient of t^(−i) lies in the span of precisely those H_α with i≤k_(−α).
- Its inclusion into the ambient tangent factors through T^cur.
- There is no exponent 0 term in this Cartan space.
- For product root data the construction is the direct sum of the factor spaces.

**Checks.**

- For SL₂, λ=0, μ=α∨, it contains t^(−1)H_α.
- For μ=λ=0 its Cartan part is 0.
- For SL₂, λ=α∨ and μ=2α∨: k_α=3 (j=0,…,3 give dominant representatives α∨,0,α∨,2α∨, all ≤2α∨) and k_(−α)=1 (λ+jα∨≤2α∨ forces j≤1), so C^cur_(λ,μ)=k·t⁻¹H_α, in agreement with the detecting minimum l=min{2−1,2+1}=1 of §4.9; indexing the definition by k_α instead of k_(−α) would wrongly add t⁻²H_α and t⁻³H_α. The identity k_α=〈λ,α〉+k_(−α), obtained by reflecting λ−jα∨ with s_α, shows that the exponents 〈λ,α〉−k for 1≤k≤k_α of the source produce the same negative-exponent list (KPZ §4.3.1, p. 40; KPZ line 1741).

A Chevalley sign change changes a generator by a unit and leaves its span unchanged.

*Needs:* §4.5; §4.7; §4.3.

### 4.9 Cartan tangent upper bounds and equality

Let k be algebraically closed of positive characteristic p, G split classical with p∤|π₁(G^der)|, μ of mod-p abelian type and λ dominant with λ≤μ. Compute on the simply connected derived factors of a z-extension and transport through the central comparison of §4.7. In the no-Dᴴ range allow every p; in the simple Dᴴ endpoint case require p≠2. For nonzero H in the derived Cartan, let D_H^S be the finite set of pairs (ω,ω′) with ω in the dominant minuscule test set S of §4.4, ω′ a weight of V(ω) (equivalently ω′∈Wω), and dω′(H)≠0 in k. Require D_H^S nonempty and define the integer l_H^S as the minimum of 〈μ,ω〉−〈λ,ω′〉 over D_H^S. Differentiating the FM bounds bounds the allowed negative exponent of t^(−i)H by i≤l_H^S. Outside Lie(G^der) the allowed Cartan tangent is 0, by the character bounds. In the derived Cartan, the coefficient calculation yields l_H^S=min{k_(−α): the H_α coefficient of H is nonzero}, whenever there is no D^H factor; the same equality holds for a simple D^H factor if 〈λ,α_(n−1)〉=0 or 〈λ,α_n〉=0. The D^H coefficient argument divides by 2 (KPZ Proposition 4.3.10, Case (2)), so it is not available in characteristic 2. Consequently the Cartan tangent equals C^cur in these ranges. (KPZ, Theorem 4.3.2, Proposition 4.3.4, Lemma 4.3.7 and Propositions 4.3.9–4.3.10, pp. 40–45; KPZ line 1748).

One proof proceeds as follows. Differentiate the representation lattice bounds directly using dω′(H); do not use unrestricted Weyl-dual symmetry. Use central characters to eliminate non-derived Cartan directions. Use the specified classical minuscule weight calculation to find a weight detecting a nonzero coefficient with the minimal k_(−α). In D^H keep the endpoint condition and p≠2, needed for cancellation by 2. Sandwich the actual tangent between the explicit Cartan curve span and the FM upper bound.

The detecting minimum has the following properties (KPZ §4.3.3 and proof of Proposition 4.3.9, pp. 40–42; KPZ line 1761 and KPZ line 1804):

- With D_H^S finite and nonempty, some detecting pair attains l_H^S, and l_H^S is no larger than every candidate value.
- Every candidate value is a nonnegative integer: λ and μ are dominant with λ≤μ, and ω′ is a weight of the highest-weight module V(ω).
- For c∈k×, D_(cH)^S=D_H^S and l_(cH)^S=l_H^S, since dω′(cH)=c·dω′(H).
- At H=0 the detecting set is empty; the helper has no value there and does not impose a bound on the zero tangent vector.

**Checks.**

- For SL₂, S={ω}, weights of V(ω) equal {ω,−ω}, H=H_α, λ=0 and μ=α∨, the two detecting derivatives are 1 and −1, nonzero even at p=2. The integer candidate values are {1,1}, so l_H^S=1; a constant zero helper fails.
- For the same data with λ=μ=α∨, the candidates are {0,2}, so l_H^S=0 and no positive negative-loop exponent is allowed; a constant one helper fails.
- At H=0 both derivatives vanish and D_0^S is empty; assigning its minimum zero would silently extend the helper outside its domain. In rank zero there is likewise no nonzero derived Cartan input.
- Over characteristic 3, replacing H_α by 2H_α changes derivatives (1,−1) to (2,1), keeps both nonzero and leaves the preceding minima 1 and 0 unchanged. Scaling by 0 instead gives the excluded empty detecting set.
- For a Dᴴ detecting coefficient with m=1, −2m is 1 in F₃ and 0 in F₂, so the endpoint argument retains p≠2. There is no all-points D^H Cartan conclusion.

*Needs:* §4.8; §4.6; §4.4; §4.7; ReductiveGroupsPartII RG2.1; ReductiveGroups §10B, “Induction, Weyl modules and simple heads”; gap:minuscule-cartan-coefficients.

### 4.10 Curve-spanning theorem for affine Schubert varieties

Over algebraically closed k of characteristic p, for split classical G with p∤|π₁(G^der)| and μ mod-p abelian, every tangent space of S_μ is spanned by pointed formal curves if there is no D^H factor. In the simple D^H case require p≠2; the conclusion holds at each dominant translation λ≤μ with one terminal simple-root pairing zero, in particular at its minimal stratum. Positive-loop translations extend the conclusions from t^λ to every point in the corresponding stratum. (KPZ, Theorem 4.1.6 and its proof §4.3.15, pp. 31,45; Theorem 4.3.2(2), p. 40; KPZ line 1363).

One proof proceeds as follows. Sum the root and Cartan weight equalities. Use a positive-loop element taking each geometric point to a translation and tangent functoriality. For the minimal D^H stratum verify one terminal pairing vanishes by the finite root calculation.

The surface x²+xyz=0 has two minimal primes, whereas S_μ is an irreducible orbit closure, so it cannot contradict this Schubert theorem. Its ramified Hilbert modular Iwahori interpretation lies outside the reductive integral-level hypothesis of §4.11 (KPZ Remark 4.1.5, p. 31; KPZ line 1354).

*Needs:* §4.7; §4.9; §4.1; gap:algebraic-loop-representability.

### 4.11 Reductive Weil-restriction special fibres

Assume standard data and specifically 𝒢≅Res_(O_K/O_F)𝓗 with 𝓗 reductive over O_K. After an auxiliary prime-to-p cover and splitting, its geometric special fibre is a split affine Schubert variety S_(μ̄) for a classical pair of mod-p abelian type with p∤|π₁(Ḡ^der)|. For each residue embedding φ:k₀→k, μ̄_φ=Σ_(θ:K→F̄ inducing φ)μ_θ. In the corresponding local model all tangent spaces on minimal strata are curve-spanned; all geometric tangent spaces are curve-spanned if there is no D^H factor. This assertion is not made for arbitrary parahoric 𝓗. (KPZ, Lemma 4.4.2 and Theorem 4.4.3, pp. 46–47; KPZ line 2002; LEV, §4.2, pp. 22–26; LEV line 1024).

One proof proceeds as follows. Reduce by central covers and unramified splitting while retaining the reductive integral restriction-of-scalars assumption. Use the convolution description of the split special fibre, its maximal admissible weights and reducedness to identify the image as S_(Σμ_θ). Apply the classical minuscule classification to put μ̄ in the mod-p abelian family; invoke the two Schubert tangent conclusions.

Two ramified embeddings each with μ=(1,0) can produce μ̄=(2,0); the special Schubert bound need not be minuscule.

*Needs:* §3.1; §4.4; §4.10; §1.3; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; gap:algebraic-coherence.

### Examples

At the SL₂ neutral translation in S_(α∨), each root contributes t⁻¹X_α, the Cartan term is t⁻¹H, and the tangent is spanned by those three vectors. For μ=0 all three contributions vanish. In contrast the hypersurface x²+xyz=0 has tangent dimension 3 and curve-span dimension 2. These computations separate a span of curves from the assertion that every tangent vector integrates (KPZ §§4.1–4.3, pp. 31–41; KPZ line 1350, KPZ line 1415, KPZ line 1737).

### Dependencies

`Submodule.span`; `TauCeti.AlgebraicGeometry.ZariskiTangentSpace`; gap:pointed-tangent-chain-rule; gap:algebraic-loop-representability; gap:negative-big-cells; `Derivation.adjointWeightSpace`; ReductiveGroupsPartII RG2.1; gap:minuscule-dominance-tests; ReductiveGroups §10B, “Induction, Weyl modules and simple heads”; ModularCurves §0G; gap:minuscule-root-coefficients; gap:minuscule-cartan-coefficients; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; gap:algebraic-coherence. The internal section references above give the additional ordering within this layer.

## Layer 5: same-residue-field Schubert curves

### 5.1 Frobenius orbit steps and rank-one local groups

For the equal-characteristic companion of a minuscule local abelian-type datum (p>2) at a very special parahoric, identify its Schubert order with the integral positive Σ-coroot order on the actual inertia-coinvariant cocharacter lattice. For distinct Frobenius-fixed dominant λ<μ, import the invariant coroot-step theorem to choose an orbit sum β with λ<λ+β≤μ. Identify this selected orbit with a short relative-root rank-one subgroup, retaining the valued-root normalization, possible multipliable roots, and the unchanged central cocharacter coordinate. The map from the orbit sum on the coroot lattice to the short relative-root subgroup is part of the valued-root comparison; it is not inferred merely from the order inequality. The companion group throughout this layer is that of the auxiliary prime-to-p Hodge cover G′ of §1.5 through which §3.1 builds M^can: the strata of the datum are the orbits of the companion parahoric on M^can_k, which agree with the G^ad-orbits, and p∤|π₁(G′^der)| holds by the construction of §1.5. No condition on π₁(G^der) of the datum itself is imposed. (KZ, §5.2.1 and proof of Proposition 5.2.3, pp. 48–50; KZ line 2120; KZ line 2130).

One proof proceeds as follows. Use the actual root datum and valuation normalization of the companion group. Apply the finite invariant-step theorem; the sum ranges over distinct roots in the orbit, rather than repeating them to the automorphism order. Use the valued-root classification to distinguish SL₂ from standard and nonstandard SU₃ and identify the target translation increment.

The root theorem is existential: an arbitrary orbit sum need not preserve dominance.

*Needs:* §3.4; §3.1; §1.5; RootSystemsPartII §4.3, “The existential orbit-sum step”; RootSystemsPartII §4.4, “Ambient cocharacters, central directions and torsion”; ReductiveGroupsPartII RG2.1; ReductiveGroupsPartII RG2.2.

### 5.2 Split and unitary rank-one Schubert curves

At the rank-one level specified by the preceding adapter, construct a morphism A¹→the partial affine flag taking 0 to its base point and every nonzero geometric parameter to the selected higher translation orbit. In case (1), G_α≅Res_(K/F_q((t)))SL₂ for a finite separable K/F_q((t)) with uniformizer u; use a↦u_−(u^(−1)a). In standard SU₃ use a↦u_−(0,u′^(−1)a), with τ(u′)=−u′ and the root relation τ(c)c+d+τ(d)=0. In the ramified nonstandard SU₃ parahoric SU₃(K)∩sSL₃(O_K′)s^(−1), s=diag(1,1,u′), use a↦u_−(a,−a²/2), requiring p≠2. The loop formulas are polynomial at 0; their higher-cell factorizations use a^(−1) only on G_m. (KZ, Proof of Proposition 5.2.3, Cases 1–3, pp. 50–52; KZ line 2179).

One proof proceeds as follows. Check each root relation over the polynomial parameter ring. Check membership in the appropriate loop group, including the ramified nonstandard lattice stabilizer. Factor over the punctured line using the source’s rank-one matrix identities and the selected orbit normalization.

The construction has the following properties:

- Its value at 0 is the base flag.
- The inverse image of the chosen higher orbit contains G_m.
- The formulas commute with extension of the residue field.
- The two SU₃ formulas satisfy τ(c)c+d+τ(d)=0.

**Checks.**

- For split SL₂ the parameter 1 belongs to the nontrivial next orbit.
- For either unitary formula the parameter 0 gives the identity unipotent.
- The expression −a²/2 does not define this construction over F₂.

The nonstandard formula is not asserted in characteristic 2.

*Needs:* §5.1; ReductiveGroupsPartII RG2.1; gap:algebraic-loop-representability.

### 5.3 Closed rank-one flag comparison

In the rank-one comparison used above, the map from the simply connected rank-one flag factors through the neutral component of the image group flag. Under p∤|π₁(H)| for the semisimple image H, its simply connected central cover identifies that component; the subsequent rank-one inclusion is a proper monomorphism and hence a closed immersion. The condition holds for the companion of the cover G′ of §5.1: the kernel of G_α→G′^der lies in the kernel of G′^sc→G′^der, whose order divides |π₁(G′^der)|, and p∤|π₁(G′^der)| by §1.5. This covers the SU₃ image when p=3. No central-cover identification of the entire disconnected affine flag is asserted. (KZ, Proof of Proposition 5.2.3, p. 50; KZ line 2179; PR, §6.a.1, pp. 24–25; PR line 916).

One proof proceeds as follows. Bound the kernel of the rank-one simply connected group G_α→G′^der by the kernel of G′^sc→G′^der, which has order dividing |π₁(G′^der)|, prime to p by §1.5. Use the central kernel calculation to see that all kernel loops are positive loops. Identify the neutral component using the Kottwitz map. Apply the specified algebraic flag representability, ind-properness and monomorphism criterion for the rank-one subgroup.

For p dividing the central kernel order the argument on nonreduced test rings fails.

*Needs:* §5.1; §1.5; gap:algebraic-loop-representability; gap:prime-to-p-central-components; ReductiveGroupsPartII RG2.3; `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono`.

### 5.4 Rational points lift to positive loops

Let k=F_q and let t^λ∈G(k((t))) represent a k-rational translation in the partial affine flag of the connected very special companion parahoric of §5.1. For y∈(L⁺𝒢·t^λ)(k), there exists g∈𝒢(k[[t]]) with y=g t^λ. Apply Lang to the connected stabilizer 𝒢∩Ad(t^λ)𝒢, using its smooth connected finite jet quotients and compatible pro-unipotent kernels. The translation itself need not lie in 𝒢(k[[t]]). (KZ, Lemma 5.2.5 and proof, p. 52; KZ line 2317).

One proof proceeds as follows. Use the translation-stabilizer-jet contract to obtain the connected smooth intersection in this translation situation. Express the obstruction to a rational orbit lift as a torsor under the stabilizer. Use Lang on finite jets and compatible lifting along the connected unipotent kernels.

For nonzero λ, t^λ can have poles; only the conjugating g is required to be a positive loop.

*Needs:* §5.1; ReductiveGroupsPartII RG2.3; gap:algebraic-loop-representability; gap:translation-stabilizer-jets.

### 5.5 Same-residue-field curve theorem

Assume p>2 and a connected very special equal-characteristic companion level, in the sense of §5.1, for the standard local abelian-type data; no hypothesis on π₁(G^der) is imposed, since the rank-one comparison of §5.3 runs on the companion of the prime-to-p cover G′. Let λ<μ be Frobenius-fixed dominant strata in the integral Σ-coroot order and y∈S_λ(F_q). There is a smooth geometrically connected curve C/F_q, an F_q-point c and a morphism f:C→S_μ with f(c)=y, whose inverse image of a strictly higher stratum is dense open. The field of c and the field of definition of C are exactly F_q. (KZ, Proposition 5.2.3 and proof, pp. 49–52; KZ line 2179).

One proof proceeds as follows. Choose the invariant coroot step and construct its rank-one curve over the appropriate finite residue extension. Evaluate the split or unitary rank-one formula on a single parameter a in A¹_(F_q), embedded as scalar constants in the finite extension K. This defines the A¹ map into the restriction-of-scalars flag directly; no finite-field Bertini step is used. Translate first by t^λ and then by the rational positive-loop lift of y. Take C=A¹_(F_q) and c=0; the explicit double-coset calculation sends G_m into the chosen strictly higher stratum.

This theorem raises the stratum without extending F_q; it does not assert that each tangent vector is the derivative of a curve.

*Needs:* §5.1; §5.2; §5.3; §5.4; ReductiveGroupsPartII RG2.0a.

### Examples

For SL₂ with λ=0 and μ=α∨ over F₃, a↦x_−(t⁻¹a) has value 1 at 0 and lies in the higher orbit on G_m; the rational marked point remains F₃-rational. In the nonstandard SU₃ chart, c=a,d=−a²/2 gives τ(c)c+d+τ(d)=a²−a²/2−a²/2=0. At a=1 in F₃ the three terms are 1,1,1 and sum to 0. In F₂ the denominator 2 vanishes (KZ proof of Proposition 5.2.3, pp. 50–52; KZ line 2218). For G=GL₆/μ₃ with μ the image of (1,0,0,0,0,0) at p=3, a standard datum with G^der=SL₆/μ₃ and |π₁(G^der)|=3 at hyperspecial, hence very special, level, the curve theorem of §5.5 applies: a cover of §1.5 is G′=GL₆ with its standard representation, its companion over F₃((t)) is GL₆, and each rank-one subgroup SL₂ of §5.3 maps injectively into it. The same holds for the rank-one subgroups of SL₆/μ₃ itself, since SL₂∩μ₃=1; a hypothesis p∤|π₁(G^der)| on the datum would have excluded this case although KZ Proposition 5.2.3 covers it.

### Dependencies

RootSystemsPartII §4.3, “The existential orbit-sum step”; RootSystemsPartII §4.4, “Ambient cocharacters, central directions and torsion”; ReductiveGroupsPartII RG2.1; ReductiveGroupsPartII RG2.2; gap:algebraic-loop-representability; gap:prime-to-p-central-components; ReductiveGroupsPartII RG2.3; `AlgebraicGeometry.IsClosedImmersion.iff_isProper_and_mono`; gap:translation-stabilizer-jets; ReductiveGroupsPartII RG2.0a. The internal section references above give the additional ordering within this layer.

## Layer 6: EL and PEL local models

### 6.1 EL and PEL chains of modules

Import the EL/PEL datum (B,V,O_B,𝓛) and its periodic lattice-chain stabilizer. Over a base ring R a chain of type 𝓛 is a functor Λ↦M_Λ of O_B⊗R-modules with transition maps and periodicity isomorphisms θ_b: M_Λ^b≅M_(bΛ), where M_Λ^b has the b-conjugate O_B-action on M_Λ for each normalizing b∈B×, satisfying: locally on Spec R, M_Λ≅Λ⊗R as O_B⊗R-modules; for adjacent Λ′⊂Λ, M_Λ/M_Λ′≅(Λ/Λ′)⊗R locally on Spec R as O_B⊗R-modules; θ_b commutes with the transition maps; and for b∈B×∩O_B normalizing O_B the composite M_Λ^b→M_(bΛ)→M_Λ is multiplication by b. Here a quotient of consecutive modules means the cokernel of the transition map, which need not remain injective after base change. Equal R-ranks of adjacent quotients are not enough. The polarized version includes an invertible R-module L and antisymmetric dualities M_Λ≅Hom_R(M_(Λ*),L) compatible with transition and periodicity. L is part of the data and is not trivialized. In the general PEL theory assume p≠2 and connected generic similitude group; §6.6 has the specified unramified quadratic extension at p=2. (SW, Definitions 21.6.1–21.6.2, p. 199; SW line 7622).

One proof proceeds as follows. Use the periodic lattice-chain index category and its duality. Specify coherent transitions and θ_b, then impose the local module types of each M_Λ and of each adjacent quotient. For PEL data add L-valued dualities with antisymmetry and compatibility.

The construction has the following properties:

- Tensoring R→S transports transitions, θ_b and the invertible polarization line.
- The chosen θ_(bc) agrees with the composite periodicity maps.
- The PEL pairing identifies M_Λ with the L-valued dual of M_(Λ*).
- Λ↦Λ⊗R with its canonical maps is the standard chain.

**Checks.**

- For B=Q_p and one period of a rank-h lattice, the standard chain has rank h.
- Changing a local trivialization of L changes the similitude coordinates but not the polarized chain.
- For B=F and b=π_F in the standard chain, θ_b: Λ⊗R→π_FΛ⊗R sends v to π_Fv; its transition back to Λ⊗R is multiplication by π_F. Modulo π_F, θ_b still identifies the respective lattice bases, while the composite is zero. Independent free modules without this specified periodicity map do not determine an object.
- For F=Q_p, D/F the quaternion division algebra, R an F_(p²)-algebra and adjacent O_D-lattices ΠO_D⊂O_D, the algebra (O_D/Π)⊗_(F_p)R is R×R. The standard quotient has factor ranks (1,1); a quotient with ranks (2,0) has the same total rank 2 but is not of this module type.

A list of free modules without θ_b is not a chain of the required type.

*Needs:* PELModuli M0; gap:ramified-local-pel-data; ReductiveGroupsPartII RG2.2; SchemeAndStackFoundations §1.1.

### 6.2 Chains and integral stabilizer torsors

In the SW §21.6 EL/PEL setup, with the indicated connected generic similitude group and allowed residue characteristics, the automorphism group scheme 𝒢 of the standard (polarized) chain is smooth affine, its identity component is parahoric, and chains of the specified type are étale locally standard. Consequently 𝒢-torsors are equivalent to these chains, including the polarization line. (SW, Theorem 21.6.4, Remark 21.6.5, Corollary 21.6.6 and Remark 21.6.7, pp. 199–200; SW line 7644 and SW line 7668).

One proof proceeds as follows. Use the integral stabilizer theorem and the chain local-standardness assertion of SW Theorem 21.6.4, with its stated EL/PEL hypotheses; extend from nilpotent-p bases by completion and generic-fibre descent. Use the sheaf of isomorphisms from the standard chain to construct the torsor. Recover the chain by associated modules and apply effective descent.

The full stabilizer may be disconnected; its torsors must not be replaced silently by torsors under 𝒢°.

*Needs:* §6.1; ReductiveGroupsPartII RG2.2; ReductiveGroupsPartII RG2.3; SchemeAndStackFoundations §1.1.

### 6.3 The naive EL and PEL quotient model

For minuscule μ with weights 0,1 and reflex field E, define the projective O_E-functor of compatible periodic quotients Λ⊗O_S↠t_Λ, with t_Λ finite locally free, satisfying det(T−a|t_Λ)=det(T−a|V_1) for every a∈O_B. In the polarized case require the composite t_Λ*→Λ*⊗O_S→t_(Λ*) to vanish and c∘μ=id. Impose these identities as the equality Det_(O_B|t_Λ)=Det_(O_B|V_1) of determinant polynomials of PELModuli M0.18 over all bases, including nonreduced ones. This is M^naive; flatness is not part of this definition. (SW, Definition 21.6.8, pp. 200–201; SW line 7685).

One proof proceeds as follows. Use a finite determining segment of the chain and product Grassmannians of quotients. Impose the transition, periodicity, determinant and duality equations as closed conditions. Identify the generic fibre with the flag variety by the weight decomposition.

The construction has the following properties:

- Return each universal quotient and its period compatibility.
- It is a closed subscheme of the finite product of quotient Grassmannians.
- Its generic fibre is the μ-flag variety with the chosen quotient convention.
- The moduli equations commute with base change on O_E-schemes.

**Checks.**

- For B=Q_p and a single lattice it is the quotient Grassmannian of rank d.
- For h=3,d=1 its kernel has rank 2.
- Let K/F be ramified quadratic, V=K², Λ=O_K², and let the quotient have rank 2 at one embedding of K and rank 0 at the other, with reflex field K. On the generic fibre the only quotient is the projection onto the first eigenspace, one point. On the special fibre put A=O_K⊗_(O_F)k_K=k_K[ε]/ε². The A-linear quotients A²→A, (u,v)↦u+cv, c∈k_K, have distinct kernels and satisfy every determinant condition, since multiplication by a₀+a₁ε on A has characteristic polynomial (T−a₀)², equal to that of the generic weight-one space. They form an A¹-family, so this projective naive model has a special fibre of positive dimension over a zero-dimensional generic fibre: it is not flat and is larger than its flat closure.

Checking determinants only at geometric points loses conditions on nilpotent bases.

*Needs:* §6.1; §0.2; ModularCurves §0G; PELModuli M0.18.

### 6.4 The de Rham kernel comparison

For a perfectoid Tate O_E-algebra R and a point of M^naive(R), the kernels M_Λ=ker(Λ⊗B_dR⁺(R)→Λ⊗R→t_Λ) form a chain of the required type. In the polarized case its duality line is ξB_dR⁺(R), with the source pairing and the common-period compatibility. This gives a closed immersion (M^naive)^♦→Gr_(𝒢,Spd O_E), an isomorphism onto the μ-bound on the generic fibre; taking the flat closure inside M^naive realizes the integral local-model v-closure. Here ξ generates the Cartier kernel of B_dR⁺(R)→R; the construction is independent of that choice through its invertible ideal, and uses the integral divisor-ring convention also at characteristic-p untilts. (SW, Proposition 21.6.9 and Corollary 21.6.10, pp. 201–203; SW line 7710).

One proof proceeds as follows. Use that R has projective dimension 1 over B_dR⁺(R) to prove the kernels finite projective. Check transitions and period maps; use Morita equivalence and the determinant ranks for adjacent quotients. Check the modified polarization line and identify the torsor by the chain equivalence. Recover a quotient from a lattice between ξΛ and Λ, proving closedness; use the generic flag calculation and the imported flat-closure comparison.

This does not identify the entire naive model with its flat closure.

*Needs:* §6.3; §6.2; §0.4; DiamondsAndVStacksPartII §D10.14; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”.

### 6.5 The Drinfeld EL local-model comparison

Let F/Q_p be finite, D/F the central division algebra of invariant 1/n, n≥2, V=B=D and 𝓛={Π^iO_D}. Let μ have type (1,0,…,0) at a distinguished embedding and be central with weights all 0 or all 1 at every other embedding, as specified by the RZ17 function r. Then the canonical local model is naturally 𝒢-equivariantly isomorphic to M_Dr⊗_(O_F)O_E, where M_Dr, for an O_F-algebra R, parametrizes O_D⊗_(O_F)R-linear quotients O_D⊗_(O_F)R↠M with M finite projective of R-rank n. The Eisenstein conditions are retained in the RZ17 comparison model. The isomorphism is obtained by adjoint comparison and algebraization, rather than an asserted explicit linear formula. (SW, §21.7, Theorem 21.7.1, Remark 21.7.2 and proof, pp. 203–204; SW line 7813 and SW line 7820; RZ17, §5, Lemma 5.1, Corollaries 5.2, 5.4 and 5.6, Remark 5.7, pp. 18–20; RZ17 line 1014).

**Flat Drinfeld and Eisenstein models.** Before the comparison, prove the geometry of the RZ17 model. Let F^t be the maximal unramified subfield of F, e=[F:F^t], π a uniformizer with Eisenstein polynomial Q over O_(F^t), and φ₀ the distinguished embedding of F, with ψ₀ its restriction to F^t. For an embedding ψ of F^t let A_ψ be the embeddings φ over ψ with r_φ=n, put Q_(A_ψ)(T)=∏_(φ∈A_ψ)(T−φ(π)) and Q₀(T)=T−φ₀(π). Choose an unramified extension F̃/F of degree n inside D, let F̃^t be its maximal unramified subfield, of degree n over F^t, with the n embeddings ψ̃ over each ψ, and put Ẽ=E·F̃^t, finite étale over E; E contains φ₀(F), since φ₀ is the only embedding with r_φ=1, hence contains every ψ(F^t). For an O_Ẽ-algebra R and an O_D-module L finite locally free over R, the idempotents of O_(F̃^t)⊗_(Z_p)O_Ẽ=∏_ψ̃O_Ẽ decompose L=⊕_ψ̃L_ψ̃, and the rank condition (R_r) requires rank L_ψ̃=n|A_ψ|+ε_ψ for every ψ̃, with ε_ψ₀=1 and ε_ψ=0 otherwise, ψ the restriction of ψ̃. For an O_E-scheme S the condition is imposed on the quotient after the finite étale base change S⊗_(O_E)O_Ẽ, where it is open and closed, each L_ψ̃ being finite locally free, and is tested on geometric points; prove that it is independent of the O_Ẽ-algebra structure and of the chosen F̃, a Skolem–Noether conjugation changing the decomposition by an isomorphism of O_D-modules, so that it descends to an open and closed condition on S (RZ17 Definition 3.3 and Remark 3.4, p. 8, RZ17 line 420 and RZ17 line 430). For an O_E-scheme S let M_r(S) be the set of O_D-stable locally direct summands F⊂Λ⊗_(Z_p)O_S whose quotient L satisfies (R_r) and the Eisenstein condition (E_r), which uses only the decomposition L=⊕_ψL_ψ by the embeddings ψ of F^t, available over O_E: (Q₀Q_(A_ψ₀))(ι(π)) vanishes on L_ψ₀, the (n+1)-st exterior power of Q_(A_ψ₀)(ι(π)) on L_ψ₀ vanishes, and Q_(A_ψ)(ι(π)) vanishes on L_ψ for ψ≠ψ₀. Prove that M_r is represented by a projective O_E-scheme whose geometric generic fibre is P^(n−1), the geometric μ-flag; that its geometric special fibre is reduced, with n irreducible components of dimension n−1 and local rings at closed points isomorphic to localizations of k̄[X₁,…,X_n]/(X₁⋯X_n); that M_r is flat over O_E; and that M_r is normal. After every finite extension E′/E, M_r⊗O_(E′) is flat with geometrically reduced special fibre and normal generic fibre, hence normal by the trait criterion of §0.5. The Drinfeld rank function, r_φ₀=1 and r_φ=0 otherwise, has E=F and gives M_Dr (RZ17 Definition 3.3, p. 8, RZ17 line 420; Definition 3.8, p. 10, RZ17 line 572; Lemma 5.1, Corollaries 5.2, 5.4 and 5.6, Lemma 5.5, pp. 19–20, RZ17 line 1014, RZ17 line 1080, RZ17 line 1087, RZ17 line 1093 and RZ17 line 1112).

One proof of these properties proceeds as follows. Representability and projectivity follow because the rank and Eisenstein conditions are closed in a product of Grassmannians. On the generic fibre, decompose by embeddings and use Morita equivalence: the Eisenstein condition forces the trivial summands away from φ₀ and a hyperplane condition at φ₀. On the geometric special fibre, the Eisenstein conditions pin the summands away from ψ₀ and identify the remaining datum with the special fibre of the standard Iwahori local model for GL_n and (1,0,…,0), which is reduced by §2.5; compute its local rings in the standard semistable coordinates. Flatness follows from reducedness, equality of generic and special dimensions n−1, properness and the Z/n-action permuting the special components transitively, which brings every component into the closure of the generic fibre. Normality follows from flatness, regular generic fibre and reduced special fibre.

One proof of the comparison proceeds as follows. Compare the generic adjoint cocharacter and connected level with the Drinfeld datum. Use the kernel comparison and the flat normal Eisenstein model above. Apply integral Grassmannian central comparison, normal-scheme full faithfulness and GAGA to algebraize the isomorphism.

RZ17 Remark 5.7 does not establish regularity or semistability of its general model; neither is used (RZ17 Remark 5.7, p. 20; RZ17 line 1115).

**Checks.**

- For n=2 and the Drinfeld function, E=F and the Eisenstein condition forces ι(π) to act on the quotient through φ₀(π) (RZ17 Remarks 3.9(ii), p. 11, RZ17 line 581): a quotient on which O_F acts through a different embedding is excluded, although it has the same ranks.
- For the Drinfeld function with F=E=Q_p, n=2 and S=Spec F_p: O_(F̃^t)⊗_(Z_p)F_p=F_(p²) is a field, so L admits no decomposition over S itself; over O_Ẽ⊗_(Z_p)F_p=F_(p²) the algebra F_(p²)⊗_(F_p)F_(p²)=F_(p²)×F_(p²) has two idempotents, and the two graded ranks are (1,1) with total rank n=2. A definition reading the decomposition over O_E would have nothing to decompose.
- For n=2 the geometric special fibre has two components P¹ of dimension 1 meeting at one point, where the local ring is k̄[X₁,X₂]/(X₁X₂) localized at (X₁,X₂). For the Drinfeld function, so E=F, M_Dr is the Iwahori GL₂ model of §2.5 and its chart over O_F̆ at the node is xy=π_F: flat, regular, with reduced special fibre, as for the two-lattice line model. For a general rank function the comparison M_r≅M_Dr⊗_(O_F)O_E makes the chart over O_Ĕ xy=π_F with π_F=ϖ_E^e·unit, e=e(E/F): flat and normal with reduced special fibre xy=0, and regular exactly when e=1, since for e≥2 the relation xy−unit·ϖ_E^e lies in the square of the maximal ideal (ϖ_E,x,y) and the node has dimension 2 and embedding dimension 3.
- For F=Q₃(∛3), n=2 and r=(1,2,0) on the three embeddings, the stabilizer of r in the Galois group is trivial, so E=Q₃(∛3,ζ₃), totally ramified of degree 6 over Q₃ and ramified quadratic over F with π_F=ϖ_E²·unit. The chart over O_Ĕ is xy=ϖ_E²·unit: flat with reduced special fibre xy=0 and normal, but not regular. Only normality is claimed after reflex base change (RZ17 Corollary 5.6, RZ17 line 1112; Remark 5.7 leaves semistability open, RZ17 line 1115); the same happens to the Drinfeld model after any ramified extension E′/E.
- For F/Q_p unramified the first and third Eisenstein conditions are empty and the second only bounds the rank of L_φ₀ by n (RZ17 Remarks 3.9(iii), p. 11, RZ17 line 588), so the Eisenstein conditions add nothing beyond the rank condition there; for ramified F they are genuine closed conditions.

*Needs:* §6.4; §3.6; §2.5; §0.5; gap:trait-normality; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; DiamondsAndVStacksPartII §D10.12; SchemeAndStackFoundations §0.8; SchemeAndStackFoundations §§4.7–4.10.

### 6.6 The unitary Drinfeld local-model comparison

Let F/F₀ be quadratic with F₀/Q_p finite, and let V be a nonsplit two-dimensional Hermitian F-space with ψ(v,w)=Tr_(F₀/Q_p)(ϑ_(F₀)^(−1)Tr_(F/F₀)(δ^(−1)〈v,w〉)), where ϑ_(F₀) generates the different of F₀/Q_p and δ is anti-invariant, a unit in the unramified case and a uniformizer in the ramified case. Use the lattice level of SW §21.8: a self-dual chain in the ramified case, and an almost self-dual two-lattice chain in the unramified case. Require p≠2 when F/F₀ is ramified. Use the signature function r_φ+r_(bar φ)=2, r=1 at both embeddings over the distinguished F₀ embedding and r∈{0,2} elsewhere. The actual GL₂ cocharacter at φ is (1 repeated r_φ,0 repeated 2−r_φ), with common similitude multiplier z. Then the canonical local model satisfies Mᶜᵃⁿ≅M_(Dr,F₀,n=2)⊗_(O_(F₀))O_E, naturally and equivariantly. Signature (1,1) does not mean the central GL₂ cocharacter (1,1). (SW, §21.8 and Theorem 21.8.1, pp. 204–206; SW line 7910; KRZ, §1.3, pp. 7–8; §2.1, Definition 2.1.1, p. 10; KRZ line 525).

One proof proceeds as follows. Compute the trace form using an inverse-different generator and an anti-invariant δ; check the prescribed self-dual or almost self-dual level. Translate the signature function to genuine 0/1 weights and identify the adjoint pair with the n=2 Drinfeld datum. Apply the central comparison and proper normal full faithfulness, then algebraize.

The ramified full fixer can have two components; use connected-level invariance explicitly. The p=2 claim is restricted to the unramified quadratic case. In that case the base-changed Drinfeld model is flat with normal generic fibre and geometrically reduced special fibre, hence normal by the trait criterion of §0.5. Adjoint/connected-level comparison identifies its diamond with Mᵛ, so it realizes the canonical representative of §0.5 directly. This argument does not use a KRZ determinant model at p=2 (SW line 7847; SW line 7914).

**Checks.**

- At p=2 with F/F₀ unramified and distinguished signature (1,1), the geometric adjoint flag, over a splitting field, is P¹ (over the reflex field it is its descended form ℱ, a conic) and Mᶜᵃⁿ has the Drinfeld diamond; the ramified p=2 case is excluded by this theorem’s hypotheses.
- The Drinfeld model is regular over O_(F₀), but after a ramified base change a nodal chart can be xy=ϖ_E²: its dimension is 2 and its embedding dimension is 3. It remains normal with reduced special fibre xy=0; regularity of every base change is not asserted.

*Needs:* §6.4; §6.5; §0.5 (p=2 canonical representative); GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; DiamondsAndVStacksPartII §D10.12; ReductiveGroupsPartII RG2.3; SchemeAndStackFoundations §§4.7–4.10.

### Examples

The one-lattice EL model for rank h=3 and quotient rank d=1 has a rank-2 kernel. The corresponding de Rham lattice is ξe₁⊕e₂⊕e₃ for the quotient onto e₁; its determinant modification is ξ. For the unitary distinguished signature (1,1), the actual GL₂ weights are (1,0) at each conjugate embedding and the geometric generic adjoint flag is P¹, with descended form ℱ over the reflex field; weights (1,1) would give a point (SW §§21.6–21.8, pp. 200–206; SW line 7710; SW line 7901; KRZ §2.1, p. 10).

### Dependencies

PELModuli M0; PELModuli M0.18; gap:ramified-local-pel-data; ReductiveGroupsPartII RG2.2; SchemeAndStackFoundations §1.1; ReductiveGroupsPartII RG2.3; ModularCurves §0G; DiamondsAndVStacksPartII §D10.14; GeometricSatakeAndFusion GS0, §0.32 “Integral parahoric ind-properness”; DiamondsAndVStacksPartII §D10.12; gap:trait-normality; SchemeAndStackFoundations §0.8; SchemeAndStackFoundations §§4.7–4.10. The internal section references above give the additional ordering within this layer.

## Layer 7: connected tubes and general normality

### 7.1 Tube components from the lowest nearby-cycle stalk

After base change to Spd O_C with C complete algebraically closed, let d=〈2ρ,μ〉 and use coefficients F_ℓ, ℓ≠p. For a closed geometric point x of A_(𝒢,μ), the tube has finitely many connected components and #π₀(M^v_/x)=dim_(F_ℓ)H^(−d)(RΨ IC_μ)_x. Here IC_μ has lowest cohomology sheaf the constant F_ℓ in degree −d, because generic Schubert bounds are geometrically unibranch at every p (gap:schubert-geometric-unibranchness). (GL, Lemma 5.1 and Theorem 4.7(1), pp. 9–10; GL line 418).

One proof proceeds as follows. Use the unibranch generic Schubert comparison to obtain H^(−d)IC_μ=F_ℓ. Apply the general tube-stalk comparison of D11, retaining its spatiality, finite cohomological dimension and coefficient hypotheses. Identify H⁰ of the tube with locally constant F_ℓ-valued functions and use finite-dimensional constructibility to count components.

A minuscule generic flag has IC=F_ℓ[d], so the formula reduces directly to H⁰ of the tube.

*Needs:* §3.5; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; DiamondsAndVStacksPartII §D11.5; DiamondsAndVStacksPartII D11; gap:general-tube-cohomology; gap:schubert-geometric-unibranchness; gap:central-nearby-cycles-algebraicity.

### 7.2 Two maximal translations above a divisor

For an Iwahori μ-admissible locus over an algebraically closed residue field, at most two distinct maximal translation elements lie above a stratum of codimension 1. This statement uses the maximal translation orbit of the bound μ in inertia coinvariants, with its common Euclidean norm and the affine-reflection action; it is valid for general dominant bounds. (GL, Lemma 3.1, pp. 5–6; GL line 237).

One proof proceeds as follows. Write each covering maximal translation as an affine reflection times the codimension 1 element. Their reflection hyperplanes are parallel, so their translation vectors lie on a line. The maximal vectors have equal length; a line intersects a sphere in at most two points.

This is not a bound of two on the number of maximal translations of the entire admissible set.

*Needs:* GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; ReductiveGroupsPartII RG2.1.

### 7.3 The admissible locus has Serre S₂

At Iwahori level 𝒢=I, the perfected μ-admissible locus A_(I,μ) has a finite-type deperfection satisfying Serre S₂; its codimension ≤1 Bruhat open remains connected in every connected étale neighbourhood. Use the equivalent codimension 1 connectedness criterion for a Bruhat-union Schubert scheme together with the Cohen–Macaulay admissible-locus input gap:algebraic-admissible-cohen-macaulay. That input is used only on a split group G′ over k((t)) with simply connected derived group whose admissible set Adm(μ′) equals Adm(μ) after passing to the adjoint group, as GL Corollary 3.5 does, so it is applied in the prime-to-p range alone; no Cohen–Macaulay input is available for G itself (for PGL₂ at p=2 all but finitely many Schubert varieties of the affine flag variety are neither normal nor S₂, HLR Theorem 1.1, p. 2, HLR line 69). This is an application to admissible loci, not a new general definition of S₂. (GL, Lemma 3.3, Proposition 3.4 and Corollary 3.5, pp. 6–7; GL line 255).

One proof proceeds as follows. Use the canonical-module/local-cohomology criterion that a Schubert union is S₂ exactly when the indicated codimension 1 graph is connected. Transfer the codimension 1 criterion to the split group G′ with the same admissible set, where the admissible union is Frobenius split and Cohen–Macaulay, hence S₂, and transfer the connectedness back. Use étale stability of S₂ and connectedness after removing codimension ≥2. These general commutative-algebra inputs are explicit supplier requests.

Connectedness of the whole admissible set alone is insufficient to give S₂.

*Needs:* GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; SchemeAndStackFoundations §§0.17–0.18; gap:s2ification-connectedness; gap:schubert-geometric-unibranchness; gap:algebraic-admissible-cohen-macaulay; ReductiveGroupsPartII RG2.1; ReductiveGroupsPartII RG2.4.

### 7.4 Extremal Wakimoto stalk bounds

For an Iwahori Wakimoto sheaf J_ν with F_ℓ coefficients, dim H^(−ℓ(t^ν))(J_ν)_x≤1 for every geometric x. For Z_μ=RΨIC_μ, every stalk on a codimension ≤1 stratum of A_(I,μ) has H^(−d)(Z_μ)_x≅F_ℓ. Use only the early perverse t-exactness and Wakimoto-filtration theorem, not the completed fusion or Arkhipov–Bezrukavnikov equivalence. (GL, Theorem 5.3, Lemma 5.4 and Proposition 5.5, pp. 10–11; GL line 440; ALWY, Theorem 4.17 and Corollary 4.19, pp. 33–34; ALWY line 1470).

One proof proceeds as follows. Compare J_ν with its costandard object; kernel and cokernel are perverse on the boundary, so the lowest stalk injects into the constant rank 1 lowest costandard stalk. In codimension 1 only the at-most-two extremal translations contribute to the Wakimoto filtration. Choose the Borel so one is standard and its boundary stalk vanishes. The other extremal weight has multiplicity 1. Generic density and the tube component formula supply the nonzero lower bound.

The coefficient field is F_ℓ; do not use a rational decomposition theorem in this argument.

The lowest costandard stalk needs only geometric unibranchness of the Schubert variety, not normality: for PU₃(F′/F) with F′/F totally ramified quadratic over a 3-adic field and μ=(1,0,0), the quasi-minuscule Schubert variety is not normal because 3 divides #π₁(G^der)=3 (HLR Example 9.4, p. 38; HLR line 1860), yet it is geometrically unibranch and its perfection is normal, so H^(−2)(∇)=F_ℓ at its singular point and the bound 1 holds there. Here ∇ is the costandard sheaf of the quasi-minuscule orbit at that absolutely special level, of dimension 〈2ρ,μ〉=〈(2,0,−2),(1,0,0)〉=2; the example tests the step that geometric unibranchness suffices for the lowest costandard stalk, which GL Lemma 5.4 applies at Iwahori level to the Schubert variety of t^ν, of the same dimension ℓ(t^ν)=2.

*Needs:* §7.1; §7.2; gap:schubert-geometric-unibranchness; gap:central-nearby-cycles-perversity; gap:extremal-wakimoto-filtration; gap:wakimoto-constant-term-multiplicities; gap:algebraic-loop-representability; EtaleDualityAndPerverseSheaves §§2.1–2.3, 2.6–2.10.

### 7.5 Connected tubes for every local-model bound

For any reductive G/F over a p-adic field, parahoric 𝒢 and geometric dominant μ, every geometric tube of M^v is connected. Equivalently its rich smelted pair is topologically normal. There is no tameness, minuscule, classical-type or residue-characteristic restriction. For breve E⊆F′⊆C_p the GLX base-changed local-model pair has the same property. (GL, Theorem 1.3, p. 2; Lemma 5.2 and final proof, pp. 10–11; GL line 78; GLX, Theorem 3.8, p. 22 (arXiv v3); GLX line 886).

One proof proceeds as follows. Reduce to Iwahori level: the bounded map is proper, and its closed image contains the dense generic fibre, so it is surjective. Demazure resolutions show fibres of the admissible projection connected, all containing the minimal coset representative; use the D11 tube-transfer criterion. A disconnected tube gives, by algebraicity of RΨIC and the general comparison, a clopen splitting over a connected étale neighbourhood U. Its codimension ≤1 open W is connected by the Iwahori S₂ theorem of §7.3 and its tubes are connected by the stalk calculation, so all of the tube over W lies in one clopen piece. The other piece yields a nonzero perverse direct summand supported in codimension ≥2 whose degree −d cohomology is nonzero, contradicting the perverse support bound. Use the geometric tube definition to descend the assertion to the GLX intermediate base fields.

The use of algebraicity concerns extending a tube splitting to an étale neighbourhood; the individual tube-stalk formula alone does not suffice.

*Needs:* §7.1; §7.3; §7.4; §3.5; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; DiamondsAndVStacksPartII D11; gap:general-tube-cohomology; gap:connected-fibre-tube-transfer; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; GeometricSatakeAndFusion GS0, §0.38 “Relative-position flag correspondences”; gap:central-nearby-cycles-algebraicity; gap:central-nearby-cycles-perversity; gap:algebraic-demazure-fibres.

### 7.6 General normal minuscule local models

For every connected reductive G/F, F finite over Q_p, parahoric level and minuscule μ, the weakly normal representative is normal, flat and projective over O_E, with geometrically reduced special fibre and generic flag ℱ_(G,{μ}); its diamond is M^v. Work after completing with algebraically closed residue field when applying the D11 normality-via-tubes criterion, then descend. No p≥5 or tame hypothesis is present. Connected-level invariance gives the same normal model for a specified quasiparahoric full fixer with that connected component. Cohen–Macaulayness or Frobenius splitting in all cases is not included in this theorem. (GL, Lemma 1.2, Theorem 1.3 and Corollary 1.4, pp. 2–3; GL line 61; GLX, §3.2, p. 19 (v3); GLX line 749).

One proof proceeds as follows. Base change to a completed strict residue-field extension where the corrected D11 normality criterion applies. Apply connectedness of every geometric tube to get normality; descend by faithful flatness. Normal flat total space gives S₁ for the special fibre, and the O_E-smooth open of §3.7, dense in every geometric special fibre, gives R₀, hence reducedness after every residue extension. Apply proper normal full faithfulness for uniqueness and equivariance.

The statement includes wildly ramified unitary groups at p=2 without asserting the excluded general Cohen–Macaulay claim.

*Needs:* §3.6; §3.7; §7.5; DiamondsAndVStacksPartII §D11.20; DiamondsAndVStacksPartII §D10.12; SchemeAndStackFoundations §§0.8, 0.30 and 4.13; SchemeAndStackFoundations §1.1; gap:fpqc-normality-descent.

### 7.7 Good embeddings for acceptable Hodge data

For p>2, an acceptable Hodge-type datum, p∤|π₁(G^der)|, and an R-smooth centralizer of a maximal breve-F-split torus, there is a good integral Hodge embedding 𝒢̃↪GL(Λ) into a single lattice, where 𝒢̃ is a stabilizer group scheme whose neutral component is the given parahoric 𝒢; the point may be moved within its facet and the representation replaced as in KZ Proposition 3.1.9. The construction may use a finite extension K/F that is not tame. The R-smooth centralizer and prime-to-p assumptions are retained. The closed-immersion assertion uses the wild admissible-locus closedness contract in Exact supplier contracts: normalization of the image alone does not establish goodness. (KZ, Proposition 3.1.9 and Lemma 3.1.10, pp. 19–20; KZ line 874).

One proof proceeds as follows. Use the R-smooth full-fixer embedding contract gap:r-smooth-full-fixer-embeddings. Pass to a field K over which G splits, obtain a good embedding of the Weil-restricted datum by the power-lattice embedding theorem, and restrict scalars. Apply §3.2 to the normal model of §7.6 to obtain the finite scheme map and its identification with the normalization of the schematic image; reserve the closed-immersion conclusion for the next step. Apply gap:wild-admissible-closedness to the canonical deperfected special fibres. For this finite map, the generic-fibre closed immersion makes the cokernel of the local ring map vanish after inverting π_E, and special-fibre surjectivity makes it vanish modulo π_E; Nakayama at special points gives surjectivity everywhere. Compose the resulting closed immersion with the good embedding of the Weil-restricted split datum.

No p≥5 restriction is introduced, and no R-smoothness assumption is discarded. A finite universal homeomorphism onto the image need not be a closed immersion: the finite map to the Grassmannian is a closed immersion exactly when its schematic image is normal. Here the map has already been identified with the normalization of that image (§3.2; FHLR Lemma 5.27, p. 34, FHLR line 1540).

*Needs:* §0.3; §0.6; §2.4; ReductiveGroupsPartII RG2.3; §7.6; §3.2; DiamondsAndVStacksPartII §D10.15; gap:r-smooth-full-fixer-embeddings; gap:wild-admissible-closedness.

### 7.8 Admissibility as a lattice membership test

Assume p>2, the acceptable KZ Hodge datum, a good integral Hodge embedding with full fixer equal to its connected parahoric, and use the KZ inverse-cocharacter convention. For each g∈G(˘F), the class of ρ(g) in GL(˘F)/GL(O_˘F) belongs to the embedded geometric special model if and only if the parahoric double coset of g is μ-admissible. When π_FΛ⊂π_Fρ(g)Λ⊂Λ, its Grassmannian representative is π_Fρ(g)Λ/π_FΛ. For arbitrary g outside these lattice bounds, Grassmannian membership is false; one must not take an undefined reduction as a Grassmannian point. Under our weight-one convention transport μ by inversion and use the corresponding opposite flag. (KZ, Proposition 3.1.14, pp. 21–22; KZ line 948).

One proof proceeds as follows. Use the good closed embedding to test special-fibre membership in the ordinary Grassmannian. The normal model of §7.6 has diamond M^v, so the perfection of its geometric special fibre is the reduction of the kimberlite M^v (DiamondsAndVStacksPartII §D11.4), which GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”, identifies with the admissible locus A_(𝒢,μ) of GS0, §0.37 “Bounded admissible affine flag loci”; its geometric points are the cosets g𝒢(O_F̆) with g in a μ-admissible double coset. GS4, §4.18 “Functoriality of integral local models”, identifies the special-fibre map induced by ρ with the lattice-point map g↦ρ(g); this is the route of the cited proof through the v-special-fibre identification (KZ line 952; AGLR Theorem 6.16, AGLR line 2214). Use equality of full and connected fixers to identify precisely the same double cosets on both sides. The datum is acceptable but not necessarily quasi-tame, so no polynomial companion model and no comparison of §3.4 enters.

Removing the connected-fixer hypothesis changes the orbit indexing and requires a different statement.

**Checks.**

- For GL₂, μ=(1,0) at hyperspecial level in the inverse convention, g=diag(π_F⁻¹,1) satisfies π_FΛ⊂π_FgΛ=Oe₁⊕π_FOe₂⊂Λ, and π_FgΛ/π_FΛ is the line k·e₁: an admissible point of the special fibre P¹, as is the Weyl conjugate diag(1,π_F⁻¹) with the line k·e₂.
- For g=diag(π_F⁻²,1), π_FgΛ=π_F⁻¹Oe₁⊕π_FOe₂ is not contained in Λ: its double coset is that of the bound (2,0), outside Adm((1,0)), and there is no quotient π_FgΛ/π_FΛ to test; both membership statements are false together.
- For μ=0, Adm(0) is the trivial double coset: g passes exactly when ρ(g)∈GL(Λ⊗O_F̆), that is π_Fρ(g)Λ=π_FΛ, the unique point of the special fibre Spec k̄.

*Needs:* §0.6; §7.6; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS4, §4.18 “Functoriality of integral local models”; GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; DiamondsAndVStacksPartII §D11.4; ReductiveGroupsPartII RG2.4.

### Examples

For the zero bound, the model is Spd O_E and the geometric tube is a point: both its component count and the lowest nearby-cycle stalk dimension are 1. For the GL₂ line model the smooth tube is an open disc, again with component count 1; at the Iwahori node the smoothing xy=π has an annular geometric tube, also connected. At the node, the reduced special fibre has dimension and depth 1, so it satisfies S₂ (GL Lemma 5.1 and Theorem 1.3, pp. 2,10; GL line 78 and GL line 418).

### Dependencies

GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS4, §4.18 “Functoriality of integral local models”; DiamondsAndVStacksPartII §D11.4; DiamondsAndVStacksPartII §D11.5; DiamondsAndVStacksPartII D11; gap:general-tube-cohomology; gap:schubert-geometric-unibranchness; gap:central-nearby-cycles-algebraicity; GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; ReductiveGroupsPartII RG2.1; ReductiveGroupsPartII RG2.4; SchemeAndStackFoundations §§0.17–0.18; gap:s2ification-connectedness; gap:algebraic-admissible-cohen-macaulay; gap:central-nearby-cycles-perversity; gap:extremal-wakimoto-filtration; gap:wakimoto-constant-term-multiplicities; gap:algebraic-loop-representability; EtaleDualityAndPerverseSheaves §§2.1–2.3, 2.6–2.10; gap:connected-fibre-tube-transfer; GeometricSatakeAndFusion GS0, §0.29 “Equal-characteristic Schubert models and coefficient comparison”; GeometricSatakeAndFusion GS0, §0.38 “Relative-position flag correspondences”; gap:algebraic-demazure-fibres; DiamondsAndVStacksPartII §D11.20; DiamondsAndVStacksPartII §D10.12; SchemeAndStackFoundations §§0.8, 0.30 and 4.13; SchemeAndStackFoundations §1.1; gap:fpqc-normality-descent; ReductiveGroupsPartII RG2.3; DiamondsAndVStacksPartII §D10.15; gap:r-smooth-full-fixer-embeddings; gap:wild-admissible-closedness. The internal section references above give the additional ordering within this layer.

## Layer 8: nearby cycles and central test functions

### 8.1 Local-model nearby cycles and monodromy

For every connected reductive G/F with F finite over Q_p, parahoric 𝒢, dominant bound μ and ℓ≠p, use the bounded v-sheaf nearby cycles of IC_μ supplied by GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”. When μ is minuscule, use §7.6's normal scheme model and its scheme nearby cycles; ClassicalAdicEtaleCohomology §4.5a and the D11 algebraic nearby-cycle comparison identify the two. The generic flag is smooth of dimension d=〈2ρ,μ〉 and IC_μ=Q_ℓ[d](d/2). For a general μ, retain IC_μ on Gr_≤μ rather than substituting a constant sheaf on a scheme model (AGLR §1.1, pp. 3–5, AGLR line 121 and AGLR line 153; Lemma 8.1, p. 52).

The monodromy theorem has its own hypotheses: in the tame Pappas–Zhu polynomial-model range, inertia of a splitting extension acts unipotently, and at a very special vertex it acts trivially. This concerns splitting-field inertia, not necessarily full reflex-field inertia (PZ Theorem 9.9, Lemma 9.11 and Proposition 9.12, pp. 73–74 (v4), PZ line 3005; KP §4.7.2 and Corollary 4.7.3, p. 212, KP line 3693).

One proof of the monodromy assertion passes to a splitting extension and Iwahori level, using proper pushforward compatibility with the unipotent decomposition. Split Schubert IC cohomology has trivial splitting-field inertia. The rational central-sheaf and faithful-cohomology inputs eliminate the non-unipotent summand; at a very special vertex faithfulness eliminates the remaining inertia action.

**Checks.**

- For μ=0, d=0 and the generic IC is Q_ℓ in degree 0; nearby cycles at its single point have dimension 1.
- For the hyperspecial GL₂ line model, d=1 and smooth nearby cycles of Q_ℓ have trivial inertia; at q=9 normalized IC has alternating trace −1/3.
- A nontrivial unipotent two-dimensional inertia block has N²=0 and N≠0, so unipotence alone does not imply triviality.

*Needs:* §0.4; §7.6 (minuscule scheme comparison); GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; LefschetzPencilsAndVanishingCycles LPV.0, LPV.1 and §§6.1–6.2; ClassicalAdicEtaleCohomology §4.5a; gap:general-tube-cohomology; gap:semisimple-proper-pushforward; §§1.2–1.3 (tame monodromy); gap:rational-central-nearby-cycles (tame monodromy); gap:very-special-faithful-cohomology (tame monodromy).

### 8.2 The local-model semisimple trace function

For a finite unramified extension E_r/E, put q=|k_(E_r)|, let F_r/F be the maximal unramified subextension of E_r/F in the fixed algebraic closure, and put P_r=𝒢(O_(F_r)). Choose coefficients containing q^(1/2), and extend them to Q̄_ℓ when parametrizing irreducible representations. Define τ_q(x)=Σ_i(−1)^i Tr^ss(Fr_q,H^i(RΨIC_μ)_x), extended by zero from the admissible locus to G(F_r)/P_r. This is a compactly supported P_r-bi-invariant function with vol(P_r)=1. Semisimple trace means the sum of Frobenius traces on inertia invariants of admissible graded pieces, as in LefschetzPencilsAndVanishingCycles §1.10; it is independent of the filtration. For minuscule μ also define the unshifted constant-sheaf function φ_q, so τ_q=(−1)^d q^(−d/2)φ_q (AGLR §1.1, pp. 3–5, AGLR line 121; Lemmas 8.1–8.2, p. 52, AGLR line 2940; PZ §9.d.1–9.d.2, pp. 74–75 (v4), PZ line 3064; KP (4.7.7) in §4.7.4 and §4.7.8, p. 213, KP line 3722).

One proof applies the imported additive semisimple trace to the constructible equivariant nearby cycles. The finite admissible bound gives finite double-coset support. Proper pushforward becomes the finite-fibre sum with Frobenius action on the fibre cohomology. For minuscule bounds, the scheme comparison and the IC shift and twist give the formula for φ_q. In the tame companion range with minuscule μ, transport the function along the companion double-coset identification of PZ §9.d and the minuscule comparison of §3.4; the mixed-characteristic definition does not require that range.

The construction has the following properties:

- Every inertia-admissible filtration gives the same τ_q, by the imported semisimple-trace refinement theorem.
- An equivariant distinguished triangle gives the additive identity of functions, by the imported triangle identity.
- For a proper equivariant morphism, the trace of its pushforward is computed on the cohomology of the geometric fibres, with Frobenius; at rational points this is the usual rational-fibre-point trace sum.
- For minuscule generic dimension d, τ_q=(−1)^d q^(−d/2)φ_q.

**Checks.**

- For μ=0, both τ_q and φ_q are the unit characteristic function of P_r.
- For the hyperspecial GL₂ line model, φ_q=1 on its support and d=1 gives τ_q=−q^(−1/2).
- A two-dimensional nontrivial unipotent inertia block with Frobenius eigenvalues q^(−1),1 and N(e₂)=e₁ has semisimple trace 1+q^(−1), whereas raw inertia invariants have trace q^(−1).

*Needs:* §8.1; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; LefschetzPencilsAndVanishingCycles §1.10, “The semisimple trace of Frobenius”; gap:semisimple-proper-pushforward; SmoothRepresentationsOfLocalGroups SR.1; §3.4 (tame companion interpretation, minuscule μ); gap:companion-hecke-comparison (tame companion interpretation).

### 8.3 Centrality at every parahoric level

For every connected reductive G/F, every parahoric 𝒢, every dominant μ and every residue characteristic, τ_q belongs to Z(H(G(F_r),P_r)); for minuscule μ the same holds for φ_q. More precisely, for a lift Φ of geometric Frobenius define κ_Φ=(−1)^d Σ_i(−1)^i Tr(Φ,H^i(RΨIC_μ)_x), extended by zero. Each κ_Φ is central. This uses ordinary traces for a fixed lift; averaging over lifts gives the semisimple function κ_q^ss=(−1)^d τ_q. No trivial-inertia hypothesis is needed (AGLR Theorem 1.3, pp. 3–5, AGLR line 129 and AGLR line 141; Lemma 8.2, p. 52, AGLR line 2948; semisimple-trace consequence, AGLR line 136 and AGLR line 161).

One proof applies the sheaf-function dictionary to the central nearby-cycle convolution isomorphism and uses the proper-pushforward trace identity. Averaging preserves centrality. For minuscule μ, scalar conversion from normalized IC to the constant sheaf preserves centrality, with the scheme comparison of §8.1.

**Checks.**

- For μ=0, κ_Φ=τ_q=φ_q=1_(P_r), a central identity.
- In the tame PZ range, transporting φ_q to the companion recovers PZ Theorem 9.14 and KP §4.7.8 (PZ line 3100; KP line 3733).
- For d=1 and q=9 on the smooth GL₂ support, τ_q=−1/3, κ_q^ss=1/3 and φ_q=1; the factor (−1)^d cannot be dropped from κ_q^ss=(−1)^d τ_q.

*Needs:* §8.2; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; SmoothRepresentationsOfLocalGroups SR.1; gap:rational-central-nearby-cycles.

### 8.4 Satake-parameter characterization and Bernstein normalization

At the generality of §8.3, let V_μ be the algebraic representation of the reflex-field L-group with highest weight μ and the pinned Weil action. For each lift Φ let z_Φ be the parahoric central function acting on every smooth irreducible P_r-spherical representation π by trace(s_Φ(π)|V_μ), where s_Φ(π) is its Satake parameter. Then κ_Φ=z_Φ. Put z_(μ,q)^ss equal to the Frobenius-lift average of z_Φ; the semisimple identities are τ_q=(−1)^d z_(μ,q)^ss and, for minuscule μ, φ_q=q^(d/2)z_(μ,q)^ss. The representation and its inertia action are retained in taking this average; the scalar for a single lift is not silently identified with its inertia average. The statements hold for arbitrary G, including non-quasi-split inner forms, arbitrary μ and all p (AGLR Theorem 1.3, pp. 3–5, AGLR line 141; Theorem 8.3, p. 52, AGLR line 2963; Lemma 8.4, pp. 53–54, AGLR line 3020).

One proof uses the injective constant-term map to a minimal Levi on centers, compatible with nearby cycles and restriction of L-group representations; by additivity reduce to representations irreducible on the dual group extended by inertia before using single-point support. Inner-form transfer reduces the anisotropic-mod-center case to its quasi-split inner form. The torus case is the cohomological trace of V_μ. Lemma 8.4 supplies reflex-field induction and finite unramified base change; averaging gives the semisimple version. These representation-theoretic inputs are gap:parahoric-satake-central-functions, gap:centre-constant-term-injectivity and gap:inner-form-central-support; the unramified normalization uses gap:parahoric-level-change and gap:unramified-bernstein-spherical, and the tame companion interpretation uses gap:companion-hecke-comparison, independent of this local-model identity (AGLR Theorem 8.3, proof pp. 53–54, AGLR line 2972 and AGLR line 3003).

**Checks.**

- For unramified G and minuscule μ, the normalized Bernstein-to-spherical image of z_(μ,q)^ss is q^(−d/2)1_(K t^μ K); φ_q has image 1_(K t^μ K). Each level has volume 1 in its own Hecke convention, with the normalized idempotent conversion (PZ Proposition 9.15 and Theorem 9.16, pp. 75–76, PZ line 3132; KP Theorem 4.7.11, pp. 214–215, KP line 3750).
- For hyperspecial GL₂, μ=(1,0), q=9, this image is 1/3, φ_q=1 and τ_q=−1/3 on the supporting double coset.
- For μ=0, V_0 is the trivial line and trace(s_Φ(π)|V_0)=1 for every π. Thus z_Φ=z_(0,q)^ss=1_(P_r), including at non-hyperspecial levels.

*Needs:* §8.3; §8.1; GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS4 §4.14 “Canonical pinned dual identification” and §4.16 “Normalized integral Satake equivalence”; ReductiveGroupsPartII RG2.5; SmoothRepresentationsOfLocalGroups §SR.4.1; gap:parahoric-satake-central-functions; gap:centre-constant-term-injectivity; gap:inner-form-central-support; gap:parahoric-level-change; gap:unramified-bernstein-spherical; gap:companion-hecke-comparison.

### Examples

For q=9 and the hyperspecial GL₂ line bound, φ=1, d=1 and τ=−1/3. The spherical image of z^ss is 1/3 times the double-coset characteristic function, and q^(d/2)z^ss has image 1. For μ=0 all functions are the identity idempotent. A two-dimensional unipotent inertia block with eigenvalues (1/9,1) has semisimple trace 10/9 and raw-invariant trace 1/9. These are computations with the conventions of PZ §9.d, pp. 74–76, and the signed trace of AGLR (8.6), AGLR line 2940.

### Dependencies

GeometricSatakeAndFusion GS4, §4.17 “Integral local models and admissible special fibres”; GeometricSatakeAndFusion GS0, §0.37 “Bounded admissible affine flag loci”; LefschetzPencilsAndVanishingCycles LPV.0, LPV.1 and §§6.1–6.2; ClassicalAdicEtaleCohomology §4.5a; gap:general-tube-cohomology; gap:semisimple-proper-pushforward; gap:rational-central-nearby-cycles (tame monodromy); gap:very-special-faithful-cohomology (tame monodromy); LefschetzPencilsAndVanishingCycles §1.10, “The semisimple trace of Frobenius”; SmoothRepresentationsOfLocalGroups SR.1; gap:companion-hecke-comparison (tame companion interpretation); gap:rational-central-nearby-cycles; GeometricSatakeAndFusion GS4 §4.14 “Canonical pinned dual identification” and §4.16 “Normalized integral Satake equivalence”; ReductiveGroupsPartII RG2.5; SmoothRepresentationsOfLocalGroups §SR.4.1; gap:parahoric-satake-central-functions; gap:centre-constant-term-injectivity; gap:inner-form-central-support; gap:parahoric-level-change; gap:unramified-bernstein-spherical; gap:companion-hecke-comparison. The internal section references above give the additional ordering within this layer.

## Downstream consumers

Integral Hodge embeddings and the curve-spanning theorems supply the tensor and deformation arguments for very-good embeddings and integral Shimura models in the continuation of ShimuraVarieties. The same-residue-field curve theorem supplies specialization paths for Kottwitz–Rapoport strata and arithmetic Frobenius applications. The EL and PEL comparisons supply integral local Shimura geometry with the specified connected-level comparison. General normal minuscule models and connected tubes supply integral Hecke and local-shtuka spaces; the central test function supplies their local trace calculations. Those applications consume the contracts and hypotheses proved here; none is an input to these layers.

## Worked examples

**The two-lattice line model.** Let Λ₀=Oe₁⊕Oe₂ and Λ₁=Oe₁⊕πOe₂. For lines [a:b] in Λ₀ and [c:d] in Λ₁, inclusion Λ₁→Λ₀ has matrix diag(1,π), and πΛ₀→Λ₁ has matrix diag(π,1). The two chain conditions are the same equation πad−bc=0. In the special fibre this is bc=0, the union of two projective lines meeting at ([1:0],[0:1]). On the chart ac≠0 the generic fibre has d/c=b/(πa) and is the diagonal P¹ after the lattice identifications. On the chart a=d=1 at the intersection, the local equation is bc=π: modulo π the tangent has dimension 2, while the total space has the expected regular semistable node. Direct sum gives a rank-2 subspace in rank 4. This verifies the rank and incidence conventions of §§0.6, 2.5, 2.7 and 6.1–6.4 (KP §2.3.4, p. 157; KP line 1523; SW Definitions 21.6.1 and 21.6.8, pp. 199–201; SW line 7622 and SW line 7685).

**A curve-span obstruction on a reduced surface.** In k[x,y,z]/(x²+xyz), the two minimal primes are (x) and (x+yz), so the origin is not normal. Substituting a pointed formal curve (f,g,h) gives f(f+gh)=0 in the domain k[[a]]. Hence f=0 or f=−gh; because g,h vanish at 0, the coefficient of a in f is 0. The y and z axes give the other two coordinate vectors. Thus the full tangent is k³, the derivative span is the plane x=0 and its dimension is 2. The tangent cone is x²=0 and its reduction is the same plane. No assertion that this surface is a local-model fibre is needed (KPZ Remark 4.1.5, p. 31; KPZ line 1350).

**Orbit sums preserve the integral budget.** In D₄ with central node 2, let θ=α₁+2α₂+α₃+α₄, λ=2ρ and μ=λ+θ. Under triality the three roots in the orbit of α₁+α₂ are individually bounded by θ, but their sum has coefficient 3 on α₂, exceeding θ's coefficient 2. The invariant step is chosen existentially; the fixed highest root θ itself uses coefficients (1,2,1,1), so λ+θ=μ. Apply this calculation in the coroot system for §5.1. It preserves the central coordinate and cannot be replaced by adding arbitrary individually valid inequalities (KZ proof of Proposition 5.2.3, pp. 49–50; KZ line 2197; RootSystemsPartII §§4.3–4.4).

**Trace, normalization and the residue characteristic.** On the smooth GL₂ line model over a residue field with q=9, the two-term complex 0→ℚ_ℓ→0 placed in degree −1 and half-twisted has geometric-Frobenius eigenvalue 1/3 and alternating trace −1/3. The unshifted constant sheaf has trace 1; multiplying by (−1)q^(−1/2) gives −1/3. The Bernstein element has spherical image 1/3, and q^(1/2)z has image 1. The residue characteristic p=3 causes no denominator problem in ℚ_ℓ with ℓ≠3. Replacing the exponent by +1/2 gives −3 and fails this equality (PZ (9.9), Theorem 9.16, pp. 75–76; PZ line 3118 and PZ line 3132; KP Theorem 4.7.11, pp. 214–215).

## References

- **KPZ.** Mark Kisin, Georgios Pappas and Rong Zhou. *Integral models of Shimura varieties with parahoric level structure, II*. Forum of Mathematics, Pi 14 (2026), e14, pp. 1–89; published numbering. Legal text: [KPZ](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/6C2640CC5856BDF975AF97EE30CA7906/S2050508626100316a.pdf/div-class-title-integral-models-of-shimura-varieties-with-parahoric-level-structure-ii-div.pdf). The section citations and line locators refer to this version.
- **KP.** Mark Kisin and George Pappas. *Integral models of Shimura varieties with parahoric level structure*. Publications Mathématiques de l’IHÉS 128 (2018), pp. 121–218; published numbering. Legal text: [KP](https://www.numdam.org/item/10.1007/s10240-018-0100-0.pdf). The section citations and line locators refer to this version.
- **KZ.** Mark Kisin and Rong Zhou. *Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties*. Revised 63-page author version, l-indep_v2; its numbering is used throughout. Legal text: [KZ](https://www.dpmms.cam.ac.uk/~rz240/l-indep_v2.pdf). The section citations and line locators refer to this version.
- **SW.** Peter Scholze and Jared Weinstein. *Berkeley Lectures on p-adic Geometry*. Author book version dated 27 March 2020; printed page numbers. Legal text: [SW](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf). The section citations and line locators refer to this version.
- **GLX.** Ian Gleason, Dong Gyu Lim and Yujie Xu. *The connected components of affine Deligne–Lusztig varieties*. arXiv:2208.07195v3, pp. 1–56; version-specific numbering. Legal text: [GLX](https://arxiv.org/pdf/2208.07195v3). The section citations and line locators refer to this version.
- **AGLR.** Johannes Anschütz, Ian Gleason, João Lourenço and Timo Richarz. *On the p-adic theory of local models*. arXiv:2201.01234v2, dated 3 February 2026; printed pages follow the six contents pages. Legal text: [AGLR](https://arxiv.org/pdf/2201.01234v2). The section citations and line locators refer to this version.
- **GL.** Ian Gleason and João Lourenço. *Tubular neighborhoods of local models*. 13-page author version of the article in Duke Mathematical Journal 173 (2024), pp. 723–743; author-page numbering. Legal text: [GL](https://rastrel.github.io/Lourenco/tubengbhd.pdf). The section citations and line locators refer to this version.
- **ALWY.** Johannes Anschütz, João Lourenço, Zhiyou Wu and Jize Yu. *Gaitsgory’s central functor and the Arkhipov–Bezrukavnikov equivalence in mixed characteristic*. arXiv:2311.04043v5; version-specific numbering. Legal text: [ALWY](https://arxiv.org/pdf/2311.04043). The section citations and line locators refer to this version.
- **PZ.** George Pappas and Xinwen Zhu. *Local models of Shimura varieties and a conjecture of Kottwitz*. arXiv:1110.5588v4; its §9 corresponds to §10 of the published article. Legal text: [PZ](https://arxiv.org/pdf/1110.5588v4). The section citations and line locators refer to this version.
- **LEV.** Brandon Levin. *Local models for Weil-restricted groups*. arXiv:1412.7135v2; Theorem 4.2.10 is 4.2.11 in published numbering. Legal text: [LEV](https://arxiv.org/pdf/1412.7135). The section citations and line locators refer to this version.
- **PR.** George Pappas and Michael Rapoport. *Twisted loop groups and their affine flag varieties*. arXiv:math/0607130v2; version-specific numbering. Legal text: [PR](https://arxiv.org/pdf/math/0607130). The section citations and line locators refer to this version.
- **PRLSV.** George Pappas and Michael Rapoport. *On integral local Shimura varieties*. Author preprint, Proposition 7.2.1; only the generic cover construction is used. Legal text: [PRLSV](https://www.math.uni-bonn.de/people/rapoport/myalggeom/preprints/pappas-rapoport-intLSV.pdf). The section citations and line locators refer to this version.
- **FHLR.** Najmuddin Fakhruddin, Thomas Haines, João Lourenço and Timo Richarz. *Singularities of local models*. Lemma 5.27, p. 34; finite universal homeomorphism onto the image. Legal text: [FHLR](https://www.math.univ-paris13.fr/~lourenco/singlocmodels.pdf). The section citations and line locators refer to this version.
- **RZ17.** Michael Rapoport and Thomas Zink. *On the Drinfeld moduli problem of p-divisible groups*. arXiv:1408.4071v2, §5; version-specific numbering. Legal text: [RZ17](https://arxiv.org/pdf/1408.4071). The section citations and line locators refer to this version.
- **KRZ.** Stephen Kudla, Michael Rapoport and Thomas Zink. *On the p-adic uniformization of unitary Shimura curves*. arXiv:2007.05211v2, §§1.3 and 2.1; the signature convention. Legal text: [KRZ](https://arxiv.org/pdf/2007.05211). The section citations and line locators refer to this version.
- **HLR.** Thomas Haines, João Lourenço and Timo Richarz. *On the normality of Schubert varieties: Remaining cases in positive characteristic*. arXiv:1806.11001v5; Theorem 1.1, p. 2; Proposition 3.4, p. 11; Corollary 9.2 and Example 9.4, pp. 37–38. Legal text: [HLR](https://arxiv.org/pdf/1806.11001v5). The section citations use this version.

- **GORGL.** Ulrich Görtz. *On the flatness of models of certain Shimura varieties of PEL-type*. arXiv:math/9912064v1, §4.1 and Theorem 4.5.3 / Corollary 4.5.4, pp. 22, 37; numbering of this version. Legal text: [GORGL](https://arxiv.org/pdf/math/9912064v1).
- **GORSP.** Ulrich Görtz. *On the flatness of local models for the symplectic group*. arXiv:math/0011202v1, §2 and Theorem 2.1, pp. 3–4; numbering of this version. Legal text: [GORSP](https://arxiv.org/pdf/math/0011202v1).
- **HAI14.** Thomas Haines. *The stable Bernstein center and test functions for Shimura varieties*. arXiv:1304.6293v3, Theorem 11.10.1, §11.11 and Proposition 11.12.6, pp. 44–48; numbering of this version. Legal text: [HAI14](https://arxiv.org/pdf/1304.6293v3).
- **HAI15.** Thomas Haines. *On Satake parameters for representations with parahoric fixed vectors*. arXiv:1402.3812v3, Theorem 1.1 and Definition 9.1, pp. 1, 19–20; numbering of this version. Legal text: [HAI15](https://arxiv.org/pdf/1402.3812v3).
- **GLE22.** Ian Gleason. *Specialization maps for Scholze’s category of diamonds*. arXiv:2012.05483v4, Lemma 5.26, p. 45; numbering of this version. Legal text: [GLE22](https://arxiv.org/pdf/2012.05483v4).
