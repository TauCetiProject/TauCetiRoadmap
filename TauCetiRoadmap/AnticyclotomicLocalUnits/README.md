# Roadmap: signed anticyclotomic local units

**Summary.** This is ColemanPowerSeries, Part II in the inert supersingular anticyclotomic direction. ColemanPowerSeries treats multiplicative cyclotomic interpolation and its explicit arithmetic comparisons; this roadmap extends the method to the height-two Lubin–Tate module over an unramified quadratic p-adic field. It builds the rank-two local-unit quotient, its signed Coates–Wiles kernels, the actual formal Kummer duality and signed annihilators, an optimal plus unit from early CM values, and a primitive local trace system from a modular parametrization. These yield Rubin’s integral signed decomposition and nonvanishing of every matching-parity derivative of every signed generator. Finite signed Kummer images are exported on the same carriers.

## Scope and ownership

This roadmap owns the arithmetic inverse limit and its ω-component, the inverse-twisted anticyclotomic quotient, height-two Coleman interpolation, its invariant derivatives, the signed unit and point submodules, their arithmetic duality and reciprocity comparisons, the two independent primitive existence arguments, the local trace system, minus-point cohomology, and the integral decomposition. The auxiliary rational elliptic curve is used to produce local points. Global Heegner-point systems, global Selmer groups and signed p-adic L-functions belong to the downstream roadmaps named below.

The general objects below have these owners; the targets here are their arithmetic applications.

- The unit filtration, its compact-open topology, the principal-unit pro-p theorem and the formal-to-elliptic point homomorphism are already in Tau Ceti. LocalFieldsRamification Layer 1 specifies their local-field interface; ProfiniteArithmetic §1.3 supplies continuous p-adic scalar powers. No second filtration, formal-point homomorphism or scalar-power construction is defined here.
- The completed group algebra and its compact-module action are already in Tau Ceti. PadicMeasuresIwasawaAlgebras §§1.7, 4.2–4.5 and 5.2 supply measure comparison, coefficient extension, the continuous one-variable O-coordinate with generator comparison, one-variable ring and module structure, and topological Nakayama. SelmerIwasawaCohomology §3.0 owns multivariable coordinates, regular sequences, closed-subgroup quotients and continuous character twists. CompletedCohomologyPartII §§3.1–3.2 owns continuous coefficient duals and compact/discrete biduality. The generic algebra and generic ring-theoretic generation criterion are not targets here. Section 8.1 applies them to the actual derivative and optimal unit.
- IntegralIwasawaTheory §7.1 owns the multiplicative determinant norm and unramified cyclotomic interpolation; ColemanPowerSeries Layer 1 supplies its explicit norm/evaluation refinements. Section 1.1 differs by its height-two formal module, rank-p² scalar algebra and π-division points.
- LubinTateFormalModulesAndQuasiCanonicalLifts LT.0–LT.2 own formal O-modules, logarithms, torsion, Tate modules and reciprocity; LT.4 owns the scalar-Frobenius and unramified Honda comparison; LT.5–LT.8 own integral lattice quotients, quasi-canonical fields, neighboring lattices and the tame/anticyclotomic field comparisons; LT.9 owns formal traces. Section 5.3 applies scalar Frobenius to cyclic-level subgroup descent, §6.1 builds modular images of the supplied quotients, and §6.3 identifies their supplied lattice orbits with the Hecke trace. None rebuilds those foundations.
- NonordinaryCMSpecialValues NCM.0–NCM.4 own canonical CM characters, early normalized zeta classes, semilocal comparisons, root numbers and Finis’s unit-value specialization; NCM.5 owns the canonical unramified coefficient and scalar-to-tensor comparison. Section 4.1 owns the auxiliary field, §4.2 the local-unit projection composite, §4.3 the Coleman/dual-exponential normalization, and §§4.4–4.5 their application before signed freeness.
- The cyclic Tate and Herbrand formalism is already in Tau Ceti. ClassFieldTheory Layers 5–8 own local duality and local reciprocity. ArithmeticGaloisDuality §§R02.1.2–R02.1.3 own coefficient limits. The finite affine Cartier-dual functor is already in Tau Ceti. Section 2.1 owns its comparison with the specific formal division sequence and its obstruction maps, not generic Cartier duality or a new continuous-cohomology carrier.
- ModularCurves Layers 5, 8–9 own affine fine level, cyclic subgroups and coarse stabilizers. ModularCurvesPartII §§3.2, 3.9, 5.2–5.3, 9.9–9.11, 13.2, 13.7 and 16.6 supply composite-level compactifications, good models, correspondences, differential lattices and genuine modular quotients. The genus formula is stated by ModularForms Layer 10B; SchemeAndStackFoundations §3.2 owns scheme Riemann–Hurwitz with different multiplicities, including wild ramification. EllipticCurveModularity R29.5–R29.6 owns the genuine modular parametrization and unconditional modularity. Section 5.2 applies the Manin-unit theorem at a good prime; its integral congruence comparison is the explicit contract below.
- EllipticCurves Layers 1, 3–5 own isogenies, finite-field Frobenius, reduction and twists. Their finite-field extension requested below supplies trace-class counts and scalar-Frobenius representatives; ModularCurvesPartII §12.1 supplies the weighted supersingular mass and exceptional-j criteria. Section 5.4 applies these inputs without introducing a second supersingular predicate. ImaginaryQuadraticClassNumber H1–H2 owns forms, class numbers, splitting and the analytic class-number formula. The extra upper estimate needed for §4.1 is a supplier contract, not a new analytic-number-theory layer.

## Conventions

Fix a prime p≥5. Let Φ/ℚ_p be the unramified quadratic extension, O its native integer ring, and π=−p. All field embeddings are fixed in one algebraic closure and its completed algebraic closure ℂ_p. Every auxiliary coefficient field is a specified finite extension of Φ in this closure, with its native integer ring; neither ℂ_p nor an arbitrary ramified coefficient algebra replaces O in an integral assertion. The theorem is uniform for all such p and Φ, including p=5,7,11. It has no restriction to a congruence class or to primes above a numerical threshold. The height-two arithmetic is a specialization; generic suppliers retain their own wider hypotheses.

Use the supplied Lubin–Tate formal O-module F for π, with normalized logarithm λ′(0)=1 and free rank-one Tate module T=T_πF. Formal points F(L) mean points in the maximal ideal of the native integer ring of L. Formal addition, scalar multiplication and traces use this formal module. A notation such as pⁿF(L) means formal multiplication, not ordinary coordinate multiplication. The π-adic basis satisfies [π]v_(n+1)=v_n; if w is a p-adic basis, then v_n=[(−1)^n]w_n up to a single fixed O-unit. For the two consecutive levels n=0,1, [−p](−w_1)=w_0, whereas [−p]w_1=−w_0 (BKO21 §2, footnote 2, p.948; BKO21 line 272).

Write Φ_n=Φ(F[π^(n+1)]), Δ=Gal(Φ_0/Φ), ω=κ|Δ, and Γ=Gal(Φ∞/Φ_0)=Γ⁺×Γ⁻. The supplied character κ is the actual Tate action. Arithmetic reciprocity sends a uniformizer to arithmetic Frobenius and satisfies κ(Art_Φ(u))=u⁻¹ on Oˣ. Thus an Artin unit a acts on T by a⁻¹ and on its inverse twist by a, and χ_cyc(Art_Φ(u))=N_(Φ/ℚ_p)(u)⁻¹ (ClassFieldTheory §2.6). PadicHodgeRegulators normalizes by geometric reciprocity rec_geo(u)=Art_Φ(u)⁻¹; its supplier contract below fixes the conversion used in §4.3. Conjugation c of Φ/ℚ_p fixes Γ⁺ and inverts Γ⁻: for u∈Γ⁻, c u c⁻¹=u⁻¹, and the product is 1. These comparisons are fixed by LubinTateFormalModulesAndQuasiCanonicalLifts LT.2 and LT.8 and ClassFieldTheory §§2.5–2.6, Layer 7.

Use Θ_n=Φ_n^Δ and Ψ_n=Θ_n^(Γ⁺), so [Θ_n:Φ]=p^(2n), [Ψ_n:Φ]=pⁿ and Θ_0=Ψ_0=Φ. The full first tame degree is p²−1, while the primed ring-class tame degree is p+1: at p=5 these are 24 and 6. Put Λ₂=O[[Γ⁺×Γ⁻]] and Λ=O[[Γ⁻]], on the native completed group algebra. A quotient of a compact module uses the closed relation image. Completed actions are continuous and all compact modules are Hausdorff. Discrete point modules used in continuous cohomology have the discrete direct-limit topology, even though each finite extension of Φ also has its valued topology.

A star means Hom_O(T,−) with diagonal action, never a scalar dual without the Tate action. The additive continuous O-dual has values in Φ/O; Γ acts on a dual by precomposition with g⁻¹. Over the unramified coefficient O, the trace pairing to ℚ_p/ℤ_p uses the unramified different O. It must not be transported unchanged to ramified coefficients.

For finite anticyclotomic χ, c(1)=0 and c(χ)=r+1 when χ has exact order pʳ, r≥1. Let Ξ⁺ and Ξ⁻ denote even and odd conductor exponents. Unit signs kill the opposite parity; point signs kill the same parity. The two Fourier normalizations and covariances are distinct:

| Character at p=5 | c(χ) | Sign | Units forced to vanish | Points forced to vanish |
|---|---:|---|---|---|
| trivial | 0 | + | minus | plus |
| exact order 5 | 2 | + | minus | plus |
| exact order 25 | 3 | − | plus | minus |

The unit sum uses χ and π^(−n−1), giving χ⁻¹ covariance; the point sum uses χ⁻¹ and p^(−n), giving χ covariance. At χ=1, δ_1=(1+p⁻¹)δ, equal to 6δ/5 at p=5, while λ_1(y)=λ(y) on base points. Every character sum is taken over the stated finite quotient, and every level is large enough for its inputs. The logarithmic derivative divides by the nonzero unit value and by the nonzero invariant differential. The real circle constant in the class-number estimate is π_real; it is unrelated to −p.

Native carriers use their library universes; finite extensions, finite quotients and character fields are taken inside the fixed closures, and direct or inverse limits have countable cofinal systems. No cardinality claim uses the total natural cardinal of an infinite object, and no negative index or formula p^(s−1)(p+1) is evaluated at s=0.

## Exact supplier contracts

### From Mathlib

For §4.1 use `NumberField`, `Module.finrank`, `NumberField.IsTotallyComplex`, `NumberField.RingOfIntegers`, `Ideal.span`, `Ideal.IsPrime` and `NumberField.classNumber` on their native carriers. A degree-two totally complex number field is imaginary quadratic; the principal-ideal clauses specify splitting and inertness without a separate splitting predicate.

Use `PowerSeries.coeff` and `PowerSeries.constantCoeff` from Mathlib/RingTheory/PowerSeries/Basic.lean, `PowerSeries.derivative` from Mathlib/RingTheory/PowerSeries/Derivative.lean and `PowerSeries.isUnit_iff_constantCoeff` from Mathlib/RingTheory/PowerSeries/Inverse.lean. The derivative is formal; convergence and evaluation at division points are separate hypotheses supplied in the Lubin–Tate analytic comparison. The unit criterion is over a ring and concerns the actual constant coefficient. Native `Submodule`, `LinearMap`, `TensorProduct`, `Algebra.norm` and `Algebra.trace` are used with their specified algebra and scalar-tower instances. Use `IsGalois.normalBasis` and `IsGalois.normalBasis_apply` in Mathlib/FieldTheory/Galois/NormalBasis.lean for finite Galois extensions, including the required finite-dimensionality. Finite projective modules over a commutative local ring are finite flat and hence free, via `Module.free_of_flat_of_isLocalRing` in Mathlib/RingTheory/LocalRing/Module.lean.

### From Tau Ceti

Use `TauCeti.unitFiltration` and `TauCeti.unitFiltration_one` in TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean. Their setting includes a field, a valuation relation, its topology and a nonarchimedean local-field instance; the subgroup body is a congruence kernel transported from integer-ring units. The body does not bundle a pro-p proof or a completed scalar action. Use `TauCeti.isOpen_unitFiltration`, `TauCeti.isCompact_unitFiltration` and `TauCeti.hasBasis_nhds_one_unitFiltration` in the same file for the topology, and `TauCeti.isProP_unitFiltration_succ` and `TauCeti.unitFiltration_one_isProP` in TauCeti/NumberTheory/LocalField/UnitFiltration/ProP.lean for positive-depth pro-p structure when the residue characteristic is p.

Use `TauCeti.IsProP.module` and `TauCeti.IsProP.continuousSMul_module` in TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.lean on the supplied abelian pro-p principal groups. Use `TauCeti.completedGroupAlgebra`, its projections, constructor and extensionality from TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean. This is an inverse limit of finite-quotient group algebras over the specified coefficient ring; the carrier definition alone does not assert compactness of arbitrary R. Use `TauCeti.IsCompactModule.completedGroupAlgebraModule` and `TauCeti.IsCompactModule.continuousSMul_completedGroupAlgebraModule` from its Module.lean with compact-module and continuous-action hypotheses. PowerSeries.lean supplies the procyclic ℤ_p coordinate; it is not an O-coefficient two-variable comparison.

Use `WeierstrassCurve.formalPointHomAdicCompletion` and `WeierstrassCurve.formalPointHomAdicCompletion_injective` in TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean, and `WeierstrassCurve.range_formalPointHomAdicCompletion` in TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/Range.lean. The source is the native maximal-ideal formal-point group and the target is the affine elliptic point group over a height-one completion of a Dedekind domain, with the curve elliptic. The image is zero together with the points satisfying 1<Valued.v(xCoord). Use also `WeierstrassCurve.range_formalPointHomAdicCompletion_eq_kerReduction` and `WeierstrassCurve.formalPointAddEquivKerReduction` in TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/KerReduction.lean for the image/actual-reduction-kernel identification. A general complete local field is not silently substituted for this completion.

Use `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality` and `TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDual` from TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean. This is affine finite locally free Cartier duality over an arbitrary commutative base ring; it does not identify F[π^k] with its own dual.

Use `TauCeti.TateCohomology.H0IsoNormQuotient` and `TauCeti.TateCohomology.HNegOneIsoNormKernelQuotient` in TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean for Ĥ⁰=M^G/NM and Ĥ⁻¹=ker N/I_GM on representations over a commutative ring of a finite group. For a finite cyclic group, `Rep.FiniteCyclicGroup.periodicIso` in Periodic.lean identifies Ĥ⁻¹ with H¹ and I_GM=(g−1)M for a generator g. Use `TauCeti.TateCohomology.herbrandQuotient`, `TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite`, `TauCeti.TateCohomology.herbrandQuotient_eq_natCard_H2_div_natCard_H1`, `TauCeti.TateCohomology.herbrandQuotient_eq_mul_of_shortExact` and `TauCeti.TateCohomology.herbrandQuotient_eq_of_finite_kernel_of_finite_cokernel` in HerbrandQuotient.lean in that directory. Multiplicativity requires finite degree-minus-one Tate groups on both outer terms of the short exact sequence; invariance requires a morphism with finite kernel and cokernel. The quotient is a rational number totalized by `Nat.card`: it is zero if either defining Tate group is infinite. Section 7.1 proves finiteness before using its classical cardinality ratio.

### From TauCetiRoadmap.LocalFieldsRamification and TauCetiRoadmap.ProfiniteArithmetic

LocalFieldsRamification Layers 0–3 supply native finite-extension fields, their integer rings, residue fields, principal-unit filtration/topology, pro-p property and ramification. ProfiniteArithmetic §1.3 supplies the continuous ℤ_p scalar action on abelian pro-p groups. At p=5 a degree-p² base scalar norm has exponent 25; finite Galois transport and coefficient tensoring retain that norm, not a guessed scalar endomorphism on arbitrary units.

### From TauCetiRoadmap.PadicMeasuresIwasawaAlgebras

Use §1.7 for the measure/completed-algebra comparison and coefficient extension, §§4.3–4.4 for one-variable O[[T]] ring properties and Weierstrass preparation, §4.2 for module structure, and §4.5 (its target `TauCeti.Iwasawa.exists_completedCoordinate` and continuous-coordinate API) for the coefficient-preserving O-coordinate, inverse continuity and generator comparison T↦(1+T)^a−1 for a∈ℤ_p×. Use §5.2 for compact inverse-limit exactness and topological Nakayama. Quotient duality always uses the actual compact topology and the discrete Φ/O-valued dual. The residual example Λ/(p,T)=𝔽_(p²) has cardinal p², equal to 25 at p=5.

What PadicMeasuresIwasawaAlgebras must provide (gap:compact-coefficient-duality): Finite free coefficient extension O → W commutes, as a topological module equivalence, with the compact inverse limits of §§0.2 and 2.3, including ℤ_p → O for the ambient principal-unit limit.

### From TauCetiRoadmap.SelmerIwasawaCohomology

Use §3.0's multivariable coordinate, augmentation regular sequence, closed-subgroup quotient and continuous character twist, specified there as iwasawaAlgebra_mvPowerSeries_equiv, iwasawaAlgebra_isRegular_augmentation and iwasawaAlgebra_twist. For O a complete DVR with finite residue field and Γ=Γ⁺×Γ⁻≃ℤ_p², these identify Λ₂ with O[[S,T]], a regular local domain of dimension three, and the closed Γ⁺ quotient with O[[T]], of dimension two. The twist Tw_κ sends σ−κ(σ) to κ(σ)(σ−1), preserving its quotient ideal up to the displayed unit.

What SelmerIwasawaCohomology must provide (gap:quadratic-coefficient-coordinates): Relative to §3.0's coordinates and twists, identify the two-variable coordinate under finite free unramified coefficient extension and changes of the selected Γ⁺ and Γ⁻ generators, and prove that specialization of the plus coordinate to zero equals PadicMeasuresIwasawaAlgebras §4.5's selected Γ⁻ coordinate.

### From TauCetiRoadmap.CompletedCohomologyPartII

Use §3.1's continuous O-dual D_t(M)=Hom_cont,O(M,Φ/O), discrete for compact Hausdorff linearly topologized M, with left action (g f)(m)=f(g⁻¹m). Use §3.2's evaluation biduality for compact inverse limits of finite π-primary O-modules and discrete π-primary torsion modules; O here is the unramified quadratic integer ring. Evaluation identifies D_t(M/(σ−1)M) with D_t(M)^σ for the closed relation image. On M=O with σ acting trivially, both sides are Φ/O; on M=O/π with trivial σ-action, both have p² elements, equal to 25 at p=5. The O-valued dual instead vanishes on O/π and cannot give this biduality.

### From TauCetiRoadmap.IntegralIwasawaTheory and TauCetiRoadmap.ColemanPowerSeries

IntegralIwasawaTheory §7.1 supplies `colemanSeriesBasis`, `colemanNorm`, `colemanTrace`, `localUnitNormLimit` and `colemanInterpolation` for the multiplicative cyclotomic tower over every finite unramified coefficient field, retaining the coefficient Frobenius in interpolation. ColemanPowerSeries Layer 1 supplies the explicit multiplication-matrix and norm/evaluation comparisons. The finite-free scalar structure has rank p there, whereas §1.1 proves rank p² for [π]_F; the multiplicative theorem is not quoted as height-two interpolation.

What IntegralIwasawaTheory must provide (gap:general-unit-norm-control): For any prime p, finite K/ℚ_p and abelian K∞/K with G=Δ×Γ, Δ finite of order prime to p and Γ≃ℤ_p^r, r≥1, put Z(F)=lim_(K⊆E⊆F, [E:K]<∞) lim_m Eˣ/(Eˣ)^(p^m), with norm transitions in E, and Z∞=Z(K∞); require, for K⊆F⊆F′⊆K∞ with Gal(F′/F)≃ℤ_p and σ∈G restricting to its topological generator, ker(N:Z(F′)→Z(F))=(σ−1)Z(F′), Z(F)/N Z(F′)≃ℤ_p with trivial G-action, and injectivity of σ−1 on Z(F′); moreover, for each nontrivial irreducible ℚ_p-character ψ of Δ, with idempotent e_ψ and A_ψ=e_ψℤ_p[Δ], K_n=K∞^(p^nΓ) and I_n=(γ_1^(p^n)−1,…,γ_r^(p^n)−1) for a ℤ_p-basis γ_i of Γ, require ker(Z∞,ψ→Z(K_n)_ψ)=I_n Z∞,ψ for every n≥0, identifying these coinvariants with the norm image in Z(K_n)_ψ.

### From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

Use LT.0 for the formal O-action and normalized logarithm, including inverse convergence on deep ideals; LT.1–LT.2 for Lubin–Tate construction, actual torsion, Tate module, κ and the local Artin comparison; LT.4 for the unramified Honda comparison with type p−εX² and parameter εp, and its elliptic specialization. Use LT.5–LT.6 for marked integral lattice quotients and descent; LT.7/bko-quasi-fields and LT.7/ringclass-galois for Ψ′_s with degree p^(s−1)(p+1), s≥1, and exact endomorphism order ℤ_p+p^sO. Use LT.7/lattice-neighbors for the one inward and p outward neighbors and their stabilizer orbits. Use LT.8/bko-character-data, LT.8/quadratic-directions, LT.8/bko-fields, LT.8/field-generator-comparisons and LT.8/sign-generator-comparison for the fixed fields, conductor filtration, κ/ω actions and the alternating π/p generators. Use LT.9 for formal traces, tame descent and the adjacent-field trace square. At p=5 the primed degrees 1,6,30 and the tame-fixed degrees 1,5,25 witness the shift.

What LubinTateFormalModulesAndQuasiCanonicalLifts must provide (gap:formal-point-completion-realization): Identify the unramified quadratic local field and every finite extension of Φ used for the elliptic formal-point comparison with a height-one completion of a number field, transporting integer rings, maximal ideals, the chosen elliptic model, formal logarithm, group law and the native formal-point homomorphism compatibly with the finite inclusions used here.

### From TauCetiRoadmap.ClassFieldTheory and TauCetiRoadmap.ArithmeticGaloisDuality

ClassFieldTheory Layer 5 supplies finite local Tate duality with the actual Cartier dual, evaluation cup product, coefficient trace and local invariant. Layers 6–8 supply local reciprocity, arithmetic Frobenius, the inverse action on units, norm/restriction adjunction and compatibility along finite towers. The coefficient trace in the unramified quadratic ring has Tr(1)=2, so no implicit scalar identification by trace alone is used.

ArithmeticGaloisDuality §R02.1.2 supplies Tate’s inverse-limit sequence including lim¹, and §R02.1.3 supplies cohomology of the discrete quotient W=T⊗ℚ_p/ℤ_p with W[p^k]≃T/p^k and its specified transitions. For T=T_πF this is the underlying finite free ℤ_p-lattice. The discrete A⁻ cocycle argument of §7.2 is proved on the actual point module and is not inferred from that finite-lattice coefficient theorem.

### From TauCetiRoadmap.NonordinaryCMSpecialValues and TauCetiRoadmap.PadicHodgeRegulators

NonordinaryCMSpecialValues NCM.0 supplies the good CM period, canonical root sign, auxiliary prime and its finite characters; NCM.1 supplies the early normalized zeta class, its reciprocity and norm-twist comparison; NCM.2 supplies the torsion/ring-class compositum, disjointness, semilocal splitting and inert −p comparison; NCM.3 supplies the conductor-dependent root sign and central vanishing; NCM.4 supplies Finis’s unit-value specialization with the inert correction terms zero and auxiliary Euler factors one. NCM.5/unramified-cm-coefficients supplies the precise canonical unramified coefficient and period field-of-definition comparison, and NCM.5/scalar-tensor-character-comparison supplies injectivity of tensor multiplication with the totally ramified LT field. Section 4.4 must first place the derivative and character values in that tensor. Arbitrary finite freeness is not the contract. For ramified W=O[ζ_p], ζ_p⊗1−1⊗ζ_p is nonzero before scalar multiplication and zero afterwards.

PadicHodgeRegulators §1.4 supplies the de Rham dual exponential H¹(K,V)→Fil⁰D_dR(V), with kernel H¹_g and the ordered positive adjunction to the exponential for V*(1); §1.7 supplies restriction/corestriction and trace compatibility. On the trivial representation the normalized map takes log χ_cyc to 1. Section 4.3 identifies this supplied normalization with the actual Coleman derivative; it does not take that identification as a definition.

The supplier's ordered pairing is normalized geometrically (PadicHodgeRegulators, Conventions). For u∈Φˣ let κ_Kum(u)∈H¹(Φ,ℚ_p(1)) be the Kummer class of the cocycle g↦gα/α on compatible p-power roots α of u, and let P be the supplier's ordered cup-product pairing followed by its invariant. For ψ∈H¹(Φ,ℚ_p)=Hom_cts(G_Φ,ℚ_p) the supplier fixes P(κ_Kum(u),ψ)=ψ(rec_geo(u)), which equals −ψ(Art_Φ(u)) in the arithmetic convention used here; interchanging the two degree-one entries gives P(ψ,κ_Kum(u))=ψ(Art_Φ(u)). The dual exponential is cup product with log χ_cyc and does not depend on the reciprocity normalization, so exp*(log χ_cyc)=1 in both conventions; renormalizing the invariant to arithmetic reciprocity would change the sign of P, and with it the duality side of the adjunction, but not exp*. Section 4.3 transports this ordered identity, the coefficient trace and the Cartier evaluation of §2.1 before it applies the adjunction.

### From TauCetiRoadmap.EllipticCurves

Use Layers 1, 3–5 for isogenies, finite-field point counts and Frobenius polynomials, good reduction and twists. In particular the p²-trace of a trace-zero curve over 𝔽_p is −2p, and its point count over 𝔽_(p²) is (p+1)². For p=5 these values are −10 and 36.

What EllipticCurves must provide (gap:supersingular-trace-classes): Extend Layer 3 by trace-zero existence over every 𝔽_p for p≥5, supersingular j rationality over 𝔽_(p²), and the twist-sensitive 𝔽_(p²)-isomorphism-class counts N(±2p)=(p+6−4(−3/p)−3(−1/p))/12, N(±p)=1−(−3/p) and N(0)=1−(−1/p), with scalar-Frobenius representatives.

### From TauCetiRoadmap.ModularCurves, TauCetiRoadmap.ModularCurvesPartII and TauCetiRoadmap.ModularForms

Use ModularCurves Layer 5 for fine affine point-level moduli, Layer 8 for cyclic prime-to-p subgroups and transport, and Layer 9 for coarse stabilizers. Use ModularCurvesPartII §§3.2, 3.9, 5.2–5.3 for arbitrary composite-level proper coarse models and good-prime smoothness, §§9.9–9.11 and 13.2 for geometric and integral Hecke actions, §12.1 (`gammaZeroPrime_mass`) for the weighted supersingular mass and the exceptional-j criteria, §13.7 for integral weight-two differentials and §16.6 for the genuine trivial-character quotient of J₀(N). ModularForms Layer 10B supplies the genus/index formula. These apply at N=27,32 as well as squarefree N. For those levels μ=N∏_(l|N)(1+1/l) is 36,48 and g_N=1.

What ModularCurvesPartII must provide (gap:mixed-level-disk-comparison): For arbitrary p∤NM with M≥6 and p∤φ(M), supply the mixed Γ₀(N),Γ₁(M) fine good model and the coarse-forgetful map on the chosen unramified locus, identifying completed local disks and their universal elliptic families compatibly with unramified coefficient extension and reduction, including the stabilizer-free loci at N=27,32.

What ModularCurvesPartII must provide (gap:good-model-hecke-comparison): Identify the integral T_p correspondence on these arbitrary composite-level good models with the geometric p+1 subgroup quotient correspondence, its transported prime-to-p marking and the Hecke action on the cusp-normalized modular quotient, compatibly with the tame/relative traces of its marked CM points.

What ModularCurvesPartII must provide (gap:integral-congruence-comparison): Extend §13.7 by the exact Néron-differential and q-expansion lattices, degree/congruence identity and p-unit cokernel comparison at p∤N used in AU96 Propositions 3.3–3.4 and Zagier’s Lemma 3.2, retaining optimality and integrality so that the good-prime Manin-unit theorem can be applied to every conductor N.

### From TauCetiRoadmap.SchemeAndStackFoundations

Use §3.2’s scheme Riemann–Hurwitz theorem for a finite generically étale morphism f:X→Y of smooth proper geometrically connected curves over a field: 2g_X−2=deg(f)(2g_Y−2)+deg(Different), where the different has the lengths of the relative differentials as multiplicities, also in wild ramification. After geometric base change every ramification point contributes at least one. Section 5.5 applies this to the good reduced parametrization with genus-one target; the good-model genus comparison and modular genus/index formula remain the inputs named above.

### From TauCetiRoadmap.EllipticCurveModularity

Use R29.5’s cusp-normalized modular parametrization X₀(N)→E through the genuine newform quotient and its pullback differential, and R29.6’s modularity theorem for every rational elliptic curve at its exact conductor. Choose the optimal representative before applying §5.2. Its good-prime Manin-unit assertion is proved here from the stated integral inputs, rather than included in an arbitrary parametrization contract.

### From TauCetiRoadmap.ImaginaryQuadraticClassNumber

Use H1.3’s reduced primitive form/class-group correspondence, H2.1’s splitting character, and H2.2’s class-number formula, with their actual discriminant and roots-of-unity constants.

What ImaginaryQuadraticClassNumber must provide (gap:quadratic-class-number-upper-bound): Extend H2.3 by the uniform upper estimate h(d)≤sqrt(|d|)(2+log|d|)/π_real for negative fundamental discriminants d≡1 modulo 8, with the specified real logarithm and circle constant, so that |d|<8p implies h(d)<p for every p≥53.

## How to read the build

Layers 0–1 build the arithmetic module and its signed derivative kernels. Layers 2–3 construct the genuine Kummer pairing, explicit reciprocity and Fourier annihilators, obtaining disjointness and rank bounds without assuming signed freeness. Layer 4 produces a primitive plus unit using the early CM coefficient comparison. Independently, Layers 5–6 produce a primitive formal point and its optimal local trace system. Layer 7 uses that system for the minus cohomology and free quotient. Layer 8 combines the two primitive inputs to prove the integral decomposition and every matching-character nonvanishing statement, then identifies finite signed Kummer images. Each subsection lists the inputs needed for its statement and the indicated proof route; the route does not impose unrelated earlier targets on another proof.

## Layer 0: The anticyclotomic unit module

All targets use the standing p≥5 unramified quadratic Lubin–Tate data. The principal groups use the native valued topology, the norm limit the compact topology, and the completed action the specified Galois action.

### 0.1 Conductor parity of anticyclotomic characters

For each finite continuous χ:Γ⁻→ℂ_p×, let c(χ)=0 for χ=1 and c(χ)=n+1 when χ first factors through Gal(Ψ_n/Φ), n≥1. Define Ξ⁺ by c even and Ξ⁻ by c odd. These are disjoint and exhaust the finite characters; conductor means the ideal p^c O, not the order of χ.

(BKO21, §2, p.948; BKO21 line 249.)

A proof route is as follows. Use the conductor filtration on the supplied fixed fields. A nontrivial character of exact order p^r first occurs on the quotient of order p^r, so c=r+1; inversion preserves that quotient.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- The exponent is the minimal ramification conductor, with c(1)=0.
- χ∈Ξ⁺ iff c(χ) is even, and χ∈Ξ⁻ iff c(χ) is odd.
- c(χ⁻¹)=c(χ); parity is preserved by coefficient embeddings and inversion.

**Checks.**

- At p=5 the trivial character has c=0 and sign +; exact order 5 has c=2 and sign +, while exact order 25 has c=3 and sign −. Using order parity gives the wrong middle sign.
- For a primitive order-25 character χ, χ⁻¹ has the same conductor exponent 3. The two sign sets are disjoint, and their union contains χ and χ⁻¹.
- At level zero the quotient Gal(Ψ_0/Φ) is trivial and has just the trivial character, with conductor ideal O=p⁰O; assigning conductor exponent 1 puts it in the wrong sign.

*Needs:* LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, LT.8.

### 0.2 The principal-unit limit and its omega component

Use `TauCeti.unitFiltration` at depth one for P_n⊆Φ_nˣ. Regard P_n additively with its continuous ℤ_p-action and define Ũ∞ as the norm inverse limit of P_n⊗_ℤ_p O, with its compact Hausdorff inverse-limit topology. Define U∞ as its ω-isotypic submodule, using e_ω=(p²−1)⁻¹Σ_(d∈Δ)ω(d)⁻¹d. The actual Galois action extends to Λ₂.

(BKO21, §2, p.948; BKO21 line 253.)

A proof route is as follows. Norms preserve the principal-unit filtration. Apply the supplied pro-p scalar action and compact completed action; finite-free tensor comparison transports the topology, identifying Ũ∞ with (lim_n P_n)⊗_ℤ_p O. The tame denominator is a unit because p∤p²−1.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- The n-th projection has codomain P_n⊗O and norm of projection n+1 equals projection n.
- Two compatible families are equal exactly when all finite-level coordinates agree.
- x belongs to U∞ iff d·x=ω(d)x for every d∈Δ.
- Finite-level group-ring projections of the completed action agree with the Galois action on principal units.
- A norm-compatible family u_n∈P_n⊗O gives a unique element of Ũ∞; applying e_ω gives its omega component, and e_ω fixes an omega-equivariant family.
- e_ω²=e_ω; it commutes with every norm and Γ-action. The zero family is the multiplicative identity at each principal-unit coordinate.

**Checks.**

- At depth one, a unit represented by 1+ϖ_n is principal and a Teichmüller unit with residue a≠1 is not. Compare with `TauCeti.unitFiltration_one`; the whole integer-ring unit group would include both.
- The zero additive family is the coordinatewise unit 1 and has norm 1. For a base unit a viewed in a degree-p² extension its norm is a^(p²), whereas a general nonfixed unit has a product of conjugates; after tensoring N(u⊗b)=N(u)⊗b.
- On an ω-eigenvector the projector is (p²−1)⁻¹(p²−1)=1; on an η-eigenvector with η≠ω its character sum is 0. The zero family projects to zero.

*Needs:* `TauCeti.unitFiltration`; `TauCeti.unitFiltration_one`; Tau Ceti completed-group-algebra modules (supplier contract); PadicMeasuresIwasawaAlgebras §5.2 (gap:compact-coefficient-duality); PadicMeasuresIwasawaAlgebras §§4.2–4.5; PadicMeasuresIwasawaAlgebras §5.2; LocalFieldsRamification Layer 1; ProfiniteArithmetic §1.3.

### 0.3 Two-variable omega-unit freeness

U∞ is a finite free Λ₂=O[[Γ]]-module of rank two, with its compact module topology.

(Rubin87, Proposition 1.1, p.407; Win80, §4, theorem (i),(iii), pp.91–92; §§5.2–5.5.3, pp.93–98; Rubin87 line 116; Win80 line 112; Win80 line 192; Win80 line 296.)

For the norm-control contract's general finite K/ℚ_p, G=Δ×Γ with Γ≃ℤ_p² and nontrivial irreducible ℚ_p-character ψ of Δ, prove for every n≥0 that Z∞,ψ/I_n Z∞,ψ is finite free over A_ψ of rank [K:ℚ_p]p^(2n), provided μ_(p∞)(K∞)={1} or ψ differs from the tame cyclotomic character. This finite-level freeness is a target here, with the same Win80 §§5.2–5.5.3 locator.

A proof route is as follows. Start with the norm-control contract's kernel/cokernel and coinvariant-to-norm-image identifications. Use finite local reciprocity, the logarithm lattice and the rational normal basis to compute the finite-level rank; show that the stated tame component has no p-power torsion, and use that A_ψ is a DVR to obtain finite freeness (Win80 line 301; Win80 line 321). Pass to the limit by topological Nakayama. For U∞ the base degree is two and ψ corresponds to ω; the cyclotomic tame character is ω^(p+1), distinct from ω.

**Checks.**

- At p=5 the tame exponents of ω and the cyclotomic character are 1 and 6 modulo 24, so the exceptional characters are different. Rank two gives finite coinvariant O-rank 2·5^(2n): 2 at n=0 and 50 at n=1.
- For the cyclotomic ℤ_p-extension F′/Φ, local reciprocity identifies Z(Φ)/N Z(F′) with ℤ_p, with trivial Galois action; it is nonzero. On a nontrivial tame character this quotient has component zero, while the trivial component remains ℤ_p. The norm-control contract therefore does not assert surjectivity on every tame component.
- At p=5,n=2 the nonexceptional rank is 2·5⁴=1250, and its π-torsion subgroup has cardinal 1. As a negative model, M=O with γ₊ acting by 6 and γ₋ by 1 has level-zero coinvariants O/(6−1)=O/5O, with 25 elements all killed by 5. The nonexceptional hypothesis excludes the cyclotomic Tate component represented by this model.

*Needs:* §0.2; ClassFieldTheory Layer 6; ClassFieldTheory Layer 8; PadicMeasuresIwasawaAlgebras §§4.2–4.5; PadicMeasuresIwasawaAlgebras §5.2; IntegralIwasawaTheory §7.2 (gap:general-unit-norm-control); Mathlib normal basis.

### 0.4 The inverse Tate twist

For the arithmetic compact O-modules in §0.2, specialize the O-linear Hom construction to M*=Hom_O(T,M), with (g·h)(t)=g(h(g⁻¹t)). Evaluation at an O-basis v of T is an O-linear equivalence M*→M. In this equivalence g acts as κ(g)⁻¹ times its action on M, and U∞*=(Ũ∞*)^Δ. No evaluation equivalence is asserted for a nonbasis vector.

(BKO21, §2, p.948; BKO21 line 265.)

A proof route is as follows. Evaluate the actual Hom at a Tate basis. A basis change v↦bv changes evaluation by b, and the inverse action on the argument contributes κ⁻¹. Specialize the tame projector before taking invariants.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- Evaluation at an O-basis v:T gives an O-linear equivalence M*→M; its inverse sends m to the unique linear map taking v to m.
- Under evaluation at v, g acts by κ(g)⁻¹ times its action on M.
- Replacing v by bv changes evaluation to b times the old evaluation, b∈O×; evaluations compose with all O-linear equivariant maps.
- Two O-linear maps T→M agree iff they agree at a chosen O-basis vector; evaluation is an equivalence only for a basis vector, not for an arbitrary v∈T.
- An O-linear equivariant map M→N induces M*→N* by postcomposition, preserving identities, composition and the compact topology.

**Checks.**

- On trivial M=O, a group element with κ(g)=a acts on evaluation by a⁻¹. At a=2 in the coefficient field the factors are 1/2 and 2, distinguishing inverse from direct twisting.
- On the ω-eigenspace at a tame d, the combined factor is ω(d)·ω(d)⁻¹=1. Without the twist it remains ω(d).
- For h(v)=b, evaluation at −v is −b and evaluation at the nonbasis vector pv is pb. The latter is not an equivalence O→O, since 1 is outside its image.

*Needs:* §0.2; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2.

### 0.5 The twisted anticyclotomic quotient

For a topological generator σ of Γ⁺, define V∞=U∞/(σ−κ(σ))U∞ and V∞*=U∞*/(σ−1)U∞*. Use the closed images, and the completed quotient action, so V∞ and V∞* are compact finite free Λ=O[[Γ⁻]]-modules of rank two. Inverse twisting commutes with this quotient and the quotients are independent of σ.

(BKO21, §2, p.948; BKO21 line 260.)

A proof route is as follows. Twist the completed action by κ⁻¹. In two power-series coordinates the closed relation becomes S=0. Specializing Λ₂² therefore gives Λ². Replacing σ by σ^a, a∈ℤ_p×, changes the defining generator by a unit, since its linear coefficient is a unit.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- A continuous O-linear equivariant map from U∞* factors uniquely through V∞* iff it kills (σ−1)U∞*.
- (U∞/(σ−κ(σ))) * identifies with U∞*/(σ−1), compatibly with quotient maps.
- The identity on U∞ induces the canonical quotient equivalence for σ and σ^a, for a∈ℤ_p×.
- The canonical map U∞*→V∞* is continuous and surjective; q(x)=q(y) iff x−y∈(σ−1)U∞*.
- The induced Γ⁻ action commutes with q, and q(σx)=q(x); use the existing quotient-module map and equality API.

**Checks.**

- The specialization of Λ₂² by the cyclotomic coordinate is Λ² of rank 2; rank 1 loses a basis vector.
- On the untwisted quotient, σ−κ(σ) acts by 0, while σ−1 acts by κ(σ)−1, generally nonzero. On the inverse twist σ−1 acts by 0.
- For σ′=σ^(1+p), expand the quotient (σ^(1+p)−κ(σ)^(1+p))/(σ−κ(σ)) in Z=σ−κ(σ): its constant term is (1+p)κ(σ)^p, a unit. After the character twist and division by κ(σ)^p, its augmentation is 1+p, equal to 6 at p=5. The two values use different coordinates.

*Needs:* §0.3; §0.4; Tau Ceti completed-group-algebra modules (supplier contract); PadicMeasuresIwasawaAlgebras §§4.2–4.5; PadicMeasuresIwasawaAlgebras §5.2; SelmerIwasawaCohomology §3.0 (gap:quadratic-coefficient-coordinates).

### Examples

At p=5, [Φ_0:Φ]=24 and Ψ_0=Φ; the first wild anticyclotomic degree is 5. The ω-projector acts as 1 on its own eigenspace and 0 on a distinct tame character. A change of plus generator by the unit 6 preserves the quotient ideal. In the supplied one-variable O-coordinate γ maps to 1+T and level zero sends T to 0; the parameter associated to γ⁶ is (1+T)⁶−1=6T+15T²+20T³+15T⁴+6T⁵+T⁶, with unit linear coefficient 6. The two-variable comparison specializes its plus coordinate S to 0 and gives that same Γ⁻ coordinate.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: Mathlib normal basis; PadicMeasuresIwasawaAlgebras §§1.7, 5.2 (gap:compact-coefficient-duality); LubinTateFormalModulesAndQuasiCanonicalLifts LT.2, LT.8; `TauCeti.unitFiltration`; `TauCeti.unitFiltration_one`; Tau Ceti completed-group-algebra modules (supplier contract); PadicMeasuresIwasawaAlgebras §§4.2–4.5; PadicMeasuresIwasawaAlgebras §5.2; LocalFieldsRamification Layer 1; ProfiniteArithmetic §1.3; ClassFieldTheory Layer 6; ClassFieldTheory Layer 8; IntegralIwasawaTheory §7.2 (gap:general-unit-norm-control); LubinTateFormalModulesAndQuasiCanonicalLifts LT.2; SelmerIwasawaCohomology §3.0 (gap:quadratic-coefficient-coordinates).

## Layer 1: Coleman derivatives and signed units

Use the actual norm limit and Tate basis of Layer 0. Characters are finite continuous characters with values in a chosen finite extension; formulas at Φ_n require that the character factors at that level.

### 1.1 Lubin–Tate Coleman interpolation

Given a norm-compatible family u_n∈P_n and a basis v=(v_n) of T_πF, [π]v_(n+1)=v_n, there is a unique Coleman unit f_u∈O[[X]]× with f_u(v_n)=u_n for every n and N_F(f_u)=f_u, where N_F(f)([π]X)=∏_(w∈F[π])f(X[+]_F w). The association is multiplicative, continuous and equivariant; changing v to bv replaces f_u by f_u∘[b⁻¹]_F.

(BKO21, §2, p.948 and footnote 2; Rubin87 §2, pp.407–408; BKO21 line 272; Rubin87 line 124.)

A proof route is as follows. Use the parent determinant-norm method on the native series algebra with scalar structure given by [π]_F. Establish finite freeness of rank p², norm contraction, compact interpolation and Weierstrass uniqueness for the actual torsion values. This height-two construction is a target here; the parent multiplicative rank-p case is its input.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- The series relative to v evaluates to u_n at every v_n, with [π]v_(n+1)=v_n.
- The interpolating unit series is fixed by N_F, and the interpolation values determine it uniquely.
- The unit-series assignment is a continuous multiplicative map on the norm-compatible unit limit.
- For v′=bv, the new series is f_u∘[b⁻¹]_F, preserving evaluation at the new torsion basis.
- The interpolating series is uniquely determined by all finite values; coefficient extension and same-parameter formal coordinate change preserve these values.

**Checks.**

- The identity family u_n=1 has f=1 and N_F(1)=1; its derivative is 0. A nonidentity series with these values violates uniqueness.
- For v′=−v the interpolating value f_u([−1]_F(v′_n)) is u_n. For the additive formal group transported by Z=X+X², the formal inverse begins −Z+2Z², so coordinate negation alone gives the wrong quadratic term.
- If [p]w_(n+1)=w_n, then [−p]w_(n+1)=−w_n, whereas v_n=[(−1)^n]w_n satisfies [−p]v_(n+1)=v_n. At n=0 the two outputs are −w_0 and w_0.

*Needs:* §0.2; ColemanPowerSeries Layer 1; IntegralIwasawaTheory §7.1; `PowerSeries.derivative`; LubinTateFormalModulesAndQuasiCanonicalLifts LT.0–LT.2.

### 1.2 The Coates–Wiles derivatives

Use Ũ∞≃(lim_n P_n)⊗_ℤ_p O from §0.2 and first define the derivatives on Ũ∞*=Hom_O(T,Ũ∞). Relative to a Tate basis v, every element has a finite presentation x=Σ_i u_i⊗a_i⊗v⁻¹ with actual principal-unit families u_i. Put δ̃(x)=Σ_i a_i f_(u_i)′(0)/f_(u_i)(0)∈O and δ̃_n(x)=Σ_i a_i f_(u_i)′(v_n)/(λ′(v_n)f_(u_i)(v_n))∈Φ_n. Prove ℤ_p-balancedness, presentation independence and continuity on this ambient module. Define δ:U∞*→O and δ_n:U∞*→Φ_n by restricting to U∞*=(Ũ∞*)^Δ. These restrictions are independent of Tate basis, δ_n(gx)=gδ_n(x) for g∈Gal(Φ∞/Φ), and δ(gx)=δ(x). For r∈Λ₂, δ(rx)=aug(r)δ(x). The denominators f_(u_i)(v_n) and λ′(v_n) are nonzero: the first is a unit and λ′ is the invertible invariant differential on the open formal disk.

(BKO21, §2, pp.948–949; BKO21 line 270.)

A proof route is as follows. Multiplicativity and continuity of the interpolating series give additivity and ℤ_p-linearity of its logarithmic derivative on lim_n P_n. Apply the tensor universal property on the ambient module, then the tame projector; pure tensors need not themselves lie in the omega component. The identity λ′([b]X)[b]′(X)=bλ′(X) cancels the Tate-basis change. Differentiating the norm gives Tr_(Φ_(n+1)/Φ_n)δ_(n+1)=πδ_n. The value at zero has augmentation action.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- δ̃ and δ̃_n are continuous O-linear maps on Ũ∞*; δ and δ_n are their restrictions to the Δ-invariants.
- Put D_n(f)=f′(v_n)/(λ′(v_n)f(v_n)). On the projected generator e_ω(u⊗a)⊗v⁻¹, δ_n is a(p²−1)⁻¹Σ_(d∈Δ)ω(d)⁻¹D_n(f_(du)); δ is a f_u′(0)/f_u(0). These agree with applying the Δ-average to u⊗a⊗v⁻¹ in Ũ∞*. Finite sums of these projected generators span U∞*; arbitrary pure tensors inside U∞* are not presumed to span it.
- The simultaneous changes v→bv, a→ba, f→f∘[b⁻¹] leave δ and every δ_n unchanged.
- δ_n(gx)=gδ_n(x) and δ(gx)=δ(x); thus δ(r x)=aug(r)δ(x).
- Tr_(Φ_(n+1)/Φ_n)δ_(n+1)(x)=π δ_n(x).
- δ(0)=0 and δ_n(0)=0, where zero of the additive unit limit is the compatible family of multiplicative units 1.

**Checks.**

- For f=1, f′/(fλ′)=0, so δ=δ_n=0. A formula returning the constant coefficient gives 1 and fails.
- Under a change of coordinate with derivative 2, the ordinary logarithmic derivative and λ′ both multiply by 2; their ratio is unchanged. Dividing only by f leaves an erroneous factor 2.
- For basis change v↦−v the tensor scalar changes a↦−a and the derivative changes sign, so the product is a times the original derivative. Changing only one factor negates it.
- At p=5 let ζ have order 3 in O, with ζ∉ℚ₅, and let d act on the ℤ₅-module O by multiplication by ζ. In O⊗_ℤ₅ O the vector z=(1⊗1+ζ⊗ζ⁻¹+ζ²⊗ζ⁻²)/3 satisfies dz=ζz and has multiplication image 1. Each displayed pure summand fails dz=ζz, so restricting the recipe to pure eigenvectors misses this nonzero vector. Applying the ambient sum followed by the projector retains z.
- On a genuine omega eigenvector z_ω, the twisted tame average has multiplier (p²−1)⁻¹Σ_d ω(d)⁻¹ω(d)=1; on a different tame character its multiplier is 0. At p=5 these sums are 24/24=1 and 0/24=0, fixing the inverse weight in the projected-generator formula.

*Needs:* §1.1; §0.2; §0.4; PadicMeasuresIwasawaAlgebras §§1.7, 5.2 (gap:compact-coefficient-duality); `PowerSeries.coeff`; `PowerSeries.constantCoeff`; `PowerSeries.derivative`; LubinTateFormalModulesAndQuasiCanonicalLifts LT.0.

### 1.3 Character Coates–Wiles derivatives

For a finite character χ of Γ inflated to Gal(Φ_n/Φ), with values in a finite coefficient extension L/Φ and n large enough, define δ_χ(x)=π^(−n−1)Σ_(g∈Gal(Φ_n/Φ)) χ(g) gδ_n(x) in Φ_nL (or its compatible tensor realization). This value is independent of increasing n, is O-linear and satisfies δ_χ(gx)=χ(g)⁻¹δ_χ(x).

(BKO21, §2, p.949; Rubin87 Lemma 2.1, pp.407–408; BKO21 line 287.)

A proof route is as follows. Use the trace relation from §1.2 to compare adjacent admissible levels, and change variables in the weighted sum for inverse-character covariance. Extend coefficients through the specified embeddings.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- Evaluating at any larger admissible Φ_m yields the same value after the canonical embedding.
- δ_χ(r x)=r(χ⁻¹)δ_χ(x), for the completed character specialization.
- Coefficient embeddings transport δ_χ to the derivative for the embedded character.
- The finite sum gives an O-linear continuous map with δ_χ(0)=0; after descent to V∞* its Λ action is through χ⁻¹, and the quotient map computes the same value.

**Checks.**

- For an order-5 value ζ at p=5, changing variables gives the factor ζ⁻¹=ζ⁴ on δ_χ(gx); ζ⁴≠ζ.
- At p=5, n=0, the full tame sum is multiplied by π⁻¹=−1/5. Multiplication by p⁰=1 or by 1/24 is a different normalization.
- If the level-n weighted sum is A, the next is πA; π^(−n−2)πA=π^(−n−1)A. At p=5,n=0 both are −A/5.

*Needs:* §1.2; §0.1.

### 1.4 The trivial-character Euler factor and descent

At the trivial character, δ_1=(1−π⁻¹)δ=(1+p⁻¹)δ. Each δ_χ for χ on Γ⁻ kills (σ−1)U∞*, and hence descends to V∞*; so does δ. The descended δ is Λ-linear when O is a Λ-module via augmentation.

(BKO21, §2, pp.948–949 and proof of Theorem 5.8, p.960; BKO21 line 270; BKO21 line 793.)

A proof route is as follows. For h=f′/(fλ′), differentiate the norm identity to obtain Σ_(w∈F[π])h(w)=πh(0). Removing w=0 gives (π−1)h(0), then division by π gives 1−π⁻¹. An anticyclotomic character is trivial on Γ⁺, so inverse covariance kills σ−1. The nonzero Euler factor also gives descent of δ.

**Checks.**

- At p=5 the Euler factor is 1−(−5)⁻¹=6/5. Thus δ=1 gives δ_1=6/5, and both kernels are zero on this one-dimensional test.

*Needs:* §1.3; §0.5.

### 1.5 Signed anticyclotomic unit modules

For ε∈{+,−}, define V∞*,ε=⋂_(χ∈Ξ^(−ε)) ker δ_χ inside V∞*. These are closed Λ-submodules. In particular the minus module kills the trivial character and lies in ker δ; the plus module is allowed to have a unit δ-value.

(BKO21, §2, p.949; BKO21 line 295.)

A proof route is as follows. Use continuous character specialization for Λ-stability and closed kernels for closedness. Noetherianity gives finite generation. For a finite free coefficient extension use tensor-valued derivatives, whose vanishing can be read in basis coordinates. The scalar CM comparison is imported separately from NonordinaryCMSpecialValues NCM.5.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- x∈V∞*,ε iff δ_χ(x)=0 for every opposite-parity χ.
- Each signed unit module is a closed finite Λ-submodule of V∞*.
- δ vanishes on V∞*,− because 1∈Ξ⁺.
- For finite free W/O, tensor-valued derivatives δ_χ,W=δ_χ⊗id_W land in C_p⊗_O W, and (V∞*,ε)⊗_O W=⋂_(χ∈Ξ^(−ε))ker δ_χ,W by finite basis coordinates. Scalar evaluation into C_p is a different map; its kernels require the canonical coefficient comparison of NonordinaryCMSpecialValues NCM.5.
- An element x of V∞* together with vanishing of its opposite-parity derivatives gives an element of the signed submodule. Equality is equality in V∞*, and inclusion preserves zero, addition and Λ-scalars.

**Checks.**

- For the eventual optimal plus unit ξ*, δ_1(ξ*)=(1+p⁻¹)δ(ξ*)≠0. Imposing same-parity vanishing on units would exclude this element.
- Every minus element has δ=0 using the nonzero trivial Euler factor.
- Zero belongs to both kernels; nonzero common elements must be excluded by the later pairing theorem.
- If W=O[ζ_p] and E=Φ(ζ_p), the nonzero tensor ζ_p⊗1−1⊗ζ_p in E⊗_O W maps to zero under scalar multiplication into C_p. A scalar-kernel basis argument without a comparison hypothesis fails this case.
- For W=O² and a tensor z=x⊗(1,0)+y⊗(0,1), δ_χ,W(z)=(δ_χ(x),δ_χ(y)); it is (0,0) exactly when both coordinates are zero.

*Needs:* §1.3; §1.4; §0.1; PadicMeasuresIwasawaAlgebras §§4.2–4.3; NonordinaryCMSpecialValues NCM.5.

### Examples

At p=5 the trivial Euler factor is 6/5. A plus element with δ-value 1 has δ_1=6/5; a minus element has δ=0. An exact-order-25 character is killed by the plus module and permitted on the minus module. The point Fourier normalization is different and is introduced in Layer 3.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: PadicMeasuresIwasawaAlgebras §§1.7, 5.2 (gap:compact-coefficient-duality); ColemanPowerSeries Layer 1; IntegralIwasawaTheory §7.1; `PowerSeries.derivative`; LubinTateFormalModulesAndQuasiCanonicalLifts LT.0–LT.2; `PowerSeries.coeff`; `PowerSeries.constantCoeff`; LubinTateFormalModulesAndQuasiCanonicalLifts LT.0; PadicMeasuresIwasawaAlgebras §§4.2–4.3; NonordinaryCMSpecialValues NCM.5.

## Layer 2: Formal Kummer duality and reciprocity

Use the actual formal O-module, finite extensions of Φ and local Artin normalization of the conventions. Every cohomology map is the connecting map of that formal division sequence, with its stated finite or discrete coefficient topology.

### 2.1 Finite formal Kummer and Cartier comparison

For every finite L/Φ in Θ∞ or Ψ∞ and k≥1, construct 0→F(L)/π^k→H¹(L,F[π^k])→H¹(L,F(Φ̄))[π^k]→0. Identify the finite Cartier dual of F[π^k] with Hom(F[π^k],μ_(p^k)) with its actual action, and compare the cup-product local invariant to the formal Kummer evaluation pairing. After inverse Tate twisting, the resulting limit pairing has values Φ/O.

(BKO21, §4, equation (4.1), p.954; Rubin87 Lemma 5.1 and Proposition 5.2, pp.411–412; BKO21 line 516; Rubin87 line 292; Rubin87 line 306.)

A proof route is as follows. Prove formal division over the algebraic closure and use its connecting map. Apply the supplied finite local duality to the actual finite Cartier dual, retaining evaluation, the trace O/π^k→ℤ/p^k and restriction/corestriction adjunction. The identification of formal Kummer obstructions and their transitions is proved here; self-duality of a height-two formal group is not assumed.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- The connecting map F(L)→H¹(L,F[π^k]) is O-linear, has kernel [π^k]F(L), and identifies its quotient with the kernel of the map to H¹(L,F(Φ̄))[π^k]; the latter map is surjective.
- Inclusion F[π^k]→F[π^(k+1)] corresponds to [π] on the formal-point quotients; multiplication by π on torsion corresponds to reduction F(L)/π^(k+1)→F(L)/π^k. These maps commute with the obstruction maps of the division sequences.
- For finite L′/L in the stated towers, Kummer restriction agrees with inclusion of formal points, and Kummer corestriction agrees with formal trace.
- The Cartier comparison uses evaluation into μ_(p^k) and the coefficient pairing (a,b)↦Tr_(O/ℤ_p)(ab) modulo p^k, followed by the local invariant; the unramified different makes this coefficient pairing perfect.

**Checks.**

- At k=1 a formal π-multiple maps to 0. A point Q∈F(Φ) with λ(Q)∈pO∖p²O has nonzero Kummer class; a zero connecting map would fail this test.
- At L=Φ and k=1, λ identifies F(Φ) with pO, so the left term F(Φ)/πF(Φ) has cardinal |pO/p²O|=p², equal to 25 at p=5. The transition Q mod π↦[π]Q mod π² is nonzero for a primitive Q, whereas reduction of [π]Q modulo π is zero.
- At p=5 the dual coefficient trace 𝔽₂₅→𝔽₅ takes 1 to 2 and 3 to 1, hence is surjective. The coefficient pairing takes (1,1) to 2, rather than 1; omitting the trace or treating it as an identity gives the wrong normalization.

*Needs:* §0.4; ClassFieldTheory Layer 5; ArithmeticGaloisDuality §§R02.1.2–R02.1.3; Tau Ceti affine Cartier duality; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2.

### 2.2 Vanishing of universal formal norms

For the specified height-two F and each finite base L in Θ∞ or Ψ∞, the inverse limit of F(L′) over finite L′/L in the respective tower, with formal trace transition, is zero. The dual direct limit of the formal Kummer obstruction H¹(L′,F(Φ̄))[π^k] vanishes with the matching transition maps.

(Haz77, Theorem 1.3, pp.305–306, and its proof §4, pp.312–314; Rubin87, Proposition 4.5 and Lemma 5.1, p.411; Haz77 line 37; Rubin87 line 276.)

A proof route is as follows. For an absolutely unramified base Hazewinkel gives depth a_n=n−floor((n−1)/2), n≥1. Prove a shrinking-image estimate at every finite ramified base of each stated tower: for every depth a there is a level beyond which every formal trace lies in that depth at that base. For each finite base in Θ∞ choose a totally ramified ℤ_p subtower above that base; restriction of a fully norm-compatible family to that subtower kills its coordinate at the base. No rank-one subtower is claimed to be cofinal in the rank-two tower. These quantifiers kill every coordinate of a compatible family. Dualize the actual finite obstruction system of §2.1, retaining any inverse-limit derived term until its Mittag–Leffler hypothesis has been proved.

**Checks.**

- At height 2 the unramified depth sequence at n=1,2,3,4 is 1,2,2,3. At n=0 the formal trace is the identity, so its image has depth 1, and the positive-level formula is not evaluated with natural subtraction at zero. A height-one multiplicative group retains nonzero universal norms; a ramified finite base requires its own estimate.

*Needs:* §2.1; ArithmeticGaloisDuality §§R02.1.2–R02.1.3; PadicMeasuresIwasawaAlgebras §5.2; LubinTateFormalModulesAndQuasiCanonicalLifts LT.9.

### 2.3 The two-variable Kummer pairing

Construct a perfect continuous/discrete O-duality F(Θ∞)⊗_O Φ/O ≃ Hom_O,cts(U∞*,Φ/O), equivalently F(Θ∞)⊗Φ/O ≃ Hom_O(U∞,F[π∞]); it is induced by the Kummer map and local reciprocity, not by selecting an arbitrary perfect pairing.

(BKO21, §4, p.954; Rubin87 Proposition 5.2, p.412; BKO21 line 522; Rubin87 line 306.)

A proof route is as follows. Pass to the limit in the finite Kummer comparison, using §2.2 to kill the obstruction. Restrict to the torsion extension, take exact tame invariants, and apply norm-compatible local Artin maps. The valuation and other tame eigenspaces have no ω-component. Compact/discrete biduality fixes both the actual pairing and its topology.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- At finite torsion order this is connecting map, cup product, and the standard local invariant.
- ⟨g y,g x⟩=⟨y,x⟩ after the inverse Tate twist.
- The discrete formal-point module equals the continuous O-dual of U∞*.

**Checks.**

- Let Q generate the base formal O-lattice F(Φ). Through the actual connecting-map/Cartier evaluation pairing of §2.1, choose a compatible dual coordinate x whose value on Q⊗π^(−2) is π^(−2) modulo O. Its value on Q⊗π^(−1) is π^(−1)≠0 modulo O. At p=5 these two values are 1/25 and −1/5; their orders are π² and π. The zero pairing fails both values. The base classes retain these orders in Θ∞: if [π]R is a base point, then gR−R is π-torsion in the tame-fixed tower, hence zero, so R is itself a base point.
- With that same actual dual coordinate, multiplying Q⊗π^(−2) by π gives Q⊗π^(−1), and multiplying once more gives zero. At p=5 the paired values are (−5)(1/25)=−1/5 and (−5)(−1/5)=1=0 modulo O. The finite restriction/norm adjunction uses the same evaluation and local invariant; at the identity extension both sides have the nonzero value −1/5.
- In O/5O the unramified coefficient trace in the finite Cartier comparison has Tr(1)=2 and Tr(3)=6=1 modulo 5. Thus the order-5 values 1/5 and 3/5 trace to 2/5 and 1/5 modulo ℤ₅; an identity scalar map instead gives 1/5 and 3/5. This tests the coefficient trace as well as nondegeneracy.

*Needs:* §2.2; §0.2; §0.4; ClassFieldTheory Layer 6; ClassFieldTheory Layer 8; ArithmeticGaloisDuality §§R02.1.2–R02.1.3; CompletedCohomologyPartII §§3.1–3.2; PadicMeasuresIwasawaAlgebras §§1.7, 5.2 (gap:compact-coefficient-duality).

### 2.4 Descent of Kummer duality to the anticyclotomic tower

The pairing induces a perfect Γ⁻-equivariant duality D=F(Ψ∞)⊗Φ/O ≃ Hom_O,cts(V∞*,Φ/O). In particular the annihilator of all formal points in V∞* is zero.

(BKO21, §4, p.954; Rubin87 Proposition 5.4 and Lemma 4.4, pp.410–412; BKO21 line 527; Rubin87 line 325.)

A proof route is as follows. Dualize Γ⁺-coinvariants on units. The p-power fixed-field tower has no nonzero F[π]-torsion, since that torsion has nontrivial tame action. Use inflation–restriction and §2.2 to kill the invariant-sequence obstruction on the formal-point side.

**Checks.**

- For a scalar σ-action a on a one-dimensional unit module, inverse twisting changes it to κ(σ)⁻¹a. The required relation is then 1−1=0 when a=κ(σ); using the untwisted relation again gives 1−κ(σ), not 0.

*Needs:* §2.3; §0.5; §2.2; ArithmeticGaloisDuality §§R02.1.2–R02.1.3; CompletedCohomologyPartII §§3.1–3.2; PadicMeasuresIwasawaAlgebras §§1.7, 5.2 (gap:compact-coefficient-duality).

### 2.5 Wiles’s trace formula in the pi normalization

For y∈F(Ψ_n), x∈V∞*, k≥0 and m sufficiently large relative to y and k, the Kummer pairing is ⟨y⊗π^(−k),x⟩=π^(−m−1−k) Tr_(Φ_m/Φ)(δ_m(x)λ(y)) modulo O. Here δ_m is computed on any lift of x to U∞*, and the formula is independent of the lift and of admissible m.

(BKO21, §4, p.955; Rubin87, Theorem 5.3, p.412; BKO21 line 543; Rubin87 line 322.)

A proof route is as follows. Use finite explicit reciprocity with the π-adic Tate basis, its invariant differential and the arithmetic Artin convention of §2.1, then take the tame projection and Γ⁺-coinvariants. Establish a threshold m₀(y,k) such that the formula holds for every m≥m₀(y,k); show independence of lift modulo O. The explicit reciprocity proof is required as part of this theorem, rather than assumed from a freely chosen pairing. Its original bibliographic locator is Wiles78, pp.235–254 (uncertified); the stated local formula is the one read in Rubin87 Theorem 5.3 and BKO21 §4.

**Checks.**

- On replacing m by m+1 the trace numerator πA and denominator π^(m+2+k) give A/π^(m+1+k). At p=5,m=k=0 these are −A/5 on both sides. A zero point or a zero unit gives value 0 modulo O.

*Needs:* LubinTateFormalModulesAndQuasiCanonicalLifts LT.0; §2.4; §1.2; §1.3.

### Examples

For the trivial finite group the norm and restriction are identities, so Kummer adjunction has no sign. At the next degree-5 formal trace, a base logarithm a becomes 5a, while increasing the LT derivative level multiplies the trace by π=−5. These two factors are used in different maps. At k=0, y⊗1 is zero in F(Ψ_n)⊗Φ/O, so the admissible reciprocity trace must be integral.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: ClassFieldTheory Layer 5; ArithmeticGaloisDuality §§R02.1.2–R02.1.3; Tau Ceti affine Cartier duality; LubinTateFormalModulesAndQuasiCanonicalLifts LT.2; PadicMeasuresIwasawaAlgebras §5.2; LubinTateFormalModulesAndQuasiCanonicalLifts LT.9; ClassFieldTheory Layer 6; ClassFieldTheory Layer 8; CompletedCohomologyPartII §§3.1–3.2; PadicMeasuresIwasawaAlgebras §§1.7, 5.2 (gap:compact-coefficient-duality).

## Layer 3: Signed formal points and annihilators

Use Ψ∞, its actual formal points and the Kummer duality of Layer 2. All logarithm kernels are taken in the characteristic-zero receiving fields, and all tensor inclusions are proved by saturation.

### 3.1 Character logarithms of formal points

For y∈F(Ψ_n) and a finite χ of Γ⁻, choose m≥n through which χ factors and put λ_χ(y)=p^(−m)Σ_(g∈Gal(Ψ_m/Φ))χ(g)⁻¹ λ(y)^g. This is independent of m. It is O-linear, λ_χ(g y)=χ(g)λ_χ(y), and it vanishes when χ does not factor through the field of definition of y.

(BKO21, §4, p.955; Rubin87 Lemma 5.5(i)–(iv), p.413; BKO21 line 535; Rubin87 line 339.)

A proof route is as follows. The supplied formal logarithm is additive and O-linear. It is injective in Ψ∞ because its possible kernel is π-power torsion, absent in the tame-fixed tower. Trace of an inflated point multiplies the sum by p, and a nontrivial character sum on the relative group is zero.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- The normalized sums at m and m+1 agree for an inflated character.
- λ_χ(g y)=χ(g)λ_χ(y), with the direct character, opposite to δ_χ covariance.
- λ_χ(y)=0 if χ is nontrivial on Gal(Ψ_m/Ψ_n).
- λ_1(y)=p^(−n)Tr_(Ψ_n/Φ)λ(y).
- λ_χ is an O-linear map for formal addition and the formal O-action; λ_χ(0)=0, and inclusion into a higher field commutes with it.

**Checks.**

- For a base point with λ(y)=a, λ_1(y)=a; at level one the normalized repeated sum is pa/p=a. An unnormalized sum gives pa.
- For the same base point and a nontrivial order-p character, Σ_(i=0)^(p−1)ζ^i a=0, so λ_χ(y)=0.
- At p=5 the point normalization at m=1 is 1/5 and the unit normalization at n=1 is 1/25. For an order-5 value ζ, point covariance has ζ, whereas derivative covariance has ζ⁴.

*Needs:* §0.1; §2.4; LubinTateFormalModulesAndQuasiCanonicalLifts LT.0, LT.8.

### 3.2 Signed formal-point modules

Define A^ε={y∈F(Ψ∞) : λ_χ(y)=0 for every χ∈Ξ^ε}. Thus point signs kill the same parity. Put A_n^ε=A^ε∩F(Ψ_n) and D^ε=A^ε⊗_O Φ/O. Regard D^ε as a submodule of D through the natural tensor map; this map is injective because A^ε is O-saturated in F(Ψ∞).

(BKO21, §4, p.955; Rubin87 Lemma 5.5, p.413; BKO21 line 539.)

A proof route is as follows. Intersections of characteristic-zero logarithm kernels are saturated O-submodules, stable under Γ⁻. The quotient by A^ε is torsion-free, so its Tor term with Φ/O vanishes; this proves that the specified tensor map is injective.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- y∈A^ε iff its same-parity character logarithms vanish.
- A_n^ε is the same-parity kernel intersection on F(Ψ_n); all higher characters vanish automatically.
- If a≠0 in O and [a]y∈A^ε, then y∈A^ε.
- D^ε→D is the injective map induced by the actual inclusion of formal points.
- A formal point with all same-parity logarithms zero gives a signed point; two signed points agree iff their underlying formal points agree. The inherited O-submodule operations need no new group law.
- Field inclusions and formal traces carry the signed submodules to the same sign, and their maps commute with the inclusions into F(Ψ∞).

**Checks.**

- Every base point lies in A⁻: all its odd-conductor logarithms are 0. Its trivial logarithm is λ(y), so a base point with nonzero logarithm fails A⁺.
- At n=0, A_0⁺=0 and A_0⁻=F(Φ); at n=1 all characters have even conductor, so A_1⁺=0 and A_1⁻=F(Ψ_1). Reversing point signs reverses these values.
- For a≠0, aλ_χ(y)=0 implies λ_χ(y)=0 in a characteristic-zero field. Without saturation the inclusion pO→O tensors to multiplication by p on Φ/O, whose kernel p⁻¹O/O has p² elements here.

- At p=5 an exact-order-5 χ has conductor 2: A⁺ requires λ_χ=0, whereas V∞*,+ permits δ_χ≠0 and V∞*,− requires δ_χ=0. Giving units and points identical vanishing signs fails this character.

*Needs:* §3.1; §0.1.

### 3.3 Fourier decomposition of finite formal lattices

For each n, λ identifies a sufficiently deep finite-index subgroup of F(Ψ_n) with a Γ⁻-stable O-lattice in Ψ_n. By normal basis this rational representation is Φ[Gal(Ψ_n/Φ)]. Each finite character component is nonzero. Character projections split it into the two conductor parities, with averaging denominators dividing p^n. The integral point statement [p^n]F(Ψ_n)⊆A_n⁺+A_n⁻ is proved by the integral trace projectors, not by assuming that the logarithm lattice is an integral normal basis.

(Rubin87, Lemma 5.5, p.413; proof of Lemma 7.1, p.417; Rubin87 line 353; Rubin87 line 508.)

A proof route is as follows. Compare the actual logarithm on a sufficiently deep ideal with a finite-index lattice and use the normal-basis theorem for the rational representation. Group character orbits by conductor parity. Prove the integral bound by the alternating trace projectors on formal points; their p-power denominator bound is separate from rational Fourier decomposition.

**Checks.**

- For G_0=1 the regular representation has dimension 1 over Φ. For G_1=C₅ it has dimension 5 with rational character orbit dimensions 1 and 4; for G_2=C₂₅ they are 1,4,20. Integral Fourier denominators divide 1,5,25.

*Needs:* §3.1; §3.2; LubinTateFormalModulesAndQuasiCanonicalLifts LT.0; Mathlib normal basis.

### 3.4 The sum of the signed divisible-point modules

A⁺∩A⁻=0; for each n, [p^n]F(Ψ_n)⊆A_n⁺+A_n⁻; hence D=D⁺+D⁻. Both A⁺ and A⁻ have infinite O-rank. This stage asserts a sum of divisible submodules, without assuming their intersection is zero.

(BKO21, §4, equation (4.2), p.955; Rubin87, Lemma 5.5(v)–(vi), p.413; BKO21 line 542; Rubin87 line 359.)

A proof route is as follows. Apply the integral trace projectors of §3.3 and injectivity of λ. Multiplication by p^n puts each finite point in the sum; divisibility then gives the sum of divisible modules. Arbitrarily high character orbits of both parities give unbounded O-rank.

**Checks.**

- At p=5 the O-ranks of A_n⁻ and A_n⁺ for n=0,1,2 are (1,0), (5,0), (5,20). The denominator bound at n=2 is 25, not 1; the divisible sum does not itself imply zero intersection.

*Needs:* §3.2; §3.3.

### 3.5 Finite-level saturation of formal points

For each n, F(Ψ_n) is O-saturated in F(Ψ∞), and A_n^ε is O-saturated in A^ε. Consequently F(Ψ_n)⊗Φ/O→D and A_n^ε⊗Φ/O→D^ε are injective.

(BKO21, The torsion-free Kummer argument in §4, p.954; Rubin87 Proposition 5.4 and Lemma 5.5, pp.412–413; Rubin87 line 325; Rubin87 line 361.)

A proof route is as follows. If [π]z lies in F(Ψ_n), each automorphism fixing Ψ_n makes gz−z a π-torsion point of F(Ψ∞), hence zero. Iterate and intersect with the signed conditions. Torsion-free quotients give the tensor injections.

**Checks.**

- In the torsion-free tower, [π](gz−z)=0 forces gz−z=0. The comparison pO⊂O without saturation instead has quotient O/pO of cardinal 25 at p=5 and a tensor kernel of cardinal 25.

*Needs:* §3.2; §2.4.

### 3.6 The signed annihilator theorem

Under the actual Kummer pairing, Ann_(V∞*)(D^ε)=V∞*,ε for each ε. Therefore D^ε≃Hom_O,cts(V∞*/V∞*,ε,Φ/O), with the Γ⁻ action on the dual given by inversion.

(BKO21, §4, p.955; Rubin87 Proposition 5.6 and Corollary 5.7, pp.413–414; BKO21 line 547; Rubin87 line 365.)

A proof route is as follows. Insert direct-character logarithm covariance and inverse-character derivative covariance into the actual reciprocity trace formula. For the converse choose a deep point supported in one character orbit and vary its π-power denominator; nondegeneracy forces the corresponding derivative to vanish. Closed compact submodules give the quotient dual.

**Checks.**

- A plus point has support in Ξ⁻ and a plus unit has derivatives zero on Ξ⁻, giving pairing 0 term by term. An order-25 character at p=5 is such a minus-parity component, while the trivial component occurs in A⁻.

*Needs:* §2.5; §3.2; §3.3; §3.4; §1.5; §3.5.

### 3.7 Disjointness and rank upper bounds

V∞*,+∩V∞*,−=0 and rank_Λ V∞*,ε≤1. Each quotient V∞*/V∞*,ε is O-torsion-free and has positive Λ-rank.

(BKO21, §4, p.955; Rubin87 Corollary 5.8, p.414; BKO21 line 550; Rubin87 line 389.)

A proof route is as follows. The sum D⁺+D⁻=D makes the two unit annihilators disjoint. Each quotient is O-torsion-free because D^ε is divisible. If its Λ-rank were zero, the one-variable structure theorem would make it finite over O, contradicting the unbounded finite signed coranks embedded by §3.5.

**Checks.**

- For a free rank-two ambient module the two positive quotient ranks are at least 1, leaving signed ranks at most 1. At n=2,3 the minus-point O-ranks at p=5 grow from 5 to 105; a finite O-corank dual cannot contain all of them.

*Needs:* §3.6; §3.4; §0.5; PadicMeasuresIwasawaAlgebras §§4.2–4.5; §3.5.

### Examples

At p=5 the regular representations through levels 0,1,2 have dimensions 1,5,25 over Φ. The minus signed point ranks are 1,5,5 and the plus ranks 0,0,20. Saturation, not those rational ranks alone, embeds their divisible points in D.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: LubinTateFormalModulesAndQuasiCanonicalLifts LT.0, LT.8; LubinTateFormalModulesAndQuasiCanonicalLifts LT.0; Mathlib normal basis; PadicMeasuresIwasawaAlgebras §§4.2–4.5.

## Layer 4: The early CM optimal unit

Use the standing local data and an imaginary quadratic K satisfying §4.1. The canonical Hecke character, good CM differential, period, coefficient field and early classes are the named supplier data, independent of signed freeness.

### 4.1 An auxiliary CM field and character

For every odd prime p, construct an imaginary quadratic K in which 2 splits, p is inert and p∤h_K (the source states this under its standing p≥5; p=3 follows by the same route). The headline `exists_auxiliaryQuadraticField` states this on native number fields for every prime p≠2: [K:ℚ]=2, K is totally complex, (2)=PQ for distinct prime ideals P,Q of its integer ring, (p) is prime, and p does not divide its class number. At the standing p≥5, apply the canonical-character and auxiliary-prime contracts of NonordinaryCMSpecialValues NCM.0 and NCM.2 to this K: choose φ of type (1,0), conductor f supported at ramified primes, φ(pO_K)=−p and W(φ)=+1, its compatible CM elliptic realization over H and good differential period Ω, and a split prime l≥5 with l∤p h_K N(f) and p∤(l−1). This target owns the auxiliary-field existence and its assembly with those supplied objects.

(BKO21, Lemma 3.1 and §3.0.1, pp.950–951; Theorem 3.4, pp.953–954; BKO21 line 339.)

A proof route is as follows. Choose 1≤a≤p−1 with (−a/p)=−1, and 0≤k≤7 with a+kp≡7 modulo 8. The squarefree part d of −(a+kp) is 1 modulo 8, has (d/p)=−1 and |d|<8p. The class-number bound in the supplier contract gives h(d)<p for p≥53. The explicit reduced-form and Euler-criterion examples below handle 3≤p≤47. Apply the early CM contracts to that field.

**Checks.**

- In K=ℚ(√−7), α=(1+√−7)/2 has polynomial X²−X+2. Modulo 2 this is X(X−1), giving distinct primes (2,α) and (2,α−1); modulo 5 its discriminant is 3, a nonsquare, so (5) is prime. Here h_K=1 and 5∤1.
- In K=ℚ(√−15), 2 splits and h_K=2, but at p=5 the discriminant is 0 modulo 5: (5) ramifies and is not prime, so this field fails the inertness clause.
- At p=3 the route takes a=1 and k=2, so a+kp=7 and d=−7: modulo 3 the discriminant is 2, a nonsquare, so (3) is prime in ℚ(√−7), and 3∤1. At p=2 no field qualifies: if (2)=PQ with P,Q prime and (2) itself prime, then (2) contains P or Q and is contained in both, so it equals that factor; cancelling the nonzero principal ideal (2) makes the other factor the unit ideal, which is not prime. Hence the hypothesis p≠2 cannot be dropped.
- The complete small-prime discriminant choices and the class numbers 1,2,3 are computed in the worked examples. At p=53, sqrt(424)(2+log(424))/π_real≈52.7612<53, and the corresponding ratio is decreasing.

*Needs:* §0.1; ImaginaryQuadraticClassNumber H1.3, H2.1–H2.3 (gap:quadratic-class-number-upper-bound); NonordinaryCMSpecialValues NCM.0, NCM.2.

### 4.2 Projection of the early CM zeta class

For a finite anticyclotomic l-power character ν of conductor l^m, let R contain its values and the CM coefficients. Starting with the early norm-compatible CM zeta class z_(f l^m), define ξ_ν∈U∞*⊗_O R by: the CM coefficient untwist of (3.5); corestriction to H(E[p^(n+1)])L_r, with r chosen by the actual conductor field; localization at the primes above p; identification with the R-group ring of Gal(L_r/K); evaluation at ν; augmentation of R[Gal(H/K)]; projection to Δ-invariants; and the Kummer comparison. The family is compatible in n.

(BKO21, §3.0.2, equation (3.5), pp.952–953; BKO21 line 434.)

A proof route is as follows. Use the normalized early class and its norm-twist and semilocal comparisons from NonordinaryCMSpecialValues NCM.1–NCM.2. For exact order l^r with r≥1 set conductor exponent m=r+1 and use L_r. Every arrow is between these actual cohomology, semilocal or group-ring modules, with the indicated coefficient ring. The resulting projection is linear and norm compatible.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- The finite-level image is the specified localization/projection composite, with every source, target, Galois action and tensor coefficient retained.
- Corestriction in the p-tower corresponds to norm of the unit coordinates, giving an element of the actual inverse limit.
- Extending R or changing the chosen prime by its Galois transport commutes with the projected class.
- The anticyclotomic class is its image in V∞*⊗R, using σ−1 after inverse twisting.
- The localization/projection composite is linear on the early cohomology classes: it sends zero to zero and sums to sums, and is compatible with extension of the coefficient ring.

**Checks.**

- For an exact order-l character, the source ring class has conductor l²; choosing z_(f l) has the wrong field.
- The class projection averages over Δ of order p²−1; Δ′ of order p+1 belongs to the point construction.
- On a basis element [g] of R[Gal(L_r/K)], evaluation is ν(g), not ν(g)⁻¹; on [1] it is 1. Augmentation on the H factor sends each [h] to 1.
- At p=5, the Δ average divides by 24, whereas the point trace has 6 terms. The identity basis element [1] evaluates to 1 under ν and every [h] in the H factor augments to 1.

*Needs:* §4.1; §2.3; §0.4; NonordinaryCMSpecialValues NCM.1–NCM.2.

### 4.3 Wiles reciprocity in dual-exponential form

For the projected class x∈U∞*⊗_O R, transport its finite Kummer class through the specified CM coefficient identification to H¹(Φ_n,T_φ⁻¹(1)). Compare the imported dual exponential, normalized by the chosen invariant differential ω_E, with the invariant Coleman derivative: its finite coefficient is π^(−n−1)δ_n(x), and the χ-weighted semilocal sum is δ_χ(x)ω_E. The ordered local Tate pairing, coefficient trace and differential comparison are part of this comparison theorem: the supplier's geometric identity P(κ_Kum(u),ψ)=ψ(rec_geo(u))=−ψ(Art_Φ(u)) of the supplier contract is converted before it is compared with the arithmetically normalized Kummer pairing of §2.1. The formula does not define a rescaled exponential.

(Kato93, Chapter II, Theorem 2.1.7, uncertified; BKO21, Equations (3.4)–(3.6), pp.952–953; BKO21 line 422; BKO21 line 467.)

A proof route is as follows. Apply PadicHodgeRegulators §1.4 with its ordered positive adjunction, after converting its geometric reciprocity identity to Art_Φ as in the supplier contract. Transport the CM Tate representation, good differential and semilocal trace through the supplied coefficient comparison, and prove finite explicit reciprocity with the π^(−n−1) factor. This is a distinct rational comparison from the Φ/O-valued formula of §2.5.

**Checks.**

- On the trivial representation the supplied dual exponential sends log χ_cyc to 1. At p=5,n=0 the finite coefficient multiplying δ_0 is −1/5; at n=1 it is 1/25. Replacing it by 1 or −1/25 changes the normalization.
- At p=5 take u=6∈ℤ₅ˣ⊂Oˣ, with N_(Φ/ℚ₅)(6)=36 and log₅(6)=5−25/2+125/3−⋯ of valuation 1, so nonzero. Arithmetic reciprocity gives log χ_cyc(Art_Φ(6))=log₅(36⁻¹)=−2log₅(6). The supplier's ordered pairing gives P(κ_Kum(6),log χ_cyc)=log χ_cyc(rec_geo(6))=2log₅(6), and reversing the two degree-one entries gives −2log₅(6). On the de Rham side, with d₁ the supplier's invariant basis of D_dR(ℚ₅(1)) over Φ, κ_Kum(6)=exp(log₅(6)·d₁) and exp*(log χ_cyc)=1, so the trace pairing is Tr_(Φ/ℚ₅)(log₅(6))=2log₅(6), agreeing with P. Reading the supplier identity with Art_Φ in place of rec_geo would give −2log₅(6) on the duality side against +2log₅(6) on the de Rham side, a sign error in the derivative comparison.

*Needs:* §4.2; §1.3; §2.1; PadicHodgeRegulators §1.4; ClassFieldTheory Layer 7; NonordinaryCMSpecialValues NCM.0–NCM.2; §2.5.

### 4.4 CM-class derivative values and sign

With the chosen differential and CM period, δ(ξ_ν)=Ω⁻¹ L_(l^m f)(overline(φ)ν,1) and δ_χ(ξ_ν)=Ω⁻¹ L_(l^m p f)(overline(φ)νχ,1). Subscripts mean omission of those Euler factors. Put ε=W(φ). The scalar derivatives vanish for χ∈Ξ^(−ε). With the canonical unramified coefficient comparison of NonordinaryCMSpecialValues NCM.5, this gives membership of the anticyclotomic image in V∞*,ε⊗_O R; the selected canonical φ has ε=+.

(BKO21, Proposition 3.3 and equations (3.6)–(3.7), p.953; BKO21 line 469.)

A proof route is as follows. Combine early CM reciprocity with §4.3. The root-number formula of NonordinaryCMSpecialValues NCM.3 gives a negative sign on the opposite parity and hence scalar vanishing. NCM.5 supplies an unramified coefficient field and scalar-to-tensor injectivity in a common totally ramified LT level; prove that the finite derivative lies in that tensor before using injectivity. The p-Euler deletion at χ=1 is 1+1/p.

**Checks.**

- For χ=1 and φ(p)=−p the removed Euler factor is 1−(−p)/p²=1+1/p=6/5 at p=5. An exact-order-5 χ has even conductor 2 and root sign +; exact order 25 has conductor 3 and sign −, so its scalar central value is 0.

*Needs:* §4.2; §4.3; §1.3; §1.5; NonordinaryCMSpecialValues NCM.3, NCM.5.

### 4.5 A plus unit with unit derivative

There exists ξ*∈V∞*,+ such that δ(ξ*)∈O×. This existence is obtained before using the integral signed decomposition or assuming that V∞*,+ is free.

(BKO21, Theorem 3.4 and equation (3.9), pp.953–954; BKO21 line 490.)

A proof route is as follows. Use NonordinaryCMSpecialValues NCM.4 to choose a nontrivial ν with normalized L-value a p-unit, with its local correction terms zero and its auxiliary Euler factors treated at the actual conductor. Apply NCM.5 and §4.4 to place the class in V∞*,+⊗W. In an O-basis of finite free W, all coordinate derivatives in pO would put its unit derivative in pW. One coordinate is therefore the desired ξ*. This reasoning precedes plus freeness.

**Checks.**

- In a finite free coefficient ring, if each coordinate derivative has valuation at least 1 then the whole tensor derivative lies in pW and has valuation at least 1. A unit derivative has valuation 0, so at least one coordinate has valuation 0. The ramified scalar-kernel counterexample of §1.5 prevents doing this before tensor membership.

*Needs:* §4.4; PadicMeasuresIwasawaAlgebras §5.2; NonordinaryCMSpecialValues NCM.4–NCM.5.

### Examples

For p=5 take discriminant −7 and h=1. Exact order l means conductor l², and ν evaluates a basis group-ring element [g] as ν(g). In the unramified coefficient tensor a unit derivative forces a unit coordinate; scalar multiplication on a ramified tensor need not be injective.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: ImaginaryQuadraticClassNumber H1.3, H2.1–H2.3 (gap:quadratic-class-number-upper-bound); NonordinaryCMSpecialValues NCM.0, NCM.2; NonordinaryCMSpecialValues NCM.1–NCM.2; PadicHodgeRegulators §1.4; ClassFieldTheory Layer 7; NonordinaryCMSpecialValues NCM.0–NCM.2; §2.5; NonordinaryCMSpecialValues NCM.3, NCM.5; PadicMeasuresIwasawaAlgebras §5.2; NonordinaryCMSpecialValues NCM.4–NCM.5.

## Layer 5: A primitive modular formal point

Use p≥5 and the standing unramified quadratic field. For the modular targets take the optimal rational elliptic curve E of conductor N with p∤N and a_p(E)=0, its cusp-normalized parametrization and the indicated smooth good models. Generic-j targets apply for p≥13; exceptional fibers handle p=5,7,11.

### 5.1 An auxiliary rational supersingular elliptic curve

There is E/ℚ with good reduction at p and a_p(E)=0. At p=5 or 11 choose the j=0 conductor-27 curve, and at p=7 choose the j=1728 conductor-32 curve. It may be chosen optimal in its ℚ-isogeny class without changing good reduction or a_p. Its base change to O has formal group O-isomorphic to F for π=−p.

(BKO21, §5.0.1, p.955 and Lemma 5.1(ii), p.956, with the sign correction explained in §5.3; BKO21 line 554.)

A proof route is as follows. Use the trace-zero existence theorem in the finite-field supplier contract, lift a nonsingular Weierstrass equation to ℤ and apply unconditional modularity. Replace E by the optimal representative; isogeny preserves good reduction and a_p. Apply the supplied unramified elliptic Honda comparison to its formal group.

**Checks.**

- For y²+y=x³ over 𝔽₅ the point count is 6, so a₅=0; over 𝔽₁₁ it is 12, so a₁₁=0. For y²=x³−x over 𝔽₇ it is 8, so a₇=0. These lift to the indicated conductor-27 and conductor-32 isogeny classes.

*Needs:* EllipticCurveModularity R29.6; EllipticCurveModularity R29.5; EllipticCurves Layer 3 (gap:supersingular-trace-classes); LubinTateFormalModulesAndQuasiCanonicalLifts LT.4.

### 5.2 The optimal parametrization has separable reduction

For the optimal E of conductor N, p∤N, let f_E:X₀(N)→E be the cusp-normalized modular parametrization. Its pullback of a Néron differential is c_E f(q)dq/q with c_E∈ℤ_p×. It extends to the smooth proper good models over ℤ_p and its reduction is a nonconstant separable map.

(AU96, Theorem A, p.269; Propositions 3.3–3.4, pp.276–278; Zagier’s Lemma 3.2, p.278; proof of Theorem A, p.279; BKO21, §5.0.1, p.955; AU96 line 49; AU96 line 322.)

A proof route is as follows. Apply AU96 Theorem A to the optimal parametrization at p∤N. Its integral differential has nonzero reduction, since c_E is a p-unit and the normalized newform has first q-coefficient one. Extend to the smooth good models by the Néron mapping property; a nonzero differential proves separability. AU96 Proposition 3.4, the degree/congruence identity and Zagier’s Lemma 3.2 supply the good-prime Manin-unit argument with the stated integral comparison input.

**Checks.**

- For an optimal curve at p∤N the Manin valuation is 0. On local disks t↦t+t² has derivative 1 at 0 and is separable there; the characteristic-p map t↦t^p has derivative 0 despite its characteristic-zero lift being nonconstant.

*Needs:* §5.1; EllipticCurveModularity R29.5; ModularCurvesPartII §§9.9–9.11, 13.2, 16.6; ModularCurves Layer 9; ModularCurvesPartII §§5.2–5.3, 13.7 (gap:integral-congruence-comparison).

### 5.3 Scalar Frobenius on cyclic-level points

For A/𝔽_(p²) with trace 2εp, ε∈{1,−1}, apply the scalar-Frobenius and Honda comparison of LubinTateFormalModulesAndQuasiCanonicalLifts LT.4 to show that every geometric cyclic subgroup C of order N prime to p is stable under Frobenius. Consequently the cyclic-level moduli point (A,C) is rational over 𝔽_(p²). Use the supplied parameter εp on the formal lift; selecting the trace −2p representative gives π=−p. This application owns subgroup descent to the level curve, not the scalar-endomorphism or Honda theorem.

(BKO21, Lemma 5.1(i)–(ii), p.956; BKO21 line 573; BKO21 line 586. The displayed Honda-type and parameter signs in part (ii) are interchanged: the proof’s Frobenius εp gives type p−εX² and parameter εp.)

A proof route is as follows. Scalar multiplication preserves every geometric prime-to-p subgroup as a subgroup; it need not fix each point. Frobenius-stability gives descent of its finite étale subgroup scheme and hence a rational moduli point. Apply the supplied Honda comparison only over the absolutely unramified quadratic coefficient ring.

**Checks.**

- At p=5 the two traces ±10 give scalars ±5 and point counts 16,36. The trace −10 representative has Frobenius −5 and parameter −5, while trace +10 gives +5 and parameter +5; the printed parameter ∓p reverses these. On a point of order 6 the scalar −5 acts as 1; on a point of order 7 it acts as 2, preserving the subgroup without fixing the point.

*Needs:* LubinTateFormalModulesAndQuasiCanonicalLifts LT.4; ModularCurves Layers 8–9; §5.1.

### 5.4 Applying the supersingular mass and twist counts

At q=p² let d indicate supersingularity of j=0 and e that of j=1728, and let m count the other geometric supersingular invariants. ModularCurvesPartII §12.1 gives d=1 exactly when p≡2 mod 3, e=1 exactly when p≡3 mod 4, and `gammaZeroPrime_mass` gives m+e/2+d/3=(p−1)/12, equivalently p−1=12m+4d+6e. Choose a scalar-Frobenius representative above each invariant using the finite-field trace-class contract. Retain the distinction between geometric invariants and 𝔽_(p²)-isomorphism classes: a generic invariant has the two twists of traces ±2p. The trace-class formulas, including the exceptional twists, belong to the EllipticCurves Layer 3 supplier contract.

(BKO21, Proof of Lemma 5.2(ii)–(iii), p.957; BKO21 line 617.)

A proof route is as follows. Use the supplied mass and twist counts, keeping j-invariants and rational isomorphism classes distinct. For generic j the two rational quadratic twists have scalar traces ±2p; the exceptional trace classes occur at j=0 or j=1728. This supplies representatives for the level-fibre application.

**Checks.**

- At p=5: (m,d,e)=(0,1,0), mass 1/3=4/12, N(±10)=1, N(±5)=2, N(0)=0. At p=7: (0,0,1), mass 1/2=6/12, N(±14)=1, N(±7)=0, N(0)=2. At p=47: (3,1,1), mass 3+1/2+1/3=46/12, N(±94)=5, N(±47)=2, N(0)=2.

*Needs:* §5.3; ModularCurvesPartII §12.1 (`gammaZeroPrime_mass`); EllipticCurves Layer 3 (gap:supersingular-trace-classes).

### 5.5 The ramification bound for the parametrization

Let μ=N∏_(l|N)(1+1/l)=deg(X₀(N)→X(1)), and g_N be the genus, identified with the good-fibre genus by the supplied smooth proper model comparison. The reduced parametrization f̄_E:X₀(N)_(𝔽_p)→E_(𝔽_p) is a finite generically étale map of smooth proper geometrically connected curves. Its number of geometric ramification points is at most deg(Different)=2g_N−2≤μ/6.

(BKO21, Lemma 5.2(i), pp.956–957; BKO21 line 590.)

A proof route is as follows. The nonconstant separable map of §5.2 between the good smooth proper curves is finite and generically étale. Apply SchemeAndStackFoundations §3.2 over the algebraic closure of 𝔽_p: its genus-one target makes the term deg(f̄_E)(2g_E−2) zero, and every geometric ramification point contributes at least one to the different, including in wild ramification. Use the supplied good-fibre genus comparison and the genus/index formula for the composite level.

**Checks.**

- For N=27, μ=36, genus 1, hence different degree 0≤6. For N=32, μ=48, genus 1, hence 0≤8. For the identity map between genus-one curves the different has degree 0.
- In characteristic 5 the relative Frobenius of an elliptic curve has degree 5 and zero differential; it is not generically étale and does not satisfy the hypotheses of the supplied formula. A tame local parameter map t↦t² instead has different multiplicity 1=e−1 at t=0, so that ramification point contributes one.

*Needs:* §5.2; SchemeAndStackFoundations §3.2; ModularCurvesPartII §§5.2–5.3; ModularForms Layer 10B.

### 5.6 The generic supersingular-point bound

The number of 𝔽_(p²)-points of X₀(N) above generic supersingular j with a scalar-Frobenius representative is at least μ⌊(p−1)/12⌋. Consequently for every p≥13 at least one is unramified for the parametrization. This stronger count also implies the displayed weaker bound in Lemma 5.2(ii).

(BKO21, Lemma 5.2(ii), pp.956–957; BKO21 line 652.)

A proof route is as follows. Away from the two exceptional j-values the j-map has μ geometric points in a fibre. Scalar Frobenius makes every cyclic-level subgroup rational. Multiply by m=floor((p−1)/12); for p≥13 this exceeds the ramification bound μ/6.

**Checks.**

- At p=13 the generic count is μ; at p=47 it is 3μ. The weaker expression at p=47 is μ(3−3/2−1−1/2)=0, whereas 3μ>μ/6. At p=5 the generic count is 0 and gives no existence conclusion.

*Needs:* §5.4; §5.3; §5.5; ModularCurves Layer 8; ModularCurves Layer 9.

### 5.7 The two exceptional supersingular-point bounds

If p≡2 mod 3, the fibre above j=0 contains at least μ/3 rational supersingular points with scalar-Frobenius representatives. If p≡3 mod 4, the fibre above j=1728 contains at least μ/2. Each applicable bound exceeds μ/6 and therefore supplies an unramified point for the parametrization.

(BKO21, Lemma 5.2(iii), pp.956–957; BKO21 line 603.)

A proof route is as follows. The residual automorphism orders after quotienting by ±1 are at most three at j=0 and two at j=1728. Divide the degree μ by these bounds, and use the trace −2p representative and subgroup descent. These are indices of the j-map; the parametrization has its separate different bound.

**Checks.**

- At p=5,N=27, μ/3=12>μ/6=6. At p=7,N=32, μ/2=24>μ/6=8. For p=13 neither exceptional supersingularity condition holds, and the generic count is used.

*Needs:* §5.4; §5.3; §5.5; ModularCurves Layer 9.

### 5.8 An unramified lift to fine level

Choose an unramified supersingular P̄∈X₀(N)(𝔽_(p²)) as above and a representative Ā with p²-Frobenius −p, changing its quadratic twist if necessary. Take M=p+1 and a rational point of exact order M on Ā. The mixed Γ₀(N),Γ₁(M) problem is fine; its quotient group has order prime to p. Choose P̄′ above P̄ where the forgetful map is unramified. For p=5 or 11 use the optimal j=0 curve of conductor 27; for p=7 use the optimal j=1728 curve of conductor 32. These levels remove the respective elliptic stabilizers.

(BKO21, The formal CM point construction, pp.957–958; BKO21 line 694.)

A proof route is as follows. On the trace −2p representative, all M=p+1 torsion is rational. Since M≥6 and p∤Mφ(M), use the fine point-level model. Generic j has no residual stabilizer. For p=5,11 use level 27, which eliminates order-three stabilizers; for p=7 use level 32, which eliminates order-two stabilizers. Work on the corresponding actual integral mixed-level moduli disk.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- The lift carries a cyclic order-N subgroup and an exact-order-M point, with p∤NM.
- Forgetting the order-M point maps P̄′ to P̄ and identifies the corresponding completed local disks.
- The represented elliptic curve is an actual family on the fine model; a coarse moduli point alone is not sufficient.
- Extension of the unramified coefficient ring transports the marked curve, cyclic subgroup, exact-order-M point and forgetful map; it preserves their represented moduli class.
- Extending the unramified coefficient field transports the marked fine-level point, its reduction and the completed local-disk comparison.

**Checks.**

- For p=5, M=6 is fine and φ(M)=2 is prime to p.
- At p=5 or 11, retain the Γ₀(27) structure before forgetting the fine point; j=0 alone has an order-three automorphism obstruction.
- At p=7, the Γ₀(32) structure eliminates the order-two obstruction at j=1728.
- At p=5 the rational 6-torsion has a point of exact order 6; at p=7 the chosen level is 8 and φ(8)=4. Neither 6 nor 4 is divisible by its respective prime.

*Needs:* §5.6; §5.7; §5.3; ModularCurves Layer 5; ModularCurves Layer 8; ModularCurves Layer 9; ModularCurvesPartII §§3.2, 3.9, 5.2–5.3 (gap:mixed-level-disk-comparison).

### 5.9 A primitive formal CM point

After replacing f_E by [#E(𝔽_(p²))]∘f_E, there is a fine-level O-point P′ reducing to P̄′ and representing A/O such that Q=f_E(P′)∈F(Φ) ∖ [p]F(Φ). The completed map at P̄′ and the origin of E is an isomorphism over O. The formal group Â is Lubin–Tate for π=−p, with a chosen O-module identification.

(BKO21, Equation (5.1) and surrounding construction, p.958; BKO21 line 703.)

A proof route is as follows. The multiplier #E(𝔽_(p²))=(p+1)² is a p-unit, so it sends the residue point to zero and preserves the unit differential. The composite fine-level map identifies completed local disks over O. Choose Q with λ(Q)∈pO∖p²O and lift it through that disk isomorphism. Fine representability supplies the elliptic curve A/O. Use the elliptic formal-point map only after its height-one completion realization.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- The chosen modular point maps to Q and Q is not in [p]F(Φ).
- The completed local map at the chosen residue points is an O-isomorphism, so it lifts every formal Q uniquely.
- In an adic-completion realization, Q is mapped to the elliptic point by the pinned formalPointHomAdicCompletion and lies in its stated range.
- The chosen point is supplied together with its modular preimage and formal O-module identification; transport of these markings preserves the image equality and primitivity.

**Checks.**

- λ(Q) has valuation one, so Q is primitive and [p]Q is not primitive.
- Multiplying f_E by (p+1)² keeps the derivative a p-unit.
- Ā with a_(p²)=−2p yields parameter −p; assigning +p reverses the required Honda sign.
- For p=5 the rescaling multiplier is 36≡1 modulo 5. A multiplier 5 has reduction derivative 0 and destroys the disk isomorphism.

*Needs:* §5.8; §5.2; §5.3; `WeierstrassCurve.formalPointHomAdicCompletion`; `WeierstrassCurve.formalPointHomAdicCompletion_injective`; `WeierstrassCurve.range_formalPointHomAdicCompletion`; LubinTateFormalModulesAndQuasiCanonicalLifts LT.4 (gap:formal-point-completion-realization).

### Examples

At p=5 use the conductor-27 class: μ=36, exceptional fibre bound 12, different bound 6, fine level M=6 and scaling multiplier 36. At p=7 the conductor-32 class gives μ=48, fibre bound 24, different bound 8 and M=8. At p=47 three generic invariants give at least 3μ points, exceeding μ/6.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: EllipticCurveModularity R29.6; EllipticCurveModularity R29.5; EllipticCurves Layer 3 (gap:supersingular-trace-classes); LubinTateFormalModulesAndQuasiCanonicalLifts LT.4; ModularCurvesPartII §§9.9–9.11, 13.2, 16.6; ModularCurves Layer 9; ModularCurvesPartII §§5.2–5.3, 13.7 (gap:integral-congruence-comparison); LubinTateFormalModulesAndQuasiCanonicalLifts LT.4; ModularCurves Layers 8–9; ModularCurvesPartII §12.1 (`gammaZeroPrime_mass`); EllipticCurves Layer 3 (gap:supersingular-trace-classes); SchemeAndStackFoundations §3.2; ModularCurvesPartII §§5.2–5.3; ModularForms Layer 10B; ModularCurves Layer 8; ModularCurves Layer 5; ModularCurvesPartII §§3.2, 3.9, 5.2–5.3 (gap:mixed-level-disk-comparison); `WeierstrassCurve.formalPointHomAdicCompletion`; `WeierstrassCurve.formalPointHomAdicCompletion_injective`; `WeierstrassCurve.range_formalPointHomAdicCompletion`; LubinTateFormalModulesAndQuasiCanonicalLifts LT.4 (gap:formal-point-completion-realization).

## Layer 6: The optimal local trace system

Use the marked fine-level elliptic lift A/O and primitive Q from Layer 5, the supplied quasi-canonical lattice quotients, and the scaled parametrization f_E. All x_s and y_s lie in the formal group of E, identified with the fixed F; the quasi-canonical curves themselves need not have the full O endomorphism ring.

### 6.1 Modular points from quasi-canonical lifts

For the marked A/O and an O-basis t of T_pA, let T_s=p^(−s)ℤ_p t+T_pA, C_s=T_s/T_pA and A_s=A/C_s, with A_0=A. Import the quasi-canonical theory: End(Â_s)=ℤ_p+p^sO, A_s is defined over Ψ′_s, and for s≥1 Gal(Ψ′_s/Φ)=(O/p^sO)×/(ℤ/p^sℤ)× of order p^(s−1)(p+1). Transport the prime-to-p level subgroup to define z_s∈X₀(N)(O_(Ψ′_s)); set x_s=f_E(z_s)∈F(Ψ′_s), with x_0=Q.

(BKO21, §5.0.2, pp.958–959; BKO21 line 712.)

A proof route is as follows. Take the actual marked lattice quotient and its smallest field from LubinTateFormalModulesAndQuasiCanonicalLifts LT.5–LT.8. Transport the prime-to-p level subgroup along each p-isogeny to define z_s, then apply the chosen scaled f_E to define x_s. Frobenius reduction of the marked chain and f_E(P̄)=0 put x_s in the formal kernel. The level-zero case is handled separately.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- z_s represents the actual quotient A/C_s with transported level structure.
- x_s is the image under the chosen scaled modular parametrization and x_0=Q.
- For s≥1 the ring-class field degree is p^(s−1)(p+1); Ψ′_0=Φ is a separate base case.
- Each x_s reduces to the identity, using the Frobenius reduction of the marked chain.
- The quotient isogeny A→A_s transports the prime-to-p cyclic marking isomorphically and commutes with the Galois action, so z_s and x_s have the asserted field of definition.
- Changing the Tate marking transports the lattice quotient and its cyclic-level point equivariantly; its field and formal-image comparisons use the transported markings.

**Checks.**

- A_0=A, C_0=0 and x_0=Q; the formula p^(s−1)(p+1) is not used at s=0.
- [Ψ′_1:Φ]=p+1, and its tame group is not Δ of order p²−1.
- Every x_s is in the range of the existing formal-point map, not merely an arbitrary elliptic point.
- At p=5 the primed field degrees for s=0,1,2 are 1,6,30, whereas the first LT field degree is 24. The same modular image at s=0 is Q, not a tame trace of x_1.

*Needs:* §5.9; ModularCurves Layer 8; LubinTateFormalModulesAndQuasiCanonicalLifts LT.5–LT.8.

### 6.2 The optimal local-point system

Let Δ′ be the subgroup of order p+1 of Gal(Ψ′∞/Φ); its fixed field in Ψ′_(s+1) is Ψ_s. Define y_s=Σ_(d∈Δ′)d x_(s+1)∈F(Ψ_s) for s≥0, with formal addition, and y=[p+1]Q∈F(Φ).

(BKO21, Definition 5.4 and Theorem 5.5(i), p.959; BKO21 line 739.)

A proof route is as follows. Apply the supplied fixed-field comparison (Ψ′_(s+1))^Δ′=Ψ_s and its formal trace square. The chosen elliptic formal O-module identification transports the trace to F. Multiplication by the unit p+1 preserves primitivity.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- y_s is fixed by Δ′ and belongs to F(Ψ_s).
- y=[p+1]Q is primitive because p+1 is a unit.
- The trace has p+1 terms from x_(s+1), rather than p²−1 terms from x_s.
- The tame trace is the sum in the existing formal group, hence O-linear and Galois-equivariant. Inclusion into a larger field commutes with that sum.
- Formal traces commute with the specified O-action and with further traces; equality of systems is equality of all finite formal-point coordinates.

**Checks.**

- y_0 is the Δ′ trace of x_1; it is not x_0=Q.
- [p+1] preserves p-primitivity of Q, whereas [p] does not.
- If Q were zero the resulting y would fail the primitive acceptance condition; the construction records the nonzero primitive input.
- At p=5 the tame trace has 6 terms. Its zero-level value y_0 is 0, although y=6Q remains primitive and is nonzero. Replacing Δ′ by Δ gives 24 terms and the wrong field.

*Needs:* §6.1; LubinTateFormalModulesAndQuasiCanonicalLifts LT.8–LT.9.

### 6.3 Hecke traces of the supplied lattice neighbors

Apply the neighboring-lattice theorem of LubinTateFormalModulesAndQuasiCanonicalLifts LT.7 to the marked quotients in §6.1, and identify its outward orbit with the actual modular Hecke correspondence. For s≥1 the modular images satisfy T_p x_s=Tr_(Ψ′_(s+1)/Ψ′_s)x_(s+1)+x_(s−1). At s=0 all p+1 neighbors form the Δ′-orbit of x_1 and T_p x_0=Σ_(d∈Δ′)d x_1. Here T_p x_s means the Hecke action transported through the modular quotient, hence [a_p(E)]x_s on E. This target owns that modular identification and trace, not a second lattice classification.

(BKO21, Proof of Theorem 5.5(ii), p.959; BKO21 line 753.)

A proof route is as follows. Use the supplied inward/outward lattice orbits, transport their level structures through the genuine integral Hecke correspondence and then apply the quotient eigenrelation T_p=a_p(E). On a basis e₁=p^(−s)t, e₂=θt the outward lattices have generator (e₁+a e₂)/p; retaining θ is necessary to obtain the actual p-element orbit.

**Checks.**

- At p=5,s=1 the outward lines in 𝔽₅² are (1,0),(1,1),(1,2),(1,3),(1,4), with determinant b−a≠0 for a≠b, and the inward line is (0,1). Omitting θ makes all five scalar lattices equal.

*Needs:* §6.1; ModularCurvesPartII §§9.9–9.11, 13.2, 16.6; ModularCurves Layer 8; LubinTateFormalModulesAndQuasiCanonicalLifts LT.7/lattice-neighbors; ModularCurvesPartII §9.11 (gap:good-model-hecke-comparison).

### 6.4 The optimal point trace relations

The system satisfies y∉[p]F(Φ), y_0=0, Tr_(Ψ_1/Φ)y_1=−y, and Tr_(Ψ_(s+1)/Ψ_s)y_(s+1)=−y_(s−1) for every s≥1. The trace is formal-group addition over the actual field embeddings.

(BKO21, Theorem 5.5, p.959; BKO21 line 746.)

A proof route is as follows. Set a_p(E)=0 in §6.3. At level zero the tame neighbor sum is y_0=0. At the first wild level the backward point Q contributes (p+1)Q=y, giving −y. Higher relative traces followed by the tame trace give the two-step recurrence, using the supplied adjacent-field rectangle to rule out an extra factor p.

**Checks.**

- At p=5, y=6Q, y_0=0, Tr_(1/0)y_1=−6Q and Tr_(2/1)y_2=0. The boundary −6Q is distinct from −y_0=0.

*Needs:* §6.2; §6.3; ModularCurvesPartII §9.11 (gap:good-model-hecke-comparison).

### 6.5 Parity of the optimal points

For every s≥0, y_s∈A_s⁺ if s is even and y_s∈A_s⁻ if s is odd. For odd n≥1, Tr_(Ψ_n/Φ)y_n=(−1)^((n+1)/2) p^((n−1)/2)y.

(BKO21, Theorem 5.5, p.959; Rubin87 Corollary 6.2, p.416 and Lemma 7.2, p.417; BKO21 line 748; Rubin87 line 474; Rubin87 line 519.)

A proof route is as follows. Apply each character logarithm to the trace relations. A top-level character has the complementary allowed parity, while inherited characters reduce to the earlier recurrence. The initial trace and y_0 fix the trivial-character boundary. Total trace across an inherited point contributes an additional p at each two-step descent.

**Checks.**

- For n=1,3,5 the odd total traces are −y, py, −p²y; at p=5 these are −y,5y,−25y. The total trace of y_2 is 0.

*Needs:* §6.4; §3.2; §3.1.

### Examples

At p=5 the primed degrees 1,6,30,150 give tame-fixed degrees 1,5,25. The first five outward lines are (1,a), a∈𝔽₅, and the remaining inward line is (0,1). The local system has y=6Q, y_0=0, first trace −6Q and second trace 0; its odd total traces are −y,5y,−25y.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: ModularCurves Layer 8; LubinTateFormalModulesAndQuasiCanonicalLifts LT.5–LT.8; LubinTateFormalModulesAndQuasiCanonicalLifts LT.8–LT.9; ModularCurvesPartII §§9.9–9.11, 13.2, 16.6; LubinTateFormalModulesAndQuasiCanonicalLifts LT.7/lattice-neighbors; ModularCurvesPartII §9.11 (gap:good-model-hecke-comparison); ModularCurvesPartII §9.11 (gap:good-model-hecke-comparison).

## Layer 7: Minus-point cohomology and freeness

Use the actual signed points and primitive system from Layers 3 and 6. In cohomology A⁻ has its discrete direct-limit action; finite A_n⁻ is a torsion-free O-lattice, and G_n is cyclic of order p^n. Cardinalities of O/π^k are p^(2k).

### 7.1 The minus-point Herbrand quotient

For odd n≥1 and G_n=Gal(Ψ_n/Φ), the finite Tate and first cohomology groups of A_n⁻ satisfy h_n(A_n⁻)=|Ĥ⁰(G_n,A_n⁻)|/|H¹(G_n,A_n⁻)|=p^(n−1).

(Rubin87, Lemma 7.1, p.417; Rubin87 line 508.)

A proof route is as follows. Use a finite-index lattice with rational representation O[G_1]⊕⊕_(3≤k≤n, k odd) O[G_k]/O[G_(k−1)], where the embeddings are norm embeddings. For G_n acting through G_k, its zeroth Tate group on O[G_k] is O/p^(n−k)O and its first cohomology is zero. Herbrand multiplicativity and |O/pO|=p² give p^(2(n−1)) times (p^(−2))^((n−1)/2)=p^(n−1).

**Checks.**

- At p=5,n=1 the Herbrand quotient is 1. At n=3 it is 5⁴·5^(−2)=25, and at n=5 it is 5⁸·5^(−4)=625. Using residue cardinality 5 instead of 25 would give 5 at n=3 and fails.

*Needs:* §3.3; §3.2; `TauCeti.TateCohomology.H0IsoNormQuotient`; `TauCeti.TateCohomology.HNegOneIsoNormKernelQuotient`; `Rep.FiniteCyclicGroup.periodicIso`; `TauCeti.TateCohomology.herbrandQuotient`; `TauCeti.TateCohomology.herbrandQuotient_eq_one_of_finite`; `TauCeti.TateCohomology.herbrandQuotient_eq_natCard_H2_div_natCard_H1`; `TauCeti.TateCohomology.herbrandQuotient_eq_mul_of_shortExact`; `TauCeti.TateCohomology.herbrandQuotient_eq_of_finite_kernel_of_finite_cokernel`.

### 7.2 Vanishing of minus-point first cohomology

For odd n≥1, H¹(G_n,A_n⁻)=0. Consequently H¹_cont(Γ⁻,A⁻)=0, with A⁻ given its discrete direct-limit Galois-module structure for this invariant calculation.

(Rubin87, Lemma 7.2 and Proposition 7.3, p.417; Rubin87 line 519.)

A proof route is as follows. The invariant lattice is F(Φ). The total trace of y_n spans p^((n−1)/2)Oy, and primitivity plus λ:F(Φ)≃pO gives Oy=F(Φ). Thus the zeroth Tate cardinality is at most p^(n−1); dividing by §7.1 forces first-cohomology cardinality one. A continuous cocycle into discrete A⁻ has finite image. At a sufficiently large odd level its restriction to the open stabilizer is a continuous homomorphism into a torsion-free discrete lattice, hence zero, so the finite calculation kills it.

**Checks.**

- At p=5,n=3 the primitive norm contains 5Oy, so |Ĥ⁰|≤|O/5O|=25. Since h=25, the first-cohomology cardinality is at most 1 and therefore equals 1. If y were 5 times a primitive vector, the same bound would instead be 625 and would not force vanishing.

*Needs:* §7.1; §6.5.

### 7.3 The minus divisible-point invariants

(D⁻)^(Γ⁻)=F(Φ)⊗_O Φ/O≃Φ/O, via the actual inclusion of base-field formal points.

(BKO21, Corollary 5.6, p.959; Rubin87 Proposition 7.4 and its preceding lemmas, p.417; BKO21 line 769; Rubin87 line 529.)

A proof route is as follows. Take invariants in 0→A⁻→A⁻[1/π]→D⁻→0. Torsion-freeness identifies rational invariants with F(Φ)[1/π], and §7.2 kills the obstruction. Under the actual base inclusion, the quotient is F(Φ)⊗Φ/O. The argument consumes the local primitive trace system of Layer 6.

**Checks.**

- The base logarithm lattice is pO. Its tensor with Φ/O is isomorphic to Φ/O via the inclusion of base points into D⁻; it has π^k-torsion cardinal p^(2k), hence 25 at p=5,k=1. This is distinct from pretending that the induced map pO⊗Φ/O→O⊗Φ/O is injective.

*Needs:* §7.2; §3.2; §2.4.

### 7.4 The minus quotient and kernel are free

X⁻=V∞*/V∞*,− is free of rank one over Λ, and V∞*,− is free of rank one. The quotient is taken from V∞* throughout.

(BKO21, Corollary 5.6, p.959; Rubin87 Lemma 4.3, p.410; BKO21 line 781.)

A proof route is as follows. Dualize §7.3 to identify X⁻/(γ−1)X⁻ with O. Topological Nakayama makes X⁻ cyclic. Its positive Λ-rank excludes a nonzero cyclic annihilator in the domain Λ. Split Λ²→Λ; its finite projective rank-one kernel is free over the local ring Λ.

**Checks.**

- The coinvariant O reduces to O/pO of cardinal 25 at p=5 and dimension 1 over its residue field. The cyclic torsion module Λ/(T) has that same residual dimension but Λ-rank 0, so the positive-rank hypothesis is essential.

*Needs:* §7.3; §3.6; §3.7; CompletedCohomologyPartII §§3.1–3.2; PadicMeasuresIwasawaAlgebras §5.2; PadicMeasuresIwasawaAlgebras §§4.2–4.5; Mathlib finite projective modules over local rings.

### Examples

At p=5,n=3 the Herbrand quotient is 25 and the primitive trace spans 5Oy, so the zeroth Tate cardinality is at most 25 and the first-cohomology cardinality is 1. Dual invariants give one O-generator in the coinvariant quotient. Λ/(T) has the same residual dimension but rank 0, showing why the positive-rank input is necessary.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: CompletedCohomologyPartII §§3.1–3.2; Tau Ceti cyclic Tate cohomology, periodicity and Herbrand quotient (the pinned declarations in §7.1 and the supplier contract); PadicMeasuresIwasawaAlgebras §5.2; PadicMeasuresIwasawaAlgebras §§4.2–4.5; Mathlib finite projective modules over local rings.

## Layer 8: Integral decomposition and finite Kummer images

Use both primitive inputs: the optimal plus unit ξ* of Layer 4 and the free minus quotient of Layer 7. Every integral assertion retains O and Λ, and every finite signed image uses the actual Kummer map of Layer 2.

### 8.1 Generation detected by the augmentation derivative

Let q:V∞*→X⁻ be the free rank-one quotient. The descended δ:X⁻→O is Λ-linear for augmentation, and q(ξ*) generates X⁻, because δ(ξ*) is a unit. In coordinates X⁻≃Λ, writing q(ξ*)=f(T)e gives δ(q(ξ*))=f(0)δ(e), so f(0) is a unit and f(T) is a unit.

(BKO21, Proof of Theorem 5.8, p.960; corrected use of Rubin87 Lemma 4.2, p.410; BKO21 line 793; Rubin87 line 249.)

A proof route is as follows. The minus module is killed by δ, so δ factors through q. In a basis e of X⁻ write q(ξ*)=f(T)e. Augmentation linearity gives δ(q(ξ*))=f(0)δ(e). A unit product in O forces f(0) to be a unit; apply `PowerSeries.isUnit_iff_constantCoeff`. Continuity alone gives no such conclusion.

**Checks.**

- The continuous coefficient-of-T functional sends T to 1, but T has constant coefficient 0 and is not a unit. The augmentation functional sends T to 0. For f=1+pT, f(0)=1 and f is a unit; for f=p+T, f(0)=p and f is not a unit.

*Needs:* §7.4; §4.5; §1.4; `PowerSeries.isUnit_iff_constantCoeff`.

### 8.2 The integral signed decomposition

The inclusion V∞*,+⊕V∞*,−→V∞* is an isomorphism of compact Λ-modules. Each summand is free of rank one; V∞*,+=Λξ*. The inverse twist equivalence transports this to the corresponding twisted local-unit statement. All assertions hold over O and Λ before inverting p.

(BKO21, Theorem 2.1, p.949 and Theorem 5.8, p.960; BKO21 line 306; BKO21 line 791.)

A proof route is as follows. The plus inclusion into X⁻ is injective by disjointness and surjective because it contains the generator q(ξ*). This gives the actual plus section of the quotient, with V∞*,+=Λξ*. The minus kernel is free. A continuous bijection from a compact space to a Hausdorff space is a homeomorphism, giving the compact-module assertion.

**Checks.**

- In the signed basis the addition map is the identity matrix on Λ² and has determinant 1. The pair Λe₁ and Λ(e₁+pe₂) is rationally complementary but has determinant p and quotient Λ/pΛ; it fails the integral surjectivity condition. At p=5 this cokernel is 𝔽₂₅[[T]]: its quotient by T has 25 elements, and the classes of 1 and T are linearly independent over 𝔽₂₅, so the cokernel is infinite and is not O/5O.

*Needs:* §8.1; §3.7; §1.5.

### 8.3 Nonzero character derivatives on the full unit module

For every finite χ of Γ⁻, δ_χ:V∞*→ℂ_p is nonzero (with a fixed embedding of its coefficient field).

(BKO21, Corollary 2.2, p.949; Rubin87 Lemma 10.1, p.421; Rubin87 line 665.)

A proof route is as follows. Choose a nonzero deep formal point in the rational character orbit of χ. If δ_χ vanished on every unit, coefficient-Galois conjugacy and the trace reciprocity formula would kill all pairings of this point and every π-power denominator. Finite-level saturation supplies a nonzero divisible point class, contrary to Kummer perfectness. This includes χ=1.

**Checks.**

- For χ=1 the optimal unit has δ_1=(1+1/p)δ≠0, namely 6δ/5 at p=5. For an exact-order-25 character its rational orbit dimension is 20; a deep nonzero point in that orbit has a nonzero class after a sufficiently large π-denominator.

*Needs:* §2.5; §3.3; §3.5; §1.3.

### 8.4 Every matching-parity derivative of a signed generator is nonzero

For ε=±, every Λ-generator v_ε of V∞*,ε and every χ∈Ξ^ε satisfy δ_χ(v_ε)≠0. For χ∈Ξ^(−ε), δ_χ(v_ε)=0 by definition. In particular δ(v_+) is a unit for any plus generator.

(BKO21, Corollary 2.2, p.949; Rubin87 Lemma 10.1, p.421; BKO21 line 308; Rubin87 line 665.)

A proof route is as follows. For a matching character, the opposite summand is already killed. Vanishing on its signed generator would kill both summands by character covariance, contradicting §8.3. Changing generator multiplies the value by the nonzero specialization of a Λ-unit. The augmentation of this unit is an O-unit, so the stronger δ-unit assertion follows from ξ*.

**Checks.**

- At χ=1, δ(v_+) has valuation 0 and δ(v_−)=0. Changing v_+ to −v_+ changes δ by −1 and keeps valuation 0. For an order-25 character a plus generator has derivative 0 and a minus generator has nonzero derivative.

*Needs:* §8.2; §8.3; §1.3.

### 8.5 Finite signed points and their Kummer images

For each n and ε, export the existing A_n^ε as {y∈F(Ψ_n):λ_χ(y)=0 for all χ∈Ξ^ε factoring through Gal(Ψ_n/Φ)}. Its image A_n^ε⊗Φ/O in H¹(Ψ_n,F[π∞]) is defined through the actual Kummer map and is injective. Inclusions and formal traces preserve these signed modules; their transition maps agree with restriction and corestriction of the Kummer images. A Selmer consumer imports these carriers and images, rather than defining a second parity condition.

(BKO21, §6.0.2, pp.962–963, compared with §4, pp.954–955; BKO21 line 860.)

A proof route is as follows. All characters above the finite level vanish automatically on its points. Use the actual connecting map and saturation for injectivity of the signed Kummer image. For χ factoring through Ψ_n, normalized logarithms satisfy λ_χ(Tr_(n+1/n)y)=pλ_χ(y); characters above the target level vanish there. This proves compatibility with restriction and corestriction without a finite-invariant control assertion.

Its API consists of the following facts on these same carriers and with these same hypotheses.

- A cohomology class belongs to the signed image exactly when it is the Kummer image of an element of A_n^ε⊗_O Φ/O; the signed point condition uses the same-parity logarithms at that level.
- The map A_n^ε⊗_O Φ/O→H¹(Ψ_n,F[π∞]) is O-linear and injective, with its source included through the saturated formal-point submodule.
- For m≥n, restriction takes the sign-ε image at n to that at m via point inclusion, and corestriction takes it at m to that at n via formal trace; the two squares with Kummer maps commute.
- The image is an O-submodule: zero is the Kummer image of zero, and the sum of two Kummer classes is the class of the sum of their signed divisible points.

**Checks.**

- At n=0 the plus Kummer image is 0 and the minus image is the full base formal image, of O-corank one. A primitive base point Q gives a nonzero class Q⊗π⁻¹ in the minus image.
- For a base point of logarithm a and a degree-5 trace, λ_1(Tr y)=5a=5λ_1(y); replacing 5 by π=−5 gives the wrong sign. The identity extension has trace and restriction equal to the identity.
- At p=5,n=2, the plus Kummer image has O-corank 20, from the 20 exact-order-25 characters of odd conductor 3. The minus image has O-corank 5, from the trivial character and four exact-order-5 characters of even conductor; the sum 20+5=25 matches the full formal-point corank.

*Needs:* §3.2; §2.1; §3.5; §3.6.

### Examples

If q(ξ*)=(1+pT)e and δ(e)=1, its derivative is 1 and the coefficient series is a unit. For q(ξ*)=Te, the continuous coefficient-of-T map gives 1 but augmentation gives 0, so this functional cannot supply the generation theorem. The integral signed addition map has determinant 1; a merely rational complement with determinant p fails.

### Dependencies

The subsection *Needs:* lines give the internal dependencies. External inputs: `PowerSeries.isUnit_iff_constantCoeff`.

## Downstream consumers

InertAnticyclotomicCMMainConjecture imports §0.1’s conductor parity, §2.4’s anticyclotomic Kummer pairing, §§3.1–3.2’s character logarithms and signed points, §3.6’s annihilators, §§4.2–4.4’s projected CM class and its reciprocity values, §8.2’s integral decomposition, §8.4’s generator nonvanishing and §8.5’s finite Kummer images. Its global signed p-adic L-functions, Selmer conditions and main-conjecture arguments use these actual carriers and normalizations. HeegnerPointEulerSystems and SelmerIwasawaCohomologyPartII are prospective consumers of §8.5 when their scope includes inert supersingular signed local conditions. Their global constructions retain their own ownership. The early CM argument uses the supplier contracts above; the local cohomology calculation uses the primitive system of Layer 6.

## Worked examples

For the auxiliary field, take D=−7 for p=3,5,13,17,19,31,41,47; D=−15 for p=7,11,29,37,43; and D=−31 for p=23. The reduced primitive positive-definite forms are (1,1,2) at −7; (1,1,4),(2,1,2) at −15; and (1,1,8),(2,−1,4),(2,1,4) at −31. The reduction conditions |b|≤a≤c, b²−4ac=D, primitivity, and the nonnegative-b boundary convention give exactly 1,2,3 classes. Each D≡1 modulo 8, so 2 splits; each selected p has (D/p)=−1 and does not divide its selected class number. The choices make every odd prime p≤47, including p=3 outside the standing range, part of the same field-existence theorem (BKO21 Lemma 3.1, pp.950–951; BKO21 line 339; ImaginaryQuadraticClassNumber H1.3, H2.1).

At p=5 an exact-order-5 character belongs to Ξ⁺ because c=2. Its derivative on a plus generator is nonzero, while its logarithm on every plus point is zero. For N=27, μ=36, the ramification bound is 6 and the exceptional fibre has at least 12 points. Level M=6 is fine with φ(M)=2, and the rescaling multiplier is 36. The trace system starts at y=6Q, y_0=0 and Tr_(Ψ_1/Φ)y_1=−6Q, not at a zero first trace (BKO21 Theorems 5.5, 5.8, pp.959–960; BKO21 line 746).

At p=47 the mass relation is 46=12·3+4+6. The generic scalar-Frobenius representatives give 3μ rational cyclic-level points. This exceeds μ/6. The expression μ(3−3/2−1−1/2)=0 supplies no positive lower bound; the generic-fibre argument proves the required point without that loss (BKO21 Lemma 5.2(ii) and proof, pp.956–957; BKO21 line 594).

For the neighbor calculation at s=1, choose O=ℤ_p⊕ℤ_pθ, e₁=p⁻¹t and e₂=θt. The outward lattices are ℤ_p((e₁+a e₂)/p)+ℤ_p e₂ and the inward lattice is ℤ_p e₁+ℤ_p(e₂/p). The p directions (1,a) are distinct, and the remaining direction is (0,1). Replacing θ by the scalar 1 makes 1+ap a unit of ℤ_p for every a, collapsing all outward candidates to a single lattice. The distinct orbit is what supplies the Hecke trace, rather than a list of repeated modular points (BKO21 proof of Theorem 5.5(ii), p.959; BKO21 line 753; LubinTateFormalModulesAndQuasiCanonicalLifts LT.7/lattice-neighbors).

For the final generation argument, write X⁻=O[[T]]e and q(ξ*)=f(T)e. Augmentation linearity gives δ(q(ξ*))=f(0)δ(e). A unit value forces f(0) to be a unit, hence f to be a unit, and the actual plus inclusion surjects onto X⁻. Coefficient extraction at T takes T to 1 while T remains a nonunit, showing exactly why continuity alone cannot replace augmentation linearity. The resulting plus section and the minus kernel give the integral direct sum (BKO21 proof of Theorem 5.8, p.960, BKO21 line 793; Rubin87 Lemma 4.2, p.410, Rubin87 line 249, with the augmentation hypothesis made explicit).

## References

The bibliography identifies the published versions. Source line numbers refer to text extractions of those versions; theorem, section and printed-page locators identify the claims independently of extraction layout. Statements and proof routes are written independently of the source wording.

- **BKO21** — A. A. Burungale, S. Kobayashi and K. Ota, *Rubin’s conjecture on local units in the anticyclotomic tower at inert primes*, Annals of Mathematics 194 (2021), 943–966. [Institutional published copy](https://authors.library.caltech.edu/records/8svwt-jn031). Principal locators: §2, pp.947–949; Lemma 3.1, Proposition 3.3 and Theorem 3.4, pp.950–954; §4, pp.954–955; Lemmas 5.1–5.2 and Theorems 5.5, 5.8, pp.956–960; §6.0.2, pp.962–963.
- **Rubin87** — K. Rubin, *Local units, elliptic units, Heegner points and elliptic curves*, Inventiones mathematicae 88 (1987), 405–422. [GDZ published scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0088/LOG_0026.pdf). Proposition 1.1, §2, Lemmas 4.1–4.4, Proposition 4.5, §§5–7 and Lemma 10.1; the integral denominator assertion is Lemma 5.5(vi).
- **Haz77** — M. Hazewinkel, *On norm maps for one dimensional formal groups III*, Duke Mathematical Journal 44 (1977), 305–314. [Institutional copy](https://ir.cwi.nl/pub/10014/10014D.pdf). Theorem 1.3, pp.305–306, and proof §§2–4. Its absolutely unramified base hypothesis is retained when its exact depth formula is quoted.
- **Win80** — J.-P. Wintenberger, *Structure galoisienne de limites projectives d’unités locales*, Compositio Mathematica 42 (1980), 89–103. [Numdam copy](https://www.numdam.org/article/CM_1980__42_1_89_0.pdf). §4 theorem (i),(iii), pp.91–92; §§5.2–5.5.3, pp.93–98.
- **AU96** — A. Abbes and E. Ullmo, *À propos de la conjecture de Manin pour les courbes elliptiques modulaires*, Compositio Mathematica 103 (1996), 269–286. [Numdam copy](https://www.numdam.org/article/CM_1996__103_3_269_0.pdf). Theorem A, p.269; Propositions 3.3–3.4 and Zagier’s Lemma 3.2, pp.276–278; proof of Theorem A, p.279.

- **Wiles78** — A. Wiles, *Higher explicit reciprocity laws*, Annals of Mathematics 107 (1978), 235–254, [published locator](https://doi.org/10.2307/1971143), uncertified. The local trace formula used here is stated in Rubin87 Theorem 5.3, p.412, and BKO21 §4, p.955; no assertion about an internal step of the original proof is used.

- **Kato93** — K. Kato, *Lectures on the approach to Iwasawa theory for Hasse–Weil L-functions via B_dR. I*, in Arithmetic Algebraic Geometry (Trento, 1991), Lecture Notes in Mathematics 1553 (1993), 50–163. [Published locator](https://doi.org/10.1007/BFb0084729), Chapter II, Theorem 2.1.7, uncertified. BKO21 line 467 identifies this form of explicit reciprocity.
