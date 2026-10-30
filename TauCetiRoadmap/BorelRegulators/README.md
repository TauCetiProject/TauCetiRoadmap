# Roadmap: archimedean regulators, primitive periods and arithmetic volumes

**Summary.** Build the Chern-normalized Borel regulator on the actual higher Quillen groups of every number field, its integral image lattice and its zeta covolume. The proof passes through rational-gauge arithmetic volumes and compact primitive periods, includes the rank-zero case, and identifies the number-field target with real Deligne cohomology and the universal Beilinson regulator. The arithmetic ranks and stable comparison, general K-theory, characteristic classes, differential geometry and adelic measures are supplied by their own roadmaps. Layer 6 calibrates the shared universal real Chern realization and constructs its infinitesimal comparison.

## Scope and ownership

This roadmap owns the embedding Tate lattice, the specified arithmetic regulator and its real isomorphism, the point realization and Borel–Beilinson comparison, the arithmetic division-algebra volume specialization, and the primitive-period determinant and zeta covolume. The number-field regulator block supplies determinant-line and mixed Tate applications; those applications do not enter its proof. EndoscopicTransferAndUnitaryTraceComparison §6.2 supplies the norm-one Tamagawa theorem; §3.4 identifies its mass in Borel’s gauge.

ColemanIntegration §L3.Fc.1 uses the complex Beilinson regulator in its integral-image and rational-injectivity theorem for finite Galois number fields; that theorem, its coefficient-idempotent pairings and its discriminant/regulator determinants remain there. Section 6.0a identifies that map with the complex-point specialization of MotivicEtaleKTheory §7.1. Sections 2.2–2.3 and 5.3 here construct the Chern-normalized Borel regulator for every number field through the arithmetic comparison; §6.2 compares its normalization with that same universal Beilinson regulator. The all-number-field Borel construction differs from ColemanIntegration’s Galois Beilinson specialization in both scope and normalization. HeightsRationalPointsAndObstructions §3.6 uses period–index equality directly from Poonen Theorem 1.5.36(iii)–(iv). IntegralIwasawaTheory §6.0 owns totally real Siegel–Klingen rationality; LFunctions Layer 3 and §1.3 turn its trivial-character value at 1−n into the positive even-value formula. Section 5.1 contains the dₙ=0 case of the general period comparison.

ArithmeticKTheory §§3.2–3.4 owns finite generation, the actual rational localization and order equivalences, the stable arithmetic and relative-Lie comparison and Borel ranks. These theorems are inputs here, independent of regulator values. GeneralAlgebraicKTheory §§2.5, 3.2, 3.12 and 7.7–7.8 owns Quillen groups, the plus/Q comparison and transfers; StableHomotopyKTheory §§3.37,4.14 owns the finite-type rational H-space comparison and stable GL plus multiplication. CharacteristicClasses C5a/C6 and TopologicalKTheory T4/T7 own compact transgression, characteristic classes and Bott theory. The integral suspended-Chern calibration is the CharacteristicClasses C6 item 3 extension specified below; §2.1 uses that calibration on the continuous class. Section 4.3 computes their specific rational Lie-algebra-to-compact period for restriction of scalars of SL, rather than another compact-Lie cohomology theory.

MotivicEtaleKTheory §§3.3–3.4, 4.1–4.2 and 7.1 owns compactification-independent real Deligne cohomology, its products and the independently constructed universal Deligne Chern character. Section 6.0a imports those objects and proves their topological calibration, conjugation and finite-transfer interfaces; §6.0b owns the infinitesimal classifying comparison needed for the number-field normalization theorem. Higher-cycle model comparisons, the motivic Chern equivalence and supported cycle realization remain in MotivicEtaleKTheory and are not inputs here. Sections 6.1–6.2 identify the point/embedding target and compare the two independently constructed regulators. Polylogarithms §§2.3,3.7–3.8,4.4 owns explicit symbol comparisons and their factorial/Hurewicz and π^(n−1) calibrations. None supplies an input to this proof.

The pinned definitions of embeddings, discriminant, module quotients, exterior powers, determinants, discrete full lattices and covolume are used directly. Mathlib’s exterior-power dimension and functor laws and its lattice index/covolume identity are imports, not separate targets. ClassFieldTheory Layers 5 and 10 own local invariants, finite support, the zero-sum criterion and injectivity of global localization; §3.1 adds equality with the division-algebra degree, using the pinned algebraic/cohomological Brauer comparison. SemisimpleAlgebras Layer 6 and its Part II extension own divisibility of finite splitting degrees by the index. Tau Ceti owns the generic central-simple index, division-representative uniqueness and splitting-field carrier; §§3.1–3.2 add number-field arithmetic to those objects. Tau Ceti’s TauCeti.Hodge.tate in TauCeti/Geometry/Hodge/Tate/Basic.lean:91 is a Hodge structure with the ordinary unscaled inclusion of ℤ into ℂ as its lattice map. The coefficient lattices here instead specify multiplication by (2πi)^k and the embedding involution; they introduce no second Hodge-structure carrier. The degree-one unit lattice and Dirichlet regulator are already in Mathlib and the completed NumberFieldArithmetic roadmap. At weight one the unit regulator lies in the sum-zero hyperplane; the whole group Fˣ has no finite-rank lattice theorem. No positive-characteristic global-field regulator, nonpositive-weight value theorem or integral Lichtenbaum torsion formula is asserted here. All number fields, finite primes, ramification and both parities occur in the higher-weight theorem.

## Conventions

A number field F has O_F its full ring of integers, Σ_F all embeddings into ℂ, N=[F:ℚ]=r₁+2r₂, and Δ_F=|disc F|>0. Groups are actual connective Quillen groups, written additively; tensor products of their underlying ℤ-modules use the scalar-tower identifications of their suppliers. The main higher-weight hypotheses are n≥2; the elementary Tate target and point quotient are also defined at n=1. All finite extensions carry their specified algebra structure. Universes are arbitrary within the native field and category carriers; Σ_F is finite without a choice of a universe-sized enumeration.

The rational, real and integral Tate lines are ℚ(k)=(2πi)^kℚ, ℝ(k)=(2πi)^kℝ and ℤ(k)=(2πi)^kℤ. Conjugation acts simultaneously on the embeddings and coefficients. In the selected coordinates one divides by (2πi)^(n−1), taking all real embeddings in odd weight and one representative of each complex pair in either parity. Real coordinates at fixed embeddings vanish in even weight. Thus dₙ=r₁+r₂ for odd n and dₙ=r₂ for even n. A complex representative change has sign (-1)^(n−1). Rows index the selected embeddings and columns index K-basis elements. The coordinate lattice has covolume one. Ordered determinants are signed; covolumes are positive absolute determinants. An empty exterior generator, empty determinant and zero-dimensional normalized covolume are all 1.

Write x∈ℚˣ·y to mean that x=qy for some nonzero rational q, and x∈ℚ_>0·y for a positive rational q. This notation does not assign meaning to a quotient by zero. Every use below proves the two quantities nonzero. Powers with possibly negative exponent, such as π^(dₙ−Nn), are integer powers over ℝ, never natural subtraction. For real s>1, ζ_F(s) is the positive real ideal sum whose inclusion in ℂ equals `NumberField.dedekindZeta F s`. Continued zeta values and leading coefficients refer to the analytic germ supplied by LFunctions Layer 3; no out-of-convergence value of the raw series or totalized Gamma value is used.

The cohomological comparison in degree q is jℝ=i^q μ for the identical complex extension μ of invariant forms. Its primitive determinant has zeta exponent −Nn. The Tate-divided renormalized regulator has exponent dₙ−Nn. The two are linked by §5.2, not identified. For n≥2 the compact generator is εₙ=(-1)^n clutch(u^n) for the ordered complex suspension and TopologicalKTheory’s u=O(-1)−1. The twisted character is chₙᵗʷ=(2πi)^n·chₙ, valued in ℚ(n), where chₙ is the rational character of CharacteristicClasses C6 item 2 (burgos2002, Remark 4.25, p.32, burgos2002 line 1423–1431, suspended formula). The rational character is -v at the Bott coefficient, so u² and -u³ have character coordinates +1 and +1 in their respective weights. The integral calibration contract proves that εₙ pairs suspended chₙ to 1 and suspended chₙᵗʷ to (2πi)^n. With the shared f−r cone, its positive small-model point coordinate and this topological Chern lift, r_Bo=−2r_Be; the signed determinant ratio is (−2)^dₙ and the covolume ratio is 2^dₙ. Section 6.2 derives this sign from Burgos’s r−f evaluation convention (burgos2002 line 3901–3904, 4024–4036 and 4139–4140).

For an ordered integral basis (b₁,…,b_N) and the same ordered embeddings (σ₁,…,σ_N) used in every exterior product, put δ_F=det(σᵢ(bⱼ)). Thus δ_F²=disc F=(−1)^r₂Δ_F and |δ_F|=√Δ_F. Rational restriction-of-scalars forms in §§4.3–4.6 use δ_F, including its phase, rather than a positive square root of Δ_F. In degree q=2n−1 their embedding wedge is multiplied by δ_F^(−q). This is Borel’s corrected convention (borel1980, Errata-Corrigé, p.373, items 1–3, borel1980 line 29–43). The absolute determinant formulas use |δ_F| only after constructing those rational forms; jℝ remains the actual real map of §4.2.

At finite places q_v=#k_v≥2, additive mass of O_v is 1, and at infinity the coordinate measures are dx and 2dxdy. Borel’s infinite measure for a dimension-h group is Δ_F^(−h/2) times the infinite product of local gauges. Its finite product has no second discriminant scalar. Symmetric spaces use left K-cosets, so the bundle over the arithmetic quotient is K→G(ℝ)/Γ→K\G(ℝ)/Γ. The Cartan map in §5.2 uses right SO-cosets. Inversion identifies the left and right homogeneous-space models and their transported forms. Left and right Haar quotient measures are identified by inversion for these unimodular groups; counting measure on discrete arithmetic subgroups fixes finite-index volume changes. One nonzero global rational form fixes every local gauge. A complex coordinate chart change uses the squared complex absolute value.

**Checks.**

- A weight-two imaginary pair has divided coordinates (t,-t); a weight-three pair has (t,t). A real weight-two coordinate is 0. The weight-three Tate generator is -4π² and its divided coordinate is 1.
- The degree-one and degree-two correction factors multiply to i·(-1)=-i=i³. In degree five the correction is i. For the ordered basis (1,i) of ℤ[i] and embeddings (i↦i,i↦−i), the embedding determinant is −2i, its square is disc ℚ(i)=−4, and its absolute value is 2=√Δ_F.
- On a one-dimensional test lattice tℤ with t≠0, covolume is |t|. The sublattice 2tℤ has covolume 2|t|. In dimension zero the value is 1 in both conventions.
- At weight 2 the supplied point inclusion sends i to (0,0,i), and projection returns i. In the r−f presentation the same class is (0,0,−i): the transported shared coordinate gives −P₁(−i)=i, whereas Burgos’s evaluation gives P₁(−i)=−i. Their signed ratio is −1; both absolute values are 1.
- Over ℚ a form scaling by 2 multiplies the infinite and finite measures by 2 and 1/2, whose product is 1. At a complex place the local scalar multiplier is |2|²=4. For F=ℚ(i), h=3 the factor 4^(−3/2)·2³ equals 1 relative to ordinary complex coordinate Lebesgue measure.

## Exact supplier contracts

### From Mathlib

The baseline is mathlib commit 6b7abb3c7686292736be2955bd3eb9ebf63b456a. The following are the precise native inputs.

- `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, in Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:474, states r₁+2r₂=finrank ℚ F for a number field. The complex-embedding and infinite-place carriers in that file supply conjugation and the finite indexing set; §1.1 adds the twisted fixed submodule.
- `NumberField.discr` and `NumberField.discr_ne_zero`, in Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:36 and :41, use the ring-of-integers basis. They ensure Δ_F>0.
- `NumberField.prod_abs_eq_one`, in Mathlib/NumberTheory/NumberField/ProductFormula.lean:98, gives the product formula for a nonzero field element, with squared absolute values at complex places.
- `NumberField.IsTotallyReal`, in Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:47, requires every infinite place to be real. The equivalence `NumberField.nrComplexPlaces_eq_zero_iff`, in that file:52, identifies this condition with r₂=0 for number fields, as used in §5.1.
- `Ideal.nonempty_primesOver`, in Mathlib/RingTheory/Ideal/GoingUp.lean:355, gives a prime above a prime for an integral algebra with faithful scalar action. Apply it to ℤ⊂O_F over (2) and (3); their contractions distinguish the two chosen finite places of §3.2.
- `Submodule.mkQ` and `Submodule.mkQ_surjective`, in Mathlib/LinearAlgebra/Quotient/Defs.lean:227 and :236, give the native module quotient and its surjective projection. The quotient requires no topology. Sections 4.1 and 6.1 specify the submodules being quotiented.
- `CSA` in Mathlib/Algebra/BrauerGroup/Defs.lean:40 bundles a field algebra with centrality, simplicity and finite dimension; `BrauerGroup` in that file:99 is its quotient by positive-size matrix equivalence. The group law used here is Tau Ceti’s same-universe law.
- `exteriorPower.map`, `exteriorPower.map_id` and `exteriorPower.map_comp`, in Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:260, :293 and :298, are the native induced maps and their functor laws. `exteriorPower.finrank_eq`, in Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:173, gives binomial dimension for finite free modules over a nontrivial ring; at top degree this is 1, also in dimension zero.
- `ZLattice.covolume_div_covolume_eq_relIndex`, in Mathlib/Algebra/Module/ZLattice/Covolume.lean:148, equates the positive covolume ratio of nested discrete spanning coordinate lattices to their relative index.
- `IsZLattice`, in Mathlib/Algebra/Module/ZLattice/Basic.lean:433, has a separate discrete-subtype-topology parameter and a field-span-equals-top field. Both must be established. It is not merely finite generation or abstract freeness.
- `ZLattice.covolume`, `ZLattice.covolume_pos` and `ZLattice.covolume_eq_det`, in Mathlib/Algebra/Module/ZLattice/Covolume.lean:72, :98 and :125, measure an actual discrete spanning ℤ-submodule. The positivity and determinant theorems require a finite-dimensional real normed space, Borel measurable structure, and an additive Haar measure as specified there. The determinant version uses the standard coordinate space and its volume; §1.1 transports precisely that measure.
- `AnalyticAt`, in Mathlib/Analysis/Analytic/Basic.lean:110, means existence of a convergent local power series. `analyticOrderAt`, in Mathlib/Analysis/Analytic/Order.lean:48, measures its vanishing order in ℕ∞; without analyticity its value is 0. `iteratedDeriv`, in Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean:55, supplies the complex derivative coefficients used in §1.3.
- `NumberField.dedekindZeta`, in Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49, is the ideal-count L-series. `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` in the same file:77 is a one-sided residue theorem at 1; it is not the functional equation. `Matrix.det_fin_zero`, in Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:798, sets the empty determinant to 1. `riemannZeta_two` and `riemannZeta_four`, in Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:226 and :232, give ζ(2)=π²/6 and ζ(4)=π⁴/90 as complex equalities.

### From Tau Ceti

The baseline is Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub`, in TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158, supplies a holomorphic remainder on Re(s)>1−1/N agreeing with ζ_F(s)−ρ/(s−1) on Re(s)>1. It does not provide the global continuation or functional equation. The LFunctions supplier identifies its continuation with this local germ and with Mathlib’s convergent function.

`TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`, in TauCeti/Algebra/BrauerGroup/Division.lean:69, gives a finite-dimensional central division representative of every native Brauer class. `TauCeti.BrauerGroup.mk_matrix`, in TauCeti/Algebra/BrauerGroup/Group.lean:159, preserves that class under matrices of size a≥1; its signature requires `NeZero a`. Neither theorem supplies the number-field period–index equality of §3.1.

`TauCeti.Algebra.index` in TauCeti/Algebra/CentralSimple/Index.lean:99 is the degree of a chosen Wedderburn division factor, with presentation independence at :112, positivity at :180, equality to division-algebra degree at :171 and an index-degree splitting field at :255. `TauCeti.Algebra.deg` in TauCeti/Algebra/CentralSimple/Degree.lean:163 is the natural square root of the dimension; its square identity is at :239. `TauCeti.Algebra.IsSplittingField` in TauCeti/Algebra/CentralSimple/Splitting.lean:120 means that scalar extension is a full matrix algebra. Its existential matrix size includes zero for arbitrary input algebras; central simple and division inputs here are nontrivial, and the degree is positive. `TauCeti.Algebra.isSplittingField_of_isSepClosed` in that file:244 shows that a separably closed extension splits every finite-dimensional central simple algebra; applied to ℂ it makes splitting at a complex embedding automatic, so §3.2 states only the real-embedding condition. `TauCeti.BrauerGroup.mk` and `TauCeti.BrauerGroup.instCommGroup` in TauCeti/Algebra/BrauerGroup/Group.lean:139 and :174 give the native class and tensor-product group law on algebras in the field’s universe.

`TauCeti.brauerCohomologyEquiv` in TauCeti/Algebra/CrossedProduct/Comparison.lean:267 identifies the additive form of that algebraic Brauer group with continuous Galois H² with separable-closure units. Section 3.1 transports the ClassFieldTheory invariants through this map; no second field-Brauer comparison is constructed.

### From TauCetiRoadmap.GeneralAlgebraicKTheory

§§2.5, 3.2, 3.12, 7.7–7.8 supply actual Quillen groups, the specified plus/Q comparison and transfer when restriction has a finite resolution by finite projectives, including every finite-projective ring map, with naturality.

### From TauCetiRoadmap.StableHomotopyKTheory

§§2.3–2.5 supply the fibration-to-homotopy-fibre comparison and homotopy-fibre long exact sequence used for SO→SU→SU/SO in §5.2. Sections 3.37 and 4.14 supply stable GL plus H-space and rational primitive Hurewicz only for path-connected H-spaces with finite-type rational homology.

### From TauCetiRoadmap.ArithmeticKTheory

§§3.2–3.4 supply finite generation for number rings and finite S; actual rational localization; stable arithmetic invariant-form comparison, primitive generators and Borel ranks, independent of regulator values.

What ArithmeticKTheory must provide (gap:stable-finite-range): Supply, for every number field F of degree N, a≥2, G=Res_(F/ℚ)SL_a with its standard maximal compact K and every arithmetic Γ⊂G(ℚ), the actual invariant-form maps H^q(Lie G,K;ℝ)→H^q(Γ;ℝ) for q∈ℕ, compatible with block stabilization and finite-index restriction, and bijective whenever a−1>4Nq. The finite-stage form extends ArithmeticKTheory §3.4’s stable arithmetic and relative-Lie comparison and its primitive generators. Supply actual invariant-form comparison maps, stabilization and rational finite-index restriction; for Res SL_a over F the range a−1>4Nq must imply isomorphism through degree q. Finite-type is used only on the arithmetic plus H-space, not on GL(ℂ) with its discrete topology. The requested range lies inside the comparison range q<(a−1)/4 (borel1977, §5.2, p.627, borel1977 line 459–461). Required location: §3.4, explicit finite-stage form of the stable comparison.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

ALS.F.5, ALS.0.4–ALS.0.9 and ALS.5b.1 supply relative CE cochains, actual symmetric spaces and arithmetic quotients, manifold and finite-stabilizer comparisons, de Rham identification.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§§1.1–1.3 supply differentiable and continuous cochains on the native carriers and the finite-dimensional coefficient van Est comparison with full compact subgroup.

### From TauCetiRoadmap.AdelicAlgebraicGroups

§1.4, §§2.2–2.5, §3.4 and §4.2 supply scalar restriction, quotient integration, gauges and Tamagawa normalization, SL₁(D), anisotropic compactness and simply connected strong approximation.

What AdelicAlgebraicGroups must provide (gap:inner-type-a-structure): For every number field F and finite-dimensional central division F-algebra D of degree a≥2, prove that the existing AdelicAlgebraicGroups §3.4 group SL₁(D) is absolutely almost simple and simply connected. AdelicAlgebraicGroups §3.4 explicitly constructs SL₁(D), its semisimplicity and quotient compactness. Strong approximation in §4.2 additionally needs absolute almost simplicity and simple connectedness. Supply these properties by base change to SL_a for every central division algebra of degree a≥2; no new group carrier is needed. Required location: §3.4 norm-one construction, structure extension.

What AdelicAlgebraicGroups must provide (gap:adelic-rational-masses): For every nonarchimedean local field K of characteristic zero, smooth affine K-group H, nonzero K-rational invariant top form ω on H and compact open subgroup U⊂H(K), prove |ω|(U)∈ℚ_>0, where the gauge measure uses the additive coordinate measure on K giving O_K mass 1. Extend AdelicAlgebraicGroups §2.4’s smooth integral-model masses (with the gauge a generator of invariant top forms) and gauge scaling to rationality of every compact-open mass for every rational invariant form at an arbitrary finite place. Require the extension for smooth affine algebraic groups over nonarchimedean characteristic-zero local fields with finite residue field, using the fixed coordinate Haar normalization. Include finite-index comparison and compatibility with a single global rational gauge; a hyperspecial-only theorem cannot discharge the ramified factors. Required location: Part II, rational gauge masses extending §2.4.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§6.2 supplies τ(S)=1 for every simply connected semisimple group over a number field, including inner forms, with the Tamagawa normalization of AdelicAlgebraicGroups §2.4. Apply it to the existing SL₁(D) carrier using gap:inner-type-a-structure; no infinite-splitting hypothesis is required for this supplied theorem.

### From TauCetiRoadmap.RepresentationTheory.SemisimpleAlgebras

Layer 6 supplies the division-factor interpretation and finite splitting fields. The native index-degree splitting field is listed under Tau Ceti; the generic divisibility input has the following contract.

What SemisimpleAlgebras must provide (gap:splitting-degree-index): For any field K, finite-dimensional central simple K-algebra A and finite field extension L/K splitting A, provide index(A)∣[L:K] on Tau Ceti’s native index and splitting-field carriers, without a separability restriction. SemisimpleAlgebras Layer 6 and TauCeti.Algebra.CentralSimple.Index provide an index-degree splitting field but do not state divisibility of every finite splitting degree by the index. Extend that generic theory in Part II. For a division factor D of degree d and a splitting L, restrict the M_d(L)-module L^d to D; finite-dimensionality over the division ring gives d²k=d[L:K], hence d divides [L:K]. The number-field proof in §3.1 consumes this input and the existing index-degree splitting field, rather than constructing a second index theory. Required location: Part II, finite splitting-degree divisibility extending Layer 6.

### From TauCetiRoadmap.ClassFieldTheory

Layers 5 and 10 supply normalized local Brauer invariants, restriction multiplied by local degree, finite support and exact number-field Brauer invariant sequence.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§§R02.4.5b–R02.4.6 supply Grunwald–Wang with its dyadic exceptional class, used only through the additional full-local-degree contract.

What ArithmeticGaloisDuality must provide (gap:cyclic-local-degrees): Supply, for every number field F, a≥1, finite set S of finite places and set R of real places (R empty when a is odd), a cyclic extension L/F of degree a with [L_w:F_v]=a for every v∈S and w|v, and every place of R complex in L; the local extensions may vary. ArithmeticGaloisDuality R02.4.5b–R02.4.6 describes the exact exceptional class for fixed character prescriptions. Supply the consequence used in Poonen’s proof: for any a≥1 and finite set of finite places, a cyclic degree-a extension may be chosen with local degree a at those places, with the local extensions allowed to vary, and with selected real places complex when a is even. No assertion of arbitrary prescribed unramified dyadic extensions is made (poonen2017, Theorem 1.5.36(iii), p.26, proof at poonen2017 line 1435–1444). Required location: §R02.4.6, variable-local-extension corollary.

### From TauCetiRoadmap.LFunctions

Layer 3 supplies the continued Dedekind function, its germ regularity, completed functional equation and agreement with the pinned convergent function.

### From TauCetiRoadmap.IntegralIwasawaTheory

§6.0 supplies Siegel–Klingen rationality at the trivial character for the Layer 5 example. The general primitive-period proof has its own inputs.

### From TauCetiRoadmap.CharacteristicClasses

C5a.3–C5a.5 and C6 items 2–3 supply actual compact-Lie primitive/transgression comparisons, the multiplicative cohomological Serre spectral sequence with local coefficients, and rational universal Chern characters. The integral Bott-to-suspended-Chern calibration and the invariant-form filtration comparison have the separate contracts below.

What CharacteristicClasses must provide (gap:integral-chern-calibration): Supply s(chₙ)(Hur εₙ)=1 for n≥2, for the rational character chₙ of CharacteristicClasses C6 item 2 and εₙ=(-1)^n clutch(u^n), u=O(-1)−1, with the ordered suspension of CharacteristicClasses C6 item 3 and the (x,y)↦x+iy orientation of TopologicalKTheory T4; equivalently s(chₙᵗʷ)(Hur εₙ)=(2πi)^n for chₙᵗʷ=(2πi)^n·chₙ. Use the ordered complex suspension of C6 item 3 and the actual clutching map on TopologicalKTheory T4’s Bott coefficient u=O(-1)−1, with ch(u)=−v. For n≥2 set εₙ=(-1)^n clutch(u^n) in stable π_(2n−1)SU. The rational evaluation uses the integral Hurewicz image; multiplication by (2πi)^n gives the evaluation with Tate coefficient ℝ(n) (burgos2002, Proposition 9.22, p.85, burgos2002 line 3670–3688). The real-place homotopy indices are the separate target §5.2 here, using TopologicalKTheory T7 item 1. Required location: C6 item 3 extension.

What CharacteristicClasses must provide (gap:graded-indecomposable-api): For every field k and connected ℕ-graded graded-commutative k-algebra A, supply Q(A)=A₊/(A₊·A₊), its homogeneous components and quotient universal property, functoriality for graded algebra maps, compatibility with extension of k, and Q(Λ(V))≃V for V concentrated in positive odd degrees. CharacteristicClasses C5a.2 constructs the invariant-polynomial augmentation quotient and its coefficient and generator changes. Its generalization to every connected nonnegative graded commutative algebra, needed for cohomology of arithmetic quotients and compact duals, belongs to its Part II. Supply Q(A)=A₊/(A₊)², the homogeneous quotient, quotient universal property, map and base-change laws, and the exterior-generator comparison. Section 4.1 constructs only the cohomological determinant adapters, not a second generic augmentation quotient. Required location: Part II, general graded quotient API extending C5a.2.

What CharacteristicClasses must provide (gap:multiplicative-serre-comparison): Supply, for a number field F of degree N, n≥2, odd a with a−1>4N(2n−1) and torsion-free arithmetic Γ⊂Res_(F/ℚ)SL_a, the comparison of the C5a.5 spectral sequences of K→Gᵘ→Xᵘ and K→G(ℝ)/Γ→K\G(ℝ)/Γ with the Lie-cochain filtration, preserving edge restriction and the identity on the common compact fibre, where G=Res_(F/ℚ)SL_a and K is its standard connected maximal compact. Use CharacteristicClasses C5a.5’s multiplicative cohomological Serre spectral sequence. For a number field F, a≥2, G=Res_(F/ℚ)SL_a, its standard connected maximal compact K and torsion-free arithmetic Γ, compare the bundles K→Gᵘ→Xᵘ and K→G(ℝ)/Γ→K\G(ℝ)/Γ with the compact-Lie-subalgebra filtration on absolute Lie cochains. The maps α and β of §4.2 must preserve that filtration and induce the same restriction to K (borel1977, §3.5, p.622, borel1977 line 328–337). Required location: C5a.5 extension, invariant-form filtration comparison.

### From TauCetiRoadmap.TopologicalKTheory

T4 and T7 item 1 supply complex Bott and real coefficient maps, including complexification and realification, with fixed generators.

### From TauCetiRoadmap.DifferentialGeometry

Layers 5–6 and 8 supply oriented integration, Stokes and multiplicative de Rham/period comparison.

### From TauCetiRoadmap.SchemeKTheoryOperations

Section 6.8 supplies actual higher Adams operations and their affine Quillen comparison for regular Noetherian finite-dimensional schemes with ample family, including number-field points and number rings.

### From TauCetiRoadmap.AlgebraicTopology

Stage 5 item 5 supplies the native bundle Serre filtration, its monodromy and Leray–Hirsch applications; CharacteristicClasses C5a.5 supplies the multiplicative cohomological sequence, and its invariant-form filtration comparison is gap:multiplicative-serre-comparison.

### From TauCetiRoadmap.SchemeAndStackFoundations

Section 0.28 supplies ideal sheaves and quotient comparisons for the cosimplicial square-ideal of §6.0b.

### From TauCetiRoadmap.MotivicEtaleKTheory

Sections 3.3–3.4 supply the real Deligne functor for every integer twist, its compactification-independent logarithmic realization on smooth separated finite-type complex varieties, pullbacks, descent and finite disjoint unions. Sections 4.1–4.2 supply products. Section 7.1 supplies the independent universal Deligne Chern character on actual K-groups of smooth quasi-projective complex varieties, including its classifying nerves, stabilization, additivity and embedding base change. Sections 3.3 and 7.4 fix the positive point projection: on the f−r cone the small-model inclusion is x↦(0,0,x) and its inverse is P_(n−1)(ω). Section 6.0a here compares its topological normalization with CharacteristicClasses C6 and fixes conjugation, finite-transfer and Adams interfaces. Under S(r,f,ω)=(r,f,−ω) from the r−f cone to the supplied f−r cone, the shared point coordinate pulls back to −P_(n−1)(ω). Burgos’s positive evaluation on the r−f cone therefore has the opposite sign, as tracked in §§6.0a–6.2. Neither its higher-cycle realization nor its comparison with that realization is used to prove the arithmetic Borel theorem. The contract gap:universal-deligne, the real Beilinson regulator on actual Quillen K-theory from the universal twisted Chern class together with Deligne cohomology of finite disjoint unions of complex points, real descent, restriction, finite-transfer compatibility and the Adams law, is met by §§3.3–3.4 and 7.1 there together with §§6.0a and 6.1 here, which prove the calibration, conjugation, finite-transfer and Adams interfaces and assemble the embeddingwise number-field map; nothing beyond §§3.3–3.4, 4.1–4.2, 7.1 and 7.4 is asked of MotivicEtaleKTheory. The contract gap:infinitesimal-classifying-comparison, the comparison of normalized functions and forms on the first infinitesimal classifying nerve with the Chevalley–Eilenberg and Weil complexes, is owned by §6.0b here and asks nothing of MotivicEtaleKTheory.

### From TauCetiRoadmap.ColemanIntegration

Section L3.Fc.1 supplies the complex-field Beilinson map reg_∞:K_(2n−1)(ℂ)⊗ℚ→ℝ(n−1), n≥2, whose equality with the shared universal character is the interface in §6.0a. Its Galois integral-image theorem is not a premise of §§2.3 or 5.3; those sections prove the all-number-field Borel theorem independently.

## How to read the build

Layer 1 fixes the embedding target, trace and analytic leading coefficient. Layer 2 constructs and identifies the actual regulator using the independent arithmetic comparison. Layer 3 develops the division-algebra, gauge and volume input. Layer 4 establishes the common compact-fibre comparison before extracting primitive arithmetic periods by compact cycles and lower-degree exterior ideals. Layer 5 cancels the common compact-fibre determinant, converts the homotopy lattice to Tate coordinates, and proves the integral zeta covolume and localization statements. Layer 6 calibrates the supplied universal Deligne realization, constructs the infinitesimal comparison, identifies the point target and compares the independently constructed Beilinson map, with its Adams consequence. The rank-zero case is the dₙ=0 clause of §5.1, illustrated in the Layer 5 examples. Every proof route lists its own direct inputs; the Deligne comparison is not a prerequisite of the volume or zeta theorem.

## Layer 1: Tate coordinates, trace and leading coefficients

### 1.1 The embedding space and its integral coordinates

For every n≥1, define Vₙ(F) as the real subspace of Σ_F → ℂ consisting of functions taking values in (2πi)^(n−1)ℝ and satisfying v(conj σ)=conj(v(σ)). Define Cₙ(F) by requiring these values to lie in (2πi)^(n−1)ℤ. Selection of all real embeddings when n is odd and one embedding per nonreal conjugate pair identifies Vₙ(F) with ℝ^dₙ and Cₙ(F) with ℤ^dₙ, where dₙ=r₁+r₂ for odd n and r₂ for even n. Give Vₙ the transported finite-dimensional norm and coordinate Haar measure of covolume one on Cₙ. (burgos2002, Proposition 9.22 and Corollary 9.23, p.85, burgos2002 line 3650–3709.)

A proof route is to divide by the nonzero scalar (2πi)^(n−1). Conjugation becomes v(conj σ)=(-1)^(n−1)v(σ) on real coordinates. Fixed real embeddings therefore contribute only in odd weight; each nonreal pair contributes once. Construct both inverse coordinate maps explicitly.

The interface requires the following facts.

- Two vectors are equal if their values at every embedding agree; selected surviving coordinates already suffice.
- Coordinate evaluation divided by (2πi)^(n−1) is a real linear equivalence carrying Cₙ onto the standard integer lattice.
- The real dimension is dₙ; the inherited lattice is discrete and spans.
- The coordinate equivalence and its inverse are continuous for the native subspace topology from Σ_F→ℂ. The transported norm has this topology; normalized covolume uses the coordinate Haar measure.
- Permuting selected embeddings gives a permutation matrix. Replacing a complex representative by its conjugate multiplies that coordinate by (-1)^(n−1); these changes preserve coordinate Haar measure.

**Checks.**

- For F=ℚ, n=2 the equation t=-t gives t=0 and dimension 0; n=3 allows every t and has dimension 1. Reversed parity fails both.
- For ℚ(i), n=2 the divided pair is (t,-t), and n=3 it is (t,t); both spaces have dimension 1, not 2.
- The selected value (2πi)^(n−1) has coordinate 1; in weight 3 the value is -4π² and still has coordinate 1. An untwisted coordinate would give -4π².
- For a totally real field in even weight, Cₙ=Vₙ={0}; the standard fundamental domain is a point of mass 1.
- At weight 2 an imaginary pair with divided coordinate 1 has ambient product sup norm 2π and coordinate norm 1. At weight 3 a real Tate generator has native norm 4π² and coordinate norm 1. The topologies agree, but no unscaled isometry is asserted.

*Needs:* Mathlib `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`; Mathlib `IsZLattice`; Mathlib `ZLattice.covolume`.

### 1.2 Restriction and sum over embeddings

For a finite extension E/F, define R:Vₙ(F)→Vₙ(E) by (Rv)_τ=v_(τ|F), and T:Vₙ(E)→Vₙ(F) by (Tw)_σ=Σ_(τ|σ)w_τ, summing over all embeddings extending σ. Both preserve the coordinate lattices, commute with conjugation, and satisfy T∘R=[E:F]·id. Restriction and trace compose in towers. (Elementary finite-fibre identities; burgos2002, Definition 10.8, p.94, burgos2002 line 4091–4106, supplies the embedding assembly only.)

A proof route is to partition the embeddings over each σ into fibres. Separability of number fields gives [E:F] points in each fibre. Check that conjugation sends one fibre bijectively onto the conjugate fibre. This is the target-space map used by K-theoretic transfer.

The interface requires the following facts.

- The displayed coordinate formulas determine the two real linear maps uniquely.
- T(R(v))=[E:F]v for every v.
- For L/E/F, T_L/F=T_E/F∘T_L/E and R_L/F=R_L/E∘R_E/F; identity extensions give identity maps.

**Checks.**

- For ℚ(i)/ℚ in weight 2, T(t,-t)=0 in the zero target; averaging only the selected coordinate would give t.
- For ℚ(i)/ℚ in weight 3, R(t)=(t,t) and T(R(t))=2t. A trace divided by two fails this law.
- For a real quadratic extension in odd weight T(a,b)=a+b and R(t)=(t,t); the identity extension gives T(t)=t.

*Needs:* §1.1; the native number-field embedding fibres and separability.

### 1.3 The analytic leading coefficient

The native acceptance statement `dedekindZeta_continuation_leadingTerm` applies to every Z:ℂ→ℂ analytic at every z≠1 and agreeing with `NumberField.dedekindZeta F z` whenever Re z>1. These hypotheses identify Z off 1 with LFunctions Layer 3’s continuation by analytic uniqueness on the connected domain ℂ\{1}; they impose no zero order or leading coefficient. For every n≥2 define ζ_F*(1−n) to be the coefficient of (s−(1−n))^dₙ in that analytic germ, namely the dₙ-th iterated complex derivative at 1−n divided by dₙ!. Prove that the germ has order exactly dₙ, this coefficient is real and nonzero, and it is the punctured limit ζ_F(s)/(s−(1−n))^dₙ. Prove ζ_F*(1−n)∈ℚˣ·√Δ_F·π^(dₙ−Nn)·ζ_F(n), with ζ_F(n)>0 and equal to the pinned convergent value. (borel1977, §1.4, p.616, borel1977 line 127–139; §6.4, p.633, borel1977 line 600–615.)

A proof route is to apply the supplied completed functional equation at n and 1−n. Count the simple gamma poles at real and complex places and evaluate their nonzero residues; there are exactly dₙ. The remaining factorials and powers of two are nonzero rational factors. Real coefficients give conjugation symmetry; the positive Dirichlet series at n fixes nonvanishing. Use an analytic germ, never the totalized value of Gamma at a pole.

The interface requires the following facts.

- The punctured complex limit is the real leading coefficient embedded in ℂ; at dₙ=0 it is the analytic value.
- For every n≥2 the coefficient is nonzero and the order is dₙ.
- Its ratio to √Δ_F π^(dₙ−Nn) ζ_F(n) is a nonzero rational number.

**Checks.**

- At F=ℚ,n=2, d=0 and ζ*(-1)=-1/12, whereas ζ(2)/π²=1/6; their ratio is -1/2.
- At F=ℚ,n=3, d=1 and ζ*(-2)=ζ′(-2)=-ζ(3)/(4π²); the analytic value ζ(-2)=0 is the wrong leading coefficient.
- At F=ℚ,n=4, d=0 and ζ*(-3)=1/120; dividing by ζ(4)/π⁴=1/90 gives 3/4.
- For F=ℚ, the zero function and twice the continuation take values 0 and π²/3 at 2, instead of π²/6. Both fail the series-agreement hypothesis; changing Z(1) affects none of the conclusions. At n≥2, 1−n≤-1≠1 and dₙ!≥1, so analyticity and the derivative denominator are valid.
- At n=1, ζ_F has order r₁+r₂−1 at 0, not the odd-weight formula r₁+r₂. For ℚ the two numbers are 0 and 1.

*Needs:* §1.1; LFunctions Layer 3; Mathlib `NumberField.dedekindZeta`; Mathlib `NumberField.discr_ne_zero`; Mathlib `AnalyticAt`, `analyticOrderAt` and `iteratedDeriv`.

### Examples

For ℚ the coordinate dimensions in weights 2 and 3 are 0 and 1. For an imaginary quadratic field both are 1. A real quadratic field has dimensions 0 and 2.

### Dependencies

Pinned embedding and lattice linear algebra; LFunctions Layer 3 for the continued zeta germ.

## Layer 2: Primitive classes and the specified arithmetic regulator

### 2.1 The Chern-normalized continuous class

For n≥2 and matrix size b≥2n+1, construct the class Boₙ,b in H_cont^(2n−1)(GL_b(ℂ),ℝ(n−1)). It is the image of the suspended twisted Chern character chₙᵗʷ under restriction to U(b), invariant-form identification with the compact dual, identity inside the complexified relative cochains, and inverse van Est. Its restrictions along trailing-identity block inclusions agree. Use the ordered complex suspension and εₙ=(-1)^n clutch(u^n), where u=O(-1)−1 is TopologicalKTheory’s chosen Bott class. Use the CharacteristicClasses C6 calibration: suspended chₙ evaluates on εₙ to 1, and suspended chₙᵗʷ evaluates to (2πi)^n. (burgos2002, Definition 9.24, p.86, burgos2002 line 3733–3753; Proposition 9.22, p.85, burgos2002 line 3670–3688.)

A proof route is to use the actual universal Chern class and cohomological suspension, then the indicated cochain maps. Check compatibility with conjugation and stabilization before passing to the limit. Construction uses ordinary Hurewicz when evaluated on algebraic K-theory; it needs no finite-type rational primitive isomorphism for the discrete group GL(ℂ).

The interface requires the following facts.

- Restriction from b+1 to b preserves Boₙ,b.
- Complex conjugation on matrices and ℝ(n−1) together fixes the class.
- Suspended chₙᵗʷ evaluates on the specified compact homotopy generator εₙ=(-1)^n clutch(u^n) to (2πi)^n; replacing chₙᵗʷ by the zero class or twice chₙᵗʷ fails this equation. The corresponding rational evaluation of chₙ is 1.

**Checks.**

- In weight 2, ε₂=clutch(u²) has rational character coordinate (-v)²/v²=1. Suspended ch₂ᵗʷ evaluates to (2πi)²=-4π²; after dividing by that Tate generator the value is 1.
- In weight 3, ε₃=-clutch(u³) has rational character coordinate -(-v)³/v³=1. Suspended ch₃ᵗʷ evaluates to (2πi)³=-8π³i and its Tate coordinate is 1; replacing ch₃ᵗʷ by (2πi)³c₃ doubles the value to -16π³i.
- Adding an identity block adds 0 to both positive-degree characters, so their calibrated values remain 1 and (2πi)^n. The zero twisted class gives 0 and twice that class gives 2(2πi)^n, both different from (2πi)^n.

*Needs:* CharacteristicClasses C5a.3–C5a.5 and C6 items 2–3; AutomorphicFormsOnReductiveGroups §§1.1–1.3; gap:integral-chern-calibration.

### 2.2 The regulator on actual Quillen groups

Construct r_Bo:K_(2n−1)(O_F)→Vₙ(F) by mapping to each K_(2n−1)(ℂ), applying the plus/Q comparison and ordinary Hurewicz, and evaluating Boₙ. Use the inverse of the actual rational inclusion K_(2n−1)(O_F)⊗ℚ→K_(2n−1)(F)⊗ℚ to define r_Bo,ℚ on field K-theory. This rational map agrees with the direct embedding construction. (burgos2002, Definition 9.19 and Proposition 9.21–Corollary 9.23, pp.84–85, burgos2002 line 3577–3709.)

A proof route is to preserve the actual maps from Q-theory to the plus model and into discrete group homology. Evaluation of the primitive stable class is additive. Its conjugation law lands in Vₙ. Rational localization is used by its specified inverse, so extension of the field map cannot be chosen up to an unrelated scalar.

The interface requires the following facts.

- At every σ the coordinate is precisely the Boₙ evaluation of σ_*(x).
- The integral map is additive and annihilates every torsion element.
- For x in the integral K-group, r_Bo,ℚ(j_*(x)⊗1)=r_Bo(x); this property uniquely determines the rational field map.

**Checks.**

- r(0)=0 and m x=0 with m>0 implies m r(x)=0, hence r(x)=0 in a real vector space.
- On a nonzero rational K₅-class over ℚ, direct evaluation and integral rational localization both give t; an arbitrarily doubled inverse gives 2t.
- An imaginary-quadratic class has divided coordinates (t,-t) in weight 2 and (t,t) in weight 3, exactly as in §1.1.

*Needs:* §1.1; §2.1; GeneralAlgebraicKTheory §3.12; StableHomotopyKTheory §4.14; ArithmeticKTheory §§3.3–3.4.

### 2.3 Real isomorphism and functoriality

The real scalar extension K_(2n−1)(O_F)⊗ℝ→Vₙ(F) of the specified regulator is a real linear isomorphism, and r_Bo,ℚ is injective. For every finite extension E/F, r_E∘res=R∘r_F and r_F∘tr=T∘r_E, integrally where defined and after rational localization. Its kernel on the integral group is precisely torsion. (burgos2002, Corollary 9.8, p.78, burgos2002 line 3140–3150; Proposition 9.21 and Corollary 9.23, p.85; deligne_goncharov2005 §1.6, (1.6.3)–(1.6.10), pp.7–9, deligne_goncharov2005 line 320–428.)

A proof route is to dualize the supplied stable arithmetic invariant-form comparison on indecomposables and use the finite-type arithmetic plus H-space rational Hurewicz theorem. The character calibration identifies this particular map with the comparison. Tensoring a finite free quotient over ℤ gives injectivity over ℚ. Extension and transfer follow from naturality and the trace of the finite free complex representation obtained after splitting E⊗_Fℂ into embeddings.

The interface requires the following facts.

- An integral class maps to zero if and only if it has finite order.
- The displayed restriction square uses R, with no averaging.
- The displayed transfer square uses the full sum T over extensions of each embedding.

**Checks.**

- For ℚ, n=2 the source and target dimensions are 0; n=3 gives 1 and 1. The first equality alone proves no zeta value.
- For ℚ(i), n=2 and n=3 each give dimensions 1 and 1. For a real quadratic field n=3 gives 2 and 2.
- For ℚ(i)/ℚ at n=3, tr∘res acts by 2 and the target composite sends t to 2t; at n=2 the target sends (t,-t) to 0.
- For F=ℚ and q=5, a=22 gives a−1=21>20=4Nq, while a=21 gives equality 20=20 and is outside the stated sufficient range.
- For F=ℚ(i) and q=3, a=26 gives 25>24=4Nq, while a=25 gives 24=24 and is outside that range.
- At q=0 and a=2, a−1=1>0; the comparison sends the constant 1 to 1. A zero comparison fails already in degree zero.

*Needs:* §1.2; §2.2; ArithmeticKTheory §§3.2–3.4; StableHomotopyKTheory §3.37; GeneralAlgebraicKTheory §§7.7–7.8; gap:stable-finite-range; gap:integral-chern-calibration.

### Examples

The free rational K₃ of ℚ has dimension 0; K₅ has dimension 1. The regulator kills torsion, including any torsion present when the rational source is zero.

### Dependencies

Layer 1; GeneralAlgebraicKTheory §§2.5, 3.2, 3.12, 7.7–7.8; StableHomotopyKTheory §§3.37,4.14; ArithmeticKTheory §§3.2–3.4; AutomorphicFormsOnReductiveGroups §§1.1–1.3; CharacteristicClasses C5a/C6 and its integral calibration contract.

## Layer 3: Division algebras, rational gauges and arithmetic volume

### 3.1 The global period–index input

For every Brauer class α over a number field F, its period (order in the Brauer group) and index (degree of its division representative) equal the least common multiple of the denominators of its finitely supported local invariants (including real invariants). In particular α of period a has a central division representative of dimension a². The zero class has period and index 1. The native acceptance statement `period_eq_index` says that for every A in `CSA F`, `orderOf (TauCeti.BrauerGroup.mk A)` equals `TauCeti.Algebra.index F A`. The algebra carrier has the same universe as F, as required by the pinned Brauer-group law; this places no restriction on isomorphism classes of finite-dimensional F-algebras. (poonen2017, Theorem 1.5.36(iv) and proof of (iii), p.26, poonen2017 line 1396–1446.)

In one proof route, the invariant exact sequence computes the period. Choose a cyclic degree-a splitting extension with full local degree at the finite support and complexify real places with invariant 1/2. Local invariants then vanish after restriction. Injectivity of the Brauer localization map splits the class globally. The native splitting field of degree equal to the index and the local degree formula show that each invariant denominator divides the index. The SemisimpleAlgebras extension gives that the index divides the degree a of the chosen cyclic splitting field; hence period=index=a. The local extensions are allowed to vary; this is not unrestricted prescribed Grunwald data.

The interface requires the following facts.

- The denominator lcm computes the degree of the division representative.
- For a≥1, a class of period dividing a has a central simple representative of degree a: if its division representative has degree d≥1, take M_(a/d)(D). The matrix size a/d is positive since d divides a.

**Checks.**

- The empty lcm is 1 and the representative is F of dimension 1. For a≥1 the same class is represented by M_a(F), of degree a and dimension a². At a=0 there is no nonzero matrix size and no central simple algebra of degree zero; that value is excluded.
- Invariants 1/2 at two finite places sum to 1=0 in ℚ/ℤ; period=index=2 and dimension is 4.
- Invariants 1/3 and -1/3 have lcm 3, index 3 and dimension 9. Keeping only the first invariant gives sum 1/3 and no global class.
- The requested index 8 means dimension 64. A fixed unramified degree-eight dyadic prescription over ℚ is obstructed; permitting different local cyclic extensions is essential.
- For a=1, S=∅ and R=∅, take L=F of degree 1; the local conditions are empty. An odd-degree extension cannot make a real place complex, since complex conjugation would give an element of order 2 in its cyclic Galois group.
- For F=ℚ, a=8 and S={2}, L=ℚ(ζ₃₂)⁺ has cyclic degree 8 and local degree 8 at 2 by total ramification. At 31, the Frobenius is -1 modulo 32 and hence trivial on L, giving local degree 1; the full-degree condition is restricted to S.
- For the same F,a,S and R={∞}, take the fixed field of {1,15} in ℚ(ζ₃₂). The quotient of (ℤ/32ℤ)ˣ by {1,15} is cyclic of order 8, generated by the class of 3; -1 is not in {1,15}, so the field is imaginary. Its local degree at 2 is 8. These ramified local extensions do not impose the obstructed unramified prescription.

*Needs:* ClassFieldTheory Layers 5 and 10; SemisimpleAlgebras Layer 6 and gap:splitting-degree-index; Tau Ceti `TauCeti.Algebra.index`, `TauCeti.Algebra.exists_isSplittingField_finrank_eq_index` and `TauCeti.brauerCohomologyEquiv`; ArithmeticGaloisDuality §R02.4.6; gap:cyclic-local-degrees; Tau Ceti `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`; Tau Ceti `TauCeti.BrauerGroup.mk_matrix`.

### 3.2 Division algebras in every degree

For every number field F and natural a≥1, construct a central division F-algebra D of dimension a² split at every infinite place. The native acceptance statement `exists_divisionAlgebra_split_at_infinity` quantifies over a division ring D in the universe of F with an F-algebra structure, centrality and finite dimension, and asserts this dimension and `TauCeti.Algebra.IsSplittingField` for every F→ℝ embedding with its induced algebra structure. Splitting at a complex embedding holds for every finite-dimensional central simple algebra, since ℂ is separably closed, so the acceptance statement carries only the real-embedding condition. (borel1977, Lemma 2.2, pp.617–618, borel1977 line 165–195.) More precisely any finitely supported admissible family of local invariants of denominator lcm a and zero sum is realized by such a division algebra when all infinite invariants are zero. (poonen2017, Theorem 1.5.36(i) and (iv), p.26, poonen2017 line 1402–1446, with §3.1.)

A proof route is to choose places above the distinct rational primes 2 and 3, using `Ideal.nonempty_primesOver`, and invariants 1/a,-1/a, with zero elsewhere. Apply the invariant exact sequence and §3.1. Existence uses all finite places without a restriction on residue characteristic; no particular algebra is built into later theorems.

The interface requires the following facts.

- The division representative of the realized class has the same prescribed invariants; passage from its central simple representative changes none of them.
- Its dimension over F is exactly a².
- At every real or complex completion it is isomorphic to M_a of that completion.

**Checks.**

- At a=1, take D=F: its dimension is 1, all local invariants are 0, and every infinite scalar extension is the 1×1 matrix algebra. At a=0 the required dimension is 0, impossible for a division ring over F; that value is excluded.
- Over ℚ, invariants 1/2 at 2 and 3 and 0 at infinity give degree 2, dimension 4, and a split real factor.
- Invariants 1/3,-1/3 at two finite places give degree 3 and dimension 9, with every infinite invariant 0.
- The Hamilton algebra over ℚ has invariant 1/2 at infinity and dimension 4, but fails the infinite splitting hypothesis; the theorem does not identify it with the constructed indefinite quaternion algebra. Its real scalar extension is the division algebra ℍ, not a matrix algebra, whereas its complex scalar extension is M₂(ℂ): the complex-embedding condition holds for every central simple algebra and distinguishes nothing.
- For an imaginary quadratic F there is no real embedding, so the real-embedding condition is empty and the statement asserts a central division algebra of dimension a²; the two finite invariants 1/a and -1/a provide it.

*Needs:* §3.1; ClassFieldTheory Layer 10; Mathlib `Ideal.nonempty_primesOver`; Tau Ceti `TauCeti.Algebra.IsSplittingField` and `TauCeti.Algebra.isSplittingField_of_isSepClosed`; Tau Ceti `TauCeti.BrauerGroup.exists_eq_mk_centralDivisionRing`; Tau Ceti `TauCeti.BrauerGroup.mk_matrix`.

### 3.3 Borel’s rational gauge and its transport

Let H/F be a connected semisimple group of dimension h and let ω be a nonzero F-rational invariant top form. Define m∞=Δ_F^(−h/2)·∏_(v|∞)|ω|_v, with dx over ℝ and 2dxdy over ℂ and normalized squared complex absolute value. Let m_f=∏_(v finite)|ω|_v in the convergent semisimple gauge product. The product m∞·m_f is precisely the supplied Tamagawa measure. Transport to unscaled product measure multiplies an archimedean quotient volume by Δ_F^(h/2); replacing 2dxdy by dxdy additionally multiplies it by 2^(−hr₂). (borel1977, §1.6, p.617, borel1977 line 153–163, equations (1)–(2).)

In one proof route, this is a specialization of the supplied gauge measures, with the full discriminant scalar placed at infinity. Compare scalar restriction and local charts. Under ω↦cω, the infinite factor changes by ∏_(v|∞)|c|_v and the finite factor by its reciprocal, using the product formula.

The interface requires the following facts.

- m∞ is the displayed scalar multiple of the actual product of local gauge measures, not an arbitrary Haar measure.
- For c∈Fˣ, replacing ω by cω scales m∞ by the product of its infinite absolute values.
- The infinite and finite factors multiply to the Tamagawa measure with zero geometric character lattice.
- A further linear chart change A multiplies coordinate density by |det A| with the local normalized absolute value; the stated discriminant and 2-power factors are retained.

**Checks.**

- Over ℚ, multiplying a top form by 2 multiplies m∞ by 2 and its 2-adic factor by 1/2; the global product multiplier is 1, regardless of h.
- For F=ℚ(i), Δ=4 and h=3, the discriminant factor is 1/8 and the complex coordinate factor is 2³=8. Their product against dxdy in three coordinates is 1.
- For h=0 and ω=1 the point has mass 1. With ω=2 over ℚ its infinite mass is 2 and its finite product is 1/2; the total mass remains 1.
- ω=0 gives zero measure, so its quotient volume is 0 and cannot be in ℚ_>0·∏ζ; the nonzero hypothesis excludes it.

*Needs:* Mathlib `NumberField.discr_ne_zero`; AdelicAlgebraicGroups §§2.4–2.5; Mathlib `NumberField.prod_abs_eq_one`.

### 3.4 The norm-one quotient mass in Borel’s gauge

For every number field F, every a≥2, central division F-algebra D of dimension a² split at all infinite places, and nonzero F-rational invariant top form ω, identify the product m∞·m_f of §3.3 on H=SL₁(D) with the supplied Tamagawa measure. Its quotient by H(F), with counting measure, has mass 1 by EndoscopicTransferAndUnitaryTraceComparison §6.2. This specialization fixes the measure used in §3.6; the supplied numerical theorem also covers algebras ramified at infinity. (weil1961, §3.3, Theorem 3.3.1, invoked in borel1977 p.619, borel1977 line 227; historical attribution through Borel.)

A proof route identifies the measure using §3.3 and the vanishing geometric character lattice of SL₁(D), then applies EndoscopicTransferAndUnitaryTraceComparison §6.2 using gap:inner-type-a-structure. Gauge independence and restriction of scalars use AdelicAlgebraicGroups §2.4 directly.

The interface requires the following facts.

- The quotient mass is finite, strictly positive and equal to 1, not merely rational or finite.

**Checks.**

- For D=(-1,3) over ℚ the Hilbert symbols at 2, 3 and ∞ are -1, -1 and +1; all other local symbols are +1. Thus D is division, split over ℝ, h=3, and its normalized adelic mass is 1.
- For a degree-three division algebra split at infinity, h=8 and the normalized adelic mass is 1; matrix size does not multiply this mass by 3.
- For ω↦2ω over ℚ the product multiplier is 2·(1/2)=1, so the two predicted masses are both 1.
- At degree a=1, D=F gives SL₁(F)={1}, of dimension 0; it is not absolutely almost simple and is excluded from gap:inner-type-a-structure. Degrees 2 and 3 give geometric groups SL₂ and SL₃ of dimensions 3 and 8.
- The norm-one torus of ℚ(i)/ℚ has dimension 1 and geometric character lattice ℤ, whereas the degree-two central division input has norm-one group dimension 3 and character lattice 0. The torus is excluded from this theorem.

*Needs:* §3.3; AdelicAlgebraicGroups §2.4 (gauge independence and τ(Res)=τ), §2.5 and §3.4; gap:inner-type-a-structure; EndoscopicTransferAndUnitaryTraceComparison §6.2.

### 3.5 Every finite factor and the Euler product

For H=SL₁(D) as in §3.4, ω≠0 and a product compact open U=∏U_v, choose a finite S containing every nonsplit place, every place where ω does not extend to a generator of the invariant top forms of the standard smooth model of H≅SL_a (equivalently, ω is not a v-adic unit multiple of the standard gauge) and every place with nonstandard level. At v∉S, |ω|_v(U_v)=∏_(j=2)^a(1−q_v^(−j)). At v∈S its mass is a positive rational. Define c_S(U,ω)=∏_(v∈S)(|ω|_v(U_v)/∏_(j=2)^a(1−q_v^(−j))). Then m_f(U)=c_S(U,ω)·∏_(j=2)^aζ_F(j)^(−1), with c_S positive rational and independent of enlarging S. (borel1977, Proposition 2.4 proof, p.619, borel1977 line 229–236.)

A proof route is to use the supplier’s smooth integral group mass and SL_a finite-field count at every standard place. Use rationality of gauge masses at each remaining compact open, without applying a smooth reductive model at a ramified place. Multiply absolutely convergent Euler products at j≥2. A general compact open contains a product open of finite index and is recovered by that index.

The interface requires the following facts.

- Every denominator is a product of positive numbers 1−q_v^(−j); c_S is positive and rational.
- Adding a standard place multiplies c_S by 1.
- If U′⊂U has finite index m then m_f(U′)=m_f(U)/m, including the finite exceptional factors.

**Checks.**

- At a standard q=2 place, #SL₂(𝔽₂)/2³=6/8=3/4=1−2^(−2). A unit local mass fails this normalization.
- At q=2, #SL₃(𝔽₂)/2⁸=168/256=21/32=(3/4)(7/8).
- If an exceptional q=2 SL₂ level has gauge mass b, its correction is 4b/3. Deleting this place loses the factor 4b/3.
- At the split place v=2, ω=2ω_std gives mass (1/2)(3/4)=3/8. Its correction is (3/8)/(3/4)=1/2, so v belongs to S even though the form is integral.
- An index-three subgroup of SL₂(ℤ₂) with ω=2ω_std has mass (3/8)/3=1/8. Zero ω would instead give 0, so nonvanishing is essential to the positive-rational mass contract.
- At q=1 the putative factor 1−q^(−2) is 0 and its totalized inverse is 0; residue fields here have q≥2, so this value is excluded.

*Needs:* §3.3; AdelicAlgebraicGroups §§1.2,2.4; LFunctions Layer 3; gap:adelic-rational-masses.

### 3.6 The arithmetic quotient and the exact adelic identity

For H=SL₁(D) as in §3.4 and every arithmetic Γ⊂H(F), the quotient H∞/Γ is compact and vol_m∞(H∞/Γ)∈ℚ_>0·∏_(j=2)^aζ_F(j). If U is sufficiently small that Γ_U=H(F)∩(H∞×U) is torsion-free, the exact identity is τ(H)=vol_m∞(H∞/Γ_U)·m_f(U)=1. For any arithmetic Γ compare with Γ_U through their finite-index intersection. For the unscaled product archimedean gauge, the volume gains Δ_F^((a²−1)/2). (borel1977, §2.3 and Proposition 2.4, pp.618–619, borel1977 line 196–236.)

In one proof route, division makes H anisotropic over F and gives compactness through the supplied reduction theorem. Infinite splitting and a≥2 give noncompactness of H∞, so the supplied simply connected strong approximation makes the adelic double-coset set a singleton. The level quotient is a principal U-bundle when Γ_U is torsion-free; quotient integration gives the identity. Insert §§3.4–3.5 and then use finite-index covolume multiplication for arbitrary Γ.

The interface requires the following facts.

- For sufficiently small U the displayed equality uses the actual subgroup Γ_U and measures derived from one ω.
- For Γ₀⊂Γ of index m, vol(H∞/Γ₀)=m·vol(H∞/Γ), with counting measure on discrete subgroups.
- The discriminant and coordinate Jacobians are precisely those of §3.3.

**Checks.**

- If U′ has index 3 in U, its finite mass is m_f(U)/3 and its infinite volume is 3 vol∞; both products equal 1.
- The Hamilton quaternion group has compact real points and is outside infinite splitting. A single principal-level fibre formula from strong approximation away from infinity cannot be assumed for it.
- For D=M₂(ℚ), SL₂(ℝ)/SL₂(ℤ) has finite volume but is noncompact; this algebra is not division. Division is essential for compactness.
- For F=ℚ(√5), a=2 the unscaled product volume is 5^(3/2) times Borel’s volume; dropping that factor changes a rational multiple of ζ_F(2) to a different normalization.

*Needs:* §3.3; §3.4; §3.5; AdelicAlgebraicGroups §§2.2–2.4,3.4,4.2; gap:inner-type-a-structure.

### Examples

Two finite invariants 1/a and -1/a give an algebra of degree a split at infinity. At q=2 the split SL₂ gauge volume is 3/4, so finite factors are neither all one nor all unramified.

### Dependencies

ClassFieldTheory Layers 5 and 10; SemisimpleAlgebras Layer 6 and gap:splitting-degree-index; ArithmeticGaloisDuality R02.4.5b–R02.4.6 with the local-degree contract; AdelicAlgebraicGroups §§1.4,2.2–2.5,3.4,4.2; LFunctions Layer 3. EndoscopicTransferAndUnitaryTraceComparison §6.2 supplies the numerical norm-one theorem independently of regulator values.

## Layer 4: Invariant forms and primitive periods

### 4.1 Cohomological indecomposables and their determinant lines

For the connected nonnegative cohomology algebras over ℚ, ℝ or ℂ used here, form the degree-q indecomposable space using the supplied quotient Q(A)=A₊/(A₊)². For a finite-dimensional degree-q quotient construct its rational determinant line ∧^dim Q^q(A); in dimension zero its specified generator is 1. Apply this construction to compact dual, compact group, arithmetic group and invariant-form cohomology, retaining the maps on their actual quotient carriers. (borel1977, §1.3, p.616, borel1977 line 122–126; §6.1, p.631, borel1977 line 567–570.)

A proof route is to use the generic graded augmentation quotient supplied by the CharacteristicClasses extension. Its homogeneous denominator is the span of A^i·A^j with i,j>0 and i+j=q; it is not a choice of complement. Apply the native exterior-power functor to these cohomological quotients. The polynomial-invariant quotient of CharacteristicClasses C5a.2 and these cohomological quotients must use the same general construction.

The interface requires the following facts.

- The cohomological adapter uses the specified quotient Q^q, not a complement or the whole H^q; its determinant is the native top exterior power, with ∧⁰0 identified with the coefficient field and generator 1.
- The comparison on the actual quotient is the map to which the native exterior-power functor is applied; no independent determinant scalar is chosen.
- The specified rational determinant line realifies and complexifies to the corresponding line of the scalar-extended quotient, preserving the empty generator.

**Checks.**

- In Λ(x₃,x₅), H⁸ has basis x₃x₅ and dimension 1 but Q⁸ has dimension 0; taking all cohomology would give 1 instead of 0.
- For Λ(x₃), Q³=k·[x₃] has dimension 1 and Q⁶=0, since x₃²=0 in characteristic zero.
- For A=k concentrated in degree 0, Q=0 in every degree and its determinant is k with empty generator 1.
- For k[u₂], Q²=k·[u₂] while Q⁴=0 although u₂²≠0. The quotient construction is not restricted to exterior algebras.

*Needs:* Mathlib `Submodule.mkQ`; Mathlib `exteriorPower.map`, `exteriorPower.map_id`, `exteriorPower.map_comp` and `exteriorPower.finrank_eq`; CharacteristicClasses C5a.4–C5a.5; gap:graded-indecomposable-api.

### 4.2 The actual invariant-form comparison

Let G=Res_(F/ℚ)SL_a, K its standard connected maximal compact subgroup, X=K\G(ℝ), Xᵘ=K\Gᵘ its compact dual and Γ a torsion-free arithmetic subgroup. Construct the graded invariant-form comparison jℝ:H*(Xᵘ,ℝ)→H*(Γ,ℝ) and its maps on Q^q and determinant lines. Before real correction let μ be the complex comparison induced by identical extensions of forms to the complex tangent space; in degree q set jℝ=i^q μ. Construct also α:H*(Lie(G)_ℂ,ℂ)→H*(Gᵘ,ℂ) and β:H*(Lie(G)_ℂ,ℂ)→H*(G(ℝ)/Γ,ℂ). (borel1977, §§3.3–3.5, pp.620–622, borel1977 line 289–337; §5.2, pp.626–627, borel1977 line 440–461.)

A proof route is to evaluate invariant forms at the identity, identify relative cochains, and descend to the quotient. Specify the source and target of every map. The Cartan identification gives the power i^q; multiplicativity follows from i^(p+q)=i^p i^q. Pullback under finite covers and stabilization supplies naturality. The maps exist outside the stable range; isomorphism there is a separate supplier theorem.

The interface requires the following facts.

- On each invariant form the comparison is the indicated identical complex extension followed by multiplication by i^q.
- The degree-zero constant 1 maps to 1.
- The comparison commutes with compatible block inclusions and arithmetic subgroup inclusions, hence induces the corresponding determinant maps.
- The corrected comparison has real values on real compact-dual classes; it is not obtained by forgetting an i-factor.

**Checks.**

- At q=0, i⁰=1 and jℝ(1)=1; the zero graded map fails this value.
- For degree-one and degree-two factors the correction scalars are i and -1; their product is -i=i³, the degree-three correction.
- At q=5 the correction is i⁵=i, whereas at q=3 it is -i. Using a constant -i in every odd degree fails weight 3.
- A C₂ stabilizer at a point has higher cohomology over 𝔽₂ in every nonnegative degree; plain point cohomology has only degree 0. Quotient-manifold descent here assumes torsion-free Γ and characteristic-zero coefficients.

*Needs:* §4.1; ArithmeticLocallySymmetricSpaces ALS.F.5 and ALS.0.4–ALS.0.9 and ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3; DifferentialGeometry Layers 5–6 and 8.

### 4.3 The compact period and the discriminant

For n≥2 and a≥n, the degree-(2n−1) primitive cohomology of Lie(Res_(F/ℚ)SL_a) and of its compact group Gᵘ has dimension N. Relative to their rational determinant lines, the absolute determinant of α lies in ℚ_>0·π^(Nn)·Δ_F^(−(2n−1)/2). This statement concerns α on the specified rational Lie algebra and compact cohomology structures. (borel1977, Proposition 4.3, pp.623–625, borel1977 line 347–402; §5.3 and Proposition 5.4, pp.627–628, borel1977 line 462–480.)

In one proof route, for split SL_a compare the torus character lattice with integral H¹ through integration on its oriented loops, and commute the rational transgression with this comparison. Each degree-(2n−1) primitive contributes a power π^n modulo rational factors. Over F take all N embeddings in the order of the Conventions. The rational Lie determinant generator is the embedding wedge scaled by δ_F^(−(2n−1)), using the corrected ordered determinant. Its absolute scalar is Δ_F^(−(2n−1)/2), giving the displayed discriminant power (borel1980, p.373, items 1–2, borel1980 line 33–42). Work with absolute determinants here; the real correction is made only in §5.1.

The interface requires the following facts.

- Rational basis changes multiply the determinant by a nonzero rational absolute value.
- The rational-line comparison commutes with restriction along a↦a+1 once the primitive degree survives.

**Checks.**

- For F=ℚ,n=2 the compact period class is π²·ℚ_>0; the degree-three suspended twisted character ch₂ᵗʷ pairs to -4π², with absolute ratio 4.
- For F=ℚ,n=3 the compact determinant class is π³·ℚ_>0, rather than π²·ℚ_>0.
- For F=ℚ(i) with ordered basis (1,i) and embeddings (i↦i,i↦−i), δ_F=−2i. At n=2, δ_F^(−3)=−i/8 has absolute value 1/8=4^(−3/2); replacing δ_F by 2 would lose the phase. Reversing the embedding order gives δ_F=2i and reverses the odd-degree wedge too, leaving the rational generator unchanged. The compact absolute class is π⁴/8·ℚ_>0 and is nonzero.

*Needs:* §4.1; §4.2; CharacteristicClasses C5a.3–C5a.5; Mathlib `NumberField.discr_ne_zero`.

### 4.4 Compact period cycles and the lower-degree ideal

For j≥1 choose D/F of degree j+1 split at infinity, and an odd a>4N(j+1)². Put b=(j+1)². The left regular action is D→End_F(D)≃M_b(F); on H=SL₁(D) use the faithful group representation g↦diag(L_g,I_(a−b)) in SL_a(F), where det(L_g)=Nrd(g)^(j+1)=1. The bound implies a≥b, so this identity block has a nonnegative size. For a torsion-free arithmetic Γ⊂Res SL_a, use this representation to form Z_j=Res SL₁(D)(ℝ)/(Γ∩Res SL₁(D)(ℝ)) inside Y_a=G(ℝ)/Γ. It is a compact connected oriented manifold of dimension N(j²+2j). For η_j, the product over s=1,…,j of the ordered embedding wedges in degree 2s+1 scaled by δ_F^(−(2s+1)), prove its restriction to Z_j is nonzero and |∫_(Z_j)β(η_j)|∈ℚ_>0·∏_(s=1)^jζ_F(s+1). Prove that wedging with η_(j−1) kills the ideal generated by the earlier primitive forms. (borel1977, Theorem 5.5 proof, pp.629–630, borel1977 line 499–551, especially equations (5)–(11).)

In one proof route, the left regular representation becomes j+1 copies of the standard representation after splitting D, followed by a trivial block of size a−(j+1)². A primitive generator restricts as j+1 times the standard one, so the wedge has nonzero factor (j+1)^j at each embedding. Each wedge uses the same ordered δ_F as §4.3, so the restricted top form is a nonzero rational gauge up to the scalar-restriction factor of §3.3; the quotient volume theorem evaluates its absolute period. Exterior multiplication by the earlier complete wedges annihilates every earlier generator, eliminating decomposable terms in the induction. Use ordinary singular periods of the actual compact cycle, not an asserted rationality of an unspecified integral.

The interface requires the following facts.

- The group and compact cycle dimension is N((j+1)²−1)=N(j²+2j).
- At one embedding the top primitive wedge restriction factor is (j+1)^j; at all embeddings it is (j+1)^(jN), and is nonzero.
- For every earlier generator x, η_(j−1)∧x=0. Thus changing primitive lifts by elements of the lower-generator ideal does not change the extracted period determinant.

**Checks.**

- For F=ℚ,j=1, dim Z=3 and the restriction factor is 2¹=2; its nonzero absolute period is a rational multiple of ζ(2).
- For F=ℚ,j=2, dim Z=8, restriction factor 3²=9, and the period class is ζ(2)ζ(3)·ℚ_>0. Dividing by the first period isolates ζ(3).
- For N=2,j=1 the dimension is 6 and the restriction factor is 2²=4, not 2.
- For j=1,N=1,a=17, the representation is diag(L_g,I₁₃) and its determinant is Nrd(g)²=1. The degree-two division algebra has no unital representation on a 17-dimensional F-space: the dimension of a finite left module is a multiple of 4. The padded group representation is the one used here.
- In Λ(x₃,x₅), x₃∧x₃=0, so wedging with η₁=x₃ kills the ideal generated by x₃. A product with no repeated earlier generator cannot be dropped merely for having positive degree.

*Needs:* §3.2; §3.6; §4.1; §4.2; CharacteristicClasses C5a.4–C5a.5; DifferentialGeometry Layers 5–6 and 8; gap:stable-finite-range.

### 4.5 The common compact-fibre comparison

For a number field F, n≥2, odd a with a−1>4N(2n−1), and torsion-free arithmetic Γ⊂Res SL_a, put q=2n−1 and Y=G(ℝ)/Γ. Construct the rational exact sequences 0→Q^qH*(Xᵘ,ℚ)→Prim H^q(Gᵘ,ℚ)→Prim H^q(K,ℚ)→0 and 0→Q^qH*(Γ,ℚ)→Q^qH*(Y,ℚ)→Prim H^q(K,ℚ)→0, with dimensions dₙ,N,N−dₙ. Their induced determinant-line decompositions are compatible, after complexification, with μ=β∘α⁻¹ and the identity on the compact-fibre factor. Their determinant identifications do not depend on choices of rational lifts. In degrees j≤q, β is an isomorphism after complexification. Its degree-q indecomposable target has rank N and has rational lifts of a rational indecomposable basis. The low-degree isomorphism and rank assertion also hold for even a in the same range: pass to an odd larger size and compare the truncated filtrations, since the additional Euler primitive of SO_a first occurs in degree a−1>q. (borel1977, §5.2, pp.626–627, borel1977 line 440–461; Theorem 6.2 proof, p.632, equations (3)–(4), borel1977 line 581–585.)

In one proof route, odd a gives surjectivity of compact-group cohomology onto fibre cohomology. The invariant-form comparison and its relative-cochain filtration carry this property to the arithmetic bundle in the stable range. Use the relative comparison through degree q on the base and the identity on the common fibre in gap:multiplicative-serre-comparison. Comparison of their filtered cochain spectral sequences gives the full-group isomorphism through degree q. Rational lifts of the fibre generators give Leray–Hirsch in that range; pass to indecomposables. No arithmetic period or zeta value enters this argument. Changing lifts adds base terms; the determinant block is triangular with fibre diagonal 1, making the determinant identification intrinsic. Keep the actual bundle and relative-cochain comparison, so its rightmost map is the identity, not an unspecified scalar.

The interface requires the following facts.

- The full-group comparison through degree q, its rank-N indecomposable description and the stable rational restriction maps precede the period argument of §4.6.
- The kernel of restriction to the fibre is the base indecomposable image in the displayed stable degree.
- For each exact sequence det(full)=det(base)⊗det(fibre), and the comparison on det(fibre) is precisely the identity.
- Adding a base lift changes a splitting by a block-unipotent matrix, with determinant 1.

**Checks.**

- For F=ℚ,n=2 the ranks are d=0,N=1,N−d=1. Cancelling the common rank-one fibre leaves the identity on ∧⁰0.
- For F=ℚ,n=3 the ranks are 1,1,0. The fibre determinant is the empty determinant 1.
- For F=ℚ(i), in either parity the ranks are 1,2,1; the full determinant has two generators and the base has one.
- For N=1,n=3, q=5 and a=23, the bound is 22>20. The two primitive degrees 3 and 5 have cumulative degree 8; β need only be an isomorphism through degree 5. For even a=22 the additional SO₂₂ Euler primitive has degree 21>5 and contributes nothing in that range.
- The splitting change [[1,2],[0,1]] has determinant 1; replacing the fibre identity by multiplication by 2 would have determinant 2 and is excluded.

*Needs:* §4.1; §4.2; ArithmeticKTheory §3.4; CharacteristicClasses C5a.4–C5a.5; AlgebraicTopology Stage 5 item 5; gap:stable-finite-range; gap:multiplicative-serre-comparison.

### 4.6 Arithmetic periods before cancelling the compact fibre

For n≥2 and a−1>4N(2n−1), let Γ⊂Res SL_a be torsion-free arithmetic and Y_a=G(ℝ)/Γ. In degree 2n−1 its indecomposable space has dimension N. With the δ_F-normalized rational Lie line of §4.3, the absolute determinant of β on that line into the rational determinant line of Q^(2n−1)H*(Y_a,ℚ) belongs to ℚ_>0·ζ_F(n). The assertion is compatible with stabilization and every commensurable arithmetic subgroup. (borel1977, Theorem 5.5, p.628, borel1977 line 481–494; determinant induction, pp.629–630, borel1977 line 499–551.)

A proof route first applies §4.5’s compact-fibre/filtered comparison to obtain the full-group isomorphism through degree 2n−1 and its rank-N indecomposable description. Enlarge a to an odd size satisfying §4.4. Express each primitive image as its indecomposable matrix plus terms in the ideal generated by earlier degrees. Wedge with the earlier complete primitive wedges to remove those terms. The nonzero periods on Z_j make the successive cumulative determinants rational multiples of the successive products of zeta values. Only the individual primitive degrees require stability: their rational lifts have a rational cumulative wedge, whose pairing with the integral compact cycle is rational in its full total degree. Section 4.4 proves that pairing is nonzero. Divide consecutive nonzero determinants. Borel’s corrected §5.5(1),(4) has no extra power of i (borel1980, p.373, item 3, borel1980 line 43). Rational transfer for finite-index subgroups and restriction of stable classes return the original a.

The interface requires the following facts.

- Restriction between finite-index arithmetic subgroups identifies the rational determinant lines in the stable range.
- Compatible matrix block inclusions identify the stated line comparison, including its nonzero determinant.

**Checks.**

- The cumulative products at j=0 and j=1 are 1 and ζ_F(2), so their quotient is ζ_F(2), not 0.
- At j=2, ζ_F(2)ζ_F(3)/ζ_F(2)=ζ_F(3); ζ_F(2)>0 supplies the nonzero denominator.
- For F=ℚ,n=2, the compact-dual primitive rank d is 0 but the full-group primitive rank N is 1. The ζ(2) period survives on this full line.

*Needs:* §4.1; §4.2; §4.4; §4.5; gap:multiplicative-serre-comparison; CharacteristicClasses C5a.4–C5a.5; gap:stable-finite-range.

### Examples

In Λ(x₃,x₅), degree 8 contains x₃x₅ but its indecomposable quotient is zero. In the degree-two division-algebra cycle the dimension over ℚ is 3, and the regular representation repeats a primitive class twice.

### Dependencies

Layers 2–3; CharacteristicClasses C5a for compact primitive/transgression theory and gap:multiplicative-serre-comparison for §4.5; AlgebraicTopology Stage 5 item 5; ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–ALS.0.9 and ALS.5b.1; DifferentialGeometry Layers 5–6 and 8; ArithmeticKTheory §3.4 for the stable arithmetic comparison, with its finite-range contract.

## Layer 5: Primitive determinant and the integral regulator lattice

### 5.1 The primitive-period determinant in its cohomological convention

For every F,n≥2,a−1>4N(2n−1) and torsion-free arithmetic Γ⊂Res SL_a, let Lᵘ=∧^dₙQ^(2n−1)H*(X_aᵘ,ℚ) and LΓ=∧^dₙQ^(2n−1)H*(Γ,ℚ). The actual real comparison induced by jℝ sends Lᵘ to c·LΓ for c∈ℚˣ·√Δ_F·π^(−Nn)·ζ_F(n). The determinant statement includes dₙ=0, with the actual empty comparison equal to 1. Its rank-zero numerical form, the native acceptance statement `exists_pos_rat_dedekindZeta_of_isTotallyReal`, says that for totally real F and even n≥2 the number √Δ_F·ζ_F(n)·π^(−Nn) is a positive rational (borel1977, Remark 6.3, p.632, borel1977 line 590–594). It is stable in a and compatible with passage to commensurable Γ. (borel1977, Theorem 6.2 and proof, pp.631–632, borel1977 line 567–589; Remark 6.3, borel1977 line 590–594.)

In one proof route, for odd large a, the compact fibre K_a is totally nonhomologous to zero in both Gᵘ and Y_a. Use the rational Leray–Hirsch/primitive determinant decomposition of Borel §5.2 and its compatible relative-cochain filtration: the two full determinant lines split into compact-dual/arithmetic lines and the same compact-fibre line. Cancel this common line using the identity comparison on it. Apply the absolute determinants of §§4.3 and 4.6 and |i^((2n−1)dₙ)|=1 from §4.2. This gives |c|∈ℚ_>0·Δ_F^((2n−1)/2)·π^(−Nn)·ζ_F(n). Since Δ_F^((2n−1)/2)=Δ_F^(n−1)√Δ_F and Δ_F^(n−1) is a positive rational, the established reality and nonvanishing of jℝ give the displayed ℚˣ-class. Use the corrected §6.2(5), without its printed extra i-power (borel1980, p.373, item 3, borel1980 line 43). Even a follows by stable restriction. This cancellation is an additional comparison proved here, not a dimension argument.

The interface requires the following facts.

- If dₙ=0, both determinant lines are ℚ with empty generator 1 and the induced map sends 1 to 1.
- The actual induced determinant map commutes with stable restriction and finite-index arithmetic restriction.
- The scalar c is real and nonzero because it is the determinant of the actual real comparison; its absolute value is the quotient of the two full absolute determinants after the identical fibre determinant cancels.

**Checks.**

- For ℚ,n=2, d=0 and the comparison determinant is 1, while √Δπ^(−2)ζ(2)=1/6. Their quotient is 6∈ℚˣ.
- For ℚ,n=3, N=d=1, the absolute cohomological determinant class is ζ(3)/π³. The renormalized regulator class has one additional π.
- For ℚ(i), N=2 and |δ_F|=2. At n=2 and n=3 the absolute discriminant factors are 2³=8 and 2⁵=32, respectively; dividing these by √Δ_F=2 gives 4 and 16, both positive rationals. The final absolute classes are 2ζ_F(2)/π⁴ and 2ζ_F(3)/π⁶.
- For F=ℚ(√5),n=2, N=2,d=0 and the absolute real comparison is 1. Here ζ_F(2)=(π²/6)·4π²/(25√5), so √5·ζ_F(2)/π⁴=2/75>0; the empty determinant divided by this value is 75/2.

*Needs:* §4.3; §4.6; §4.2; ArithmeticKTheory §3.4; gap:stable-finite-range; §4.5; Mathlib `NumberField.IsTotallyReal`, `NumberField.nrComplexPlaces_eq_zero_iff`, `NumberField.discr`, `NumberField.discr_ne_zero` and `NumberField.dedekindZeta`.

### 5.2 The homotopy and Tate lattice conversion

For n≥2, transport the free compact-dual homotopy lattice through the suspended twisted character chₙᵗʷ into Vₙ(F). Prove that its covolume for the Cₙ(F)-normalized coordinate measure is (2π)^dₙ·ε(F,n), where ε(F,n)=2^r₁ when n≡3 mod4 and ε(F,n)=1 otherwise. The compact real-place homotopy generator maps with index 1 in degree 1 mod8 and index 2 in degree 5 mod8; a complex place contributes one conjugate pair. (burgos2002, Lemma 9.18, Definition 9.19 and Remark 9.20, p.84, burgos2002 line 3546–3614.)

Construct the stable Cartan map C:SU/SO→SU by C(gSO)=g gᵗ, with identity basepoint, and compute its map on the free homotopy groups in the displayed degrees. A proof route combines the SO→SU→SU/SO homotopy sequence of StableHomotopyKTheory §§2.3–2.5 with TopologicalKTheory T7 item 1’s c(b)=u⁴ and c(a)=2u², preserving the ordered generators. The Cartan-map identification and index computation are targets of this section (burgos2002, Lemma 9.18 and proof, burgos2002 line 3546–3576). Evaluate suspended chₙᵗʷ on the homotopy generators, with the integral normalization of §2.1. Each surviving coordinate contributes 2π from the twist shift; the real-place index contributes precisely in n≡3 mod4. Record these indices before passing to a rational class.

The interface requires the following facts.

- At a surviving real place the integral index is 1 for n≡1 mod4 and 2 for n≡3 mod4.
- Each complex place contributes one factor 2π, with no second independent embedding coordinate.
- For dₙ=0 the factor is 1, since n is even and ε=1.

**Checks.**

- At F=ℚ,n=1, the target has dimension d₁=1 but π₁(SU)=π₁(SU/SO)=0, since SU is simply connected and SO is connected. The transported subgroup is {0} and does not span the line, so it has no full-lattice covolume 2π; n≥2 excludes this case.
- For ℚ,n=2, d=0 and ε=1, giving transported homotopy-lattice covolume 1.
- For ℚ,n=3, d=1 and ε=2: on π₅ the quotient SU→SU/SO is onto and C has index 2, so their composite is multiplication by 2. This gives transported homotopy-lattice covolume 4π; a zero Cartan map would give 0.
- For ℚ,n=5, d=1 and ε=1: on π₉ the quotient has image 2ℤ and C has index 1, again giving composite multiplication by 2. Thus its transported homotopy-lattice covolume is 2π. At the identity coset C(SO)=I. For g=diag(i,-i) and h=[[0,1],[-1,0]] in SO₂, both (gh)(gh)ᵗ and g gᵗ equal -I; the assignment [g]↦g would instead depend on the representative.
- For an imaginary quadratic field, d=1,r₁=0 in either parity, so the transported homotopy-lattice covolume is 2π in both weights 2 and 3.

*Needs:* §1.1; §2.1; §2.3; gap:integral-chern-calibration; TopologicalKTheory T4 and T7 item 1; StableHomotopyKTheory §§2.3–2.5.

### 5.3 The integral image and its positive covolume

Let A=K_(2n−1)(O_F). Define Λₙ(F)=r_Bo(A) as a ℤ-submodule of Vₙ(F). The map A/A_tors→Λₙ is an isomorphism, Λₙ is discrete and spans Vₙ, and hence is an IsZLattice over ℝ. Define R_Bo(F,n)=ZLattice.covolume Λₙ for the coordinate Haar measure of §1.1. It is strictly positive and equals the absolute determinant of the regulator on any ordered ℤ-basis of A/A_tors. If dₙ=0 it is 1. (burgos2002, Definition 9.19, p.84, burgos2002 line 3577–3606; Corollary 9.8, p.78, burgos2002 line 3140–3150.)

In one proof route, finite generation supplies a free finite-rank torsion quotient. Extend a ℤ-basis over ℝ and use the actual real regulator isomorphism to transport the standard lattice. Its image is exactly Λₙ; discreteness does not follow from finite generation of an arbitrary subgroup of ℝ. Apply the pinned covolume determinant theorem with the normalized measure, including dimension zero.

The interface requires the following facts.

- v∈Λₙ if and only if there exists an integral K-class x with r_Bo(x)=v.
- The integral regulator factors through A/A_tors and induces the specified isomorphism onto its image.
- The submodule has discrete subtype topology and its real span is the whole Vₙ.
- Its covolume is positive and is the absolute determinant in the §1.1 coordinates; unimodular changes of free basis preserve it.

**Checks.**

- For ℚ,n=2 the free group is 0, Λ={0} in {0}, and the empty determinant and covolume are both 1, not 0.
- If x generates the free quotient and has coordinate t≠0, Λ=tℤ and R=|t|. Using 2x gives sublattice 2tℤ of index 2 and covolume 2|t|. For ℚ,n=3, §§6.0a and 6.2 give r_Be(x)=−t/2 and ColemanIntegration’s Beilinson image (−t/2)ℤ=(t/2)ℤ, with covolume |t|/2. The lattice equality alone does not detect the sign of the map.
- The finitely generated subgroup ℤ+√2ℤ⊂ℝ is not discrete although it spans. Its source has rank 2 and real extension cannot be an isomorphism to the rank-one target.
- If d=1, the rational image is tℚ: t/m→0 with t/m≠0 for m≥1, so this image is not the integral lattice tℤ.

*Needs:* §2.3; §1.1; ArithmeticKTheory §§3.2–3.4; Mathlib `IsZLattice`; Mathlib `ZLattice.covolume_pos`; Mathlib `ZLattice.covolume_eq_det`.

### 5.4 The zeta covolume and every rational basis

For every F and n≥2, R_Bo(F,n)∈ℚˣ·ζ_F*(1−n) and R_Bo(F,n)∈ℚ_>0·√Δ_F·π^(dₙ−Nn)·ζ_F(n). The rational regulator image is exactly the ℚ-span of Λₙ. For any ordered rational K-basis, its signed determinant in Tate-divided coordinates is in ℚˣ·√Δ_F·π^(dₙ−Nn)·ζ_F(n); its absolute determinant differs from R_Bo by a positive rational. (burgos2002, Theorem 9.12, p.80, burgos2002 line 3253–3259; Remark 9.20, p.84, burgos2002 line 3607–3614; borel1977 §6.4, p.633, borel1977 line 600–615.)

A proof route is to pair the primitive cohomology determinant of §5.1 with rational primitive homology, and compare integral homotopy generators with the free K-basis. This identifies its absolute determinant class with the original homotopy-lattice regulator. Let R′_Bo denote the covolume of that regulator image relative to the compact-dual homotopy lattice (burgos2002, Definition 9.10, p.79, burgos2002 line 3222–3225). Section 5.2 and change of reference Haar measure give the exact identity R_Bo=(2π)^dₙ·ε(F,n)·R′_Bo. This gives the extra π^dₙ and the explicit rational 2-factor; §1.3 gives the leading-term form. Rational localization identifies the rational span; rational basis change multiplies the determinant by det A∈ℚˣ. Rank zero is inherited from §5.1’s volume argument.

The interface requires the following facts.

- There exists q∈ℚˣ with R_Bo=q·ζ_F*(1−n); the sign of q can be negative.
- The ratio to √Δ_F π^(dₙ−Nn) ζ_F(n) is a strictly positive rational.
- The image of K_(2n−1)(F)⊗ℚ equals span_ℚ Λₙ as a subset of Vₙ.
- Replacing rational basis columns by A multiplies the signed determinant by det A, and the absolute determinant by |det A|.

**Checks.**

- For ℚ,n=2, R=1 and ζ*(-1)=-1/12, so the leading-term rational factor is -12. The positive-integer factor is 6 since ζ(2)/π²=1/6.
- For ℚ,n=3 the exponent d−Nn is -2, so R is a nonzero rational multiple of ζ(3)/π²; using the unconverted cohomology determinant would give exponent -3.
- For ℚ(i), √Δ=2 and d=1. The classes are 2ζ_F(2)/π³ at n=2 and 2ζ_F(3)/π⁵ at n=3.
- In dimension 2, swapping two rational basis columns has determinant -1, so signed determinant changes sign while R is unchanged. Multiplying one basis column by 2 doubles its absolute determinant.

*Needs:* §1.3; §5.1; §5.2; §5.3; Mathlib `Matrix.det_fin_zero`.

### 5.5 S-integers and orders with every finite prime

For finite S, transport the regulator through ArithmeticKTheory’s actual equivalence K_(2n−1)(O_F)⊗ℚ≃K_(2n−1)(O_(F,S))⊗ℚ. The images of the two integral groups are equal full lattices in Vₙ, and their covolumes are equal. For any full unital ℤ-order R⊂F, transport through the actual rational inclusion into F; its integral image Λₙ(R) is a sublattice of finite index in Λₙ, and its covolume is [Λₙ:Λₙ(R)]·R_Bo. All extension and S-enlargement squares, and transfer squares under GeneralAlgebraicKTheory §7.7’s finite-resolution condition (in particular for finite-projective ring maps), use the supplied maps and the §1.2 target maps; the field transfers exist for every finite number-field extension. (Regulator normalization: borel1977, §6.4, pp.632–633, borel1977 line 595–615. The S-integer and order transport follows from ArithmeticKTheory §3.3 surjectivity in odd degree ≥3, §3.4’s actual inclusion equivalence borel_rank_order for every order.)

A proof route is to use the supplier’s finite kernel and cokernel and finite generation for S-integers, and rational order comparison. In degree 2n−1≥3 the finite-S localization map is surjective, so the integral regulator images are equal. Every element of an order R is integral over ℤ, so R⊂O_F. Functoriality factors K(R)→K(F) through K(O_F), placing Λₙ(R) inside Λₙ. The actual rational inclusion equivalence of ArithmeticKTheory §3.4 gives its full rational span. A full-rank subgroup of the finitely generated free group Λₙ has finite index, and the native lattice index identity gives the covolume formula; finite generation of K_(2n−1)(R) is unnecessary. This is a transport of regulator structure, not another arithmetic rank or localization proof.

The interface requires the following facts.

- S-enlargement and composition agree with the actual localized K-map; in higher odd degree they preserve the integral image and its covolume exactly.
- For each R⊂O_F the actual regulator images satisfy Λₙ(R)⊂Λₙ with finite index m≥1 and covolume m·R_Bo; inclusions of orders compose these image inclusions.

**Checks.**

- At S=∅ the transported map is r_Bo and the covolume ratio is 1.
- For S containing a prime above 2 and n=2 or 3 the rational rank remains dₙ. No factor is deleted merely because its residue characteristic is 2.
- For ℤ→ℤ[1/2] in degree 1, the unit ranks are 0 and 1, so the transported finite-rank equivalence asserted for 2n−1≥3 cannot be extended to K₁.
- For F=ℚ(i), R=ℤ[2i], n=2 and Λ₂=tℤ with t≠0, the order image is mtℤ for an integer m≥1, with covolume m|t| and index m; the zero subgroup has rank 0 and is excluded by the rational inclusion equivalence. At rank zero both images are {0}, their index is 1 and both covolumes are 1.
- For two lattices with common sublattice indices 2 and 3, their covolume ratio is 3/2 in the corresponding order; rational commensurability does not imply equality.

*Needs:* §1.2; §2.3; §5.3; §5.4; ArithmeticKTheory §§3.3–3.4; GeneralAlgebraicKTheory §§7.7–7.8; Mathlib `ZLattice.covolume_div_covolume_eq_relIndex`; GeneralAlgebraicKTheory §3.2.

### Examples

For ℚ in weight 3 the compact-dual cohomology determinant class is ζ(3)/π³, while the Tate-divided regulator class is ζ(3)/π². The exact conversion of the corresponding covolumes is 4π.

The totally real even-weight specialization of §5.1 has dₙ=0: both empty generators map to 1. Its scalar class agrees, through §1.3, with IntegralIwasawaTheory §6.0’s trivial-character Siegel–Klingen value and LFunctions Layer 3’s functional equation (borel1977, Remark 6.3, p.632, borel1977 line 590–594).

**Checks.**

- For ℚ,n=2, ζ(-1)=-1/12 and the §1.3 ratio is -1/2, giving ζ(2)/π²=1/6 and reciprocal 6. The comparison scalar is 1, and 6·(1/6)=1.
- For ℚ,n=4, ζ(-3)=1/120 and the ratio is 3/4, giving ζ(4)/π⁴=1/90 and reciprocal 90; the empty determinant remains 1.
- For r₁=N,r₂=0 and n=2k≥2, d=0 and the exponent is -2kN; at N=2 it is -4k. Positivity of Δ_F, π and ζ_F(n) makes the rational class positive and its reciprocal defined.
- For ℚ(i), even n gives r₂=d=1, so the determinant has one row. Its covolume cannot be replaced by the empty value 1.

### Dependencies

Layers 1–4; ArithmeticKTheory §§3.2–3.4; CharacteristicClasses and gap:integral-chern-calibration; TopologicalKTheory T7 item 1 and StableHomotopyKTheory §§2.3–2.5 for §5.2; pinned IsZLattice and covolume theorems. The totally real example compares §5.1 with IntegralIwasawaTheory §6.0 through §1.3 and LFunctions Layer 3.

## Layer 6: Point Deligne realization and the Beilinson comparison

### 6.0a Calibration of the shared universal Chern regulator

Use the Deligne realization, products and universal character of MotivicEtaleKTheory §§3.3–3.4, 4.1–4.2 and 7.1. Write ch_D,n:K_m(X)→H_D^(2n−m)(X,ℝ(n)) for that character on smooth quasi-projective complex X, m≥1,n≥1. Identify its universal Deligne class with the unique lift of CharacteristicClasses C6’s twisted topological character under the forgetful isomorphism H_D^(2n)(B·GL_b(ℂ),ℝ(n))→H^(2n)(B·GL_b(ℂ),ℝ(n)), for b≥1. This is a normalization comparison on the supplied classifying nerves, using the ordered suspension and εₙ of the Conventions; it does not construct another universal character. Prove compatibility with simultaneous geometric/coefficient conjugation. For every finite étale f:X→Y between smooth quasi-projective complex varieties, construct trace f_*:H_D^j(X,ℝ(n))→H_D^j(Y,ℝ(n)) for every integer j, and prove ch_D,n∘Tr_K=f_*∘ch_D,n, where Tr_K:K_m(X)→K_m(Y) is the supplied finite-projective transfer. On actual K-groups prove ch_D,n∘ψᵃ=aⁿch_D,n for a≥1. These interfaces use universal Chern classes, without the arithmetic regulator isomorphism or the Borel–Beilinson equality (burgos2002, §10.2, equation (10.10), and Definitions 10.7–10.8, pp.92–94, burgos2002 line 4002–4106; deligne_goncharov2005, §1.6, p.9, deligne_goncharov2005 line 429–440).

Write C_M for the supplied f−r cone and C_B for Burgos’s r−f cone, whose differential is d(r,f,ω)=(dr,df,r−f−dω). The chain isomorphism S:C_B→C_M is S(r,f,ω)=(r,f,−ω). Keep the supplier’s point inclusion I_M(x)=(0,0,x) and coordinate κ_M(ω)=P_(n−1)(ω), so κ_M∘I_M=id. In C_B their transports are I_B(x)=(0,0,−x) and κ_B(ω)=−P_(n−1)(ω), giving S∘I_B=I_M, κ_M∘S=κ_B and κ_B∘I_B=id. The quotient representative z of §6.1 is ω in C_M and −ω in C_B. These are the fixed shared coordinates of MotivicEtaleKTheory §§3.3 and 7.4.

Burgos’s evaluation is instead η_B(r,f,ω)=P_(n−1)(ω) in degree one and zero in other degrees. Thus η_B=−κ_B at a point, and its transport η_M=η_B∘S⁻¹ has degree-one formula −P_(n−1)(ω)=−κ_M(ω). Let c_M be the universal Deligne lift of chₙᵗʷ and put c_B=S⁻¹c_M. Since S preserves the real component u₁, both lifts have the same topological Chern class; the forgetful isomorphism fixes c_B as Burgos’s lift. Naturality gives ev_B* c_B=S⁻¹ev_M* c_M on the discrete nerve, and hence η_B(ev_B* c_B)=−κ_M(ev_M* c_M) on its point-coefficient complex. Products and evaluation are transported with S; this comparison retains the difference between η_B and the shared coordinate (burgos2002, equations (10.2)–(10.3), p.89, burgos2002 line 3897–3904; equation (10.10), p.92, burgos2002 line 4010–4016; evaluation, pp.92–94, burgos2002 line 4024–4036 and 4081–4089).

For n≥2 let κₙ=κ_M:H¹_D(Spec ℂ,ℝ(n))→ℝ(n−1) be this fixed shared point identification. Prove the equality of maps reg_∞=κₙ∘ch_D,n:K_(2n−1)(ℂ)⊗ℚ→ℝ(n−1), where reg_∞ is ColemanIntegration §L3.Fc.1’s complex-field map with MotivicEtaleKTheory §7.4’s point normalization. For every number-field embedding σ:F→ℂ and every x∈K_(2n−1)(F)⊗ℚ, its σ-coordinate is reg_∞(σ_*x)=κₙ(ch_D,n(σ_*x)); if [z_σ] is its quotient class in §6.1, this value is P_(n−1)(z_σ), independently of the representative. Apply the equality to the image of each integral class to identify integral images. Burgos’s Definitions 10.7–10.8 use η_B on c_B and therefore give the negative of this shared map, with the same integral image and absolute covolume (burgos2002 line 4081–4106).

The interface requires the following facts.

- Real descent uses conjugation on both points and coefficients, and finite disjoint unions give products of the supplied complexes.
- The supplied universal class has the topological Chern character and ordered suspension of CharacteristicClasses C6. For n≥2 its suspended rational character evaluates to 1 on εₙ and its twisted value is (2πi)ⁿ, compatibly with stabilization.
- The Deligne trace is the sum over sheets on an étale trivialization, commutes with refinement, and composes in towers; this determines it. For f of constant degree e, its composite with pullback is e·id. At number-field points these maps are exactly the full embedding sum and repeated coordinates of §1.2.
- The character is additive and intertwines ψᵃ with aⁿ; the statement concerns its image and does not presuppose pure Adams weight on K-theory.
- The equality with reg_∞ uses the supplier’s positive small-model projection and every actual embedding map. Burgos’s evaluation on the same transported universal class is its negative. The complex-field equality imposes no Galois hypothesis.

**Checks.**

- On a complex point at n=2, H⁰=0 and H¹≃iℝ. The shared inclusion of i in C_M is (0,0,i), with κ_M(i)=i. Its C_B representative is (0,0,−i), with κ_B(−i)=i and η_B(−i)=−i. Starting instead with ω_B=i gives ω_M=−i and κ_M(−i)=κ_B(i)=−i. Using −P on C_M would fail κ_M∘I_M=id by sending i to −i.
- At n=3, I_M(1)=(0,0,1) transports to I_B(1)=(0,0,−1); κ_B(−1)=1 while η_B(−1)=−1. At n=0 the arrow (r,f)↦r−f is onto with one-dimensional kernel, so H⁰=ℝ and H¹=0; there is no positive-weight point quotient in that weight.
- For two complex points in weight 2, transfer sends (i,2i) to 3i and restriction sends i to (i,i); their composite is 2i. Conjugation sends i to −i and swaps the two embeddings of an imaginary pair, preserving (i,−i).
- For an identity cover, trace(i)=i; the empty cover has trace 0. For the tower of trivial covers of degrees 2 and 3, successive traces of a pulled-back i give 2i and then 6i, equal to the degree-six trace; averaging would give i.
- The normalized suspended character on ε₂ has rational value 1 and twisted value −4π²; on ε₃ the values are 1 and −8π³i. The zero and doubled classes give rational values 0 and 2 and fail calibration.
- At a=1 the Adams multiplier is 1; at n=3,a=2 it is 8. This does not assume ψ²=8 on K-theory before applying the regulator.

*Needs:* MotivicEtaleKTheory §§3.3–3.4, 4.1–4.2, 7.1 and 7.4; ColemanIntegration §L3.Fc.1 (the map to be identified); GeneralAlgebraicKTheory §§2.5, 3.12 and 7.7–7.8; CharacteristicClasses C6 items 2–3 and gap:integral-chern-calibration; SchemeKTheoryOperations §6.8.

### 6.0b The infinitesimal classifying comparison

For every connected complex reductive group G, define B⁽¹⁾·G as the subscheme of the simplicial classifying variety cut out by the cosimplicial ideal generated by the square of the identity ideal in degree one. Identify its normalized holomorphic functions with CE*(Lie G,ℂ), and its normalized holomorphic forms with the Weil bicomplex W(Lie G). For every connected real Lie group H define the analogous quotient of smooth functions by the cosimplicial square-ideal and identify its normalized ℝ(n−1)-valued complex with CE*(Lie H,ℝ(n−1)) for n≥1. Specialize these maps to G=GL_b(ℂ), b≥1, and its underlying real Lie group: the first two Lie algebras are complex, and the third is the underlying real Lie algebra. Require compatibility with the Hodge filtration and evaluation into continuous cohomology. Track both the shared point coordinate κ_M=P_(n−1) and Burgos’s transported degree-one evaluation η_M=−P_(n−1); fix coefficients independently of the equality r_Bo=−2r_Be. (burgos2002, Chapter 8, Propositions 8.9, 8.10 and 8.14, pp.70–73; Theorem 10.9 proof, pp.95–96, burgos2002 line 2838–2889, 2967–2969 and 4172–4191.)

The interface requires the following facts.

- The cosimplicial square-ideal is preserved by all face and degeneracy maps. The induced normalized comparisons commute with differentials and products.
- Holomorphic forms identify the Hodge filtration with the specified Weil filtration; the function and form comparisons commute with inclusion of functions as degree-zero forms.
- Evaluation followed by η_B=P_(n−1) on C_B agrees with evaluation followed by η_M=−P_(n−1) on C_M. The shared point evaluation κ_M is the negative of η_M. Degree-zero constants in the function/CE comparisons map identically, and stabilization respects all these maps.

**Checks.**

- In degree one for G=GL₁, put x=t−1 in ℂ[t,t⁻¹]/(t−1)². Then x≠0 and x²=0. The formal completion ℂ[[x]] instead has x²≠0 and fails the square-ideal definition.
- At b=1 the complex Lie algebra is abelian of dimension 1: its CE differential is 0 and its dimensions in degrees 0,1,2 are 1,1,0. A degree-two complex generator would give the false value 1.
- The same Lie algebra over ℝ is abelian of dimension 2, with CE dimensions 1,2,1 and zero differential. Its degree-two dimension is 1 rather than the complex value 0.
- On the C_M representative 1+i, weight 2 gives κ_M(1+i)=i and η_M(1+i)=−i; weight 3 gives 1 and −1. On its C_B representative −1−i, η_B gives −i and −1 respectively. The function/CE comparison sends the degree-zero constant to 1. Zero comparison, opposite Tate parity and conflating κ_M with η_M fail these values.

*Needs:* §6.0a; AutomorphicFormsOnReductiveGroups §§1.1–1.3; ArithmeticLocallySymmetricSpaces ALS.F.5; CharacteristicClasses C5a.3 (Weil differential and transgression); SchemeAndStackFoundations §0.28 (ideal sheaves and their quotient comparisons).

### 6.1 The point quotient and the real embedding model

For n>0 define the real vector-space model Dₙ(F)=(∏_(σ∈Σ_F)ℂ/ℝ(n))^conj. On ℂ define the real linear projection P_(n−1):ℂ→ℝ(n−1) by P_(n−1)(z)=(z+(-1)^(n−1)conj z)/2. It annihilates ℝ(n), induces ℂ/ℝ(n)≃ℝ(n−1), and gives Dₙ(F)≃Vₙ(F). Identify this concrete model with H¹_D(Spec(F)×_ℚℝ,ℝ(n)) through §6.0a’s Deligne complexes and finite-disjoint-union and real-descent maps. (burgos2002, Examples 10.4–10.5 and Remark 10.6, pp.91–92, burgos2002 line 3955–4008.)

A proof route is to split ℂ as the direct sum of the two real Tate axes. Check both inverse maps: P has kernel ℝ(n), and the inclusion of ℝ(n−1) followed by quotient has inverse induced by P. Apply this to all embeddings and commute with simultaneous conjugation. The point identification is the supplied small-model coordinate of §6.0a: z=ω_M in C_M and z=−ω_B in C_B, with inverse x↦(0,0,x) in C_M. Burgos’s η_B on C_B is the negative of this identification.

The interface requires the following facts.

- The map from a coset [z] is P_(n−1)(z), independent of the representative.
- The inverse sends a vector of ℝ(n−1) to its coset in ℂ/ℝ(n); both composites are identities.
- Define the point integral structure as the conjugation-fixed product of the quotient images of ℤ(n−1). Its identification with Cₙ sends the selected generator (2πi)^(n−1) to coordinate 1; the quotient image of ℤ(n) itself is zero.
- Restriction and trace on points become exactly R and T of §1.2.

**Checks.**

- For n=2, P₁(1)=0 and P₁(i)=i; the nonzero class of i survives modulo ℝ(2)=ℝ.
- For n=3, P₂(1)=1 and P₂(i)=0; projection onto the imaginary axis would reverse these values.
- For n=2, z=1+i has P₁(z)=i and z-P₁(z)=1∈ℝ(2); for n=3 it has P₂(z)=1 and difference i∈ℝ(3). Both quotient inverse identities hold.
- At n=1, P₀(1+i)=1 and ℂ/ℝ(1) identifies with ℝ; this concerns the point target, not a finite-rank regulator on Fˣ. Extending the formula with natural-number subtraction to n=0 gives P₀, which does not annihilate ℝ(0): P₀(1)=1. The positive-weight hypothesis prevents that junk value; geometric Deligne H¹ at weight zero is also zero.
- At F=ℚ,n=2 the conjugation-fixed quotient is 0; at n=3 it is one-dimensional. Taking invariants on embeddings alone would give a false weight-two real direction.

*Needs:* §1.1; Mathlib `Submodule.mkQ`; §6.0a.

### 6.2 Comparison with the universal realization

Let r_Be be the independently constructed shared universal Beilinson regulator on K_(2n−1)(F), with universal class lifting chₙᵗʷ and the supplier’s point coordinate κ_M of §6.1. On O_F and on rationalized field K-theory, r_Bo=−2r_Be. For the same ordered rational K-basis and embedding coordinates det(r_Bo)=(−2)^dₙdet(r_Be), including the empty determinant. The maps commute with restriction and the full embedding trace for transfers. Burgos’s map evaluates c_B with η_B and equals −r_Be by §6.0a; his positive factor two is applied to that map (burgos2002, Definitions 10.7–10.8, p.94, burgos2002 line 4087–4106; Theorem 10.9 and proof, pp.95–97, burgos2002 line 4133–4241).

A proof route is to pull back the universal Chern class along the discrete classifying nerve. Apply §6.0b’s infinitesimal comparison with the Chevalley–Eilenberg and Weil complexes. If Φ is the suspended twisted Chern form, Burgos’s evaluation yields P_(n−1)∘Φ, whereas Boₙ of §2.1 yields 2P_(n−1)∘Φ (burgos2002, Proposition 9.26, p.88, burgos2002 line 3865–3869; Lemma 10.10 and Proposition 10.11, p.97, burgos2002 line 4227–4241). The shared evaluation κ_M gives the negative of Burgos’s evaluation of the same transported class, hence −P_(n−1)∘Φ. Thus the shared cocycle has coefficient −1/2 relative to Boₙ. This proves the signed class equality and its evaluation on K-theory without defining either regulator by the other. Take determinants, then absolute values for covolumes, and use localization and naturality.

The interface requires the following facts.

- Equality holds on the actual universal regulator after the explicit point target identification. Section 6.0a’s equality with reg_∞ identifies ColemanIntegration §L3.Fc.1’s embeddingwise map with this same r_Be, including its integral image.
- The signed determinant ratio is exactly (−2)^dₙ for the same basis and coordinate order; its absolute value is 2^dₙ.
- The images of the same integral free quotient have covolumes related by R_Bo=2^dₙ R_Be; arbitrary unrelated lattices are not compared.

**Checks.**

- For ℚ,n=2 both determinant maps send 1 to 1 and (−2)⁰=1; the comparison supplies no ζ(2) value by itself.
- For ℚ,n=3 or any imaginary quadratic F in weight 2 or 3, d=1 and the ordered determinant ratio is −2. For F=ℚ(i), n=2 and an integral class with nonzero shared coordinate t∈iℝ, Burgos’s coordinate is −t and the Borel coordinate is −2t; the divided coordinates have the same ratio −2. A comparison with +2 would give 2t≠−2t.
- For a real quadratic F,n=3, d=2 and the ratio is 4, not 2.
- For N=1 the complex Lie algebra gl₁(ℂ) is abelian of complex dimension 1, so its complex CE differential is zero and its degree-two term is 0. Its underlying real Lie algebra has dimension 2, with degree-two CE term a real line; conflating these coefficient conventions would interchange 0 and 1. Both normalized degree-zero comparisons send 1 to 1.
- In a rank-one example with Borel value t≠0 on a free generator, the shared Beilinson value is −t/2 and (−2)(−t/2)=t; the zero map gives 0≠t. ColemanIntegration’s value on that same class is −t/2, with image (−t/2)ℤ=(t/2)ℤ and covolume |t|/2, while Λₙ=tℤ has covolume |t|. Replacing κ_M by −κ_M preserves this lattice but violates κ_M∘I_M=id and the equality with reg_∞.

*Needs:* §2.1; §2.2; §6.1; §5.3; CharacteristicClasses C5a.3–C5a.5 and C6 items 2–3; §6.0a; §6.0b.

### 6.3 The rational Adams weight

For every F,n≥2 and integer a≥1, the supplied Adams operation ψ^a acts on K_(2n−1)(F)⊗ℚ as a^n·id. The same holds on rationalized O_F K-theory through localization, and the determinant of ψ^a on that space is a^(ndₙ). (deligne_goncharov2005, Published §1.6, p.9, deligne_goncharov2005 line 429–440, after equation (1.6.10).)

A proof route is to use the universal identity chₙψ^a=a^n chₙ and its realization through the actual Beilinson regulator. Apply its injectivity from §2.3 and §6.2. No weight projector or conclusion is included among the hypotheses; the Adams/Chern compatibility is proved in §6.0a.

The interface requires the following facts.

- The actual regulator intertwines ψ^a with multiplication by a^n.
- The determinant is a^(ndₙ), with value 1 on the zero space.

**Checks.**

- At F=ℚ,n=3,a=2, ψ² acts by 8 and its determinant is 8 on the rank-one rational K₅.
- At a real quadratic F,n=3,a=2, ψ² acts by 8 on two coordinates, so its determinant is 8²=64.
- At F=ℚ,n=2,a=2 the space is 0 and its determinant is 2^(2·0)=1, not 4.
- At a=1 the scalar and determinant are both 1 for every dₙ. The theorem makes no claim for a=0.

*Needs:* §2.3; §6.2; SchemeKTheoryOperations §6.8; §6.0a.

### Examples

At a complex point, weight 2 projects 1 to 0 and i to i; weight 3 projects 1 to 1 and i to 0. The signed regulator determinant ratio is 1 at rank zero, −2 at rank one and 4 at rank two; the absolute ratios are 1,2,4.

### Dependencies

Layers 1–2 and 5; MotivicEtaleKTheory §§3.3–3.4, 4.1–4.2, 7.1 and 7.4 for the shared Deligne realization, independent universal character and fixed point projection; ColemanIntegration §L3.Fc.1 for the same-map interface; SchemeAndStackFoundations §0.28 for the infinitesimal ideal; CharacteristicClasses C5a/C6; SchemeKTheoryOperations §6.8 for actual Adams operations; §§6.0a–6.0b for calibration, conjugation/transfer and the infinitesimal classifying comparison.

## Downstream consumers

- **Polylogarithms.** §§2.3,3.7–3.8,4.4 consume §§2.1–2.3,5.2–5.4 and 6.2. The contract Polylogarithms declares against this roadmap, its borel-period-contract gap, is met by §2.3 (real isomorphism and injectivity after ⊗ℝ), §§5.3–5.4 (integral image lattice, zeta covolume and rational-basis determinant), §5.1 and `exists_pos_rat_dedekindZeta_of_isTotallyReal` (totally real even weight), and §3.4 using EndoscopicTransferAndUnitaryTraceComparison §6.2 (Tamagawa input). Its explicit factorial and Hurewicz calibration and π^(n−1) conversion stay there.
- **PeriodsAndSpecialValues.** The regulator, lattice and normalization theorems of §§2.1–2.3, 5.3–5.4 and 6.1–6.3 provide inputs to fundamental-line and mixed Tate applications.
- **HabiroNahmSeries.** §1.5 uses the embedding rational-image theorem indirectly through Polylogarithms; no Habiro-symbol or torsion assertion is a premise here.

The number-field contracts are §§2.1–2.3, 5.1–5.5 and 6.1–6.3, rather than a generic uncalibrated regulator structure. A polylogarithmic consumer converting each row by λₙπ^(n−1), with λₙ∈ℚˣ, obtains its determinant exponent from §5.4 by adding (n−1)dₙ. Constructing and calibrating those polylogarithmic rows belongs to that consumer. Neither the source of its symbols nor their every-family image assertion follows from the Borel lattice alone.

## References

All locators use the stated edition. Line locators identify the legal source extractions. Mathematical statements and proof routes above are paraphrases.

- **borel1974:** Armand Borel, *Stable real cohomology of arithmetic groups*, Ann. Sci. ENS 7 (1974), pp.235–272. [Numdam](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0/). Theorem 7.5, p.259, borel1974 line 934; §11.4, p.267, borel1974 line 1246; Proposition 12.2, p.271, borel1974 line 1377. These locate the arithmetic supplier’s comparison and rank input.
- **borel1977:** Armand Borel, *Cohomologie de SLₙ et valeurs de fonctions zêta aux points entiers*, Ann. Scuola Norm. Sup. Pisa 4 (1977), pp.613–636. [Numdam](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0/). §1.6, p.617, borel1977 line 153; Lemma 2.2, pp.617–618, borel1977 line 177; Proposition 2.4, pp.618–619, borel1977 line 213; §§3.3–3.5, borel1977 line 289–337; Proposition 4.3, borel1977 line 369; §§5.3–5.5, pp.627–630, borel1977 line 462–551; Theorem 6.2, pp.631–632, borel1977 line 571; Remark 6.3, p.632, borel1977 line 590; §6.4, pp.632–633, borel1977 line 595. The source’s m equals n−1 here; its matrix n is denoted a here. Intermediate rational forms and determinant phases use borel1980’s corrections.
- **borel1980:** Armand Borel, *Errata-Corrigé: Cohomologie de SLₙ et valeurs de fonctions zêta aux points entiers*, Ann. Scuola Norm. Sup. Pisa 7 (1980), p.373. [Numdam](https://www.numdam.org/item/ASNSP_1980_4_7_2_373_0/). Items 1–2 specify the ordered embedding determinant and replace the absolute discriminant in the rational forms; item 3 deletes the extra i-powers in §5.5(1),(4) and §6.2(5), borel1980 line 29–43.
- **burgos2002:** José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*, CRM Monograph 15 (2002). [Author copy](https://www.icmat.es/miembros/burgos/files/brbr.pdf). Remark 4.25, p.32, suspended formula at burgos2002 line 1426–1431; Corollary 9.8, p.78, burgos2002 line 3140; Definition 9.10 and Theorem 9.12, pp.79–80, burgos2002 line 3222 and 3256; Lemma 9.18/Definition 9.19/Remark 9.20, p.84, burgos2002 line 3546,3577,3607; Proposition 9.22/Corollary 9.23, p.85, burgos2002 line 3681,3689; Definition 9.24, p.86, burgos2002 line 3733; Examples 10.4–10.5, p.91, burgos2002 line 3973; Definitions 10.7–10.8, p.94, burgos2002 line 4087; Theorem 10.9, pp.95–97, burgos2002 line 4139. For its infinitesimal comparison read Chapter 8, Propositions 8.9,8.10,8.14 and the proof at burgos2002 line 4172–4190. The PDF page index is six greater than the printed page.
- **poonen2017:** Bjorn Poonen, *Rational Points on Varieties* (2017), unofficial author edition. [Author copy](https://math.mit.edu/~poonen/papers/Qpoints.pdf). Theorem 1.5.36(i), (iii)–(iv), p.26, poonen2017 line 1396–1446. The local cyclic extensions in that proof may vary; fixed unramified dyadic prescriptions are not asserted.
- **deligne_goncharov2005:** Pierre Deligne and Alexander B. Goncharov, *Groupes fondamentaux motiviques de Tate mixte*, Ann. Sci. ENS 38 (2005), pp.1–56. [Published open text](https://www.numdam.org/item/ASENS_2005_4_38_1_1_0/). Published §1.6, pp.7–9, equations (1.6.1)–(1.6.10), deligne_goncharov2005 lines 282–428; Adams consequence on p.9, deligne_goncharov2005 line 429–440. The published numbering differs from arXiv:math/0302267v2; these are the published locators.
- **weil1961:** André Weil, notes by Michel Demazure and Takashi Ono, *Adeles and Algebraic Groups* (1961), §3.3, Theorem 3.3.1, invoked at borel1977 line 227. This is a historical attribution through Borel; the numerical input is EndoscopicTransferAndUnitaryTraceComparison §6.2.
- **beilinson1985:** A. A. Beilinson, *Higher regulators and values of L-functions*, J. Soviet Math. 30 (1985), pp.2036–2070, §§1–2. [DOI](https://doi.org/10.1007/BF02105861). This is historical background; the universal construction and number-field factor-two theorem use burgos2002 §§10.1–10.4.
