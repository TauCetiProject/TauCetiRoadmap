# Roadmap: the local Langlands correspondence for G₂

**Summary.** This roadmap constructs the local Langlands correspondence for the split exceptional group G₂ over a nonarchimedean local field F of characteristic zero, by transporting parameters through the exceptional theta correspondences of G₂, the triality spin transfer of PGSp₆ to GL₈ and comparisons of G₂-, Spin₇- and SO₇-valued parameters, together with the weak local Langlands correspondence for PGSp₆ that the same spin transfer produces. The inputs are the three exceptional theta correspondences of G₂ with PD× (D a cubic division algebra), with PGL₃ ⋊ ⟨duality⟩ and with PGSp₆ (owned by ExceptionalThetaCorrespondencesForG2), Arthur's correspondence for Sp₆ and SO₈ and Xu's packets for PGSp₆ (ModularityAndLanglandsExtensions), the correspondence for GL_n and its inner forms (EndoscopicTransferAndUnitaryTraceComparison), the classical similitude theta correspondences (MetaplecticAutomorphicForms), and the Galois representations attached to regular algebraic automorphic representations. From these the roadmap builds: the comparison of G₂-, Spin₇- and SO₇-valued parameters (standard injectivity, spin detection, quadratic rigidity, Chenevier's G₂-descent, and the unacceptability of Spin₇ that forces weak parameter classes); globalization theorems with quaternion periods and with Whittaker models; the spin transfer from generic representations of PGSp₆ to GL₈ through triality; the parameter map L : Irr(G₂(F)) → Φ(G₂) and its characterizations by the theta diagrams and by G₂ × GL_r gamma factors; the packets over the discrete parameters coming from PGL₃ and their enhancements by S₃ and μ₃; the Kret–Shin parameters of generic discrete series of PGSp₆ and the exceptional spin identity; the identification of every other discrete fibre with a distinguished one of Xu's packets. The end theorems are the theorem of Gan–Savin (GS, Main Theorem, pp. 3–4): a natural surjective finite-to-one map L with the discrete, tempered and Langlands-quotient properties, the two theta diagrams, both characterizations, the spin diagram with generic tempered intermediate codomain, global–local compatibility and the enhanced fibres, with the possible exception at residue characteristic three on the discrete PGL₃ image; the generic supercuspidal correspondence of Harris–Khare–Thorne recovered by theta and triality, the partial enhanced correspondence for PGSp₆ on diamond orbits, and the weak correspondence L_w : Irr(PGSp₆(F)) → Φ_w(PGSp₆), surjective, compatible with temperedness, discreteness and quadratic twists, whose fibres are unions of Xu packets.

## Scope and ownership

This roadmap owns: the comparisons of parameters through the dual-group maps SL₃ → G₂ → Spin₇ → SO₇ and Spin₇ → GL₈ (Layer 0), including Griess's conjugacy theorem for G₂ (stated here as a target, since no roadmap states it), Chenevier's G₂-descent theorems and the weak equivalence of Spin₇-valued parameters; the globalization theorems for G₂ and PGSp₆ that GS proves for this application, and the Poincaré-series globalization with a cubic period on the automorphism group of a cubic division algebra that GF uses (Layer 1), with the totally definite octonion algebra over a number field, its quaternion subalgebras with prescribed localizations and the classification of octonion algebras by their norm forms that these use (§1.1, stated here, since no roadmap states them), and the classical global theta step for discrete heart representations (Layer 8); the parameters of all irreducible representations of Sp₆ and split SO₈, extended from Arthur's tempered correspondence by the Langlands classification (§2.0, stated here, since ModularityAndLanglandsExtensions §3.15 parametrizes tempered representations only), the triality descent over F and the spin transfer (Layer 2); the G₂ parameter map, its explicit description, the rank-seven standard lift, the G₂ × GL_r gamma factors and both characterizations (Layer 3); the A₂ packets (Layer 4); the Kret–Shin parameters and the exceptional spin identity (Layer 5); the diamond fibres (Layer 6); the assembly of the G₂ correspondence and its enhanced theta applications (Layer 7); the extended spin transfer and the weak PGSp₆ correspondence (Layers 9–10).

It does not own, and imports by section:

- The complex dual groups of G₂, PGL₃ and PGSp₆, the inclusions SL₃(ℂ) → G₂(ℂ) → Spin₇(ℂ), the restrictions v ∘ j ≅ 1 ⊕ Std₃ ⊕ Std₃∨ of the seven-dimensional module to SL₃(ℂ) and s ∘ i ≅ 1 ⊕ v of the spin module to G₂(ℂ), the centralizers μ₃ of SL₃ and S₃ of SO₃ in G₂(ℂ), the complex local L-parameters W_F × SL₂(ℂ) → Ĝ up to Ĝ-conjugacy with their transport along dual-group homomorphisms, and the raw and fixed-split component groups: ExceptionalThetaCorrespondencesForG2, Layer 0 (*Exceptional inclusions of complex dual groups*, *Complex local parameters*, *Raw and fixed-split component groups*).
- The three exceptional theta correspondences, Howe duality, the theta dichotomy Irr(G₂) = Irr♠ ⊔ Irr♥, the inclusion of the PGL₃-domain Irr♣ in Irr♥, the explicit lift tables, the discrete-series trichotomy, the supercuspidal spin-pole criterion of Savin–Weissman, the quaternion relative models and the global exceptional theta lift with its nonvanishing and cuspidality criteria: ExceptionalThetaCorrespondencesForG2, Layers 5–10. In particular the nonvanishing and cuspidality of the global exceptional theta lift of a period-distinguished cusp form (GS Corollary 10.6) is ExceptionalThetaCorrespondencesForG2, Layer 10 (*A quaternion period forces global nonvanishing*; *Cuspidality from Steinberg or regular compact weight*) and is not restated here.
- Arthur's local packets and multiplicity formula for Sp₆ and SO₈, Xu's packets and multiplicity formula for GSp₂ₙ, and the Gan–Takeda correspondence for GSp₄: ModularityAndLanglandsExtensions, Layer 3 (§§3.5, 3.8, 3.15, 3.17, 3.19, 3.25, 3.27). The generic transfer of globally generic cuspidal representations of Sp₂ₙ to GL₂ₙ₊₁: ModularityAndLanglandsExtensions, §5.1. The irreducibility, for a Dirichlet-density-one set of primes, of the Galois representations of extremely regular polarizable cuspidal representations of GL_n over CM fields, which discharges the irreducibility premise of the full coefficient-prime comparison of AutomorphicGaloisRepresentationsPartII, AG2.6: ModularityAndLanglandsExtensions, §2.43.
- The local Langlands correspondence for GL_n, its inner forms and the Jacquet–Langlands correspondence: EndoscopicTransferAndUnitaryTraceComparison, §§4.7a, 4.8 and Layer 10 (§§10.1, 10.26, 10.29, 10.30, 10.31).
- The similitude theta correspondences PGSp₆ × PGSO₈ and the PGSp₆ dichotomy between the two orthogonal towers, first occurrence, the Rallis inner product formula and the global nonvanishing criterion: MetaplecticAutomorphicForms, §§3.10, 3.34, 3.41, 3.42, 6.13, 6.14.
- Rankin–Selberg factors, isobaric sums and strong multiplicity one, boundary nonvanishing, the Jacquet–Shalika bound and unramified L-group factors: AutomorphicLFunctionsAndLocalFactors, Layers AL.3–AL.4; its archimedean factors of GL_n: AL.1.4 and AL.R.2. The Langlands–Shahidi spin factors of PGSp₆: AutomorphicLFunctionsAndLocalFactorsPartII, Layer 6, through the contract below, which extends the spin L-factor contract of ExceptionalThetaCorrespondencesForG2 on the same supplier; the globalization of a supercuspidal representation of GL_r: the same roadmap, §10.0.
- Normalized induction, Jacquet functors, Whittaker functionals, the tempered classification and the Langlands classification: SmoothRepresentationsOfLocalGroups, SR.2–SR.3. Weak containment, the Fell topology, the corrected isolated-summand theorem (GS Proposition 11.6 corrected), Heiermann–Opdam, the isolation of discrete series, of Steinberg and of supercuspidals, and the irreducibility and genericity criteria for unramified principal series of split adjoint groups: SmoothRepresentationsOfLocalGroupsPartII, SRU.1, SRU.3, SRU.4, SRU.5.4 and SRU.5.5.
- Automorphic forms, cusp forms and their Hilbert spaces: AutomorphicFormsOnReductiveGroups, Layers 0 and 4; the trace formula: AutomorphicSpectralTheory, Layer 6.
- Galois representations attached to regular algebraic polarized cuspidal representations of GL_n over totally real fields and their local–global compatibility at all places: AutomorphicGaloisRepresentationsPartII, Layers AG2.2, AG2.5, AG2.6.
- The Hasse–Minkowski theorem for isometry of quadratic forms over a number field: GlobalQuadraticForms, §6.3. The realization of a finite set of real and finite places of even cardinality as the nonsplit set of a quaternion algebra over a number field: GL2AutomorphicRepresentationsAndTransfer, R17.1.5.
- The pinned Chevalley–Demazure groups (Tau Ceti roadmap ReductiveGroups, Layer 9), the spin and half-spin representations, the fundamental representations of B₃ and D₄, Spin₆ ≅ SL₄ and triality for Spin₈ (RepresentationTheory/SpinRepresentations, Layers 4, 5, 6, 8), the restrictions of the vector and half-spin representations of Spin₈(ℂ) to the stabilizer Spin₇(ℂ) of a nonisotropic vector (RepresentationTheory/ClassicalGroups, §6.2, its consecutive Spin branching, and §6.7), the local invariant of the Brauer group, the local Weil group and the global Brauer sequence (ClassFieldTheory, Layers 5, 9 and 10), the equality of period and index of a Brauer class over a number field (BorelRegulators, §3.1), and the Chebotarev density theorem (Chebotarev, Layer 10).

The Kret–Shin GSpin-valued Galois representations, Shin's automorphic Plancherel density theorem, the Langlands–Shahidi spin factors of PGSp₆, the Poincaré-series weak-containment theorem, the real unitarity bound for regular discrete-series infinitesimal characters, the isolation and genericity of real discrete series far from the walls, relative isolation for generic discrete series, the generic local converse theorem for GL_n, the quadratic-twist rule of the classical similitude theta lifts of PGSp₆, the vanishing of the lift of the Steinberg representation of PGSp₆ to split PGO₆, the parameters of the lower-tower lifts, the induction principle for the PGSp₆–PGSO₈ lift, the complex-place theta matching, the archimedean nonvanishing of the similitude lift of generic representations to PGSO₈, the similitude Rallis inner product formula, the cuspidality of the global exceptional theta lift of a generic cusp form on split G₂ with a Steinberg place, the global exceptional theta lift between the automorphism group of a cubic central simple algebra and split G₂ and its nonvanishing and cuspidality on cusp forms with a cubic period, the real exceptional theta correspondences on parameters, the global Jacquet–Langlands correspondence for central simple algebras of degree three, the genericity of the global Arthur parameter of a cuspidal automorphic representation of Sp₂ₙ with a Steinberg component, the spinor-norm twist rule of Arthur's correspondence for SO₈, the square-integrability of the tempered packets of discrete parameters of Sp₂ₙ and split SO₂ₙ, the description of the tempered packets of their parameters through a Levi subgroup by parabolic induction, Mœglin's description of the supercuspidal support of their discrete series, the global genericity of the similitude theta lift of a globally generic cusp form from PGSp₆ to PGSO₈ and the global spin-pole converse are consumed from the suppliers named in the supplier contracts below, each stated there as what that supplier provides.

## Conventions

- F is a nonarchimedean local field of characteristic zero with residue field of order q and residue characteristic p; W_F is its Weil group (ClassFieldTheory, Layer 9), with the arithmetic normalization of local reciprocity (a uniformizer corresponds to an arithmetic Frobenius), and |w| = q^(−deg w) with arithmetic Frobenius of degree one, so that |·| on W_F corresponds to the absolute value of F. The correspondence rec of EndoscopicTransferAndUnitaryTraceComparison §10.1 is stated with the geometric reciprocity map and the character ω(w) = q^(deg w) with geometric Frobenius of degree −1, so ω = |·|⁻¹; a parameter stated there is read in this convention by the inversion transport of SmoothRepresentationsOfLocalGroups SR.5.2 (*classical-llc-normalization*): a character χ ∘ Art_geo⁻¹ becomes (χ ∘ Art_arith⁻¹)⁻¹, and a parameter its contragredient. Every composition of rec with a power of |·| in this roadmap (§§2.0, 3.2, 3.5, 3.6, 9.3) uses the character |·| fixed here, and every identity between factors of representations and factors of Weil–Deligne representations (§§2.4, 3.10, 3.12) is read with rec and the factors in one convention, that of EndoscopicTransferAndUnitaryTraceComparison §10.1, before the transport. ψ is a fixed nontrivial unitary additive character of F. Normalized induction and Jacquet functors use the positive square root of the modulus.
- WD_F = W_F × SL₂(ℂ). A parameter for a split group G is a homomorphism φ : WD_F → Ĝ(ℂ), continuous on W_F with semisimple Frobenius image and algebraic on SL₂(ℂ), taken up to Ĝ(ℂ)-conjugacy (ExceptionalThetaCorrespondencesForG2, Layer 0, *Complex local parameters*). A parameter class always means conjugacy by the named dual group; a GL_n-conjugacy class of a composite is never substituted for it. Φ(G) is the set of parameter classes. Bounded means bounded image of W_F; discrete means not contained in a proper Levi subgroup of Ĝ. Every comparison through the Weil–Deligne dictionary keeps the monodromy operator N.
- Dual-group maps: j : SL₃(ℂ) → G₂(ℂ), i : G₂(ℂ) → Spin₇(ℂ), q : Spin₇(ℂ) → SO₇(ℂ), the vector representation v = q ∘ i of dimension 7, the spin representation s : Spin₇(ℂ) → GL₈(ℂ), the inclusion h : Spin₆(ℂ) = SL₄(ℂ) → Spin₇(ℂ). The kernels are ker j = ker i = ker v = 1 and ker q = μ₂ = Z(Spin₇(ℂ)); s(−1) = −1 on all eight coordinates and q(−1) = 1.
- Component groups: S_φ = π₀ Z_(G₂(ℂ))(φ) for G₂ (the centre of G₂(ℂ) is trivial, so raw and fixed-split groups agree). For PGSp₆ the enhancements of the split form are characters of S_φ̃ / image Z(Spin₇) = S_φ̃ / image μ₂ (ExceptionalThetaCorrespondencesForG2, Layer 0, *Raw and fixed-split component groups*).
- The G₂ loci: Irr♠(G₂) lifts to PD×, Irr♥(G₂) lifts to PGSp₆, Irr♣ ⊂ Irr♥ lifts also to PGL₃ ⋊ ⟨duality⟩, and Irr♦ = Irr♥ ∖ Irr♣. On parameters, Φ♦_ds(G₂) is the set of discrete parameters not in j(Φ(PGL₃)); these are the diamond discrete parameters. For PGSp₆ in Layers 8–10 the same symbols name the classical loci of MetaplecticAutomorphicForms §3.42: Irr♥(PGSp₆) lifts to split PGSO₈, Irr♠(PGSp₆) lifts to the quaternionic tower PGO₅,₁, and Irr♣ consists of the representations already occurring at PGO₆ ≅ PGL₄ ⋊ ⟨±1⟩. The two families of symbols are different partitions of different sets.
- Quadratic twists: a quadratic character χ of F× twists a representation σ of PGSp₆(F) by χ ∘ sim, the similitude being read modulo squares; on parameters it multiplies a Spin₇-valued φ by the central character χ : W_F → μ₂ = Z(Spin₇(ℂ)). A homogeneous set for the quadratic characters may have nontrivial stabilizers.
- A Whittaker datum is fixed for each quasi-split group; for tempered parameters the trivial character labels the generic member.
- The parameter of an irreducible representation of Sp₆(F) or of split SO₈(F), also called its Arthur parameter (as in "the Arthur parameter of the restriction of θ(π) to Sp₆(F)"), is the parameter of §2.0: Arthur's parameter (ModularityAndLanglandsExtensions §3.15) on tempered representations, extended to all irreducible representations by the Langlands classification. Arthur's standard transfer of such a representation to GL₇(F), respectively GL₈(F), is the representation whose parameter is the composite with the standard representation.
- Cubic division algebras: inv : H¹(F, PGL₃) ≅ (1/3)ℤ/ℤ is the Brauer invariant of ClassFieldTheory, Layer 5; D₁ and D₂ have invariants 1/3 and 2/3.
- Global fields are number fields k; totally real fields are used wherever Galois representations or automorphic forms on the automorphism group of a definite octonion algebra appear. An octonion algebra O over k is totally definite when its norm form is definite at every real place; it exists, is unique up to isomorphism and is split at every finite place (§1.1).

## Exact supplier contracts

### From Mathlib

- `spinGroup` (`Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`): for a quadratic form Q, the even elements of the Lipschitz group (`lipschitzGroup`, generated by the invertible vectors) with x · star x = 1, with its `Group` instance. With Q = `QuadraticMap.weightedSumSquares` ℂ (1, …, 1) on ℂ⁷ it is Spin₇(ℂ). It carries no topological structure; the map q to SO₇ and the spin representation s are the Tau Ceti declarations below.
- `IsConj` for element conjugacy in a monoid.
- `Quaternion` (`Mathlib/Algebra/Quaternion.lean`, notation `ℍ[R]`): the Hamilton quaternions `QuaternionAlgebra R (-1) 0 (-1)`, whose Cayley–Dickson double over a number field k is the totally definite octonion algebra of §1.1.
- `Representation.IsSemisimpleRepresentation` (`Mathlib/RepresentationTheory/Semisimple.lean`): a representation whose lattice of subrepresentations is complemented, that is, a completely reducible one; with `Subgroup`, `LinearEquiv` and `Representation` it states §0.0 on the octonions.
- `Matrix.diagonal`, `Matrix.charpoly`, `Matrix.charpoly_diagonal`, `Matrix.det_diagonal`, `Matrix.charpoly_monic` and `Matrix.charpoly_natDegree_eq_dim` for the torus computations of §0.1, which are Checks, not definitions.

### From Tau Ceti

- `TauCeti.Octonion` (`TauCeti/Algebra/Octonion/Basic.lean`): the split Zorn octonions over a commutative ring, with `TauCeti.Octonion.norm_mul`, `TauCeti.Octonion.normQuadraticForm` and the trace-zero submodule `TauCeti.Octonion.imaginary` of rank seven (`TauCeti.Octonion.finrank_imaginary`), the trace `TauCeti.Octonion.trace` and conjugation `TauCeti.Octonion.conj` with `TauCeti.Octonion.conj_mul`. Over ℂ it carries `octonionAut` and `octonionRep` of §0.0; the identification of its automorphism group with G₂ is ExceptionalThetaCorrespondencesForG2, §0.1.
- `TauCeti.CayleyDickson` (`TauCeti/Algebra/CayleyDickson/Basic.lean`): the Cayley–Dickson double of a ring with involution, with product ⟨a, b⟩⟨c, d⟩ = ⟨ac − d̄b, da + bc̄⟩; on Mathlib's Hamilton quaternions `Quaternion` its norm `TauCeti.CayleyDickson.normSq` (`TauCeti/Algebra/CayleyDickson/Quaternion.lean`) is multiplicative and is the sum of the quaternion norms of the two components (`TauCeti.CayleyDickson.normSq_def`), and `TauCeti.DivisionOctonionReal` is the real division octonions. §1.1 uses the double of ℍ[k] as the totally definite octonion algebra over a number field k and the double of a quaternion algebra D to embed D.
- `QuadraticForm.not_anisotropic_atFinitePlace_of_five_le_finrank` (`TauCeti/NumberTheory/QuadraticForm/Global/AnisotropicPlaces.lean`): a quadratic form of rank at least five over a number field is isotropic at every finite place. `QuadraticMap.IsometryEquiv.exists_extension` (`TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean`): Witt's extension theorem over a field in which 2 is invertible. `TauCeti.BrauerGroup.natCard_twoTorsion` (`TauCeti/NumberTheory/ClassFieldTheory/Brauer/CentralSimple/Invariant.lean`): over a nonarchimedean local field the Brauer classes of order dividing two form a group of order two. All three are used in §1.1.
- `TauCeti.ClassFieldTheory.WeilGroup` (`TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Basic.lean`): the local Weil group W_K of a nonarchimedean local field K as a type, with its `Group` instance and the arithmetic degree `TauCeti.ClassFieldTheory.weilDegree`; `TauCeti.ClassFieldTheory.instTopologicalSpaceWeilGroup` (`TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Topology.lean`) is the Weil topology, the group topology in which the inertia subgroup with its profinite topology is open. §0.8 states the local unacceptability of Spin₇ on it.
- `CliffordAlgebra.spinToSpecialOrthogonal` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpecialOrthogonal.lean`): for a quadratic form Q over a commutative ring in which 2 is invertible, the vector action `spinGroup` Q → SO(Q); on `spinGroup sumSquaresSeven` it is q : Spin₇(ℂ) → SO₇(ℂ). `CliffordAlgebra.spinDoubleCover` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/DoubleCover.lean`): for a nondegenerate Q on a nonzero finite-dimensional space over a separably closed field in which 2 is invertible, the extension 1 → ℤ/2 → Spin(Q) → SO(Q) → 1, so that q is surjective with kernel {±1} = Z(Spin₇(ℂ)). `QuadraticMap.IsometryEquiv.spinGroupEquiv` (`TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Map.lean`): the isomorphism of spin groups induced by an isometry of quadratic forms. `TauCeti.spinRep` (`TauCeti/RepresentationTheory/Spin/Representation.lean`): the representation of `spinGroup` Q on the exterior algebra of the first isotropic summand W of a polarization `TauCeti.SpinPolarizationData` Q; for Q of rank seven over ℂ the summand W has rank three, and this is the eight-dimensional spin representation s. None of these relates `spinGroup` to `TauCeti.Octonion`: the inclusion i : G₂(ℂ) → Spin₇(ℂ) is ExceptionalThetaCorrespondencesForG2, §0.6.
- `TauCeti.D4Tripled.trialityAutomorphism` (`TauCeti/Algebra/Lie/D4/Tripled/Triality/Basic.lean`): an automorphism of the integral tripled D₄ group scheme with `TauCeti.D4Tripled.trialityAutomorphism_pow_three` and its action on root subgroups. §2.1 compares it with the split simply connected D₄ over F and descends it to the three central quotients.

### From TauCetiRoadmap.ExceptionalThetaCorrespondencesForG2

- Layer 0: the octonion model of G₂ (§0.1: octonion automorphisms of `TauCeti.Octonion` preserve the trace, the norm and the imaginary part, and over ℂ they form G₂(ℂ) with v on the imaginary octonions); the dual-group inclusions SL₃(ℂ) → G₂(ℂ) → Spin₇(ℂ), injective and algebraic, with the restriction 1 ⊕ Std₃ ⊕ Std₃∨ of the seven-dimensional module to SL₃(ℂ), the restriction 1 ⊕ v of the spin eight-dimensional module to G₂(ℂ), and the centralizers (§0.6, *Exceptional inclusions of complex dual groups*); complex local parameters and their transport along an algebraic dual-group homomorphism, which keeps finite inertia image, Frobenius semisimplicity, boundedness and the monodromy operator (§0.7, *Complex local parameters*); raw and fixed-split component groups (§0.8), as in Conventions.
- Layers 5–8: Howe duality for PD× × G₂, (PGL₃ ⋊ ⟨duality⟩) × G₂ and G₂ × PGSp₆; the dichotomy Irr(G₂) = Irr♠ ⊔ Irr♥ and Irr♣ ⊂ Irr♥ (*The exceptional theta dichotomy*, *Howe duality for all three exceptional pairs*); the explicit nontempered and tempered lift tables (*Explicit nontempered lifts*, *The E₆-to-E₇ tempered Siegel table*, *The remaining tempered non-supercuspidal lifts*, *The split-E₆ lift table*); division nonvanishing for p ≠ 3 and the opposite-algebra compatibility (Layer 5); the PGL₃ outer-extension labels τ± (Layer 5, *PGL₃ outer extensions and their signs*); the discrete-series trichotomy and genericity transfer (Layer 8); the supercuspidal spin-pole criterion (Layer 8); the generic depth-zero supercuspidals with supercuspidal PGSp₆ lifts (Layer 8, *A generic depth-zero lift example*).
- Layer 9: quaternion pointwise stabilizers G_D, the relative quotient and embedding theorems, the Steinberg relative summand and the SU₂-periods of compact real G₂.
- Layer 10: the global exceptional dual pair, the global theta lift with its local occurrence property, nonvanishing from a quaternion period, cuspidality from a Steinberg place or a regular real weight, generic global nonvanishing, and real infinitesimal-character matching.
- What ExceptionalThetaCorrespondencesForG2 must provide (gap:spin-pole-global-converse): for every totally real number field k, a cuspidal automorphic representation of PGSp₆(𝔸_k) whose partial spin L-function has a pole at s = 1 has nonzero global exceptional theta lift to Aut(O) for some octonion algebra O over k, compatibly with the local theta correspondences at every place (GS20 Theorem 1.1 states this only for k = ℚ).
- What ExceptionalThetaCorrespondencesForG2 must provide (gap:split-steinberg-theta-cuspidality): for split G₂ over a number field k and a globally generic cuspidal automorphic representation Π of G₂(𝔸_k) whose component at some finite place is the Steinberg representation, the global exceptional theta lift of Π to PGSp₆ (§10.3, nonzero by §10.6) is cuspidal. This is the split-form counterpart of the Steinberg alternative of §10.5, which is stated for a totally definite O; §10.6 gives cuspidality only from a finite place with a supercuspidal component whose local lift is supercuspidal (GS, §3.4, p. 12, uses the split form for Main Theorem (viii)).
- What ExceptionalThetaCorrespondencesForG2 must provide (gap:cubic-jordan-global-theta): for a totally real number field k, a central simple k-algebra D of degree three, H = Aut(D) the automorphism group of D as a Jordan algebra and split G₂, the global theta lift in both directions for the dual pair H × G₂ in the group of type E₆ attached to D, with every irreducible automorphic constituent of a nonzero lift having at each finite place v a local component in the local correspondence of Layer 5 (§5.1 where D_v is a division algebra, §5.9 where it is split) (GF, §2.7(b), p. 7); used in §3.11, alternative (ii)(b).
- What ExceptionalThetaCorrespondencesForG2 must provide (gap:cubic-period-global-theta): for a totally real number field k, a central division algebra D of degree three over k, H = Aut(D), a cubic subfield e ⊂ D with pointwise stabilizer H_e and a cuspidal representation Ξ of H(𝔸_k), spherical at every real place, with nonzero H_e-period, the global lift Θ(Ξ) of Ξ to split G₂ (the lift of the cubic-jordan-global-theta contract) is nonzero (through its Fourier coefficient along the Heisenberg parabolic attached to e), Θ(Ξ) is cuspidal when the local lift θ(Ξ_v) at some finite place v is supercuspidal, it is then irreducible with Θ(Ξ)_v ≅ θ(Ξ_v) at every finite place, and its global lift back to H is nonzero (GF, Lemma 2.5 and proof, pp. 8–9); used in the uniqueness part of §3.11.
- What ExceptionalThetaCorrespondencesForG2 must provide (gap:real-exceptional-theta-parameters): at a real place, (a) for the dual pair formed by the compact real form of G₂ and PGSp₆(ℝ) in the real E₇ of Layer 10, the local theta lift of the irreducible representation of highest weight λ is nonzero, irreducible and a holomorphic discrete series whose packet under ModularityAndLanglandsExtensions §3.15 (at F = ℝ, restricted to Sp₆(ℝ)) has standard parameter `sgn ⊕ ⨁_α Ind_(ℂ×)^(W_ℝ)((z/z̄)^⟨λ+ρ, α∨⟩)`, α over the three long positive roots of G₂; (b) for split G₂(ℝ) and the pairs G₂ × PGSp₆ in split E₇ and (PGL₃ ⋊ ℤ/2) × G₂ in split E₆, the big theta lift of an irreducible spherical representation has a unique irreducible quotient, which is spherical, and the spherical representation with exponent (χ₁, χ₂, χ₃) corresponds to the spherical representation of PGSp₆(ℝ) whose standard parameter is `1 ⊕ ⨁_i χ_i^(±1)`, respectively to an extension to PGL₃(ℝ) ⋊ ℤ/2 of the spherical representation of PGL₃(ℝ) with parameter χ₁ ⊕ χ₂ ⊕ χ₃; and every irreducible constituent of a nonzero global lift has these local components at the real places where the input is as in (a) or (b). Layer 10, §10.7, matches infinitesimal characters only (GF, §2.7, pp. 6–7, uses (a) and (b)).

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

- §3.8 discrete global Arthur parameters and their component groups; §3.15 Arthur's local packets and the local correspondence for quasi-split classical groups (used for Sp₆ and split SO₈, with even-orthogonal outer orbits); §3.17 Arthur's multiplicity formula; §3.25 the members of a generic L-packet of a quasi-split classical group, bounded or not, are irreducible standard modules (used for Sp₆ at unbounded localizations of generic global parameters); §3.19 Xu's packets for GSp₂ₙ (used at n = 3 with trivial central character, that is PGSp₆), with their twist group, boundary map, restriction to Sp₆ and the equality of self-twist stabilizers; §3.27 Xu's multiplicity formula for generic global parameters of GSp₂ₙ; §3.5 the Gan–Takeda correspondence for GSp₄ (for the Klingen Levi subgroup of PGSp₆, the image of GL₁ × GSp₄, isomorphic to GSp₄ by (a, g) ↦ a⁻¹g). The supplier states these under its trace-formula inputs; every theorem here that uses them carries the same hypotheses.
- §5.1: the generic transfer of Cogdell–Kim–Piatetski-Shapiro–Shahidi: a globally generic cuspidal representation of split Sp₂ₙ over a number field transfers to an isobaric sum of distinct unitary self-dual cuspidal representations of general linear groups (used at n = 3 in §2.3).
- What ModularityAndLanglandsExtensions must provide (gap:so8-spinor-norm-twist): for split SO₈ over F and a quadratic character χ of F×, viewed as a homomorphism W_F → μ₂ = Z(SO₈(ℂ)), the packet of Arthur's correspondence (§3.15 on tempered packets, extended to all parameters by the Langlands classification as in §2.0) attached to χ · φ is the twist by χ ∘ SN of the packet attached to φ, SN being the spinor norm; used in §§2.5 and 10.3.
- What ModularityAndLanglandsExtensions must provide (gap:classical-discrete-packets): for G = Sp₂ₙ with n ≥ 1 or split SO₂ₙ with n ≥ 2 over F and a bounded parameter φ of G, the members of the tempered packet of φ (§3.15(c)) are square-integrable exactly when φ is discrete, that is, when its composite with the standard representation of the dual group is a sum of pairwise non-isomorphic irreducible orthogonal representations of WD_F (GS, §3.4, p. 12, uses it for the discrete-series diagram); used in §§3.7, 5.1, 5.2, 6.1, 8.2 and 10.2.
- What ModularityAndLanglandsExtensions must provide (gap:classical-packets-parabolic-induction): for G = Sp₂ₙ or split SO₂ₙ over F, a standard Levi subgroup M ≅ GL_(n₁) × ⋯ × GL_(n_r) × G₀ (G₀ of the same type and smaller rank, possibly trivial), bounded parameters φ_i of GL_(n_i) and a bounded parameter φ₀ of G₀, the tempered packet of the parameter ⨁_i (φ_i ⊕ φ_i∨) ⊕ φ₀ of G is the set of irreducible constituents of the normalized inductions, from the standard parabolic subgroup with Levi subgroup M, of rec⁻¹(φ₁) ⊗ ⋯ ⊗ rec⁻¹(φ_r) ⊗ τ₀, τ₀ running over the tempered packet of φ₀ (for SO₂ₙ, up to the even-orthogonal outer automorphism) (GS, §3.3, p. 11, and proof of Theorem 12.3, second bullet, p. 36, read the parameters of constituents of induced representations from the Levi subgroups); used in §§3.1, 3.4, 3.6, 5.5, 9.3 and 10.8.
- What ModularityAndLanglandsExtensions must provide (gap:classical-packets-cuspidal-support): for G = Sp₂ₙ with n ≥ 1 or split SO₂ₙ with n ≥ 2 over F and a discrete parameter φ = ⨁_i ρ_i ⊠ S_(a_i) of G, ρ_i an irreducible representation of W_F and S_a the a-dimensional irreducible representation of SL₂(ℂ): (a) if every a_i = 1, every member of the packet of φ is supercuspidal; (b) if a member of the packet of φ is a subquotient of the normalized induction of a supercuspidal representation τ₁ ⊗ ⋯ ⊗ τ_r ⊗ τ₀ of a standard Levi subgroup GL_(d₁) × ⋯ × GL_(d_r) × G₀, then ⨁_j (rec(τ_j) ⊕ rec(τ_j)∨) ⊕ λ₀ ≅ ⨁_i ⨁_(0 ≤ k < a_i) ρ_i |·|^((a_i − 1)/2 − k) as representations of W_F, where λ₀ is the restriction of the parameter of τ₀ along w ↦ (w, diag(|w|^(1/2), |w|^(−1/2))) and the right side is the restriction of φ along the same map (Mœglin's description of the supercuspidal support of discrete series; GS, proof of Proposition 6.1, pp. 21–22, uses (a) for Sp₆ and (b) for its non-supercuspidal generic discrete series); used in §§2.0, 3.1 and 6.1 and in the Steinberg Checks and Examples of §§2.3–2.5, 5.1 and 8.1.
- What ModularityAndLanglandsExtensions must provide (gap:symplectic-steinberg-generic-parameter): for n ≥ 1, a number field k and a cuspidal automorphic representation σ of Sp₂ₙ(𝔸_k) whose component at some finite place v is the Steinberg representation, the discrete global Arthur parameter of σ (§§3.8, 3.17) is a single unitary self-dual cuspidal representation μ of GL₂ₙ₊₁(𝔸_k) with b = 1, μ_v being the Steinberg representation of GL₂ₙ₊₁(k_v); in particular it is generic and its global component group is trivial (MagaardSavin, Proposition 8.2 and proof, arXiv p. 10, stated over ℚ by an argument that uses only Arthur's local and global classification, so that it applies over every number field; KS, Lemma 2.1 and Corollary 2.2, PDF p. 16; GS, proof of Lemma 12.4, p. 37, uses it at n = 3; used in §§1.7, 2.3, 3.1, 3.11, 6.4, 8.1 and 10.6, each time for an irreducible constituent of the restriction to Sp₆(𝔸_k) of a cuspidal representation of PGSp₆(𝔸_k), which is cuspidal because every unipotent radical of a parabolic subgroup of PGSp₆ is the isomorphic image of one of Sp₆).
- §2.43: for a CM field F and an extremely regular polarizable regular algebraic cuspidal representation π of GL_n(𝔸_F), the ℓ-adic Galois representation of π is irreducible for every ℓ in a set of primes of Dirichlet density one and every isomorphism ℚ̄_ℓ ≅ ℂ; a set of density one is nonempty, so this proves, for every n ≥ 2, the universal proposition ExtremelyRegularIrreducibility n that AG2.6 assumes for its full polarized coefficient-prime comparison and its totally real descent (used at n = 7 in §3.15).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

- §§10.1, 10.26, 10.30: the local Langlands correspondence rec for GL_n(F) with its normalization, compatibility with normalized induction, contragredients, determinants, twists and Rankin–Selberg gamma factors, and the Weil–Deligne parameter with N; §10.29 the factors of every irreducible representation of GL_n(F) as the products over its Langlands data, and those of a segment as the products over its supercuspidal support, so that a Rankin–Selberg gamma factor depends only on the cuspidal supports; §10.31 the inner-form parameter; §4.7a the Jacquet–Langlands correspondence for essentially square-integrable representations of inner forms of GL_n (used for GL₁(D) with D of degree three and GL₂(D) with D quaternion, with the reduced-norm twist rule); §1.13 the Kottwitz sign of an inner form.
- What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:cubic-global-jacquet-langlands): for a central division algebra D of degree three over a number field k, every irreducible automorphic representation Π′ of D×(𝔸_k) in the discrete spectrum has a transfer JL(Π′), an automorphic representation of GL₃(𝔸_k) in the discrete spectrum, with JL(Π′)_v ≅ Π′_v at the places v where D splits; if Π′ is infinite-dimensional, JL(Π′) is cuspidal and JL(Π′)_v is the Jacquet–Langlands transfer of §4.7a of Π′_v at the places v where D ramifies; if Π′ = χ ∘ Nrd for a Hecke character χ, then JL(Π′) = χ ∘ det, whose component χ_v ∘ det at a ramified place v is not the transfer χ_v ⊗ St₃ of Π′_v but has its cuspidal support χ_v|·|, χ_v, χ_v|·|⁻¹; so the standard L-function of JL(Π′) is that of a cuspidal representation of GL₃ or L(s + 1, χ) L(s, χ) L(s − 1, χ), and the Rankin–Selberg functional equation of AutomorphicLFunctionsAndLocalFactors AL.3.6.2 applies to JL(Π′) × T, summand by summand, for every cuspidal T of GL_r(𝔸_k) (GF, §2.7(b), p. 7, uses it for D× and PD×).
- What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:gln-generic-local-converse): for generic irreducible representations π, π′ of GL_n(F), equality γ(s, π × τ, ψ) = γ(s, π′ × τ, ψ) for every irreducible τ of GL_r(F) and every r ≤ n implies π ≅ π′; equivalently, a bounded Weil–Deligne representation of dimension n is determined, with its monodromy, by the gamma factors of its twists.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

- §3.10 first occurrence in a Witt tower; §3.34 the similitude theta correspondence and its Howe duality; §3.41 the PGSp₆–PGSO₈ similitude lift of generic σ, nonzero, with standard parameter φ_b ⊕ 1 and its unramified Satake comparison through Spin₇ → Spin₈; §3.42 the PGSp₆ dichotomy between the two orthogonal towers; §6.13 the Rallis inner product formula; §6.14 the global theta nonvanishing criterion.
- What MetaplecticAutomorphicForms must provide (gap:pgsp6-similitude-twist-rule): for H one of split PGSO₈, split PGO₆ and PGO₅,₁ over F, every σ ∈ Irr(PGSp₆(F)) and every quadratic character χ of F×, the similitude theta lift of §3.34 satisfies θ_H(σ ⊗ χ ∘ sim) ≅ θ_H(σ) ⊗ χ ∘ sim_H, sim_H the similitude character of H; under PGSO₆ ≅ PGL₄ and PGSO₅,₁ ≅ PGL₂(D), D the quaternion division algebra over F, the character χ ∘ sim_H restricts to χ ∘ det, respectively χ ∘ Nrd (GS, proof of Theorem 12.6, pp. 38–39); used in §§2.5, 10.3 and 10.4. The pullback of χ ∘ sim along the triality maps is §2.1 of this roadmap.
- What MetaplecticAutomorphicForms must provide (gap:pgsp6-steinberg-pgo6-vanishing): the similitude theta lift of the Steinberg representation of PGSp₆(F) to split PGO₆(F) is zero (GS, proof of Lemma 12.5, p. 37); used in §§2.3 and 8.1.
- What MetaplecticAutomorphicForms must provide (gap:pgsp6-lower-tower-parameters): let σ ∈ Irr(PGSp₆(F)) have nonzero similitude theta lift τ to split PGO₆(F) or to PGO₅,₁(F) (§§3.34, 3.42), and let φ_τ : WD_F → SL₄(ℂ) be the parameter of an irreducible constituent of the restriction of τ to PGSO₆(F) ≅ PGL₄(F) (EndoscopicTransferAndUnitaryTraceComparison §10.30), respectively to PGSO₅,₁(F) ≅ PGL₂(D) through the inner-form parameter (EndoscopicTransferAndUnitaryTraceComparison §10.31), determined up to φ_τ ↔ φ_τ∨. Then (a) every irreducible constituent of the restriction of σ to Sp₆(F) has parameter (§2.0) 1 ⊕ Λ²φ_τ; (b) when τ is a representation of split PGO₆(F), the lift of σ to split PGSO₈(F) is nonzero and is an irreducible subquotient of the normalized induction of 1 ⊗ τ′, τ′ a constituent of the restriction of τ to PGSO₆(F), from the parabolic subgroup of PGSO₈ whose Levi subgroup is the image of GL₁ × GSO₆, namely one whose Langlands data have the positive exponents of τ′ (Kudla's persistence principle, the step from PGO₆ to PGSO₈ having exponent zero) (GS, §§12.2–12.3 and proof of Theorem 12.3, first bullet, pp. 34–36); used in §§9.1, 9.2, 10.4 and 10.7.
- What MetaplecticAutomorphicForms must provide (gap:pgsp6-pgso8-induction-principle): let P = MN be a proper standard parabolic subgroup of PGSp₆ with M the image of GL_(n₁) × ⋯ × GL_(n_r) × GSp_(2n₀) (n₁ + ⋯ + n_r + n₀ = 3, GSp₀ = GL₁ through the similitude), P′ = M′N′ the standard parabolic subgroup of split PGSO₈ with M′ the image of GL_(n₁) × ⋯ × GL_(n_r) × GSO_(2n₀+2) (GSO₂ the split two-dimensional torus), and τ_M = τ₁ ⊗ ⋯ ⊗ τ_r ⊗ τ₀ irreducible. Let σ ∈ Irr♥(PGSp₆(F)) be either the Langlands quotient of the normalized induction of τ_M, with τ_M essentially tempered and its exponents in the positive chamber, or an irreducible constituent of it, with τ_M a discrete series. Then τ₀ has nonzero similitude theta lift θ(τ₀) to split GSO_(2n₀+2)(F) (§3.34; for n₀ = 0 the character τ₀ ∘ sim of the torus), and the lift of σ to split PGSO₈(F) is the Langlands quotient, respectively an irreducible constituent, of the normalized induction from P′ of τ₁ ⊗ ⋯ ⊗ τ_r ⊗ θ(τ₀) (GS, proof of Theorem 12.3, second bullet, p. 36, where the lift of a non-discrete heart representation is read from the correspondences for the Levi subgroups); used in §§5.5 and 9.3.
- What MetaplecticAutomorphicForms must provide (gap:pgsp6-pgso8-archimedean-generic-theta): at a real or complex place v of a number field, the similitude theta lift to split PGSO₈(k_v) of every generic irreducible Casselman–Wallach representation of PGSp₆(k_v) is nonzero (the archimedean case of §3.41; GS, proof of Lemma 12.5, p. 37, uses it at every place).
- What MetaplecticAutomorphicForms must provide (gap:pgsp6-pgso8-complex-theta): for the pair PGSp₆(ℂ) × PGSO₈(ℂ) at a complex place (where the similitude and isometry correspondences coincide, since PGSp₆(ℂ) = Sp₆(ℂ)/μ₂), the theta correspondence described on Langlands parameters (Adams–Barbasch): the lift of a generic σ whose Langlands parameter is φ_σ : W_ℂ → Spin₇(ℂ) has the Spin₈(ℂ)-valued parameter ι ∘ φ_σ (ι as in §0.1), so that every irreducible constituent of its pullback along f₂ has the SO₈(ℂ)-valued parameter s ∘ φ_σ (GS, proof of Proposition 4.1(i), p. 19; §3.34); used in §§2.3 and 2.4.
- What MetaplecticAutomorphicForms must provide (gap:pgsp6-pgso8-global-generic-theta): for a number field k, a nondegenerate character ψ of the unipotent radical of a Borel subgroup of PGSp₆ over 𝔸_k trivial on its k-points, and a cuspidal automorphic representation Σ of PGSp₆(𝔸_k) with nonzero ψ-Whittaker coefficient, the global similitude theta lift of Σ to split PGSO₈ has a nonzero Whittaker coefficient for a nondegenerate character of the unipotent radical of a Borel subgroup of PGSO₈; in particular it is nonzero (GS, §4.3, p. 17, and proof of Proposition 4.1(i), p. 18); used in §2.3.
- What MetaplecticAutomorphicForms must provide (gap:pgsp6-similitude-rallis): for a cuspidal representation Σ of PGSp₆(𝔸_k) with generic global Arthur parameter whose local similitude theta lifts to split PGSO₈ are nonzero at every place, the global similitude lift to PGSO₈ is nonzero when L^S(s, Σ, std) is nonzero at s = 1, and it is cuspidal when the lift to PGO₆ vanishes (the similitude form of §§6.13–6.14 in the second-term range).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

- Layer AL.3: the local Rankin–Selberg factors and functional equation, the induced-factor product, the global functional equation (AL.3.6.2), the pole criterion, boundary nonvanishing, strong multiplicity one and its isobaric form, and the Jacquet–Shalika bound (AL.3.3.8: the unitary-normalized Satake roots α of an irreducible unitary generic unramified representation of GL_n(F) satisfy `q^(−1/2) < |α| < q^(1/2)`, hence so do those of a unitary cuspidal representation at its unramified places). AL.1.4 and AL.R.2: the archimedean factors of GL_n(ℝ) and GL_n(ℂ) through their Weil-group parameters. Layer AL.4: the unramified L-group factor and functorial operations on unramified factors.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactorsPartII

- Layer 6 (generalized local factors): the local-factor layer that ExceptionalThetaCorrespondencesForG2 extends by its spin L-factor contract ramified-spin-factor (the degree-eight L(s, σ, spin) of generic σ of PGSp₆(F) from the Heisenberg parabolic of split F₄, with the supercuspidal pole criterion).
- §10.0 (globalization): for a number field k, a finite place v₀ and a unitary supercuspidal representation σ of GL_l(k_v₀), a unitary cuspidal representation of GL_l(𝔸_k) with component σ at v₀; and its first statement, that every irreducible automorphic representation of a split connected reductive group over a number field is an irreducible subquotient of a normalized induction from a cuspidal representation of a standard Levi subgroup (used for PGL₃); both used in §3.11.
- What AutomorphicLFunctionsAndLocalFactorsPartII must provide (gap:pgsp6-shahidi-spin-factor): extending the contract ramified-spin-factor of ExceptionalThetaCorrespondencesForG2 (the same Langlands–Shahidi construction from the Heisenberg parabolic of split F₄ with Levi GSp₆), the gamma and epsilon factors γ(s, σ, spin, ψ) and ε(s, σ, spin, ψ) of generic irreducible representations σ of PGSp₆(F) for the eight-dimensional spin representation of Spin₇(ℂ), the unramified normalization (for σ an irreducible unramified principal series, γ(s, σ, spin, ψ) is the product of the Tate gamma factors γ(s, μ, ψ) of the eight characters μ of F× obtained by composing the Satake parameter of σ with the weights of the spin representation), the rule γ(s, σ ⊗ χ ∘ sim, spin, ψ) = γ(s, σ, spin ⊗ χ, ψ) for quadratic χ, the change-of-character rule γ(s, σ, spin, ψ_a) = |a|^(8(s−1/2)) γ(s, σ, spin, ψ) for a ∈ F× and ψ_a(x) = ψ(ax), holomorphy of L(s, σ, spin) in Re s > 0 for tempered σ, and the global functional equation L^S(s, Σ, spin) = ∏_(v∈S) γ(s, Σ_v, spin, Ψ_v) · L^S(1 − s, Σ∨, spin) for a globally generic cuspidal representation Σ of PGSp₆(𝔸_k) over a number field k, a nontrivial character Ψ of k \ 𝔸_k and a finite set S of places containing the archimedean ones and those where Σ or Ψ is ramified, in which the factor at an archimedean place v is the gamma factor γ(s, s ∘ φ_v, Ψ_v) of the eight-dimensional representation s ∘ φ_v of W_(k_v), φ_v : W_(k_v) → Spin₇(ℂ) being the Langlands parameter of Σ_v (AutomorphicLFunctionsAndLocalFactors, AL.1.4 and AL.R.2); used in §§2.4 and 6.1.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups and SmoothRepresentationsOfLocalGroupsPartII

- SR.2.1–SR.2.3 induction, Jacquet functors and Whittaker functionals; SR.3.1 cuspidal support; SR.3.3 the tempered classification and the Langlands classification. SRU.1.1 weak containment; SRU.1.7–SRU.1.10 the Fell topology, Fell closure of sums, the corrected form of GS Proposition 11.6, and isolated representations weakly contained in a sum are summands; SRU.3.8 Heiermann–Opdam; SRU.3.10 discrete series are isolated in the tempered dual; SRU.4.7 Steinberg is isolated; SRU.4.8 supercuspidals are isolated. SRU.5.4 and SRU.5.5, for G split, adjoint and quasi-simple over F with hyperspecial K = G(O_F) (used for PGSp₆): SRU.5.4, *unramified-principal-series-irreducibility* (Kato: the unramified principal series X(s) of Satake parameter s ∈ T∨ is irreducible exactly when α∨(s) ≠ `q^(±1)` for every root α) and SRU.5.5, *spherical-generic-criterion* (the spherical constituent of X(s) is generic exactly when X(s) is irreducible).
- What SmoothRepresentationsOfLocalGroupsPartII must provide (gap:relative-generic-isolation): for a split group G over F of the types PGSp₆ and SO_N, a generic discrete series δ of G(F) is isolated in the set of irreducible unitary representations occurring as local components at a fixed place of the globally generic cuspidal spectrum with a fixed supercuspidal component at a second place (Ichino–Lapid–Mao, Proposition A.5 and Lemma A.2).

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

- Layer 0 automorphic forms and the adelic quotient; Layer 2 (§§2.4–2.5) real tempered and discrete-series representations and archimedean parameters, including the archimedean correspondence between irreducible representations of GL_n(ℝ) and n-dimensional semisimple representations of W_ℝ that fixes the real factors of §3.11; Layer 4 cusp forms, cuspidal realizations and Whittaker coefficients (§§4.2–4.3).
- What AutomorphicFormsOnReductiveGroups must provide (gap:poincare-weak-containment): the Poincaré-series weak containment of Sakellaridis–Venkatesh (Theorem 16.3.2 and Remark 16.4.1) in three instances, for a finite set S of places of a number field k, finite or archimedean, writing G(k_S) = ∏_(v∈S) G(k_v) and calling a vector spherical at a finite place v when it is fixed by a hyperspecial subgroup of G(k_v). (a) Quaternion periods: G = Aut(O) for a totally definite octonion algebra O over a totally real k, H = G_D the pointwise stabilizer of a quaternion subalgebra D, and irreducible δ_v (v ∈ S) that are summands of L²(G_D(k_v) \ G(k_v)), the functions invariant under G_D(k_v) on the left: there is a finite place z ∉ S such that ⊗_(v∈S) δ_v is weakly contained in the restriction to G(k_S) of the closed subspace of L²_D (§1.1) of vectors spherical at every finite place outside S ∪ {z}; and if k has a real place u outside S, the same holds with no place z, the Poincaré series being separated by a test function of small support at u, where G(k_u) is compact. (b) Whittaker models: G split, N the unipotent radical of a Borel subgroup, ψ = ∏ ψ_v a nondegenerate character of N(𝔸_k) trivial on N(k), a finite place w ∉ S with a ψ_w-generic supercuspidal σ of G(k_w), and irreducible δ_v (v ∈ S) that are summands of L²(N(k_v) \ G(k_v), ψ_v), the space of functions f on G(k_v) with f(ng) = ψ_v(n) f(g) for n ∈ N(k_v) and |f|² integrable on N(k_v) \ G(k_v): there is a finite place z ∉ S ∪ {w} such that ⊗_(v∈S) δ_v is weakly contained in the restriction to G(k_S) of the closed subspace of L²_(ψ,σ) (§1.2, the ψ-generic cuspidal spectrum with component σ at w) of vectors spherical at every finite place outside S ∪ {w, z}; and if k has an archimedean place outside S, the same holds with no place z, the Poincaré series being separated by a test function of small support at that archimedean place (Ichino–Lapid–Mao, proof of Proposition 4.5, pp. 19–20, arrange the Poincaré series in this way for Mp_n, with spherical test functions at the finite places of odd residue characteristic and test functions of small support at the archimedean places). (c) Cubic periods: k totally real, H = Aut(D) for a central division algebra D of degree three over k, H_e the pointwise stabilizer of a cubic subfield e ⊂ D, S the set of places where D ramifies (finite and nonempty), and irreducible δ_v (v ∈ S) that are summands of L²(H_e(k_v) \ H(k_v)): there is a finite place z ∉ S such that ⊗_(v∈S) δ_v is weakly contained in the restriction to H(k_S) of the closed subspace of L²_e (§1.3(c)) of vectors fixed by a maximal compact subgroup of H(k_u) at every real place u and spherical at every finite place outside S ∪ {z} (GF, proof of Lemma 2.5, p. 8, uses this globalization).
- What AutomorphicFormsOnReductiveGroups must provide (gap:regular-real-isolation): for each of split G₂(ℝ) and split PGSp₆(ℝ) with a fixed positive system, a constant C′ ≥ 0 depending only on the group and the system such that every discrete series whose infinitesimal character Λ satisfies ⟨Λ, α∨⟩ > C′ for every positive root α is an isolated point of the unitary dual for the Fell topology, and such that for every such Λ that is the infinitesimal character of a discrete series and every nondegenerate character ψ of the real points of a maximal unipotent subgroup, some discrete series with infinitesimal character Λ is ψ-generic (Layer 2, §2.4; GS, proofs of Proposition 5.1, p. 20, and Lemma 8.3, pp. 24–25, prescribe such real components in Proposition 10.7, whose isolation hypothesis this supplies).
- What AutomorphicFormsOnReductiveGroups must provide (gap:regular-real-unitarity): for each of split G₂(ℝ) and split PGSp₆(ℝ) with a fixed positive system, a constant C ≥ 0 depending only on the group and the system such that every irreducible unitary Harish-Chandra module whose infinitesimal character Λ is real, integral, that of a discrete series, and satisfies ⟨Λ, α∨⟩ > C for every positive root α is a discrete-series module (Layer 2, §2.4; GS, proof of Lemma 8.3, p. 25). This is the contract that ExceptionalThetaCorrespondencesForG2 declares on the same supplier under the same slug, with the same statement.

### From TauCetiRoadmap.AutomorphicSpectralTheory

- Layer 6: the invariant trace formula (§6.16), pseudo-coefficients (§6.18) and Euler–Poincaré functions (§6.19).
- What AutomorphicSpectralTheory must provide (gap:automorphic-plancherel-density): Shin's automorphic Plancherel density theorem: for a totally real k and a connected reductive G over k with discrete series at infinity, trivial centre, A_(G×ℝ) = A_(G,ℝ), unramified outside a finite set S and infinity, and a relatively quasi-compact Plancherel-regular subset U of the unitary dual of G(k_S) of positive Plancherel measure, there are infinitely many cuspidal automorphic representations with S-component in U, unramified outside S and infinity, and discrete series at infinity; and the density limit along any sequence of weights satisfying Shin's Definition 3.5 (Shin, Theorem 5.8, Corollary 4.12, Definition 3.5).

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

- AG2.2 Galois representations of regular algebraic polarized cuspidal representations over CM and totally real fields, including essentially self-dual descent to totally real fields and discrete sums; AG2.5 Caraiani's full away-prime compatibility with N; AG2.6 full polarized local–global compatibility at the coefficient prime, with its totally real polarized descent, and compatible systems; in rank n ≥ 2 the full coefficient-prime comparison assumes the universal irreducibility proposition ExtremelyRegularIrreducibility n, which ModularityAndLanglandsExtensions §2.43 proves.
- What AutomorphicGaloisRepresentationsPartII must provide (gap:kret-shin-gspin-galois): the Kret–Shin theorem: for a totally real k, n ≥ 2 and a cuspidal representation Σ of GSp₂ₙ(𝔸_k) with a finite place where Σ is a character twist of Steinberg and with Σ_∞|sim|^(−n(n+1)/4) cohomological for an irreducible algebraic representation of Res_(k/ℚ) GSp₂ₙ, a continuous GSpin₂ₙ₊₁(ℚ̄_ℓ)-valued representation of Gal(k̄/k) whose standard projection is the Galois representation of the Sp₂ₙ-restriction and whose similitude is the central character, unramified with matching Satake classes outside 2, ℓ and the ramification of k and Σ, de Rham at ℓ with the prescribed Hodge cocharacter (Kret–Shin, Theorem A); and its irreducibility in the spin representation when in addition n = 3 and the spin parameter is regular at every real place (Kret–Shin, Proposition 13.1(4)).

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

- R17.1.5 (ramification realization): for a number field F and finite sets S_f of finite and S_∞ of infinite places, there is a quaternion algebra over F nonsplit exactly at the places of S_f ∪ S_∞ if and only if S_∞ consists of real places and |S_f| + |S_∞| is even; used in §1.1(iii) with S_∞ the set of all real places of k.

### From TauCetiRoadmap.BorelRegulators

- §3.1 (the global period–index input): over a number field the index of a Brauer class equals its period, the least common multiple of the denominators of its local invariants; used in §3.11 for a central division algebra of degree three with local invariants ±1/3 at two finite places.

### From Tau Ceti roadmaps on main

- GlobalQuadraticForms, §6.3 (Hasse–Minkowski for isometry): two regular quadratic forms over a number field are isometric exactly when they are isometric at every finite and every real place; used in §1.1(ii) for the uniqueness of the totally definite octonion algebra.
- ReductiveGroups, Layer 9: pinned Chevalley–Demazure groups over ℤ, used for G₂, SL₃, PGSp₆ and the split D₄.
- RepresentationTheory/SpinRepresentations, Layer 2 (Spin and the double cover Spin₇ → SO₇; *SpinComplexPolarTopology*: the faithful representation of Spin₇(ℂ) by left multiplication on the complex Clifford algebra with its Hermitian inner product and adjoint g†, in which the unitary elements of Spin₇(ℂ) form the compact real form Spin(7) and the positive powers (g†g)^t lie in Spin₇(ℂ), giving the polar decomposition used in §0.8), Layer 4 (spin and half-spin representations), Layer 5 (fundamental representations of B₃ and D₄, and the restriction S⁺ ⊕ S⁻ of the type-B spin module to type D, used at l = 3 in §0.1), Layer 6 (Spin₆ ≅ SL₄ with S⁺ ≅ ℂ⁴, S⁻ ≅ (ℂ⁴)* and V ≅ Λ²(ℂ⁴)) and Layer 8 (triality for Spin₈ and the pullback cycle of the three eight-dimensional representations).
- RepresentationTheory/ClassicalGroups, §6.2 (the consecutive restriction from SO_(2r) to the stabilizer SO_(2r−1) of a fixed norm-one vector, r ≥ 2, multiplicity-free with summands indexed by the rows μ with λ₁ ≥ μ₁ ≥ λ₂ ≥ ⋯ ≥ λ_(r−1) ≥ μ_(r−1) ≥ |λ_r|, and the same rule along the lifted inclusion of Spin covers for rows all in ℤ + ½, the spin branching being a target of §§6.2 and 6.7 on the spin and half-spin modules of SpinRepresentations, Layers 4–5): used at r = 4 in §0.1 for V₈ ∘ ι ≅ 1 ⊕ q and S₈^± ∘ ι ≅ s.
- ClassFieldTheory, Layer 5 (the Brauer group of F and the local invariant), Layer 9 (the local Weil group, its transfer to the Weil group of a finite extension and the reciprocity isomorphism F× ≅ W_F^ab, used for the quadratic and induced characters of §0.8) and Layer 10 (the Brauer sequence of a number field, exact on the right: local invariants that vanish almost everywhere and sum to zero come from a global Brauer class; used in §3.11).
- OrthogonalSpinGroups, Layer 1 (the Lipschitz group and the spinor norm) and Layer 2 (local spinor norms), for the spinor-norm character in §2.1.
- Chebotarev (completed), Layer 10 (*Dirichlet-density Chebotarev*): the Chebotarev density theorem for a finite Galois extension of number fields, applied to the finite quotients of the image of a Galois representation, so that two semisimple ℓ-adic representations with conjugate Frobenius images at a set of places of density one are isomorphic; used in §§0.9, 5.2 and 8.2.

## How to read the build

Layer 0 is pure dual-group mathematics: Griess's conjugacy theorem, the parameter forms of the imported branching rules, detection of the A₂ and Spin₇ images, standard injectivity, quadratic rigidity, weak equivalence and the unacceptability of Spin₇, and Chenevier's descent theorems. Layer 1 fixes the totally definite octonion algebra over a number field with its quaternion subalgebras, and globalizes local representations of G₂ and PGSp₆ with prescribed periods, Whittaker models or spin-regular weights, and of the automorphism group of a cubic division algebra with a cubic period. Layer 2 extends the parameters of Sp₆ and split SO₈ to all irreducible representations by the Langlands classification, builds the spin transfer from generic PGSp₆ to GL₈ through triality and compares its gamma factors. Layer 3 defines the G₂ parameter map from the theta dichotomy and proves its spectral properties and both characterizations. Layer 4 parametrizes the packets over the discrete A₂ parameters. Layer 5 constructs Kret–Shin parameters and proves the exceptional spin identity on all generic discrete series. Layer 6 identifies every diamond discrete fibre with a distinguished one of Xu's packets. Layer 7 assembles the Main Theorem and its enhanced applications. Layers 8–10 extend the spin method to all of PGSp₆: the classical global theta lift of a globalized discrete series, extended spin transfer, existence of joint Spin₇-lifts, and the weak correspondence with its fibres. Layer 1 does not use Layer 0, and Layer 2 uses only §0.1 and §1.6 from them; Layers 4–6 depend on Layer 3; Layers 8–9 depend on Layers 0–2 but not on Layers 3–7, and Layer 10 uses Layers 5 and 6 only for the diamond classes of §§10.1 and 10.9.

## Layer 0: Parameters of G₂ and Spin₇

### 0.0 Griess's conjugacy theorem for G₂

Write 𝕆 for the complex split octonions `TauCeti.Octonion ℂ`. Define `octonionAut` as the subgroup of the invertible ℂ-linear maps of 𝕆 consisting of the g with g(xy) = g(x)g(y) for all x, y ∈ 𝕆: this is the group of complex points of the octonion automorphism group of ExceptionalThetaCorrespondencesForG2, §0.1 (*The octonion model of G₂*), whose predicate also asks g(1) = 1, a condition implied here because g(1)g(x) = g(x) for all x and g is surjective. That section identifies it with G₂(ℂ), and the restriction to the trace-zero submodule `TauCeti.Octonion.imaginary` is the seven-dimensional representation v. For a group Γ and a homomorphism ρ : Γ → `octonionAut`, define `octonionRep` ρ as the representation of Γ on 𝕆 by the linear maps ρ(γ).

- An element of `octonionAut` fixes 1, preserves `TauCeti.Octonion.trace` and the norm, and maps `TauCeti.Octonion.imaginary` onto itself; restriction to it is injective on `octonionAut` (ExceptionalThetaCorrespondencesForG2, §0.1).
- `octonionRep` ρ is the direct sum of the trivial line ℂ · 1 and v ∘ ρ on `TauCeti.Octonion.imaginary`. Consequently `octonionRep` ρ is completely reducible exactly when v ∘ ρ is (a direct summand of a completely reducible representation is completely reducible, and a sum of two is), and `octonionRep` ρ ≅ `octonionRep` ρ′ exactly when v ∘ ρ ≅ v ∘ ρ′ (the trivial summand cancels in finite-dimensional representations by the Krull–Schmidt theorem).
- For g ∈ `octonionAut`, the linear map g is an isomorphism from `octonionRep` ρ to `octonionRep` (gρg⁻¹).

**Checks.**

- The identity map lies in `octonionAut`; the scalar map 2 · id does not, since 2(1 · 1) = 2 while (2 · 1)(2 · 1) = 4; the zero map is not a linear equivalence and is excluded by the carrier.
- Octonion conjugation x ↦ x̄ = ⟨b, a, −v, −w⟩ fixes 1 but reverses products (`TauCeti.Octonion.conj_mul`) and is not in `octonionAut`: for the top vectors u = ⟨0, 0, e₁, 0⟩ and u′ = ⟨0, 0, e₂, 0⟩ the product uu′ is the bottom vector ⟨0, 0, 0, e₃⟩, so the conjugate of uu′ is ⟨0, 0, 0, −e₃⟩ while ū ū′ = ⟨0, 0, 0, e₃⟩.
- For t ∈ SL₃(ℂ) the map ⟨a, b, v, w⟩ ↦ ⟨a, b, tv, t^(−T)w⟩ lies in `octonionAut`: the dot products v · w′ are preserved, and tv × tv′ = det(t) t^(−T)(v × v′) = t^(−T)(v × v′) on the bottom vector entry (similarly with t^(−T) on the top entry). For t = diag(ζ, ζ, ζ³), ζ a primitive fifth root of unity, `octonionRep` has the eight eigenvalues 1, 1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ², and its trace-zero part the seven eigenvalues 1, ζ, ζ, ζ³, ζ⁴, ζ⁴, ζ² of v ∘ j at t (§0.1).

Let Γ be a group and ρ, ρ′ : Γ → G₂(ℂ) homomorphisms whose seven-dimensional representations v ∘ ρ and v ∘ ρ′ are completely reducible. Prove that if v ∘ ρ ≅ v ∘ ρ′ as representations of Γ, then ρ′ = g ρ g⁻¹ for some g ∈ G₂(ℂ) (Griess, Theorem 1; this is the statement used in C, proof of Theorem 6.4, p. 149, in HKT, proof of Lemma 4.6, p. 22, and in GS, §3.4, p. 13). On `octonionAut` this is `griess_conjugacy`, whose hypotheses are complete reducibility of `octonionRep` ρ and `octonionRep` ρ′ and a linear isomorphism of 𝕆 intertwining them; by the second API bullet these are the hypotheses on v ∘ ρ and v ∘ ρ′. Deduce four forms used below. First, the same statement for G₂(E) with E a field isomorphic to ℂ (such as the Ē_λ of §0.10), by transport along a field isomorphism, G₂ being defined over ℚ. Second, G₂ is acceptable on completely reducible homomorphisms: if ρ(γ) and ρ′(γ) are G₂(E)-conjugate for every γ ∈ Γ then ρ and ρ′ are conjugate by one element, because elementwise conjugacy gives v ∘ ρ and v ∘ ρ′ the same character and completely reducible representations with the same character are isomorphic. Third, with Γ = ℤ, two semisimple elements of G₂(E) with the same characteristic polynomial on v are G₂(E)-conjugate. Fourth, for Γ = WD_F every parameter has completely reducible v-image (finite inertia image, semisimple Frobenius, algebraic on SL₂(ℂ)), and v ∘ φ ≅ v ∘ φ′ as representations of WD_F is isomorphism of the Weil–Deligne representations with their monodromy; this is the form used in §§0.3–0.5. *Needs:* `TauCeti.Octonion`, `TauCeti.Octonion.imaginary`; Mathlib `Representation.IsSemisimpleRepresentation`; ExceptionalThetaCorrespondencesForG2, §0.1 (the octonion model of G₂ and its seven-dimensional representation; octonion automorphisms preserve the norm and the imaginary octonions, so that v is valued in SO₇) and §0.6 (the inclusion G₂(ℂ) → Spin₇(ℂ)).

**Checks.**

- v is injective, so v ∘ ρ trivial forces ρ trivial: the only homomorphism with v-image 1^⊕7 is the trivial one, and the theorem's conclusion for ρ′ = 1 is consistent with this; on `octonionAut` the witness for ρ = ρ′ is g = 1.
- An algebraic homomorphism ρ : SL₂(ℂ) → G₂(ℂ) with v ∘ ρ ≅ Sym⁶ is conjugate to the principal SL₂: the seven-dimensional datum Sym⁶ determines a single G₂-class, which is what the Steinberg parameter of §§0.2 and 0.4 uses. On 𝕆 the representation is Sym⁶ ⊕ 1, of dimension 8 = 7 + 1.
- v ∘ j ∘ φ_τ ≅ 1 ⊕ φ_τ ⊕ φ_τ∨ ≅ v ∘ j ∘ φ_τ∨, so j ∘ φ_τ and j ∘ φ_τ∨ are G₂(ℂ)-conjugate; the conjugating element is the duality element of the normalizer of j(SL₃) in §0.2.
- Equal image subgroups are not the hypothesis: with t = diag(ζ, ζ, ζ³) as in the Checks above, put ρ(1) = t, ρ′(1) = t² on Γ = ℤ/5. The images coincide, but t² has v-eigenvalues 1, ζ², ζ², ζ³, ζ³, ζ⁴, ζ (coordinates (ζ², ζ², ζ)), a different multiset from 1, ζ, ζ, ζ⁴, ζ⁴, ζ², ζ³ (ζ occurs twice versus once), so v ∘ ρ ≇ v ∘ ρ′ and t, t² are not conjugate. Adding the trivial line keeps the multiplicities of ζ at 2 and 1, so no intertwiner of `octonionRep` ρ and `octonionRep` ρ′ exists either; the hypothesis is an isomorphism intertwining ρ and ρ′.
- The analogous statement for Spin₇(ℂ) with its spin representation is false (§0.8); the theorem is specific to G₂ and v.

### 0.1 Branching of the vector and spin representations

Let ι : Spin₇(ℂ) → Spin₈(ℂ) be the lift of the inclusion into SO₈(ℂ) of the stabilizer of a nonisotropic vector of the eight-dimensional vector representation V₈, and S₈⁺, S₈⁻ the two half-spin representations of Spin₈(ℂ). The restrictions V₈ ∘ ι ≅ 1 ⊕ q and S₈^± ∘ ι ≅ s (GS, §4.1, p. 17) are the case r = 4 of the multiplicity-free Spin(2r) → Spin(2r − 1) branching of RepresentationTheory/ClassicalGroups, §6.2 (the lifted inclusion along a fixed norm-one vector, rows all integral or all in ℤ + ½, with the spin branching itself constructed in §6.7), at the highest weights (1, 0, 0, 0) and (½, ½, ½, ±½); any two nonisotropic vectors are proportional to vectors in one SO₈(ℂ)-orbit, so the restrictions do not depend on the vector chosen. Together with these restrictions, the restrictions v ∘ j ≅ 1 ⊕ Std₃ ⊕ Std₃∨ of the seven-dimensional module to SL₃(ℂ) and s ∘ i ≅ 1 ⊕ v of the spin module to G₂(ℂ) (ExceptionalThetaCorrespondencesForG2, §0.6, *Exceptional inclusions of complex dual groups*; GS, §2.2, pp. 9–10) and the h-branching q ∘ h ≅ 1 ⊕ Λ²(Std₄), s ∘ h ≅ Std₄ ⊕ Std₄∨ for h : SL₄(ℂ) = Spin₆(ℂ) → Spin₇(ℂ) (GS, §12.3, pp. 35–36; SpinRepresentations, Layer 5 at l = 3, the restriction S⁺ ⊕ S⁻ of the type-B spin module to type D, read through Layer 6, `Spin₆ ≅ SL₄`, under which S⁺ ≅ Std₄, S⁻ ≅ Std₄∨ and the vector module is Λ²Std₄, the vector restriction coming from the orthogonal splitting ℂ⁷ = ℂ⁶ ⊕ ℂe₇), prove that these isomorphisms of algebraic representations give, by the transport of parameters of ExceptionalThetaCorrespondencesForG2, §0.7 (*Complex local parameters*), isomorphisms of Weil–Deligne representations with their monodromy, since for an algebraic representation ρ the monodromy of ρ ∘ φ is dρ(N_φ): v ∘ j ∘ φ_τ ≅ 1 ⊕ φ_τ ⊕ φ_τ∨, s ∘ i ∘ φ ≅ 1 ⊕ v ∘ φ, q ∘ h ∘ φ_τ ≅ 1 ⊕ Λ²φ_τ, s ∘ h ∘ φ_τ ≅ φ_τ ⊕ φ_τ∨, and, for every Spin₇-valued parameter φ̃, V₈ ∘ ι ∘ φ̃ ≅ 1 ⊕ q ∘ φ̃ and S₈^± ∘ ι ∘ φ̃ ≅ s ∘ φ̃. *Needs:* ExceptionalThetaCorrespondencesForG2, §0.6 (inclusions and their restrictions) and §0.7 (transport of parameters); ClassicalGroups, §6.2 (Spin covers) and §6.7; SpinRepresentations, Layers 4, 5, 6.

**Checks.**

- On the A₂ torus diag(a, b, (ab)⁻¹) of SL₃(ℂ) the seven eigenvalues of v ∘ j are (1, a, b, (ab)⁻¹, a⁻¹, b⁻¹, ab); their product is 1, and the characteristic polynomial is `(X−1)(X−a)(X−b)(X−(ab)⁻¹)(X−a⁻¹)(X−b⁻¹)(X−ab)`, monic of degree seven (computed with `Matrix.charpoly_diagonal`).
- At a = b = 1 the polynomial is `(X−1)⁷`; at a = −1, b = 1 the eigenvalues are 1, −1, 1, −1, −1, 1, −1 and the polynomial is `(X−1)³(X+1)⁴`.
- At a = 2, b = 3 the spectrum is {1, 2, 3, 1/6, 1/2, 1/3, 6}; the wrong branching 1 ⊕ Std₃ ⊕ Std₃ would give {1, 2, 3, 1/6, 2, 3, 1/6}, so the dual summand is detected.
- The spin restriction adds one eigenvalue 1 even when v already has eigenvalue 1: at a = b = 1 the spin polynomial is `(X−1)⁸`, not `(X−1)⁷`.
- Dimensions: 7 = 1 + 3 + 3, 8 = 1 + 7, 7 = 1 + 6 and 8 = 4 + 4; a formula s ∘ h ≅ Std₄ ⊕ 1 ⊕ Std₄∨ would have dimension 9.
- The Spin₈ restriction is pinned at the centre: −1 ∈ Spin₇(ℂ) maps to −1 ∈ Spin₈(ℂ), which acts trivially on the vector representation and by −1 on both half-spin representations, so the traces are 8 = tr (1 ⊕ q)(−1) and −8 = tr s(−1). An embedding Spin₇(ℂ) → Spin₈(ℂ) lifting s : Spin₇(ℂ) → SO₈(ℂ) sends −1 to a central element acting by −1 on the vector representation, so along it the vector representation restricts to s, not to 1 ⊕ q; the stabilizer embedding is the one used.
- The interlacing rows λ₁ ≥ μ₁ ≥ λ₂ ≥ μ₂ ≥ λ₃ ≥ μ₃ ≥ |λ₄| of ClassicalGroups §6.2 at r = 4: λ = (1, 0, 0, 0) admits μ = (1, 0, 0) and (0, 0, 0), of dimensions 7 + 1 = 8; each of λ = (½, ½, ½, ½) and (½, ½, ½, −½) admits only μ = (½, ½, ½), of dimension 8, because the last D₄ coordinate enters only through |λ₄|. The B₃ → D₃ restriction of s goes the other way and has the two rows (½, ½, ±½), giving S⁺ ⊕ S⁻ of dimensions 4 + 4; a model in which the two half-spin representations of Spin₈(ℂ) restrict to different modules of Spin₇(ℂ) contradicts the single row.
- The central element −1 of Spin₇(ℂ) acts by −1 in s and trivially in q. Multiplying a Spin₇-valued parameter φ̃ by the unramified quadratic central character χ with χ(Frobenius) = −1 leaves q ∘ φ̃ unchanged and replaces the Frobenius eigenvalues λ₁, …, λ₈ of s ∘ φ̃ by −λ₁, …, −λ₈. For φ̃ trivial these are all 1 versus all −1: spin traces 8 and −8, vector traces 7 and 7.
- A nontrivial central twist need not change the q- and s-images: for φ̃ unramified with Frobenius ↦ i(j(diag(−1, 1, −1))) and trivial on SL₂(ℂ), the spin eigenvalues are 1, 1, 1, 1, −1, −1, −1, −1 (the eigenvalue 1 added to the vector eigenvalues of the second Check), negation leaves this multiset unchanged, both spin traces are 0 and both vector traces are −1; so φ̃ and χ · φ̃ have isomorphic q- and s-images and one weak class (§0.6).

### 0.2 Detection of discrete A₂ parameters

Prove that j induces an injection Φ(PGL₃)/(φ_τ ∼ φ_τ∨) → Φ(G₂); that a discrete parameter φ of G₂ lies in its image exactly when L(s, v ∘ φ) has a pole at s = 0; and that for φ = j ∘ φ_τ with φ_τ discrete, S_φ ≅ μ₃ when φ_τ is not self-dual and S_φ ≅ S₃ when φ_τ is self-dual (GS, Lemma 2.4(i), pp. 9–10). *Route:* the normalizer of j(SL₃) in G₂(ℂ) is j(SL₃) ⋊ ⟨duality⟩ and acts on parameters by φ_τ ↦ φ_τ∨; a pole of L(s, v ∘ φ) at 0 is a nonzero φ-invariant vector of v; for discrete φ that vector is nonisotropic and its stabilizer is a conjugate of j(SL₃); the centralizers are computed from Z_G₂(SL₃) = μ₃ and Z_G₂(SO₃) = S₃. Injectivity modulo duality uses no conjugacy theorem: G₂-conjugate parameters have isomorphic v-images, and an isomorphism 1 ⊕ φ_τ ⊕ φ_τ∨ ≅ 1 ⊕ φ_τ′ ⊕ φ_τ′∨ forces φ_τ′ ≅ φ_τ or φ_τ′ ≅ φ_τ∨ by comparing irreducible summands and determinants, including the case of three characters (GS, proof of Lemma 2.4(i), p. 10). *Needs:* §0.1; ExceptionalThetaCorrespondencesForG2, Layer 0 (dual-group inclusions and centralizers; component groups); EndoscopicTransferAndUnitaryTraceComparison §10.1 (L-factors of Weil–Deligne representations).

**Checks.**

- The principal SL₂ in SL₃ is self-dual and discrete in SL₃; its image is the subregular parameter of G₂, with S_φ ≅ S₃, not μ₃.
- For φ_τ = χ ⊗ Sym² with χ a nontrivial cubic character, φ_τ is discrete and not self-dual (φ_τ∨ = χ⁻¹ ⊗ Sym²) and S_φ ≅ μ₃.
- The principal SL₂ parameter of G₂ is discrete with v ∘ φ = Sym⁶ irreducible, so L(s, v ∘ φ) has no pole at 0 and φ is not in the A₂ image.
- A non-discrete parameter j(φ_τ) with φ_τ = 1 ⊕ 1 ⊕ 1 has L(s, v ∘ φ) with a pole of order seven at 0; the pole criterion is asserted only for discrete φ.

### 0.3 Spin detection of G₂ parameters

Prove that i induces an injection Φ(G₂) → Φ(PGSp₆); that for φ ∈ Φ♦_ds(G₂) the parameter i ∘ φ is discrete and L(s, s ∘ i ∘ φ) has a pole at s = 0; that conversely a discrete Spin₇-valued parameter φ̃ with a pole of L(s, s ∘ φ̃) at s = 0 is i ∘ φ for a unique diamond discrete φ; and that for such φ the inclusion induces S_φ ≅ S_(i∘φ)/image Z(Spin₇) (GS, Lemma 2.4(ii), p. 9; §8.3, p. 24). *Route:* a pole is a φ̃-invariant spinor; complete reducibility makes the invariant subspace nondegenerate for the spin quadratic form, so it contains a nonisotropic vector whose stabilizer is a conjugate of i(G₂); injectivity of i follows from §0.0 after applying q, since Spin₇-conjugate i ∘ φ, i ∘ φ′ have isomorphic v-images. For the centralizers (GS, §8.3, p. 24): s ∘ i ∘ φ = 1 ⊕ v ∘ φ, and v ∘ φ has no nonzero invariant vector because φ is discrete and outside the A₂ image (§0.2), so the invariant spinors form one line ℂx₀, with x₀ nonisotropic and stabilizer i(G₂(ℂ)); the centralizer Z_(Spin₇(ℂ))(i ∘ φ) preserves this line and the spin quadratic form, so it acts on x₀ by ±1, and the central element −1 acts by −1; hence Z_(Spin₇(ℂ))(i ∘ φ) = i(Z_(G₂(ℂ))(φ)) × Z(Spin₇(ℂ)), and passing to component groups and dividing by the image of Z(Spin₇(ℂ)) = μ₂ gives S_φ. *Needs:* §0.0, §0.1, §0.2; ExceptionalThetaCorrespondencesForG2, Layer 0.

**Checks.**

- For the principal SL₂ parameter φ of G₂, i ∘ φ restricted to SL₂ is Sym⁶ ⊕ Sym⁰ in s, and s ∘ i ∘ φ = 1 ⊕ Sym⁶ has exactly one invariant line.
- For the subregular parameter (in the A₂ image), s ∘ i ∘ φ = 1 ⊕ 1 ⊕ Sym² ⊕ Sym², the pole of L(s, s ∘ i ∘ φ) at 0 has order two, and i ∘ φ is not discrete (it factors through a proper Levi of Spin₇); the converse statement is asserted only for discrete φ̃.
- The quotient by image Z(Spin₇) is needed: for the principal SL₂ parameter of Spin₇ the raw component group is μ₂ = Z(Spin₇) while S_φ of the principal G₂ parameter is trivial.

### 0.4 Standard injectivity

Prove that v induces an injection Φ(G₂) → Φ(GL₇): two G₂-valued parameters whose seven-dimensional Weil–Deligne representations are isomorphic are G₂(ℂ)-conjugate (GS, Lemma 2.4(iii), p. 9; §3.4, p. 13). Prove that v carries Φ♦_ds(G₂) into discrete parameters of SO₇. *Route:* an isomorphism of the Weil–Deligne representations v ∘ φ ≅ v ∘ φ′ with their monodromy is an isomorphism of representations of the group WD_F = W_F × SL₂(ℂ); every parameter has completely reducible v-image, so §0.0 gives the G₂(ℂ)-conjugacy. Discreteness of v ∘ φ for diamond φ is GS Lemma 2.4(iii). *Needs:* §0.0, §0.1; ExceptionalThetaCorrespondencesForG2, Layer 0.

**Checks.**

- On the A₂ image, v ∘ j ∘ φ_τ = 1 ⊕ φ_τ ⊕ φ_τ∨ is reducible of dimension seven, and the injectivity does not require irreducibility of v ∘ φ.
- j ∘ φ_τ and j ∘ φ_τ∨ have isomorphic v-images and are indeed G₂-conjugate, consistent with §0.2.
- The analogous statement fails for Spin₇-valued parameters, even with the seven- and eight-dimensional images together: the local pair φ, η · φ of §0.8 (finite image on W_F, trivial on SL₂(ℂ), for every F) has q ∘ (η · φ) = q ∘ φ and s ∘ (η · φ) ≅ s ∘ φ, while φ and η · φ are not Spin₇(ℂ)-conjugate.

### 0.5 Quadratic twist rigidity on the G₂ image

Let Γ be a group, ρ : Γ → G₂(ℂ) a homomorphism with completely reducible image and χ : Γ → {±1} a nontrivial character. Prove: if i ∘ ρ and χ · (i ∘ ρ) are not Spin₇(ℂ)-conjugate, then (v ∘ ρ) ⊗ χ has no nonzero invariant vector; in particular, if s ∘ (χ · i ∘ ρ) ≅ 1 ⊕ v ∘ ρ then χ · (i ∘ ρ) is conjugate to i ∘ ρ (HKT, Lemma 4.6). *Route:* a trivial summand of s ∘ (χ · i ∘ ρ) = χ ⊗ (1 ⊕ v ∘ ρ) is an invariant spinor; the invariant subspace is nondegenerate by complete reducibility, so it contains a nonisotropic vector, whose stabilizer is a conjugate of G₂(ℂ): some conjugate of χ · (i ∘ ρ) is i ∘ ρ′ for a homomorphism ρ′ : Γ → G₂(ℂ), and v ∘ ρ′ = q ∘ (χ · i ∘ ρ) ≅ v ∘ ρ because q kills the centre; then §0.0 makes ρ′ conjugate to ρ, hence χ · (i ∘ ρ) conjugate to i ∘ ρ. *Needs:* §0.0, §0.1.

**Checks.**

- ρ trivial, χ nontrivial: χ · i ∘ ρ is the central character χ, not conjugate to the trivial homomorphism, and (v ∘ ρ) ⊗ χ = χ^⊕7 has no invariant vector: both sides of the implication hold.
- If (v ∘ ρ) ⊗ χ has an invariant vector the conclusion is conjugacy, not χ = 1: for ρ with image in j(SL₃) ⋊ ⟨duality⟩ acting on the line by the sign χ, χ is nontrivial and χ · i ∘ ρ is conjugate to i ∘ ρ.
- The nonisotropy step is necessary: nonzero isotropic spinors exist in the eight-dimensional spin representation and their stabilizers are not conjugates of G₂(ℂ).

### 0.6 Weak equivalence of Spin₇-valued parameters

Define two parameters φ, φ′ : WD_F → Spin₇(ℂ) to be weakly equivalent when q ∘ φ ≅ q ∘ φ′ as SO₇-valued parameters and s ∘ φ ≅ s ∘ φ′ as GL₈-valued parameters, and Φ_w(PGSp₆) as the quotient of Φ(PGSp₆) by this relation (GS, Definition 12.1, p. 34).

- Weak equivalence is an equivalence relation coarser than Spin₇-conjugacy, and every parameter class has a weak class.
- Two weak classes are equal exactly when both the SO₇-images and the GL₈-images agree; q ∘ φ and s ∘ φ depend only on the weak class.
- A function on Φ(PGSp₆) that is constant on pairs with equal q- and s-images factors uniquely through Φ_w(PGSp₆).
- Multiplication by a quadratic character χ : W_F → μ₂ = Z(Spin₇) descends to Φ_w, since q ∘ (χφ) = q ∘ φ and s ∘ (χφ) = χ ⊗ s ∘ φ.

**Checks.**

- A parameter and any Spin₇-conjugate of it have the same weak class.
- The trivial parameter and the unramified quadratic central parameter (Frobenius ↦ −1 ∈ Z(Spin₇)) have equal SO₇-images and unequal spin images (all eigenvalues 1 versus all −1), so they have different weak classes; equality of q-images alone does not define the relation.
- Twisting twice by the same χ returns the weak class, since χ² = 1.
- The local pair φ, η · φ of §0.8 (CG Proposition 8.3, for every F) has one weak class and two classes in Φ(PGSp₆), so the quotient map Φ(PGSp₆) → Φ_w(PGSp₆) is not injective; the finite-group pair (r, r′) of §0.8 is defined on μ₄ × μ₄ and is not itself a parameter.

*Needs:* ExceptionalThetaCorrespondencesForG2, Layer 0 (*Complex local parameters*, *Raw and fixed-split component groups*); Tau Ceti `CliffordAlgebra.spinToSpecialOrthogonal` and `TauCeti.spinRep` (the maps q and s), with SpinRepresentations, Layers 2 and 4, for their properties.

### 0.7 Weak equivalence and elementwise conjugacy

Prove that two parameters φ, φ′ : WD_F → Spin₇(ℂ) are weakly equivalent exactly when φ(x) and φ′(x) are Spin₇(ℂ)-conjugate for every x ∈ WD_F (GS, Lemma 12.2, p. 34). *Route:* for semisimple elements of Spin₇, conjugacy is equivalent to conjugacy of the images in SO₇ together with equality of spin traces (CG, Lemma 3.10 and Proposition 3.12); characters on the reductive Zariski closure recover the representation isomorphisms; for elements of WD_F with nontrivial unipotent part, prove that conjugacy of the semisimple parts given by the standard and spin data extends to the commuting unipotent parts. *Needs:* §0.6; Tau Ceti `CliffordAlgebra.spinToSpecialOrthogonal`, `CliffordAlgebra.spinDoubleCover` and `TauCeti.spinRep`; SpinRepresentations, Layers 2 and 4.

**Checks.**

- For a parameter trivial on W_F the relation is conjugacy of the restrictions to SL₂(ℂ); elementwise conjugacy of unipotent elements uses the unipotent class, not the semisimple part alone.
- The trivial parameter and the unramified quadratic central parameter are not elementwise conjugate (Frobenius maps to 1 and −1, central and distinct), matching §0.6.
- Elementwise conjugacy on WD_F is strictly weaker than conjugacy by one element: the local pair φ, η · φ of §0.8 is elementwise conjugate and not conjugate, and it is weakly equivalent, as the statement requires.

### 0.8 Spin₇ is unacceptable

Prove that there are a finite group Γ and homomorphisms r, r′ : Γ → Spin₇(ℂ) that are conjugate element by element but not by a single element of Spin₇(ℂ) (CG, Example 1 and Corollary 4.8, PDF pp. 13–14). This is `spin7_not_acceptable`, stated with `spinGroup` `sumSquaresSeven`, where `sumSquaresSeven` is the form x₁² + ⋯ + x₇² on ℂ⁷. *Route:* take Γ = μ₄ × μ₄ with projections a, b and the four-dimensional representation V with characters a, ab², b, ba²; det V = 1 gives r : Γ → SU₄ = Spin₆ → Spin₇; put r′ = η · r with η = b² (central in Spin₇). The group Γ is the union of ker a², ker b² and ker (ab)², which gives elementwise conjugacy; neither η ⊗ V nor its dual is isomorphic to V, and CG Corollary 4.6 excludes global conjugacy. CG works in the compact Spin(7); element conjugacy passes to Spin₇(ℂ), and non-conjugacy passes by the polar-decomposition argument below.

The form `sumSquaresSeven` is `QuadraticMap.weightedSumSquares` ℂ with all seven weights 1, and has the following API.

- Its polar form at (x, y) is 2(x₁y₁ + ⋯ + x₇y₇), so it is nondegenerate.
- Every nondegenerate quadratic form on a seven-dimensional complex vector space is isometric to it, and an isometry Q ≅ Q′ induces an isomorphism `spinGroup` Q ≅ `spinGroup` Q′ (`QuadraticMap.IsometryEquiv.spinGroupEquiv`); so the statements of this section do not depend on the choice of nondegenerate form.
- The kernel of q = `CliffordAlgebra.spinToSpecialOrthogonal` on `spinGroup sumSquaresSeven` is {±1} and q is surjective onto SO₇(ℂ) (`CliffordAlgebra.spinDoubleCover`); since SO₇(ℂ) has trivial centre, the centre of `spinGroup sumSquaresSeven` is {±1}, the group that η takes values in.

Prove also the local form, for every F as in Conventions: there are a continuous homomorphism r_F : W_F → Spin(7) with finite image, into the compact form, and a quadratic character η : W_F → {±1} = Z(Spin₇(ℂ)) such that the parameter φ(w, x) = r_F(w), trivial on SL₂(ℂ), and the parameter η · φ are Spin₇(ℂ)-conjugate element by element on WD_F but not conjugate by a single element of Spin₇(ℂ). In particular q ∘ (η · φ) = q ∘ φ and s ∘ (η · φ) ≅ s ∘ φ, so φ and η · φ have the same weak class (§0.6) and different classes in Φ(PGSp₆) (CG, Proposition 8.3 and its proof, pp. 32–33). On the Weil group `TauCeti.ClassFieldTheory.WeilGroup` with its Weil topology this is `spin7_not_acceptable_weilGroup`: φ is trivial on SL₂(ℂ) and of finite image on W_F, so it is the homomorphism r_F of W_F, with open kernel and finite image, and η = sgn_(E/F) has the open kernel W_E; the requirement that r_F take values in the compact form is no restriction there, a finite subgroup of Spin₇(ℂ) being conjugate into Spin(7). *Route:* Hom(W_F, {±1}) ≅ F×/F×² has rank 2 for p odd and 2 + [F : ℚ₂] for p = 2 (CG, formula (16), p. 32), so F has two distinct quadratic extensions E and E′; CG Lemma 8.2 (p. 32) gives a finite-order character c of E× restricting to sgn_(E′/F) on F× and of order greater than 2 on the norm-one torus of E/F; the two-dimensional representation of W_F induced from c, with its analogue for E′, gives a homomorphism into the group G ⊂ O(2)± × O(2)± of CG §5, and CG Proposition 5.10 (p. 21, with Lemma 5.9(ii): neither image is dihedral of order 8) makes its composite with G → SU(4) ⊂ Spin(7) unacceptable with η = sgn_(E/F). Finite image makes the Frobenius image semisimple and the image bounded, so φ is a parameter. Element conjugacy in Spin(7) gives element conjugacy in Spin₇(ℂ), hence equal characters of the semisimple representations s ∘ φ and s ∘ (η · φ), hence their isomorphism. For non-conjugacy write Spin₇(ℂ) = Spin(7) · P, P the positive elements, in the faithful representation of SpinRepresentations, Layer 2 (*SpinComplexPolarTopology*), in which Spin(7) is the group of unitary elements of Spin₇(ℂ): if g = kp with k ∈ Spin(7) and p ∈ P conjugates r_F to η · r_F, then p r_F(w) p⁻¹ = k⁻¹ η(w) r_F(w) k is unitary, and the uniqueness of the polar decomposition of p r_F(w) = r_F(w) · (r_F(w)⁻¹ p r_F(w)) = (k⁻¹ η(w) r_F(w) k) · p gives k⁻¹ η(w) r_F(w) k = r_F(w) for every w, so k ∈ Spin(7) conjugates r_F to η · r_F, which CG excludes; the same argument carries the finite-group pair from Spin(7) to Spin₇(ℂ). The construction covers every residue characteristic, including p = 2 and p = 3. *Needs:* §0.6, §0.7; ClassFieldTheory, Layer 9 (the Weil group and local reciprocity); SpinRepresentations, Layer 2 (*SpinComplexPolarTopology*) and Layer 6 (Spin₆ ≅ SL₄); Tau Ceti `TauCeti.ClassFieldTheory.WeilGroup` with its Weil topology, `CliffordAlgebra.spinToSpecialOrthogonal`, `CliffordAlgebra.spinDoubleCover` and `QuadraticMap.IsometryEquiv.spinGroupEquiv`; Mathlib `spinGroup`, `IsConj`, `QuadraticMap.weightedSumSquares`.

**Checks.**

- In coordinates a = (1,0), b = (0,1) of the character group (ℤ/4)², V has weights (1,0), (1,2), (0,1), (2,1), summing to (4,4) ≡ 0 (so det V = 1); η ⊗ V has weights (1,2), (1,0), (0,3), (2,3), which is neither the multiset of V nor that of V∨, namely (3,0), (3,2), (0,3), (2,3).
- Every (x, y) ∈ (ℤ/4)² has x even, y even or x + y even, so Γ = ker a² ∪ ker b² ∪ ker (ab)².
- On ker b² = {(x, y) : 2y ≡ 0} the character η is trivial, so r and r′ agree there.
- Any statement that identifies a weak class with a single class in Φ(PGSp₆) fails on the local pair φ, η · φ; the pair (r, r′) itself is a pair of homomorphisms of μ₄ × μ₄, not of WD_F, and has no weak class.
- For F = ℚ₅ the pair (r, r′) does give a local pair: ℚ₅×/ℚ₅×⁴ ≅ ℤ/4 × ℤ/4 (valuation modulo 4 and the residue character ℤ₅× → 𝔽₅× ≅ μ₄, the principal units being 4-divisible), so W_ℚ₅ → W_ℚ₅^ab ≅ ℚ₅× → μ₄ × μ₄ is surjective; pulling back keeps element conjugacy, surjectivity keeps non-conjugacy, the inertia image is finite and N = 0. For F = ℚ₃, ℚ₃×/ℚ₃×⁴ ≅ ℤ/4 × ℤ/2 has order 8 < 16, so no continuous surjection W_ℚ₃ → μ₄ × μ₄ exists; the local form for every F is the construction of CG Proposition 8.3, not a pullback of (r, r′).
- The local pairs are not discrete: by CG Proposition 8.4(a), p. 33, the seven-dimensional representation q ∘ r_F of a type I unacceptable morphism contains a quadratic character with multiplicity two, so the centralizer of r_F contains a circle Spin(2) and r_F lies in a proper Levi subgroup; these pairs carry no information on the weak classes of discrete parameters.
- In `spin7_not_acceptable_weilGroup` the last clause carries the content: r and η trivial satisfy every other clause, and g = 1 refutes the last; r trivial with η = sgn_(E/F) fails element conjugacy at any w with η(w) = −1, the central elements 1 and −1 of Spin₇(ℂ) not being conjugate. Finiteness of the image is a separate clause: an unramified homomorphism W_F → Spin₂(ℂ) ⊂ Spin₇(ℂ) sending an arithmetic Frobenius to an element of infinite order has the open kernel I_F and infinite image.
- `sumSquaresSeven` takes the value 1 at the basis vector e₁ and 7 at (1, …, 1); a form with the weights (1, …, 1, 0) would take the value 0 at e₇.
- `sumSquaresSeven` is isotropic over ℂ: its value at e₁ + i e₂ is 1 + i² = 0, so it is the split form of rank seven although it is written as a sum of squares, and `spinGroup sumSquaresSeven` is the complex group Spin₇(ℂ), not the compact Spin(7).
- The polar form of `sumSquaresSeven` at (e_i, e_j) is 2δ_ij, so the form is nondegenerate; with the weights (1, …, 1, 0) the vector e₇ would lie in the radical and square to 0 in the Clifford algebra, which would not be that of SO₇. Every nondegenerate quadratic form on ℂ⁷ is isometric to `sumSquaresSeven`, so the choice of form does not change the group up to isomorphism.

### 0.9 Chenevier's local factorization criterion

Let k be totally real and A a cuspidal automorphic representation of GL₇(𝔸_k), regular algebraic at every real place. Prove that the following are equivalent: for almost every place the Satake parameter of A lies in v(G₂(ℂ)); for every finite place u the Weil–Deligne parameter of A_u lifts to a G₂(ℂ)-valued parameter, unique up to G₂(ℂ)-conjugacy (C, Theorem E, p. 100; Corollary 6.8, pp. 150–151). Chenevier's statements use W_F × SU₂; translate them to W_F × SL₂(ℂ) keeping N. *Route:* Chenevier's group-theoretic classification of subgroups of SO₇ whose elements are conjugate into G₂, the Galois representation of A and local–global compatibility, Chebotarev density to pass from almost all Satake parameters to the image of the Galois representation, the uniqueness of the lift from §0.0 (as in C, proof of Theorem 6.4), then §0.4. *Needs:* §0.0, §0.4; AutomorphicGaloisRepresentationsPartII, AG2.2 and AG2.5; Chebotarev, Layer 10.

**Checks.**

- For a non-CM holomorphic newform f over ℚ with trivial character whose sixth symmetric power transfer A = Sym⁶ f is cuspidal, every Satake parameter of A is Sym⁶ of an element of SL₂(ℂ), which lies in v(G₂(ℂ)) because Sym⁶ restricted to the principal SL₂ of G₂ is v; both conditions hold and the local lift at a Steinberg place of f is the principal SL₂ parameter of G₂.
- The lift is unique up to G₂-conjugacy, not merely up to GL₇-conjugacy of the composite; by §0.4 these agree.
- For A the rank-seven transfer of a G₂ form with a Steinberg component, the local parameter at the Steinberg place is the principal SL₂ parameter, which lies in G₂ with v ∘ φ = Sym⁶.

### 0.10 Chenevier's G₂-valued Galois lift

For k and A as in §0.9 satisfying the almost-everywhere G₂ condition, a coefficient field E, a prime ℓ and λ | ℓ of E, prove that the semisimple Galois representation r_(A,λ) : Gal(k̄/k) → GL₇(Ē_λ) is v ∘ r̃ for a continuous semisimple r̃ : Gal(k̄/k) → G₂(Ē_λ), unique up to G₂(Ē_λ)-conjugacy (C, §§6.2–6.3, Theorem 6.4, pp. 147–148). Semisimple means that the identity component of the Zariski closure of the image is reductive. *Route:* Chenevier's condition (G) forces self-duality, the representation is attached by AG2.2, and Theorem 6.4 gives the lift, with uniqueness from §0.0 over Ē_λ. The local comparison of r̃ at ramified places and at places above ℓ is §3.15, not part of this statement. *Needs:* §0.0, §0.4; AutomorphicGaloisRepresentationsPartII, AG2.2.

**Checks.**

- If r_(A,λ) = v ∘ r̃ = v ∘ r̃′ then r̃ and r̃′ are G₂-conjugate; uniqueness up to GL₇-conjugacy alone would allow outer twists that §0.4 excludes.
- For a reducible semisimple r_(A,λ) = 1 ⊕ ρ ⊕ ρ∨ with ρ three-dimensional the lift is j ∘ ρ, matching §0.1.
- The statement is global: it gives no comparison of r̃ restricted to a decomposition group with any local parameter.

### Examples

- The subregular parameter: trivial on W_F, SL₂ through the principal SL₂ of SL₃. Then v ∘ φ = 1 ⊕ Sym² ⊕ Sym², s ∘ i ∘ φ = 1 ⊕ 1 ⊕ Sym² ⊕ Sym² and S_φ ≅ S₃ (§§0.1–0.3).
- The Steinberg parameter of G₂: v ∘ φ = Sym⁶, s ∘ i ∘ φ = 1 ⊕ Sym⁶, S_φ = 1.
- The pair (r, r′) of §0.8 on μ₄ × μ₄, and its pullback to W_ℚ₅ through ℚ₅× → μ₄ × μ₄, a local pair with one weak class and two parameter classes.
- The order-five torus element t of §0.0 and its square: equal image subgroups, different v-spectra, not conjugate.

### Dependencies

ExceptionalThetaCorrespondencesForG2, Layer 0 (§§0.1, 0.6–0.8); ClassicalGroups, §§6.2, 6.7; SpinRepresentations, Layers 2, 4, 5, 6; ClassFieldTheory, Layer 9; EndoscopicTransferAndUnitaryTraceComparison, §10.1; AutomorphicGaloisRepresentationsPartII, AG2.2 and AG2.5; Chebotarev, Layer 10; Mathlib `spinGroup`, `IsConj`, `QuadraticMap.weightedSumSquares`, `Matrix.charpoly`, `Representation.IsSemisimpleRepresentation`; Tau Ceti `TauCeti.Octonion`, `TauCeti.ClassFieldTheory.WeilGroup`, `CliffordAlgebra.spinToSpecialOrthogonal`, `CliffordAlgebra.spinDoubleCover`, `QuadraticMap.IsometryEquiv.spinGroupEquiv`, `TauCeti.spinRep`.

## Layer 1: Globalization with periods and Whittaker models

### 1.1 The spectrum detected by a quaternion period

An octonion algebra over a field K is an eight-dimensional unital K-algebra that is not assumed associative (a unital ring with a K-bilinear multiplication, as the `NonAssocRing` with compatible K-module structure of `TauCeti.Octonion K`) with a nondegenerate quadratic form n, its norm form, satisfying n(xy) = n(x) n(y); the split octonions `TauCeti.Octonion K` are one (`TauCeti.Octonion.norm_mul`). First prove three facts that fix the global setting of this layer.

(i) Over a field K of characteristic different from two, two octonion algebras are isomorphic exactly when their norm forms are isometric, and an octonion algebra whose norm form is isotropic is isomorphic to `TauCeti.Octonion K` (SpV, Theorems 1.7.1 and 1.8.1).

(ii) Let k be a number field. Every octonion algebra over k is split at every finite place v, that is, its scalar extension to k_v is isomorphic to `TauCeti.Octonion k_v`. The Cayley–Dickson double `TauCeti.CayleyDickson ℍ[k]` of the Hamilton quaternions ℍ[k] = (−1, −1)_k (Mathlib `Quaternion`) is an octonion algebra whose norm form, the sum of the quaternion norms of the two components, is x₁² + ⋯ + x₈², definite at every real place. Any two octonion algebras over k whose norm forms are definite at every real place are isomorphic. So the totally definite octonion algebra O over k exists, is unique up to isomorphism and is split at every finite place.

(iii) Let k be a number field, S a finite set of places of k and, for u ∈ S, D_u a quaternion algebra over k_u, with D_u ≅ ℍ (the Hamilton quaternions) when u is real. There is a quaternion subalgebra D ⊂ O with D ⊗_k k_u ≅ D_u for every u ∈ S; nothing is prescribed outside S. Every quaternion subalgebra of O is definite at every real place.

*Route:* for (i), an octonion algebra is the Cayley–Dickson double of a quaternion subalgebra, itself the double of a two-dimensional subalgebra; an isometry of norm forms is replaced step by step along these doublings by an algebra isomorphism, Witt's extension theorem (`QuadraticMap.IsometryEquiv.exists_extension`) carrying an anisotropic vector orthogonal to one subalgebra to a vector of the same norm orthogonal to its image, and the doubling formula making the extension multiplicative. If the norm form is isotropic, its restriction to the trace-zero part, the orthogonal complement of 1 (n is ⟨1⟩ ⊥ that restriction), represents −1, so some v of trace zero has v² = 1 and K[v] ≅ K × K; a quaternion subalgebra containing K[v] is M₂(K), whose norm form is hyperbolic, and the algebra is its double with some parameter c ∈ K×, of norm form n_(M₂(K)) ⊥ −c · n_(M₂(K)), again hyperbolic, as is that of `TauCeti.Octonion K`, and the first statement applies. For (ii), the norm form of an octonion algebra over k has rank eight, so it is isotropic at every finite place (`QuadraticForm.not_anisotropic_atFinitePlace_of_five_le_finrank`) and (i) splits the localization; at a real place a definite norm form takes the value n(1) = 1, so it is positive definite and isometric to x₁² + ⋯ + x₈². Two octonion algebras definite at every real place thus have norm forms isometric at every finite place (both split) and at every real place, hence over k by Hasse–Minkowski (GlobalQuadraticForms §6.3), and (i) gives the isomorphism. The norm of the double of ℍ[k] is multiplicative and is the sum of the quaternion norms of the two components (`TauCeti.CayleyDickson.normSq`, `TauCeti.CayleyDickson.normSq_def`). For (iii), let R consist of the real places, the finite u ∈ S with D_u a division algebra and, when these are odd in number, one further finite place outside S; GL2AutomorphicRepresentationsAndTransfer R17.1.5 (ramification realization) gives a quaternion algebra D over k nonsplit exactly at R (at a complex place every quaternion algebra is M₂(ℂ), so a complex u ∈ S imposes nothing). A quaternion algebra over a local field is determined up to isomorphism by whether it splits (over a nonarchimedean k_u the Brauer classes of order dividing two form a group of order two, `TauCeti.BrauerGroup.natCard_twoTorsion`; over ℝ the two algebras are M₂(ℝ) and ℍ), so D ⊗_k k_u ≅ D_u for u ∈ S. The Cayley–Dickson double of D, with the product of `TauCeti.CayleyDickson`, is an octonion algebra (SpV, §1.5) with norm form n_D ⊥ n_D, definite at every real place because D is; by (ii) it is isomorphic to O, and D ⊕ 0 is a quaternion subalgebra of it. Conversely, at a real place the norm form of a quaternion subalgebra is a subform of the positive definite norm form of O.

Let k be totally real, O the totally definite octonion algebra over k, G = Aut(O) and D ⊂ O a quaternion subalgebra, with pointwise stabilizer G_D (ExceptionalThetaCorrespondencesForG2, Layer 9, *Quaternion pointwise stabilizers*). Fix the quotient measure on G_D(k) \ G_D(𝔸_k). Define L²_D ⊂ L²(G(k) \ G(𝔸_k)) as the orthogonal complement of the closed span Z_D of all irreducible automorphic subrepresentations on whose smooth vectors the G_D-period vanishes identically (GS, §10.2, p. 28). Since G(k) \ G(𝔸_k) is compact, L² is a Hilbert direct sum of irreducibles with finite multiplicities and the periods are defined on smooth vectors.

- Orthogonal projection onto L²_D commutes with G(𝔸_k), its kernel is Z_D, and it identifies L²/Z_D with L²_D.
- Every irreducible automorphic subrepresentation contained in L²_D has a period not identically zero on its smooth vectors.
- Conjugating the embedding D ⊂ O by G(k) gives unitarily equivalent selected spectra.

**Checks.**

- The constant function has period equal to the volume of G_D(k) \ G_D(𝔸_k), which is nonzero, so the trivial representation lies in L²_D.
- Rescaling the quotient measure by a positive constant rescales every period and leaves Z_D and L²_D unchanged.
- In a multiplicity-two model V ⊕ V with period P(v₁, v₂) = P₀(v₁) + P₀(v₂) and P₀ ≠ 0, the zero-period copy is the antidiagonal and L²_D meets V ⊕ V in the diagonal copy; the first coordinate copy has nonzero period but is not contained in L²_D, so "nonzero period" does not characterize the copies contained in L²_D.
- Associativity fails in `TauCeti.Octonion K`, so the definition must not ask for it: for the top vectors u = ⟨0, 0, e₁, 0⟩, u′ = ⟨0, 0, e₂, 0⟩ and the bottom vector w = ⟨0, 0, 0, e₁⟩, (uu′)w = ⟨0, 0, 0, e₃⟩w = ⟨0, 0, −e₂, 0⟩ (the top entry is −e₃ × e₁ = −e₂), while u′w = 0 (its scalar entries are e₂ · e₁ = 0 and 0, its vector entries 0), so u(u′w) = 0. Read with an associative algebra the definition would admit no object, an associative unital algebra with a nondegenerate multiplicative quadratic form having dimension 1, 2 or 4.
- For (i): over ℝ the division octonions `TauCeti.DivisionOctonionReal`, with anisotropic norm form x₁² + ⋯ + x₈², and `TauCeti.Octonion ℝ`, with hyperbolic norm form of signature (4, 4), are not isomorphic, their norm forms having different signatures. An isometry of norm forms need not itself be an isomorphism: conjugation preserves the norm of ℍ but reverses products, conj(ij) = conj(k) = −k while conj(i) conj(j) = (−i)(−j) = k; statement (i) asserts that some isomorphism exists.
- For (ii): over ℚ the form x₁² + ⋯ + x₈² is isotropic at 2, since −7 ≡ 1 mod 8 is a square in ℚ₂ and 1² + ⋯ + 1² (seven terms) + (√−7)² = 0; it is anisotropic at the real place. Over ℚ there are exactly two octonion algebras, the definite one and `TauCeti.Octonion ℚ`, distinguished only at the real place. Definiteness at every real place cannot be weakened to one real place: over k = ℚ(√2), with c = −(1 + √2), the double of ℍ[k] with parameter c has norm form ⟨1, 1, 1, 1⟩ ⊥ (−c)⟨1, 1, 1, 1⟩, definite at the place where c ↦ −1 − 1.414… < 0 and indefinite at the place where c ↦ −1 + 1.414… > 0, so it is not isomorphic to O.
- For (iii): over k = ℚ with S = {p}, D_p a division algebra, the nonsplit set {p, ∞} is even and D is the definite quaternion algebra ramified at p; with S = {p, p′}, both D_p and D_p′ division, the set {p, p′, ∞} is odd and D ramifies at one further prime outside S, which the statement allows; with S = {2}, D_2 = M₂(ℚ₂), one may take D = (−1, −3)_ℚ, whose Hilbert symbols are −1 at 3 and at ∞ and +1 at 2. A real place cannot be prescribed M₂(ℝ): its norm form, the determinant, has signature (2, 2) and is not a subform of the positive definite norm form of O there.

*Needs:* for (i)–(iii), GlobalQuadraticForms §6.3; GL2AutomorphicRepresentationsAndTransfer R17.1.5; Tau Ceti `TauCeti.Octonion`, `TauCeti.CayleyDickson`, `QuadraticForm.not_anisotropic_atFinitePlace_of_five_le_finrank`, `QuadraticMap.IsometryEquiv.exists_extension`, `TauCeti.BrauerGroup.natCard_twoTorsion`; Mathlib `Quaternion`. For L²_D, ExceptionalThetaCorrespondencesForG2, Layer 9 (*Quaternion pointwise stabilizers*); AutomorphicFormsOnReductiveGroups, Layer 0 (the adelic quotient and automorphic forms) and Layer 4, §4.2 (the discrete decomposition of the compact quotient with its automorphic realizations).

### 1.2 The fixed-supercuspidal generic spectrum

For a split simple group G over a number field k, a nondegenerate global Whittaker character ψ, a finite place w and a generic supercuspidal σ of G(k_w), define L²_(ψ,σ) as the orthogonal complement, inside the σ-isotypic part at w of the cuspidal spectrum, of the closed span of the irreducible cuspidal subrepresentations on which the global ψ-Whittaker functional vanishes (GS, §10.3, p. 29). No multiplicity-one theorem is assumed; the Hilbert sum keeps the automorphic multiplicity spaces.

- Every irreducible subrepresentation contained in L²_(ψ,σ) is cuspidal, has nonzero global ψ-Whittaker coefficient, and has local component σ at w.
- Projection onto L²_(ψ,σ) commutes with G(𝔸_k); its kernel in the σ-isotypic cuspidal part is the zero-Whittaker span.
- Conjugating ψ by the adjoint torus transports L²_(ψ,σ) and its constituent conditions.

**Checks.**

- A generic cuspidal representation whose component at w is not isomorphic to σ (for instance an unramified twist of σ by a nontrivial unramified character when that twist is inequivalent) is excluded: the selection is by isomorphism class, not inertial class.
- A nongeneric cuspidal representation with component σ at w is excluded.
- In a multiplicity-two model V ⊕ V with Whittaker functional W(v₁, v₂) = W₀(v₁) + W₀(v₂), W₀ ≠ 0, the selected copy is the diagonal; taking the whole σ-isotypic component would also include the antidiagonal copy with zero coefficient.

*Needs:* AutomorphicFormsOnReductiveGroups, Layer 0 and Layer 4, §§4.2–4.3 (cusp forms, cuspidal realizations and global Whittaker coefficients); SmoothRepresentationsOfLocalGroups, SR.2.3 (local Whittaker functionals and genericity of σ).

### 1.3 Poincaré series and weak containment

Prove: (a) in the setting of §1.1, for a finite set S of places of k, finite or real, and irreducible representations δ_v (v ∈ S) of G(k_v) that are summands of L²(G_D(k_v) \ G(k_v)), there is a finite place z ∉ S such that ⊗_(v∈S) δ_v is weakly contained in the restriction to G(k_S) = ∏_(v∈S) G(k_v) of the closed subspace of L²_D of vectors fixed by a hyperspecial subgroup at every finite place outside S ∪ {z}; (a′) if moreover k has a real place outside S, the conclusion of (a) holds with no place z; (b) in the setting of §1.2, with G split, for a finite set S of places not containing w, finite or archimedean, and irreducible δ_v (v ∈ S) that are summands of the Whittaker space L²(N(k_v) \ G(k_v), ψ_v) of functions with f(ng) = ψ_v(n) f(g) for n in the unipotent radical N(k_v) of a Borel subgroup, there is a finite place z ∉ S ∪ {w} such that ⊗_(v∈S) δ_v is weakly contained in the restriction to G(k_S) of the closed subspace of L²_(ψ,σ) of vectors fixed by a hyperspecial subgroup at every finite place outside S ∪ {w, z}; (b′) if moreover k has an archimedean place outside S, the conclusion of (b) holds with no place z; (c) for a totally real k, a central division algebra D of degree three over k, H = Aut(D) the automorphism group of D as a Jordan algebra (its identity component is PD×, anisotropic over k, so H(k) \ H(𝔸_k) is compact; H(k_v) is PD_v× where D_v is a division algebra and PGL₃(k_v) ⋊ ℤ/2 where D_v is split, as at every real place), a cubic subfield e ⊂ D with pointwise stabilizer H_e ⊂ H (H_e(k_v) = (e ⊗_k k_v)×/k_v× where D_v is a division algebra), L²_e ⊂ L²(H(k) \ H(𝔸_k)) the orthogonal complement of the closed span of the irreducible subrepresentations on whose smooth vectors the H_e-period vanishes, S the set of places where D ramifies (finite, nonempty, and consisting of finite places) and irreducible δ_v (v ∈ S) that are summands of L²(H_e(k_v) \ H(k_v)), there is a finite place z ∉ S such that ⊗_(v∈S) δ_v is weakly contained in the restriction to H(k_S) of the closed subspace of L²_e of vectors fixed by a maximal compact subgroup of H(k_u) at every real place u and by a hyperspecial subgroup at every finite place outside S ∪ {z} (GS, proofs of Propositions 10.5 and 10.7, pp. 28–30; SV, Theorem 16.3.2 and Remark 16.4.1; ILM, proof of Proposition 4.5, pp. 19–20, for the arrangement of (a′) and (b′); GF, §2.8, p. 7, and proof of Lemma 2.5, p. 8, for the globalizations that (a′) and (c) give). *Route:* the Poincaré-series construction of Sakellaridis–Venkatesh, with the separating test function at the place z, for (a′) a test function of small support at a real place outside S, where G is compact, and for (b′) one at an archimedean place outside S; in (c) the test functions at the real places are bi-invariant under a maximal compact subgroup and the separation is at z. *Needs:* §§1.1–1.2; AutomorphicFormsOnReductiveGroups, Layers 0 and 4 and the poincare-weak-containment contract; SmoothRepresentationsOfLocalGroupsPartII, SRU.1.1.

**Checks.**

- Weak containment does not give convergence along a subsequence of distinct summands: in St ⊕ ⨁_(n≥1) 1 the multiplicity of St is 1 and its multiplicity among the trivial summands is 0, so no subsequence of the trivial summands converges to St although St is weakly contained; what isolation gives (SRU.1.10) is an actual occurrence, here the one copy of St, and §§1.4 and 1.6 use it in that form.
- Weak containment does not give an occurrence without isolation: the trivial representation of ℝ is weakly contained in the regular representation L²(ℝ), whose subspace of invariant vectors is zero.
- At S = ∅ statement (a) is the weak containment of the trivial representation of the trivial group G(k_∅), witnessed by the constant function, which is fixed by every hyperspecial subgroup.
- The two instances use different local spaces: if ψ_v(n) = −1 and f(1) = 1, a Whittaker function has f(n) = ψ_v(n) f(1) = −1, whereas a function on the untwisted quotient N(k_v) \ G(k_v) has f(n) = f(1) = +1. Statement (b) is for the twisted space and the selected space L²_(ψ,σ) with σ fixed at w, statement (a) for the untwisted quotient by G_D.
- The extra place in (a), (b) and (c) is genuine: the conclusion allows #({z} ∖ S) = 1 and does not say that every finite place outside S ∪ {w} is spherical. Statements (a′) and (b′) dispense with z only when an archimedean place carries no prescription: in (a′) when S consists of finite places (k totally real has a real place), in (b′) for instance for a totally complex k with S finite.
- In (c) the groups H(k_v), v ∈ S, are the compact groups PD_v×, so an irreducible δ_v is finite-dimensional and is a summand of L²(H_e(k_v) \ H(k_v)) exactly when it has a nonzero H_e(k_v)-fixed vector; the trivial representation qualifies for every e (the constant function), whereas a character of PD_v× nontrivial on the image of (e ⊗ k_v)× does not. The real places impose sphericity, not a prescribed component; there H(k_u) = PGL₃(ℝ) ⋊ ℤ/2 is not compact, and no small-support separation is available at u without losing the fixed vectors of the maximal compact subgroup, which is why (c) keeps the place z.

### 1.4 Globalization with a nonzero quaternion period

For a nonempty finite set S of places of a totally real k, prescribe for each finite u ∈ S a representation π_u of split G₂(k_u) that is either supercuspidal with nonzero theta lift to PGSp₆ or the Steinberg representation, and for each real u ∈ S an irreducible representation π_u of the compact G₂(k_u). Prove: (i) there are a quaternion subalgebra D of the totally definite octonion algebra O over k, a finite place z ∉ S and an automorphic representation Π of Aut(O) with Π_u ≅ π_u for every u ∈ S, spherical at every finite place outside S ∪ {z}, and with nonzero G_D-period (GS, Proposition 10.5 and proof, pp. 28–29; that proposition allows real places in S and asserts nothing outside S); (ii) if k has a real place outside S (for instance if S consists of finite places), D and Π can be taken with Π spherical at every finite place outside S (GF, §2.8, p. 7, uses a globalization of this form). *Route:* choose local quaternion algebras D_u with π_u a summand of L²(G_D_u \ G₂(k_u)) for u ∈ S (ExceptionalThetaCorrespondencesForG2, Layer 9: supercuspidal relative embeddings, the Steinberg relative summand and the SU₂-periods of compact real G₂), globalize D inside O with D ⊗_k k_u ≅ D_u for u ∈ S (§1.1(iii)), the embeddings of D_u in O ⊗_k k_u being conjugate under Aut(O ⊗_k k_u) so that G_D(k_u) is conjugate to the chosen local stabilizer (ExceptionalThetaCorrespondencesForG2, Layer 9, *Quaternion pointwise stabilizers*), apply §1.3(a), respectively §1.3(a′) for (ii), and the isolated-summand theorem (SRU.1.10): supercuspidals and the Steinberg representation are isolated in the unitary dual at the finite places of S (SRU.4.7–SRU.4.8, G₂ having split rank two), and every irreducible representation of the compact G₂(k_u) is isolated at the real places, the unitary dual of a compact group being discrete. *Needs:* §1.1 (the algebra O and its quaternion subalgebras), §1.3; ExceptionalThetaCorrespondencesForG2, Layer 9; SmoothRepresentationsOfLocalGroupsPartII, SRU.1.10, SRU.4.7, SRU.4.8.

**Checks.**

- The hypothesis S ≠ ∅ excludes only a degenerate case, not a false one: with S = ∅ the conclusion holds with Π the trivial representation, spherical everywhere and with G_D-period equal to the volume of G_D(k) \ G_D(𝔸_k), which is nonzero (§1.1, Checks), and nothing is prescribed.
- Conclusion (i) accepts one finite place z ∉ S with a component that need not be spherical, #({z} ∖ S) = 1, as in §1.3(a); the consumers §§3.1 and 6.4 use only the components at S, the period and the cuspidality criteria of ExceptionalThetaCorrespondencesForG2, Layer 10. The uniqueness argument of §3.11 needs (ii): with a place z left open, two families of factors with ratio R would satisfy only R_π R_z = 1, which R_π = 2, R_z = 1/2 solves.
- Statement (ii) needs a real place outside S: over k = ℚ with S = {p, ∞}, a prescribed finite place and the real place, no archimedean place is left for the separation and only (i) is available; over ℚ with S = {p, p′} the real place is free and (ii) applies.
- The real components need not be regular here; regularity enters only in the cuspidality criterion of ExceptionalThetaCorrespondencesForG2, Layer 10.
- O is over k (definite at every real place, split at every finite place); a local octonion algebra over F has no real places to prescribe.

### 1.5 Relative isolation for generic G₂ discrete series

Let δ be a generic discrete series of G₂(F) whose PGSp₆ theta lift is a discrete series, and σ a generic supercuspidal of G₂ at a second place whose PGSp₆ lift is supercuspidal. Prove that δ is isolated among the irreducible representations of G₂(F) occurring as local components of the globally generic cuspidal spectrum with fixed component σ (GS, Lemma 10.8 and proof, p. 30). *Route:* a convergent family in that set consists of generic standard modules (SRU.3.8); the explicit lift tables transport the family and its limit to PGSp₆, where generic discrete series are isolated in the corresponding globally generic family (relative-generic-isolation contract), and Howe duality returns to G₂. *Needs:* §1.2; ExceptionalThetaCorrespondencesForG2, Layer 8 (explicit lift tables, three Howe theorems) and Layer 10 (generic global nonvanishing); SmoothRepresentationsOfLocalGroupsPartII, SRU.3.8, SRU.3.10, and the relative-generic-isolation contract; SmoothRepresentationsOfLocalGroups, SR.2.

**Checks.**

- The hypothesis that θ(δ) is discrete excludes π_gen[1], the generic member of the subregular fibre, whose PGSp₆ lift is a constituent of a Siegel-induced representation (§5.5).
- Isolation in the tempered dual (SRU.3.10) is not this statement: the relative family may contain nontempered unitary representations.
- For δ = St_G₂ the statement follows from SRU.4.7 directly, since Steinberg is isolated in the whole unitary dual when the split rank is at least two, as for G₂.

### 1.6 Globalization of isolated generic discrete series

Let G be a split simple group over a number field k, ψ, w and σ as in §1.2, and S a finite set of places of k not containing w, finite or archimedean. For v ∈ S let δ_v be a ψ_v-generic square-integrable representation of G(k_v) that is isolated, for the Fell topology, in the set of local components at v of the irreducible subrepresentations of L²_(ψ,σ). Prove: (i) there are an irreducible cuspidal Π ⊂ L²_(ψ,σ) with Π_v ≅ δ_v for v ∈ S and Π_w ≅ σ, and a finite place z ∉ S ∪ {w}, such that Π is spherical at every finite place outside S ∪ {w, z} (GS, Proposition 10.7 and proof, pp. 29–30); (ii) if k has an archimedean place outside S, Π can be taken spherical at every finite place outside S ∪ {w}. *Route:* §1.3(b), respectively §1.3(b′), and the isolated-summand theorem SRU.1.10 applied to ⊗_(v∈S) δ_v, which is isolated in the set of restrictions to G(k_S) because each factor is isolated at its place: the unitary dual of G(k_S) is the product of the unitary duals of the G(k_v) with the product Fell topology, the finite-product Fell-dual input of SRU.1.10. *Needs:* §1.2, §1.3; SmoothRepresentationsOfLocalGroupsPartII, SRU.1.7, SRU.1.10.

For G = G₂ or PGSp₆ the hypotheses at v ∈ S are met as follows, and only these instances are used below. At a finite place: the Steinberg representation (SRU.4.7, the split ranks being two and three); for G₂, a generic discrete series δ_v with θ(δ_v) a discrete series of PGSp₆ when σ is a generic supercuspidal with supercuspidal PGSp₆ lift (§1.5); for PGSp₆, a generic discrete series δ_v when σ is supercuspidal (relative-generic-isolation contract). At a real place: a ψ_v-generic discrete series whose infinitesimal character Λ_v satisfies ⟨Λ_v, α∨⟩ > max(C, C′) for every positive root α, where C is the constant of the regular-real-unitarity contract and C′ that of the regular-real-isolation contract; the latter gives isolation in the whole unitary dual, hence in the set of local components, and the existence of a ψ_v-generic member with infinitesimal character Λ_v. *Needs:* §1.5; SmoothRepresentationsOfLocalGroupsPartII, SRU.4.7 and the relative-generic-isolation contract; AutomorphicFormsOnReductiveGroups, Layer 2 (§2.4) and the regular-real-unitarity and regular-real-isolation contracts.

**Checks.**

- Statement (i) allows one uncontrolled finite place z, and (ii) none when an archimedean place is free; §2.4 uses (ii) over a totally complex field, where every archimedean place is free because S consists of finite places.
- Steinberg satisfies the isolation hypothesis at a finite place because the split rank of G₂ and of PGSp₆ is at least two (SRU.4.7). For PGL₂, of split rank one, complementary series approach the Steinberg representation in the unitary dual, SRU.4.7 does not apply, and isolation would have to be shown within the automorphic family.
- Genericity at a real place is a separate hypothesis from distance to the walls: for SL₂(ℝ) and a nondegenerate character ψ of the upper unipotent subgroup, one of the two discrete series D_k^± has zero ψ-Whittaker space and the other a one-dimensional one, for every k ≥ 2, so for infinitesimal characters Λ with ⟨Λ, α∨⟩ = k − 1 arbitrarily far from the wall; the first can never be the real component of a globally ψ-generic Π.
- Distance from the walls is needed for isolation at a real place: for SL₂(ℝ) the discrete series D_k^± with k ≥ 3, where ⟨Λ, α∨⟩ = k − 1 ≥ 2, are isolated in the unitary dual, whereas D₂^±, with ⟨Λ, α∨⟩ = 1, are limits of the complementary series as its parameter tends to the reducible endpoint whose constituents are D₂^+, D₂^− and the trivial representation.
- Without the fixed supercuspidal at w the selected family of §1.2 is not defined.

### 1.7 Globalization of PGSp₆ discrete series with spin-regular weights

Let σ be a discrete series of PGSp₆(F), k a totally real field with a finite place v₀ such that k_v₀ ≅ F, and v₁ ≠ v₀ a finite place. Prove that there is a cuspidal Σ of PGSp₆(𝔸_k) with Σ_v₀ ≅ σ, Σ_v₁ ≅ St, a generic cohomological discrete series with spin-regular parameter at every real place, and components at every other finite place that are unramified up to a quadratic twist (GS, Lemma 12.4 and proof, p. 37; Shin, Definition 3.5, author PDF p. 14; Corollary 4.12, author PDF p. 24; Theorem 5.8, author PDF pp. 26–27). *Route:* apply the Plancherel density theorem with positive-measure atoms {σ} and {St} at v₀ and v₁ along the weights λ_t = t(8, 4, 2), t ≥ 1, at every real place: the coordinate sum 14t is even, so λ_t is in the root lattice of PGSp₆; with ρ = (3, 2, 1) the infinitesimal character h = λ_t + ρ = (8t+3, 4t+2, 2t+1) satisfies h₁ > h₂ + h₃ and h₂ > h₃ > 0, so the eight spin weights (±h₁ ± h₂ ± h₃)/2 are distinct (in any signed difference the largest nonzero coordinate dominates the others); every positive-root pairing of λ_t tends to infinity, as Shin's Definition 3.5 requires. The Steinberg component makes the global Sp₆-parameter generic, a single cuspidal representation of GL₇, with trivial global component group (symplectic-steinberg-generic-parameter contract); Xu's multiplicity formula changes the real components to generic members of their packets without changing the parameter; a global quadratic character corrects v₀ and v₁ simultaneously. *Needs:* AutomorphicSpectralTheory, automorphic-plancherel-density contract; ModularityAndLanglandsExtensions §§3.17, 3.19, 3.27 and the symplectic-steinberg-generic-parameter contract.

**Checks.**

- At t = 1, h = (11, 6, 3) and the spin weights are 10, 7, 4, 1, −1, −4, −7, −10, all distinct.
- At t = 0, h = ρ = (3, 2, 1) has h₁ = h₂ + h₃, and the spin weights (3 − 2 − 1)/2 and (−3 + 2 + 1)/2 coincide at 0: the weight ρ itself is not spin-regular, so t ≥ 1 is needed.
- The prescribed σ is a discrete series: Plancherel atoms of positive measure exist only for discrete series, so the statement does not globalize arbitrary irreducibles.
- Shin's Theorem 5.8 alone gives discrete series at infinity with no control of spin regularity; the explicit sequence λ_t is what provides it.

### Examples

- The constant function in L²_D (§1.1) and the multiplicity-two models of §§1.1–1.2.
- The totally definite octonion algebra over ℚ: the Cayley–Dickson double of ℍ[ℚ], with norm form x₁² + ⋯ + x₈², split at every prime (§1.1(ii)); for S = {p, p′} with both local algebras prescribed division, its quaternion subalgebra D of §1.1(iii) ramifies at a third prime as well as at p, p′ and ∞.
- The globalization of St_G₂ at one place of ℚ with a compact real component (§1.4), whose global exceptional lift is cuspidal by the Steinberg criterion of ExceptionalThetaCorrespondencesForG2, Layer 10.

### Dependencies

AutomorphicFormsOnReductiveGroups, Layers 0, 2 (§2.4) and 4 and the poincare-weak-containment, regular-real-unitarity and regular-real-isolation contracts; AutomorphicSpectralTheory, Layer 6; ModularityAndLanglandsExtensions §§3.17, 3.19, 3.27 and the symplectic-steinberg-generic-parameter contract; SmoothRepresentationsOfLocalGroups, SR.2; SmoothRepresentationsOfLocalGroupsPartII, SRU.1, SRU.3, SRU.4; ExceptionalThetaCorrespondencesForG2, Layers 8–10; GlobalQuadraticForms §6.3; GL2AutomorphicRepresentationsAndTransfer R17.1.5; Tau Ceti `TauCeti.Octonion`, `TauCeti.CayleyDickson`, `QuadraticForm.not_anisotropic_atFinitePlace_of_five_le_finrank`, `QuadraticMap.IsometryEquiv.exists_extension`, `TauCeti.BrauerGroup.natCard_twoTorsion`; Mathlib `Quaternion`.

## Layer 2: Triality and the generic spin transfer

### 2.0 Parameters of all irreducible representations of Sp₆ and split SO₈

Let G be Sp₆ or split SO₈ over F, with dual group SO₇(ℂ), respectively SO₈(ℂ). By the Langlands classification (SmoothRepresentationsOfLocalGroups, SR.3.3) every irreducible representation σ of G(F) is the unique irreducible quotient of a standard module: the normalized induction from a standard parabolic subgroup P = MN, with M ≅ GL_(n₁) × ⋯ × GL_(n_r) × G₀ and G₀ a split group of the same type and smaller rank (possibly trivial), of τ₁|det|^(ν₁) ⊗ ⋯ ⊗ τ_r|det|^(ν_r) ⊗ τ₀, with τ₁, …, τ_r, τ₀ irreducible tempered and ν₁ > ⋯ > ν_r > 0, these data being unique up to conjugacy. Define the parameter of σ as the class of

    φ_σ = ⨁_i ((rec(τ_i) ⊗ |·|^(ν_i)) ⊕ (rec(τ_i) ⊗ |·|^(ν_i))∨) ⊕ φ₀,

φ₀ the bounded parameter of the tempered packet of G₀(F) containing τ₀ (ModularityAndLanglandsExtensions §3.15(c)), read through the dual Levi subgroup GL_(n₁)(ℂ) × ⋯ × GL_(n_r)(ℂ) × Ĝ₀(ℂ) of the dual group and taken up to SO₇(ℂ)-conjugacy for Sp₆, and up to O₈(ℂ)-conjugacy for SO₈ (even-orthogonal outer orbits). GS uses this parametrization on all of Irr(Sp₆) (GS, Main Theorem (iv)(b), pp. 3–4; Theorem 12.3, p. 36). Prove the following.

- φ_σ depends only on the isomorphism class of σ, and on a tempered σ (P = G) it is the parameter of the tempered packet of §3.15(c) containing σ.
- φ_σ is constant on PGSp₆(F)-orbits for Sp₆ and on GO₈(F)-orbits for SO₈, GO₈ the group of orthogonal similitudes acting by conjugation (these orbits contain the O₈(F)-orbits and the orbits under conjugation by GSO₈(F), that is by PGSO₈(F), which §2.2 uses): conjugation by an element normalizing M fixes the general linear data up to isomorphism and carries τ₀ into the same tempered packet, the stable character identity (a) of §3.15 that characterizes the packets being invariant under it.
- Each fibre of σ ↦ φ_σ is finite; when φ is unbounded and generic (its packet has a Whittaker-generic member), every σ with φ_σ = φ is an irreducible standard module (ModularityAndLanglandsExtensions §3.25).
- For σ the spherical constituent of the unramified principal series with Satake parameter s, φ_σ is unramified, trivial on SL₂(ℂ), with arithmetic Frobenius mapped to the class of s.

**Checks.**

- The trivial representation of Sp₆(F) is the Langlands quotient of the Borel standard module with exponent ρ = (3, 2, 1), with r = 3, every τ_i trivial and G₀ trivial: φ = |·|³ ⊕ |·|² ⊕ |·| ⊕ 1 ⊕ |·|⁻¹ ⊕ |·|⁻² ⊕ |·|⁻³, trivial on SL₂(ℂ), with arithmetic-Frobenius eigenvalues q^(−3), …, q³ and N = 0, which is v ∘ L(1) of §3.2. A definition keeping only the tempered datum φ₀ would give it the one-dimensional parameter of the trivial group Sp₀.
- St_Sp₆ is tempered (r = 0) with parameter Sym⁶, the principal SL₂ of SO₇(ℂ): the same Frobenius-semisimple part as the trivial representation and N ≠ 0. A definition reading the parameter off the cuspidal support alone would give St_Sp₆ and the trivial representation the same parameter. The value Sym⁶ comes from the classical-discrete-packets and classical-packets-cuspidal-support contracts: St_Sp₆ is square-integrable, so its parameter φ is discrete; its supercuspidal support is the character (|·|³, |·|², |·|) of the diagonal torus, so φ restricted along w ↦ (w, diag(|w|^(1/2), |w|^(−1/2))) is |·|^(±3) ⊕ |·|^(±2) ⊕ |·|^(±1) ⊕ 1; in a discrete φ = ⨁_i ρ_i ⊠ S_(a_i) with this restriction every ρ_i is an unramified character (the restriction is a sum of unramified characters), self-dual with real exponent, hence trivial (the unramified quadratic character is not of the form |·|^x with x real), so every a_i is odd (1 ⊠ S_a is orthogonal only for odd a) and the a_i are distinct; each segment (a_i − 1)/2, …, −(a_i − 1)/2 contains the exponent 0, which occurs once, so φ = 1 ⊠ S₇ = Sym⁶.
- The trivial representation of split SO₈(F) has exponent ρ = (3, 2, 1, 0); the zero coordinate belongs to the tempered datum on G₀ = SO₂, and φ = |·|^(±3) ⊕ |·|^(±2) ⊕ |·|^(±1) ⊕ 1 ⊕ 1, of dimension 6 + 2 = 8, an O₈(ℂ)-class fixed by the outer automorphism.
- The exponents enter with both signs: dropping the dual summands would give the trivial representation of Sp₆(F) a parameter of dimension 3 + 1 = 4, not 7.

*Needs:* SmoothRepresentationsOfLocalGroups, SR.3.3; ModularityAndLanglandsExtensions §§3.15, 3.25 and, for the Steinberg Check, the classical-discrete-packets and classical-packets-cuspidal-support contracts; EndoscopicTransferAndUnitaryTraceComparison §10.30; ExceptionalThetaCorrespondencesForG2, Layer 0 (*Complex local parameters*).

### 2.1 The three triality maps over F

For split D₄ over F define f₁ : SO₈ → PGSO₈ as the natural central isogeny and f₂, f₃ as its two companions obtained by composing with the triality automorphism, so that the dual maps of f₁, f₂, f₃ identify the vector representation and the two half-spin representations of Spin₈(ℂ) (GS, §4.1, pp. 16–17). Construct them from `TauCeti.D4Tripled.trialityAutomorphism`, compared with the split simply connected D₄ over F, by descent to the three central quotients of order two.

- The triality automorphism cycles f₁, f₂, f₃; its cube is the identity.
- The dual of f₁ is the vector representation of Spin₈(ℂ) and the duals of f₂, f₃ are the two half-spin representations.
- The maps commute with extension of characteristic-zero fields.
- The similitude character of PGSO₈ modulo squares pulls back along f₁ to the trivial character of SO₈(F) and along f₂ or f₃ to the spinor-norm character of SO₈(F).

**Checks.**

- The three eight-dimensional representations of Spin₈(ℂ) have three distinct central kernels of order two in Z(Spin₈) ≅ μ₂ × μ₂.
- Restricted to Spin₇(ℂ), the dual of f₁ is 1 ⊕ q and the duals of f₂, f₃ are both s (§0.1); a construction giving 1 ⊕ q for f₂ is the vector map again.
- Applying the cycle three times returns each f_i, by `TauCeti.D4Tripled.trialityAutomorphism_pow_three`.
- A complex diagram automorphism alone does not define the f_i over F: the central quotients must be F-rational, which the integral automorphism provides.

*Needs:* Tau Ceti `TauCeti.D4Tripled.trialityAutomorphism`; ReductiveGroups, Layer 9; SpinRepresentations, Layer 8; OrthogonalSpinGroups, Layers 1–2 (spinor norm).

### 2.2 The local spin lift of generic PGSp₆ representations

For generic irreducible σ of PGSp₆(F), take its nonzero similitude theta lift to PGSO₈(F) (MetaplecticAutomorphicForms §3.41), pull it back along f₂, choose an irreducible constituent of the restriction to SO₈(F) modulo the even-orthogonal outer automorphism, and apply Arthur's local correspondence for split SO₈ followed by the inclusion into GL₈ and the correspondence for GL₈. Define SpinLift(σ) as the resulting irreducible representation of GL₈(F) (GS, §§4.2–4.3, p. 17). Prove that it is independent of the constituent (the constituents form one orbit under conjugation by GSO₈(F), on which the parameter of §2.0 is constant) and of the choice of f₂ or f₃.

- At an unramified generic σ the Satake class of SpinLift(σ) is s applied to the Spin₇ Satake class of σ.
- The lift of a generic tempered σ is tempered.
- The parameter of SpinLift(σ) is the standard parameter of the triality-transformed orthogonal parameter.

**Checks.**

- For the unramified tempered σ whose parameter is trivial on W_F and SL₂, the eight Satake eigenvalues of SpinLift(σ) are all 1.
- Multiplying an unramified Spin₇ parameter by the central −1 at Frobenius multiplies each of the eight spin eigenvalues by −1 and leaves the seven standard eigenvalues unchanged; at the trivial parameter this turns eight eigenvalues 1 into eight eigenvalues −1 while the standard eigenvalues stay 1, so SpinLift is not determined by the standard data of σ.
- SpinLift(σ) has rank eight, whereas the standard transfer of σ to GL₇ has rank seven.

*Needs:* §2.0, §2.1, §0.1; MetaplecticAutomorphicForms §§3.34, 3.41; ModularityAndLanglandsExtensions §3.15; EndoscopicTransferAndUnitaryTraceComparison §10.30.

### 2.3 The global isobaric spin transfer

For a cuspidal Σ of PGSp₆(𝔸_k) with nonzero cuspidal similitude theta lift to PGSO₈, define SpinLift(Σ) as the isobaric automorphic representation of GL₈(𝔸_k) obtained by pulling back along f₂ and applying Arthur's global standard transfer of an automorphic constituent (GS, §4.3, pp. 17–18; §5.2, p. 21). Prove that it is independent of the constituent: the constituents are nearly equivalent, and an isobaric representation of GL₈(𝔸_k) is determined by almost all of its Satake classes (AL.3). Prove that, when the global Arthur parameter Ψ of these constituents is generic (ModularityAndLanglandsExtensions §3.8: every b_i = 1), the component of SpinLift(Σ) at every finite place v where Σ_v is generic is the local SpinLift(Σ_v), and its component at every complex place v where Σ_v is generic has the parameter s ∘ φ_v, φ_v the Langlands parameter of Σ_v. *Route:* the component at v of a constituent is a constituent of the pullback along f₂ of the local lift θ(Σ_v) (Howe duality, MetaplecticAutomorphicForms §3.34) and lies in the packet of the localization Ψ_v (§3.17). Ψ is an isobaric sum of distinct unitary self-dual cuspidal representations of orthogonal type with trivial total central character, hence by the image statement of ModularityAndLanglandsExtensions §5.1 the transfer of a globally generic cuspidal representation of split SO₈(𝔸_k), whose global Arthur parameter is Ψ by isobaric strong multiplicity one (AL.3) and whose component at v is a Whittaker-generic member of the packet of Ψ_v (§3.17); so Ψ_v is generic in the sense of §3.25. That packet is the tempered L-packet of Ψ_v when Ψ_v is bounded (§3.15) and consists of irreducible standard modules with L-parameter Ψ_v when it is unbounded (§3.25, at finite and archimedean places); in both cases the parameter of the component (§2.0 at a finite place, the archimedean correspondence of AutomorphicFormsOnReductiveGroups §2.5 at a complex place) is Ψ_v. At a finite place this is the parameter of SpinLift(Σ_v) (§2.2); at a complex place it is s ∘ φ_v (pgsp6-pgso8-complex-theta contract).

- The unramified spin Satake classes determine SpinLift(Σ) (isobaric strong multiplicity one).
- The global Arthur parameter of SpinLift(Σ) is orthogonal with trivial determinant.
- When Ψ is generic, the component of SpinLift(Σ) at a finite or complex place where Σ is generic is read from the local theta construction at that place, at the complex places through the Adams–Barbasch matching of the pgsp6-pgso8-complex-theta contract.

**Checks.**

- For Σ the cuspidal theta lift of a G₂ form, the spin Satake polynomial at each unramified place has a factor X − 1 (§0.1), and SpinLift(Σ) = 1 ⊞ A with A of rank seven, which is not cuspidal.
- The ranks of the isobaric summands add up to eight.
- A definition requiring SpinLift(Σ) to be cuspidal would reject the case 1 ⊞ A; cuspidality is proved separately under extra hypotheses (§8.2).
- The genericity of Ψ is a hypothesis of the local statement, not a consequence of the genericity of Σ_v: the component of SpinLift(Σ) at v has the L-parameter attached to the localization Ψ_v (its value at (w, diag(|w|^(1/2), |w|^(−1/2)))), whereas the component of a constituent need only lie in the packet of Ψ_v, and when Ψ has a summand μ ⊠ ν_b with b ≥ 2 a member of that packet need not have that L-parameter (§3.11, Checks). In §5.3 (parameter 1 ⊞ A, A cuspidal) and §8.2 (a single cuspidal summand) every b_i = 1; in §§2.4 and 5.2 the second statement below supplies the hypothesis.

*Needs:* §2.0, §2.2; ModularityAndLanglandsExtensions §§3.8, 3.15, 3.17, 3.25, 5.1; AutomorphicLFunctionsAndLocalFactors, AL.3 (isobaric strong multiplicity one); AutomorphicFormsOnReductiveGroups §2.5 (archimedean parameters); MetaplecticAutomorphicForms §§3.34, 3.41 and the pgsp6-pgso8-complex-theta contract.

Prove that the hypothesis of the definition holds for every globally generic cuspidal Σ of PGSp₆(𝔸_k), k a number field, that has a finite place u with Σ_u ≅ St: the global similitude theta lift of Σ to split PGSO₈ is nonzero and cuspidal, and its local component at every place v is the local similitude lift of Σ_v, so that SpinLift(Σ) is defined; and the global Arthur parameter of the constituents of its pullback along f₂ is generic, so that the first statement applies at every finite place and every complex place (GS, proof of Proposition 4.1(i), p. 18, where nonvanishing is read from the global genericity of the lift; GS, Lemma 12.5 and proof, pp. 37–38, for the route below). *Route:* every Σ_v is generic, so its local similitude lift to split PGSO₈(k_v) is nonzero at every place (MetaplecticAutomorphicForms §3.41 at the finite places, the pgsp6-pgso8-archimedean-generic-theta contract at the real and complex places); a globally generic constituent of the restriction of Σ to Sp₆ has standard transfer an isobaric sum ⊞_i Π_i of distinct unitary self-dual cuspidal representations of general linear groups (ModularityAndLanglandsExtensions §5.1), so the global Arthur parameter is generic and L^S(s, Σ, std) = ∏_i L^S(s, Π_i) does not vanish at s = 1 (boundary nonvanishing, AL.3); the pgsp6-similitude-rallis contract then gives a nonzero lift. The local lift of St to split PGO₆(k_u) is zero (pgsp6-steinberg-pgo6-vanishing contract), so the global lift to split PGO₆ vanishes, PGSO₈ is the first occurrence (MetaplecticAutomorphicForms §3.10) and the lift is cuspidal by the same Rallis contract. The lift is globally generic (pgsp6-pgso8-global-generic-theta contract). The isogeny f₂ maps the unipotent radical of a Borel subgroup of SO₈ isomorphically onto that of PGSO₈ and, triality permuting the simple root groups, carries nondegenerate characters to nondegenerate characters, so a form of the lift whose Whittaker coefficient is nonzero at the identity (a translate of any form with nonzero coefficient) pulls back along f₂ to a form with nonzero Whittaker coefficient, and the pullback has a globally generic cuspidal constituent on SO₈(𝔸_k). Its transfer is an isobaric sum of distinct unitary self-dual cuspidal representations (ModularityAndLanglandsExtensions §5.1), which is its global Arthur parameter by isobaric strong multiplicity one (AL.3); the constituents of the pullback are nearly equivalent and share it, so it is generic. *Needs:* MetaplecticAutomorphicForms §§3.10, 3.41, the pgsp6-pgso8-archimedean-generic-theta, pgsp6-pgso8-global-generic-theta, pgsp6-similitude-rallis and pgsp6-steinberg-pgo6-vanishing contracts; §2.1; ModularityAndLanglandsExtensions §5.1; AutomorphicLFunctionsAndLocalFactors, AL.3 (boundary nonvanishing, isobaric strong multiplicity one).

**Checks.**

- The Steinberg place is what excludes the lower lift: the Sp₆-parameter of St is Sym⁶ (§2.0, Checks), whose space of SL₂-invariants has dimension 0, while a representation occurring at PGO₆ has standard parameter q ∘ h ∘ φ = 1 ⊕ Λ²φ with invariants of dimension at least 1 (for φ = Sym³, 1 ⊕ Λ²Sym³ = 1 ⊕ 1 ⊕ Sym⁴ has invariants of dimension 2).
- Without a Steinberg place the cuspidality fails: if Σ is a globally generic cuspidal representation of PGSp₆ that is the global lift of a cuspidal τ on PGO₆ ≅ PGL₄ ⋊ ⟨±1⟩, its lift back to PGO₆ is nonzero, so its lift to PGSO₈ is not cuspidal (its constant term along the parabolic fixing an isotropic line is the lower lift); correspondingly its standard parameter is 1 ⊕ Λ²φ_τ and L^S(s, Σ, std) = ζ^S(s) L^S(s, τ, Λ²) has a pole at s = 1 coming from ζ^S(s).
- With the Steinberg place the generic transfer has a single summand: the localization at u of ⊞_i Π_i has the parameter Sym⁶ of St (symplectic-steinberg-generic-parameter contract, whose source argument shows that St lies in no packet of §3.17 other than that of Sym⁶, bounded or unbounded), irreducible of dimension 7, so ⊞_i Π_i is a single cuspidal Π of GL₇ and L^S(s, Σ, std) = L^S(s, Π) has neither a zero nor a pole at s = 1; the Rallis contract is used in its nonvanishing case, not in its pole case.

### 2.4 Spin gamma factors of the local spin lift

For generic discrete series σ of PGSp₆(F), prove that γ(s, σ, spin, ψ) = γ(s, SpinLift(σ), ψ), the left side being the Langlands–Shahidi factor and the right the standard factor of GL₈, with the same ψ and compatible Haar measures (GS, Proposition 4.1(i) and proof, pp. 18–19). *Route:* choose a totally complex number field k with four distinct finite places u, w, t₁, t₂ whose completions are isomorphic to F, and a nontrivial character Ψ of k \ 𝔸_k with its nondegenerate Whittaker character of N(𝔸_k); its components at these places are of the form ψ_a, and by the Check on ψ_a below the ratio of the two sides of the identity does not depend on a. Let T be {t₁} or {t₁, t₂}. By §1.6(ii), every archimedean place being free, globalize σ at the places of T, the Steinberg representation at u and one fixed generic supercuspidal δ at w (isolation at T by the relative-generic-isolation contract, at u by SRU.4.7) to a globally generic cuspidal Σ that is spherical at every finite place outside T ∪ {u, w}. Since Σ is globally generic with Σ_u ≅ St, its similitude lift to split PGSO₈ is nonzero and cuspidal and SpinLift(Σ) is defined (§2.3, second statement). Compare the global functional equations of the spin L-function of Σ and of the standard L-function of SpinLift(Σ) (§2.3), whose partial L-functions agree by the unramified Satake comparison of §2.2. At every finite place v ∉ T ∪ {u, w} the component Σ_v is generic and spherical, hence an irreducible unramified principal series (SmoothRepresentationsOfLocalGroupsPartII, SRU.5.5, *spherical-generic-criterion*, PGSp₆ being split, adjoint and quasi-simple), and γ(s, Σ_v, spin, Ψ_v) = γ(s, SpinLift(Σ_v), Ψ_v), both sides being the product of the Tate factors of the eight characters given by the spin weights of the Satake parameter (the unramified normalization of the pgsp6-shahidi-spin-factor contract and §2.2); at every complex place v the spin factor is γ(s, s ∘ φ_v, Ψ_v), φ_v the Langlands parameter of Σ_v (pgsp6-shahidi-spin-factor contract), and the component of SpinLift(Σ) at v has the parameter s ∘ φ_v (§2.3, first statement, the global Arthur parameter being generic by its second statement, with the pgsp6-pgso8-complex-theta contract), whose GL₈ factor is the same (AutomorphicLFunctionsAndLocalFactors, AL.1.4 and AL.R.2). At the places of T ∪ {u, w} the components of SpinLift(Σ) are the local lifts SpinLift(σ), SpinLift(St) and SpinLift(δ) (§2.3, first statement, for the same reason). Hence γ(s, St, spin, ψ) γ(s, δ, spin, ψ) γ(s, σ, spin, ψ)^(#T) equals the corresponding product of GL₈ factors of SpinLift(St), SpinLift(δ) and SpinLift(σ); the factors at u and w are the same in the globalizations with #T = 1 and #T = 2, which use the same k, Ψ, u, w and δ, and the quotient of the two identities is the statement. *Needs:* §1.6 (statement (ii)), §2.2, §2.3 (both statements); SmoothRepresentationsOfLocalGroupsPartII, SRU.4.7, SRU.5.5 (*spherical-generic-criterion*), and the relative-generic-isolation contract; AutomorphicLFunctionsAndLocalFactors, AL.3 (global Rankin–Selberg functional equation), AL.1.4 and AL.R.2 (archimedean factors); AutomorphicLFunctionsAndLocalFactorsPartII, pgsp6-shahidi-spin-factor contract (global functional equation with its archimedean factors, unramified normalization and change-of-character rule); MetaplecticAutomorphicForms, pgsp6-pgso8-complex-theta contract (the parameters at the complex places); EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- For σ unramified (not discrete, so outside the statement) and ψ of conductor O_F with its self-dual measure, both sides equal L(1 − s, SpinLift(σ)∨)/L(s, SpinLift(σ)), the eight unramified Tate epsilon factors being 1; this fixes the normalization. At F = ℚ₅, trivial spin Satake class and s = 2 each Tate factor is (1 − 5⁻²)/(1 − 5) = −6/25 and both sides are (6/25)⁸. For ψ₅(x) = ψ₀(5x), ψ₀ of conductor ℤ₅, both sides are 5⁻¹²(6/25)⁸ by the next Check, whereas the L-factor ratio is still (6/25)⁸: for ψ of nonzero conductor exponent the epsilon factors are kept.
- For σ = St_PGSp₆ the parameter is the principal SL₂ of Spin₇, which lies in i(G₂(ℂ)); the semisimple element 2ρ∨ = (6,4,2) acts on the spin weights (±1/2,±1/2,±1/2) with eigenvalues 6, 4, 2, 0, 0, −2, −4, −6, so SpinLift(σ) has parameter 1 ⊕ Sym⁶ and is the tempered representation 1 × St₇ of GL₈, not St_GL₈ (whose parameter Sym⁷ is symplectic and cannot occur).
- Replacing ψ by ψ_a multiplies both sides by |a|^(8(s−1/2)): the Langlands–Shahidi side by the change-of-character rule of the pgsp6-shahidi-spin-factor contract, the GL₈ side by det(s ∘ φ)(a) |a|^(8(s−1/2)) with det(s ∘ φ) = 1, the spin representation being valued in SO₈. At F = ℚ₅, s = 2 and a = 5 both sides acquire 5^(−8·3/2) = 5⁻¹², as in the first Check. Without the rule on the Langlands–Shahidi side the quotient of the two global identities would give the identity only at the component of Ψ at t₂, a single character ψ_a, not for every ψ.
- The auxiliary places cancel only because none is left uncontrolled. Write R_x for the ratio of the spin factor to the GL₈ factor at a place x. With R_v = 1 at the spherical and complex places, the globalizations with #T = 1 and #T = 2 give R_u R_w R_σ = 1 and R_u R_w R_σ² = 1, whose quotient is R_σ = 1. If each globalization had one uncontrolled finite place z₁, z₂, as §1.6(i) allows, the identities would read R_u R_w R_σ R_(z₁) = 1 and R_u R_w R_σ² R_(z₂) = 1, satisfied by R_u R_w = 1, R_σ = 2, R_(z₁) = 1/2, R_(z₂) = 1/4; statement (ii) of §1.6 over a totally complex field leaves no such places, so every factor other than those at T ∪ {u, w} has R = 1.

### 2.5 Quadratic twisting of the generic spin lift

For generic discrete series σ of PGSp₆(F) and quadratic χ, prove SpinLift(σ ⊗ χ ∘ sim) ≅ SpinLift(σ) ⊗ χ ∘ det (GS, Proposition 4.1(ii), pp. 18–19). *Route:* the similitude lift of σ ⊗ χ ∘ sim is the lift of σ twisted by χ ∘ sim (pgsp6-similitude-twist-rule contract); χ ∘ sim pulls back along f₂ to the spinor-norm character χ ∘ SN of SO₈(F) (§2.1); twisting by χ ∘ SN multiplies the SO₈-parameter by χ (so8-spinor-norm-twist contract), so its standard GL₈-parameter is multiplied by χ, and the GL₈ correspondence carries this to the twist by χ ∘ det (EndoscopicTransferAndUnitaryTraceComparison §10.30). *Needs:* §2.1, §2.2; MetaplecticAutomorphicForms, pgsp6-similitude-twist-rule contract; ModularityAndLanglandsExtensions, so8-spinor-norm-twist contract; EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- The twist leaves the standard parameter of σ unchanged (χ ∘ sim is trivial on Sp₆(F)) and multiplies the spin parameter by χ, so for the unramified quadratic χ each eigenvalue of Frobenius in the parameter of SpinLift(σ) changes sign: for σ = St_PGSp₆ the parameter 1 ⊕ Sym⁶ (Examples below) becomes χ ⊗ (1 ⊕ Sym⁶), with traces 8 and −8 at (Frobenius, 1).
- Twisting twice by χ returns SpinLift(σ).
- Using the vector map f₁ instead of f₂ would make the twist invisible, contradicting the first Check at σ = St_PGSp₆ (traces 8 and −8).

### Examples

- St_PGSp₆: its theta lift to PGSO₈ is the Steinberg representation, whose SO₈-parameter is the principal SL₂ of SO₈ with standard representation Sym⁶ ⊕ 1; triality fixes the principal SL₂, so SpinLift(St) has parameter 1 ⊕ Sym⁶.
- For σ the theta lift of a generic G₂ discrete series in Irr♦, SpinLift(σ) has parameter 1 ⊕ v ∘ L(π) (§5.4).

### Dependencies

Tau Ceti `TauCeti.D4Tripled.trialityAutomorphism`; ReductiveGroups, Layer 9; SpinRepresentations, Layer 8; OrthogonalSpinGroups, Layers 1–2; MetaplecticAutomorphicForms §§3.10, 3.34, 3.41 and the pgsp6-similitude-twist-rule, pgsp6-steinberg-pgo6-vanishing, pgsp6-pgso8-complex-theta, pgsp6-pgso8-archimedean-generic-theta, pgsp6-pgso8-global-generic-theta and pgsp6-similitude-rallis contracts; ModularityAndLanglandsExtensions §§3.8, 3.15, 3.17, 3.25, 5.1 and the so8-spinor-norm-twist, symplectic-steinberg-generic-parameter, classical-discrete-packets and classical-packets-cuspidal-support contracts; EndoscopicTransferAndUnitaryTraceComparison §10.30; AutomorphicLFunctionsAndLocalFactors, AL.1.4, AL.R.2, AL.3; AutomorphicLFunctionsAndLocalFactorsPartII, pgsp6-shahidi-spin-factor contract; AutomorphicFormsOnReductiveGroups §2.5; SmoothRepresentationsOfLocalGroups, SR.3.3; SmoothRepresentationsOfLocalGroupsPartII, SRU.4.7, SRU.5.5 and the relative-generic-isolation contract; ExceptionalThetaCorrespondencesForG2, Layer 0 (*Complex local parameters*); Layer 0 (§0.1); Layer 1 (§1.6).

## Layer 3: The G₂ parameter map and its characterizations

### 3.1 The classical theta parameter factors through G₂

If π ∈ Irr(G₂(F)) has nonzero theta lift θ(π) to PGSp₆(F), prove that the parameter assigned by Arthur to the PGSp₆(F)-orbit of irreducible constituents of the restriction of θ(π) to Sp₆(F) is v ∘ φ for a unique φ ∈ Φ(G₂) (GS, Proposition 3.1, p. 11; §3.3, pp. 11–12). *Route:* for non-supercuspidal π read the parameter from the explicit lift tables and the correspondence for the Levi subgroups, through the classical-packets-parabolic-induction contract for constituents of induced representations and the classical-discrete-packets and classical-packets-cuspidal-support contracts for discrete series; for supercuspidal π globalize on the totally definite octonion form with a Steinberg place (§1.4), take the cuspidal global lift Σ (ExceptionalThetaCorrespondencesForG2, Layer 10), whose component at the Steinberg place is St_PGSp₆, observe that the rank-seven transfer A of Σ is cuspidal (symplectic-steinberg-generic-parameter contract) and regular algebraic with Satake parameters in v(G₂), and apply §0.9 at the place v₀ of π, so that rec(A_v₀) = v ∘ φ. The component at v₀ of a constituent of the restriction of Σ to Sp₆ lies in the packet of the localization ψ_v₀ = rec(A_v₀) (§3.17), which may be unbounded. It is generic in the sense of §3.25: by the image statement of §5.1 the cuspidal A, of orthogonal type with trivial central character, is the transfer of a globally generic cuspidal σ′ of Sp₆(𝔸_k), whose global Arthur parameter is A by isobaric strong multiplicity one (AL.3), so that σ′_v₀ is a Whittaker-generic member of that packet. If ψ_v₀ is bounded the packet is its tempered L-packet (§3.15); if it is unbounded its members are irreducible standard modules with L-parameter ψ_v₀ (§3.25). In both cases the parameter (§2.0) of the component is rec(A_v₀) = v ∘ φ; uniqueness is §0.4. *Needs:* §0.4, §0.9, §1.4, §2.0; ExceptionalThetaCorrespondencesForG2, Layers 8 and 10; ModularityAndLanglandsExtensions §§3.15, 3.17, 3.25, 5.1 and the symplectic-steinberg-generic-parameter, classical-discrete-packets, classical-packets-parabolic-induction and classical-packets-cuspidal-support contracts; AutomorphicLFunctionsAndLocalFactors, AL.3 (isobaric strong multiplicity one).

**Checks.**

- For π = St_G₂, θ(π) = St_PGSp₆ and the Sp₆ parameter is Sym⁶ on SL₂ (§2.0, Checks), which is v of the principal SL₂ of G₂.
- The restriction to Sp₆(F) is an orbit of constituents under PGSp₆(F); choosing one constituent without that orbit would make the statement depend on a choice, while Arthur's parameter is constant on the orbit.
- The octonion algebra of the route is global over k with split localization at the prescribed place; a local definite octonion algebra over F does not exist.

### 3.2 The G₂ parameter map

Using the dichotomy Irr(G₂) = Irr♠ ⊔ Irr♥, define L : Irr(G₂(F)) → Φ(G₂) by L(π) = j ∘ L_PD×(θ_D(π)) for π ∈ Irr♠, where θ_D(π) is the lift to PD× for the cubic division algebra D and L_PD× is the correspondence for PD× (the correspondence for GL₃ composed with Jacquet–Langlands), and by L(π) = the unique φ with v ∘ φ = the Arthur parameter of the restriction of θ(π) to Sp₆(F) for π ∈ Irr♥ (GS, §3.1, pp. 10–11).

- For π ∈ Irr♠, L(π) = j ∘ L_PD×(θ_D(π)); for π ∈ Irr♥, v ∘ L(π) is the Arthur parameter of the restriction of θ(π).
- L is constant on isomorphism classes.
- On Irr♥ the seven-dimensional parameter v ∘ L(π) determines L(π) (§0.4).

**Checks.**

- St_G₂ maps to the principal SL₂ parameter of G₂ with trivial Weil part.
- For an unramified irreducible π, L(π) is the Satake class together with the monodromy prescribed by the unramified correspondence; for the trivial representation, L(1) is trivial on SL₂(ℂ) and sends w ∈ W_F to the image under the principal SL₂ of diag(|w|^(1/2), |w|^(−1/2)) with |·| the character of Conventions (|Frob| = q⁻¹ for arithmetic Frobenius), so v ∘ L(1) has arithmetic-Frobenius eigenvalues q^(−3), q^(−2), …, q^(3) and N = 0; confusing it with the Steinberg parameter (same semisimple Frobenius, N ≠ 0) is excluded by N.
- Replacing D by its opposite algebra and the PGL₃ parameter by its dual leaves L(π) unchanged, because j ∘ φ_τ and j ∘ φ_τ∨ are G₂-conjugate (§0.2).

*Needs:* §3.1, §0.2, §2.0; ExceptionalThetaCorrespondencesForG2, Layers 5–6 (division Howe duality, dichotomy); EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30–10.31.

### 3.3 The split PGL₃ description

Decompose Irr♥ = Irr♣ ⊔ Irr♦ by whether the lift to PGL₃ ⋊ ⟨duality⟩ is nonzero. On Irr♣ define L_B(π) = j ∘ rec(τ), where τ is the irreducible PGL₃(F)-constituent of that lift, determined up to τ ↔ τ∨; on Irr♠ and Irr♦ set L_B = L (GS, §3.2, p. 11; HD, Theorems 8.2 and 8.5, PDF pp. 25–29).

- For π lifting to an extension τ± of τ, L_B(π) = j ∘ rec(τ).
- τ and τ∨ give the same value, so L_B is well defined on representation classes.
- The loci Irr♠, Irr♣, Irr♦ partition Irr(G₂).

**Checks.**

- The lifts of St_PGL₃⁺ and St_PGL₃⁻ are two different representations with the same value j ∘ (principal SL₂ of SL₃), the subregular parameter.
- For a non-self-dual τ, τ and τ∨ are distinct representations of PGL₃(F) with equal image under j ∘ rec.
- The sign ± of the extension τ± does not change L_B; an assignment depending on the sign would separate two members that §4.3 places in one fibre.

*Needs:* §3.2, §0.2; ExceptionalThetaCorrespondencesForG2, Layer 5 (*PGL₃ outer extensions and their signs*, *Howe duality for split E₆*); EndoscopicTransferAndUnitaryTraceComparison §10.30.

### 3.4 Agreement of the two descriptions

Prove L_B = L: if π = θ(τ±) then the Arthur parameter of the restriction of θ(π) is v ∘ j ∘ rec(τ), including when θ(π) is a reducible tempered Siegel induction's constituent or a nontempered Langlands quotient (GS, §3.2, p. 11; HD, Theorems 8.2, 8.5 and 15.2, PDF pp. 25–29, 52–53). *Route:* the explicit lift tables give θ(π) as a constituent of a Siegel induction from τ; compare Levi parameters through normalized induction (classical-packets-parabolic-induction contract for a tempered constituent, §2.0 for a Langlands quotient) and apply §0.4. *Needs:* §§3.2–3.3, §0.1, §0.4, §2.0; ExceptionalThetaCorrespondencesForG2, Layer 8 (*The E₆-to-E₇ tempered Siegel table*); ModularityAndLanglandsExtensions, classical-packets-parabolic-induction contract; SmoothRepresentationsOfLocalGroups, SR.2; EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- For τ = St_PGL₃, the PGSp₆ lift of the generic member is the generic constituent of the Siegel induction I₃(St_PGL₃), which is tempered and not a discrete series; its Sp₆ parameter is 1 ⊕ Sym² ⊕ Sym², equal to v ∘ j ∘ (principal SL₂).
- For τ unramified with Satake class diag(a, b, (ab)⁻¹) the two sides have the eigenvalues of §0.1.
- Only constituents with the same cuspidal support can be compared; the Langlands quotient, not an arbitrary constituent, is matched for nontempered τ.

### 3.5 Nontempered representations

For every nontempered π = J_P(τ), the Langlands quotient of a standard module from a proper parabolic P = MN with τ essentially tempered in the positive chamber, prove that L(π) is rec_M(τ) composed with M∨ → G₂(ℂ); hence L restricts to a bijection between nontempered representations and nontempered parameter classes (GS, §1.1(iii), p. 3; §3.4, p. 12; HD, Lemmas 13.4 and 13.8, PDF pp. 42, 47; Theorem 15.1(v), PDF p. 52). The proper Levi subgroups are the two GL₂'s (of the two maximal parabolics) and the split torus. *Route:* the nontempered lift tables of ExceptionalThetaCorrespondencesForG2, Layer 8, compared Levi by Levi, and the Langlands classification. *Needs:* §3.4; SmoothRepresentationsOfLocalGroups, SR.2–SR.3; EndoscopicTransferAndUnitaryTraceComparison §10.30; ExceptionalThetaCorrespondencesForG2, Layer 8 (*Explicit nontempered lifts*).

**Checks.**

- The trivial representation is the Langlands quotient of the Borel standard module with exponent ρ, and its parameter is the unramified parameter of §3.2 with v-eigenvalues q^(−3), …, q^(3) at arithmetic Frobenius; it is nontempered and the fibre is a singleton.
- The two embeddings of GL₂ as Levi subgroups (long and short root) have different dual embeddings into G₂(ℂ), and the statement is checked separately for each.
- An arbitrary constituent of a reducible standard module is not matched: only the Langlands quotient has the stated parameter.

### 3.6 Temperedness and tempered induction

Prove that π is tempered exactly when L(π)(W_F) is bounded, and that if π is a constituent of the normalized induction from a unitary discrete series τ of a proper Levi M then L(π) is rec_M(τ) composed with M∨ → G₂(ℂ) (GS, §1.1(ii), p. 3; §3.4, p. 12). *Needs:* §3.4, §3.5; ModularityAndLanglandsExtensions, classical-packets-parabolic-induction contract (the parameters of the PGSp₆ partners of tempered induced representations); SmoothRepresentationsOfLocalGroups, SR.2–SR.3; EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- Boundedness is on W_F, not on SL₂: the Steinberg parameter has unbounded SL₂ image and St_G₂ is tempered.
- The trivial representation has unbounded Weil image (v-eigenvalues q^(±3), q^(±2), q^(±1), 1 at Frobenius) and is not tempered.
- Both constituents of a reducible tempered induction have the same parameter.

### 3.7 Discrete series

Prove that π is square-integrable exactly when L(π) does not factor through a proper Levi subgroup of G₂(ℂ), as a parameter of WD_F (GS, §1.1(i), p. 3; §3.4, p. 12). *Route:* the discrete-series trichotomy of ExceptionalThetaCorrespondencesForG2, Layer 8, with §§0.2–0.3; on Irr♦ a discrete series π has a discrete-series lift θ(π), whose restriction to Sp₆(F) has discrete parameter v ∘ L(π) (classical-discrete-packets contract), and then L(π) is discrete, a Levi subgroup of G₂(ℂ) containing its image having a central torus that would centralize v ∘ L(π). *Needs:* §3.6, §0.2, §0.3; ExceptionalThetaCorrespondencesForG2, Layer 8 (*The discrete-series trichotomy*); ModularityAndLanglandsExtensions, classical-discrete-packets contract.

**Checks.**

- The Steinberg parameter is discrete and nontrivial on SL₂.
- A discrete G₂ representation in Irr♣ may have a non-discrete PGSp₆ lift (π_gen[1], §5.5), so discreteness is not read from the PGSp₆ partner.
- The trivial parameter is not discrete: it factors through the torus.

### 3.8 Tempered non-discrete packets

Prove that for every bounded non-discrete φ, the fibre L⁻¹(φ) has |Irr(S_φ)| ∈ {1, 2} elements, with a unique generic member labelled by the trivial character; this holds for every p including p = 3 (GS, §3.4, p. 12). *Route:* rank-one R-groups for the two maximal Levis and the torus, with the explicit reducibility lists. *Needs:* §3.6, §3.7; SmoothRepresentationsOfLocalGroups, SR.2.

**Checks.**

- The unitary principal series from the trivial character of the torus is irreducible, S_φ = 1, and the fibre has one element.
- A two-element fibre contains both constituents of one reducible induction, exactly one generic.
- S_φ is abelian here, so |Irr(S_φ)| = |S_φ|; this coincidence fails for the subregular S₃ of §4.4.

### 3.9 The rank-seven standard lift

Define Lif(π) ∈ Irr(GL₇(F)) by: for π ∈ Irr♥, Arthur's standard transfer of the restriction of θ(π) to GL₇; for π ∈ Irr♠ with τ the Jacquet–Langlands transfer of θ_D(π) to PGL₃, the representation of GL₇(F) whose parameter is φ_τ ⊕ 1 ⊕ φ_τ∨ (GS, §3.4, p. 13).

- rec(Lif(π)) = v ∘ L(π) as Weil–Deligne representations with monodromy.
- On Irr♠ the parameter is φ_τ ⊕ 1 ⊕ φ_τ∨; on Irr♥ Lif is Arthur's standard transfer.
- Dualizing τ leaves Lif(π) unchanged.

**Checks.**

- Every value has rank seven; on Irr♠ the ranks are 3 + 1 + 3.
- The parameter of Lif(π) is orthogonal with determinant one.
- For diagonal A₂ Satake data (a, b, (ab)⁻¹) the characteristic polynomial of the Satake class of Lif(π) is the polynomial of §0.1.
- Lif(π) is the representation attached to the direct-sum parameter, which is irreducible by definition; it is not a written parabolic induction, which can be reducible.

*Needs:* §3.2, §0.1, §2.0; ModularityAndLanglandsExtensions §3.15; EndoscopicTransferAndUnitaryTraceComparison §10.30.

### 3.10 Gamma factors of G₂ × GL_r

For π ∈ Irr(G₂(F)), τ ∈ Irr(GL_r(F)) and ψ, define γ(s, π × τ, ψ) = γ(s, Lif(π) × τ, ψ), the right side the Rankin–Selberg factor (GS, §3.4, p. 13; GF, Definition 2.1, p. 3).

- γ(s, π × τ, ψ) equals the Rankin–Selberg factor of Lif(π) × τ, a meromorphic function of s.
- Induction in the GL_r variable multiplies the factors of the cuspidal support.
- Replacing ψ by ψ_a(x) = ψ(ax) multiplies the factor by det(φ_τ)(a)⁷ · |a|^(7r(s−1/2)), because det(v ∘ L(π)) = 1.
- For unramified data and unramified ψ it is the ratio of the unramified tensor factors.

**Checks.**

- For toral A₂ data (χ₁, χ₂, χ₃) with χ₁χ₂χ₃ = 1 the factor is γ(s, τ) ∏_i γ(s, χ_i^(±1) × τ), seven factors.
- For a GL₁ twist τ = μ the change-of-character multiplier is μ(a)⁷ |a|^(7(s−1/2)), which detects a seventh power of μ.
- The exponent is 7r, not 8r: the tensor parameter has dimension 7r.

*Needs:* §3.9; AutomorphicLFunctionsAndLocalFactors, AL.3 (local Rankin–Selberg factor and functional equation).

### 3.11 The analytic characterization of the G₂ × GL_r factors

A family of G₂ × GL_r factors assigns a meromorphic function γ(s, π × τ, ψ) to every nonarchimedean local field F of characteristic zero, every nontrivial additive character ψ of F, every π ∈ Irr(G₂(F)) and every τ ∈ Irr(GL_r(F)), r ≥ 1, compatibly with isomorphisms of local fields (which transport π, τ and ψ); §3.10 is one. At a real place u of a number field the factors are the same for every family. They are needed only on the representations that the global property below involves, where the definition of GF, §2.4, pp. 3–4, through the archimedean correspondence reads as follows. For an irreducible representation Π_u of the compact real form of G₂ with highest weight λ, let Lif(Π_u) be the irreducible representation of GL₇(ℝ) whose parameter, under the archimedean correspondence of AutomorphicFormsOnReductiveGroups §2.5, is `sgn ⊕ ⨁_α Ind_(ℂ×)^(W_ℝ)((z/z̄)^⟨λ+ρ, α∨⟩)`, α running over the three long positive roots of G₂ and ρ being the half-sum of the positive roots; for an irreducible spherical representation Π_u of split G₂(ℝ), the spherical constituent of the normalized principal series from a Borel subgroup with exponent (χ₁, χ₂, χ₃), χ₁χ₂χ₃ = 1, in the coordinates of rule (a) below, let Lif(Π_u) be the irreducible representation with parameter `1 ⊕ ⨁_i χ_i^(±1)`. For an irreducible representation T_u of GL_r(ℝ) set γ(s, Π_u × T_u, ψ_u) = γ(s, Lif(Π_u) × T_u, ψ_u), the archimedean factor of the tensor product of the two parameters (AutomorphicLFunctionsAndLocalFactors, AL.1.4 and AL.R.2).

Prove Gan–Savin's theorem: the family of §3.10 satisfies (i) and (ii) below, and any two families satisfying (i) and (ii) coincide (GF, Theorem 2.4, Lemma 2.5 and §§2.4–2.8, pp. 3–9).

(i) Local rules, for every F, ψ, π and τ, the factors on the right being Rankin–Selberg factors of general linear groups: (a) if π is a subquotient of the normalized principal series with exponent (χ₁, χ₂, χ₃), χ₁χ₂χ₃ = 1 (the coordinates of GF, p. 4), then γ(s, π × τ, ψ) = γ(s, τ, ψ) ∏_i γ(s, χ_i × τ, ψ) γ(s, χ_i⁻¹ × τ, ψ); (b) if π is a subquotient of the normalized induction of a representation τ′ of the Levi subgroup GL₂ of the Heisenberg parabolic P, then γ(s, π × τ, ψ) = γ(s, τ′ × τ, ψ) γ(s, τ′∨ × τ, ψ) γ(s, ω_τ′ × τ, ψ) γ(s, ω_τ′⁻¹ × τ, ψ) γ(s, τ, ψ), ω_τ′ the central character; (c) if π is a subquotient of the normalized induction of a representation τ′ of the Levi subgroup GL₂ of the other maximal parabolic Q, then γ(s, π × τ, ψ) = γ(s, τ′ × τ, ψ) γ(s, τ′∨ × τ, ψ) γ(s, Ad(τ′) × τ, ψ), Ad(τ′) being the representation of GL₃(F) with parameter Ad φ_τ′ (EndoscopicTransferAndUnitaryTraceComparison §10.30); (d) if τ is a subquotient of τ₁ × τ₂, then γ(s, π × τ, ψ) = γ(s, π × τ₁, ψ) γ(s, π × τ₂, ψ); (e) γ(s, π × τ, ψ_a) = ω_τ(a)⁷ |a|^(7r(s − 1/2)) γ(s, π × τ, ψ) for a ∈ F×, where ψ_a(x) = ψ(ax).

(ii) Global functional equation: let k be a totally real number field, ψ = ⊗_u ψ_u a nontrivial character of k \ 𝔸_k, O an octonion algebra over k, Π a cuspidal representation of Aut(O)(𝔸_k) that is spherical at every real place u where Aut(O)(k_u) is split, T a cuspidal representation of GL_r(𝔸_k), and S a finite set of places of k containing every real place and every finite place at which Π, T or ψ is ramified. If (a) Π has a nonzero cuspidal global theta lift to split PGSp₆ whose irreducible constituents restrict to Sp₆ with a generic global Arthur parameter (ModularityAndLanglandsExtensions §3.8: every b_i = 1, so that by §3.17 the standard transfer to GL₇ is an isobaric sum of distinct unitary self-dual cuspidal representations), or (b) O is split and Π has a nonzero global theta lift to Aut(D) for a central simple k-algebra D of degree three, possibly split, then L^S(s, Π × T) continues meromorphically to ℂ and L^S(s, Π × T) = ∏_(u∈S) γ(s, Π_u × T_u, ψ_u) · L^S(1 − s, Π × T∨).

Alternative (b) is stated for split O, where every real component is a spherical representation of split G₂(ℝ); GF, Theorem 2.4(ii), allows any O, but its proof of (b) treats split real places only (Notes on the sources), and the uniqueness uses (b) for split O only. Alternative (a) assumes a generic global Arthur parameter, which GF, Theorem 2.4(ii)(a), does not: the comparison of the components of the GL₇ transfer with Lif(Π_u) needs the local packets to be L-packets (Notes on the sources), and the uniqueness uses (a) only for Π with a Steinberg component, where the parameter is generic. Narrowing (ii) weakens the existence half and strengthens the uniqueness half.

*Route:* (i)(a)–(d): GF Proposition 2.3 (the cuspidal support of Lif(π) is the image of that of π under the assignments of (a)–(c), read from the lift tables of ExceptionalThetaCorrespondencesForG2, Layers 5 and 8, and the definition of §3.9) with the fact that a Rankin–Selberg gamma factor is the product of the factors of the cuspidal supports (EndoscopicTransferAndUnitaryTraceComparison §10.29: the factors of an irreducible representation are the products over its Langlands data, and those of a segment the products over its supercuspidal support); (e) is the change-of-character rule of §3.10. (ii)(a): a constituent Σ of the cuspidal lift of Π has Σ_u ≅ θ(Π_u) at every finite place (ExceptionalThetaCorrespondencesForG2 §10.3, with Howe duality from Layers 5–8) and the real components of the real-exceptional-theta-parameters contract; the standard GL₇ transfer A of a constituent of its restriction to Sp₆ (ModularityAndLanglandsExtensions §§3.8, 3.15, 3.17) is an isobaric sum of distinct unitary self-dual cuspidal representations, the parameter being generic by (a), and A_u ≅ Lif(Π_u) at every place u: the global parameter being generic, its localization ψ_u at u is an L-parameter, and the component of the constituent at u lies in the packet of ψ_u (§3.17). If ψ_u is bounded, that packet is its tempered L-packet (§3.15). If ψ_u is unbounded, the packet of §3.17 consists of the representations induced from members of the tempered packets of a Levi subgroup M twisted by an unramified character of M in the open positive chamber (Arthur's extension of bounded packets, which §3.17 uses; MagaardSavin, proof of Proposition 8.2, p. 10); ψ_u is generic in the sense of ModularityAndLanglandsExtensions §3.25, because by the image statement of §5.1 the isobaric sum A is the transfer of a globally generic cuspidal representation σ′ of Sp₆(𝔸_k), whose global Arthur parameter is A by isobaric strong multiplicity one (AL.3), so that σ′_u is a Whittaker-generic member of the packet of ψ_u (§3.17); by §3.25 the members of that packet are irreducible standard modules, so the component of the constituent at u is the irreducible standard module with L-parameter ψ_u, equal to its Langlands quotient. In both cases A_u ≅ Lif(Π_u) by §3.9 at the finite places and by the real contract and the definition above at the real places (GF, §2.7(a), pp. 6–7, where the two cases are not separated). Hence γ(s, A_u × T_u, ψ_u) = γ(s, Π_u × T_u, ψ_u) at every place u and L^S(s, Π × T) = L^S(s, A × T), and the functional equation is that of A × T, summand by summand (AL.3.6.2). (ii)(b): a constituent Π′ of the restriction to PD× of the lift of Π to Aut(D) has Π′_u ≅ θ(Π_u) at every finite place (cubic-jordan-global-theta contract) and the real components of part (b) of the real contract. If D is a division algebra, JL(Π′) is its transfer to GL₃ (cubic-global-jacquet-langlands contract): cuspidal when Π′ is infinite-dimensional, and χ ∘ det when Π′ = χ ∘ Nrd. If D is split, Π′ is an irreducible automorphic representation of PGL₃, a subquotient of the normalized induction of a cuspidal datum (AutomorphicLFunctionsAndLocalFactorsPartII §10.0, first statement), and JL(Π′) denotes the isobaric sum of that datum: it has the partial L-functions of Π′ and its cuspidal support at every finite place, and at a real place u its component has the parameter χ₁ ⊕ χ₂ ⊕ χ₃ of the spherical Π′_u (an induction from the datum has a spherical subquotient only if every component of the datum at u is spherical, and then both have the parameter of the datum). In both cases γ(s, Π_u × T_u, ψ_u) = γ(s, T_u, ψ_u) γ(s, JL(Π′)_u × T_u, ψ_u) γ(s, JL(Π′)_u∨ × T_u, ψ_u) at every place (§3.9 on Irr♠, §§3.4 and 3.9 on Irr♣, the definition above at the real places), a Rankin–Selberg gamma factor depending only on the cuspidal supports (EndoscopicTransferAndUnitaryTraceComparison §10.29), which covers JL(Π′)_u = χ_u ∘ det against χ_u ⊗ St₃ at a ramified u and JL(Π′)_u against Π′_u when D is split. The functional equation is the product of those of T, JL(Π′) × T and JL(Π′)∨ × T, each the product of the equations of AL.3.6.2 for the cuspidal summands, twisted to be unitary. Uniqueness: two families agree on non-supercuspidal π by (i)(a)–(c), so by (d) and (e) it suffices to compare them at supercuspidal π and τ and at one character of F. Choose a totally real k with a finite place v₀ and k_v₀ ≅ F, a cuspidal T of GL_r(𝔸_k) with T_v₀ ≅ τ (AutomorphicLFunctionsAndLocalFactorsPartII §10.0 applied to the unitary twist of τ, then twisted back by a power of |det|) and a nontrivial character ψ of k \ 𝔸_k. If π ∈ Irr♥, §1.4(ii) with S = {v₀, v₁}, π at v₀ and St at a second finite place v₁, gives Π on Aut(O), O totally definite, with Π_v₀ ≅ π, Π_v₁ ≅ St, spherical at every finite place outside {v₀, v₁} and with nonzero G_D-period; its lift to PGSp₆ is nonzero (ExceptionalThetaCorrespondencesForG2 §10.4) and cuspidal (§10.5, the Steinberg alternative), with component θ(St) = St_PGSp₆ at v₁ (explicit lift tables, Layer 8), whose restriction to Sp₆ is the Steinberg representation, so the global Arthur parameter of a constituent of the restriction to Sp₆ is a single cuspidal representation of GL₇ and is generic (symplectic-steinberg-generic-parameter contract), and Aut(O) is compact at every real place, so Π satisfies (ii)(a); at every finite u ≠ v₀ of the functional equation Π_u is St or spherical, where the two families agree by (i), the real factors are common, and dividing the two functional equations gives agreement at v₀. If π ∈ Irr♠, then π = θ(τ′) for an irreducible τ′ ≠ 1 of the compact group PD_F×, D_F the cubic division algebra over F, with a nonzero vector fixed by PE× for a cubic field E = F(x₀) ⊂ D_F (ExceptionalThetaCorrespondencesForG2 §5.1). Take a central division algebra D of degree three over k ramified exactly at v₀ and at a second finite place v₁, with D ⊗_k k_v₀ ≅ D_F (ClassFieldTheory, Layers 5 and 10, with local invariants inv(D_F) at v₀ and −inv(D_F) at v₁; BorelRegulators §3.1 for the index three), an element x ∈ D close to x₀ at v₀, and e = k(x), a cubic subfield of D; τ′ is trivial on an open normal subgroup of PD_F×, so for x close enough to x₀ its PE×-fixed vector is fixed by (e ⊗_k k_v₀)×/k_v₀× as well. §1.3(c) with S = {v₀, v₁}, δ_v₀ = τ′ and δ_v₁ = 1, and the isolated-summand theorem (SRU.1.10; the unitary dual of a compact group is discrete), give an irreducible Ξ ⊂ L²_e with Ξ_v₀ ≅ τ′ and Ξ_v₁ ≅ 1, spherical at every real place. Its lift Π = Θ(Ξ) to split G₂ (cubic-period-global-theta contract) is cuspidal, Π_v₀ ≅ θ(τ′) = π being supercuspidal, with Π_v₁ ≅ θ(1) = π_deg[1] not supercuspidal (§5.1), Π_v ∈ Irr♣ ⊂ Irr♥ at every other finite place, being lifted from the split group H(k_v) (§§5.9, 8.3), spherical at every real place (part (b) of the real contract) and with nonzero lift back to Aut(D); so Π satisfies (ii)(b), the two families agree at every finite u ≠ v₀ by the case Irr♥ or by (i), and dividing the functional equations gives agreement at v₀. *Needs:* §3.4, §3.9, §3.10, §1.3 (statement (c)), §1.4 (statement (ii)); ExceptionalThetaCorrespondencesForG2, Layers 5–8 (§§5.1, 5.9, 6.7, 8.3, the lift tables and Howe duality), §§10.3–10.5 and the cubic-jordan-global-theta, cubic-period-global-theta and real-exceptional-theta-parameters contracts; ModularityAndLanglandsExtensions §§3.8, 3.15, 3.17, 3.25, 5.1 and the symplectic-steinberg-generic-parameter contract; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.29, 10.30 and the cubic-global-jacquet-langlands contract; AutomorphicLFunctionsAndLocalFactors, AL.1.4, AL.R.2 and AL.3 (AL.3.6.2); AutomorphicLFunctionsAndLocalFactorsPartII §10.0 (both the cuspidal-support statement and the globalization of supercuspidals of GL_l); AutomorphicFormsOnReductiveGroups §2.5; SmoothRepresentationsOfLocalGroupsPartII, SRU.1.10; ClassFieldTheory, Layers 5 and 10; BorelRegulators §3.1.

**Checks.**

- The P-Levi rule has dimension 2 + 2 + 1 + 1 + 1 = 7 and the Q-Levi rule 2 + 2 + 3 = 7.
- The theorem asserts a global functional equation only for the stated family Π, not for every cuspidal G₂ representation.
- At the torus with χ_i = 1 the rule gives seven factors γ(s, τ), matching §3.10 on the trivial character.
- The direction of the functional equation in (ii) is fixed by γ = ε · L(1 − s, ·∨)/L(s, ·), the convention of §§2.4 and 3.10, and is pinned by the Riemann zeta function, k = ℚ and S = {∞} in rank one: ζ(s) = γ_∞(s) ζ(1 − s) with γ_∞(s) = Γ_ℝ(1 − s)/Γ_ℝ(s) and Γ_ℝ(s) = π^(−s/2) Γ(s/2). At s = 2, Γ_ℝ(−1) = π^(1/2) Γ(−1/2) = −2π and Γ_ℝ(2) = π⁻¹, so γ_∞(2) = −2π², and γ_∞(2) ζ(−1) = −2π² · (−1/12) = π²/6 = ζ(2); the inverted equation ζ(1 − s) = γ_∞(s) ζ(s) would give ζ(−1) = −2π² · π²/6 = −π⁴/3, not −1/12.
- The real factor at the trivial representation of the compact form (λ = 0): with a short and b long simple roots, ρ pairs with the coroots b∨, a∨ + b∨ and a∨ + 2b∨ of the long positive roots b, 3a + b and 3a + 2b as 1, 2 and 3, so Lif has parameter sgn ⊕ Ind((z/z̄)) ⊕ Ind((z/z̄)²) ⊕ Ind((z/z̄)³), with exponents 0, ±1, ±2, ±3 on ℂ×, the seven weights at the infinitesimal character ρ (§3.15); the coroots a∨, a∨ + 3b∨ and 2a∨ + 3b∨ of the short positive roots would give 1, 4 and 5. The zero weight carries sgn: at j each Ind((z/z̄)^m) exchanges two lines and has determinant −1, so the three together have determinant sgn, and the trivial character on the zero weight would give determinant sgn in place of the determinant 1 of a parameter valued in SO₇.
- Rule (e) is needed for uniqueness. The components at v₀ of the characters of k \ 𝔸_k, k a number field with k_v₀ ≅ F, are the ψ_F(b ·) with b ∈ F algebraic over ℚ, ψ_F the standard character of F; a character ψ_F(a ·) with a transcendental over ℚ is none of them. Multiplying the factors of one supercuspidal π by ω_τ(u), for a fixed u ∈ ℤ_p× with ω_τ(u) ≠ 1 for some τ, and only at these characters keeps (a)–(d) (ω_τ is multiplicative along subquotients of τ₁ × τ₂) and (ii), and changes the family; (e) excludes it.
- With one uncontrolled finite place z, as §1.4(i) allows, the two functional equations give only R_π R_z = 1 for the ratio R of two families, which R_π = 2, R_z = 1/2 solves; §1.4(ii) leaves no such place. In the case Irr♠ the place z of §1.3(c) is harmless: Π_z is lifted from the split group H(k_z) and lies in Irr♥, where the families already agree.
- The Steinberg component forces a generic parameter, as the symplectic-steinberg-generic-parameter contract says at n = 3. At diag(q^(1/2), q^(−1/2)) the parameter Sym⁶ of St has the exponents 3, 2, 1, 0, −1, −2, −3, each once. A summand μ ⊠ ν_b of a global parameter whose component μ_v has the unramified parameter S_a contributes the exponents (a − 1)/2 − i + (b − 1)/2 − j for 0 ≤ i < a, 0 ≤ j < b; for a, b ≥ 2 the exponent (a + b)/2 − 2 occurs twice (i = 1, j = 0 and i = 0, j = 1), and otherwise they are (c − 1)/2, …, −(c − 1)/2 with c = max(a, b), integers only for c odd and then containing 0. Since 0 occurs once, there is one summand, with (a, b) = (7, 1) or (1, 7), and (1, 7) is the parameter 1 ⊠ ν₇ of the trivial representation, not of St; so the parameter is μ ⊠ ν₁ with μ_v = St₇. Without the hypothesis of (a) the step A_u ≅ Lif(Π_u) has no input: a member of a packet of a parameter with nontrivial Arthur SL₂ need not have the L-parameter of that parameter.
- An unbounded localization at a split real place u: let Π_u be the spherical representation of split G₂(ℝ) with exponent (|·|^a, |·|^b, |·|^(−a−b)), a, b > 0 and a + b < 1/2, a range the Jacquet–Shalika bound does not exclude. Part (b) of the real contract gives Lif(Π_u) the unbounded parameter 1 ⊕ |·|^(±a) ⊕ |·|^(±b) ⊕ |·|^(±(a+b)). The principal series of Sp₆(ℝ) with exponent (a + b, b, a) pairs with the coroots e₁ − e₂, e₁ − e₃, e₂ − e₃, e₁ + e₂, e₁ + e₃, e₂ + e₃, e₁, e₂, e₃ to a, b, b − a, a + 2b, 2a + b, a + b, a + b, b, a, all in (−1, 1), so none is a nonzero integer and the induction is irreducible, as §3.25 asserts, with the spherical member and the parameter of Lif(Π_u); A_u is the irreducible induction of GL₇(ℝ) from the seven characters 1, |·|^(±a), |·|^(±b), |·|^(±(a+b)), whose exponents differ by at most 2(a + b) < 1. A route through tempered L-packets alone would give the component a bounded parameter, which A_u does not have.
- For Π′ = 1 on D× the transfer is the trivial representation of GL₃, whose component at a ramified u is 1_GL₃, not the local transfer St₃ of the trivial representation of D_u×. The two share the cuspidal support |·|, 1, |·|⁻¹, so γ(s, 1_GL₃ × T_u, ψ_u) = γ(s + 1, T_u, ψ_u) γ(s, T_u, ψ_u) γ(s − 1, T_u, ψ_u) = γ(s, St₃ × T_u, ψ_u); with Π_u = θ(1) = π_deg[1], whose Lif has parameter Sym² ⊕ 1 ⊕ Sym², both sides of the identity of the Route of (ii)(b) equal γ(s, T_u, ψ_u) γ(s, St₃ × T_u, ψ_u)². Reading the contract as JL(1)_u ≅ St₃ would contradict JL(1) = 1_GL₃.

### 3.12 Preservation of G₂ × GL_r gamma factors

Prove γ(s, π × τ, ψ) = γ(s, (v ∘ L(π)) ⊗ rec(τ), ψ) for all π, τ, ψ, as meromorphic functions, with monodromy and matching reciprocity conventions (GS, Main Theorem (ix), p. 4, with the tensor product inside the argument; §3.4, p. 13). *Needs:* §3.9, §3.10; EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- The argument is the tensor product (v ∘ L(π)) ⊗ φ_τ of dimension 7r; a reading with the tensor product outside the gamma factor is not well typed.
- For π = St_G₂ and τ trivial on GL₁ the right side is γ(s, Sym⁶, ψ), the Steinberg factor of GL₇.
- For π ∈ Irr♠ the right side factors as γ(s, φ_τ′ ⊗ φ_τ) γ(s, φ_τ) γ(s, φ_τ′∨ ⊗ φ_τ) with τ′ the PGL₃ datum.

### 3.13 Characterization by gamma factors

Prove that L is the unique map Irr(G₂(F)) → Φ(G₂) satisfying §3.5, §3.6, §3.7 and §3.12 for all r (GS, Main Theorem (x), p. 4; §3.4, pp. 13–14). *Route:* for tempered π the parameter v ∘ L(π) is bounded and its twisted gamma factors determine it by the generic local converse theorem for GL₇; §0.4, through Griess's theorem §0.0, recovers L(π) from v ∘ L(π); the nontempered case follows from §3.5. *Needs:* §§3.5–3.7, §3.12, §0.0, §0.4; EndoscopicTransferAndUnitaryTraceComparison, gln-generic-local-converse contract.

**Checks.**

- A converse theorem for irreducible Weil representations alone does not suffice: v ∘ L(π) is reducible on the A₂ image.
- The gamma factors do not distinguish members of one fibre (they depend only on L(π)), so the characterization is of the map, not of an enhancement.
- For nontempered π the gamma factors determine only the cuspidal support; the Langlands quotient rule §3.5 fixes the parameter.

### 3.14 Characterization by the theta diagrams

Prove that a map Irr(G₂(F)) → Φ(G₂) satisfying the two diagrams of §3.2 equals L; in particular so does a map that also satisfies §§3.5–3.7, which is the form of GS, Main Theorem (v), p. 4 (see also §3.4, p. 12). *Route:* the dichotomy places each π in exactly one diagram; on Irr♠ the diagram prescribes the value j ∘ L_PD×(θ_D(π)), well defined because j(φ_τ) and j(φ_τ∨) are conjugate (§0.2); on Irr♥ it prescribes v ∘ L(π), and v is injective on Φ(G₂) (§0.4). *Needs:* §3.2, §0.2, §0.4.

**Checks.**

- The characterization uses no enhancement or labelling of fibres.
- On Irr♠ the diagram determines L(π) only up to j(φ_τ) ↔ j(φ_τ∨), which are conjugate.
- A map agreeing with L on Irr♥ and composing with the dual parameter on Irr♠ is still L.
- The spectral properties §§3.5–3.7 are not used: for π = St_G₂, which is generic and so lies in Irr♥, diagram (b) gives the v-image Sym⁶, the parameter of the restriction of θ(St_G₂) = St_PGSp₆ (§3.1), and §0.4 forces the principal parameter without the discreteness statement §3.7; since Irr♠ ⊔ Irr♥ is all of Irr(G₂), the diagrams alone determine the map.

### 3.15 Global–local compatibility at all places

Let k be totally real and Π a globally generic, regular algebraic cuspidal representation of split G₂ over k with a Steinberg component at a finite place. Fix a prime ℓ and an isomorphism ι : ℚ̄_ℓ ≅ ℂ. Prove that every semisimple ρ_Π : Gal(k̄/k) → GL₇(ℚ̄_ℓ) such that ι(ρ_Π(Frob_v)^ss) is conjugate to the image under v of the Satake class of Π_v in G₂(ℂ) for almost all v factors as v ∘ ρ̃ with ρ̃ valued in G₂(ℚ̄_ℓ), unique up to G₂(ℚ̄_ℓ)-conjugacy, and that for every finite place u the Frobenius-semisimplified Weil–Deligne representation of ρ̃ at u, with monodromy, transported to G₂(ℂ) by ι, is L(Π_u); at u | ℓ the Weil–Deligne representation is the one attached by Fontaine's functor to the potentially semistable representation (GS, Main Theorem (viii), p. 4; §3.4, p. 12). *Route:* the global theta lift Σ of Π to PGSp₆ is nonzero and globally generic (ExceptionalThetaCorrespondencesForG2 §10.6), with local component θ(Π_v) at every finite place (§10.3 with Howe duality for G₂ × PGSp₆, Layers 5–8), cuspidal by the split-steinberg-theta-cuspidality contract, and regular algebraic by real infinitesimal-character matching (§10.7); a globally generic constituent of its restriction to Sp₆ has standard transfer an isobaric sum of unitary cuspidal representations of general linear groups (ModularityAndLanglandsExtensions §5.1), whose components at the finite places are read from Arthur's packets (§§3.15, 3.17): at a bounded localization the component of the constituent lies in the tempered L-packet, and at an unbounded one it is a Whittaker-generic member of the packet, whose members are then irreducible standard modules with the parameter of the localization (§3.25); at the Steinberg place the component of Σ is θ(St_G₂) = St_PGSp₆ (explicit lift tables, Layer 8), with the irreducible seven-dimensional parameter Sym⁶, so the transfer is a single cuspidal representation of GL₇, regular algebraic with Satake parameters in v(G₂(ℂ)); §0.10 for the factorization; AG2.5 for compatibility at u ∤ ℓ; at u | ℓ the totally real polarized descent of AG2.6, whose full coefficient-prime comparison in rank seven assumes ExtremelyRegularIrreducibility 7, supplied by ModularityAndLanglandsExtensions §2.43; §0.4 and §3.9. *Needs:* §0.10, §3.2, §3.9; AutomorphicGaloisRepresentationsPartII, AG2.2, AG2.5, AG2.6; ModularityAndLanglandsExtensions §§2.43, 3.15, 3.17, 3.25, 5.1; ExceptionalThetaCorrespondencesForG2, Layers 5–8 (Howe duality and the tempered lift tables) and Layer 10 (*The global exceptional theta lift*, *Generic global nonvanishing*, *Real infinitesimal-character matching*) and the split-steinberg-theta-cuspidality contract.

**Checks.**

- At a Steinberg place u the Weil–Deligne representation is Sym⁶ with N ≠ 0; ordinary semisimplification would lose N and give the wrong parameter.
- At an unramified place u ∤ ℓ the statement reduces to the Satake condition.
- The choice of arithmetic or geometric Frobenius does not change the statement: it replaces ρ_Π by its dual, and every semisimple element of G₂(ℂ) is conjugate to its inverse, −1 lying in the Weyl group of G₂ (so the Chevalley involution of G₂ is inner): the eigenvalues 1, a^(±1), b^(±1), (ab)^(±1) of v at a toral element (§0.1) are stable under inversion; hence v ∘ ρ̃ is self-dual and L(Π_u) is conjugate to its contragredient, its composite with the Chevalley involution. Without ι the hypothesis compares a class of GL₇(ℚ̄_ℓ) with a class of G₂(ℂ) and has no meaning.
- Uniqueness is up to G₂-conjugacy; by §0.4 GL₇-conjugacy of v ∘ ρ̃ gives the same answer.
- The cuspidality of Σ is not read from the criteria of ExceptionalThetaCorrespondencesForG2, Layer 10, alone: for Π with Π_u ≅ St at one finite place u and unramified components elsewhere, §10.5 does not apply (it is stated for a totally definite O, and G₂ is split here) and §10.6 does not apply (there is no supercuspidal component); the contract gives it. The transfer then has one summand: the component at u has the parameter Sym⁶, of dimension 7 with SL₂-invariants of dimension 0, and an isobaric sum of two or more summands would have a reducible parameter there.
- Regularity passes from Π to the transfer: two distinct weights of the seven-dimensional representation of G₂ differ by a root or by twice a short root, so a regular infinitesimal character gives seven distinct weights (for the infinitesimal character ρ they are 3, 2, 1, 0, −1, −2, −3), while a character orthogonal to a long root gives two equal ones.
- The irreducibility input is universal, not about Π: ExtremelyRegularIrreducibility 7 asks, for every extremely regular conjugate-self-dual cuspidal representation of GL₇ over every imaginary CM field, one prime with irreducible Galois representation. The density-one set of §2.43 is nonempty (the empty set has density 0), so it supplies such a prime for each of them; irreducibility of the single seven-dimensional representation of Π would supply none for the others, and Π itself need not be extremely regular.

### Examples

- The subregular fibre's split members: L(θ(St_PGL₃^±)) is the subregular parameter (§§3.3–3.4).
- Gamma factors of St_G₂ × 1 equal those of St_GL₇ (§3.12).

### Dependencies

Layers 0–2; ExceptionalThetaCorrespondencesForG2, Layers 5–10 and the split-steinberg-theta-cuspidality, cubic-jordan-global-theta, cubic-period-global-theta and real-exceptional-theta-parameters contracts; ModularityAndLanglandsExtensions §§2.43, 3.8, 3.15, 3.17, 3.25, 5.1 and the symplectic-steinberg-generic-parameter, classical-discrete-packets, classical-packets-parabolic-induction and classical-packets-cuspidal-support contracts; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.29–10.31 and the gln-generic-local-converse and cubic-global-jacquet-langlands contracts; SmoothRepresentationsOfLocalGroups, SR.2–SR.3; SmoothRepresentationsOfLocalGroupsPartII, SRU.1.10; AutomorphicLFunctionsAndLocalFactors, AL.1.4, AL.R.2, AL.3; AutomorphicLFunctionsAndLocalFactorsPartII §10.0; AutomorphicFormsOnReductiveGroups §2.5; AutomorphicGaloisRepresentationsPartII, AG2.2, AG2.5, AG2.6; ClassFieldTheory, Layers 5 and 10; BorelRegulators §3.1.

## Layer 4: A₂ packets and cubic inner forms

### 4.1 Cubic inner forms and their central characters

Define the labelling of the three degree-three central simple algebras M₃(F), D₁, D₂ by their invariants 0, 1/3, 2/3 ∈ (1/3)ℤ/ℤ (ClassFieldTheory, Layer 5), and, through the Kottwitz pairing H¹(F, PGL₃) × Z(SL₃(ℂ)) → ℚ/ℤ with Z(SL₃(ℂ)) = μ₃, by the characters 1, χ, χ⁻¹ of μ₃, with the convention χ(ζ₃) = ζ₃ for the generator ζ₃ = e^(2πi/3) (GS, §3.5, pp. 14–15). For a discrete parameter φ_τ of PGL₃, the representations of PD₁× and PD₂× with parameter φ_τ are the Jacquet–Langlands transfers.

- The three classes have invariants 0, 1/3, 2/3; taking the opposite algebra negates the invariant and inverts the character.
- The Jacquet–Langlands transfer of the contragredient corresponds to the dual parameter, with the opposite algebra.
- The split class pairs with the trivial character of μ₃.

**Checks.**

- M₃(F) has invariant 0 and trivial character.
- D₁ and D₂ are opposite to each other, with characters χ and χ⁻¹, which are distinct characters of μ₃.
- Taking the opposite twice returns D₁; reversing the sign convention of the invariant map exchanges the labels of D₁ and D₂ simultaneously in every statement of this layer.

*Needs:* ClassFieldTheory, Layer 5; EndoscopicTransferAndUnitaryTraceComparison §§1.13, 4.7a; §0.2; ExceptionalThetaCorrespondencesForG2, Layer 5 (*Opposite division algebras and contragredients*).

### 4.2 Non-self-dual A₂ packets

Let φ = j ∘ φ_τ be discrete with φ_τ not self-dual, so S_φ ≅ μ₃. Prove: the split theta lift of τ is the unique generic member of L⁻¹(φ), labelled 1; the lifts of the Jacquet–Langlands transfers of τ to PD₁× and to PD₂× (equivalently, of τ∨ to PD₂× and to PD₁×, §4.1), when nonzero, are distinct members labelled χ and χ⁻¹; and every member of L⁻¹(φ) is one of these three lifts. The labelling is therefore an injection L⁻¹(φ) → Irr(μ₃); it is a bijection for p ≠ 3, where both division lifts are nonzero, and for p = 3 it is a bijection exactly when both division lifts are nonzero (GS, Proposition 3.2 and proof, pp. 14–16). *Route:* the dichotomy and Howe duality for the three pairs place each member of the fibre as a lift from M₃(F), D₁ or D₂ of the representation with parameter φ_τ or φ_τ∨; injectivity of theta makes the three lifts distinct (the lifts from D₁ and D₂ differ because τ ≇ τ∨); the split lift is nonzero in every residue characteristic (HD, Theorem 8.5(i)) and the division lifts for p ≠ 3. *Needs:* §4.1, §3.4; ExceptionalThetaCorrespondencesForG2, Layer 5 (*Howe duality for the cubic division pair*, *The residue-characteristic bound for division nonvanishing*) and Layer 8 (*Howe duality for all three exceptional pairs*).

**Checks.**

- The fibre has three elements for p ≠ 3, one generic.
- χ and χ⁻¹ are different characters of μ₃, so the two division lifts, when nonzero, are different members: they are lifts from one algebra of τ and of τ∨, and τ ≇ τ∨.
- At p = 3 the conclusion is an injection L⁻¹(φ) → Irr(μ₃), not a map Irr(μ₃) → L⁻¹(φ): a division lift may vanish, and when both vanish the fibre is the single generic member; the statement does not assert that all three labels occur.

### 4.3 Self-dual A₂ packets

Let φ = j ∘ φ_τ be discrete with φ_τ self-dual, so S_φ ≅ S₃. Prove, for p ≠ 3, a bijection L⁻¹(φ) ≅ Irr(S₃) = {1, sgn, std₂} with the generic member labelled 1: the two lifts θ(τ⁺) and θ(τ⁻) of the extensions of τ to PGL₃ ⋊ ⟨duality⟩ are the members labelled by the two characters trivial on μ₃ (1 for the generic one and sgn), and the division lift (the same representation from D₁ and D₂, which are exchanged by duality) is the member labelled std₂, whose restriction to μ₃ is χ ⊕ χ⁻¹. For p = 3 prove the corresponding injection L⁻¹(φ) → Irr(S₃) with the same labels: both split lifts θ(τ⁺) and θ(τ⁻) are nonzero for discrete τ in every residue characteristic (HD, Theorem 8.5(i)), so the injection is a bijection exactly when the division lift is nonzero; and since a self-dual discrete series of PGL₃ is St_PGL₃ or a self-dual supercuspidal, which exists only for p = 2 (ExceptionalThetaCorrespondencesForG2, Layer 5, *Nonzero minus lift for selfdual supercuspidals*), at p = 3 the only self-dual discrete φ_τ is Sym² and the injection is the bijection of §4.4 (GS, Proposition 3.2 and proof, pp. 14–16; HD, Theorems 8.2 and 8.5, PDF pp. 25–29). *Route:* the normalizer of μ₃ in S₃ acts by inversion; Clifford theory for the two extensions τ±; HD Theorem 8.5 separates the generic and nongeneric split lifts in every residue characteristic including 2; the central restriction of the division lift. The μ₃-centralizer construction used for §4.2 does not apply when S_φ = S₃, so this argument is separate. *Needs:* §4.1, §3.3, §0.2; ExceptionalThetaCorrespondencesForG2, Layer 5 (*PGL₃ outer extensions and their signs*, *Nonzero minus lift for selfdual supercuspidals*, *The split-E₆ lift table*).

**Checks.**

- |Irr(S₃)| = 3 while |S₃| = 6: the fibre has three elements, not six.
- std₂ restricted to μ₃ is χ ⊕ χ⁻¹, a sum of the two nontrivial characters; it is not a single Kottwitz character.
- sgn restricts trivially to μ₃, so the corresponding member comes from the split form, not from a division algebra.
- The direction at p = 3 is L⁻¹(φ) → Irr(S₃): a self-dual supercuspidal τ of PGL₃ would have S_φ = S₃ with a division lift of unknown nonvanishing at p = 3, but such τ exist only for p = 2, so the p = 3 case is the subregular fibre, where all three labels occur.

### 4.4 The subregular fibre

For the parameter φ trivial on W_F and subregular on SL₂, prove S_φ ≅ S₃ and L⁻¹(φ) = {π_gen[1], π_sc[1], π_deg[1]} labelled 1, sgn, std₂, where π_gen[1] and π_sc[1] are the lifts of St_PGL₃⁺ and St_PGL₃⁻ and π_deg[1] is the lift of the trivial representation of PD×; this holds for every p including p = 3 (GS, Proposition 3.2, p. 14; HD, Theorem 8.5, PDF pp. 27–29). *Needs:* §4.3, §3.4; ExceptionalThetaCorrespondencesForG2, Layer 1 (*Unipotent depth-zero supercuspidals*), Layer 5 and Layer 8.

**Checks.**

- π_sc[1] is supercuspidal although its parameter is nontrivial on SL₂; it is not generic.
- The subregular fibre is complete at p = 3: the division lift of the trivial representation of PD× is nonzero in every residue characteristic.
- π_gen[1] is the only generic member, and its PGSp₆ lift is the generic constituent of I₃(St_PGL₃), a tempered non-discrete representation.

### 4.5 Enhanced compatibility with the PGL₃ and division theta lifts

Assume p ≠ 3. Prove that for τ ∈ Irr(PGL₃(F)) the irreducible lifts of τ and τ∨ to G₂ are exactly the members of L⁻¹(j ∘ φ_τ) whose labels are trivial on the image of π₀ Z_(SL₃(ℂ))(φ_τ), and that for discrete τ the lifts of its Jacquet–Langlands transfers to PD× are exactly the members whose labels are nontrivial on that image; in the self-dual discrete case these are {1, sgn} and {std₂} (GS, Theorem 9.1(i), p. 26). The criterion is the restriction of an irreducible character of S_φ to the image of μ₃. *Needs:* §§4.2–4.3, §3.5, §3.8.

**Checks.**

- For τ the trivial representation of PGL₃ (non-discrete), the lift is the single member of a singleton fibre and its label is trivial.
- For a non-self-dual discrete τ, the split lift has label 1 and the two division lifts have labels χ, χ⁻¹, nontrivial on μ₃.
- Evaluating a character at one element of the centralizer instead of restricting it would misclassify std₂ (its trace at a generator of μ₃ is −1, neither 2 nor a cube root of unity).

### Examples

- The subregular fibre {π_gen[1], π_sc[1], π_deg[1]} with labels {1, sgn, std₂}.
- A non-self-dual cubic-twisted Steinberg χ ⊗ St_PGL₃: three members, labels 1, χ, χ⁻¹ for p ≠ 3.

### Dependencies

Layers 0 and 3; ClassFieldTheory, Layer 5; EndoscopicTransferAndUnitaryTraceComparison §§1.13, 4.7a; ExceptionalThetaCorrespondencesForG2, Layers 1, 5 and 8.

## Layer 5: Kret–Shin parameters and the exceptional spin identity

### 5.1 Kret–Shin parameters of generic discrete series

For a generic discrete series σ of PGSp₆(F), define KS(σ) ⊂ Φ(PGSp₆) as the set of discrete parameter classes φ̃ : WD_F → Spin₇(ℂ) with q ∘ φ̃ equal to the Arthur parameter of the restriction of σ to Sp₆(F) and s ∘ φ̃ equal to the parameter of SpinLift(σ) (GS, §5.2, paragraph after Proposition 5.1, p. 20). Existence and uniqueness are separate theorems.

- Every member has q-image the Arthur parameter of the restriction of σ and s-image the parameter of SpinLift(σ); membership is exactly discreteness together with these two equalities.
- Any two members have the same weak class (§0.6).

**Checks.**

- For σ = St_PGSp₆ the principal SL₂ parameter of Spin₇ is a member: q of it is Sym⁶ and s of it is 1 ⊕ Sym⁶ (§2.2 Examples).
- If χ · φ̃ changes the spin parameter (χ ⊗ s ∘ φ̃ ≇ s ∘ φ̃), then χ · φ̃ is not a member although it has the same q-image.
- For σ = θ(π) with π generic discrete series in Irr♦, i ∘ L(π) is a member (§5.3).

*Needs:* §2.2, §0.6; ModularityAndLanglandsExtensions §3.15 and the classical-discrete-packets contract (the q-image of a member is the parameter of a discrete series, which is discrete); EndoscopicTransferAndUnitaryTraceComparison §10.30.

### 5.2 Existence of Kret–Shin parameters

Prove that every generic discrete series σ of PGSp₆(F) has KS(σ) ≠ ∅, and that any two members are conjugate after multiplication by a quadratic character of W_F (GS, Proposition 5.1 and proof, p. 20). *Route:* globalize σ over a totally real field with a Steinberg place, a generic supercuspidal place and cohomological generic spin-regular discrete series at the real places (§1.6(i) with the PGSp₆ instance of its hypotheses: at each real place a ψ-generic discrete series with infinitesimal character λ_t + ρ of §1.7 for t large enough that every positive-coroot pairing exceeds the constants of the regular-real-unitarity and regular-real-isolation contracts); apply the Kret–Shin theorem to the cuspidal Σ; Σ is globally generic with a Steinberg place, so its similitude lift to split PGSO₈ is nonzero and cuspidal and SpinLift(Σ) is defined (§2.3, second statement); compare s ∘ ρ_Σ with the Galois representations of the isobaric summands of SpinLift(Σ) by Chebotarev, after checking that each summand is regular algebraic with the correct shift; read off the local parameter at the place v₀ of σ from local–global compatibility with N at a place not above ℓ. Local–global compatibility gives at v₀ the localization ψ_v₀ of the global parameter of the restriction of Σ to Sp₆, and the component of a globally generic constituent of that restriction is a Whittaker-generic member of the packet of ψ_v₀ (§3.17), so ψ_v₀ is generic in the sense of §3.25; that packet is the tempered L-packet of ψ_v₀ when ψ_v₀ is bounded (§3.15), and consists of irreducible standard modules induced from proper parabolic subgroups when it is unbounded (§3.25), which the constituents of the restriction of the discrete series σ, themselves discrete series, are not; so ψ_v₀ is bounded and is the parameter (§2.0) of the restriction of σ, discrete because σ is square-integrable (classical-discrete-packets contract), while the spin side at the generic place v₀ is §2.3, the global Arthur parameter of the pullback of the lift of Σ being generic by its second statement. Two Spin₇-lifts of one SO₇-parameter differ by a character W_F → μ₂. *Needs:* §5.1, §1.6, §1.7, §2.0, §2.3 (both statements); AutomorphicFormsOnReductiveGroups, regular-real-isolation contract; AutomorphicGaloisRepresentationsPartII, AG2.2 and AG2.5, and the kret-shin-gspin-galois contract; ModularityAndLanglandsExtensions §§3.15, 3.17, 3.25 and the classical-discrete-packets contract; Chebotarev, Layer 10.

**Checks.**

- Two members may differ by a nontrivial quadratic χ with χ ⊗ s ∘ φ̃ ≅ s ∘ φ̃; existence does not give a singleton.
- The globalization must keep a Steinberg place: the Kret–Shin theorem assumes it.
- Spin regularity at infinity is checked on the explicit weight h = (8t+3, 4t+2, 2t+1) of §1.7, whose eight spin weights (±h₁ ± h₂ ± h₃)/2 are distinct; at t = 1 they are ±10, ±7, ±4, ±1.

### 5.3 Uniqueness of Kret–Shin parameters on the diamond image

If π is a generic discrete series of G₂(F) in Irr♦ and σ = θ(π), prove that σ is a generic discrete series and KS(σ) = {i ∘ L(π)} (GS, Proposition 5.2 and proof, pp. 20–21). *Route:* globalize π with a Steinberg place u (§1.6, with a generic supercuspidal at w whose PGSp₆ lift is supercuspidal), take an irreducible constituent Σ of the global exceptional lift, which is nonzero, globally generic and cuspidal (ExceptionalThetaCorrespondencesForG2, §10.6) with Σ_u ≅ θ(St_G₂) = St_PGSp₆ (explicit lift tables); by §2.3, second statement, its similitude lift to split PGSO₈ is nonzero and cuspidal and SpinLift(Σ) is defined; almost everywhere s ∘ i = 1 ⊕ v gives SpinLift(Σ) = 1 ⊞ (standard transfer of Σ) by isobaric strong multiplicity one, so s ∘ i ∘ L(π) is the local spin parameter (at the place of π the component of a globally generic constituent of the restriction of Σ to Sp₆ is a Whittaker-generic discrete series in the packet of the localization; that localization is bounded, since the members of the packet of an unbounded generic parameter are irreducible standard modules induced from proper parabolic subgroups (ModularityAndLanglandsExtensions §3.25), so it is the parameter v ∘ L(π) of that tempered L-packet (§§3.15, 3.17, and §3.2)); any other member is a quadratic twist (§5.2) and §0.5 makes it conjugate. *Needs:* §5.2, §0.5, §1.6, §2.3 (both statements), §3.2; ModularityAndLanglandsExtensions §§3.15, 3.17, 3.25; AutomorphicLFunctionsAndLocalFactors, AL.3 (isobaric strong multiplicity one); ExceptionalThetaCorrespondencesForG2, Layer 8 (discrete-series trichotomy, explicit lift tables) and Layer 10 (§10.6, generic global nonvanishing and cuspidality).

**Checks.**

- The hypothesis θ(π) discrete is necessary: π_gen[1] is generic discrete with non-discrete θ(π_gen[1]), and the statement is not applied to it.
- For π = St_G₂, KS(St_PGSp₆) is the single principal parameter.
- The conclusion is a single Spin₇-class, stronger than a single weak class.

### 5.4 The spin identity on the diamond locus

For generic discrete series π ∈ Irr♦(G₂), prove that the parameter of SpinLift(θ(π)) is s ∘ i ∘ L(π) = 1 ⊕ v ∘ L(π) (GS, Corollary 5.3, p. 21). *Needs:* §5.3, §0.1.

**Checks.**

- For π = St_G₂ both sides are 1 ⊕ Sym⁶.
- The trivial summand is present for every π in the statement; a spin parameter without an invariant line is not of the form s ∘ i ∘ φ.
- Dimensions: 8 = 1 + 7.

### 5.5 The spin identity for the Siegel-induced partners

Let π be a generic discrete series in Irr♣(G₂) coming from a discrete τ of PGL₃ with parameter φ_τ. By the tempered Siegel table, θ(π) = I₃(τ) when τ is not self-dual and θ(π) = I₃(τ)_gen, the generic constituent, when τ is self-dual (HD, Theorem 15.2, PDF pp. 52–53). Prove that the parameter of SpinLift(θ(π)) is φ_τ ⊕ φ_τ∨ ⊕ 1 ⊕ 1 = s ∘ i ∘ j ∘ φ_τ (GS, §1.1(vi), p. 4; §3.2, p. 11). *Route:* compute the similitude theta lift of the generic Siegel constituent to PGSO₈, apply f₂ and Arthur's correspondence for SO₈, keeping the full parameter of the constituent, which is read from the Levi subgroup by the classical-packets-parabolic-induction contract. This includes π_gen[1]. *Needs:* §3.4, §2.2, §0.1; MetaplecticAutomorphicForms, pgsp6-pgso8-induction-principle contract; ModularityAndLanglandsExtensions, classical-packets-parabolic-induction contract; ExceptionalThetaCorrespondencesForG2, Layer 8 (*The E₆-to-E₇ tempered Siegel table*); EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- For τ = St_PGL₃, φ_τ = Sym² and the spin parameter is Sym² ⊕ Sym² ⊕ 1 ⊕ 1, of dimensions 3 + 3 + 1 + 1; an irreducible eight-dimensional SL₂-module (Sym⁷) is excluded.
- θ(π) is tempered and not a discrete series, so §5.3 does not apply and this statement is separate.
- The parameter equals s ∘ i ∘ L(π) by §0.1 and §3.4: v ∘ j ∘ φ_τ = 1 ⊕ φ_τ ⊕ φ_τ∨.

### 5.6 The spin identity for every generic discrete series of G₂

Prove that for every generic discrete series π of G₂(F), θ(π) is a nonzero generic tempered representation of PGSp₆(F) and the parameter of SpinLift(θ(π)) is s ∘ i ∘ L(π); θ(π) is a discrete series on Irr♦ and a Siegel-induced tempered representation on Irr♣ (GS, Main Theorem (vi), p. 4, with generic tempered intermediate codomain). *Route:* generic π is not in Irr♠ (the PD× lifts are not generic), so §5.4 or §5.5 applies. *Needs:* §5.4, §5.5; ExceptionalThetaCorrespondencesForG2, Layer 8.

**Checks.**

- π_gen[1] ∈ Irr♣ is generic discrete with θ(π_gen[1]) tempered non-discrete: the intermediate codomain of the diagram is generic tempered, not generic discrete.
- π_deg[1] ∈ Irr♠ is not generic and is outside the statement.
- On Irr♦ the statement is §5.4.

### Examples

- St_G₂ ↦ St_PGSp₆ ↦ spin parameter 1 ⊕ Sym⁶.
- π_gen[1] ↦ I₃(St_PGL₃)_gen ↦ spin parameter Sym² ⊕ Sym² ⊕ 1 ⊕ 1.

### Dependencies

Layers 0–3; ModularityAndLanglandsExtensions §§3.15, 3.17, 3.25 and the classical-discrete-packets and classical-packets-parabolic-induction contracts; AutomorphicFormsOnReductiveGroups, regular-real-isolation contract; AutomorphicGaloisRepresentationsPartII, AG2.2, AG2.5 and the kret-shin-gspin-galois contract; Chebotarev, Layer 10; AutomorphicLFunctionsAndLocalFactors, AL.3; MetaplecticAutomorphicForms §3.41 and the pgsp6-pgso8-induction-principle contract; ExceptionalThetaCorrespondencesForG2, Layers 8 and 10.

## Layer 6: Diamond fibres and distinguished Xu packets

### 6.1 Surjectivity onto diamond discrete parameters

Prove that for every φ ∈ Φ♦_ds(G₂) there is a generic discrete series π with L(π) = φ, in every residue characteristic (GS, Proposition 6.1 and proof, pp. 21–22). *Route:* when φ is nontrivial on SL₂, read π from the explicit lift tables, the parameter of its non-supercuspidal discrete-series lift being read from its supercuspidal support (classical-discrete-packets and classical-packets-cuspidal-support contracts). When φ is trivial on SL₂, take the generic representation σ₀ of Sp₆(F) with parameter q ∘ i ∘ φ, which is a supercuspidal discrete series (classical-discrete-packets contract and part (a) of the classical-packets-cuspidal-support contract), and a generic σ of PGSp₆(F) whose restriction contains σ₀, which is a supercuspidal discrete series because its restriction is; a member of KS(σ) (§5.2) differs from i ∘ φ by a quadratic character χ, so replacing σ by σ ⊗ χ ∘ sim (§2.5) gives KS(σ) ∋ i ∘ φ; then L(s, σ, spin) = L(s, SpinLift(σ)) (§2.4) has a pole at s = 0 by §0.3, and the supercuspidal spin-pole criterion gives a nonzero G₂ lift π with θ(π) = σ, so that v ∘ L(π) is the parameter q ∘ i ∘ φ of σ₀ (§3.2) and L(π) = φ (§0.4). *Needs:* §0.3, §0.4, §2.4, §2.5, §3.2, §5.2; ExceptionalThetaCorrespondencesForG2, Layer 8 (*The supercuspidal spin-pole criterion*, explicit tables); ModularityAndLanglandsExtensions §§3.15, 3.19 and the classical-discrete-packets and classical-packets-cuspidal-support contracts; AutomorphicLFunctionsAndLocalFactorsPartII, pgsp6-shahidi-spin-factor contract.

**Checks.**

- For φ the principal SL₂ parameter, π = St_G₂.
- The pole criterion uses the analytic spin L-factor of a generic σ; an eigenvalue 1 of a formal Satake parameter is not the hypothesis.
- The parameters in the A₂ image are excluded here; they are §§4.2–4.4.

### 6.2 The unique generic member of a diamond fibre

For φ ∈ Φ♦_ds(G₂) prove that L⁻¹(φ) has exactly one generic member; equivalently, among the generic representations of PGSp₆(F) whose Sp₆-restriction has parameter q ∘ i ∘ φ, exactly one has nonzero G₂ lift (GS, Proposition 8.1 and proof, pp. 23–24). *Route:* the generic lifts to PGSp₆ of the generic representation of Sp₆(F) with that parameter form a homogeneous set under quadratic twists; §5.3 and §2.5 make their KS parameters χ · (i ∘ φ); Xu's equality of the self-twist stabilizers of representations and of parameters identifies the one with KS parameter i ∘ φ; Howe duality returns to G₂. *Needs:* §2.5, §5.3, §6.1; ModularityAndLanglandsExtensions §3.19; ExceptionalThetaCorrespondencesForG2, Layer 8.

**Checks.**

- For φ principal the generic member is St_G₂ and the unique PGSp₆ partner is St_PGSp₆; its twist by the unramified quadratic χ ∘ sim has zero G₂ lift.
- The quadratic action on the homogeneous set may have a nontrivial stabilizer; the argument does not assume it is free.
- Nongeneric members of L⁻¹(φ) are not counted here.

### 6.3 The distinguished member of Xu's packets

For φ ∈ Φ♦_ds(G₂) put φ♭ = q ∘ i ∘ φ and define X*(φ) as the unique one of Xu's packets of PGSp₆(F) over φ♭ containing θ(π_gen), where π_gen is the generic member of L⁻¹(φ) (GS, §8.2, p. 24).

- θ(π_gen) ∈ X*(φ).
- One of Xu's packets over φ♭ is X*(φ) exactly when its generic member has nonzero G₂ lift.
- Restriction to Sp₆ identifies X*(φ) with the set of PGSp₆(F)-orbits of representations of Sp₆(F) with parameter φ♭.

**Checks.**

- For φ principal, X*(φ) = {St_PGSp₆}.
- No other of Xu's packets over φ♭ can contain θ(π_gen), because Xu packets over φ♭ are disjoint.
- If a quadratic χ fixes i ∘ φ, then X*(φ) ⊗ χ = X*(φ) (equality of stabilizers), and no second distinguished member of Xu's packets arises.

*Needs:* §6.2; ModularityAndLanglandsExtensions §3.19.

### 6.4 Globalization with two identical local components

For π in L⁻¹(φ) with φ ∈ Φ♦_ds(G₂), prove that there are a totally real k with two finite places w₁, w₂, k_w₁ ≅ k_w₂ ≅ F, and a cuspidal Π with Π_w₁ ≅ Π_w₂ ≅ π and cuspidal nonzero PGSp₆ lift Σ whose Sp₆-restriction has a generic global parameter: for generic π on split G₂ (§1.6(i) with its G₂ instance: π isolated by §1.5) with an auxiliary generic depth-zero supercuspidal place whose PGSp₆ lift is supercuspidal and, at the real places, ψ-generic discrete series whose infinitesimal characters pair with every positive coroot beyond the constants of the regular-real-unitarity and regular-real-isolation contracts; for nongeneric π (supercuspidal here) on the totally definite octonion form with a Steinberg place (GS, proof of Lemma 8.3, pp. 24–25). The parameter is generic in the first route because Σ is globally generic (ModularityAndLanglandsExtensions §5.1) and in the second because Σ has the component St_PGSp₆ at the Steinberg place (symplectic-steinberg-generic-parameter contract). *Needs:* §1.4, §1.6; ExceptionalThetaCorrespondencesForG2, Layer 8 (*A generic depth-zero lift example*) and Layer 10 (nonvanishing, cuspidality criteria, real infinitesimal-character matching); ModularityAndLanglandsExtensions §5.1 and the symplectic-steinberg-generic-parameter contract; AutomorphicFormsOnReductiveGroups, regular-real-unitarity contract (the real components of the lift are discrete series) and regular-real-isolation contract (isolation and genericity at the real places).

**Checks.**

- The two places carry the same representation, so later substitutions at both places change the global sign by a square.
- In the nongeneric route the octonion algebra is over k, definite at the real places and split at the finite places.
- A nongeneric discrete π in a diamond fibre is supercuspidal, so the Steinberg route of §1.4 applies to it.

### 6.5 One in, all in

For one X of Xu's packets over φ♭ = q ∘ i ∘ φ with φ ∈ Φ♦_ds(G₂), prove that either every member of X has nonzero theta lift to split G₂ or none does (GS, Lemma 8.3 and proof, pp. 24–25). *Route:* start from σ = θ(π) ∈ X and σ′ ∈ X; globalize two copies of π (§6.4) to Σ; replace both components σ by σ′ — Xu's multiplicity formula allows it because the two equal local sign changes cancel — to get a cuspidal Σ′ nearly equivalent to Σ; then L^S(s, Σ′, spin) = ζ^S(s) L^S(s, Σ, std), which has a pole at s = 1 because L^S(s, Σ, std) is nonzero at 1 for a generic global parameter; the global spin-pole converse gives a nonzero lift of Σ′ to some form of G₂ over k, split at w₁, so σ′ lifts locally. *Needs:* §6.4; ModularityAndLanglandsExtensions §3.27; AutomorphicLFunctionsAndLocalFactors, AL.3 (isobaric strong multiplicity one, boundary nonvanishing); ExceptionalThetaCorrespondencesForG2, spin-pole-global-converse contract (GS20, Theorem 1.1).

**Checks.**

- One-place substitution changes the global sign by a local character value that need not be 1; with two identical places the product is a square and equals 1.
- The pole comes from ζ^S(s) at s = 1; L^S(s, Σ, std) nonvanishing at 1 is part of the argument and holds because the parameter is generic.
- GS20 Theorem 1.1 is stated over ℚ; the argument needs it over the totally real k of §6.4, which is the supplier contract.

### 6.6 A diamond fibre is one of Xu's packets

Prove that theta gives a bijection L⁻¹(φ) ≅ X*(φ) for each φ ∈ Φ♦_ds(G₂), and that no other of Xu's packets over φ♭ meets the image of theta (GS, Proposition 8.2, p. 24; §8.5, p. 25). *Route:* all of X*(φ) lifts by §6.5; their v-parameters recover φ by §0.4; the generic member of any other of these packets does not lift (§6.2), so none of it does (§6.5); Howe duality gives injectivity. *Needs:* §6.2, §6.3, §6.5, §0.4; ExceptionalThetaCorrespondencesForG2, Layer 8.

**Checks.**

- The bijection includes nongeneric members.
- For φ principal both sides are singletons {St}.
- The number of members equals the size of X*(φ), which is |Irr(S_φ)| (§6.7), not |S_φ| when S_φ is nonabelian.

### 6.7 Enhancements of diamond fibres

For φ ∈ Φ♦_ds(G₂) define the enhancement bijection L⁻¹(φ) ≅ Irr(S_φ) as the composite of theta L⁻¹(φ) ≅ X*(φ) (§6.6), Xu's Whittaker-normalized labelling X*(φ) ≅ Irr(S_(i∘φ)/image μ₂), and S_φ ≅ S_(i∘φ)/image μ₂ (§0.3) (GS, §8.3, p. 24).

- The assignment is a bijection with Irr(S_φ) in every residue characteristic.
- The generic member corresponds to the trivial character.
- The theta partner of the member labelled η has Xu label η pulled back through the central quotient.

**Checks.**

- For φ principal, S_φ = 1 and the fibre is {St_G₂}.
- A raw character of S_(i∘φ) nontrivial on the image of μ₂ is not a label of a PGSp₆ representation and has no G₂ counterpart.
- The fibre size is |Irr(S_φ)|, which differs from |S_φ| whenever S_φ is nonabelian (for S₃ the counts are 3 and 6); a labelling by elements of S_φ instead of irreducible characters is excluded.

*Needs:* §6.6, §0.3; ModularityAndLanglandsExtensions §3.19.

### Examples

- φ principal: L⁻¹(φ) = {St_G₂}, X*(φ) = {St_PGSp₆}, S_φ = 1.
- A diamond φ trivial on SL₂ with S_φ = 1: the fibre is a single generic supercuspidal representation, and X*(φ) is a single generic supercuspidal representation of PGSp₆(F) whose spin L-factor has a pole at 0.

### Dependencies

Layers 0–5; ModularityAndLanglandsExtensions §§3.15, 3.19, 3.27, 5.1 and the symplectic-steinberg-generic-parameter, classical-discrete-packets and classical-packets-cuspidal-support contracts; AutomorphicLFunctionsAndLocalFactors, AL.3; AutomorphicLFunctionsAndLocalFactorsPartII, pgsp6-shahidi-spin-factor contract; AutomorphicFormsOnReductiveGroups, regular-real-unitarity and regular-real-isolation contracts; ExceptionalThetaCorrespondencesForG2, Layers 8 and 10 and the spin-pole-global-converse contract.

## Layer 7: The G₂ correspondence and its enhanced theta applications

### 7.1 The local Langlands correspondence for split G₂

Prove that L : Irr(G₂(F)) → Φ(G₂) is surjective with finite fibres and satisfies: discrete-series detection (§3.7); temperedness and tempered induction (§3.6); the Langlands-quotient property (§3.5); the two theta diagrams (§3.2); the characterizations by the diagrams (§3.14) and by gamma factors (§3.13); the spin diagram on generic discrete series with generic tempered intermediate codomain (§5.6); preservation of G₂ × GL_r gamma factors (§3.12); global–local compatibility under the hypotheses of §3.15; and for every φ a natural bijection L⁻¹(φ) ≅ Irr(S_φ) when p ≠ 3, and for p = 3 the same outside j(Φ_ds(PGL₃)), where there is a natural injection L⁻¹(φ) → Irr(S_φ), with the labels of §§4.2–4.3, that is a bijection whenever the division lifts are nonzero and in particular for the subregular parameter; for bounded φ the trivial character corresponds to the unique generic member (GS, Main Theorem, pp. 3–4). *Route:* the nontempered parameters (§3.5), the bounded non-discrete parameters (§3.8), the discrete A₂ parameters (§§4.2–4.4) and the diamond discrete parameters (§§6.1, 6.7) exhaust Φ(G₂). *Needs:* §§3.5–3.8, 3.12–3.15, §§4.2–4.4, §5.6, §§6.1, 6.7.

**Checks.**

- At p = 3 the A₂ statement is an injection L⁻¹(φ) → Irr(S_φ) whose image omits the labels of vanishing division lifts: the conclusion is not promoted to a bijection on the discrete PGL₃ image, except for the subregular parameter (§4.4) and the fibres whose division lifts are nonzero.
- The fibre over the subregular parameter has three elements and S_φ = S₃ has six elements.
- The fibre over the principal parameter is {St_G₂} and over the unramified parameter of the trivial representation is {1}.

### 7.2 The generic supercuspidal correspondence

Prove that L restricts to a bijection between generic supercuspidal representations of G₂(F) and discrete parameters trivial on SL₂(ℂ) (GS, §1.4, p. 6; HKT, abstract, p. 1, with Theorem 3.3, p. 17, for surjectivity and §4, Proposition 4.3, Lemma 4.4 and Proposition 4.5 with the construction that follows it, pp. 18–22, for injectivity). *Route:* each discrete parameter trivial on SL₂ has a unique generic member (§§4.2–4.3 on the A₂ image, §6.2 on the diamond locus), and it is supercuspidal by the explicit lift tables; a generic supercuspidal has a discrete parameter trivial on SL₂ by the same tables. *Needs:* §7.1, §6.2, §§4.2–4.3; ExceptionalThetaCorrespondencesForG2, Layer 8.

**Checks.**

- π_sc[1] is supercuspidal and nongeneric, with parameter nontrivial on SL₂: dropping genericity makes the restriction non-injective onto its image and the image larger.
- St_G₂ is generic and discrete but not supercuspidal; its parameter is nontrivial on SL₂.
- For a non-self-dual discrete φ_τ trivial on SL₂ with p ≠ 3 the fibre of j ∘ φ_τ has three members and only the split lift is generic; the bijection picks that one.

### 7.3 The partial PGSp₆ correspondence on diamond orbits

For φ ∈ Φ♦_ds(G₂) and φ♭ = q ∘ i ∘ φ, the Xu packets over φ♭ and the Spin₇-lifts of φ♭ are homogeneous sets for the quadratic characters of W_F. Define the bijection between them that sends X*(φ) to i ∘ φ and X*(φ) ⊗ χ ∘ sim to χ · (i ∘ φ), with each of these packets labelled by Irr(S_(φ̃)/image μ₂) (GS, §9, p. 26).

- The distinguished X*(φ) is assigned i ∘ φ.
- Twisting one of these packets by χ twists its assigned parameter by χ.
- Two characters χ, χ′ give equal twists X*(φ) ⊗ χ ∘ sim and X*(φ) ⊗ χ′ ∘ sim exactly when they give the same parameter (Xu's equality of stabilizers), so the assignment is well defined and bijective.
- Each matched member of Xu's packets carries Xu's labelling by characters of the central quotient.

**Checks.**

- χ = 1 recovers X*(φ) and i ∘ φ.
- A nontrivial χ fixing i ∘ φ also fixes X*(φ), and no duplicate member of Xu's packets is created.
- Labelling by Irr of the raw component group S_(φ̃) instead of its quotient by image μ₂ adds characters that label no representation of PGSp₆(F).

*Needs:* §6.3, §6.7; ModularityAndLanglandsExtensions §3.19.

### 7.4 Enhanced compatibility of G₂–PGSp₆ theta

For φ ∈ Φ♦_ds(G₂), prove that if π has enhanced parameter (φ, η), then θ(π) has assigned parameter i ∘ φ (§7.3) and Xu label η′ with η = η′ ∘ i_* through S_φ ≅ S_(i∘φ)/image μ₂ (GS, Theorem 9.1(ii), pp. 26–27, restricted to the diamond discrete range where the assignment of §7.3 is defined). *Needs:* §7.3, §6.7.

**Checks.**

- For π ∈ Irr♠, θ(π) to PGSp₆ is zero, so the statement is restricted to Φ♦_ds.
- For π_gen[1] ∈ Irr♣ the PGSp₆ partner is not discrete and §7.3 assigns it no enhanced parameter; the statement does not cover it.
- For φ principal, η and η′ are both trivial.

### Examples

- The three packets over the principal, subregular and a non-self-dual A₂ parameter, of sizes 1, 3 and 3 (p ≠ 3).

### Dependencies

Layers 3–6; ModularityAndLanglandsExtensions §3.19; ExceptionalThetaCorrespondencesForG2, Layer 8.

## Layer 8: Classical global theta and the discrete heart parameters

### 8.1 The classical theta lift of a heart globalization

If σ in §1.7 lies in Irr♥(PGSp₆) (the classical locus lifting to split PGSO₈), prove that the global similitude lift of Σ to split PGSO₈ is nonzero and cuspidal, with local components the nonzero local lifts (GS, Lemma 12.5 and proof, pp. 37–38). *Route:* at v₀ use the heart hypothesis; at v₁ the component St is generic and its local lift is nonzero (MetaplecticAutomorphicForms §3.41); at the other finite places the component is χ_v ∘ sim ⊗ σ_v⁰ with χ_v quadratic and σ_v⁰ unramified of Satake parameter s̃ ∈ Spin₇(ℂ); the restriction of Σ to Sp₆ has a generic global parameter which is a single unitary cuspidal representation Π of GL₇, because its component at v₁ is the Steinberg representation, of irreducible parameter Sym⁶ (symplectic-steinberg-generic-parameter contract; ModularityAndLanglandsExtensions §§3.8, 3.15, 3.17), and q(s̃), with eigenvalues λ₁^(±1), λ₂^(±1), λ₃^(±1), 1, is the Satake parameter of Π_v, so `q^(−1/2) < |λ_i| < q^(1/2)` (AutomorphicLFunctionsAndLocalFactors, AL.3.3.8); the roots of Spin₇, which are the coroots of PGSp₆, take on s̃ the values λ_i^(±1) and λ_i^(±1) λ_j^(±1) (i < j), all of absolute value strictly between q⁻¹ and q, so no value is `q^(±1)`, the unramified principal series with Satake parameter s̃ is irreducible and σ_v⁰ is generic (SmoothRepresentationsOfLocalGroupsPartII, SRU.5.4, *unramified-principal-series-irreducibility*, and SRU.5.5, *spherical-generic-criterion*, PGSp₆ being split, adjoint and quasi-simple), hence so is its twist, and §3.41 gives the nonzero local lift, in every residue characteristic; at the real places the components are generic discrete series with nonzero local lifts (pgsp6-pgso8-archimedean-generic-theta contract); L^S(s, Σ, std) ≠ 0 at s = 1 for the generic global parameter (boundary nonvanishing of the isobaric transfer); the similitude Rallis inner product formula gives nonvanishing; the Steinberg place has zero lift to PGO₆ (pgsp6-steinberg-pgo6-vanishing contract), so the lift to PGSO₈ is the first occurrence and is cuspidal. *Needs:* §1.7; MetaplecticAutomorphicForms §§3.10, 3.41, 3.42 and the pgsp6-similitude-rallis, pgsp6-steinberg-pgo6-vanishing and pgsp6-pgso8-archimedean-generic-theta contracts; ModularityAndLanglandsExtensions §§3.8, 3.15, 3.17 and the symplectic-steinberg-generic-parameter contract; AutomorphicLFunctionsAndLocalFactors, AL.3 (boundary nonvanishing; the Jacquet–Shalika bound AL.3.3.8); SmoothRepresentationsOfLocalGroupsPartII, SRU.5.4 (*unramified-principal-series-irreducibility*) and SRU.5.5 (*spherical-generic-criterion*).

**Checks.**

- Without the heart hypothesis at v₀ the local lift to split PGSO₈ may vanish and the conclusion fails: a σ in the classical spade locus lifts only to the quaternionic tower.
- St_PGSp₆ has zero lift to PGO₆ (its parameter Sym⁶ does not factor through Spin₆), which is what makes PGSO₈ the first occurrence.
- Nonvanishing at s = 1 is a boundary statement (Re s = 1) for a generic parameter, not a central value.
- Unramified alone does not give genericity: the trivial representation of PGSp₆(F) has (λ₁, λ₂, λ₃) = (q³, q², q) (the eigenvalues q^(±3), q^(±2), q^(±1), 1 of the principal SL₂ of SO₇ at diag(q^(1/2), q^(−1/2)), as for v ∘ L(1) in §3.2) and Whittaker space 0, and its principal series is reducible, the short root ε₁ − ε₂ of PGSp₆ having coroot value λ₁ λ₂⁻¹ = q. It cannot be a component of Σ, since |λ₁| = q³ ≥ `q^(1/2)` violates the Jacquet–Shalika bound for the unitary cuspidal Π of GL₇; the bound is what places the unramified components under §3.41.

### 8.2 Kret–Shin parameters of discrete heart representations

For every discrete series σ ∈ Irr♥(PGSp₆), prove that there is a discrete Spin₇-valued parameter φ̃ with q ∘ φ̃ the Arthur parameter of the restriction of σ and s ∘ φ̃ the parameter of the triality-theta GL₈-transfer of σ, and that its weak class is unique (GS, Theorem 12.3, p. 36; conclusion of §12.6, p. 38). *Route:* apply the Kret–Shin theorem to Σ of §1.7, whose Steinberg, cohomological and spin-regular hypotheses hold; Kret–Shin Proposition 13.1(4) gives irreducibility of the eight-dimensional spin Galois representation; the global transfer SpinLift(Σ) of §2.3 is isobaric with regular algebraic summands; comparing Galois representations by Chebotarev identifies their sum with s ∘ ρ_Σ, irreducibility forces a single cuspidal summand, and local–global compatibility with N at a place not above ℓ gives at v₀ the localizations of the global parameters of the restriction of Σ to Sp₆ and of the pullback along f₂ of its lift Θ(Σ) to SO₈ (§8.1, with Θ(Σ)_v₀ = θ(σ)). These localizations are the parameters (§2.0) of the restriction of σ and of a constituent of the pullback of θ(σ): each component lies in the packet of the localization (§3.17); both global parameters are generic in the sense of §3.25, since each is a single cuspidal representation of GL₇, respectively GL₈, of orthogonal type with trivial central character, hence by the image statement of §5.1 the transfer of a globally generic cuspidal representation of Sp₆, respectively split SO₈, with that global parameter by isobaric strong multiplicity one (AL.3); so the packet of a bounded localization is its tempered L-packet (§3.15) and that of an unbounded one consists of irreducible standard modules with its L-parameter (§3.25). On the Sp₆ side the localization is bounded, σ being a discrete series, and it is discrete (classical-discrete-packets contract), so φ̃ is discrete. *Needs:* §1.7, §8.1, §2.0, §2.3, §0.6; AutomorphicGaloisRepresentationsPartII, AG2.2, AG2.5 and the kret-shin-gspin-galois contract; ModularityAndLanglandsExtensions §§3.15, 3.17, 3.25, 5.1 and the classical-discrete-packets contract; AutomorphicLFunctionsAndLocalFactors, AL.3 (isobaric strong multiplicity one); Chebotarev, Layer 10.

**Checks.**

- The spin condition is needed for uniqueness: for σ = St_PGSp₆ the principal parameter φ̃ and χ · φ̃, χ the unramified quadratic character, both have q-image Sym⁶, but their spin images are 1 ⊕ Sym⁶ and χ ⊗ (1 ⊕ Sym⁶), with traces 8 and −8 at (Frobenius, 1); only the first is the parameter 1 ⊕ Sym⁶ of SpinLift(St_PGSp₆), so the q-condition alone leaves two weak classes and the s-condition selects one.
- The weights of a Hodge cocharacter alone exclude spin regularity when it factors through the principal PGL₂ or through G₂: on the principal SL₂ the spin representation is Sym⁶ ⊕ 1, with weights 6, 4, 2, 0, 0, −2, −4, −6, so the zero weight has multiplicity 2 where spin regularity demands eight distinct weights; on G₂ the fixed line of s ∘ i and the zero weight of v give the same repeated 0. A finite-place local parameter is a different object: the Steinberg component at v₁ has the principal parameter with this repeated zero spin weight and is allowed, since spin regularity is imposed on the global Hodge cocharacter at the real places, where h = (11, 6, 3) gives the eight distinct weights ±10, ±7, ±4, ±1. Kret–Shin Proposition 13.1(4) is applied with all three of its hypotheses (Steinberg place, cohomological, spin-regular); they are the hypotheses of that theorem, not a mechanism making a repeated weight regular.
- For σ = St_PGSp₆ the parameter is the principal parameter of Spin₇.

### Examples

- Σ with real weight λ₁ = (8, 4, 2) and h = (11, 6, 3) (§1.7), Steinberg at v₁.

### Dependencies

Layers 0–2 and §1.7; MetaplecticAutomorphicForms §§3.10, 3.41, 3.42 and the pgsp6-similitude-rallis, pgsp6-steinberg-pgo6-vanishing and pgsp6-pgso8-archimedean-generic-theta contracts; ModularityAndLanglandsExtensions §§3.8, 3.15, 3.17, 3.25, 5.1 and the symplectic-steinberg-generic-parameter, classical-discrete-packets and classical-packets-cuspidal-support contracts; AutomorphicLFunctionsAndLocalFactors, AL.3 (including AL.3.3.8); SmoothRepresentationsOfLocalGroupsPartII, SRU.5.4 and SRU.5.5; AutomorphicGaloisRepresentationsPartII, AG2.2, AG2.5 and the kret-shin-gspin-galois contract; Chebotarev, Layer 10.

## Layer 9: The extended spin transfer and joint Spin₇-lifts

### 9.1 The spin transfer on every representation of PGSp₆

Using the classical partition Irr(PGSp₆) = Irr♥ ⊔ Irr♠ of MetaplecticAutomorphicForms §3.42, with Irr♣ ⊂ Irr♥ the representations already occurring for PGO₆, define SpinLift(σ) on Irr♥ as the f₂-transform of the lift to PGSO₈ followed by Arthur's transfer to GL₈ (as in §2.2), and on Irr♠ ∪ Irr♣ as the representation of GL₈(F) with parameter φ_τ ⊕ φ_τ∨, where τ is the lift to PGL₄ or PGL₂(D), transferred to PGL₄ by Jacquet–Langlands, determined up to τ ↔ τ∨ (GS, §§12.2–12.3, pp. 34–36). Prove that the two definitions agree on Irr♣.

- On Irr♥ SpinLift is the triality-theta transfer; on Irr♠ ∪ Irr♣ its parameter is φ_τ ⊕ φ_τ∨.
- On Irr♣ the two formulas agree.
- On generic σ it is the SpinLift of §2.2.

**Checks.**

- Replacing τ by τ∨ leaves φ_τ ⊕ φ_τ∨ unchanged.
- The lower-tower formula has dimension 4 + 4 = 8; a formula 4 + 1 + 4 would have dimension 9.
- For nontempered σ the value is the representation attached to the parameter, not the whole induced module.

*Needs:* §2.0, §2.2; MetaplecticAutomorphicForms §§3.34, 3.42 and the pgsp6-lower-tower-parameters contract; ModularityAndLanglandsExtensions §3.15; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30.

### 9.2 The lower-tower parameter formula

For σ ∈ Irr♠ ∪ Irr♣ with PGL₄-datum τ (up to duality) and φ_τ valued in SL₄(ℂ) = Spin₆(ℂ), prove that q ∘ h ∘ φ_τ ≅ 1 ⊕ Λ²φ_τ is the Arthur parameter of the restriction of σ, and s ∘ h ∘ φ_τ ≅ φ_τ ⊕ φ_τ∨ is the parameter of SpinLift(σ) (GS, §§12.3(b)–12.4, pp. 35–36). *Needs:* §9.1, §0.1, §2.0; SpinRepresentations, Layer 6; MetaplecticAutomorphicForms, pgsp6-lower-tower-parameters contract; EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- det φ_τ = 1, and Λ²φ_τ is six-dimensional and orthogonal, so 1 ⊕ Λ²φ_τ is a seven-dimensional orthogonal parameter.
- For φ_τ = Sym³ (principal SL₂ of SL₄), Λ² Sym³ = Sym⁴ ⊕ Sym⁰, so the standard parameter is 1 ⊕ 1 ⊕ Sym⁴, which is not discrete.
- Treat both the split tower and the quaternionic tower; in the quaternionic tower τ comes from PGL₂(D) through Jacquet–Langlands.

### 9.3 Parameters of non-discrete heart representations

For each non-discrete σ ∈ Irr♥(PGSp₆), construct a Spin₇-valued parameter from the correspondence for the Levi of its inducing data and prove simultaneously that its q-image is the Arthur parameter of the restriction of σ and its s-image is the parameter of SpinLift(σ) (GS, proof of Theorem 12.3, second bullet, p. 36). In the C₃ numbering α₁, α₂, α₃ (α₃ long) treat the seven proper standard Levis indexed by ∅, {α₁}, {α₂}, {α₃}, {α₁, α₂}, {α₁, α₃}, {α₂, α₃}, with their actual central quotients (the maximal ones are the images of GL₃ × GL₁, GL₂ × GSp₂ and GL₁ × GSp₄, isomorphic to GL₃, to (GL₂ × GL₂)/GL₁ and, by (a, g) ↦ a⁻¹g, to GSp₄), normalized induction and Langlands quotients. *Route:* for tempered σ, R-group constituents and the lift of each to PGSO₈, with the parameters of the constituents on Sp₆ and SO₈ read from the Levi subgroups (classical-packets-parabolic-induction contract); for nontempered σ, positive standard-module exponents through theta; the vector and spin branching on each dual Levi, including the GSp₄ normalization of ModularityAndLanglandsExtensions §3.5. *Needs:* §9.1, §2.0; SmoothRepresentationsOfLocalGroups, SR.2–SR.3; ModularityAndLanglandsExtensions §3.5 and the classical-packets-parabolic-induction contract; MetaplecticAutomorphicForms, pgsp6-pgso8-induction-principle contract; EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- There are 2³ − 1 = 7 proper standard Levis; checking only the Siegel Levi GL₃ does not cover the Klingen Levi, the image of GL₁ × GSp₄, which is GSp₄ and not GL₁ × PGSp₄: a representation of GL₁(F) × PGSp₄(F) pulled back along g ↦ (sim g, g modulo the centre) has central character z ↦ χ(z²), a square, so an irreducible representation of GSp₄(F) whose central character ω is not a square, for instance with ω(−1) = −1 (a constituent of the principal series of GSp₄(F) from χ₁ ⊗ 1 ⊗ 1 with χ₁(−1) = −1), which is inducing data for the Klingen parabolic subgroup, is missed by a GL₁ × PGSp₄ model.
- For the Borel Levi and the trivial representation of PGSp₆, the parameter is the image of diag(|w|^(1/2), |w|^(−1/2)) under the principal SL₂ of Spin₇, with q-image Sym⁶ evaluated there and s-image 1 ⊕ Sym⁶ evaluated there.
- The Levi of P₃ is GL₃ acting on Λ² of the Lagrangian, so its dual embedding into Spin₇ is not the block-diagonal GL₃ of SO₇ composed with the identity on lattices; the coordinate change of ExceptionalThetaCorrespondencesForG2, Layer 0 (*The 15-dimensional PGSp₆ Jordan model*) is used.

### 9.4 Existence and weak uniqueness for all of PGSp₆

Prove that for every σ ∈ Irr(PGSp₆(F)) there is a unique class in Φ_w(PGSp₆) whose q-image is the Arthur parameter of the restriction of σ and whose s-image is the parameter of SpinLift(σ) (GS, Theorem 12.3 and proof, p. 36). *Route:* §9.2 on Irr♠ ∪ Irr♣, §9.3 on the non-discrete heart, §8.2 on the discrete heart; uniqueness is the definition of Φ_w. *Needs:* §§9.2–9.3, §8.2, §0.6, §2.0.

**Checks.**

- The statement is a weak class; it does not assert acceptability of Spin₇.
- For σ = St the class is that of the principal parameter.
- For σ and σ ⊗ χ ∘ sim the classes differ by χ (§§10.3–10.4), so the map is not constant on twist orbits.

### Examples

- σ = St_PGSp₆: heart, discrete, principal parameter.
- σ in the lower tower with τ = St_PGL₄: standard parameter 1 ⊕ 1 ⊕ Sym⁴, spin parameter Sym³ ⊕ Sym³.

### Dependencies

Layers 0, 2 and 8; SpinRepresentations, Layer 6; MetaplecticAutomorphicForms §§3.34, 3.42 and the pgsp6-lower-tower-parameters and pgsp6-pgso8-induction-principle contracts; ModularityAndLanglandsExtensions §§3.5, 3.15 and the classical-packets-parabolic-induction contract; SmoothRepresentationsOfLocalGroups, SR.2–SR.3; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30.

## Layer 10: The weak PGSp₆ correspondence and its fibres

### 10.1 The weak correspondence

Define L_w : Irr(PGSp₆(F)) → Φ_w(PGSp₆) by L_w(σ) = the weak class of §9.4 (GS, Theorem 12.6, p. 38).

- q ∘ L_w(σ) is the Arthur parameter of the restriction of σ to Sp₆(F), and s ∘ L_w(σ) is the parameter of SpinLift(σ).
- These two identities characterize L_w.
- For π generic discrete series in Irr♦(G₂), L_w(θ(π)) is the weak class of i ∘ L(π) (§5.4).

**Checks.**

- L_w(St_PGSp₆) is the weak class of the principal parameter.
- A lower-tower σ maps to the weak class of h ∘ φ_τ (§9.2).
- An unramified quadratic twist that changes the spin parameter changes L_w(σ) although it leaves the standard parameter unchanged.

*Needs:* §9.4.

### 10.2 Temperedness and discreteness of the weak parameter

Prove that L_w carries tempered representations to weak classes of bounded parameters and discrete series to weak classes of discrete parameters, and that boundedness and discreteness are constant on weak classes (GS, Theorem 12.6, p. 38). *Route:* boundedness is detected by the faithful representation q ⊕ s; discreteness of a Spin₇-valued parameter is read from its centralizer and must be shown to depend only on the q- and s-images, by a centralizer comparison; a discrete series σ has a discrete q-image, the parameter of the discrete series of Sp₆(F) in its restriction (classical-discrete-packets contract). *Needs:* §10.1, §§9.2–9.3, §8.2, §0.7; ModularityAndLanglandsExtensions, classical-discrete-packets contract.

**Checks.**

- The statement is the forward implication for representations; the converse is not asserted.
- The principal parameter is discrete; its weak class contains only discrete parameters.
- A parameter through h : Spin₆ → Spin₇ with φ_τ = Sym³ has q-image 1 ⊕ 1 ⊕ Sym⁴, which factors through a proper Levi, so it is not discrete.

### 10.3 Quadratic twists in the heart

For σ ∈ Irr♥ and quadratic χ, prove SpinLift(σ ⊗ χ ∘ sim) ≅ SpinLift(σ) ⊗ χ ∘ det, hence L_w(σ ⊗ χ ∘ sim) = χ · L_w(σ) (GS, proof of Theorem 12.6, pp. 38–39). *Route:* the similitude character of PGSO₈ modulo squares is trivial on f₁(SO₈(F)) and pulls back along f₂ to the spinor-norm character (§2.1); the twisting rule of the classical lift (pgsp6-similitude-twist-rule contract) and of the SO₈ correspondence (so8-spinor-norm-twist contract). *Needs:* §10.1, §2.1; MetaplecticAutomorphicForms, pgsp6-similitude-twist-rule contract; ModularityAndLanglandsExtensions, so8-spinor-norm-twist contract; EndoscopicTransferAndUnitaryTraceComparison §10.30.

**Checks.**

- The standard parameter is unchanged because χ ∘ sim is trivial on Sp₆(F).
- Pulling back along f₁ instead of f₂ would give the trivial character and no spin twist, contradicting, at the unramified σ with trivial parameter and the unramified quadratic χ, the change of the eight spin eigenvalues from 1 to −1.
- χ² = 1 gives an involution on the heart.

### 10.4 Quadratic twists in the lower towers

For σ ∈ Irr♠ ∪ Irr♣ and quadratic χ, prove that the PGL₄-datum of σ ⊗ χ ∘ sim is τ ⊗ χ ∘ det (with the reduced norm on GL₂(D) before Jacquet–Langlands), so that (φ_τ ⊗ χ) ⊕ (φ_τ ⊗ χ)∨ = (φ_τ ⊕ φ_τ∨) ⊗ χ and Λ²(φ_τ ⊗ χ) = Λ²φ_τ; hence L_w(σ ⊗ χ ∘ sim) = χ · L_w(σ) (GS, proof of Theorem 12.6, final paragraph, p. 39). *Needs:* §9.2, §10.1; MetaplecticAutomorphicForms, pgsp6-similitude-twist-rule and pgsp6-lower-tower-parameters contracts; EndoscopicTransferAndUnitaryTraceComparison §4.7a.

**Checks.**

- Λ²(φ_τ ⊗ χ) = χ² Λ²φ_τ = Λ²φ_τ because χ² = 1; for a character μ with μ² ≠ 1 the standard parameter would change and the statement is not asserted.
- (φ_τ ⊗ χ)∨ = φ_τ∨ ⊗ χ⁻¹ = φ_τ∨ ⊗ χ.
- On Irr♣ the formula agrees with §10.3.

### 10.5 Surjectivity and restriction to classical packets

Prove that L_w is surjective and that for every weak class [φ̃], restriction gives a surjection L_w⁻¹([φ̃]) → Π_(q∘φ̃)(Sp₆)/PGSp₆(F) (GS, Theorem 12.7(i) and proof, p. 39). *Route:* a representation of Sp₆(F) with parameter q ∘ φ̃ has trivial central character (the parameter lifts to Spin₇), so it is a representation of the image of Sp₆(F) in PGSp₆(F), a normal subgroup with quotient F×/F×², and occurs in the restriction of an irreducible representation σ of PGSp₆(F), without extending to it in general; the weak class L_w(σ) has the same q-image as φ̃; two Spin₇-lifts of q ∘ φ̃ differ by a quadratic character χ up to conjugacy; σ ⊗ χ ∘ sim has the same restriction to Sp₆(F) as σ and weak class [φ̃] (§§10.3–10.4). *Needs:* §§10.1, 10.3, 10.4; ModularityAndLanglandsExtensions §3.19.

**Checks.**

- The target is the set of PGSp₆(F)-orbits, not individual Sp₆-constituents.
- For [φ̃] principal the fibre is {St_PGSp₆} and the restriction is the Steinberg of Sp₆.
- A member of Π_(q∘φ̃)(Sp₆) need not extend to PGSp₆(F): if σ ⊗ χ ∘ sim ≅ σ for a quadratic χ ≠ 1, the restriction of σ to Sp₆(F) is reducible (an isomorphism σ → σ ⊗ χ ∘ sim is an endomorphism of the restriction that is not a scalar, χ ∘ sim being nontrivial), and a constituent with an extension σ′ would give σ ≅ σ′ ⊗ μ ∘ sim for a quadratic μ (Frobenius reciprocity for the finite quotient F×/F×²), whose restriction is that one constituent. The same happens for SL₂(F) in PGL₂(F) at a dihedral supercuspidal σ with σ ⊗ χ ≅ σ for exactly one quadratic χ ≠ 1, whose restriction is an L-packet of size two. So the route picks σ containing the constituent and never extends it.
- Surjectivity is onto weak classes; it does not give surjectivity onto Spin₇-conjugacy classes.

### 10.6 Constancy on discrete diamond Xu packets

Let σ be a discrete series whose parameter does not factor through Spin₆ (the classical diamond locus) and X the one of Xu's packets containing it. Prove that L_w is constant on X (GS, proof of Theorem 12.7(ii), pp. 39–40). *Route:* globalize σ with a Steinberg place (§1.7); the global component group is trivial (symplectic-steinberg-generic-parameter contract), so any σ′ ∈ X can replace σ at v₀ by Xu's multiplicity formula; both global PGSO₈ lifts are nonzero (§8.1) and their GL₈-transfers are nearly equivalent, hence equal by strong multiplicity one; the standard parameters already agree. *Needs:* §1.7, §8.1, §10.1; ModularityAndLanglandsExtensions §3.27 and the symplectic-steinberg-generic-parameter contract; AutomorphicLFunctionsAndLocalFactors, AL.3 (isobaric strong multiplicity one).

**Checks.**

- One-place substitution is valid here because the global component group is trivial (Steinberg place), unlike §6.5.
- For σ = St the set X is a singleton.
- Constancy of q ∘ L_w on X is automatic; the content is constancy of s ∘ L_w.

### 10.7 Constancy on lower-tower Xu packets

If a discrete parameter factors through Spin₆ and X is one of Xu's packets in the corresponding lower-tower locus, prove that all σ ∈ X have the same φ_τ ⊕ φ_τ∨ and hence the same L_w (GS, proof of Theorem 12.7(ii), p. 39), treating split and quaternionic lifts and the overlap with the heart separately, and including the case where the data of two members differ by the outer involution of the orthogonal group. *Needs:* §9.2, §10.1; ModularityAndLanglandsExtensions §3.19; MetaplecticAutomorphicForms, pgsp6-lower-tower-parameters contract; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30.

**Checks.**

- Equality of the six-dimensional Λ²φ_τ does not determine φ_τ ⊕ φ_τ∨: for an unramified φ_τ with Frobenius eigenvalues a, b, c, (abc)⁻¹ in general position and χ the unramified quadratic character, φ_τ and φ_τ ⊗ χ have the same Λ² (χ² = 1) while the eight eigenvalues of φ_τ ⊕ φ_τ∨ change sign; the comparison of packets is therefore made on φ_τ itself.
- An outer involution exchanges φ_τ and φ_τ∨, which leaves φ_τ ⊕ φ_τ∨ unchanged.
- On the heart overlap the formula agrees with §9.1.

### 10.8 Reduction of constancy on packets to discrete data

For every proper Levi of PGSp₆ in the list of §9.3, prove that normalized induction of Xu packets and passage to Langlands quotients are compatible with the two transfers defining L_w, so that constancy on discrete packets of the Levi implies constancy on each of Xu's tempered induced packets and on each of Xu's nontempered Langlands-quotient packets (GS, opening of the proof of Theorem 12.7(ii), p. 39). *Needs:* §9.3, §10.6, §10.7; ModularityAndLanglandsExtensions §3.19 and the classical-packets-parabolic-induction contract; SmoothRepresentationsOfLocalGroups, SR.2.

**Checks.**

- The reduction covers nongeneric constituents of reducible inductions as well as generic ones.
- A reducible tempered induction from the Siegel Levi has all its constituents in one of Xu's packets, with one weak class.
- For the Borel Levi with unramified data each of these packets is a singleton and constancy is trivial.

### 10.9 The fibres of L_w

Prove that every fibre of L_w is a union of Xu packets, and that for φ ∈ Φ♦_ds(G₂) the fibre over the weak class of i ∘ φ is the single distinguished X*(φ) (GS, Theorem 12.7(ii) and final paragraph, pp. 39–40; §12.8, pp. 39–40). *Route:* §§10.6–10.8 for unions; for i ∘ φ, quadratic rigidity (§0.5) shows its weak class contains one Spin₇-class, and §6.2 with §6.6 excludes other packets. *Needs:* §§10.6–10.8, §0.5, §5.3, §6.2, §6.6.

**Checks.**

- A general fibre may contain several Xu packets; the singleton conclusion is only for the diamond G₂ classes.
- For φ principal the fibre is {St_PGSp₆}.
- No enhanced correspondence for PGSp₆ is asserted outside the diamond orbits of §7.3.

### Examples

- The fibre of L_w over the principal class is {St_PGSp₆}.
- A lower-tower class with τ = St_PGL₄: q-image 1 ⊕ 1 ⊕ Sym⁴, s-image Sym³ ⊕ Sym³.

### Dependencies

Layers 0, 1 (§1.7), 2, 5, 6, 8 and 9; ModularityAndLanglandsExtensions §§3.19, 3.27 and the so8-spinor-norm-twist, symplectic-steinberg-generic-parameter, classical-discrete-packets and classical-packets-parabolic-induction contracts; MetaplecticAutomorphicForms, pgsp6-similitude-twist-rule and pgsp6-lower-tower-parameters contracts; AutomorphicLFunctionsAndLocalFactors, AL.3; SmoothRepresentationsOfLocalGroups, SR.2; EndoscopicTransferAndUnitaryTraceComparison §§4.7a, 10.30.

## Downstream consumers

Roadmaps on automorphic forms on G₂ and on the arithmetic of PGSp₆ (Galois representations of Siegel modular forms of genus three, spin L-functions, exceptional theta lifts of automorphic forms) consume the G₂ correspondence of §7.1, the gamma-factor characterization of §3.13, the global–local compatibility of §3.15, the spin transfer of §§2.2–2.3 and §9.1, and the weak correspondence of §10.1 with its fibres.

## Worked examples

- **The Steinberg chain.** St_G₂ has the principal parameter φ with v ∘ φ = Sym⁶ and S_φ = 1; θ(St_G₂) = St_PGSp₆; KS(St_PGSp₆) = {i ∘ φ}; SpinLift(St_PGSp₆) has parameter 1 ⊕ Sym⁶; L_w(St_PGSp₆) is the weak class of i ∘ φ and its fibre is {St_PGSp₆}.
- **The subregular fibre.** φ trivial on W_F and subregular on SL₂: v ∘ φ = 1 ⊕ Sym² ⊕ Sym², S_φ = S₃, L⁻¹(φ) = {π_gen[1], π_sc[1], π_deg[1]} with labels 1, sgn, std₂; θ(π_gen[1]) = I₃(St_PGL₃)_gen is tempered and not discrete, and the spin parameter of its SpinLift is Sym² ⊕ Sym² ⊕ 1 ⊕ 1.
- **The unacceptable pair.** On Γ = μ₄ × μ₄, r through SU₄ with weights (1,0), (1,2), (0,1), (2,1) and r′ = b² · r are elementwise conjugate in Spin₇ and not conjugate, so they have isomorphic q- and s-images as representations of Γ. Pulled back along the surjection W_ℚ₅ → ℚ₅× → μ₄ × μ₄ (valuation modulo 4, residue character) they give two parameters of PGSp₆ over ℚ₅ with one weak class and two conjugacy classes; over ℚ₃ no such surjection exists, and for a general F the local pair is that of CG Proposition 8.3 (§0.8). These pairs are not discrete.
- **A spin-regular weight.** λ₁ = (8, 4, 2), h = (11, 6, 3), spin weights ±10, ±7, ±4, ±1.

## Notes on the sources

The statements above differ from the printed sources in the following places; each statement in this roadmap is the corrected one.

- GS Main Theorem (vi), p. 4, places generic discrete series of PGSp₆ in the middle of the spin diagram; π_gen[1] has the tempered non-discrete partner I₃(St_PGL₃)_gen (HD, Theorems 8.5 and 15.2), so §5.6 uses generic tempered representations, and §5.5 treats the Siegel-induced partners separately from Proposition 5.2.
- GS Main Theorem (ix), p. 4, closes a parenthesis before the tensor product; §3.12 uses γ(s, (v ∘ L(π)) ⊗ φ_τ, ψ), as on GS p. 13.
- GS Proposition 3.2, pp. 14–16, constructs the enhancements from a centralizer of order three; for self-dual φ_τ the component group is S₃ and §4.3 gives the separate argument with the two extensions τ± and the two-dimensional character.
- GS Theorem 9.1(ii), p. 27, is worded for all G₂ representations; the assigned PGSp₆ enhancements exist only on the diamond discrete range, which is the range of §7.4.
- GS Proposition 11.6, p. 33, deduces convergence along a subsequence of an indexed sum from weak containment; the corrected statement (membership in the Fell closure of the set of summands, then isolation) is SmoothRepresentationsOfLocalGroupsPartII, SRU.1.9–SRU.1.10, used in §§1.4 and 1.6.
- The partial functional equations displayed in the proof of GS Proposition 4.1(i), p. 18, and in GF Theorem 2.4(ii), p. 5, put L^S(1 − s, ·∨) on the side of the product of the gamma factors; with γ = ε · L(1 − s, ·∨)/L(s, ·) the equation reads L^S(s, ·) = ∏_(v∈S) γ(s, ·_v, ψ_v) · L^S(1 − s, ·∨) (the Check on ζ in §3.11), which is the form of §3.11(ii) and of the pgsp6-shahidi-spin-factor contract. The arguments divide two such equations and do not depend on the direction.
- The proof of GS Proposition 4.1(i), p. 18, takes one global additive character whose components at the places u, w and T all equal ψ; the component at a place x of a character of k \ 𝔸_k is ψ_F(ι_x(c) ·) for one c ∈ k×, ψ_F the standard character of F and ι_x : k → k_x ≅ F, so it equals a prescribed ψ = ψ_F(b ·) only for b in the image of k, and §2.4 uses the change-of-character rule of the pgsp6-shahidi-spin-factor contract on the Langlands–Shahidi side and that of GL₈ on the other.
- The proof of GS Proposition 4.1(i), pp. 18–19, cancels all places other than the Steinberg, supercuspidal and repeated places after a globalization (Proposition 10.7) that allows one further finite place with uncontrolled component; §2.4 uses instead statement (ii) of §1.6, available over a totally complex field, in which every finite place outside the prescribed ones is spherical (the arrangement of ILM, proof of Proposition 4.5, pp. 19–20).
- GF Theorem 2.4(ii)(b), p. 5, allows a nonsplit octonion algebra O, but the proof (§2.7(b), p. 7) identifies the real components only at split real places, through spherical Howe duality; §3.11 states alternative (b) for split O, the case its uniqueness argument (GF Lemma 2.5, pp. 8–9) uses. The uniqueness in GF Theorem 2.4 also needs the change-of-character rule, rule (e) of §3.11, since the global argument reaches only the local characters that are components of characters of k \ 𝔸_k.
- GF §2.7(a), pp. 6–7, identifies the components of the GL₇ transfer with Lif(Π_v) for every Π with a cuspidal lift to PGSp₆; this uses that the local packets of the lift are L-packets whose members have the parameter of the localization, which holds when the global Arthur parameter is generic (at an unbounded localization because the members of a generic L-packet are irreducible standard modules, ModularityAndLanglandsExtensions §3.25), so §3.11(ii)(a) carries that hypothesis, and the uniqueness argument uses only Π with a Steinberg component, where it holds (symplectic-steinberg-generic-parameter contract). GF §2.7(b), p. 7, gives every summand Π′ a Jacquet–Langlands transfer to which the Rankin–Selberg functional equation applies; for Π′ = χ ∘ Nrd on a division algebra the transfer is χ ∘ det, whose ramified components are not the local transfers, and for split D the summand need not be cuspidal; §3.11 treats both through cuspidal supports and isobaric sums.
- The proof of GS Lemma 12.4, p. 37, asks Shin's Theorem 5.8 for spin-regular real components, which that theorem does not provide; §1.7 uses Shin's Corollary 4.12 along the explicit weights t(8, 4, 2).
- The proof of GS Lemma 8.3, p. 25, applies GS20 Theorem 1.1 over a totally real field with two places isomorphic to F; GS20 states its Theorem 1.1 over ℚ, the restriction coming from the integral representation of the spin L-function used there (GS20, §1, p. 2). §6.5 uses the totally real version as a supplier statement of ExceptionalThetaCorrespondencesForG2.
- The proof of HKT Lemma 4.6 (arXiv v3, p. 21) treats every nonzero spinor as having stabilizer conjugate to G₂(ℂ); isotropic spinors do not, and §0.5 chooses a nonisotropic invariant spinor using complete reducibility.
- The proof of GS Lemma 10.1, p. 27, concludes rank exactly two where rank at most two follows; ranks zero and one are excluded by the same low-rank argument (ExceptionalThetaCorrespondencesForG2, Layer 9, *Tempered lifts have quaternion relative models*).
- Minor misprints: in GS §3.3, p. 11, the definite octonion algebra is over the global field k; in GS §4.4, p. 19, the local representations in the functional equation are those of PGSp₆; in GS §1.2, p. 5, the appendices are §10 and §11, and the author of the conjugacy theorem is spelled as in the bibliography; GS Theorem 2.1(ii), not (i), is the dichotomy (pp. 8, 10); in Shin's proof of Theorem 5.8 (author PDF p. 27) item 4.12 is a corollary.

## References

- [GS] W. T. Gan and G. Savin, *The local Langlands conjecture for G₂*, Forum of Mathematics, Pi 11 (2023), e28; doi:10.1017/fmp.2023.27. Main Theorem pp. 3–4; Lemma 2.4 pp. 9–10; §§3–9 pp. 10–27; Appendices A–C pp. 27–40.
- [HD] W. T. Gan and G. Savin, *Howe duality and dichotomy for exceptional theta correspondences*, Invent. Math. 232 (2023); arXiv:2102.00372 (locators of v1). Theorems 8.2, 8.5, 15.1, 15.2; Lemmas 13.4, 13.8.
- [GF] W. T. Gan and G. Savin, *A theory of γ-factors for G₂ × GL_r*, arXiv:2308.12561 (v1). Definition 2.1, §2.4, Proposition 2.3, Theorem 2.4, Lemma 2.5, §§2.7–2.8.
- [GS20] W. T. Gan and G. Savin, *An exceptional Siegel–Weil formula and poles of the Spin L-function of PGSp₆*, Compositio Math. 156 (2020); arXiv:1904.06000 (locators of v1). Theorem 1.1.
- [Griess] R. L. Griess, Jr., *Basic conjugacy theorems for G₂*, Invent. Math. 121 (1995), 257–277; doi:10.1007/BF01884298. Theorem 1.
- [C] G. Chenevier, *Subgroups of Spin(7) or SO(7) with each element conjugate to some element of G₂ and applications to automorphic forms*, Doc. Math. 24 (2019), 95–161. Theorem E p. 100; Theorem 6.4 p. 148; Corollary 6.8 pp. 150–151.
- [CG] G. Chenevier and W. T. Gan, *Spin(7) is unacceptable*, arXiv:2303.15897 (v1); Peking Math. J. 8 (2025). Lemma 3.10, Proposition 3.12, Example 1, Corollaries 4.6 and 4.8, Lemma 5.9, Proposition 5.10, formula (16), Lemma 8.2, Propositions 8.3 and 8.4.
- [HKT] M. Harris, C. Khare and J. Thorne, *A local Langlands parameterization for generic supercuspidal representations of p-adic G₂*, Ann. Sci. ENS 56 (2023); arXiv:1909.05933 (locators of v3). Abstract; Theorem 3.3; §4: Proposition 4.3, Lemma 4.4, Proposition 4.5, Lemma 4.6.
- [KS] A. Kret and S. W. Shin, *Galois representations for general symplectic groups*, J. Eur. Math. Soc. 25 (2023), 75–152. Theorem A; Proposition 13.1; Lemma 2.1; Corollary 2.2.
- [MagaardSavin] K. Magaard and G. Savin, *Computing finite Galois groups arising from automorphic forms*, arXiv:1406.3773 (v1). Proposition 8.2 and its proof, p. 10.
- [Shin] S. W. Shin, *Automorphic Plancherel density theorem*, Israel J. Math. 192 (2012), 83–120 (author PDF). Definition 3.5, Corollary 4.12, Theorem 5.8.
- [SV] Y. Sakellaridis and A. Venkatesh, *Periods and harmonic analysis on spherical varieties*, Astérisque 396 (2017); arXiv:1203.0039. Theorem 16.3.2, Remark 16.4.1.
- [SpV] T. A. Springer and F. D. Veldkamp, *Octonions, Jordan Algebras and Exceptional Groups*, Springer Monographs in Mathematics (2000); doi:10.1007/978-3-662-12622-6. §1.5 (the Cayley–Dickson doubling), Theorems 1.7.1 and 1.8.1.
- [ILM] A. Ichino, E. Lapid and Z. Mao, *On the formal degrees of square-integrable representations of odd special orthogonal and metaplectic groups*, Duke Math. J. 166 (2017); arXiv:1404.2909 (locators of v2). Proposition 4.5 and its proof, pp. 18–20; Lemma A.2, Proposition A.5.
