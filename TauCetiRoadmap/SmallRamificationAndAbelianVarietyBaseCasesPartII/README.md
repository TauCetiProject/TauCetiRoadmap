# Roadmap: small ramification and abelian-variety base cases, part II — low-degree Hodge vanishing

**Summary.** Extend SmallRamificationAndAbelianVarietyBaseCases from its discriminant and finite-flat obstructions to Fontaine’s higher-weight torsion ramification theorem, the ordered cyclotomic filtration of global seven-adic crystalline representations, and low-degree Hodge vanishing. For every smooth proper rational scheme X with independent proper smooth scheme models over W(F̄ₚ) at every rational prime p, prove Hʲ(X, Ωⁱ)=0 whenever i≠j and i+j≤3. Deduce that a geometric K3 surface over ℚ has a prime without such a model. The local argument works over every absolutely unramified complete mixed-characteristic discretely valued field with perfect residue field and every integral weight interval 0<r<p−1; the global argument uses seven to reach the geometric theorem, whose hypothesis includes two.

## Scope and ownership

This roadmap owns the filtered valuation truncation and its solution argument specific to Fontaine’s higher-weight killed-p theorem; the global category cut out by crystallinity in weights [0,3] at seven; the ordered cyclotomic steps and their finite and rational exhaustiveness; the application of purity to the full low-degree cohomology action; and the local-model Hodge obstruction and its K3 application. The base roadmap SmallRamificationAndAbelianVarietyBaseCases, §§1.1–1.9, 2 and 3, stops at discriminant estimates, finite-flat representation obstructions and abelian-variety nonexistence. Its explicit-formula and degree-bound theory is consumed here, including §1.9’s rows (b) rd<6.93⇒degree≤10, (d) and (f).

General Fontaine–Laffaille categories, torsion functors, safe-range lattice equivalence and generic ramification criteria belong to FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.4–R07.3.17 and R07.6.2–R07.6.5. Ramification theory over a field complete for a discrete valuation with arbitrary perfect residue field, in Serre’s numbering, belongs to PadicPeriodRings §0.3. The ramification bound retained here differs from its finite-flat bound by allowing all weights 0≤i≤r<p−1 for killed-p crystalline subquotients. Rational periods, Hodge–Tate signs and proper smooth comparison belong to PadicHodgeTheory §§0, 3 and 8.1. Étale coefficients, proper/smooth base change, trait inertia, stable lattices and rational realizations belong to EtaleCohomologyFoundations §§F.2, F.3a and F.4. General scheme base change, spreading and completion belong to SchemeAndStackFoundations §§0.9, 0.11 and 4.8. Continuous representation operations, restrictions and global unramifiedness belong to ArithmeticGaloisRepresentations §§1.1–1.3, 1.6, 1.9 and 2.2. No parallel carriers for those objects are introduced.

The abstract representation, invariant submodule, inverse-image submodule, Witt-vector, fraction-field and scheme-morphism constructions are already in the library; their exact modules and declarations are specified below. The native relative differential sheaf, sheaf exterior powers, Zariski cohomology and nonzero fixed vectors of characteristic-p p-group representations are also library objects. The general differential-form definition is stated by K3SurfacesAndSymplecticBoundedness §1.1; the acceptance test uses its native expression without another declaration. The invariant-space specialization of a character step uses Mathlib’s invariant submodule directly.

K3SurfacesAndSymplecticBoundedness §§1.1–1.4 and 2.4 own the shared unpolarized K3 predicate, field-extension comparison, projectivity and Hodge-number calculation. Its predicate asks for smooth relative dimension two, properness, geometric integrality, trivial canonical line and H¹(O)=0; projectivity is a theorem. Section 4.1 below applies that supplier calculation to ℚ rather than proving a second K3 Hodge theorem. CrystallineCohomology §CR.3.5, “Computations and tests”, owns the Hodge cohomology of projective space; §4.3 below uses that formula as a worked example. DeligneWeightsAndPurity §§0.8–0.9 and 7.15 own characteristic-polynomial weights and proper smooth purity. LocalFieldsRamification Layers 2–3 own inertia, tame conjugation, Herbrand theory and differents over local fields with finite residue field. EllipticCurves Layer 4 owns the elliptic reduction criteria used in §0.1.

EnriquesSurfacesAndIntegralNonexistence §§3.3–3.11 and 3.13 own canonical covers, twists, projective local scheme models and their generic-fibre matching. That roadmap states the low-degree Hodge obstruction as a supplier contract whose content is the ℤₚ-model form §3.3 and the K3 form §4.2 here. Its constructions supply no input to this roadmap.

## Conventions

All schemes are small native schemes in a fixed universe, with the acceptance test using `Scheme.{0}` and an explicit structure morphism to `Spec` ℚ. Smooth and proper includes finite type: `IsProper` includes locally finite type and universal closedness supplies quasi-compactness. No projectivity, nonemptiness, equidimensionality or geometric connectedness is imposed on the Hodge theorem. Empty schemes and disjoint unions are included. Hʲ(X, Ωⁱ) means Zariski cohomology of the i-th sheaf exterior power of the relative Kähler differential sheaf, with its base-field module structure; hⁱʲ is its finite dimension. In Lean vanishing is `Subsingleton`, so a dimension-zero assertion cannot accidentally hold for an infinite-dimensional space.

Locally p is prime, k is a perfect characteristic-p field, O(K)=W(k), K=Frac W(k), and v₀(p)=1, with v₀(0)=+∞. Every algebraic extension is inside a fixed algebraic closure with the extended valuation unless an intrinsic embedding statement is made. A uniformizer in a finite extension of absolute ramification index e has value 1/e. The integer r satisfies 0<r<p−1; p−1 is positive and r/(p−1)<1. The weight-zero case is supplied separately; the positive range at two is empty. The period ideal uses v₀>r/(p−1); the approximate-map ideal uses v₀≥m. At p=3,r=1, an element of value 1/2 survives the first quotient and an element of value m dies in the second.

Divided Frobenius on the truncation uses xᵖ/(−p)ⁱ, with valuation at least zero on Filⁱ. Frobenius on W(k) is σ. At p=3,r=1 and π²=−3, φ₁([π])=[π], whereas division by +3 gives −[π]. This normalization is compared explicitly with the imported period functor; it is not a change to the supplier’s convention.

Serre upper numbering and Fontaine shifted upper numbering differ by one on the ramified range. For a nontrivial tame extension, Serre’s last upper break is 0 and Fontaine’s is 1. For a ramified kernel field write u for the shifted last break and ι for the largest normalized lower displacement; v₀(𝔇)=u−ι with ι>0. An unramified extension has v₀(𝔇)=0 and is handled separately. For ℚ₃(ζ₃)/ℚ₃ the normalized different is 1/2=1−1/2. Ramification theory over arbitrary perfect residue fields is taken on the complete-DVR domain of the supplier PadicPeriodRings §0.3, not inferred from finite residue fields.

Use HT(χₚ)=+1, and geometric Frobenius F(q)=arithmetic Frobenius⁻¹. Thus χ₇(F(q))=q⁻¹. H²(ℙ¹)=ℚ₇(−1) has Frobenius q and Hodge–Tate weight −1, whereas its dual has Frobenius q⁻¹ and weight +1. The notation “pure weight −m” on dual degree-m cohomology means complex absolute value q^(−m/2), with multiplicities. In extensions 0→𝔽₇(j)→U→𝔽₇(i)→0, j labels the subobject and i the quotient. The exception is precisely (i,j)=(0,3). The filtration is constructed in order 3,2,1,0; reversing it on the distinct-character nonsplit extension of §2.2 leaves only its χ³-line instead of exhausting U.

## Exact supplier contracts

### From Mathlib

Use `Representation` in `Mathlib/RepresentationTheory/Basic.lean` and `Representation.invariants` and `Representation.mem_invariants` in `Mathlib/RepresentationTheory/Invariants.lean`; the first is an algebraic monoid homomorphism to linear endomorphisms and has no continuity field. Use `Submodule.comap` in `Mathlib/Algebra/Module/Submodule/Map.lean` for inverse images, and `Module.finrank` in `Mathlib/LinearAlgebra/Dimension/Finrank.lean` only together with finite-dimensionality. Use `NumberField.rootDiscr` and `NumberField.rootDiscr_rat` in `Mathlib/NumberTheory/NumberField/Discriminant/Basic.lean`; the ℚ value is 1. Use `NumberField.finrank_eq_one_of_unramified` in `Mathlib/NumberTheory/NumberField/ExistsRamified.lean`: a number field whose ring of integers is an unramified ℤ-algebra has degree one over ℚ. This is Minkowski’s theorem that ℚ has no nontrivial extension unramified at every finite prime; `Algebra.unramified_iff_forall` in `Mathlib/RingTheory/Unramified/Locus.lean` passes from unramifiedness at every prime of the ring of integers to that hypothesis. It is applied to the kernel fields of §§2.3 and 2.6, whose unramifiedness at each finite prime is the kernel-field interpretation of ArithmeticGaloisRepresentations §2.2.

Use `WittVector`, `WittVector.isDiscreteValuationRing`, `WittVector.isAdicCompleteIdealSpanP`, `WittVector.p_nonzero` and `FractionRing` from `Mathlib/RingTheory/WittVector/Basic.lean`, `DiscreteValuationRing.lean`, `Complete.lean`, `Identities.lean` and `Mathlib/RingTheory/Localization/FractionRing.lean`. With perfect characteristic-p k these give the native complete unramified Witt DVR and its fraction field. The rational structure map in §0.1 is quantified as a unital ring map ℚ→Frac W(F̄ₚ); such a map is unique, so this records the scalar extension without a choice of rational-algebra instance. Use `AlgebraicClosure` and `ZMod` for F̄ₚ. For the unramified step of §1.6 use `IsAdicComplete.henselianRing` in `Mathlib/RingTheory/Henselian.lean` (an adically complete ring is henselian at its ideal), `Algebra.Etale` in `Mathlib/RingTheory/Etale/Basic.lean`, `StandardEtalePresentation` in `Mathlib/RingTheory/Etale/StandardEtale.lean`, and the fundamental identity `Ideal.sum_ramification_inertia_eq_finrank` in `Mathlib/RingTheory/RamificationInertia/Basic.lean`, which assumes a finite flat extension of a domain.

Use `AlgebraicGeometry.Scheme`, `AlgebraicGeometry.Smooth`, `AlgebraicGeometry.IsProper`, `AlgebraicGeometry.Scheme.Over`, `AlgebraicGeometry.Spec` and `CategoryTheory.Limits.pullback` for the model predicates. Their modules are `Mathlib/AlgebraicGeometry/Scheme.lean`, `Morphisms/Smooth.lean`, `Morphisms/Proper.lean`, `Over.lean`, `Spec.lean` and `Mathlib/CategoryTheory/Limits/Shapes/Pullback/HasPullback.lean`. Base change of properness and smoothness along an arbitrary morphism is the `MorphismProperty.IsStableUnderBaseChange` instance for `IsProper` in `Morphisms/Proper.lean` and for `Smooth` in `Morphisms/Smooth.lean`. The two generic-fibre projections are compared over the same fraction-field spectrum, not merely by an abstract isomorphism of schemes.

### From Tau Ceti

Use `AlgebraicGeometry.Scheme.relativeDifferentials` in `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean`, `SheafOfModules.exteriorPower` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower/Basic.lean`, and `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`. Relative differentials use the specified `Scheme.Over` structure; exterior powers are sheaf exterior powers, not exterior powers of global sections. Cohomology is the underlying additive group of Zariski sheaf cohomology. Its base-field action is `AlgebraicGeometry.Scheme.Modules.cohomologyBaseModule` in `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean`; finite-dimensionality is a separate geometric theorem.

Use `Representation.invariants_ne_bot_of_isPGroup` in `TauCeti/RepresentationTheory/Unipotent/PowerOrder.lean` for a nonzero finite-dimensional representation over a field of exponential characteristic p. For a normal p-subgroup its invariant space is stable under the whole group; simplicity then makes that space the whole representation.

The sign calibration `TauCeti.Hodge.tate_piece`, in `TauCeti/Geometry/Hodge/Tate/Basic.lean`, puts the only nonzero abstract Tate Hodge piece of ℤ(m) at index −m. It does not identify a scheme’s Hodge cohomology. In degree two of ℙ¹, m=−1 therefore gives Hodge index 1, agreeing with the geometric convention.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §0.9 for spreading of simultaneous finite presentation, properness and smoothness to ℤ[1/N]; §0.11 for descent of properness and smoothness along field extensions and for global functions after a field extension; §2.6 for quasi-coherent cohomology and its flat base change; §§4.8–4.10 for formal completion and comparison on a given proper scheme; §2.20 for the canonical-line/differential identification on a smooth surface; §0.12 (`exists_etale_lift`) and §0.14 (`henselian_pair_permanence`, `henselian_finiteEtale_equivalence`) for unique lifting of sections of étale algebras over henselian pairs, with no hypothesis on the residue field, used for the unramified step of §1.6. In particular spread the original X/ℚ, independently of its Witt models. The resulting finite-field fibres exist at every q∤N.

### From TauCetiRoadmap.EtaleCohomologyFoundations

Consume §§F.2.1–F.2.2 for proper and smooth finite-coefficient base change, §F.3a for the henselian-trait inertia sequence, and §§F.4.1–F.4.6 for normalized adic realization, finite-dimensional rational cohomology and its continuous Galois action. Use prime-to-residue-characteristic coefficients in the smooth proper unramifiedness argument. Section F.4.0 supplies the compact-group stable-lattice theorem and its integral model, used through ArithmeticGaloisRepresentations §1.6.

### From TauCetiRoadmap.PadicHodgeTheory

Consume §§0.1, 0.4 and 3.2–3.5 for the complete unramified period-field domain, normalized weights, crystalline objects, duals, Hodge–Tate fixed spaces, and detection of crystallinity by completed maximal unramified base change. Section 8.1 supplies proper smooth rational de Rham and crystalline comparison over finite p-adic base fields. The application at Frac W(F̄ₚ) needs the following domain extension, without descent of a scheme model.

What PadicHodgeTheory must provide (the Witt proper smooth comparison contract): For every perfect characteristic-p field k and proper smooth W(k)-scheme, supply rational crystalline comparison for its generic fibre, compatible with completion and the proper smooth de Rham/Hodge–Tate comparison, including k=F̄ₚ.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

Consume §§R07.3.4–R07.3.5 for the filtered Frobenius and finite-length categories and strict exactness; §§R07.3.7–R07.3.12 for the contravariant torsion functor, exactness, full faithfulness, safe-range subquotient closure and tame weights; §§R07.3.13–R07.3.17 for strongly divisible lattices and their correspondence with stable lattices. The normalization is D=D_cris(V∨), HT(χ)=+1. Section R07.6.2 supplies Fontaine’s shifted numbering, the invariants u and ι, and the different identity v₀(𝔇)=u−ι, on the Serre-numbering contract of PadicPeriodRings §0.3 that it consumes. Section R07.6.3 gives the approximate-map predicate Pₘ and the inequality Pₘ⇒u<m+1/e. Section R07.6.5’s finite-flat ramification theorem retains its own domain.

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (the killed-p A_cris truncation contract): For prime p, perfect characteristic-p k, K=Frac W(k) and 0<r<p−1, supply the killed-p A_cris realization: the explicit divided-power presentation of A_cris/p over O(K̄)/p with its filtration and divided Frobenius maps φᵢ for 0≤i≤r (Fontaine93 §3.1), and its identification with the existing contravariant torsion functor Uₛ on the objects of MFₜₒᵣ[0,r] killed by p.

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (the weight-zero unramified contract): For prime p, perfect characteristic-p k and K=Frac W(k), inertia in G(K) acts trivially on Uₛ(M) for every M∈MFₜₒᵣ[0,0] of arbitrary finite p-power length.

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (the rank-one inertia character contract): For prime p, perfect characteristic-p k, K=Frac W(k), n≥1 and integers 0≤i≤r<p−1, the inertia character of Uₛ(M) is χₚⁱ modulo pⁿ for every rank-one W(k)/pⁿ object M∈MFₜₒᵣ[0,r] with unique filtration weight i; its full G(K) character may have an unramified twist.

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (the oriented mod-p splitting contract): For prime p, perfect characteristic-p k, K=Frac W(k) and integers 0≤j<i≤r<p−1, every exact sequence 0→𝔽ₚ(j)→U→𝔽ₚ(i)→0 with pU=0 and U in the local Fontaine–Laffaille essential image on [0,r] splits as a G(K)-module sequence.

What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (the refined approximate-embedding contract): For every finite Galois L/K over a complete mixed-characteristic DVR with perfect residue field and every real c>0, Pₘ(L/K) for all real m>c implies Fontaine’s shifted upper break u(L/K)≤c, including the refinement removing the 1/e loss in §R07.6.3.

The last export is the generic criterion used in Fontaine93 §3.8, not an inference that taking m down to c alone removes 1/e. The new work in §1.6 proves Pₘ for this specific higher-weight period field. The generic approximate-embedding theorem and its refinement enter through this supplier contract.

### From TauCetiRoadmap.PadicPeriodRings

Consume §0.3, ramification over a field complete for a discrete valuation with perfect residue field and no finiteness of that field: Serre’s lower numbering and lower index, the different formula as the sum of the lower indices, the Herbrand function and its inverse, the upper numbering, Herbrand’s quotient theorem, tower transitivity and the absolute upper filtration of the absolute Galois group as an inverse limit. It is used for K=Frac W(k) with k perfect and for the finite Galois kernel fields of Layer 1. FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.2 consumes the same contract to define Fontaine’s shifted numbering, so u, ι and v₀(𝔇)=u−ι are taken from §R07.6.2 on the same domain. For ℚ₃(ζ₃)/ℚ₃ the contract gives G₀=G of order two and G₁=1, lower index 1 in the valuation of L, Serre break 0 and different exponent 1 in that valuation; §R07.6.2 then gives u=1, ι=1/2 and v₀(𝔇)=1−1/2=1/2, the value used in §1.7.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Consume §§1.1–1.3 for continuous representations, restrictions, duals, tensors and Tate twists; §§1.6 and 1.9 for integral models and reductions; §2.2 for global unramifiedness and its finite-image kernel-field interpretation. The torsion input also uses the following extension on the same carriers.

What ArithmeticGaloisRepresentations must provide (the finite torsion kernel-field contract): For a field K of characteristic zero and a finite abelian p-group U with continuous G(K)-action, kernel H and kernel field L=K̄^H: L/K is finite Galois and, for every algebraic E/K inside K̄, G(E) fixes U pointwise iff L⊆E; the kernel field of U⊕U′ is the compositum of the two kernel fields; and the kernel field of 𝔽₇(1) over ℚ is ℚ(ζ₇), of degree 6, with Galois group (ℤ/7)ˣ acting through χ₇ modulo 7.

### From TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

Consume §§1.1, 1.7 and 1.9: local-to-global normalized differents, the unconditional totally complex Poitou–Odlyzko inequality, and its sufficient numerical rows rd<19.02⇒degree≤287, rd<5.72⇒degree≤8 and degree≥36⇒rd>12. These apply to actual totally complex number fields, not arbitrary positive real inputs.

Section 1.9, row (b) gives [F:ℚ]≤10 for every totally complex F with rd(F)<6.93. It reaches the tame fields of §2.4 as follows. If F/ℚ is Galois, unramified outside 7 and tamely ramified at 7 with inertia order e and residue degree f, the local-to-global different formula of §1.1 gives rd(F)=7^(1−1/e). The tame character embeds inertia into the residue units of order 7^f−1 (LocalFieldsRamification Layer 3), so e divides 7^f−1; with ef≤[F:ℚ]≤287 this gives e≤6 when f=1 and e≤143 when f≥2. Hence rd(F)≤7^(142/143)≈6.9054<6.93 and [F:ℚ]≤10. For fields containing ℚ(ζ₇), divisibility of the degree by six then forces degree six.

### From TauCetiRoadmap.LocalFieldsRamification

Consume Layer 3’s lower/upper filtrations, quotient embeddings, the injective tame character θ₀ from G₀/G₁ into the residue units, tame-conjugation formula, tame different d=e−1, Hilbert formula and different-in-towers theorem. These are used over ℚ₇ only. Layer 2 treats finite extensions of local fields with finite residue field; apart from the completed unramified inertia contract below, it is not used for the arbitrary perfect residue fields of Layer 1, whose unramified lifting comes from SchemeAndStackFoundations §§0.12 and 0.14 and whose Herbrand theory comes from PadicPeriodRings §0.3. The action formula is θᵦ(στσ⁻¹)=θ₀(σ)ᵇθᵦ(τ), with σ in inertia; for a mod-seven extension of weight difference a it gives b≡a mod 6. The generator of tame inertia acts on the wild line by the same χᵃ as the representation, with source and target the nonzero b-th lower ramification quotient. For θ₀(t)=3 and θᵦ(w)=1 in 𝔽₇, the conjugated values for b=1,2 are 3 and 2; an inverse tame character would give 5 and 4.

What LocalFieldsRamification must provide (the completed unramified inertia contract): For each p identify the absolute Galois group of Frac W(F̄ₚ) with inertia in G_ℚₚ under the completed maximal unramified field comparison, compatibly with restriction of finite and rational étale representations.

### From TauCetiRoadmap.DeligneWeightsAndPurity

Consume §§0.8–0.9 for characteristic-polynomial multiplicativity and purity of invariant subquotients, with multiplicities and without semisimplicity. Section 7.15 supplies weight-m purity of Hᵐ of every proper smooth finite-field scheme, including nonprojective schemes; duals have weight −m. Its geometric Frobenius on χ is q⁻¹, so the two-term pair χ⁰⊕χ¹ has eigenvalues 1,q⁻¹ and weights 0,−2. It is not pure of a single weight for q≥2.

### From TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness

Consume §§1.1–1.4 and 2.4: the shared K3 predicate, arbitrary field-extension invariance, projectivity, canonical differential line, coherent base change and h²⁰=1. A geometric canonical trivialization is existential; a chosen nonzero form need not descend. The empty scheme is excluded by geometric integrality, whereas an abelian surface has h¹(O)=2 and fails the K3 condition.

### From TauCetiRoadmap.CrystallineCohomology

Consume §CR.3.5, “Computations and tests”, its projective-space Hodge computation: over every field k, Hʲ(ℙⁿ_k, Ωⁱ) is k when i=j≤n and zero otherwise. At n=0 only H⁰(O)=k survives; at n=1, H¹(Ω¹)=k. This contract is stronger than twisting-sheaf cohomology alone and supplies the worked example in §4.3.

### From TauCetiRoadmap.EllipticCurves

Consume Layer 4, “Elliptic curves over local fields — reduction, Tate’s algorithm, the Tate curve”: potential good reduction from integral j, bad reduction from positive minimal-discriminant valuation, and Néron–Ogg–Shafarevich at ℓ different from the residue characteristic. For y²=x³−x at p=2 use ℓ=3: v₂(Δ_min)=6 and j=1728 is integral, giving potential good reduction but nontrivial inertia and no unramified Witt scheme model.

## How to read the build

Layer 0 defines independent Witt models and extracts geometric Galois realizations. Layer 1 develops the local truncated-period proof from the supplied Fontaine–Laffaille category to the higher-weight ramification estimate. These two preparations are independent. Layer 2 uses the estimate and the base roadmap’s discriminant theory to prove the finite seven-primary filtration and then its rational form. Layer 3 combines Layer 0 with that filtration and purity to identify low-degree étale cohomology and prove `lowDegreeHodgeVanishing`. Layer 4 applies it to the supplied geometric K3 invariant and checks projective spaces. Each Needs line distinguishes the statement’s carriers from a proof route’s inputs; another proof may use a different route to the same statement. `Suggested.lean` is the acceptance test for the statable headline theorem, not an enumeration of the APIs and Checks below.

## Layer 0: Unramified local models and cohomology

### 0.1 Unramified Witt-ring scheme models

For a smooth proper finite-type ℚ-scheme X and a prime p, `hasWittGoodReductionAt` for the structure morphism of X and p means that there exist a proper smooth scheme 𝓧ₚ over W(F̄ₚ) and an isomorphism of Frac(W(F̄ₚ))-schemes between its generic fibre and X after scalar extension along ℚ→Frac(W(F̄ₚ)). `hasEverywhereWittGoodReduction` for that morphism means this for every rational prime, including 2. The models and isomorphisms are witnesses of a property; no chosen common model, polarization or compatibility between different primes is part of it.

The two predicates are defined for every rational scheme and the local predicate requires a prime p; their geometric applications impose smoothness and properness of X over ℚ. W(F̄ₚ) is the complete unramified Witt DVR, not the uncompleted union of finite unramified extensions.

A proof route is as follows. Use Mathlib’s native schemes and Witt vectors, the period-field interface of PadicHodgeTheory §0.1 and the field-extension descent of SchemeAndStackFoundations §0.11. Use Mathlib’s base-change stability of `IsProper` and `Smooth` for model transport and for ℤₚ-model witnesses.

(Fontaine93, Theorem 1 and Remark (a), printed p. 3; LMFDB32a3, minimal Weierstrass equation, invariants and local data at 2.)

The API records the following facts.

- The property is equivalent to the displayed existential scheme-model statement, including the generic-fibre isomorphism.
- A proper smooth scheme model over ℤₚ gives the property by base change to W(F̄ₚ).
- ℚ-isomorphic schemes have the same property, with the generic-fibre isomorphism composed accordingly.
- A proper smooth ℤ-scheme with generic fibre X gives witnesses at every p.
- The everywhere property provides the p-witness for each prime p.

**Checks.**

- ℙⁿ_ℚ has the property for every n≥0 through ℙⁿ over each Witt ring.
- For E:y²=x³−x, Witt good reduction at three holds: its integral Weierstrass model has discriminant 64, a unit in ℤ₃, so gives a proper smooth ℤ₃-model. Yet everywhere Witt good reduction fails at 2 by the next test. Requiring a proper smooth ℤ-model in the local predicate would fail this example.
- A model only after a ramified field extension does not meet the witness type. For example the elliptic curve y²=x³−x has potentially good reduction at 2 but not good reduction over W(F̄₂); its 3-adic Tate module has nontrivial inertia at 2. The numerical minimal discriminant 64 and j=1728 are recorded by LMFDB 32.a3; the potential-good-reduction and Néron–Ogg–Shafarevich criteria are imported from TauCetiRoadmap EllipticCurves Layer 4. Proper smooth base change then rules out a Witt-ring model.

*Needs:* native schemes, Witt vectors and generic-fibre pullbacks for the statement; Mathlib base-change stability of `IsProper` and `Smooth`, SchemeAndStackFoundations §0.11 for descent along field extensions, EllipticCurves Layer 4 for the negative elliptic Check.

### 0.2 The 7-adic realization of unramified local models

Let X/ℚ be smooth proper and have everywhere Witt good reduction. For every m≥0, Hₘ=Hᵐₑₜ(X_ℚ̄,ℚ₇) is finite-dimensional and continuous, unramified at every finite prime different from 7. Its dual Vₘ is crystalline at 7 with Hodge–Tate weights in [0,m], using HT(χ₇)=+1. There are canonical Hodge–Tate identifications of the G_ℚ₇-invariants of C₇(i)⊗Hₘ with Hᵐ⁻ⁱ(X,Ωⁱₓ)⊗_ℚ ℚ₇ for 0≤i≤m. There is an integer N≥1 and a proper smooth spread of X over ℤ[1/N]; for every prime q not dividing 7N the geometric Frobenius eigenvalues of Hₘ have complex absolute value `q^(m/2)`. This cofinite set, and in particular one such prime, suffices for the purity argument.

X need not be projective or geometrically connected. Choose compatible embeddings of algebraic closures for local restriction; outputs transport under change of embedding.

A proof route is as follows. Use proper smooth base change on the W(F̄_q)-scheme model to kill inertia away from 7. Apply proper smooth crystalline comparison over Frac(W(F̄₇)) and the PadicHodgeTheory §3.5 unramified-completion descent theorem to obtain crystallinity over ℚ₇; do not descend a scheme model. Use proper smooth de Rham/Hodge–Tate comparison and duality to translate the sign of weights. Independently spread the original proper smooth ℚ-scheme X to ℤ[1/N]. At a prime q not dividing 7N apply proper smooth base change to its actual finite-field fibre and use DeligneWeightsAndPurity §7.15 purity. This does not assert descent of an arbitrary Witt-ring model to a finite unramified ring.

(Fontaine93, §2.1 and comparison footnote, printed pp. 4–5.)

**Checks.**

- For X=Spec ℚ, H⁰=ℚ₇ and higher cohomology is zero; adding a positive-degree nonzero group would violate this calculation.
- For ℙ¹ and q=2, degree-two geometric Frobenius is 2, dual Frobenius is 1/2, and the only Hodge–Tate fixed piece has i=1. Arithmetic Frobenius would interchange these two scalars.
- For two disjoint rational points, H⁰ has dimension two and all positive groups vanish; imposing geometric connectedness would exclude a valid input.

*Needs:* §0.1, EtaleCohomologyFoundations §§F.2.1–F.2.2 and F.4.5–F.4.6 for the realizations; PadicHodgeTheory §§3.3–3.5, 8.1 and the Witt proper smooth comparison contract for comparison; the completed unramified inertia contract of LocalFieldsRamification; SchemeAndStackFoundations §§0.9, 4.8 and DeligneWeightsAndPurity §7.15 for the route.

### Examples

ℙ⁰ and the empty scheme give H⁰ of dimensions one and zero respectively. The curve y²=x³−x distinguishes a good model at three from potential good reduction at two. The disjoint union of two rational points verifies the absence of a connectedness hypothesis.

### Dependencies

SchemeAndStackFoundations §§0.11, 4.8; Mathlib Witt vectors, native schemes and base-change stability of proper and smooth morphisms; PadicHodgeTheory §§0.1, 3.3–3.5, 8.1 and the Witt proper smooth comparison contract; EtaleCohomologyFoundations §§F.2.1–F.2.2, F.3a, F.4.1–F.4.6; the completed unramified inertia contract of LocalFieldsRamification; DeligneWeightsAndPurity §7.15; ArithmeticGaloisRepresentations §§1.1–1.3; SchemeAndStackFoundations §0.9.


## Layer 1: Higher-weight torsion crystalline ramification

### 1.1 The filtered truncated valuation ring

Under the local hypotheses, for an algebraic extension E/K inside K̄ put b(E)={x∈O(E) : v₀(x)>r/(p−1)} and A(E)=O(E)/b(E). This strict inequality defines b(E). For 0≤i≤r let Filⁱ A(E) be the image of {x∈O(E) : v₀(x)≥i/p}; set Filʳ⁺¹=0. Define φᵢ([x])=[xᵖ/(−p)ⁱ] on Filⁱ, using a lift of valuation at least i/p. These maps are additive and σ-semilinear over W(k), and make A(E) a filtered Frobenius object. They need not give a finite-length W(k)-module.

Assume p is prime, k is perfect of characteristic p, K=Frac W(k), and v₀(p)=1; let r be an integer with 0<r<p−1.

A proof route is as follows. The positive valuation threshold makes b(E) an ideal and r<p−1 implies p∈b(E). Estimate binomial cross terms and changes of lift to show that division by (−p)ⁱ gives a well-defined class and a semilinear map. Check the filtered-object relations and transport under K-embeddings of algebraic E. Use the ambient MF category, not its finite-length subcategory.

(Fontaine93, §3.2, printed pp. 8–9.)

The API records the following facts.

- The quotient ring map O(E)→A(E) has kernel exactly b(E).
- Two integral representatives have the same class iff their difference has valuation strictly greater than r/(p−1).
- Filⁱ is the image of the indicated valuation ideal, for 0≤i≤r, and vanishes above r.
- On an admissible representative, φᵢ is x↦xᵖ/(−p)ⁱ modulo b(E).
- Each K-embedding E→E′ induces a filtered Frobenius map A(E)→A(E)′; identity and composition hold.
- As p∈b(E), the quotient factors through O(E)/p; use the same W(k)-action as FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.4.

**Checks.**

- For K=E=ℚₚ and 0<r<p−1, A(E)=𝔽ₚ and Fil¹=0.
- In E containing an element of valuation r/(p−1), its class is nonzero, whereas every element of larger valuation is zero.
- At p=3,r=1, let E=ℚ₃(π) with π²=−3. Then v₀(π)=1/2, so [π] is nonzero in Fil¹ A(E) and φ₁([π])=[π]. Using +p instead of −p gives −[π], which is distinct because 2 is a unit. This tests the divided-Frobenius sign at the strict cutoff.
- For p=3,r=1 over an algebraic closure of K, choose elements with distinct values 1/n for n≥3. Every such value is at most 1/2 and the corresponding classes are linearly independent over k, since a nonzero finite combination has the unique smallest value among its terms. Thus the ambient truncation can have infinite k-dimension; requiring finite length would lose this object.

*Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.4–R07.3.5 for the ambient filtered Frobenius category; PadicHodgeTheory §0.1 for the local valuation fields.

### 1.2 Torsion period solutions

Let M∈MFₜₒᵣ[0,r] of FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.4 be killed by p, and put d=dimₖ M. Thus M has finite length, Fil⁰M=M, Filʳ⁺¹M=0 and the Frobenius generation condition Σᵢφᵢ(FilⁱM)=M. Define J(M,E)=Homₘ𝒻(M,A(E)), an 𝔽ₚ-vector space with natural maps along K-embeddings. With M fixed, write J(E) for J(M,E). Choose a filtered basis with weights iₜ, so FilⁱM is spanned by the basis vectors whose weights are at least i. The t-th column of the invertible Frobenius matrix (λₛₜ) records `phi_(i_t)(e_t) = sum_s lambda(s,t) * e_s`. Regard each λₛₜ∈k=W(k)/p as an element of A(E) through W(k)/p→O(E)/p→A(E), which exists because p∈b(E), and choose λ̂ₛₜ∈O(E) mapping to that element under O(E)→A(E); equivalently v₀(λ̂ₛₜ−[λₛₜ])>r/(p−1), where [λₛₜ]∈W(k) is the Teichmüller representative. Write k_E=O(E)/𝔪_E for the residue field of E, an extension of k. An element of O(E) chosen only through the residue field, that is one whose image in k_E is the image of λₛₜ under k→k_E, need not be a permitted lift when E/K is ramified. Define Ĵ(M,λ̂,E) as the set of tuples x∈O(E)ᵈ satisfying `x_t^p = (-p)^(i_t) * (sum_s lambdaHat(s,t) * x_s)` for every t. It is a set of solutions, not a vector subspace of Eᵈ under ordinary addition.

Assume p is prime, k is perfect of characteristic p, K=Frac W(k), and v₀(p)=1; let r be an integer with 0<r<p−1. The generating torsion subcategory is required for M; the target A(E) remains in the larger ambient filtered category and need not be finite or generating. Permitted coefficient lifts are chosen anew when needed; Teichmüller lifts, and all other lifts in W(k), are always permitted.

A proof route is as follows. The Hom space uses addition and 𝔽ₚ scaling in the target A(E). Write a morphism on a basis adapted to the filtration and apply φᵢ; this gives the polynomial equations after lifting. Transport solutions by embeddings preserving the coefficient choices; the intrinsic J_M is independent of those choices.

(Fontaine93, §3.4, printed p. 9.)

The API records the following facts.

- A filtration-preserving W(k)-linear map commuting with all φᵢ defines an element of J(M,E).
- Morphisms agreeing on a filtered basis are equal.
- K-embeddings of E induce 𝔽ₚ-linear maps on J, compatible with identity and composition.
- A morphism M→N gives J(N,E)→J(M,E) by precomposition.
- Membership in Ĵ is precisely the simultaneous polynomial equations, with the same column convention for λ, for permitted coefficient lifts λ̂, whose images in A(E) are those of λ.
- The period comparison of §1.4 identifies the A_cris/p functor with J(M,K̄).

**Checks.**

- For d=0 the solution set consists of the empty tuple and J is the zero vector space, so both sets have one element.
- For rank one of weight zero and φ(e)=e, Ĵ solves xᵖ=x and has p Teichmüller solutions already in K.
- For rank one of weight one, Ĵ solves xᵖ=−p x. Over ℚₚ it has only the zero solution, but over a field containing a (p−1)-st root of −p it has p solutions. Thus J(E) need not have maximal cardinality for every E.
- At p=3 with weights (0,1) and matrix rows (1,1),(0,1), the column convention gives x₁³=x₁ and x₂³=−3(x₁+x₂). If θ³+3θ+3=0, then (1,θ) satisfies both equations and v₀(θ)=1/3. The transposed matrix would require 1=1+θ and fails since θ≠0.
- Exact lifts are not closed under coordinatewise addition: at p=3 the weight-zero equation has roots 0,1,−1, but 1+1=2 has 2³=8≠2.
- At p=3,r=1, E=ℚ₃(π), π²=−3 and the weight-zero unit object φ₀(e)=e, the residue-field lift λ̂=(1+π)²=−2+2π of λ=1 (here k_E=k=𝔽₃) is not permitted: v₀(λ̂−1)=v₀(−3+2π)=1/2 is not greater than 1/2, and the image of λ̂ in A(E) is 1−π≠1. Its exact solution x=1+π of x³=λ̂x has φ₀([x])=[(1+π)³]=[−8]=1≠1+π=λ[x], so it is not a filtered Frobenius morphism. With the permitted lift λ̂=1 the exact roots 0,1,−1 reduce to the three φ₀-fixed classes.
- At p=3,r=1 take the ambient object M=𝔽₃ with Fil¹M=0 and every φᵢ=0, and E=ℚ₃(π), π²=−3. Here A(E)=𝔽₃[π]/(π²), φ₀(a+bπ)=a, and J(M,E)={0,π,−π} has three elements, while the equation x³=0 has only zero. This M is excluded because ΣᵢIm φᵢ=0≠M; the zero object instead satisfies 0=M and has one solution on each side.

*Needs:* §1.1 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.4–R07.3.5 for filtered morphisms.

### 1.3 Unique lifts of truncated torsion solutions

For M∈MFₜₒᵣ[0,r] killed by p, the coefficient data of §1.2 and every algebraic E/K, evaluation on the filtered basis followed by reduction induces a bijection Ĵ(M,λ̂,E)→J(M,E). In particular the cardinality of the exact-solution set is independent of the permitted coefficient lifts. The bijection transfers the 𝔽ₚ-vector-space structure to Ĵ; this is not coordinatewise addition. For finite E, successive corrections of approximate solutions converge in O(E); the algebraic-extension statement follows by finite descent.

Assume p is prime, k is perfect of characteristic p, K=Frac W(k), and v₀(p)=1; let r be an integer with 0<r<p−1. E need not contain the splitting field of the period representation.

A proof route is as follows. Use the invertibility of (λₛₜ) and the valuation bound r/(p−1)<1 to solve the correction equations one valuation layer at a time. For finite E of absolute ramification e, begin with precision n>re/(p−1), then improve n to n+1 with a unique correction in the prescribed congruence class. Completeness produces the unique exact lift; all input coordinates for general algebraic E lie in a finite complete subextension.

(Fontaine93, §3.4 Lemma 2 and sublemma, printed p. 9.)

**Checks.**

- For M=0 the empty tuple is the unique exact lift: both sets have cardinality one.
- For p=3, a weight-one unit object and E=ℚ₃, the exact equation x³=−3x has only zero; in E=ℚ₃(π), π²=−3, its roots are 0,π,−π and all three truncated classes differ.
- With p=3,r=1,e=2 the initial precision must be an integer n>1, so n=2 works and n=1 is outside the statement. The two roots π,−π differ by value 1/2 and coincide if the strict cutoff is incorrectly replaced by a weak one.

*Needs:* §1.2 for the statement; finite-extension completeness and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.5 for the route.

### 1.4 Period truncation computes the torsion representation

For M∈MFₜₒᵣ[0,r] killed by p, the natural projection A_cris/p→A(K̄) induces a G(K)-equivariant 𝔽ₚ-linear isomorphism U*(M)=Homₘ𝒻(M,A_cris/p)≅J(M,K̄). Under that supplier’s period-functor identification this is the same contravariant torsion crystalline representation as Uₛ(M), of 𝔽ₚ-dimension dimₖ M.

Assume p is prime, k is perfect of characteristic p, K=Frac W(k), and v₀(p)=1; let r be an integer with 0<r<p−1. Use that supplier’s normalization in which a filtration jump i gives cyclotomic weight +i.

A proof route is as follows. Import the explicit divided-power presentation of A_cris/p and its Frobenius maps through the killed-p A_cris truncation contract. Define here the projection A_cris/p→A(K̄) that sends every positive divided-power term to zero and reduces the constant term, and check that it respects Filⁱ and φᵢ for 0≤i≤r (Fontaine93, §3.2, printed pp. 8–9). Apply the unique-lift description of solutions to obtain surjectivity. Recover the discarded divided-power coordinates uniquely using the invertible Frobenius matrix, giving injectivity and Galois compatibility.

(Fontaine93, §§3.1, 3.3 Lemma 1, 3.5, printed pp. 8–10.)

**Checks.**

- For the zero module both Hom groups have dimension zero and the comparison is the unique map between singleton groups.
- For the weight-zero unit object both groups are 𝔽ₚ with p elements; the zero comparison map would lose the nonzero solutions.
- For p=3,r=1 the weight-one object yields a one-dimensional 𝔽₃-representation and exactly three solutions over the splitting field. Its basis class satisfies φ₁([π])=[π] at π²=−3; a comparison with the opposite divided-Frobenius sign fails this normalization.

*Needs:* §§1.1–1.3; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.7, R07.3.10, R07.3.15 and the killed-p A_cris truncation contract.

### 1.5 Solutions detect the torsion splitting field

For M∈MFₜₒᵣ[0,r] killed by p, let L/K be the finite Galois extension fixed by the kernel of G(K) on U*(M). For every algebraic E/K inside K̄, #J(M,E)≤pᵈ; equality holds iff L⊆E. Intrinsically, without a fixed embedding E⊆K̄, equality holds iff a K-embedding L→E exists.

Assume p is prime, k is perfect of characteristic p, K=Frac W(k), and v₀(p)=1; let r be an integer with 0<r<p−1. d=dimₖ M. The representation is continuous with finite image.

A proof route is as follows. Use the period-truncation comparison to identify J(M,K̄) with a d-dimensional 𝔽ₚ-representation. For this fixed-point argument choose all Frobenius-matrix lifts in W(k)⊆O(K), hence fixed by G(K). The exact-solution bijections are then G(K)-equivariant. Coordinatewise G(E)-fixed tuples lie in E, so J(M,E) equals the G(E)-fixed subspace of J(M,K̄), including for algebraic E not complete; do not commute invariants with a valuation quotient without this lifting argument. All pᵈ elements are fixed exactly when the kernel field lies in E.

(Fontaine93, §3.6 Lemma 3, printed p. 10.)

**Checks.**

- For d=0 the kernel field is K and every algebraic E has exactly p⁰=1 solution, testing both directions of the field criterion.
- For p=3 and the weight-one unit object, E=ℚ₃ has one solution and L=ℚ₃(π), π²=−3, has three: 1<3 and equality detects L.
- Adjoining an independent algebraic extension to L leaves the solution count three, not three times the extension degree; the criterion is containment, not equality of fields.

*Needs:* §§1.3–1.4; the finite torsion kernel-field contract of ArithmeticGaloisRepresentations.

### 1.6 Approximate integral embeddings recover the period field

For M∈MFₜₒᵣ[0,r] killed by p, L its kernel field and every real m>1+r/(p−1), the supplier property Pₘ(L/K) holds: for every algebraic E/K, an O(K)-algebra map O(L)→O(E)/a(E)^m, where a(E)^m={x:v₀(x)≥m}, implies a K-embedding L→E. The approximate map need not itself lift to that embedding.

Assume p is prime, k is perfect of characteristic p, K=Frac W(k), and v₀(p)=1; let r be an integer with 0<r<p−1.

A proof route is as follows. First lift the map on the maximal unramified subextension L₀/K; no finiteness of k is used. The residue extension ℓ/k of L₀/K is finite separable because k is perfect; choose a primitive element of ℓ with minimal polynomial ḡ, separable, and a monic lift g∈W(k)[X]. Then W(k)[X]/(g) is a standard étale W(k)-algebra, finite free of rank [ℓ:k]=[L₀:K] by the fundamental identity with e=1; being étale over the DVR W(k), it is normal, so it is all of O(L₀). The pair (O(E),p O(E)) is henselian, as O(E) is integral over the p-adically complete W(k), and (O(E),a(E)^m) is henselian because both ideals have radical the maximal ideal of the rank-one valuation ring O(E). The approximate map restricted to O(L₀) is a section modulo a(E)^m of the étale O(E)-algebra O(L₀)⊗O(E), so it lifts uniquely to a K-embedding L₀→E agreeing with it modulo a(E)^m. Then apply the totally ramified argument to L/L₀: lift the image of a uniformizer of L and evaluate its Eisenstein polynomial over O(L₀). Use m>1+r/(p−1) to obtain an injective filtered Frobenius map A(L)→A(E). Compose elements of J(M,L) with this map; injectivity preserves their distinctness. The cardinality criterion then forces L→E. The generic Pₘ predicate and its upper-ramification consequence stay with FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.

(Fontaine93, §3.7 Lemma 4, printed pp. 10–11.)

**Checks.**

- For L=K the identity map and identity field embedding exist for every m>1+r/(p−1); the field conclusion is nonempty even for the zero representation.
- At p=3,r=1 the threshold is 3/2: m=2 is admitted, m=3/2 is not. An element of value exactly 2 is zero in the approximate-map quotient but cannot be confused with the period boundary value 1/2.
- For the weight-one splitting field L=ℚ₃(π), E=ℚ₃ and m=2, no approximate integral map can exist, since the conclusion would supply π∈ℚ₃; the relation would require x²+3=0 modulo 9, but x²+3 takes only the residues 1,3,4,7 modulo 9, none zero.
- The unramified step does not use a finite residue field. For p=3 and k=𝔽₃(t)^perf, the separable residue extension k(α), α²=t, has reduced polynomial X²−t with derivative 2α≠0, so W(k)[X]/(X²−[t]) is standard étale of rank 2 and henselian lifting applies; a supplier restricted to finite residue fields would not reach this K.

*Needs:* §§1.1, 1.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.6.3 for Pₘ; for the unramified step, SchemeAndStackFoundations §0.12 (`exists_etale_lift`) and §0.14 (`henselian_pair_permanence`, `henselian_finiteEtale_equivalence`), henselian lifting over pairs with arbitrary residue field, with Mathlib `IsAdicComplete.henselianRing`, `Algebra.Etale`, `StandardEtalePresentation` and `Ideal.sum_ramification_inertia_eq_finrank`.

### 1.7 Fontaine’s higher-weight torsion ramification bound

For M∈MFₜₒᵣ[0,r] killed by p, U=Uₛ(M) and L its kernel field, its largest upper break in Fontaine’s shifted numbering is at most 1+r/(p−1). Equivalently, Serre’s upper ramification groups act trivially for v>r/(p−1). Consequently v₀(𝔇(L/K))<1+r/(p−1). If L/K is unramified the different exponent is zero and the strict inequality still holds.

Assume p is prime, k is perfect of characteristic p, K=Frac W(k), and v₀(p)=1; let r be an integer with 0<r<p−1.

A proof route is as follows. Apply the refined all-m ramification implication in the refined approximate-embedding contract with c=1+r/(p−1); taking the infimum in the unrefined 1/e estimate alone would be insufficient. For a ramified finite Galois L/K use the imported identity v₀(𝔇)=u−i with i>0; handle the unramified case separately. This proves the strict theorem of the letter. The alternative proof on p. 12 first gives a weak different bound; it does not license replacing the strict target by equality.

(Fontaine93, Theorem 2 and §3.8, printed pp. 3, 11–12.)

**Checks.**

- At p=7,r=3 the shifted bound is 3/2, Serre’s bound is 1/2 and the different is strictly less than 3/2.
- At p=3,r=1 the tame quadratic weight-one splitting field has shifted break 1, Serre break 0 and normalized different 1/2<3/2; equality with the shifted break would be false.
- For an unramified kernel field the different is 0<1+r/(p−1). At p=2 there is no positive integral r<1; at p=3 exactly r=1 occurs.

*Needs:* §1.6; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.6.2–R07.6.3 and the refined approximate-embedding contract for the ramification route; PadicPeriodRings §0.3 for Serre’s lower and upper numbering and the different formula over the perfect residue field k.

### 1.8 The ramification bound for crystalline subquotients

Let V be a crystalline ℚₚ-representation of G(K) with Hodge–Tate weights in [0,r], and let U be a finite G(K)-stable subquotient of V killed by p. Then its kernel field L satisfies v₀(𝔇(L/K))<1+r/(p−1). A finite subquotient means a quotient of two stable lattices or lattice submodules, not a ℚₚ-linear quotient that happens to have finite cardinality. The bound does not extend here to arbitrary p-power torsion, ramified K or r=p−1.

Assume p is prime, k is perfect of characteristic p, K=Frac W(k), and v₀(p)=1; let r be an integer with 0<r<p−1.

A proof route is as follows. Use the FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.3 lattice correspondence and closure of the essential image under subquotients to realize U as Uₛ(M) for a generating M∈MFₜₒᵣ[0,r] killed by p, with the same weight interval. Apply the torsion bound. This is a higher-weight crystalline consequence; it does not reprove the finite-flat pⁿ bound already owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.6.

(Fontaine93, abstract, unnumbered cover page, PDF p. 1; §1, printed p. 4.)

**Checks.**

- The zero lattice quotient has L=K and different 0.
- At p=3 a killed-three quotient of ℚ₃(1) has splitting field ℚ₃(ζ₃) and different 1/2<3/2, agreeing with the filtered-unit calculation.
- The quotient ℤ/9(1) is outside the killed-three hypothesis: ℚ₃(ζ₉) has different 9/6=3/2, showing why the strict killed-p bound cannot cover arbitrary p-power torsion.

*Needs:* §1.7; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.12, R07.3.17 for the lattice-subquotient realization.

### Examples

At p=3,r=1 and π²=−3, v₀(π)=1/2, φ₁([π])=[π], and the weight-one exact roots are 0,π,−π. Over ℚ₃ only zero survives as a solution; over ℚ₃(π) all three do. The tame quadratic different is 1/2<3/2, while the killed-nine cyclotomic example has different 3/2 and is excluded.

### Dependencies

FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.4–R07.3.17 and R07.6.2–R07.6.3, the killed-p A_cris truncation contract and the refined approximate-embedding contract; PadicPeriodRings §0.3; PadicHodgeTheory §§0.1, 0.4, 3.2–3.5; the finite torsion kernel-field contract of ArithmeticGaloisRepresentations; SchemeAndStackFoundations §§0.12, 0.14 for henselian étale lifting.


## Layer 2: Global seven-adic devissage and filtration

### 2.1 The finite global crystalline category at seven

Let C₇[0,3] be the full category of finite abelian 7-primary groups U with continuous G_ℚ-action, unramified outside 7 at finite primes, whose restriction to G_ℚ₇ lies in the essential image of Uₛ on MFₜₒᵣ[0,3]. Morphisms are equivariant group homomorphisms. The zero object is included. This is closed under subobjects, quotients and finite direct sums; an ambient extension belongs only when its middle term satisfies the local condition.

All torsion exponents 7ⁿ, n≥1, are allowed, and the local interval is strictly inside [0,7−2].

A proof route is as follows. Restrict the ambient finite torsion representation category by global unramifiedness and the local essential-image condition. Import FL full faithfulness, exactness and subquotient closure to obtain the asserted closure properties.

(Fontaine93, §2.2, printed p. 5.)

The API records the following facts.

- Package a finite continuous torsion action with the two stated global and local properties.
- Its Hom set is exactly the ambient equivariant group homomorphisms; equality is equality of underlying maps.
- Galois-stable subobjects and quotients inherit membership.
- Finite direct sums inherit membership, including zero.
- For a stable lattice T in a global crystalline V of weights [0,3], unramified outside 7, T/7ⁿT is an object through FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.17.

**Checks.**

- ℤ/49 with trivial G_ℚ-action belongs, so the category is larger than 𝔽₇-representations.
- 𝔽₇(i), i=0,1,2,3, all belong.
- 𝔽₇(4) is unramified outside 7 but its inertial FL weight is 4, hence it is excluded from this interval.

*Needs:* ArithmeticGaloisRepresentations §§1.1, 1.9 and the finite torsion kernel-field contract for the ambient category; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.4–R07.3.5, R07.3.10–R07.3.12, R07.3.17 for the local essential image and closure.

### 2.2 The descending cyclotomic filtration

For a representation ρ of a group G on a module U over a commutative ring R, a character χ:G→R×, and a G-stable submodule N, define stepᵢ(N)={u:ρ(g)u−χ(g)ⁱ u∈N for every g}. Define U₄=0 and Uᵢ=stepᵢ(Uᵢ₊₁) for i=3,2,1,0. Each is G-stable, Uᵢ₊₁⊆Uᵢ, and G acts by χⁱ on Uᵢ/Uᵢ₊₁. Equivalently stepᵢ(N) is the preimage in U of the χⁱ-eigenspace of U/N. This definition applies both to finite 7-primary ℤ₇-modules and to ℚ₇-spaces.

N must be G-stable for the quotient interpretation and N⊆stepᵢ(N); the intersection-of-comaps formula exists even without this hypothesis.

A proof route is as follows. Take the intersection over g of the inverse images of N under the linear maps ρ(g)−χ(g)ⁱ id. Use commutativity of the character values, group inverses and stability of N to prove G-stability and identify the quotient action. Iterate the construction in the order 3,2,1,0, starting from zero.

(Fontaine93, §§2.1–2.2, printed pp. 4–5.)

The API records the following facts.

- Membership is exactly the displayed family of congruences for every g.
- N⊆N′ implies stepᵢ(N)⊆stepᵢ(N′); equivariant maps carry a step into the step of the image-compatible filtration.
- For stable N, the step is stable and contains N.
- Its quotient by N is the χⁱ-eigenspace in U/N; at χ=1 and N=0 it is Mathlib Representation.invariants.
- The index-four term is zero and each lower term is the appropriate step of the preceding term.
- Equivariant module isomorphisms identify every term, without choosing a basis.

**Checks.**

- Over a field, on a pure χʲ-line, if χ⁰,…,χ³ are pairwise distinct and 0≤j≤3, Uᵢ is the whole line exactly when i≤j.
- For G=C₇⋊C₆, let t act on the wild generator w by w↦w⁶, set χ(t)=3 and χ(w)=1 over 𝔽₇, and let ρ(t)=diag(6,1), ρ(w)=((1,1),(0,1)). The χ³-subline has dimension one, the trivial quotient dimension one, and the invariant space is zero. The order 3,2,1,0 gives dimensions (1,1,1,2); order 0,1,2,3 gives (0,0,0,1). This is a representation-theoretic example, without an assertion of global crystalline realizability.
- Over ℤ/25 on a line, take a C₅-generator with χ=6 and ρ=6. The powers χ⁰,χ¹,χ²,χ³ are the distinct units 1,6,11,16, but step₃(0)=5(ℤ/25) has five elements. Distinctness alone cannot replace the field hypothesis in the pure-line Check.
- For the permutation action of S₃ on ℚ³, χ=1 and N=0 give step₀(0)=ℚ(1,1,1), of dimension one; step₀(top)=top has dimension three. The line ℚ(1,0,0) is not stable, since (12) sends its generator to (0,1,0), so it cannot support the quotient interpretation.

*Needs:* Mathlib representations, invariant submodules and inverse-image submodules; G-stability for the quotient interpretation; no arithmetic or crystallinity input.

### 2.3 Trivial endpoints give a trivial crystalline extension

An exact sequence 0→U′→U→U″→0 inside C₇[0,3] with trivial G_ℚ-action on U′ and U″ has trivial action on U. This does not assert that the underlying abelian-group sequence splits.

The middle term must be in C₇[0,3].

A proof route is as follows. Translate the sequence contravariantly to FL modules. Trivial endpoints have Fil¹=0, hence strict exactness forces Fil¹=0 on the middle term. The weight-zero FL description makes U unramified at 7; it is already unramified elsewhere. Use Minkowski’s theorem, Mathlib `NumberField.finrank_eq_one_of_unramified`, that a number field unramified at all finite primes is ℚ to trivialize the action.

(Fontaine93, §2.3 Lemma 1, printed pp. 5–6.)

**Checks.**

- The sequence 0→ℤ/7→ℤ/49→ℤ/7→0 with trivial action satisfies the conclusion, although its middle group contains an element of order 49 and the product of its endpoints does not.
- For U=0 the action is trivial and the finite kernel field is ℚ, of degree one and root discriminant one.
- On 𝔽₇² let G_ℚ act by matrices ((1,a(g)),(0,1)), where a(g)=(χ₇(g)⁶−1)/7 modulo 7. This is an ambient extension of trivial characters, unramified outside seven; an inertia element with χ₇(g)=8 modulo 49 has a(g)=6 and matrix of order seven. Its ramification excludes the middle term from C₇[0,3], since a weight-zero FL middle term would be unramified.

*Needs:* §2.1 for the statement; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.5 and the weight-zero unramified contract, Mathlib `NumberField.finrank_eq_one_of_unramified` and ArithmeticGaloisRepresentations §2.2 for the route.

### 2.4 The four simple global crystalline objects

The nonzero simple objects of C₇[0,3], up to isomorphism, are exactly 𝔽₇(i) for i=0,1,2,3.

Simplicity is taken in the finite global crystalline category; subquotient closure identifies it with the relevant G_ℚ-module simplicity.

A proof route is as follows. A simple object is killed by 7. If E is its kernel field, form F=E(ℚ(ζ₇)), the field of U⊕𝔽₇(1). Layer 1 gives rd(F)<7^(3/2)<19.02; the base roadmap’s totally complex row (d) gives [F:ℚ]≤287. Write [F:ℚ]=6n′. If wild ramification occurs at 7, 7 divides n′. Since 6n′≤287, n′=7n″ with 1≤n″≤6. The number of 7-Sylow subgroups in Gal(F/ℚ(ζ₇)) divides n″ and is 1 modulo 7, hence is one. Its unique Sylow is characteristic there and normal in Gal(F/ℚ). Its fixed field F′ is Galois over ℚ, contains ℚ(ζ₇), is tame at 7 and has degree 6n″≤36, so its inertia order is at most 36 and rd(F′)≤7^(35/36)≈6.6317<6.93. The supplier’s §1.9 row (b) gives [F′:ℚ]≤10 and 6n″≤10, hence n″=1. A normal 7-subgroup acts trivially on a simple 𝔽₇-module (use fixed vectors and normality), and also on 𝔽₇(1), contradicting faithfulness of their combined action. Thus F is tame; its inertia order e at 7 divides 7^f−1 with ef≤287, so e≤143, rd(F)≤7^(142/143)≈6.9054<6.93, and row (b) gives [F:ℚ]≤10. Since it contains the degree-six ℚ(ζ₇), F=ℚ(ζ₇). The characters of its cyclic group and the imported FL tame-weight formula restrict the exponent to 0,…,3.

(Fontaine93, §2.4 Lemma 2, printed p. 6.)

**Checks.**

- At n′=7n″ the bound 6·7n″≤287 gives n″≤6. A number of Sylow seven-subgroups dividing n″ and congruent to 1 modulo 7 can only be one.
- For the tame fixed field, of degree 6n″≤36, rd≤7^(35/36)≈6.6317<6.93, so row (b) applies and 6n″≤10 forces n″=1: the next possible degree 12 is excluded. A tame inertia order 194 would give 7^(193/194)≈6.9301>6.93, so the divisibility e | 7^f−1, which gives e≤143 for tame F of degree at most 287, is needed for the final step.
- The four characters on a tame generator of mod-seven value 3 have scalars 1,3,2,6; the next character has scalar 4 and weight four, outside the interval.

*Needs:* §§1.7, 2.1; SmallRamificationAndAbelianVarietyBaseCases §§1.1, 1.9 (row (b)); LocalFieldsRamification Layer 3 for the injective tame character; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.8–R07.3.9; Tau Ceti p-group invariant theorem and normality; the finite torsion kernel-field contract of ArithmeticGaloisRepresentations.

### 2.5 The unique possible orientation of a nonsplit mod-seven extension

For i,j∈{0,1,2,3}, every exact sequence 0→𝔽₇(j)→U→𝔽₇(i)→0 in C₇[0,3] with 7U=0 splits unless (i,j)=(0,3). No existence assertion for the exceptional pair is needed.

The orientation distinguishes subobject j from quotient i, and the entire middle module is killed by 7.

A proof route is as follows. For equal characters twist into weight zero and use the trivial-extension theorem; the one-weight twist remains in the safe FL category. For i>j, FL strictness gives local splitting. A nontrivial global class would give a cyclic degree-seven extension of ℚ(ζ₇) unramified everywhere. Its degree over ℚ is 42 and its root discriminant is 7^(5/6)<5.72, contradicting the existing base bound [F:ℚ]≤8. This replaces the source’s class-number input by the base roadmap’s discriminant bound. For i<j, twist by −i and put a=j−i. A nonsplit class gives a degree-42 field over ℚ. For a=1,2, either it is everywhere unramified over ℚ(ζ₇), already excluded by the degree-eight bound, or it is ramified at 7. Apply the killed-7 ramification theorem to the twisted weight interval [0,a]: its Serre upper break over ℚ₇ is at most a/6, so the positive lower break b over the tame degree-six base is at most a. The tame conjugation character gives b≡a modulo 6, hence b=a. The wild inertia has degree seven and the full inertia degree is 42; obtain |disc F|=7^(41+6a). If a≤2 then rd(F)≤7^(53/42)<12, contradicting the base n≥36⇒rd>12 bound. Only a=3 is left.

(Fontaine93, §2.5 Lemma 3, printed pp. 6–7.)

**Checks.**

- For (i,j)=(0,1) the nonzero ramified case would have b=1, discriminant exponent 47 and root discriminant 7^(47/42)<12, contradicting degree 42≥36.
- For (i,j)=(0,2) the exponent is 53, and 7^(53/42)<12. The lower-break congruence b≡2 mod 6 with 0<b≤2 leaves b=2.
- For (i,j)=(0,3) the exponent would be 59 and 7^(59/42)>12, so this numerical contradiction stops. The reversed pair (3,0) is in the proved splitting range.
- In the unramified relative case the exponent is 35 and the root discriminant is 7^(35/42)=7^(5/6)<5.72; degree 42 contradicts the bound eight.
- In the tame-conjugation calculation with θ₀(t)=3 and normalized wild value 1, breaks b=1,2 give conjugated values 3 and 2. Inverting the tame character instead gives 5 and 4, reversing the required exponent congruence.

*Needs:* §§2.3–2.4 for the global category and simple characters; §1.7 with interval [0,a]; the oriented mod-p splitting contract of FiniteFlatGroupsAndIntegralPadicHodgeTheory; LocalFieldsRamification Layer 3 tame conjugation and different formulas; SmallRamificationAndAbelianVarietyBaseCases §§1.1, 1.9.

### 2.6 Cyclotomic decomposition without a trivial quotient

If U∈C₇[0,3] has no quotient isomorphic to 𝔽₇ with trivial action, then U is the internal direct sum of its submodules gᵢU={u:gu=χ₇(g)ⁱ u for all g}, i=0,1,2,3. In fact g₀U=0 under this hypothesis.

U may have any finite 7-power exponent.

A proof route is as follows. Induct on the order of U, using the four simple objects and a simple quotient 𝔽₇(j) with j>0. Use the mod-seven extension theorem to prevent the kernel from acquiring a trivial quotient, and to split the relevant mod-seven pieces. For a cyclic constituent of exponent 7ⁿ use rank-one FL to identify its inertia character as χ₇ⁱ modulo 7ⁿ. The ratio of its global character with χ₇ⁱ is unramified at every finite prime, so Minkowski’s theorem, Mathlib `NumberField.finrank_eq_one_of_unramified`, makes the ratio trivial. This removes the possible local unramified twist rather than falsely excluding it from local FL. Assemble the cyclic case and the direct-sum case in the source induction.

(Fontaine93, §2.6 Lemma 4, printed pp. 7–8.)

**Checks.**

- For U=ℤ/49(1), multiplication by seven is nonzero and the single nonzero eigensubgroup g₁U is all 49 elements; an argument confined to 𝔽₇-vector spaces would miss this case.
- For U=𝔽₇(1)⊕𝔽₇(2), g₀=0 and g₁,g₂ have orders seven, giving 7·7=49 elements in the direct sum.
- A permitted nonsplit extension with quotient 1 and sub χ³ has a trivial quotient; it lies outside the hypothesis. Removing that hypothesis would incorrectly force it to split.

*Needs:* §§2.3–2.5; the rank-one inertia character contract of FiniteFlatGroupsAndIntegralPadicHodgeTheory for arbitrary 7-power rank one; Mathlib `NumberField.finrank_eq_one_of_unramified` and ArithmeticGaloisRepresentations §2.2 for the global unramified ratio.

### 2.7 The finite global cyclotomic filtration is exhaustive

For every U∈C₇[0,3], the descending filtration U₄=0, Uᵢ=stepᵢ(Uᵢ₊₁) satisfies U₀=U. Consequently each graded quotient is a finite module with the pure χ₇ⁱ-action.

No semisimplicity of U is assumed or asserted.

A proof route is as follows. Induct on the finite order. If U has no trivial simple quotient, apply the cyclotomic decomposition. Otherwise take 0→U′→U→𝔽₇→0. By induction U′ is filtered; quotient by U′₁ gives an extension with trivial endpoints and apply the trivial-extension theorem. Identify the successive steps through the quotient and obtain U₀=U. This permits the possible χ³-by-trivial extension.

(Fontaine93, §2.2 Proposition 1′ and §2.7, printed pp. 5, 8.)

**Checks.**

- For U=0 all terms are zero and U₀=U has one element.
- On U=ℤ/49(i), i=0,1,2,3, character differences on a tame generator are units modulo seven, so Uₖ=U exactly for k≤i.
- For a nonsplit χ³-by-trivial extension of dimension two the dimensions (U₄,U₃,U₂,U₁,U₀) are (0,1,1,1,2). It is exhausted without a direct-sum conclusion.

*Needs:* §§2.1–2.3, 2.6 for the order induction; the same finite torsion category throughout.

### 2.8 Fontaine’s rational 7-adic filtration

Let V be a finite-dimensional continuous ℚ₇-representation of G_ℚ, unramified outside 7, whose local restriction at 7 is crystalline with Hodge–Tate weights in [0,3]. The same descending cyclotomic filtration V₄=0, Vᵢ=stepᵢ(Vᵢ₊₁) satisfies V₀=V, and G_ℚ acts on Vᵢ/Vᵢ₊₁ by χ₇ⁱ.

The local weight interval is [0,3], not all weights below 7.

A proof route is as follows. Choose a stable ℤ₇-lattice T using ArithmeticGaloisRepresentations §1.6. The FL lattice correspondence puts every T/7ⁿT in C₇[0,3]. Apply the finite proposition at every n. Pass to compatible witnesses of the filtration using compactness of inverse limits of nonempty finite solution sets; arbitrary choices of finite-level decompositions are insufficient. Identify T with limₙ T/7ⁿT and invert 7. The defining linear congruences give exactly the rational step subspaces and their scalar quotient actions.

(Fontaine93, §2.1 Proposition 1 and §2.2, printed pp. 4–5.)

**Checks.**

- For V=0 every term is zero, and the stable lattice is zero.
- For ℚ₇(1)⊕ℚ₇(2), dimensions from V₄ to V₀ are (0,0,1,2,2); the two graded scalar actions are χ² and χ.
- At lattice levels ℤ/7ⁿ(i), the compatible witness uₙ=1 has reductions 1 at every preceding level. Arbitrary witnesses uₙ with incompatible reductions do not define an element of ℤ₇, which excludes that inverse-limit shortcut.

*Needs:* §2.2 for the statement; §2.7, ArithmeticGaloisRepresentations §1.6, EtaleCohomologyFoundations §F.4.0 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.3.17 for the lattice route; compact inverse limits of finite solution sets.

### Examples

The pure χ²-line has filtration dimensions (0,0,1,1,1) from index four to zero. A nonsplit χ³-by-trivial extension has dimensions (0,1,1,1,2). The field degree calculation 42·6=252≤287 and 42·7=294>287 leaves the unique-Sylow margin n″≤6.

### Dependencies

Layer 1; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.4–R07.3.17 and the weight-zero unramified contract, the rank-one inertia character contract and the oriented mod-p splitting contract; SmallRamificationAndAbelianVarietyBaseCases §§1.1, 1.7, 1.9 (including row (b)); LocalFieldsRamification Layer 3; ArithmeticGaloisRepresentations §§1.1–1.3, 1.6, 1.9, 2.2 and the finite torsion kernel-field contract; EtaleCohomologyFoundations §F.4.0; Mathlib representations, submodules and the unramified degree-one theorem; Tau Ceti p-group invariant theorem.


## Layer 3: Low-degree cohomology and Hodge vanishing

### 3.1 Low-degree cohomology is zero or Tate

For a smooth proper ℚ-scheme X with everywhere Witt good reduction, H¹ₑₜ(X_ℚ̄,ℚ₇)=0 and H³ₑₜ(X_ℚ̄,ℚ₇)=0, and H²ₑₜ(X_ℚ̄,ℚ₇)≅ℚ₇(−1)^b as G_ℚ-representations, where b=dim_ℚ₇ H²ₑₜ. The isomorphism need not choose a canonical basis.

The purity input is valid for proper smooth schemes without projectivity.

A proof route is as follows. Apply the rational filtration to Vₘ=(Hᵐₑₜ)^∨ for m=1,2,3. Choose q outside 7N from the spread-out smooth proper model and compare eigenvalue absolute values: the pure dual cohomology has weight −m, while a nonzero grade χⁱ has weight −2i. Exact characteristic-polynomial multiplicativity forces m=2i for each nonzero grade. Odd m leave no grades and hence no cohomology. For m=2 the only grade is i=1, so V₁=V, V₂=0 and the whole action is χ, not merely its semisimplification. Dualize.

(Fontaine93, §2.1, printed p. 4.)

**Checks.**

- For ℙ¹ at q=2, H² has one Frobenius eigenvalue 2 and its dual 1/2, so m=2i forces i=1.
- For m=1, the candidate grade absolute values 1,1/2,1/4,1/8 differ from 2^(−1/2); for m=3 they differ from 2^(−3/2). Thus all grades have dimension zero.
- A two-dimensional Jordan block with both eigenvalues 2 is pure of weight two but not scalar. The exhaustive filtration with its only surviving grade equal to the whole space excludes that wrong inference from purity alone.

*Needs:* §§0.1–0.2 and 2.8; DeligneWeightsAndPurity §§0.8–0.9, 7.15 and SchemeAndStackFoundations §0.9 for the purity route.

### 3.2 Fontaine’s low-degree Hodge vanishing

Prove `lowDegreeHodgeVanishing`: for X/ℚ smooth proper with everywhere Witt good reduction, and natural i,j with i≠j and i+j≤3, the ℚ-vector space Hʲ(X,Ωⁱₓ) is zero. Equivalently hⁱʲ(X)=dim_ℚ Hʲ(X,Ωⁱₓ)=0. This includes total degree 0 vacuously and imposes no geometrical connectedness condition.

The degree inequality is ≤3. The off-diagonal condition is essential.

A proof route is as follows. For m=i+j equal to 1 or 3 use the zero étale group. For m=2 use the ℚ₇(−1)-description: (C₇(i)⊗ℚ₇(−1))^G is zero unless i=1. Use the Hodge–Tate comparison and faithful scalar extension ℚ→ℚ₇ to conclude the coherent ℚ-space is zero. Total degree 0 has no pair with i≠j. This proof uses no Hodge symmetry or projectivity.

(Fontaine93, Theorem 1, Remark (a) and §2.1, printed pp. 3–5.)

**Checks.**

- For ℙ² the eight off-diagonal pairs in total degree at most three, (1,0),(0,1),(2,0),(0,2),(3,0),(2,1),(1,2),(0,3), all have dimension zero by the projective-space formula; an assertion allowing a nonzero one would fail this instance.
- For ℙ¹, h¹¹=1 with total degree two, so dropping i≠j gives the false value zero.
- For the empty scheme every coherent cohomology group has one element and dimension zero. For ℙ², h²²=1 has total degree four and lies outside the assertion; the pair (0,0) is diagonal and imposes no condition.

*Needs:* §0.1 and native differential sheaf/cohomology for the statement; §§0.2, 3.1, PadicHodgeTheory §§3.3–3.5 and SchemeAndStackFoundations §2.6 for comparison and faithful coefficient extension.

### 3.3 The global integral-model specialization

If 𝓧 is a proper smooth scheme over ℤ and X=𝓧_ℚ, then Hʲ(X,Ωⁱₓ)=0 for i≠j and i+j≤3. More generally independent proper smooth ℤₚ-scheme models for every p suffice, without constructing a global ℤ-model.

A proof route is as follows. Base change each model to W(F̄ₚ). Apply the vanishing theorem; do not assert a reverse globalization of local models.

(Fontaine93, Theorem 1 and Remark (a), printed p. 3.)

**Checks.**

- For ℙ¹_ℤ the local models are its base changes and h¹⁰=h⁰¹=h²⁰=h⁰²=0, while h¹¹=1 remains allowed.
- For Spec ℤ, the generic point has h⁰⁰=1 and all positive Hodge groups zero.
- For y²=x³−x the prime-three model exists since Δ=64 is a unit, but at two v₂(Δ_min)=6. A single ℤₚ model cannot satisfy the universal hypothesis.

*Needs:* §§0.1, 3.2; Mathlib base-change stability of `IsProper` and `Smooth` for each integral model.

### Examples

For ℙ¹, (h⁰⁰,h¹¹)=(1,1) and all off-diagonal terms vanish. At q=2 its H² and dual eigenvalues are 2 and 1/2. Two rational points replace h⁰⁰=1 by 2 without changing any positive-degree conclusion.

### Dependencies

Layers 0 and 2; DeligneWeightsAndPurity §§0.8–0.9, 7.15; PadicHodgeTheory §§3.2–3.5, 8.1; SchemeAndStackFoundations §§0.9, 0.11, 2.6.


## Layer 4: K3 bad reduction and geometric examples

### 4.1 The K3 Hodge obstruction has dimension one

For X/ℚ whose geometric base change satisfies the shared K3 predicate of K3SurfacesAndSymplecticBoundedness §1.1, apply that roadmap’s §§1.4 and 2.4 to obtain dim_ℚ H⁰(X,Ω²)=1. Its §1.2 field-extension theorem allows this formulation from geometric K3 base change. This calculation uses the smooth proper surface and geometric canonical triviality, without a descended choice of volume form.

The shared predicate requires smooth relative dimension two, properness, geometric integrality, trivial canonical line and H¹(O)=0; its §1.3 supplies projectivity.

(Schroeer23, Proposition 5.5 proof, printed p. 16; K3SurfacesAndSymplecticBoundedness §§1.4, 2.4.)

**Checks.**

- Over ℚ̄ a trivial canonical line has H⁰ of dimension one, so field base change gives dim_ℚ H⁰(Ω²)=1 as well.
- Rescaling a nonzero geometric two-form by 2 changes the chosen section and leaves the dimension equal to one; the zero form cannot trivialize the canonical line.
- An abelian surface has h²⁰=1 and h¹(O)=2, whereas a K3 surface has h¹(O)=0. The Hodge invariant alone is not a definition of K3.

*Needs:* K3SurfacesAndSymplecticBoundedness §§1.1–1.4, 2.4 for the invariant and field-extension comparison; SchemeAndStackFoundations §2.6 for coherent base change.

### 4.2 A K3 surface has a bad prime over the unramified Witt ring

Prove `geometricK3_hasBadWittPrime`: let X/ℚ be smooth proper with geometric K3 base change in the shared predicate of K3SurfacesAndSymplecticBoundedness §1.1. The acceptance signature expands its five conditions on X_ℚ̄ directly: smooth relative dimension two, properness, geometric integrality, an isomorphism Ω²≅O, and H¹(O)=0. There is a rational prime p for which X has no proper smooth scheme model over W(F̄ₚ). In particular X cannot have proper smooth scheme models over ℤₚ for all p, nor be the generic fibre of a proper smooth ℤ-scheme.

A proof route is as follows. If all Witt models existed, Layer 3 at (i,j)=(2,0) would force H⁰(Ω²)=0. This contradicts the K3 dimension-one theorem. Negate the universal model property.

(Fontaine93, Theorem 1 and Remark (a), printed p. 3; Schroeer23, Proposition 5.5 proof, printed p. 16.)

**Checks.**

- At (i,j)=(2,0), 2≠0 and 2+0≤3; the two conclusions are dimensions zero and one, giving a contradiction.
- The empty scheme has h²⁰=0 and fails geometric integrality, so it supplies no counterexample to the K3 assertion.
- A smooth quartic geometric K3 has h²⁰=1 and hence some bad Witt prime; the theorem does not name that prime or require it to be different from two.

*Needs:* §§0.1, 3.2, 4.1; K3SurfacesAndSymplecticBoundedness §1.1 for the shared geometric predicate.

### 4.3 Projective space tests the exact endpoint

Apply CrystallineCohomology §CR.3.5 to ℙⁿ_ℚ: for every natural i,j, Hʲ(ℙⁿ,Ωⁱ) is ℚ if i=j≤n and zero otherwise. The standard ℙⁿ_ℤ-model gives everywhere Witt good reduction. When n≥1, h¹¹=1 demonstrates the off-diagonal hypothesis. When n≥2, h²²=1 has total degree four; this diagonal value makes no claim about the truth of an off-diagonal degree-four extension.

(CrystallineCohomology §CR.3.5, projective-space Hodge computation; Fontaine93, §2.1, printed p. 4, for its compatibility with the endpoint.)

**Checks.**

- For n=0 the only nonzero value is h⁰⁰=1. For n=1, h¹¹=1 and h²⁰=0, so the off-diagonal qualifier is visible.
- For n=2, h²²=1 and h¹²=h²¹=0; an asserted vanishing of every total-degree-four group would be false.
- For i>n the exterior differential sheaf is zero and hence every Hʲ is zero, including j=0. Its value is not the i-th exterior power of the space of global one-forms.

*Needs:* §§0.1, 3.2; CrystallineCohomology §CR.3.5 for the Hodge computation; Tau Ceti Tate Hodge pieces for the sign check.

### Examples

For a geometric K3 surface, h²⁰=1 conflicts with the required value zero. For ℙ², (h⁰⁰,h¹¹,h²²)=(1,1,1) meets every low-degree off-diagonal vanishing statement. The abelian surface check separates the K3 hypothesis from the broader existence of a two-form.

### Dependencies

Layers 0 and 3; K3SurfacesAndSymplecticBoundedness §§1.1–1.4, 2.4; SchemeAndStackFoundations §2.6; CrystallineCohomology §CR.3.5; Tau Ceti abstract Tate Hodge pieces.

## Downstream consumers

EnriquesSurfacesAndIntegralNonexistence §3.13 needs, through its low-degree Hodge contract, exactly the ℤₚ-model form §3.3 and the K3 form §4.2, after constructing in §3.11 a geometric K3 generic fibre and compatible proper smooth projective ℤₚ-scheme models at every prime. The supplied endpoint is the Witt-local form of §3.2; its base-change corollary §3.3 accepts the ℤₚ models directly. Covers, twisting and matching remain entirely within that consumer. Applications to other proper smooth rational schemes consume §3.2 with their own local scheme witnesses.

## Worked examples

The totally complex field F attached to a simple object and χ₇ has degree 6n′≤287. If 7 divides n′, write n′=7n″. Then n″≤6, so the seven-Sylow count dividing n″ and congruent to one modulo seven is one. Its fixed field is tame of degree at most 36, so rd≤7^(35/36)<6.93, and the supplier’s row (b) gives 6n″≤10, hence n″=1. Nonzero invariants of the normal seven-subgroup and simplicity contradict faithfulness of the combined action. If F is tame from the outset, its inertia order divides 7^f−1 and is at most 143, so rd(F)≤7^(142/143)<6.93 and the same degree argument gives F=ℚ(ζ₇). This uses the base bound 287 rather than the stronger table value 208 in Fontaine93 §2.4 (Fontaine93, Lemma 2, printed p. 6).

For a nonsplit mod-seven extension with quotient exponent i<j, twist by −i and set a=j−i. The global field has degree 42. In the unramified relative case its discriminant exponent is 7·5=35, so rd=7^(35/42)=7^(5/6)<5.72, incompatible with degree 42 and the supplier degree-eight row. In the ramified case the weight-a bound gives a Serre upper break at most a/6 over ℚ₇; passage through the degree-six tame base gives 0<b≤a. Tame conjugation gives b≡a mod 6. For a=1,2, therefore b=a, full inertia has order 42, and the integer different exponent is 41+6a. Equivalently in the tower, 7·5+6(a+1)=41+6a. The global discriminant has this same exponent because the unique prime has residue degree one. For a=1,2, the exponents are 47 and 53, with root discriminant below 12; degree 42≥36 gives a contradiction. For a=3, exponent 59 gives root discriminant above 12, so the argument retains exactly the oriented splitting exception. These are substitutions into the supplied discriminant bounds, not a class-number computation (Fontaine93, §2.5).

A local rank-one filtered object fixes the inertia exponent, while an unramified twist can remain: χⁱλ and χⁱ have identical inertia if λ is unramified. In the global cyclic case their ratio is unramified at every finite prime; its finite kernel field is ℚ by Minkowski’s theorem, Mathlib `NumberField.finrank_eq_one_of_unramified`, so λ=1. This is the necessary step from local inertia to the full scalar action at every seven-power level (Fontaine93, §2.6).

At q=2, the dual H² of ℙ¹ has characteristic polynomial T−1/2. A nonzero grade χⁱ has eigenvalue 2^(−i); purity forces 2^(−i)=2^(−m/2), hence m=2i. The case m=2 admits only i=1; all other grades vanish and the unique grade is the original space. Thus the action is scalar before semisimplification. A pure Jordan block with eigenvalue 1/2 would satisfy the spectral condition but fail the scalar-grade conclusion; purity alone does not rule it out (Fontaine93, §2.1, printed p. 4; DeligneWeightsAndPurity §§0.8–0.9).

## References

- **Fontaine93.** Jean-Marc Fontaine, [Schémas propres et lisses sur Z](https://www.imo.universite-paris-saclay.fr/~fontaine/Zschemas.pdf), Proceedings of the Indo-French Conference on Geometry (1993), pp. 43–56. Locators use the author preprint 91-02, printed pp. 1–13; PDF page is printed page plus one. Theorem 1 and Remark (a), p. 3; Proposition 1, p. 4; Proposition 1′ and Lemmas 1–4, §§2.2–2.7, pp. 5–8; Theorem 2 and §§3.1–3.8, pp. 3, 8–12.
- **Schroeer23.** Stefan Schröer, [There is no Enriques surface over the integers](https://www.math.uni-duesseldorf.de/~schroeer/publications_pdf/EnriquesOverIntegers_Juli2022.pdf), Annals of Mathematics 197 (2023). Locators use the author revision dated 19 July 2022: Proposition 5.5 and proof, pp. 15–16, especially the K3 obstruction on p. 16. Its proceedings-page citation of Fontaine is translated here to the author scan’s pagination.
- **LMFDB32a3.** LMFDB Collaboration, [Elliptic curve 32.a3, Cremona 32a2](https://www.lmfdb.org/EllipticCurve/Q/32/a/3), database entry (2026). Minimal equation and invariants; local reduction at two. Only numerical data enter the elliptic Check; reduction implications use the EllipticCurves supplier.
