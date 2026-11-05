# Roadmap: smooth representations of local groups, part II — unitary representations, the Fell topology and the spherical dual

**Summary.** Build the unitary representation theory of local groups above SmoothRepresentationsOfLocalGroups SR.0–SR.6. The first part supplies the smooth category, Hecke algebras, induction and Jacquet functors, admissibility, Bernstein theory, temperedness, Steinberg representations and Satake parameters. This continuation constructs their Hilbert-space realization and coefficient topology. Its endpoints are the Fell-closure and isolated-summand theorems, the smooth/unitary dual correspondence, Steinberg and supercuspidal isolation, and the split and unramified spherical unitary classification with its half-integral, temperedness and complementary-series consequences. The analytic theory applies to general locally compact groups; the representation-theoretic theorems retain their stated field and root-datum hypotheses.

## Scope and ownership

This roadmap owns nonabelian group positive-type coefficients and their GNS translation action, Hilbert sums, the group unitary-equivalence quotient, coefficient weak containment, Milman’s converse, the Fell topology and the sum/closure theorem (SRU.0–SRU.1); invariant forms and smooth/Hilbert comparison, unitary admissibility and limit topology (SRU.2–SRU.3); finite Steinberg representations of split groups over finite fields (the GL₂(𝔽_q) case is already in Tau Ceti, `TauCeti.GL2Steinberg`, from the RepresentationTheory/CharacterTheory roadmap), Rodier’s Steinberg-series constituent calculation, Howe–Moore and isolation (SRU.4); real Satake parameters, the all-type generic spherical unitary region and its half-integral classification, and the Iwahori-level identification of the Gelfand–Graev representation with the sign-induced Hecke module (SRU.5); nonsplit unramified transfer with full isogeny data (SRU.6); and the general Aubert involution, enhanced Kazhdan–Lusztig dictionary and spherical complementary series (SRU.7).

SmoothRepresentationsOfLocalGroups SR.0.1–SR.0.4 owns smoothness, algebraic fixed vectors, averaging and the smooth dual; SR.1.1–SR.1.5 owns Hecke algebras and their presentations; SR.2.1–SR.2.3 owns induction, Jacquet modules, pairings and Whittaker functionals; SR.3a.1–SR.3a.2 owns smooth admissibility and uniform admissibility; SR.3.1–SR.3.4 owns finite length, Bernstein theory, tempered support, the Langlands quotient, the Iwahori block and the p-adic Steinberg representation; SR.4.1–SR.4.2 owns Satake and spherical constituents; SR.5.3 owns the GLₙ Zelevinsky involution. These constructions are imported rather than targets here. The real-part convention of SRU.5 extends the supplied Satake parameter, and the general-group Aubert operator extends the GLₙ case.

The monoid homomorphism into bounded operators is already in the library as Mathlib `ContRepresentation`; unitarity, unitary restriction and the inverse/adjoint identity are in Tau Ceti’s continuous representation API. Generic positive kernels, radical quotient, Hilbert completion, feature density and the Kolmogorov comparison isometry are already in the library: SRU.0 adds the nonabelian translation action and strong continuity, rather than a second Hilbert-space construction. Tau Ceti’s additive GNS action assumes an additive commutative group. Mathlib owns algebraic irreducibility, completion, orthogonal projection, Krein–Milman and Banach–Alaoglu. None is a theorem target here.

NoncompactQuantumSymmetry M0 owns the shared strong-unitary convention, bounded Schur lemma and compact-group isotypic projectors; its section “Shared group C*-algebra and weak-support comparisons” owns the comparison to C*-kernel containment. SRU.0 uses these projectors on compact open subgroups and adds smooth-vector density and the comparison with smooth averaging. HilbertModules H5 owns the pure-state quotient for an abstract C*-algebra; the group-positive-type quotient and its coefficient neighborhoods here are a different realization. FactorRigidity’s correspondence Fell topology concerns von Neumann bimodules, rather than group representations. OperatorTheory/PolarDecomposition Part B owns the bounded rectangular polar factor and uniqueness. BanachSpaceTheory B5 owns the L¹/L∞ duality for finite measures; its σ-finite form is requested by the supplier contract below. AutomorphicSpectralTheory §7.0b owns the whole finite-place GLₙ unitary classification; the type-A formula here is its adjoint spherical specialization within the all-type theorem.

LieHighestWeight Layers 0, 2 and 4 own sl₂ theory, weights and finite-dimensional highest-weight representations. LieHighestWeightPartII N0–N2 owns Jacobson–Morozov, triple conjugacy and classical recognition, and N5 owns the highest-weight half-integrality test and the positive real part of a torus element. Both are consumed, not planned again in SRU.5. SpringerResolutionAndCharacteristicCycles Layer S owns the Springer resolution and the reduced Steinberg variety with its components; its Layer H owns holonomic D-modules and characteristic cycles and is not consumed here. The additional supplier contracts below request triple centralizers, graded orbits and orbit tables from LieHighestWeightPartII, convolution and coherent equivariant K-theory on the Steinberg variety from SpringerResolutionAndCharacteristicCycles, and the Shahidi local coefficient used by the standard-module theorem from AutomorphicLFunctionsAndLocalFactors. EndoscopicTransferAndUnitaryTraceComparison §2.16 owns distribution characters. GeometryOfNumbersAndQuadraticArithmetic §4.2.1 owns the Howe–Moore theorem for connected noncompact almost-simple real Lie groups with finite centre; SRU.4.5 is the nonarchimedean statement and shares no proof input with it. Globalization and global Ramanujan–Arthur consequences belong to the named consumers.

## Conventions

Hilbert spaces are complex and complete; invariant forms on smooth modules need not be complete. Inner products are conjugate-linear in the first slot. Write c(π,v)(g) = ⟪v,π(g)v⟫ and Kφ(a,b) = φ(a⁻¹b). Algebraic positive type means positivity of this kernel; continuity is an additional condition. P(G), P₁(G), P≤1(G) mean the continuous positive-type cone, its value-one slice and its identity-value-at-most-one slice. Convexity and extreme points use real scalars. A topologically irreducible Hilbert representation is nonzero and has no nontrivial closed invariant subspace. Its algebraic irreducibility is a separate property.

Definitions in SRU.0 and the coefficient definition in SRU.1 allow any topological group. Raikov's theorem and the single-coefficient approximation of SRU.1.5–SRU.1.6 hold for every locally compact Hausdorff group. The integrated-form, compactness and Fell-closure theorems use second-countable locally compact Hausdorff groups, Borel measurable structure and a nonzero left Haar measure μ. This includes finite central covers and finite products with compact groups. Haar probability is used on compact subgroups. For a nonunimodular group the L¹ involution is f*(g) = Δ(g⁻¹) conjugate(f(g⁻¹)); no unimodularity is implicit. Smooth representations have complex coefficients. SRU.2 uses connected reductive groups over all nonarchimedean local fields; SRU.3 and the Steinberg-isolation argument in SRU.4 use characteristic zero. Howe–Moore is stated in all characteristics. There is no lower bound on the residue characteristic.

For SRU.5 and the simplified SRU.7 dictionary, G is quasi-simple, split and adjoint, with fixed B ⊃ T and hyperspecial K. The residue cardinality q is an integer ≥ 2. Normalize val(ϖ) = 1, |ϖ| = q⁻¹, δ_P(m) = |det(Ad(m)|Lie N)|, and normalized induction by δ_P^(1/2). Put χ_s = s ∘ val_T, s = s_c q^ν, where s_c is compact and ν is real. In this sign convention, dominant ν gives the spherical subrepresentation of X(ν), equivalently the quotient of X(−ν). The trivial representation has ν = ρ. On PGL₂, t = q^(1/2) in diag(t,t⁻¹) gives χ_s = δ_B^(−1/2), so X(s) = Ind_B^G 1 contains 1. On a compact unitary character with value i, c(π,1)(g) = i while Tau Ceti’s opposite-slot matrix coefficient is −i; evaluation at g⁻¹ reconciles them. These two-term witnesses fix both conventions wherever used.

Root coordinates follow CH26 §§6.3–6.11, including its reversed classical numbering and Bourbaki exceptional numbering. Dominant alcoves include their faces on chamber walls through zero. Half-integral means pairing in ½ℤ, including zero weights, and “geometric” here is exactly this real-part condition, with no algebraicity imposed on s_c. The split and nonsplit generic temperedness tests and the finite extraneous-point lists assume s_c = 1 or a central compact factor. General noncentral compact parts use the centralizer theorem of SRU.7.13. The split companion in SRU.6 retains its full isogeny. The adjoint/simply-connected distinction is retained in every representation-weight test.

For a group in universe u, positive-type functions and their quotient give a small unitary dual in universe max(u,0). Hilbert models and Hilbert sums may use larger universes; equality in the dual means existence of a unitary intertwining equivalence. No chosen orthonormal basis or separability of an arbitrary Hilbert space enters a definition. Second countability is invoked where sequences replace nets.

## Exact supplier contracts

### From Mathlib

- `ContRepresentation` in `Mathlib/RepresentationTheory/Continuous/Basic.lean`: Monoid homomorphism into continuous linear maps; continuity in g is a separate strong-continuity hypothesis.
- `ContinuousMap` in `Mathlib/Topology/ContinuousMap/Defs.lean`: Carries a function and its continuity proof.
- `InnerProductSpace.Core` in `Mathlib/Analysis/InnerProductSpace/Defs.lean`: Positive-definite hermitian form on a module; does not supply completeness.
- `LocallyConvexSpace` in `Mathlib/Topology/Algebra/Module/LocallyConvex.lean`: Use the ordered scalar field ℝ on the complex function/dual space.
- `Matrix.PosSemidef` in `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: Hermitian kernel with nonnegative finitely supported quadratic forms; arbitrary index type is allowed.
- `MeasureTheory.Lp` in `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean`: AE-equivalence classes; use p=1 or ∞ and the chosen left Haar measure.
- `MeasureTheory.Measure.haar` in `Mathlib/MeasureTheory/Measure/Haar/Basic.lean`: Locally compact Hausdorff topological group with Borel measurable structure; normalise compact-subgroup integrals separately.
- `Multiplicative` in `Mathlib/Algebra/Group/TypeTags/Basic.lean`: Additive-to-multiplicative type synonym; does not turn a nonabelian group into an AddCommGroup.
- `Representation.IsIrreducible` in `Mathlib/RepresentationTheory/Irreducible.lean`: Algebraic irreducibility; compare with closed-invariant-subspace irreducibility only with the stated finite-dimensional hypothesis.
- `Set.extremePoints` in `Mathlib/Analysis/Convex/Extreme.lean`: Extreme points over the real scalar field, as used in P₁ and P≤1.
- `Submodule.orthogonalProjectionOnto` in `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean`: Requires HasOrthogonalProjection, supplied by a closed subspace of a Hilbert space; compose with subtypeL for an ambient endomorphism.
- `TopologicalSpace.generateFrom` in `Mathlib/Topology/Order.lean`: Generated topology; basis axioms require the separate approximation argument.
- `UniformSpace.Completion` in `Mathlib/Topology/UniformSpace/Completion.lean`: Uniform completion carrier; normed/Hilbert instances are separate.
- `UniformSpace.Completion.innerProductSpace` in `Mathlib/Analysis/InnerProductSpace/Completion.lean`: Extends an inner product to the normed-space completion.
- `WeakDual.isCompact_closedBall` in `Mathlib/Analysis/Normed/Module/WeakDual.lean`: Weak-dual compactness over a proper scalar field (ℂ qualifies); apply after the L¹/L∞ identification.
- `closure_convexHull_extremePoints` in `Mathlib/Analysis/Convex/KreinMilman.lean`: Compact convex subset of a Hausdorff real locally convex space; does not supply the Milman converse.
- `convexHull` in `Mathlib/Analysis/Convex/Hull.lean`: Algebraic convex hull, with closure taken separately.
- `extremePoints_convexHull_subset` in `Mathlib/Analysis/Convex/Extreme.lean`: Only extreme points of the algebraic convex hull; the closed-convex-hull Milman converse remains its own node.
- `lp` in `Mathlib/Analysis/Normed/Lp/lpSpace.lean`: ℓp family of normed groups; p=2 with Hilbert fibres supplies the Hilbert sum.

### From Tau Ceti

- `Matrix.PosSemidef.KolmogorovSpace` in `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`: Existing RKHS-based Hilbert carrier for the positive kernel.
- `Matrix.PosSemidef.inner_kolmogorovFeature` in `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`: Inner product is K(a,b), in the second-linear convention needed here.
- `Matrix.PosSemidef.kolmogorovEquiv` in `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`: Complete target with the same kernel and dense feature span gives a linear isometric equivalence.
- `Matrix.PosSemidef.kolmogorovFeature` in `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`: Existing feature vector indexed by a.
- `Matrix.PosSemidef.kolmogorovFeature_dense` in `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`: Topological closure of the linear feature span is the whole space.
- `Matrix.PosSemidef.kolmogorovIsometry` in `TauCeti/Analysis/PositiveDefinite/Kernel/Kolmogorov.lean`: Complete target with matching kernel; no dense-span assumption until surjectivity is wanted.
- `ContRepresentation.IsUnitary` in `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean`: Preserves the inner product; no continuity of g↦π(g) is included.
- `ContRepresentation.IsUnitary.adjoint_eq_inv` in `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean`: Requires complete Hilbert space for the bounded adjoint.
- `ContRepresentation.IsUnitary.subrepresentation` in `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean`: Restriction to an invariant submodule preserves unitarity; a Hilbert restriction also needs closedness.
- `ContRepresentation.matrixCoeff` in `TauCeti/RepresentationTheory/Continuous/MatrixCoefficient.lean`: Requires operator-norm Continuous π and uses ⟪π(g)v,w⟫. Our strongly continuous second-linear coefficient therefore has its own node and inverse/conjugation adapter.
- `ContRepresentation.matrixCoeff_apply` in `TauCeti/RepresentationTheory/Continuous/MatrixCoefficient.lean`: Same operator-norm continuity hypothesis and coefficient convention as matrixCoeff.
- `ContRepresentation.subrepresentation` in `TauCeti/RepresentationTheory/Continuous/Subrepresentation.lean`: Invariant-submodule carrier; no continuity-in-g or closedness supplied.
- `TauCeti.GL2Steinberg` in `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean`: The Steinberg representation of GL₂(𝔽_q) as an `FDRep ℂ (GL (Fin 2) F)` for a finite field F, the augmentation subrepresentation of ℂ[GL₂/B]; the 𝐆 = GL₂ case of SRU.4.1.
- `TauCeti.finrank_GL2Steinberg` in `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean`: Its degree is `Fintype.card F`, the value q^N with N = 1.
- `TauCeti.character_GL2Steinberg` in `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean`: Its character is the number of fixed points on GL₂/B minus 1, the J ⊆ S alternating sum for GL₂.
- `TauCeti.character_GL2PrincipalSeries_one_one_eq_one_add` in `TauCeti/RepresentationTheory/CharacterTable/GL2/Steinberg.lean`: The character of Ind_B 1 is 1 plus the Steinberg character; an equality of characters, the isomorphism being a separate declaration.
- `TauCeti.IsPositiveDefiniteSub` in `TauCeti/Analysis/PositiveDefinite/AddGroup.lean`: Standing AddCommGroup hypothesis; difference kernel is abelian only, so the nonabelian positive-type node is necessary.

The native representation carrier only stores a monoid homomorphism into continuous linear maps; it asserts no orbit continuity. The native positive-semidefinite kernel includes Hermitian symmetry and positivity on every finitely supported vector, with no continuity or nonzero condition. The native Haar class supplies left invariance, finite mass on compact sets and positive mass on open sets; the second-countable locally compact Hausdorff hypotheses supply the regularity used here. The additive GNS space in `TauCeti/Analysis/PositiveDefinite/Function/GNS.lean` assumes `AddCommGroup`; it does not supply a nonabelian action.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SR.0.1–SR.0.4 (smooth category, compact-open invariants, normalized averaging, admissibility, dual and character); SR.1.1–SR.1.5 (convolution, Hecke corners, module equivalence, Iwahori–Matsumoto and Bernstein presentations); SR.2.1–SR.2.3 (normalized induction, exact Jacquet functors, geometric lemma, canonical pairing and Whittaker functionals); SR.3a.1–SR.3a.2 (irreducible smooth admissibility and the fixed-level uniform bound); SR.3.1–SR.3.4 (finite length, cuspidal splitting and support, Bernstein center, square-integrability, Casselman criterion, Harish–Chandra tempered support, conditional Langlands classification, Iwahori block and Steinberg); SR.4.1–SR.4.2 (Satake and spherical parameters); and SR.5.3 (the GLₙ Zelevinsky adapter). In particular SR.3.3 explicitly states Harish–Chandra tempered support, and SR.3.4 explicitly states the connected-Iwahori components for nonsplit groups. Neither is an additional gap.

**The tempered-local-topology contract.** SmoothRepresentationsOfLocalGroups must supply the finite-level topology of the tempered dual in Harish–Chandra tempered-support coordinates and the separation of a square-integrable point from proper-Levi induction at fixed unitary central character.

**The Whittaker multiplicity-one contract.** SmoothRepresentationsOfLocalGroups must supply, for every quasi-split connected reductive group over a nonarchimedean local field of characteristic zero, every nondegenerate Whittaker datum (U, ψ) and every irreducible admissible complex representation V, the bound dim Hom_U(V, ψ) ≤ 1, extending the GL₂ multiplicity-one theorem of SR.2.3.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume RG2.0 rational-point topology; RG2.3 hyperspecial vertices and reductive special-fiber quotient; RG2.4 Iwasawa and Cartan decomposition; RG2.5 Langlands dual group, pinned automorphisms and Galois action. Hyperspecial reduction K → 𝐆(𝔽_q), with I the inverse image of a Borel, is the map used in SRU.4. Keep the full dual root datum under fixed points in SRU.6.

### From TauCetiRoadmap.ReductiveGroups

Consume Layer 7, structure theory: Bruhat decomposition, standard parabolics and the root subgroups generating G⁺. Layer 2 supplies the algebraic adjoint action used for dual centralizers. The finite-field parabolics of SRU.4 are rational points of these subgroups.

### From TauCetiRoadmap.NoncompactQuantumSymmetry

Consume M0’s bounded complex Schur lemma and vector-valued compact-type projections, with Haar(K) = 1 and the factor dim τ. Consume M0a for type-I/GCR representation comparisons and the section “Shared group C*-algebra and weak-support comparisons” for integrated kernel/coefficient compatibility. The projection is defined by vector-valued integration, not by assuming norm continuity into bounded operators.

**The finite-product Fell-dual contract.** NoncompactQuantumSymmetry must supply the tensor-product classification of irreducibles for finite products of second-countable type-I locally compact groups, the homeomorphism of their unitary dual with the product Fell topology, and the compact-factor specialization.

### From TauCetiRoadmap.OperatorTheory.PolarDecomposition

Consume Part B, PD-B24–PD-B34 and PD-B36: the bounded rectangular polar factor identifies (ker T)⊥ with closure(range T), and its uniqueness makes this identification equivariant for a bounded intertwiner. Its adjoint alone need not be isometric; for T = 2·id the adjoint multiplies norms by 2 and the polar factor is id.

### From TauCetiRoadmap.BanachSpaceTheory

B5 constructs the isometric identification (L¹(μ))* ≃ L∞(μ) by the integral pairing on finite measure spaces. A left Haar measure on a second-countable locally compact group is σ-finite but in general infinite (counting measure on ℤ has infinite mass), so the identification is consumed in the σ-finite form requested below. The scalar pairing is complex bilinear in the L¹ argument; positivity is a real cone condition.

**The σ-finite duality contract.** BanachSpaceTheory must supply the isometric complex-linear identification (L¹(μ))* ≃ L∞(μ) by the integral pairing for every σ-finite measure μ, with its norm equality and weak-star evaluation laws.

### From TauCetiRoadmap.OperatorAlgebraDynamics

Consume D1–D2, the full group C*-algebra and its universal integrated representations. The L¹ involution uses the modular factor fixed in Conventions.

**The integrated-L¹ GNS contract.** OperatorAlgebraDynamics must supply the nondegenerate integrated GNS representation of a bounded positive L¹(G) functional and its comparison with strongly continuous unitary group representations, using the left-Haar modular involution.

### From TauCetiRoadmap.CStarAlgebras

Consume C2, irreducible representations, primitive ideals, pure states and GNS. The dimension-bound and bounded-trace contracts below concern additional representation theory of these same C*-algebras.

**The polynomial-identity contract.** CStarAlgebras must supply the polynomial-identity theorem turning a uniform bound N on irreducible dimensions of a dense star subalgebra into the same dimension bound for irreducible Hilbert representations of its C*-completion, with the Hecke-corner compression comparison.

**The bounded-trace contract.** CStarAlgebras must supply the bounded-trace C*-algebra limit theorem yielding finite positive-integer character multiplicities and equality of limit and cluster sets for the character-convergent irreducible sequences used in SRU.3.

### From TauCetiRoadmap.RepresentationTheory.LieHighestWeight

Consume Layers 0, 2 and 4 of RepresentationTheory/LieHighestWeight: finite-dimensional sl₂ integral spectrum; weight spaces and coroot pairings; the highest-weight theorem and the defining, fundamental and spin representations. In particular an sl₂ neutral element has integer weights, so h/2 has half-integer weights.

### From TauCetiRoadmap.LieHighestWeightPartII

Consume N0, Jacobson–Morozov and conjugacy of adapted triples; N1, restriction and graded weights; N2, classical partitions and spin comparisons; and N5, the highest-weight half-integrality test and N5 positive-real-part: for a complex torus with character lattice X and s in it, the positive part r(s) with |χ(s)| = χ(r(s)) for every χ ∈ X, the compact part s/r(s), multiplicativity and Weyl equivariance. N3’s verified adjoint profiles do not by themselves identify all Bala–Carter labels or their reductive centralizers. The three contracts below request exactly that mathematical data.

**The triple-centralizer contract.** LieHighestWeightPartII must supply reductivity of the centralizer of an algebraic sl₂-triple in a connected complex reductive group, with its identity component and its component group.

**The graded-open-orbit contract.** LieHighestWeightPartII must supply, for a semisimple element s of a connected complex reductive group and a complex number q that is not a root of unity, finiteness of the orbits of the centralizer of s on the q-eigenspace of Ad(s) and the existence of exactly one open orbit.

**The orbit-tables contract.** LieHighestWeightPartII must supply the Bala–Carter lists of nilpotent orbits of the complex groups of types F₄, E₇ and E₈ with the types of the reductive centralizers of their sl₂-triples, including the C₄ centralizer of the E₈ orbit 4A₁.

### From TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles

Consume Layer S, the Springer resolution, the reduced Steinberg variety and its components. Convolution on the Steinberg variety and its coherent equivariant K-theory realization are specified by the additional contract below.

**The coherent equivariant K-theory contract.** SpringerResolutionAndCharacteristicCycles must supply coherent G^∨ × ℂ^×-equivariant K-theory convolution on the Steinberg variety, its affine-Hecke-algebra identification and fixed-point standard modules with the Springer enhancement criterion used by the Kazhdan–Lusztig classification.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §2.16, Harish–Chandra’s p-adic character theorem and Weyl integration formula: distribution characters on compactly supported locally constant test functions, their regular local representatives and linear independence. These are the character carriers used in SRU.3; weak convergence and its limit topology are built here.

**The induced-character continuity contract.** EndoscopicTransferAndUnitaryTraceComparison must supply the normalized parabolic induced-character formula as a continuous linear pullback on compactly supported locally constant test functions, so weak convergence on a Levi implies weak convergence of induced characters.

### From TauCetiRoadmap.ExcursionOperatorsAndSpectralActionPartII

Consume SC4’s atomic character and semisimple-parameter interface with SC3’s central compatibility. The additional contract below specifies precisely the normalized-induction and characteristic range needed by SRU.7.2. Over ℂ one fixes a coefficient-field identification before comparing parameter classes; no continuity of that field identification is asserted.

**The semisimple-parameter contract.** ExcursionOperatorsAndSpectralActionPartII must supply the semisimple local-parameter map on irreducible smooth representations over every nonarchimedean local field and its compatibility with normalized parabolic induction and cuspidal support, with the square-root and reciprocity conventions fixed.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

No declared target is consumed. The two contracts below request the Langlands–Shahidi inputs of SRU.3.8, which no roadmap states for general quasi-split groups; local factors are that roadmap's subject (AL.4, parameters and local determinant comparisons).

**The Shahidi local-coefficient contract.** AutomorphicLFunctionsAndLocalFactors must supply, for a quasi-split connected reductive group over a p-adic field of characteristic zero, a standard parabolic P = MN and an irreducible generic tempered representation τ of M with a compatible Whittaker datum, the meromorphic Shahidi local coefficient in ν ∈ a_M^* ⊗ ℂ with its normalisation, and its holomorphy on the negative chamber (HO Theorem 1.1).

**The Heiermann–Muić contract.** AutomorphicLFunctionsAndLocalFactors must supply the theorem that negative-chamber holomorphy of these local coefficients for all generic tempered data implies that a Langlands quotient J(τ, ν) with τ generic tempered is generic exactly when its standard module i_P(τ_ν) is irreducible (HM07, as used in HO Corollary 1.2).

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §7.0b, the finite-place GLₙ unitary classification and its unitary induction/Speh blocks. Only its real spherical adjoint specialization is used in the type-A line of SRU.5. Over function fields the characteristic-independent Hecke proof in SRU.5 supplies the corresponding all-type assertion.

## How to read the build

SRU.0 constructs the coefficient and Hilbert-space objects; SRU.1 turns them into weak containment and Fell closure. SRU.2 compares this analytic theory with the supplied smooth category. SRU.3 studies limits and SRU.4 proves isolation. SRU.5 can begin its root and spherical-parameter calculations from the smooth and invariant-form interfaces without waiting for isolation; SRU.6 extends that classification to nonsplit unramified groups. SRU.7 uses the general Aubert involution and enhanced Hecke classification to organize all spherical complementary series. Each Needs line separates a statement’s carriers from the additional inputs of the indicated proof route. Within a layer the subsections are grouped by topic; where a Needs line cites a later subsection of the same layer (SRU.3.4 uses SRU.3.5, which uses SRU.3.6; SRU.4.1, 4.4 and 4.5 use the inputs of SRU.4.9; SRU.5.3 uses SRU.5.4; SRU.5.4, 5.5, 5.8–5.10 and 5.26 use SRU.5.27; SRU.7.4 uses SRU.7.5; SRU.7.11 uses SRU.7.12), the cited subsection does not depend on the citing one, so the internal dependency graph is acyclic. The explicit regions of SRU.5.28 depend on SRU.5.27 and the root data only, and SRU.5.11 consumes them.

## Layer SRU.0: Unitary representations and functions of positive type

### 0.1 Strongly continuous unitary representations and unitary equivalence (*strongly-continuous-unitary*)

Let G be a topological group and H a complex Hilbert space (NormedAddCommGroup, InnerProductSpace ℂ, CompleteSpace), with Mathlib's inner product ⟪x, y⟫, conjugate-linear in x. A strongly continuous unitary representation of G on H is π : ContRepresentation ℂ G H such that (i) Tau Ceti's ContRepresentation.IsUnitary π holds (⟪π g v, π g w⟫ = ⟪v, w⟫ for all g, v, w), and (ii) π is strongly continuous: for every v ∈ H the orbit map g ↦ π g v is continuous G → H. Condition (ii) is the predicate `IsStronglyContinuous`; it is weaker than continuity of g ↦ π g in the operator norm, the hypothesis of Tau Ceti's ContRepresentation.matrixCoeff. Two such representations (π, H), (ρ, H') are unitarily equivalent, π ≃ᵤ ρ, when there is a linear isometric equivalence T : H ≃ₗᵢ[ℂ] H' with T (π g v) = ρ g (T v) for all g and v. A closed subspace W ⊆ H is invariant when π g W ⊆ W for all g; π is topologically irreducible when H ≠ 0 and the only closed invariant subspaces are 0 and H (the convention of NoncompactQuantumSymmetry M0, distinct from algebraic irreducibility Representation.IsIrreducible). (BHV, Definitions A.1.1 and A.1.7, PDF pp. 316 and 319)

G a topological group; no local compactness or separation is required for the definitions. H a complex Hilbert space; inner products are linear in the second variable.

In `Suggested.lean` the two predicates are `IsStronglyContinuous` and `IsTopologicallyIrreducible`.

One proof route is as follows. Define `IsStronglyContinuous` π :⇔ ∀ v, Continuous (fun g ↦ π g v), as a Prop on Mathlib's ContRepresentation, beside Tau Ceti's IsUnitary rather than bundled into a new carrier (OperatorAlgebraDynamics, Scope and conventions, and NoncompactQuantumSymmetry M0 use the same pair of conditions). Define unitary equivalence through Mathlib's LinearIsometryEquiv and an intertwining equation; reflexivity, symmetry and transitivity are composition of isometric equivalences. Norm continuity implies strong continuity because evaluation at v is continuous on V →L[ℂ] V; the converse fails (unit test 3). For a closed invariant W the restricted action is a ContRepresentation on W (Tau Ceti ContRepresentation.subrepresentation, IsUnitary.subrepresentation), strongly continuous for the subspace topology; the orthogonal complement of an invariant closed subspace is invariant because π g* = π g⁻¹ (Tau Ceti IsUnitary.adjoint_eq_inv).

The defining object has the following API.

- The predicate ∀ v, Continuous (fun g ↦ π g v) on π : ContRepresentation ℂ G H.
- If g ↦ π g is continuous into H →L[ℂ] H (Tau Ceti's matrixCoeff hypothesis), then π is strongly continuous.
- If W is π-invariant then Wᗮ is π-invariant, for unitary π.
- A linear isometric equivalence T : H ≃ₗᵢ[ℂ] H' with T ∘ π g = ρ g ∘ T; refl, symm and trans.
- H is nontrivial and every closed π-invariant submodule is ⊥ or ⊤.
- In finite dimension, topological irreducibility is equivalent to Representation.IsIrreducible π.toRepresentation.
- Every nonzero vector of a topologically irreducible representation is cyclic: the closed span of its orbit is H.

**Checks.**

- The trivial representation of a topological group G on ℂ is unitary, strongly continuous and topologically irreducible.
- ℚ_p acting on ℓ²(ℚ_p) (counting measure) by translation is unitary but not strongly continuous: ‖λ(g)δ₀ − δ₀‖ = √2 for every g ≠ 0.
- ℤ_p acting diagonally on ℓ²(ℕ) by e_n ↦ χ_n(g) e_n, with χ_n the character x ↦ exp(2πi {x/pⁿ}), is strongly continuous but not continuous in the operator norm: ‖π(p^m) − 1‖ ≥ |`e^(2πi/p)` − 1| for every m.
- For C₄ = ⟨g⟩ acting on ℂ by g ↦ i, the scalar map T(z) = iz is a unitary self-equivalence with inverse z ↦ −iz; their composite sends 1 to 1, as the composite of an equivalence with its inverse must, whereas T composed with itself sends 1 to −1.

The trivial representation of any G on ℂ is a topologically irreducible strongly continuous unitary representation. For a finite-dimensional H, topological irreducibility coincides with Representation.IsIrreducible of π.toRepresentation, since every subspace is closed.

Additional inputs for this route: GS23, §11, opening paragraph, pp. 30–31.

*Needs:* Mathlib `ContRepresentation`; Tau Ceti `ContRepresentation.IsUnitary`; Tau Ceti `ContRepresentation.IsUnitary.subrepresentation`; Tau Ceti `ContRepresentation.IsUnitary.adjoint_eq_inv`; Tau Ceti `ContRepresentation.subrepresentation`; Mathlib `Representation.IsIrreducible`.

### 0.2 Hilbert direct sums of unitary representations (*hilbert-direct-sum*)

For a family `(πᵢ, Hᵢ)_(i ∈ ι)` of strongly continuous unitary representations of G, the Hilbert direct sum ⊕̂ᵢ πᵢ acts coordinatewise on Mathlib's lp (fun i ↦ Hᵢ) 2: (⊕̂ πᵢ)(g) f = (i ↦ πᵢ g (f i)). It is a strongly continuous unitary representation; the coordinate inclusions Hᵢ → lp (fun i ↦ Hᵢ) 2 are isometric intertwiners onto mutually orthogonal closed invariant subspaces whose closed span is the whole space, and the coordinate projections are intertwiners. (BHV, Definition A.1.6 and the Hilbert direct sum defined before it, printed p. 310, PDF p. 319)

ι an arbitrary index type; each πᵢ strongly continuous unitary.

One proof route is as follows. Coordinatewise action preserves the ℓ² norm, so each (⊕̂ πᵢ)(g) is a linear isometry with inverse (⊕̂ πᵢ)(g⁻¹); this gives IsUnitary. Strong continuity: for f with finite support the orbit map is a finite sum of continuous maps; finitely supported f are dense in lp 2, and an ε/3 argument with the uniform bound ‖(⊕̂ πᵢ)(g)‖ ≤ 1 gives continuity for every f. The inclusions lp.single i are isometric intertwiners; orthogonality and density of their spans are Mathlib's lp Hilbert-sum facts.

The defining object has the following API.

- the Hilbert sum π : ContRepresentation ℂ G (lp (fun i ↦ H i) 2) with (the Hilbert sum π g f) i = π i g (f i).
- the Hilbert sum π is unitary when every π i is.
- the Hilbert sum π is strongly continuous when every π i is unitary and strongly continuous.
- the Hilbert sum π g (lp.single 2 i v) = lp.single 2 i (π i g v).
- For ι with a single element i, the Hilbert sum π ≃ᵤ π i.

**Checks.**

- For ι empty, lp (fun i ↦ H i) 2 is the zero space and the Hilbert sum is the zero representation.
- For ι = Unit, the Hilbert sum π is unitarily equivalent to π ().
- The Hilbert sum over ℕ of copies of the trivial representation on ℂ is the trivial action on ℓ²(ℕ).
- For ι = ℕ and Hᵢ = ℂ with trivial action, the algebraic direct sum is proper and dense in ℓ²(ℕ): the vector i ↦ 1/(i+1) belongs to ℓ² and has infinite support. Infinite ι alone does not imply properness (all Hᵢ might be zero).

The positive-type coefficient of a finitely supported vector f = Σᵢ fᵢ is the sum of the coefficients of the fᵢ (positive-type-coefficient).

Additional inputs for this route: GS23, §11.2, Proposition 11.6 and proof, p. 33.

*Needs:* SRU.0 / strongly-continuous-unitary; Mathlib `lp`.

### 0.3 Functions of positive type on a group (*positive-type-function*)

Let G be a group. A function φ : G → ℂ is of positive type when for every n, every c : Fin n → ℂ and every g : Fin n → G, 0 ≤ Σᵢ Σⱼ cᵢ · conj(cⱼ) · φ(gⱼ⁻¹ gᵢ) in the order of ℂ (real and nonnegative); equivalently the kernel (a, b) ↦ φ(a⁻¹ b) is Matrix.PosSemidef. For a topological group, P(G) is the set of continuous φ of positive type (BHV Definition C.4.1 requires continuity), P₁(G) = {φ ∈ P(G) : φ(e) = 1} and P≤1(G) = {φ ∈ P(G) : φ(e) ≤ 1}. Basic properties: φ(e) is real and ≥ 0, φ(g⁻¹) = conj φ(g), |φ(g)| ≤ φ(e), and |φ(g) − φ(h)|² ≤ 2 φ(e) (φ(e) − Re φ(g⁻¹h)), so every φ ∈ P(G) is left and right uniformly continuous. P(G) is a convex cone closed under pointwise products, conjugation and pointwise limits that remain continuous; P₁(G) and P≤1(G) are convex. On G = Multiplicative A for an additive commutative group A, positive type agrees with Tau Ceti's IsPositiveDefiniteSub. (BHV, Definition C.4.1 and Proposition C.4.2, PDF p. 384)

G a group; continuity is part of membership in P(G), not of positive type. The order on ℂ is Mathlib's ComplexOrder: 0 ≤ z iff z is real and nonnegative.

In `Suggested.lean` positive type is `IsPositiveType` and P₁(G) is `positiveTypeOne`.

One proof route is as follows. (i)–(ii) are the 1 × 1 and 2 × 2 cases of the defining inequality (BHV Proposition C.4.2(i)–(ii), via C.1.2). (iii) is the 3 × 3 case with the points g, h, e and the scalars chosen in BHV Proposition C.4.2(iii). The kernel form: Σ cᵢ conj(cⱼ) φ(gⱼ⁻¹gᵢ) is the hermitian form of the matrix (φ(gⱼ⁻¹gᵢ)), so positive type φ iff (fun a b ↦ φ (a⁻¹ * b)) is Matrix.PosSemidef; this is the input to Tau Ceti's Kolmogorov space. Closure under products is the Schur product theorem for positive semidefinite matrices; under limits, nonnegativity is a closed condition. For G = Multiplicative A, gⱼ⁻¹ gᵢ = ofAdd (vᵢ − vⱼ), which is the expression in IsPositiveDefiniteSub.

The defining object has the following API.

- positive type φ :⇔ ∀ n (c : Fin n → ℂ) (g : Fin n → G), 0 ≤ Σ i, Σ j, c i * conj (c j) * φ ((g j)⁻¹ * g i).
- positive type φ ↔ Matrix.PosSemidef (fun a b : G ↦ φ (a⁻¹ * b)).
- 0 ≤ φ 1, so φ 1 is real.
- φ g⁻¹ = conj (φ g).
- ‖φ g‖ ≤ (φ 1).re.
- ‖φ g − φ h‖² ≤ 2 (φ 1).re ((φ 1).re − (φ (g⁻¹ * h)).re).
- Sums, nonnegative real multiples, pointwise products and conjugates of functions of positive type are of positive type.
- A pointwise limit of functions of positive type is of positive type.
- For an additive commutative group A and F : A → ℂ, positive type (F ∘ Multiplicative.toAdd) ↔ TauCeti.IsPositiveDefiniteSub F.
- P₁ G := {φ | Continuous φ ∧ positive type φ ∧ φ 1 = 1}, convex.
- P≤1 G := {φ | Continuous φ ∧ positive type φ ∧ (φ 1).re ≤ 1}, convex; P G is the cone of continuous functions of positive type.

**Checks.**

- The constant function 1 is of positive type on every group, and lies in P₁ G for every topological group.
- For an open subgroup U of a topological group G, the indicator function of U is of positive type (it is the coefficient of the vector δ_U in ℓ²(G/U)); for G = ℚ_p and U = ℤ_p it lies in P₁(ℚ_p).
- The constant function −1 is not of positive type: the 1 × 1 inequality fails.
- On ℤ the function with φ(0) = 1 and φ(n) = 2 for n ≠ 0 is not of positive type, since ‖φ 1‖ > φ 0.
- For θ ∈ ℝ, n ↦ exp(i n θ) on Multiplicative ℤ is of positive type, and IsPositiveDefiniteSub holds for the same function on ℤ.
- On S₃, for the standard real two-dimensional representation and v a unit vector on the axis fixed by (12), the Gram matrix at {e,(12)} is [[1,1],[1,1]], with quadratic value 4 at (1,1) and 0 at (1,−1). The inverse/left-product convention must still give this positive matrix.

Every unitary character χ : G → S¹ is of positive type, and χ ∈ P₁(G) when χ is continuous. The constant function 1 is an extreme point of P₁(G), being the coefficient of the trivial representation, which is irreducible (pure-iff-irreducible).

Additional inputs for this route: GS23, §11.2, proof of Proposition 11.6, p. 33.

*Needs:* Mathlib `Matrix.PosSemidef`; Tau Ceti `TauCeti.IsPositiveDefiniteSub`; Mathlib `Multiplicative`.

### 0.4 Positive-type coefficients of unitary representations (*positive-type-coefficient*)

For a strongly continuous representation π of a topological group G on a complex Hilbert space H and v, w ∈ H, the coefficient π w v ∈ C(G, ℂ) is g ↦ ⟪w, π g v⟫; the positive-type coefficient of v is c(π,v) := the coefficient π v v, g ↦ ⟪v, π g v⟫ (Bekka–de la Harpe–Valette's ⟨π(g)v, v⟩). If π is unitary, c(π,v) is of positive type and lies in P(G), with c(π,v) (e) = ‖v‖²; c(π,v) ∈ P₁(G) for unit vectors v. It is invariant under unitary equivalence, additive on orthogonal sums of invariant subspaces, and ‖c(π,v) − c(π,w)‖_∞ ≤ (‖v‖ + ‖w‖)‖v − w‖. When g ↦ π g is norm continuous, c(π,v) g = Tau Ceti's matrixCoeff π hπ v v (g⁻¹) = conj (matrixCoeff π hπ v v g). (BHV, Proposition C.4.3, PDF p. 385)

π strongly continuous (for continuity of coefficients); unitary for positive type.

In `Suggested.lean` the positive-type coefficient is `ptCoeff`.

One proof route is as follows. Continuity: g ↦ π g v is continuous and ⟪w, ·⟫ is continuous. Positive type: Σᵢⱼ cᵢ conj(cⱼ) ⟪v, π(gⱼ⁻¹gᵢ) v⟫ = Σᵢⱼ cᵢ conj(cⱼ) ⟪π gⱼ v, π gᵢ v⟫ = ‖Σᵢ cᵢ π gᵢ v‖² ≥ 0 (BHV Proposition C.4.3). The uniform estimate: |⟪v, π g v⟫ − ⟪w, π g w⟫| ≤ |⟪v − w, π g v⟫| + |⟪w, π g (v − w)⟫| by Cauchy–Schwarz and unitarity. Comparison with Tau Ceti: matrixCoeff π hπ v v g = ⟪π g v, v⟫ = conj ⟪v, π g v⟫, and ⟪π g⁻¹ v, v⟫ = ⟪v, π g v⟫ by unitarity.

The defining object has the following API.

- For a strongly continuous π, the continuous coefficient of w and v is g ↦ ⟪w, π g v⟫, for π strongly continuous.
- The diagonal coefficient is g ↦ ⟪v, π g v⟫.
- For unitary strongly continuous π, c(π,v) is of positive type.
- c(π,v) 1 = ‖v‖².
- If T : π ≃ᵤ ρ then c ρ (T v) = c(π,v).
- If v ∈ W and w ∈ Wᗮ for a closed invariant W, c π (v + w) = c(π,v) + c(π,w).
- If g ↦ π g is norm continuous and π is unitary, c(π,v) g = ContRepresentation.matrixCoeff π hπ v v g⁻¹.
- For all g, ‖c(π,v) g − c(π,w) g‖ ≤ (‖v‖ + ‖w‖) ‖v − w‖.

**Checks.**

- For the trivial representation of G on ℂ and v ∈ ℂ, c(π,v) is the constant function |v|².
- For a unitary character χ acting on ℂ and v = 1, c π 1 = χ.
- For C₄ = ⟨g⟩ acting on ℂ by g ↦ i and v = 1: c(π,1)(g) = ⟪1, i⟫ = i, Tau Ceti's opposite-slot coefficient ⟪π g 1, 1⟫ equals −i, and its value at g⁻¹ is i; a definition with the two slots exchanged would give −i at g.
- For the trivial representation on ℂ, the off-diagonal coefficient of (−1, 1) is the constant −1, which is not of positive type.

For the trivial representation on ℂ, c(π,v) is the constant |v|². For a unit vector v of a one-dimensional representation given by a unitary character χ, c(π,v) = χ.

Additional inputs for this route: GS23, §11.1, definition of limit points, p. 31; Definition 11.5, p. 33.

*Needs:* SRU.0 / strongly-continuous-unitary; SRU.0 / positive-type-function; Tau Ceti `ContRepresentation.matrixCoeff`; Tau Ceti `ContRepresentation.matrixCoeff_apply`; Mathlib `ContinuousMap`.

### 0.5 The GNS construction for functions of positive type (*gns-construction*)

Let G be a topological group and φ ∈ P(G). There is a triple (π_φ, H_φ, ξ_φ) with H_φ a complex Hilbert space, π_φ a strongly continuous unitary representation of G on H_φ and ξ_φ ∈ H_φ a cyclic vector (its orbit spans a dense subspace) such that φ = c π_φ ξ_φ. It is unique: for any triple (π, H, ξ) with ξ cyclic and c π ξ = φ there is a unique unitary equivalence T : π_φ ≃ᵤ π with T ξ_φ = ξ. Concretely H_φ is Tau Ceti's Kolmogorov space of the positive semidefinite kernel K(a, b) = φ(a⁻¹ b), with feature map Φ : G → H_φ satisfying ⟪Φ a, Φ b⟫ = φ(a⁻¹b); π_φ(g) Φ(a) = Φ(g a) and ξ_φ = Φ(e). For any strongly continuous unitary π and v ∈ H, the GNS representation of c(π,v) is unitarily equivalent to the cyclic subrepresentation on the closed span of π(G)v. If φ = φ₁ + φ₂ with φ₁, φ₂ ∈ P(G), then `π_(φ₁)` is unitarily equivalent to a subrepresentation of π_φ (BHV Proposition C.5.1). (BHV, Theorem C.4.10 and Proposition C.5.1, PDF p. 387)

φ continuous and of positive type.

The headline statement in `Suggested.lean` is `exists_gnsRep`: the strongly continuous unitary translation action on the Kolmogorov space of the kernel, with Φ(e) as cyclic vector.

One proof route is as follows. By positive-type-function the kernel K(a, b) = φ(a⁻¹b) is Matrix.PosSemidef; take H_φ = Matrix.PosSemidef.KolmogorovSpace and Φ = kolmogorovFeature, so ⟪Φ a, Φ b⟫ = K a b and the span of Φ(G) is dense (inner_kolmogorovFeature, kolmogorovFeature_dense). For g ∈ G the map a ↦ Φ(g a) has the same kernel, since (g a)⁻¹(g b) = a⁻¹b, and dense span; Tau Ceti's kolmogorovEquiv gives a linear isometric equivalence π_φ(g) with π_φ(g)Φ(a) = Φ(ga). Uniqueness of kolmogorovEquiv gives π_φ(gh) = π_φ(g)π_φ(h). Strong continuity: ‖Φ(ga) − Φ(a)‖² = 2 Re(φ(e) − φ(a⁻¹ g a)), which tends to 0 as g → e by continuity of φ; density and the uniform bound ‖π_φ(g)‖ ≤ 1 extend continuity to all vectors (BHV Theorem C.4.10, proof). c π_φ ξ_φ (g) = ⟪Φ e, Φ g⟫ = φ(g). Uniqueness: for (π, H, ξ) the map Φ(a) ↦ π(a)ξ has the same kernel; kolmogorovIsometry and cyclicity give T, and uniqueness of the extension gives intertwining. For Proposition C.5.1, domination gives a contraction T : H_φ → `H_(φ₁)` with dense range, intertwining the actions. T* is injective but need not be isometric. Apply the rectangular polar decomposition to T*: its initial space is all `H_(φ₁)`, and its polar isometry intertwines, since TT* on `H_(φ₁)` and its square root commute with the action. This gives the required isometric intertwiner (BHV Proposition A.1.4; upstream OperatorTheory/PolarDecomposition PD-B24–B34).

The defining object has the following API.

- The strongly continuous unitary representation π_φ of G on H_φ with π_φ g (Φ a) = Φ (g * a).
- ξ_φ := Φ 1.
- c π_φ ξ_φ = φ.
- If φ = φ₁ + φ₂ in P(G), there is an isometric intertwiner from `π_(φ₁)` into π_φ (BHV Proposition C.5.1).

**Checks.**

- For φ = 1, the GNS space is one-dimensional and the GNS representation is the trivial representation.
- For a continuous unitary character χ, the GNS triple of χ is (χ, ℂ, 1) up to unique unitary equivalence.
- For G = ℤ with the discrete topology and φ = indicator of {0}, the GNS representation is unitarily equivalent to the left regular representation on ℓ²(ℤ), with ξ_φ ↦ δ₀.
- For φ = 1 on a nontrivial group the feature map Φ is constant, so the GNS space is not ℓ²(G): the construction quotients by the kernel's radical.

For φ = 1, H_φ is one-dimensional and π_φ is trivial. For G discrete and φ = δ_e, π_φ is the left regular representation on ℓ²(G) (BHV Example C.4.12).

*Needs:* SRU.0 / positive-type-function; SRU.0 / positive-type-coefficient; SRU.0 / strongly-continuous-unitary; Tau Ceti `Matrix.PosSemidef.KolmogorovSpace`; Tau Ceti `Matrix.PosSemidef.kolmogorovFeature`; Tau Ceti `Matrix.PosSemidef.inner_kolmogorovFeature`; Tau Ceti `Matrix.PosSemidef.kolmogorovFeature_dense`; Tau Ceti `Matrix.PosSemidef.kolmogorovIsometry`; Tau Ceti `Matrix.PosSemidef.kolmogorovEquiv`; OperatorTheory/PolarDecomposition Part B.

### 0.6 The unitary dual (*unitary-dual*)

For a topological group G, the unitary dual Ĝ is the set of unitary-equivalence classes of topologically irreducible strongly continuous unitary representations of G. To avoid quantifying over Hilbert spaces in all universes, Ĝ is realised as the quotient of the set of φ ∈ P₁(G) whose GNS representation π_φ is topologically irreducible by the relation φ ∼ ψ :⇔ π_φ ≃ᵤ π_ψ. For a topologically irreducible strongly continuous unitary (π, H) and a unit vector v, [π] := the class of c(π,v), which does not depend on v; [π] = [ρ] iff π ≃ᵤ ρ; every class is [π_φ] for any representative φ. (BHV, Remark C.4.13 and §F.2, PDF p. 389)

G a topological group; for the Fell topology and the theorems of SRU.1 G is locally profinite.

One proof route is as follows. Independence of v: in a topologically irreducible π every nonzero v is cyclic (every nonzero vector of a topologically irreducible representation is cyclic, SRU.0.1), so by uniqueness in the GNS construction `π_(c(π,v))` ≃ᵤ π for every unit v. Hence [π] = [ρ] iff `π_(c(π,v))` ≃ᵤ `π_(c ρ w)` iff π ≃ᵤ ρ. Every class is realised by its GNS representation, which is topologically irreducible by definition of the set.

The defining object has the following API.

- Ĝ, a type in the universe of G: the quotient of the set of φ ∈ P₁(G) whose GNS representation is topologically irreducible by the relation φ ∼ ψ iff their GNS representations are unitarily equivalent.
- For a topologically irreducible strongly continuous unitary π and a unit vector v, the class [π] ∈ Ĝ of the coefficient c(π,v).
- [π] = [ρ] iff π ≃ᵤ ρ.
- [π] does not depend on the unit vector v.
- Every x ∈ Ĝ has a representative strongly continuous unitary representation rep x, the GNS representation of a representative φ, with [rep x] = x.
- The class of the trivial representation, [1_G].

**Checks.**

- For G trivial, the unitary dual G has exactly one element.
- For G finite abelian with the discrete topology, the unitary dual G is in bijection with the Pontryagin dual (characters G →* circle).
- For G = ℤ/2 the classes of the trivial and the sign character are different, although both are one-dimensional.
- For C₂ = {e, g} with the trivial representation on ℂ, the unit vectors 1 and i both give the coefficient with values (1, 1) at (e, g), so they define the same class, whereas the sign representation gives (1, −1) and a different class.

For G abelian the unitary dual is in bijection with the continuous unitary characters, every topologically irreducible strongly continuous unitary representation being one-dimensional (Schur's lemma). For G compact the classes are those of finite-dimensional irreducibles, matching the index set of Peter–Weyl in RepresentationTheory/CompactGroups.

Additional inputs for this route: GS23, §11, opening paragraph and §11.1, pp. 30–31.

*Needs:* SRU.0 / gns-construction; SRU.0 / positive-type-coefficient; SRU.0 / strongly-continuous-unitary.

### 0.7 Pure functions of positive type and irreducibility (*pure-iff-irreducible*)

Let G be a topological group. (1) For φ ∈ P₁(G), φ is an extreme point of P₁(G) iff its GNS representation π_φ is topologically irreducible (BHV Theorem C.5.2). (2) The extreme points of P≤1(G) are 0 and the extreme points of P₁(G) (BHV Theorem C.5.5(i)). (3) If π is topologically irreducible, strongly continuous and unitary, every normalised coefficient c(π,v), ‖v‖ = 1, is an extreme point of P₁(G) and of P≤1(G). Extreme points are taken in Mathlib's sense, Set.extremePoints ℝ. (BHV, Theorems C.5.2 and C.5.5(i), PDF p. 391)

G a topological group; φ continuous of positive type with φ(e) = 1 in (1).

The headline statement in `Suggested.lean` is `mem_extremePoints_positiveTypeOne_iff`, part (1) for the translation action on the Kolmogorov space.

One proof route is as follows. If H_φ = W ⊕ Wᗮ is a nontrivial invariant orthogonal decomposition, cyclicity makes both projected cyclic vectors nonzero. Their normalised coefficients give φ = sφ₁+(1−s)φ₂ with 0<s<1. If φ₁=φ, equality of coefficients gives ⟪π(g)ξ,P_Wξ⟫=s⟪π(g)ξ,ξ⟫ for every g. The orbit spans densely, hence P_Wξ=sξ, which is impossible for a projection and a nonzero ξ with 0<s<1. Thus the decomposition is nonconstant (BHV Theorem C.5.2). Orthogonal invariant subspaces can carry equivalent representations; disjointness is not used. If π_φ is irreducible and φ = t φ₁ + (1 − t) φ₂, then t φ₁ ≤ φ in the cone order, so by BHV Proposition C.5.1 (the GNS domination argument) there is a positive operator A in the commutant of π_φ with t φ₁ = ⟪ξ_φ, π_φ(·) A ξ_φ⟫; Schur's lemma for topologically irreducible unitary representations (BHV Theorem A.2.2; NoncompactQuantumSymmetry M0, the supplier contract) makes A scalar, so φ₁ = φ. (2): 0 is extreme in P≤1 because φ(e) = 0 forces φ = 0; an element ψ with 0 < ψ(e) < 1 is the convex combination ψ(e)(ψ/ψ(e)) + (1 − ψ(e))0; normalisation forces both summands of a decomposition of an element of ext P₁ into P₁ (BHV Theorem C.5.5(i), proof). (3) follows from (1)–(2) and the GNS uniqueness: `π_(c(π,v))` ≃ᵤ π.

For G = ℤ/2, P₁(G) is the segment of functions with φ(0) = 1, φ(1) ∈ [−1, 1]; its extreme points φ(1) = ±1 are the two characters, and the midpoint φ(1) = 0, the coefficient of the regular representation, is not extreme. For G compact the characters of finite-dimensional irreducibles normalised by dimension are not extreme in general, but normalised diagonal coefficients of irreducibles are.

Additional inputs for this route: GS23, §11.2, proof of Proposition 11.6, p. 33.

*Needs:* SRU.0 / gns-construction; SRU.0 / positive-type-function; SRU.0 / positive-type-coefficient; Mathlib `Set.extremePoints`; NoncompactQuantumSymmetry M0.

### 0.8 Smooth vectors and K-type projectors of unitary representations of locally profinite groups (*smooth-vectors-unitary*)

Let G be locally profinite (compact open subgroups form a neighbourhood basis of e) and π a strongly continuous unitary representation on H. For a compact open subgroup K: H^K is a closed subspace and e_K is the orthogonal projection onto it; for every open normal K' ⊆ K, e_K = [K : K']⁻¹ `Σ_(k ∈ K/K')` π(k) `e_(K')`, and e_K v is the average of k ↦ π(k)v for the Haar probability measure of K. The smooth vectors H^∞ = ⋃_K H^K form a dense G-stable subspace; with the restricted action they are a smooth representation in the sense of SR.0 with (H^∞)^K = H^K, on which e_K is SR.0's averaging projector. For a smooth irreducible representation τ of K, trivial on an open normal K' ⊆ K, the K-type projector e_τ := (dim τ / [K : K']) `Σ_(k ∈ K/K')` conj(χ_τ(k)) π(k) `e_(K')` is the orthogonal projection onto the τ-isotypic subspace H(τ); the H(τ) are mutually orthogonal and H is their Hilbert sum. Equivalently e_τ = π(f_τ) for the smooth function f_τ on G supported on K with f_τ = (dim τ / vol K) conj χ_τ on K; Gan–Savin's normalisation omits the factor dim τ. (GS23, Lemma 11.4 and its preceding projector, PDF p. 32)

G locally profinite; π strongly continuous unitary. τ a smooth irreducible complex representation of the compact open K (finite-dimensional, trivial on some open normal K').

One proof route is as follows. Use the supplied compact-type projections. The compact-open trivial-type projection equals orthogonal projection onto H^K; its range consists of smooth vectors. For a finite set of vectors, strong continuity makes averaging over a sufficiently small compact open subgroup uniformly close to the identity on that finite set, proving density. Compare its restriction to the algebraic smooth part with SR.0.3 averaging.

The defining object has the following API.

- H^K := ⨅ k ∈ K, ker (π k − 1), the closed subspace of K-fixed vectors.
- For K' ⊆ K open normal, e_K = [K:K']⁻¹ `Σ_(k ∈ K/K')` π k ∘ `e_(K')`.
- H^∞ := ⨆ over compact open K of H^K, a G-stable submodule.
- For strongly continuous π of a locally profinite G, H^∞ is dense in H.
- The restricted action on H^∞ is a smooth representation in the sense of SR.0, with (H^∞)^K = H^K, and e_K restricts to SR.0's averaging projector.

**Checks.**

- For the trivial representation of G on ℂ, e_K = 1 for every compact open K.
- For G = ℤ_p acting on ℂ by a character χ of exact conductor pⁿ (n ≥ 1), `e_(ℤ_p)` = 0 and `e_(pⁿℤ_p)` = 1.
- For ℤ_p acting on ℓ²(ℕ) by e_n ↦ χ_n(g)e_n (χ_n of exact conductor pⁿ), the vector Σ e_n/(n+1) lies in H but not in H^∞: it has infinitely many nonzero components of unbounded conductor.
- For K finite acting on ℂ[K] by the regular representation and τ irreducible of dimension d, the operator (1/|K|) Σ conj χ_τ(k) π(k) equals e_τ / d, not e_τ; the factor d is required.

For the trivial representation, e_K = 1 and e_τ = 0 for every nontrivial τ. For π irreducible admissible unitarizable of a reductive p-adic group (SRU.2), H^K is finite-dimensional and e_K H is the completion-independent space V^K.

Additional inputs for this route: Cas95, §2.1, definition of P_K and the sentence after it, p. 20.

*Needs:* SRU.0 / strongly-continuous-unitary; SRU.0 / hilbert-direct-sum; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / van-dantzig; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / is-smooth; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / smooth-vectors; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / averaging-projector; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / compact-open-invariants; Mathlib `Submodule.orthogonalProjectionOnto`.

### Examples

The trivial group has one irreducible unitary class and P₁ = {1}. For the cyclic group C₂, the normalized vector (1,1)/√2 in 1 ⊕ sign has coefficient 1 at e and 0 at the nonidentity; it is the midpoint of the two characters and its cyclic representation has dimension 2. For S₃ the standard two-dimensional constituent, rather than a character, tests the nonabelian quotient. For ℤ_p, a Hilbert sum of characters with unbounded conductor has a dense proper smooth subspace.

### Dependencies

The statement carriers and the proposed proof inputs are the individual Needs lines above. This layer consumes the pinned Hilbert-space and representation APIs. The compact-type and polar-factor supplier contracts are used for the Hilbert comparisons.

## Layer SRU.1: Weak containment and the Fell topology

### 1.1 Weak containment of unitary representations (*weak-containment*)

Let G be a topological group and σ, π strongly continuous unitary representations on Hσ, Hπ. σ is weakly contained in π, σ ≺ π, when for every v ∈ Hσ, every compact Q ⊆ G and every ε > 0 there are w₁, …, wₙ ∈ Hπ with |c(σ,v) g − Σᵢ c(π,w)ᵢ g| < ε for all g ∈ Q (BHV Definition F.1.1). Equivalently (normalised convex form, Gan–Savin Definition 11.5, BHV Remark F.1.2): every normalised coefficient c(σ,v), ‖v‖ = 1, is a uniform limit on compact sets of convex combinations of normalised coefficients c(π,w), ‖w‖ = 1. σ and π are weakly equivalent, σ ∼ π, if σ ≺ π and π ≺ σ. It suffices to test v in a subset whose G-translates span a dense subspace (BHV Lemma F.1.3). (BHV, Definition F.1.1 and Lemma F.1.3, PDF p. 431)

G a topological group; all representations strongly continuous and unitary.

In `Suggested.lean` weak containment is `WeaklyContainedIn`.

One proof route is as follows. Equivalence of the two forms: if a sum Σ ψᵢ of coefficients of π approximates a normalised φ uniformly on a compact Q ∋ e, then Σ ψᵢ(e) is close to 1 and Σ (ψᵢ(e)/Σⱼψⱼ(e)) (ψᵢ/ψᵢ(e)) is a convex combination of normalised coefficients close to φ on Q; the converse rescales (BHV Remark F.1.2). Reflexivity and invariance under unitary equivalence are immediate; transitivity substitutes approximations, using that coefficients of π are uniformly continuous in the vector (the estimate ‖c(π,v) − c(π,w)‖_∞ ≤ (‖v‖ + ‖w‖)‖v − w‖ of SRU.0.4). A closed invariant subrepresentation or a Hilbert summand of π is weakly contained in π; a Hilbert sum ⊕̂ σᵢ ≺ π iff every σᵢ ≺ π, because the coefficient of a finitely supported vector is the sum of the coefficients of its components and finitely supported vectors are dense. For Lemma F.1.3, first fix one test vector: expand coefficients of its finite linear combinations of translates, on the enlarged compact sets gᵢ⁻¹Qgⱼ. For different test vectors use the argument of BHV pp. 421–423: the vectors with approximable coefficients form a closed G-invariant subspace; to prove closure under addition, project one cyclic subspace into the orthogonal complement of the other and use Proposition A.1.4 to identify the resulting cyclic representation with a subrepresentation of the second. Orthogonal sums then give coefficient sums. Expanding cross terms for two unrelated test vectors does not suffice.

The defining object has the following API.

- `WeaklyContainedInFamily`: for a family (πᵢ), σ is weakly contained in the family when ∀ v, ∀ Q compact, ∀ ε > 0, ∃ finitely many (i_j, w_j), ∀ g ∈ Q, ‖c(σ,v) g − Σ_j c `π_(i_j)` w_j g‖ < ε; this is equivalent to σ ≺ ⊕̂ πᵢ, and `WeaklyContainedIn` is the case of a one-member family.
- σ ≺ π iff each normalised c(σ,v) lies in the closure, for uniform convergence on compacta, of the convex hull of the normalised coefficients of π.
- σ ≺ σ.
- σ ≺ π → π ≺ ρ → σ ≺ ρ.
- If σ ≃ᵤ σ' and π ≃ᵤ π' then σ ≺ π ↔ σ' ≺ π'.
- A closed invariant subrepresentation of π is weakly contained in π.
- the Hilbert sum σ ≺ π ↔ ∀ i, σ i ≺ π.
- If the coefficients of vectors in a set S ⊆ Hσ with dense span of G-translates are approximable, then σ ≺ π (BHV Lemma F.1.3).
- σ ∼ π :⇔ σ ≺ π ∧ π ≺ σ.

**Checks.**

- The zero representation is weakly contained in every π, through the empty sum (n = 0); conversely, a unit-vector coefficient of the trivial representation is not approximated by the zero representation on Q = {e} with ε = ½, since the error is 1.
- For G = ℤ (discrete), the trivial representation is weakly contained in the left regular representation on ℓ²(ℤ): the unit vectors `(2N+1)^(-1/2)` `1_([−N, N])` have coefficients tending to 1 uniformly on finite sets.
- For G = ℤ the left regular representation on ℓ²(ℤ) has no nonzero invariant vector, so weak containment of the trivial representation is not containment.
- For G finite and σ irreducible, σ ≺ π iff Hom_G(σ, π) ≠ 0.

σ ≺ σ ⊕̂ ρ for every ρ. For G compact and σ irreducible, σ ≺ π iff σ is unitarily equivalent to a subrepresentation of π (BHV Proposition F.1.8).

Additional inputs for this route: GS23, §11.2, Definition 11.5, p. 33.

*Needs:* SRU.0 / positive-type-coefficient; SRU.0 / hilbert-direct-sum; SRU.0 / strongly-continuous-unitary; SRU.0 / gns-construction; OperatorTheory/PolarDecomposition Part B.

### 1.2 Milman's converse to the Krein–Milman theorem (*milman-converse*)

Let E be a real Hausdorff topological vector space that is locally convex (Mathlib's LocallyConvexSpace ℝ E), F ⊆ E, and suppose C := closure (convexHull ℝ F) is compact. Then every extreme point of C lies in closure F: Set.extremePoints ℝ C ⊆ closure F. Mathlib's closure_convexHull_extremePoints is the Krein–Milman theorem (C is the closed convex hull of its extreme points); this is its converse. (BHV, proof of Proposition F.1.4, PDF p. 434)

E real, Hausdorff, locally convex; complex spaces are used through restriction of scalars. closure (convexHull ℝ F) compact.

One proof route is as follows. Let x ∈ ext C and suppose x ∉ closure F. Since closure F ⊆ C is compact, choose a closed convex neighbourhood U of 0 with x ∉ closure F + U + U (local convexity and regularity of the uniform structure). Cover closure F by finitely many translates yᵢ + U, yᵢ ∈ closure F, and put Cᵢ := closure (convexHull (closure F ∩ (yᵢ + U))) ⊆ yᵢ + U, a compact convex set. The convex hull of the finite union of compact convex Cᵢ is the image of a simplex times ∏ Cᵢ, hence compact; it contains F, so it equals C. Write x = Σ tᵢ cᵢ with cᵢ ∈ Cᵢ; extremality of x in C forces x = cᵢ for some i (Mathlib's extremePoints_convexHull_subset in the finite form), so x ∈ yᵢ + U ⊆ closure F + U, a contradiction.

In ℝ with F = {0, 1} ∪ {1/2}, C = [0, 1] and its extreme points 0, 1 lie in F. In ℝ² with F the circle, C is the closed disc and its extreme points are exactly the circle = closure F. Compactness cannot be dropped: in ℓ²(ℕ) with the norm topology and F the standard basis {eₙ}, the closed convex hull C contains 0 (as the limit of (e₁ + ⋯ + eₙ)/n), 0 is extreme in C because C lies in the positive cone, and 0 ∉ closure F since every ‖eₙ‖ = 1; C is not compact.

Additional inputs for this route: GS23, §11.2, proof of Proposition 11.6, p. 33.

*Needs:* Mathlib `LocallyConvexSpace`; Mathlib `convexHull`; Mathlib `Set.extremePoints`; Mathlib `extremePoints_convexHull_subset`.

### 1.3 Positive type through the integrated form (*positive-type-integral-form*)

Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. Every φ ∈ P(G) is bounded and continuous, so it defines an element of L^∞(G, μ) with ‖φ‖_∞ = φ(e). Conversely, φ ∈ L^∞(G, μ) agrees μ-almost everywhere with a continuous function of positive type iff ∫∫ f(x) conj(f(y)) φ(y⁻¹x) dμ(x) dμ(y) ≥ 0 for every f ∈ C_c(G), equivalently ⟨φ, f* ∗ f⟩ ≥ 0 for every f ∈ L¹(G) (BHV Lemma C.5.3, after Godement). (BHV, Lemma C.5.3, PDF p. 393)

G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use.

The headline statement in `Suggested.lean` is `godement`.

One proof route is as follows. Use the integrated-L¹ GNS supplier contract. Compactly supported continuous functions are dense in L¹; their quadratic integrated inequalities extend continuously, and the nondegenerate integrated representation recovers the positive-type coefficient. Equality of L¹ pairings gives equality almost everywhere. The σ-finite Haar hypothesis identifies local and global almost-everywhere equality.

**Checks.**

- For a finite group with counting measure and f = δ_a + iδ_b, the quadratic integral is the same finite Hermitian form as the kernel definition; at φ = 1 it is |1+i|² = 2. At φ = −1 and f = δ_e its value is −1, excluding a missing positivity condition.
- For the affine group of the line, (a, b)(c, d) = (ac, b + ad) with a, c > 0, the left Haar measure is da db/a² and the modular function in the convention ∫ f(xg⁻¹) dμ = Δ(g) ∫ f dμ is Δ(a, b) = a⁻¹ (BHV, definition before Proposition A.3.3 and Lemma A.3.4, printed pp. 320–321). For f with f(½, 0) = 1, the involution f*(g) = Δ(g⁻¹) conjugate(f(g⁻¹)) of Conventions gives f*(2, 0) = Δ(½, 0) · 1 = 2, whereas the convention with Δ(g) in place of Δ(g⁻¹) gives ½; applying the involution twice multiplies by Δ(g⁻¹)Δ(g) = 1 and returns f, as an involution must, and Lemma A.3.4 makes f ↦ f* an isometry of L¹. Every other Check of SRU.0–SRU.1 uses a unimodular group, on which the two conventions agree.

For G discrete, the integrated condition with f = Σ cᵢ `δ_(gᵢ)` is literally the defining finite sum. The constant function −1 fails the integrated test for any f ≠ 0 with ∫ f ≠ 0.

*Needs:* SRU.0 / positive-type-function; SRU.0 / gns-construction; SRU.0 / positive-type-coefficient; Mathlib `MeasureTheory.Measure.haar`; Mathlib `MeasureTheory.Lp`; OperatorAlgebraDynamics D1–D2, integrated-L¹ GNS contract.

### 1.4 Weak-* compactness of P≤1(G) (*positive-type-weak-star-compact*)

Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. With L^∞(G, μ) identified with the dual of L¹(G, μ) through the integral pairing (the σ-finite duality contract on BanachSpaceTheory B5), the set P≤1(G) is weak-* compact and convex; its extreme points are 0 and the pure functions of positive type (SRU.0 pure-iff-irreducible); the convex hull of ext P₁(G) is weak-* dense in P₁(G) (BHV Lemma C.5.4 and Theorem C.5.5). (BHV, Lemma C.5.4 and Theorem C.5.5, PDF p. 393)

G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use.

The headline statement in `Suggested.lean` is `isCompact_positiveTypeSubunit_integrals`: the image of P≤1(G) under the pairing map φ ↦ (f ↦ ∫ f φ dμ) is compact in the product topology on functions L¹(G, μ) → ℂ. On bounded sets of L^∞ this product topology is the weak-* topology, so the statement is the compactness assertion without the duality carrier.

One proof route is as follows. P≤1(G) lies in the closed unit ball of L^∞(G) = L¹(G)* (positive-type-integral-form: ‖φ‖_∞ = φ(e) ≤ 1), which is weak-* compact (Mathlib's WeakDual.isCompact_closedBall, Banach–Alaoglu). P≤1(G) is weak-* closed: the integrated inequalities ⟨φ, f* ∗ f⟩ ≥ 0 are closed conditions, and positive-type-integral-form returns a continuous function of positive type; φ(e) ≤ 1 is ‖φ‖_∞ ≤ 1. Krein–Milman (Mathlib's closure_convexHull_extremePoints) gives density of the convex hull of ext P≤1(G) = ext P₁(G) ∪ {0} in P≤1(G); renormalising an approximating net as in BHV Theorem C.5.5(ii) gives density in P₁(G).

For G discrete, P₁(G) is itself weak-* compact, since φ(e) = ⟨φ, δ_e⟩ is weak-* continuous (BHV after Lemma C.5.4). For G = S¹, compact but not discrete, the characters χₙ ∈ P₁ tend weak-* to 0 ∉ P₁ (Riemann–Lebesgue), so P₁(G) is not weak-* closed (BHV, remark after Lemma C.5.4 and Exercise C.6.10, PDF pp. 393 and 400); compactness holds for P≤1(G) only.

Additional inputs for this route: GS23, §11.2, proof of Proposition 11.6, p. 33.

*Needs:* SRU.1 / positive-type-integral-form; SRU.0 / pure-iff-irreducible; Mathlib `WeakDual.isCompact_closedBall`; Mathlib `closure_convexHull_extremePoints`; BanachSpaceTheory B5, σ-finite duality contract.

### 1.5 Raikov's theorem (*raikov*)

Let G be a locally compact Hausdorff group with a left Haar measure μ; neither second countability nor σ-finiteness of μ is assumed. On P₁(G) the topology of convergence of all integrals ∫ f φ dμ, f ∈ L¹(G, μ) (the weak-* topology of L^∞ = (L¹)* when μ is σ-finite), and the topology of uniform convergence on compact subsets of G coincide (BHV Theorem C.5.6). Consequently the convex hull of the pure normalised functions of positive type is dense in P₁(G) for uniform convergence on compacta (Proposition C.5.8). (BHV, Theorem C.5.6 and Proposition C.5.8, PDF p. 395)

G a locally compact Hausdorff group with a left Haar measure μ; second countability is not assumed.

The headline statement in `Suggested.lean` is `raikov`, in filter form on C(G, ℂ) with the compact-open topology.

One proof route is as follows. First reduce to σ-compact open subgroups H: every compact subset of G lies in one, every f ∈ L¹(G, μ) vanishes almost everywhere outside one (inner regularity of μ on sets of finite measure), and positive type and normalisation restrict to H; on such H the Haar measure is σ-finite and the duality contract applies. Uniform on compacta ⇒ weak-*: for f ∈ L¹ and ε > 0 choose a compact Q carrying all but ε of ∫|f|; on Q the functions are uniformly close, off Q they are bounded by 1 (BHV proof of C.5.6, first part). Weak-* ⇒ uniform on compacta: for a net φᵢ → φ in P₁(G) weak-*, choose f ∈ C_c(G) with f ≥ 0, ∫ f = 1 supported near e so that φ is close to 1 there; the convolutions f ∗ φᵢ converge to f ∗ φ uniformly on compacta (equicontinuity of translates of f in L¹), and the estimate |ψ(x) − (f ∗ ψ)(x)|² ≤ 2 Re(1 − ⟨ψ, f⟩)-type bound from positive-type-function (C.4.2(iii)) controls φᵢ − f ∗ φᵢ uniformly once ⟨φᵢ, f⟩ → ⟨φ, f⟩ is close to 1 (BHV proof of C.5.6, second part). Density: combine with positive-type-weak-star-compact.

**Checks.**

- On the trivial group P₁ = {1}; both topologies are the one-point topology. On a nondiscrete group, norm-one positive-type functions can converge weak-* to 0 while their value at e stays 1; replacing P₁ by P≤1 would falsely force convergence at e.

The statement fails on P≤1(G): for G = S¹ the characters χₙ ∈ P₁ converge weak-* to 0 but χₙ(1) = 1 (BHV Remark C.5.7). For G discrete both topologies are pointwise convergence on P₁(G).

Additional inputs for this route: GS23, §11.2, proof of Proposition 11.6, p. 33.

*Needs:* SRU.0 / positive-type-function; SRU.1 / positive-type-weak-star-compact; SRU.1 / positive-type-integral-form; Mathlib `MeasureTheory.Measure.haar`; BanachSpaceTheory B5, σ-finite duality contract.

### 1.6 Irreducible weak containment by single coefficients (*irreducible-weak-containment*)

Let G be a locally compact Hausdorff group; second countability is not assumed. Let σ be topologically irreducible and σ ≺ π. Then for every unit v ∈ Hσ the normalised coefficient c(σ,v) is a uniform limit on compact subsets of normalised coefficients c(π,w), ‖w‖ = 1, of π itself, not only of their convex combinations (BHV Proposition F.1.4). For a family (πᵢ) such that σ is weakly contained in the family (equivalently in ⊕̂ᵢ πᵢ), every normalised coefficient of σ is approximated, on each compact set and within each ε > 0, by one normalised coefficient of one member πᵢ. (BHV, Proposition F.1.4, PDF p. 434)

G a locally compact Hausdorff group. σ topologically irreducible; π and every πᵢ strongly continuous unitary; all Hilbert spaces complete.

The headline statements in `Suggested.lean` are `exists_coeff_approx_of_weaklyContainedIn` and its family form `exists_coeff_approx_of_weaklyContainedInFamily`.

One proof route is as follows. Let F be the set of normalised coefficients of π (for a family, the union over i of those of πᵢ), and C the closure of the image of its convex hull under the pairing map φ ↦ (f ↦ ∫ f φ dμ) into the product space of functions L¹(G, μ) → ℂ, a Hausdorff locally convex real space. C is compact by Tychonoff, since the pairings of P≤1(G) are bounded by ‖f‖₁. C lies in the image of P≤1(G): a pointwise limit of such pairings is a bounded positive functional on L¹(G, μ), which the integrated-L¹ GNS contract represents by a continuous function of positive type. No L¹/L∞ duality and no σ-finiteness of μ is used. By weak containment c(σ,v) ∈ C (uniform convergence on compacta implies weak-* convergence for bounded functions: raikov, easy half). c(σ,v) is extreme in P≤1(G) (pure-iff-irreducible), hence in C; milman-converse puts it in the weak-* closure of F. A net in F ⊆ P₁(G) converging weak-* to a point of P₁(G) converges uniformly on compacta (raikov). For G locally profinite this last step is elementary (Gan–Savin, proof of Proposition 11.6): taking v and the approximants fixed by a small compact open K, the coefficients are K-bi-invariant and uniform convergence on compacta is pointwise convergence on K-double cosets, tested against the normalised indicators of KgK (smooth-vectors-unitary).

For G finite, σ irreducible and σ ≺ π, the statement gives a unit vector of π whose coefficient equals c(σ,v) exactly, since uniform approximation on the finite set G by a compact set of coefficients attains the limit. The conclusion fails for reducible σ: for G = ℤ/2, σ the regular representation on ℓ²(ℤ/2) with basis δ₀, δ₁, and the family π₁ = 1, π₂ = sgn, σ ≺ π₁ ⊕ π₂ but the coefficient of δ₀ in σ, the indicator of 0, is not a normalised coefficient of a single πᵢ (those are the constant 1 and the sign character). For irreducible σ = sgn and the same family, with Q = ℤ/2 and ε < 2, the member must be sgn: the coefficient of the trivial member differs from sgn by 2 at the nonidentity element.

Additional inputs for this route: GS23, §11.2, proof of Proposition 11.6, p. 33.

*Needs:* SRU.1 / weak-containment; SRU.1 / milman-converse; SRU.1 / positive-type-weak-star-compact; SRU.1 / raikov; SRU.0 / pure-iff-irreducible; SRU.0 / smooth-vectors-unitary; SRU.0 / positive-type-coefficient; OperatorAlgebraDynamics D1–D2, integrated-L¹ GNS contract; NoncompactQuantumSymmetry M0.

### 1.7 The Fell topology on the unitary dual (*fell-topology*)

Let G be a topological group and Ĝ its unitary dual (SRU.0). For x = [π] ∈ Ĝ, positive-type coefficients φ₁, …, φₙ of π, a compact Q ⊆ G and ε > 0, let W(x, φ₁, …, φₙ, Q, ε) be the set of y = [ρ] ∈ Ĝ such that each φᵢ is within ε on Q of a finite sum of positive-type coefficients of ρ. These sets form a basis of the Fell topology on Ĝ (BHV Definition F.2.1). A net yⱼ converges to x iff π ≺ `⊕̂_(k)` ρ_k for the representatives ρ_k of every subnet (BHV Proposition F.2.2); for G as in SRU.1 irreducible-weak-containment, single normalised coefficients of ρ suffice in W (BHV Proposition F.2.4). For a sequence (xₙ), the limit points L[xₙ] (xₙ → x) and cluster points C[xₙ] (x a limit point of a subsequence) satisfy L ⊆ C; x ∈ L[xₙ] iff for some, equivalently every, unit v there are unit vₙ with c πₙ vₙ → c(π,v) uniformly on compacta (Gan–Savin §11.1). x is isolated when {x} is open. The support of a unitary representation π is supp π = {x ∈ Ĝ : rep x ≺ π}, a closed subset (BHV Definition F.2.6). Ĝ is not Hausdorff in general, so L[xₙ] can have several points. (BHV, Definition F.2.1 and Propositions F.2.2–F.2.4, PDF p. 438)

G a topological group for the definition; G as in SRU.1 irreducible-weak-containment for the single-coefficient basis and the 'some, equivalently every' clause. The criterion using one sequence of single normalised coefficients assumes G second-countable locally compact; the basic topology and net formulation retain their stated generality.

One proof route is as follows. For intersections of basic neighbourhoods centred at x, combine coefficient lists and compact sets and reduce ε. For the full basis axiom at any point y in such a set, take the finitely many approximating vectors witnessing membership, keep the positive error slack, and approximate their coefficients at a nearby representation. The triangle inequality yields a basic neighbourhood of y contained in the original set (BHV Definition F.2.1). Net characterisation: membership of y in W(x, …) is an approximation of finitely many coefficients of x by sums of coefficients of y; along a net this is weak containment in the Hilbert sum over any subnet (BHV Proposition F.2.2). Single coefficients: by irreducible-weak-containment, if x is approximated by sums of coefficients of a net it is approximated by single normalised coefficients (BHV Proposition F.2.4). For the sequence criterion assume G second countable and locally compact. A nonzero vector in an irreducible representation is cyclic. Approximate any other vector by a finite linear combination of its translates; the same combination of the per-index approximating vectors controls its coefficient on enlarged compact sets. Renormalise and diagonalise over a compact exhaustion with errors tending to zero. This preserves the index n and proves some ⇒ every and convergence. Weak containment in the sum over the entire sequence alone proves only membership in its closure, not convergence. supp π is closed: if x is in its closure, approximations of coefficients of x by sums of coefficients of points of supp π, themselves approximated by coefficients of π, compose.

The defining object has the following API.

- The Fell topology on the unitary dual G, TopologicalSpace.generateFrom of the sets W(x, φs, Q, ε).
- For G as in SRU.1, s ∈ 𝓝 x iff s contains some W̃(x, φs, Q, ε) defined with single normalised coefficients.
- A net y → x iff rep x ≺ the Hilbert sum over every subnet (BHV Proposition F.2.2).
- For G second-countable locally compact, a sequence xₙ → x iff for some (equivalently every) unit v there are unit vₙ with c (rep xₙ) vₙ → c (rep x) v uniformly on compacta.
- L[x] := {y | Tendsto x atTop (𝓝 y)} for a sequence x : ℕ → the unitary dual G.
- C[x] := {y | ∃ φ strictly monotone, Tendsto (x ∘ φ) atTop (𝓝 y)}; limit points ⊆ cluster points.
- x is isolated iff {x} is open.
- For a family (πᵢ) of representations: σ lies in the Fell closure of {[πᵢ]} iff every basic neighbourhood W(σ, φ₁…φₙ, Q, ε) built from coefficients of σ contains some [πᵢ]; this is the set-closure formulation of Proposition 11.6.
- σ is isolated relative to a family (πᵢ) iff some basic neighbourhood of σ contains only members unitarily equivalent to σ.
- supp π := {x | rep x ≺ π}, a closed subset of the unitary dual G.
- For G locally profinite and f ∈ C_c^∞(G), {x | (rep x)(f) ≠ 0} is open: if π(f)v ≠ 0 for a smooth unit v, ‖π(f)v‖² is a finite combination of values of c(π,v), which nearby points approximate.
- For G finite with the discrete topology, the Fell topology is discrete.

**Checks.**

- For G = ℤ/3 every point of the unitary dual G is isolated.
- For G = ℤ, the bijection between the unitary dual G and the circle (unit-modulus characters n ↦ zⁿ) is a homeomorphism for the Fell topology and the usual topology of the circle, as for the compact-open topology on PontryaginDual ℤ (BHV Example F.2.5(i)).
- In the discrete dual of C₂, the alternating sequence of the trivial and sign characters has no limit point and has both characters as cluster points, while a constant sequence has its character as its only limit point and only cluster point; a definition of cluster points that did not pass to subsequences would make the two sets equal.
- For SL₂(ℚ_p) the Fell topology is not Hausdorff: a sequence of complementary-series representations has both 1 and St as limit points.

For G finite (discrete and compact) the Fell topology on Ĝ is discrete (BHV Example F.2.5(ii)). For SL₂ or PGL₂ over a p-adic field, the end of the spherical complementary series converges to both the trivial and the Steinberg representation, so L[xₙ] has two points and Ĝ is not Hausdorff (see SRU.4 steinberg-isolated, rank-one non-example).

Additional inputs for this route: GS23, §11.1, limit and cluster points, pp. 31.

*Needs:* SRU.0 / unitary-dual; SRU.1 / weak-containment; SRU.1 / irreducible-weak-containment; Mathlib `TopologicalSpace.generateFrom`.

### 1.8 Weak containment of sums and Fell closure (*weak-containment-sum-closure*)

Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. For subsets S, T ⊆ Ĝ, the Hilbert sum `⊕_(x∈S)` rep x is weakly contained in `⊕_(y∈T)` rep y iff S ⊆ closure T in the Fell topology; in particular the two sums are weakly equivalent iff closure S = closure T (BHV Exercise F.6.4). Weak containment ignores multiplicities: ⊕̂ᵢ πᵢ ∼ `⊕_(y ∈ T)` rep y for T the set of classes of the πᵢ. (BHV, Exercise F.6.4, PDF p. 455)

G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use.

One proof route is as follows. (⇐) If x ∈ closure T, every basic neighbourhood W(x, φ, Q, ε) meets T, so each coefficient of rep x is approximated by sums of coefficients of a single summand of ⊕_T; hence rep x ≺ ⊕_T, and the Hilbert-sum criterion of SRU.1.1 gives ⊕_S ≺ ⊕_T. (⇒) For x ∈ S, rep x ≺ ⊕_T with rep x irreducible; irreducible-weak-containment (family form) approximates each normalised coefficient of rep x by a normalised coefficient of a single rep y, y ∈ T; so every basic neighbourhood of x meets T. Multiplicities: a coefficient of a finitely supported vector of ⊕̂ᵢ πᵢ is a sum of coefficients of the πᵢ, each of which is a coefficient of rep [πᵢ] by unitary equivalence; conversely each rep y, y ∈ T, is a summand.

With S = T the statement is reflexivity; with T = ∅ it says only S = ∅ is weakly contained in the zero representation. For G = ℤ and T the set of characters n ↦ `e^(inθ)` with θ/2π rational, closure T is the whole circle, so the trivial representation, indeed every character, is weakly contained in ⊕_T.

Additional inputs for this route: GS23, §11.2, Proposition 11.6, p. 33, as corrected.

*Needs:* SRU.1 / irreducible-weak-containment; SRU.1 / fell-topology; SRU.1 / weak-containment; SRU.0 / hilbert-direct-sum.

### 1.9 Gan–Savin Proposition 11.6, corrected (*gan-savin-closure*)

Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. Let `(πᵢ)_(i ∈ ι)` be topologically irreducible strongly continuous unitary representations, π = ⊕̂ᵢ πᵢ, and σ a topologically irreducible strongly continuous unitary representation with σ ≺ π. Then [σ] lies in the Fell closure of {[πᵢ] : i ∈ ι}. No convergence of a subsequence with increasing original indices is asserted: for G = G₂(ℚ₅), π₁ = σ = St_G and πₙ = 1_G for n ≥ 2, σ ≺ π while every increasing subsequence is eventually 1_G, which does not converge to the isolated point [St_G] (Proposition 11.3, SRU.4). (GS23, Proposition 11.6, PDF p. 33)

G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. ι arbitrary (Gan–Savin take ι = ℕ).

One proof route is as follows. Apply weak-containment-sum-closure with S = {[σ]} and T = {[πᵢ]}, using that π is weakly equivalent to `⊕_(y ∈ T)` rep y. Gan–Savin's proof (weak-* compactness of the closed convex hull of normalised coefficients in L^∞(G), extremality by BHV Theorem C.5.2, the Krein–Milman converse and K-bi-invariance) is the argument of irreducible-weak-containment; it produces approximating coefficients from the set of summands, not along an increasing subsequence.

The counterexample to the printed subsequence form: G = G₂(ℚ₅), π₁ = St_G, πₙ = 1_G (n ≥ 2); σ = St_G ≺ π trivially, [St_G] ∈ closure {[πᵢ]} because it is [π₁], and no increasing subsequence converges to [St_G]. If the [πᵢ] are pairwise distinct and [σ] is not among them, the conclusion still produces a net of distinct [πᵢ] converging to [σ].

Additional inputs for this route: BHV, Exercise F.6.4.

*Needs:* SRU.1 / weak-containment-sum-closure; SRU.1 / irreducible-weak-containment.

### 1.10 Isolated representations weakly contained in a sum are summands (*gan-savin-isolated-summand*)

In the setting of gan-savin-closure, if moreover [σ] is isolated in Ĝ, or more generally isolated in a subset R ⊆ Ĝ with the induced Fell topology such that R contains [σ] and every [πᵢ], then σ is unitarily equivalent to πᵢ for some i (Gan–Savin Corollary 11.7; the relative form is the one Gan–Ichino use, with R the generic unitary representations of Mp_2n(F_S) with exponents bounded by c < ½). In particular, for G = G₁ × ⋯ × G_m × C with each Gⱼ a reductive p-adic group and C compact, an irreducible σ = σ₁ ⊗ ⋯ ⊗ σ_m ⊗ σ_C whose p-adic factors are isolated in the unitary duals of the Gⱼ and that is weakly contained in a Hilbert sum of irreducibles is one of the summands. (GS23, Corollary 11.7, PDF p. 33)

Setting of gan-savin-closure; [σ] isolated. For the product statement: isolation of [σ] in Ĝ follows from isolation of each [σⱼ] in Ĝⱼ and discreteness of Ĉ, via the product description of the unitary dual of a product with a compact factor (each irreducible of G × C is an outer tensor product with a finite-dimensional irreducible of C).

One proof route is as follows. {[σ]} is open and meets closure {[πᵢ]} (gan-savin-closure), hence meets {[πᵢ]}: [σ] = [πᵢ] for some i, so σ ≃ᵤ πᵢ ([π] = [ρ] iff π ≃ᵤ ρ, SRU.0.6). Relative form: {[σ]} is open in R and meets closure {[πᵢ]} ∩ R, the closure of {[πᵢ]} in R, hence meets {[πᵢ]}. For a compact factor C, its finite-dimensional irreducible τ-isotypic projector (NoncompactQuantumSymmetry M0) gives an open condition near σ⊗τ. Compactness and Schur identify the τ-isotypic part with a Hilbert multiplicity space tensored with τ, and the commuting G-action acts on that space. Test finitely many coefficients on a basis of τ to transfer isolation from G to G×C. For several reductive factors also use the type-I tensor-product and Fell-topology compatibility; this requires the precise product-dual theorem, recorded as the supplier contract. Discreteness of Ĉ alone does not prove a product homeomorphism.

Without isolation the statement fails: the trivial representation of ℤ is weakly contained in the Hilbert sum of the characters n ↦ `e^(inθ)`, θ ≠ 0 rational multiples of 2π, without being one of them.

Additional inputs for this route: GI18, Appendix A.1, Proposition A.2 and its proof, arXiv v3 pp. 29–31.

*Needs:* SRU.1 / gan-savin-closure; SRU.1 / fell-topology; SRU.0 / unitary-dual; NoncompactQuantumSymmetry M0a and finite-product Fell-dual contract.

### Examples

For ℤ, the normalized interval vector supported on [−N,N] has coefficient max(0,1−|k|/(2N+1)) at k. At k = 1 the values are 2N/(2N+1), tending to 1, though there is no nonzero invariant vector in ℓ²(ℤ). For G₂(ℚ₅), a family with St once and 1 at every subsequent index contains St weakly in its sum; an increasing-index subsequence is eventually 1 and cannot converge to the isolated St. For a relative isolated point x in R, an open U with U ∩ R = {x} must meet any subset of R whose ambient closure contains x.

### Dependencies

The statement carriers and the proposed proof inputs are the individual Needs lines above. This layer consumes SRU.0. Integrated GNS and L¹/L∞ duality enter compactness and Raikov; they are not required to define coefficient weak containment.

## Layer SRU.2: Unitary structures on smooth representations

### 2.1 Unitary structures on smooth representations (*unitary-structure*)

Let G be locally profinite and (ρ, V) a smooth complex representation (SR.0). A unitary structure on V is a positive-definite hermitian form on V (an InnerProductSpace.Core ℂ V, conjugate-linear in the first variable) that is G-invariant: ⟪ρ g v, ρ g w⟫ = ⟪v, w⟫. V is not assumed complete ([Ber92] Definition 27). ρ is unitarizable, unitarizability of ρ, when a unitary structure exists. Subrepresentations and finite direct sums of unitarizable representations are unitarizable; twisting by a unitary smooth character preserves unitarizability; an irreducible unitarizable representation has a unitary central character ([Ber92] Proposition 40); for admissible unitarizable V the form gives a G-isomorphism from V onto the complex conjugate of the smooth dual Ṽ ([Ber92] Ch. IV §1.1, Remark 2; [Cas95] after Proposition 2.1.11). (Ber92, Definition 27, PDF p. 83, and Proposition 40, PDF p. 85)

G locally profinite; V a smooth complex representation; no topology on V is used. For the central-character and contragredient statements: G countable at infinity (σ-compact), as Schur's lemma for countable coset spaces (SmoothRepresentationsOfLocalGroups SR.3a.1) requires, or V admissible.

One proof route is as follows. Define unitarizability ρ :⇔ ∃ c : InnerProductSpace.Core ℂ V, ∀ g v w, c.inner (ρ g v) (ρ g w) = c.inner v w. The form is data on V, not an InnerProductSpace instance, because a given V can carry many (Tau Ceti's CompactGroups README makes the same choice for averaged forms). Subrepresentations restrict the form; finite direct sums take the orthogonal sum; |χ| = 1 gives invariance of the same form for ρ ⊗ χ. Central character: for z central and v ≠ 0 in an irreducible V, ρ(z)v = ω(z)v (Schur's lemma for countable coset spaces, SmoothRepresentationsOfLocalGroups SR.3a.1), and invariance gives |ω(z)|² ⟪v, v⟫ = ⟪v, v⟫. The map v ↦ ⟪v, ·⟫ is a conjugate-linear G-map V → Ṽ (smooth because v is fixed by a compact open subgroup); for admissible V it is onto Ṽ by finite dimensionality of each V^K (SR.0 smooth-dual (3)).

The defining object has the following API.

- ∃ c : InnerProductSpace.Core ℂ V, ∀ g v w, c.inner (ρ g v) (ρ g w) = c.inner v w.
- A subrepresentation of a unitarizable representation is unitarizable.
- Finite direct sums of unitarizable representations are unitarizable.
- For a smooth character χ with |χ g| = 1 for all g, if ρ is unitarizable then so is the twist ρ ⊗ χ.
- If ρ is irreducible and unitarizable then its central character takes values of modulus one.
- For admissible unitarizable ρ, the form induces a conjugate-linear G-isomorphism V ≃ Ṽ.
- The trivial representation on ℂ is unitarizable.

**Checks.**

- For G = ℚ_p^× and the unramified character χ(x) = `(−1)^(v_p(x))`, the representation on ℂ is unitarizable.
- For G = ℚ_p^× and χ = |·|_p, the representation on ℂ is smooth but not unitarizable: ‖χ(p)v‖ = p⁻¹‖v‖ for every inner product.
- For G = ℤ (discrete) acting on ℂ² by n ↦ [[1, n], [0, 1]], the representation is smooth and not unitarizable, since a unitary operator is diagonalizable.
- The zero representation is unitarizable.

Every unitary character χ : G → S¹ with open kernel is unitarizable on ℂ. For G = F^× and χ = |·|, the smooth character χ is not unitarizable, since its values are not of modulus one.

Additional inputs for this route: GS23, §11, opening paragraph, p. 31; Cas95, §2.1, Proposition 2.1.5 and the paragraph after Proposition 2.1.11, pp. 20–22.

*Needs:* SmoothRepresentationsOfLocalGroups SR.0 abelian-category / is-smooth; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / smooth-dual; SmoothRepresentationsOfLocalGroups SR.3a.1, Schur's lemma for countable coset spaces; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / smooth-character; Mathlib `InnerProductSpace.Core`.

### 2.2 Uniqueness of the unitary structure (*unitary-structure-unique*)

Let G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. If V is an irreducible admissible representation of G (every irreducible is admissible, SR.3a), any two G-invariant positive-definite hermitian forms on V are proportional by a positive real constant ([Ber92] Ch. IV §1.1, Lemma 38; [Cas95] Proposition 2.1.15). (Ber92, Lemma 38, PDF p. 84)

G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. V irreducible smooth (hence admissible).

One proof route is as follows. A G-invariant hermitian form is a G-map from V to the conjugate-linear dual, landing in its smooth part, the complex conjugate of Ṽ. Ṽ is irreducible and admissible for irreducible admissible V (SR.3a admissibility-of-irreducibles), so Hom_G(V, conj Ṽ) is at most one-dimensional by Schur's lemma. Two positive forms differ by a nonzero scalar, real and positive since both are positive on any nonzero vector.

For a reducible unitarizable V = W ⊕ W with W irreducible, the forms ⟪·,·⟫ ⊕ 2⟪·,·⟫ and ⟪·,·⟫ ⊕ ⟪·,·⟫ are not proportional, so irreducibility is needed.

Additional inputs for this route: Cas95, §2.1, Proposition 2.1.15, p. 23.

*Needs:* SRU.2 / unitary-structure; SmoothRepresentationsOfLocalGroups SR.3a / admissibility-of-irreducibles; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / smooth-dual.

### 2.3 Admissible unitarizable representations are semisimple (*admissible-unitary-semisimple*)

Let G be locally profinite and (ρ, V) admissible with a unitary structure. For every subrepresentation U ⊆ V the orthogonal complement U^⊥ is a subrepresentation and V = U ⊕ U^⊥ ([Cas95] Proposition 2.1.5). Consequently V is a direct sum of irreducible admissible unitarizable representations, each isomorphism class with finite multiplicity, countably many if G is second countable ([Cas95] Proposition 2.1.14; [Ber92] Proposition 41). In particular an admissible unitarizable representation of finite length is a finite direct sum of irreducibles. (Ber92, Proposition 41, PDF p. 86)

G locally profinite; V admissible and unitarizable.

One proof route is as follows. U^⊥ is G-stable by invariance of the form; U ∩ U^⊥ = 0 by positivity. U + U^⊥ = V: it suffices to check on V^K for every compact open K; V^K is finite-dimensional, e_K preserves both U and U^⊥ (it is self-adjoint for the form), and the finite-dimensional orthogonal decomposition of V^K gives U^K + (U^⊥)^K = V^K ([Ber92] Proposition 41, proof). Decomposition: the subrepresentation generated by V^K is finitely generated, has an irreducible quotient, which splits off by the first part; induction on dim V^K and Zorn's lemma over K give the direct sum ([Cas95] Proposition 2.1.14, proof).

For the non-unitarizable principal series i_B(`δ_B^(1/2)`) of GL₂(ℚ_p), which has the trivial representation as a quotient and the Steinberg representation as a subrepresentation, the extension is non-split; so the theorem fails without a unitary structure.

Additional inputs for this route: Cas95, §2.1, Propositions 2.1.5 and 2.1.14 with proof, pp. 20–23.

*Needs:* SRU.2 / unitary-structure; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / admissible; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / averaging-projector.

### 2.4 Normalised parabolic induction preserves unitarity (*unitary-induction*)

Let G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. Let P = MN be a parabolic subgroup and σ a unitarizable smooth representation of M. Then the normalised induction i_P^G σ (SR.2) is unitarizable: ⟪f, f'⟫ := ∫_K ⟪f(k), f'(k)⟫_σ dk for a maximal compact K with G = PK and the Haar probability measure of K, which is G-invariant because of the `δ_P^(1/2)` normalisation ([Ber92] Proposition 38). If σ is moreover admissible of finite length, i_P^G σ is a finite direct sum of irreducible unitarizable representations; in particular unitary principal series i_B(χ) with |χ| = 1 are semisimple. (Ber92, Proposition 38, PDF p. 84)

G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. σ unitarizable; for the semisimplicity statement σ admissible of finite length.

One proof route is as follows. Elements of i_P σ are functions f(pg) = `δ_P^(1/2)(p)`σ(p)f(g); the function g ↦ ⟪f(g), f'(g)⟫ transforms by δ_P on the left, i.e. is a density on PG, whose integral over the compact PG is G-invariant; for a special maximal compact K and a minimal parabolic Q ⊆ P the Iwasawa decomposition G = QK (ReductiveGroupsPartII RG2.4) gives G = PK and writes this integral over K ([Ber92] Proposition 38, proof). Positivity: a nonzero f is nonzero on an open subset of K. Finite length of i_P σ (SR.3 finite-length) and admissible-unitary-semisimple give the semisimplicity.

The unramified unitary principal series i_B(χ) of PGL₂(ℚ_p) with χ(diag(a, 1)) = `|a|^(it)`, t real, is unitarizable. Without normalisation the induced form fails: unnormalised Ind_B^G(1) of GL₂(ℚ_p) contains the trivial representation with a non-split quotient, so it is not unitarizable.

Additional inputs for this route: CH26, §6, before (6.2), p. 17.

*Needs:* SRU.2 / unitary-structure; SRU.2 / admissible-unitary-semisimple; SmoothRepresentationsOfLocalGroups SR.2 / parabolic-induction; SmoothRepresentationsOfLocalGroups SR.2 / modulus-character; SmoothRepresentationsOfLocalGroups SR.3 / finite-length; ReductiveGroupsPartII RG2.4 / iwasawa-decomposition.

### 2.5 Hilbert completion of a unitarizable representation (*hilbert-completion*)

Let G be locally profinite and (ρ, V) smooth with a unitary structure. Its Hilbert completion Ĥ(V) (Mathlib's UniformSpace.Completion with the completed inner product) carries a unique strongly continuous unitary representation ρ̂ extending ρ. V ⊆ Ĥ(V)^∞, with equality Ĥ(V)^K = V^K for every compact open K when V is admissible; then Ĥ(V)^∞ = V. If V is irreducible and admissible, ρ̂ is topologically irreducible. Isomorphic irreducible unitarizable admissible representations have unitarily equivalent completions after rescaling the forms (unitary-structure-unique). (Cas95, §2.1, Propositions 2.1.5 and 2.1.14–2.1.15, pp. 20–23)

G locally profinite; V smooth with a unitary structure; admissibility for the statements about smooth vectors and irreducibility.

One proof route is as follows. Each ρ(g) is isometric on V, hence extends to a linear isometry of the completion; these form a ContRepresentation, unitary because the inverses extend too. Strong continuity: g ↦ ρ(g)v is locally constant for v ∈ V; density of V and the uniform bound ‖ρ̂(g)‖ ≤ 1 give continuity on Ĥ(V). Smooth vectors: the projection e_K of Ĥ(V) (smooth-vectors-unitary) maps V onto V^K, so Ĥ(V)^K = e_K Ĥ(V) is the closure of V^K, which equals V^K when finite-dimensional; hence Ĥ(V)^∞ = ⋃ V^K = V. Irreducibility: for a closed invariant W, W^∞ = ⋃_K e_K W ⊆ V is a subrepresentation, so W^∞ = 0 or V; W^∞ is dense in W (smooth-vectors-unitary), so W = 0 or Ĥ(V) (Cas95 §2.1).

The defining object has the following API.

- Given a unitary structure c on V, the Hilbert space UniformSpace.Completion V with the completed inner product.
- The strongly continuous unitary representation of G on the completion extending ρ.
- the completed action g (v : completion) = (ρ g v : completion) for v ∈ V.
- For admissible V, the smooth vectors of the completed action are exactly the image of V.
- For irreducible admissible V, the completed action is topologically irreducible.
- A G-isometry V → H into a strongly continuous unitary representation with dense image extends uniquely to a unitary equivalence from the completion.

**Checks.**

- For finite-dimensional V with a unitary structure, the completion map V → Ĥ(V) is a linear isometric equivalence intertwining ρ and ρ̂.
- For G = ℤ (discrete) and V the finitely supported functions with the ℓ² form, the completion is ℓ²(ℤ) with the regular representation.
- For G = ℤ_p acting on V = ⊕_n ℂχ_n (χ_n of conductor pⁿ, each with multiplicity one), V is admissible and Ĥ(V)^∞ = V; for V' = ⊕_n ℂ (trivial, infinitely many copies), V' is not admissible and Ĥ(V')^∞ = Ĥ(V') ≠ V'.

For V finite-dimensional unitarizable, Ĥ(V) = V and ρ̂ = ρ. For the left regular representation of a discrete group on finitely supported functions, the completion is ℓ²(G).

Additional inputs for this route: GS23, §11, opening paragraph, p. 31.

*Needs:* SRU.2 / unitary-structure; SRU.2 / unitary-structure-unique; SRU.0 / strongly-continuous-unitary; SRU.0 / smooth-vectors-unitary; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / admissible; Mathlib `UniformSpace.Completion`; Mathlib `UniformSpace.Completion.innerProductSpace`.

### 2.6 Irreducible unitary representations are admissible (*unitary-irreducibles-admissible*)

Let G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. Let (π, H) be a topologically irreducible strongly continuous unitary representation of G. Then the smooth vectors H^∞ form an admissible representation, irreducible as a smooth representation, and π is unitarily equivalent to the Hilbert completion of H^∞ (Ber74; Gan–Savin §11, opening paragraph). Two such representations are unitarily equivalent iff their smooth parts are isomorphic (the same smooth-vector comparison). (GS23, §11, opening paragraph, PDF p. 30)

G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients.

One proof route is as follows. At each compact open level, apply smooth uniform admissibility to the dense Hecke corner. Use the polynomial-identity supplier contract to pass the same bound to the irreducible Hilbert corner H^K. Density of smooth vectors then proves admissibility and smooth irreducibility. The completion comparison of SRU.2.5 and uniqueness of forms identify the original Hilbert representation.

For G compact the theorem says irreducible unitary representations are finite-dimensional, as in Peter–Weyl. For a discrete group that is not virtually abelian, irreducible unitary representations need not have finite-dimensional K-fixed spaces (K = {e}); reductivity of G is used through uniform admissibility.

*Needs:* SRU.2 / hilbert-completion; SRU.2 / unitary-structure-unique; SRU.0 / smooth-vectors-unitary; SmoothRepresentationsOfLocalGroups SR.3a / uniform-admissibility; SmoothRepresentationsOfLocalGroups SR.1 / hecke-module-equivalence; CStarAlgebras C2, polynomial-identity contract.

### 2.7 The unitary dual as unitarizable smooth representations (*unitary-dual-smooth*)

Let G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. The maps [π] ↦ (π^∞ = H^∞) and V ↦ [completion of V] are inverse bijections between the unitary dual Ĝ (SRU.0) and the set of isomorphism classes of irreducible unitarizable smooth representations of G. Under this bijection the positive-type coefficient of a smooth unit vector v is g ↦ ⟪v, ρ(g)v⟫ computed in V; the Fell topology (SRU.1) is described by such coefficients of smooth vectors; and the trivial and Steinberg (SR.3.4) representations, the irreducible square-integrable representations and the irreducible constituents of unitarily induced admissible finite-length representations define points of Ĝ. A unitarily induced representation need not itself be irreducible: for G = P = F^× and σ = 1 ⊕ 1 the induction is σ, whose single constituent class [1] occurs twice. (GS23, §11, opening paragraph, PDF p. 30)

G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients.

One proof route is as follows. Well defined: unitary-irreducibles-admissible gives irreducible admissible π^∞, unitarizable by restriction of the inner product; hilbert-completion gives a topologically irreducible completion. The two composites are the identity up to isomorphism (unitary-irreducibles-admissible, last clause; hilbert-completion, smooth vectors). Coefficients of smooth vectors suffice for the Fell topology by density of smooth vectors and the estimate of SRU.0.4. Square-integrable irreducible representations are unitarizable (SR.3.3 square-integrable-tempered), in particular the Steinberg representation of a split group (SR.3.4 steinberg); unitary induction and the semisimplicity of SRU.2.3 give the irreducible constituents of unitary inductions, in particular the tempered representations (unitary-induction).

For G = F^× the bijection identifies Ĝ with the unitary smooth characters of F^×. The Steinberg representation of GL₂(ℚ_p), being square-integrable modulo a unitary central character, defines a point of the unitary dual of PGL₂(ℚ_p).

*Needs:* SRU.2 / unitary-irreducibles-admissible; SRU.2 / hilbert-completion; SRU.2 / unitary-induction; SRU.0 / unitary-dual; SRU.1 / fell-topology; SmoothRepresentationsOfLocalGroups SR.3 / square-integrable-tempered; SmoothRepresentationsOfLocalGroups SR.3 / steinberg.

### Examples

The one-dimensional character |·| of F^× sends ϖ to q⁻¹, so an invariant positive norm would require q⁻²‖v‖² = ‖v‖²; this fails for nonzero v. The unipotent action of ℤ on ℂ² sends (0,1) to (n,1), of squared norm n²+1 in the standard form, and no invariant positive form makes it unitary. A direct sum of trivial characters has completion ℓ², whose whole space is smooth; admissibility is what makes smooth vectors commute with completion.

### Dependencies

The statement carriers and the proposed proof inputs are the individual Needs lines above. This layer consumes SRU.0; SRU.1. The polynomial-identity contract is used only for irreducible Hilbert admissibility.

## Layer SRU.3: Limits of characters and representations

### 3.1 Weak convergence of distribution characters (*character-weak-convergence*)

Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. For an admissible representation π of finite length, Θ_π(f) = tr π(f), f ∈ C_c^∞(G), is its distribution character (π(f) = ∫ f(g)π(g) dg has finite rank; EndoscopicTransferAndUnitaryTraceComparison §2.16). A sequence (πₙ) of admissible finite-length representations has weakly convergent characters when `Θ_(πₙ)(f)` converges for every f ∈ C_c^∞(G); the limit Θ := lim `Θ_(πₙ)` is a linear functional on C_c^∞(G), invariant under conjugation. Gan–Savin write C_c(G) for the test space; for a p-adic group the space on which characters are defined is C_c^∞(G) of locally constant compactly supported functions, the reading used here. Characters are additive in short exact sequences, so Θ factors through the Grothendieck group of finite-length representations. (GS23, §11.1, definition of weak convergence, PDF p. 31)

G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G.

One proof route is as follows. π(f) = e_K π(f) e_K for K with f K-bi-invariant, and π(f) acts on the finite-dimensional V^K ([Cas95] §2.3). Additivity: for 0 → V' → V → V'' → 0 admissible, π(f) is block triangular on V^K = V'^K ⊕ V''^K (exactness of K-invariants, SR.0 invariants-exact), so traces add. Conjugation invariance: tr π(f ∘ Ad g) = tr(π(g)⁻¹π(f)π(g)).

The defining object has the following API.

- weak convergence of characters π Θ :⇔ ∀ f ∈ C_c^∞(G), Tendsto (fun n ↦ `Θ_(π n)` f) atTop (𝓝 (Θ f)).
- Limits add along direct sums and pass to finite linear combinations.
- A limit Θ satisfies Θ (f ∘ Ad g) = Θ f.
- If the characters of σₙ converge to Θ_σ on a Levi M then those of i_P σₙ converge to `Θ_(i_P σ)` (van Dijk's formula; the induced-character continuity contract on EndoscopicTransferAndUnitaryTraceComparison §2.16).

**Checks.**

- A constant sequence πₙ = π has weakly convergent characters with limit Θ_π.
- For G = ℚ_p^× and χₙ = `|·|^(i tₙ)` with tₙ → t, `Θ_(χₙ)(f)` = ∫ f χₙ converges to `Θ_(|·|^(it))(f)`.
- For G = ℚ_p^× and characters χₙ of conductor exponent n, `Θ_(χₙ)(f)` = 0 for n large for each fixed f, so the limit is 0: a weak limit of characters of irreducibles need not be the character of an irreducible.

Constant sequences converge weakly. If `Θ_(πₙ)` → Θ and `Θ_(π'ₙ)` → Θ' then `Θ_(πₙ ⊕ π'ₙ)` → Θ + Θ'.

Additional inputs for this route: Cas95, §2.3, definition of the distribution character, p. 25.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §2.16; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / invariants-exact; SmoothRepresentationsOfLocalGroups SR.3a / admissibility-of-irreducibles; EndoscopicTransferAndUnitaryTraceComparison §2.16, induced-character continuity contract.

### 3.2 Linear independence of characters (*characters-linearly-independent*)

Let G be locally profinite and π₁, …, πₙ pairwise non-isomorphic irreducible admissible complex representations. Then `Θ_(π₁)`, …, `Θ_(πₙ)` are linearly independent functionals on C_c^∞(G) ([Cas95] Proposition 2.3.1). Consequently an admissible finite-length representation is determined up to semisimplification by its character, and a finite sum Σ n_σ Θ_σ with distinct σ determines the multiplicities n_σ. (Cas95, Proposition 2.3.1, PDF p. 25)

G locally profinite; representations irreducible admissible and pairwise non-isomorphic.

One proof route is as follows. Choose a compact open K with every πᵢ^K ≠ 0; each πᵢ^K is a simple H(G, K)-module and they are pairwise non-isomorphic (SR.1 corner-irreducibles). By the density theorem the map H(G, K) → ∏ᵢ End(πᵢ^K) is onto, so there are fⱼ ∈ H(G, K) with tr πᵢ(fⱼ) = δᵢⱼ ([Cas95] Proposition 2.3.1, citing Jacquet–Langlands Lemma 7.1). Semisimplification: by Jordan–Hölder and additivity Θ_V = Σ m_σ Θ_σ over the irreducible constituents, and linear independence recovers the m_σ.

For GL₂(ℚ_p), the reducible principal series i_B(`δ_B^(1/2)`) and 1 ⊕ St have the same character, though they are not isomorphic. The trivial and Steinberg characters of GL₂(ℚ_p) are linearly independent.

*Needs:* SRU.3 / character-weak-convergence; SmoothRepresentationsOfLocalGroups SR.1 / corner-irreducibles; SmoothRepresentationsOfLocalGroups SR.1 / hecke-module-equivalence.

### 3.3 Miličić's theorem on limits of unitary characters (*milicic-limits*)

Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. Let (πₙ) be irreducible unitarizable representations whose characters converge weakly. Then there are a finite set S of irreducible unitarizable representations and integers n_σ > 0 with lim `Θ_(πₙ)(f)` = `Σ_(σ∈S)` n_σ Θ_σ(f) for all f ∈ C_c^∞(G), and S = L[πₙ] = C[πₙ] in the Fell topology (Gan–Savin Theorem 11.1; Mi73, Theorem 5). In particular, under weak convergence of characters, limit points and cluster points coincide and form a finite set. (GS23, Theorem 11.1, PDF p. 31)

G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. πₙ irreducible unitarizable, with weakly convergent characters.

One proof route is as follows. Use the bounded-trace supplier theorem after the group C*-algebra and character identifications. Finite-level uniform bounds control the trace of each fixed Hecke test. Character independence determines the positive integer multiplicities. A zero limiting functional has empty support and empty limit and cluster sets.

For a constant sequence πₙ = σ, S = {σ}, n_σ = 1 and L = C = {[σ]}. For SL₂(ℚ_p) and complementary series πₙ converging to the endpoint, lim `Θ_(πₙ)` = Θ_1 + Θ_St, so S = {1, St} = L[πₙ]: the limit set has two points, reflecting that the unitary dual is not Hausdorff.

*Needs:* SRU.3 / character-weak-convergence; SRU.3 / characters-linearly-independent; SRU.1 / fell-topology; SRU.2 / unitary-dual-smooth; SmoothRepresentationsOfLocalGroups SR.3a / uniform-admissibility; CStarAlgebras C2, bounded-trace contract.

### 3.4 Tadić: compactness of tempered characters and continuity of supports (*tadic-tempered-limits*)

For G reductive over a characteristic-zero nonarchimedean local field, every sequence of irreducible tempered representations of a Levi M has a subsequence whose distribution characters converge to that of an admissible finite-length tempered representation, which may be zero. If the limit is nonzero, the subsequence converges in Bernstein cuspidal-support coordinates to the support shared by its constituents; at any nonzero limit this is interpreted in its eventual Bernstein component. No support is assigned to the zero representation. At a fixed compact-open level, uniform admissibility supplies the finite-rank bounds used for extraction. (GS23, proof of Proposition 11.2, PDF p. 31)

G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. τₙ irreducible tempered; unitary central characters.

One proof route is as follows. Diagonal extraction over a countable system of compact-open Hecke corners gives a weakly convergent character subsequence, allowing zero. Uniform admissibility bounds each corner. For a nonzero limit, apply SRU.3.3 and continuity of the Bernstein center at each constituent; separation by a component idempotent puts the subsequence in that component. No convergence of support is claimed for escape to the zero distribution.

For M = T a split torus, the τₙ are unitary characters; the theorem reduces to compactness of the unitary unramified characters together with finiteness of characters of T ∩ K of bounded conductor at fixed level. Without temperedness the conclusion fails: `|·|^(n)` on ℚ_p^× has no weakly convergent subsequence of characters. On F^×, unitary characters of conductor n have distribution characters eventually zero on each fixed test function; the limit representation is 0 and has no cuspidal support.

*Needs:* SRU.3 / character-weak-convergence; SmoothRepresentationsOfLocalGroups SR.3; SmoothRepresentationsOfLocalGroups SR.3 / cuspidal-support; SmoothRepresentationsOfLocalGroups SR.3 / unramified-characters; SmoothRepresentationsOfLocalGroups SR.3 / bernstein-components; SmoothRepresentationsOfLocalGroups SR.3 / finite-type-corners; SRU.3 / milicic-limits; SRU.3 / fell-convergence-bernstein-centre; CStarAlgebras C2, bounded-trace contract; SmoothRepresentationsOfLocalGroups SR.3.3, tempered-local-topology contract.

### 3.5 Fell convergence implies convergence in the Bernstein centre (*fell-convergence-bernstein-centre*)

Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. If irreducible unitarizable πₙ converge in the Fell topology to an irreducible unitarizable π, then their infinitesimal characters (cuspidal supports in the Bernstein variety Ω(G), SR.3 bernstein-centre-blocks) converge to that of π: for every z in the Bernstein centre, z(πₙ) → z(π), and eventually πₙ lies in the Bernstein component of π. Consequently every irreducible constituent of a weak limit of characters of the πₙ has the cuspidal support of π (Gan–Savin §11.1, citing Tadić [Ta2]). (GS23, proof of Proposition 11.3, PDF p. 32)

G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G.

One proof route is as follows. Fix K with π^K ≠ 0; Fell convergence and K-types (k-types-persist) give πₙ^K ≠ 0 for large n, so the πₙ lie in the finitely many Bernstein components meeting level K (SR.3 finite-type-corners). On the K-corner, the centre of H(G, K) acts on the simple modules πₙ^K by characters; Fell convergence gives convergence of the matrix coefficients ⟪v, πₙ(f)v⟫ for f in the centre of the corner and smooth vectors approximating a K-fixed vector of π, hence of the central characters (Tadić [Ta2]). Regular functions on the Bernstein variety are the centre (SR.3 bernstein-centre-blocks), so convergence of all central characters is convergence in Ω(G).

For G = ℚ_p^×, Fell convergence of unitary characters χₙ → χ means eventually equal restriction to ℤ_p^× and χₙ(p) → χ(p), which is convergence in the Bernstein variety.

*Needs:* SRU.3 / k-types-persist; SRU.1 / fell-topology; SRU.2 / unitary-dual-smooth; SmoothRepresentationsOfLocalGroups SR.3 / bernstein-centre-blocks; SmoothRepresentationsOfLocalGroups SR.3 / finite-type-corners; SmoothRepresentationsOfLocalGroups SR.3 / bernstein-decomposition.

### 3.6 K-types persist in limits (*k-types-persist*)

Let G be locally profinite, K a compact open subgroup and τ a smooth irreducible representation of K. If π is irreducible unitarizable, τ occurs in π|_K, and π is a limit point in Ĝ of irreducible unitarizable πₙ, then τ occurs in πₙ|_K for all but finitely many n (Gan–Savin Lemma 11.4). (GS23, Lemma 11.4, PDF p. 32)

G locally profinite; π, πₙ irreducible unitarizable (points of Ĝ).

One proof route is as follows. Take a unit vector v in the τ-isotypic part of π, so ⟪v, π(e_τ)v⟫ = 1 for the K-type projector e_τ = π(f_τ) (smooth-vectors-unitary; Gan–Savin's f_τ needs the factor dim τ, the dimension factor). By the definition of limit points there are unit vₙ with c πₙ vₙ → c(π,v) uniformly on K; integrating against f_τ gives ⟪vₙ, πₙ(e_τ)vₙ⟫ → 1. Hence πₙ(e_τ) ≠ 0 for large n, i.e. τ occurs in πₙ.

For K-spherical π (τ trivial), every limit of the πₙ that is K-spherical forces the πₙ to be K-spherical eventually. The transfer goes only from the limit to the sequence: spherical complementary series of SL₂(ℚ_p) have SL₂(ℤ_p)-fixed vectors, while their limit point St has none.

*Needs:* SRU.0 / smooth-vectors-unitary; SRU.1 / fell-topology; SRU.0 / positive-type-coefficient.

### 3.7 Rodier's heredity of genericity (*rodier-heredity*)

Let G be quasi-split reductive over F, B = TU a Borel subgroup, ψ a generic character of U (SR.2.3 whittaker-functionals), P = MN a standard parabolic and σ an admissible finite-length representation of M. Then dim Hom_U(i_P σ, ψ) = dim `Hom_(U∩M)(σ, ψ|_(U∩M))` for a compatible choice of ψ; in particular i_P σ is ψ-generic iff σ is. If moreover dim `Hom_(U∩M)(σ, ψ|_(U∩M))` = 1, then i_P σ has exactly one ψ-generic irreducible subquotient, occurring with multiplicity one; this holds for P = B, where U ∩ T = 1 and σ is a character, over every nonarchimedean local field, and for every irreducible generic σ over a field of characteristic zero by the Whittaker multiplicity-one contract. (Rodier73; GS23, proof of Proposition 11.2 and Rodier genericity, PDF p. 31)

G quasi-split; ψ generic, compatible with the Levi M (Shahidi's normalisation of the splitting). For the uniqueness clause with P ≠ B, F of characteristic zero and the Whittaker multiplicity-one contract.

One proof route is as follows. Filter i_P σ by the Bruhat cells PPwB (SR.2 mackey-filtration, geometric-lemma); only the open cell supports ψ-equivariant functionals for generic ψ, giving the dimension formula. Exactness of the twisted Jacquet functor V ↦ `V_(U,ψ)` (SR.2.3, coinvariants of the twist) makes generic multiplicity additive in short exact sequences, so when the dimension formula gives the value one, exactly one constituent carries a ψ-functional, and only once. Heredity itself only equates two dimensions; the value one comes from P = B or from the multiplicity-one contract applied to σ.

For GL₂(ℚ_p), i_B(`δ_B^(1/2)`) has the unique generic constituent St, and the trivial constituent is not generic. For every unitary character χ of T, i_B χ is generic. For P = G = G₂ heredity reads dim Hom_U(σ, ψ) = dim Hom_U(σ, ψ) and bounds nothing; the bound by one is the multiplicity-one contract.

Additional inputs for this route: HO, §1, before Theorem 1.1, p. 2; BC1, §1.2, p. 2.

*Needs:* SmoothRepresentationsOfLocalGroups SR.2 / whittaker-functionals; SmoothRepresentationsOfLocalGroups SR.2 / mackey-filtration; SmoothRepresentationsOfLocalGroups SR.2 / geometric-lemma; SmoothRepresentationsOfLocalGroups SR.2 / parabolic-induction; SmoothRepresentationsOfLocalGroups SR.2.3, Whittaker multiplicity-one contract.

### 3.8 Heiermann–Opdam: generic representations are standard modules (*heiermann-opdam-standard-module*)

Let G be quasi-split reductive over a p-adic field F of characteristic zero. Let P = MN be a standard parabolic, τ an irreducible tempered generic representation of M and ν in the open positive chamber `a_M^(*+)` (SR.3.3 langlands-classification, Langlands convention). Then the Langlands quotient J(τ, ν) of the standard module i_P(τ_ν) is generic iff i_P(τ_ν) is irreducible (the standard module conjecture). Consequently every irreducible generic representation of G is isomorphic to an irreducible standard module i_P(τ_ν), with τ tempered generic and ν ∈ `a_M^(*+)`, and its real exponent decomposes as ν = ν_G + `Σ_(α∈Δ∖S)` s_α ϖ_α with every s_α > 0, where ν_G ∈ a_G^* is the central component and the sum, over the simple roots not in M, is the restriction of ν to the derived group (Gan–Savin, proof of Proposition 11.2, where G is split simple and a_G^* = 0). For unitary central character ν_G = 0. For G = F^× and π = |·| one has P = G, the root sum is empty and ν_G is the exponent of |·|, whose value at ϖ is q⁻¹. (HO, Corollary 1.2, PDF p. 3)

F a p-adic field of characteristic zero; G quasi-split; the Langlands classification of SR.3.3 with its Harish–Chandra tempered-support hypothesis.

One proof route is as follows. The Shahidi local coefficient and its holomorphy on the negative chamber (HO Theorem 1.1) are requested by the Shahidi local-coefficient contract, and the implication from that holomorphy to the standard module conjecture (HM07, as used in HO Corollary 1.2) by the Heiermann–Muić contract; together they give the standard module conjecture. If π is irreducible generic, write π = J(τ, ν) by the Langlands classification; i_P(τ_ν) has π as a generic subquotient, so τ is generic (rodier-heredity), and by the standard module conjecture i_P(τ_ν) is irreducible, hence equal to π. The positive-chamber condition says that the derived-group part of ν is `Σ_(α∈Δ∖S)` s_α ϖ_α with s_α > 0, S the simple roots of M; the central component ν_G is not constrained by the chamber.

For GL₂(ℚ_p), the generic representation i_B(`|·|^(1/4)` ⊗ `|·|^(−1/4)`) is an irreducible standard module, while the non-generic trivial representation is the Langlands quotient of the reducible i_B(`δ_B^(1/2)`). For a torus every irreducible representation is a character, the local coefficient is 1 and the standard module is irreducible.

Additional inputs for this route: GS23, §11.1, proof of Proposition 11.2, p. 32.

*Needs:* SRU.3 / rodier-heredity; SmoothRepresentationsOfLocalGroups SR.3 / langlands-classification; SmoothRepresentationsOfLocalGroups SR.3; AutomorphicLFunctionsAndLocalFactors AL.4, Shahidi local-coefficient contract; AutomorphicLFunctionsAndLocalFactors AL.4, Heiermann–Muić contract.

### 3.9 Limits of generic unitary representations (*gan-savin-generic-limits*)

Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G, and 𝐆 split simple. Fix a Whittaker datum (B, ψ). Let δ be ψ-generic unitarizable and (πₙ) ψ-generic unitarizable with δ ∈ L[πₙ]. After passing to a subsequence there are a parabolic P = MN and standard modules i_P(τₙ) with: πₙ ≅ i_P(τₙ) for all n; the characters of τₙ converge weakly to the character of a (possibly reducible) representation τ of M; and δ is a subquotient of i_P(τ). In particular τ is generic for the restriction of ψ to U ∩ M (Gan–Savin Proposition 11.2). (GS23, Proposition 11.2, PDF p. 31)

G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. 𝐆 split simple, as in Gan–Savin; δ, πₙ generic unitarizable.

One proof route is as follows. By heiermann-opdam-standard-module each πₙ ≅ `i_(Pₙ)(τₙ)` with τₙ = τₙ° · χₙ; finitely many standard parabolics, so after a subsequence P is constant. By tadic-tempered-limits a subsequence of τₙ° has weakly convergent characters with limit τ°; unitarity of πₙ bounds the differentials dχₙ, because the coefficients of πₙ are bounded by ‖v‖² while along the negative cone they are asymptotic to combinations of the exponents of the Jacquet modules (SR.2 casselman-pairing), which grow with dχₙ; so a further subsequence has χₙ → χ; put τ = τ° · χ. The characters of i_P(τₙ) converge to that of i_P(τ) (character-weak-convergence, induction); by milicic-limits the limit points of (πₙ) are the constituents of i_P(τ), so δ is a subquotient; δ ψ-generic forces τ generic for the restriction of ψ to U ∩ M (rodier-heredity with the compatible datum).

For PGL₂(ℚ_p) and the generic complementary series πₙ = i_B(`|·|^(sₙ)` ⊗ `|·|^(−sₙ)`) with sₙ → 1/2, the generic limit point is St, a subquotient of i_B(`δ_B^(1/2)`) = lim i_B(τₙ).

*Needs:* SRU.3 / heiermann-opdam-standard-module; SRU.3 / tadic-tempered-limits; SRU.3 / milicic-limits; SRU.3 / character-weak-convergence; SRU.3 / rodier-heredity; SmoothRepresentationsOfLocalGroups SR.2 / casselman-pairing; EndoscopicTransferAndUnitaryTraceComparison §2.16, induced-character continuity contract.

### 3.10 Discrete series are isolated in the tempered dual (*discrete-series-isolated-tempered*)

Let G be a reductive group over a p-adic field F of characteristic zero with compact centre (or work with a fixed unitary central character). Every irreducible square-integrable representation δ (SR.3.3) is an isolated point of the tempered part Ĝ_temp of Ĝ with the induced Fell topology: no sequence of tempered irreducible representations not isomorphic to δ converges to [δ]. (GS23, proof of Proposition 11.3, PDF p. 32)

F of characteristic zero, as in Gan–Savin; G with compact centre, or all representations with a fixed unitary central character.

One proof route is as follows. Use the tempered-dual local-topology supplier contract, not just the algebraic uniqueness of tempered support. With unitary central character fixed, the square-integrable stratum is locally discrete modulo the finite stabilizer of unramified twists; the local topology separates it from proper-Levi inductions.

For PGL₂(ℚ_p) the Steinberg representation is not a limit of unitary principal series i_B(`|·|^(itₙ)` ⊗ `|·|^(−itₙ)`): their limits are unitary principal series, which do not contain St. Isolation holds only in the tempered dual: in the full unitary dual of PGL₂(ℚ_p) the Steinberg representation is a limit of complementary series (SRU.4 steinberg-isolated, rank-one non-example).

*Needs:* SRU.2 / unitary-dual-smooth; SRU.1 / fell-topology; SRU.3 / fell-convergence-bernstein-centre; SmoothRepresentationsOfLocalGroups SR.3; SmoothRepresentationsOfLocalGroups SR.3 / casselman-criterion; SmoothRepresentationsOfLocalGroups SR.3 / square-integrable-tempered; SmoothRepresentationsOfLocalGroups SR.3 / unramified-characters; SmoothRepresentationsOfLocalGroups SR.3.3, tempered-local-topology contract.

### Examples

For conductor-n characters of F^× each fixed locally constant compactly supported test integrates to 0 for n large; the weak limit is 0. For rank-one complementary series approaching reducibility, the limit character is Θ₁ + Θ_St: the two multiplicities are 1 and the two Fell limits coexist. A K-spherical approximating representation has dim V^K = 1 while St has dim St^K = 0; K-types pass from the limit to the sequence, not in the reverse direction.

### Dependencies

The statement carriers and the proposed proof inputs are the individual Needs lines above. This layer consumes SRU.0; SRU.1; SRU.2. The bounded-trace and tempered-local-topology contracts supply the two limit arguments; §2.16 supplies characters, with the induced-character continuity contract.

## Layer SRU.4: Steinberg and supercuspidal isolation

### 4.1 The Steinberg representation of a finite reductive group (*finite-steinberg*)

Let Γ = 𝐆(𝔽_q) for a split connected reductive group 𝐆 over 𝔽_q, with Borel subgroup B = B(𝔽_q), Weyl group W, simple reflections S and N = |Φ⁺|. The Steinberg representation st_Γ is the irreducible complex representation whose character is `Σ_(J⊆S)` `(−1)^(|J|)` `Ind_(P_J)^(Γ)` 1 (P_J the standard parabolic subgroups); it has degree q^N, its B-fixed line is acted on by the Iwahori–Hecke algebra End_Γ(Ind_B^Γ 1) through the sign character T_s ↦ −1 (s ∈ S), and it is the unique constituent of Ind_B^Γ 1 with this property. For the reductive p-adic G of SRU.4, st_G denotes its inflation to K = 𝐆(O) along K → 𝐆(𝔽_q). (CIK71, Lemma 4.3 and Theorem 4.4, printed p. 94, PDF p. 15, and Example 4.6(b), printed p. 95, PDF p. 16)

𝐆 split connected reductive over 𝔽_q; complex coefficients.

One proof route is as follows. The constituents of Ind_B^Γ 1 correspond to the irreducible modules of H(W, q) = End_Γ(Ind_B^Γ 1), whose basis T_w (w ∈ W) comes from the Bruhat decomposition Γ = ⊔ BwB (ReductiveGroups layer 7) with the quadratic and braid relations. For K = 𝐆(O) hyperspecial, K/I ≅ Γ/B via the reduction K → Γ, so H(W, q) ≅ H(K, I), the finite part of the Iwahori–Matsumoto presentation of H(G, I) generated by the T_w, w ∈ W (SR.1 iwahori-matsumoto). The sign character T_s ↦ −1 gives a constituent st_Γ. The alternating sum Σ_J `(−1)^(|J|)` `Ind_(P_J)` 1 is the character of this constituent (Solomon–Tits: it is the top homology of the Tits building); its degree is the index-weighted alternating sum, q^N. Inflation along the reduction K → 𝐆(𝔽_q), surjective with kernel the positive radical K⁺ (ReductiveGroupsPartII RG2.3 reductive-quotient-of-special-fibre; the special fibre is `𝐆_(𝔽_q)` because K is hyperspecial, RG2.3 hyperspecial-vertices), gives a smooth irreducible representation of K. The finite-Hecke sign character and its `q^(|Φ⁺|)` degree are independently supported by CIK71 §4, pp. 94–95. Identifying it with the alternating parabolic character additionally uses the Solomon/Coxeter-complex identity; that combinatorial input is recorded in the target of SRU.4.9.

The defining object has the following API.

- The Steinberg representation of 𝐆(𝔽_q) as an FDRep ℂ (𝐆(𝔽_q)).
- finrank ℂ (the finite Steinberg representation) = q ^ N, N the number of positive roots.
- Its character is `Σ_(J⊆S)` `(−1)^(|J|)` times the permutation character of Γ/P_J.
- Its B-fixed line is one-dimensional and T_s acts on it by −1 for every s ∈ S.
- It is the unique irreducible constituent of Ind_B^Γ 1 on whose B-fixed line every T_s acts by −1.
- st_G := inflation of the finite Steinberg representation along K = 𝐆(O) → 𝐆(𝔽_q).

**Checks.**

- For 𝐆 = GL₂, st_Γ agrees with the Tau Ceti Steinberg representation of GL₂(𝔽_q) of the Tau Ceti supplier contract: both have degree q (3 for 𝔽₃) and character equal to the permutation character of Γ/B minus 1, so Ind_B^Γ 1 has character 1 + χ_st; the full permutation module ℂ[Γ/B] in place of st_Γ would have degree q + 1.
- For Γ = 𝔾_m(𝔽_q) (no roots), st_Γ is trivial.
- For Γ = SL₂(𝔽_q), st_Γ is not the trivial representation: T_s acts on the trivial representation's B-fixed line by q, not −1.
- For Γ = SL₃(𝔽₂), dim st_Γ = 8 = 2³.

For Γ = GL₂(𝔽_q), Ind_B^Γ 1 = 1 ⊕ st_Γ with dim st_Γ = q. For Γ a split torus, st_Γ is the trivial representation.

Additional inputs for this route: GS23, §11.1, proof of Proposition 11.3, p. 32; BC1, §1.1, p. 1.

*Needs:* ReductiveGroups / Layer 7-structure-theory; SmoothRepresentationsOfLocalGroups SR.1 / iwahori-matsumoto; ReductiveGroupsPartII RG2.3 / reductive-quotient-of-special-fibre; ReductiveGroupsPartII RG2.3 / hyperspecial-vertices; SRU.4.9, finite Coxeter-complex identity.

### 4.2 The Iwahori K-type of the Steinberg representation (*steinberg-k-types*)

Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), Iwahori subgroup I = preimage of a Borel B(𝔽_q), rank r. The restriction of the Steinberg representation St_G (SR.3.4) to K contains st_G with multiplicity one, and st_G is the only irreducible K-type of St_G having nonzero I-fixed vectors. (GS23, proof of Proposition 11.3, PDF p. 32)

G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), Iwahori subgroup I = preimage of a Borel B(𝔽_q), rank r.

One proof route is as follows. St_G^I is one-dimensional (SR.3.4 steinberg). It is the I-fixed part of C^∞(BG)/`Σ_(B⊊P)` C^∞(PG): by the Bruhat decomposition C^∞(BG)^I = ℂ[BG/I] is the regular module of H(K, I) ≅ H(W, q), the subspaces C^∞(P_JG)^I are the modules induced from the trivial character of H(W_J, q), and the quotient by their sum over J ≠ ∅ is the sign character (Solomon–Kilmoyer). For any smooth V, V^I = `(V^(K⁺))^(B(𝔽_q))` with K⁺ the positive radical of K (finite-steinberg); the K-types of V with I-fixed vectors are the constituents of Ind_B^Γ 1 occurring in `V^(K⁺)`, detected by the H(W, q)-module V^I. The sign module corresponds to st_Γ (finite-steinberg), with multiplicity dim St_G^I = 1.

For GL₂(ℚ_p), St restricted to GL₂(ℤ_p) contains the q-dimensional st of GL₂(𝔽_p) once, and no K-type of St with I-fixed vectors other than st.

*Needs:* SRU.4 / finite-steinberg; SmoothRepresentationsOfLocalGroups SR.3 / steinberg; SmoothRepresentationsOfLocalGroups SR.1 / iwahori-matsumoto; SmoothRepresentationsOfLocalGroups SR.2 / borel-casselman-invariants.

### 4.3 Barbasch–Moy: the Steinberg K-type detects genericity (*barbasch-moy-genericity*)

Let G = 𝐆(F) with 𝐆 a split connected reductive group over a p-adic field F of characteristic zero, residue field 𝔽_q, a pinning (B, T, (x_α)) defined over O, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), and Iwahori subgroup I = preimage of B(𝔽_q). Let ψ_K be a generic character of U = U(F) whose restriction to each simple root subgroup x_α(F) is trivial on x_α(𝔭) and nontrivial on x_α(O) (the Whittaker datum compatible with K, SR.2.3). For irreducible admissible π with π^I ≠ 0 the following are equivalent: π is ψ_K-generic; the H(K, I)-module π^I contains the sign character T_s ↦ −1; π|_K contains st_G (Barbasch–Moy). In particular an irreducible π whose restriction to K contains st_G is generic. Genericity for another Whittaker datum is reduced to this one by transporting K, I and st_G with the element of the adjoint torus that carries ψ_K to the given character; at a fixed K the converse implication fails for other data. For adjoint G the adjoint torus is T, so genericity does not depend on the datum and the three conditions are equivalent for every generic character. (BM94, cited by its locator; GS23, proof of Proposition 11.3, PDF p. 32)

G = 𝐆(F) with 𝐆 split connected reductive over a p-adic field F of characteristic zero (its centre may be noncompact, as for Levi subgroups); pinning over O, hyperspecial K = 𝐆(O), Iwahori I; the K-compatible Whittaker character ψ_K. π irreducible admissible.

One proof route is as follows. st_G has nonzero I-fixed vectors, so π^I ≠ 0 and π lies in the Iwahori block (SR.3.4 borel-casselman-block); π^I is a simple H(G, I)-module. Barbasch–Moy identify the ψ_K-Whittaker functionals on Iwahori-spherical π with the sign-isotypic part of π^I under the finite Hecke algebra: with the conductor convention above, the I-fixed part of the Gelfand–Graev representation c-Ind_U^G ψ_K is the H(G, I)-module induced from the sign character of H(K, I) (BM94). This computation uses only the pinning, the Iwahori factorisation and H(K, I) ≅ H(W, q), so it applies to every split connected reductive group; for a Levi subgroup M the finite Hecke algebra of W_M is the tensor product of those of the simple factors, and its sign character is the tensor product of their sign characters. Containing st_G is equivalent to the sign character occurring in π^I (steinberg-k-types for almost simple G; for general split reductive G the same Bruhat computation of SRU.4.2 at the level of K/K⁺). The Gelfand–Graev identification and the Whittaker/sign equivalence hold over every nonarchimedean local field; that all-characteristic statement, without the K-type reformulation, is the split generic/sign adapter of SRU.5.27, which SRU.5.5 and SRU.6.2 consume.

When the semisimple rank of 𝐆 is positive, the trivial representation does not contain st_G and is not generic; the Steinberg representation contains st_G and is generic. For a split torus 𝐆 = T, U = 1, W = 1, I = K = T(O) and st_G = 1_K: the trivial representation, and every unramified character, satisfies π^I ≠ 0, contains st_G and is generic with one-dimensional Whittaker space, so the three conditions hold together; a ramified character has π^I = 0 and lies outside the statement. For GL₂(ℚ_p), an irreducible unramified principal series i_B(χ) contains st_G (its Iwahori invariants are the regular H(W, q)-module) and is generic. For SL₂(ℚ₃) and the unramified quadratic character χ, i_B(χ) has two constituents; the K-spherical one has one-dimensional K- and I-fixed spaces on which T_s acts by q = 3, so it contains no sign character and is not ψ_K-generic, although it is generic for a Whittaker character of conductor ℤ₃; the other constituent is ψ_K-generic and contains st_G. For the Levi M of block type (2,2) in PGL₄, with one-dimensional split centre and W_M = S₂ × S₂, the sign type of H(W_M, q) is the tensor product of the two rank-one sign types, each of multiplicity one.

Additional inputs for this route: BC1, §1.1–1.2, pp. 1–2.

*Needs:* SRU.4 / finite-steinberg; SRU.4 / steinberg-k-types; SmoothRepresentationsOfLocalGroups SR.3 / borel-casselman-block; SmoothRepresentationsOfLocalGroups SR.2 / whittaker-functionals; SmoothRepresentationsOfLocalGroups SR.1 / iwahori-matsumoto.

### 4.4 Rodier's decomposition of the principal series containing the Steinberg representation (*rodier-steinberg-series*)

Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), Iwahori subgroup I = preimage of a Borel B(𝔽_q), rank r. Let χ = `δ_B^(1/2)` (normalised induction), so that i_B(χ) has the Steinberg representation as a subrepresentation and the trivial representation as its unique irreducible quotient. Then i_B(χ) has exactly 2^r irreducible subquotients π_J, J ⊆ Δ (simple roots), each with multiplicity one, π_∅ = 1 and π_Δ = St_G, and r_B(π_J) has precisely the exponents wχ for which {α ∈ Δ : wα is positive} = J (Rodier81; Cas80). (GS23, proof of Proposition 11.3, PDF p. 32)

G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), Iwahori subgroup I = preimage of a Borel B(𝔽_q), rank r.

One proof route is as follows. χ = `δ_B^(1/2)` is regular, so r_B(i_B χ) has the |W| distinct exponents w·χ (SR.2 principal-series-jacquet). Since r_B(St_G) = `δ_B^(1/2)` (SR.3.4 steinberg), first adjointness (SR.2 first-adjointness) embeds St_G in i_B(`δ_B^(1/2)`); dually the trivial representation is its quotient. Rodier’s theorem (Rodier81) gives multiplicity-one irreducible constituents indexed by subsets of the simple roots, with the required Jacquet exponents. The proof is not obtained by taking a product of rank-one submodule lattices: rank-one intertwiner relations do not imply that assertion. The exact combinatorial theorem is the target of SRU.4.4 and SRU.4.9. The exponent sets are read off from which intertwining operators `T_(s_α)` vanish on the constituent (Casselman 1980, Theorem 3.1).

**Checks.**

- For type A₂, the six Weyl elements split into exponent classes of sizes 1,2,2,1 under J(w) = {α : wα > 0}; their total is 6 and there are 4 constituents. For the adjacent weights s₁χ and s₂s₁χ, both positivity sets {α : wα > 0} equal {α₂}; the inverse-Weyl convention would give {α₂} and {α₁} and split the same constituent incorrectly. For rank one, J(e) = Δ gives St and J(w₀) = ∅ gives 1.

For PGL₂, r = 1 and i_B(`δ_B^(1/2)`) has the two constituents 1 and St. For PGL₃, i_B(`δ_B^(1/2)`) has four constituents, 1, St and two further infinite-dimensional ones, each with multiplicity one.

Additional inputs for this route: Cas80, §3, Theorem 3.1 (p. 397) and Proposition 3.5 (p. 401).

*Needs:* SmoothRepresentationsOfLocalGroups SR.2 / principal-series-jacquet; SmoothRepresentationsOfLocalGroups SR.2 / parabolic-induction; SmoothRepresentationsOfLocalGroups SR.2 / first-adjointness; SmoothRepresentationsOfLocalGroups SR.3 / steinberg; SmoothRepresentationsOfLocalGroups SR.3 / finite-length; SRU.4.9, Rodier exponent convention.

### 4.5 The Howe–Moore theorem over nonarchimedean local fields (*howe-moore*)

Let 𝐆 be connected, almost simple and isotropic over a nonarchimedean local field F (any characteristic), G = 𝐆(F) and G⁺ the normal subgroup generated by the unipotent radicals of F-parabolic subgroups (G⁺ = G for 𝐆 simply connected; G/G⁺ is compact abelian in general, and finite in characteristic zero). If π is a strongly continuous unitary representation of G with no nonzero G⁺-invariant vector, then every coefficient g ↦ ⟪w, π(g)v⟫ vanishes at infinity on G. In particular, an infinite-dimensional irreducible unitary representation of G has coefficients vanishing at infinity. (CCLTV, §1, semisimple-group Howe–Moore statement, PDF p. 1)

𝐆 almost F-simple and F-isotropic; π strongly continuous unitary without G⁺-invariant vectors.

One proof route is as follows. Prove the contraction step explicitly: for an escaping Cartan sequence aₙ and a weak operator cluster A of π(aₙ), the relations aₙ⁻¹uaₙ → 1 force the image of A to be invariant under the corresponding contracting root groups. Apply Mautner propagation along the connected relative root diagram to obtain G⁺-invariance of that image. Thus A = 0 when H^(G⁺) = 0. Cartan decomposition and compact-factor subsequences then give coefficient vanishing at infinity. This owns the contraction and propagation proof in every local-field characteristic, rather than assuming it follows from Cartan decomposition alone.

For G = SL₂(ℚ_p), the coefficients of the Steinberg representation (square-integrable) and of every unitary principal series vanish at infinity; the trivial representation is excluded by the invariant-vector hypothesis. For G = PGL₂(ℚ_p) the unitary character g ↦ `(−1)^(v_p(det g))` is a nontrivial one-dimensional unitary representation whose coefficient does not vanish at infinity; it is trivial on G⁺, as the hypothesis requires.

Additional inputs for this route: GS23, §11.1, end of the proof of Proposition 11.3, p. 33; CH26, §6, Lemma 6.8, p. 18.

*Needs:* ReductiveGroupsPartII RG2.4 / cartan-decomposition; SRU.0 / strongly-continuous-unitary; SRU.0 / positive-type-coefficient; ReductiveGroups / Layer 7-structure-theory; SRU.4.9, contraction and Mautner propagation.

### 4.6 Unitary constituents of the Steinberg principal series (*steinberg-series-unitary*)

Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), Iwahori subgroup I = preimage of a Borel B(𝔽_q), rank r. The only unitarizable irreducible subquotients of the principal series i_B(`δ_B^(1/2)`) of rodier-steinberg-series are the trivial representation and the Steinberg representation. (GS23, end of proof of Proposition 11.3, PDF p. 32)

G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), Iwahori subgroup I = preimage of a Borel B(𝔽_q), rank r.

One proof route is as follows. The trivial representation is unitarizable; St_G is square-integrable, hence unitarizable (SR.3.3 square-integrable-tempered). For J ≠ ∅, Δ, the constituent π_J is infinite-dimensional and for some exponent ψ = wχ of r_B(π_J) there is an escaping ray in T⁻ = {a ∈ T : |α(a)| ≤ 1 for all α > 0}, the cone on which Casselman's asymptotic expansion of coefficients applies, on which the actual asymptotic character δ_B^(1/2)ψ is 1. Casselman’s canonical pairing and suitable lifts isolate a nonzero leading coefficient on that ray; hence a matrix coefficient does not vanish at infinity. The modulus factor must be included when normalized Jacquet exponents are converted to coefficients. An infinite-dimensional unitarizable π_J would have coefficients vanishing at infinity (howe-moore), a contradiction.

For PGL₂ the statement is empty beyond 1 and St, which are the only constituents. For PGL₃ the two intermediate constituents of i_B(`δ_B^(1/2)`) are not unitarizable. In A₂, χ = `δ_B^(1/2)` is `q^(−ρ)` in the valuation convention of SRU.5.1 (χ(λ^∨(ϖ)) = `q^(−⟨ρ, λ^∨⟩)`), and w = s₂s₁ gives wρ = −α₂, ρ + wρ = α₁ and J(w) = {α₂}. On the ray a_m = (mω₂^∨)(ϖ) ∈ T⁻, where |α(a_m)| = `q^(−m⟨α, ω₂^∨⟩)` ≤ 1, the value `δ_B^(1/2)(a_m)`·(wχ)(a_m) = `q^(−⟨ρ + wρ, mω₂^∨⟩)` = `q^(−m⟨α₁, ω₂^∨⟩)` = 1, whereas for St the unnormalised exponent is δ_B = `q^(−2ρ)` with value `q^(−2m)`; at q = 2 and m = 1 these are 1 and ¼. On the opposite ray (−mω₂^∨)(ϖ) ∈ T⁺ a coefficient of π_J is a coefficient of the contragredient at a_m ∈ T⁻, and r_B(π̃_J) has the exponents `(w₀ψ)^(−1)`, so `π̃_(α₂)` = `π_(α₁)` with exponents s₁s₂χ and s₂χ, whose unnormalised values at a_m are `q^(−⟨α₂, mω₂^∨⟩)` = `q^(−m)` and `q^(−⟨2α₁ + α₂, mω₂^∨⟩)` = `q^(−m)`, both decaying, while St still gives `q^(−2m)`. This fixes the modulus, ray and Weyl conventions in the coefficient argument.

*Needs:* SRU.4 / rodier-steinberg-series; SRU.4 / howe-moore; SRU.2 / unitary-dual-smooth; SmoothRepresentationsOfLocalGroups SR.2 / casselman-pairing; SmoothRepresentationsOfLocalGroups SR.3 / square-integrable-tempered.

### 4.7 The Steinberg representation is isolated (*steinberg-isolated*)

Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), Iwahori subgroup I = preimage of a Borel B(𝔽_q), rank r. If r ≥ 2, the Steinberg representation St_G is an isolated point of the unitary dual Ĝ (Gan–Savin Proposition 11.3). For r = 1 (SL₂, PGL₂) the statement is false: St_G is a limit point of the spherical complementary series. (GS23, Proposition 11.3, PDF p. 32)

G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽_q), Iwahori subgroup I = preimage of a Borel B(𝔽_q), rank r. r ≥ 2.

One proof route is as follows. Suppose [St] ∈ L[πₙ] with πₙ irreducible unitarizable, πₙ ≇ St. By k-types-persist, st_G occurs in πₙ for n large, so πₙ is ψ_K-generic (barbasch-moy-genericity), and the gan-savin-generic-limits apply with the fixed datum ψ_K: after a subsequence πₙ ≅ i_P(τₙ), τₙ → τ, St a subquotient of i_P(τ), and every subquotient of i_P(τ) is a limit point (milicic-limits), hence unitarizable. πₙ is eventually nontempered (discrete-series-isolated-tempered), so P ≠ G. By fell-convergence-bernstein-centre every subquotient of i_P(τ) has the cuspidal support of St, i.e. lies in i_B(`δ_B^(1/2)`). If P = B, all 2^r ≥ 4 constituents of i_B(`δ_B^(1/2)`) would be unitarizable, contradicting steinberg-series-unitary. If B ⊊ P ⊊ G: τ has Iwahori-spherical cuspidal support because i_P(τ) has the cuspidal support of St; hence τ is Iwahori-spherical. τ is generic for the restriction of ψ_K to U ∩ M, which satisfies the conductor convention for K ∩ M = 𝐌(O); barbasch-moy-genericity for the split connected reductive group M makes st_M a (K ∩ M)-type of τ; by the Iwasawa decomposition G = QK for a minimal parabolic Q ⊆ P (ReductiveGroupsPartII RG2.4), hence G = PK, i_P(τ)|_K = `Ind_(K∩P)`^K(`τ|_(K∩M)`) contains the inflation of the finite induced representation `Ind_(P(𝔽_q))^(Γ)(st_(M(𝔽_q)))`, whose B(𝔽_q)-fixed vectors form the H(W, q)-module induced from the sign character of H(W_M, q). It has dimension [W : W_M] > 1, contains the sign character once and the trivial character not at all (W_M ≠ 1), so it has an irreducible constituent different from both; this is a K-type with I-fixed vectors other than st_G and other than the trivial K-type. The constituent of i_P(τ) carrying it is unitarizable, is not St (steinberg-k-types) and not 1, contradicting steinberg-series-unitary. Gan–Savin call this step easy; the expansion here is the finite-Hecke-algebra computation.

For PGL₂(ℚ_p) the complementary series i_B(`|·|^(s)` ⊗ `|·|^(−s)`), 0 < s < 1/2, converge as s → 1/2 to both 1 and St in the Fell topology, so St is not isolated in rank one. For G₂(ℚ₅) (rank 2) St is isolated; this is the input of the counterexample to the subsequence form of Gan–Savin Proposition 11.6 (SRU.1 gan-savin-closure).

*Needs:* SRU.3 / k-types-persist; SRU.4 / barbasch-moy-genericity; SRU.3 / gan-savin-generic-limits; SRU.3 / milicic-limits; SRU.3 / discrete-series-isolated-tempered; SRU.3 / fell-convergence-bernstein-centre; SRU.4 / steinberg-series-unitary; SRU.4 / finite-steinberg; SRU.1 / fell-topology; ReductiveGroupsPartII RG2.4 / iwasawa-decomposition.

### 4.8 Supercuspidal representations are isolated (*supercuspidal-isolated*)

Let G = 𝐆(F) be reductive over a nonarchimedean local field with compact centre. Every irreducible unitarizable supercuspidal representation σ of G is an isolated point of Ĝ. (With noncompact centre the same holds in the subset of Ĝ with a fixed unitary central character.) (GS23, proof of Proposition 10.5, PDF p. 28)

Z(G) compact, or a fixed unitary central character.

One proof route is as follows. By the Bernstein decomposition (SR.3 bernstein-decomposition, cuspidal-splitting) the component of σ is {σ ⊗ ψ : ψ ∈ Ψ(G)}, Ψ(G) = Hom(G/G°, ℂ^×) with G° generated by all compact subgroups (SR.3 unramified-characters); for compact centre Z(G) ⊆ G°, so the lattice G/G° is finite, hence trivial, Ψ(G) = 1 and the component is {σ} up to isomorphism (Ber92, Ch. II §2.1, Proposition 22(2)–(4), p. 39); let e be the idempotent of the Bernstein centre cutting it out and K a compact open subgroup with σ^K ≠ 0. Then f := e ∗ 1_K (normalised) lies in C_c^∞(G). For an irreducible unitarizable π, π(f) ≠ 0 iff π is in the component of σ and π^K ≠ 0, iff π ≅ σ. The set {x ∈ Ĝ : rep x (f) ≠ 0} is open in the Fell topology (SRU.1.7, openness of {x : rep x (f) ≠ 0}), so {[σ]} is open. With noncompact centre and a fixed unitary central character ω, the twists σ ⊗ ψ with ψ ∈ Ψ(G) trivial on Z(G) are the points of the component of σ with central character ω; they are finitely many up to isomorphism, because Z(G)G° has finite index in G (Ber92, Ch. II §2.1, Proposition 22(4), p. 39), so Hom((G/G°)/(Z(G)G°/G°), ℂ^×) is finite. Their K-fixed spaces are simple, pairwise non-isomorphic H(G, K)-modules (SR.1 corner-irreducibles, hecke-module-equivalence), so the density theorem gives f ∈ H(G, K) with σ(f) ≠ 0 and (σ ⊗ ψ)(f) = 0 for every twist σ ⊗ ψ ≇ σ with ψ trivial on Z(G); then {x ∈ Ĝ_ω : rep x (e ∗ f) ≠ 0} = {[σ]}, which is open in the subset Ĝ_ω of classes with central character ω.

For PGL₂(ℚ_p), every depth-zero supercuspidal representation is isolated, while the unitary principal series are not. Negative control for the meaning of unramified: on PGL₂(ℚ_p) the character χ(g) = `(−1)^(v_p(det g))` is trivial on PGL₂(ℤ_p) but χ(w) = −1 for w = [[0,1],[p,0]], whose square is the central p·1, so w generates a compact subgroup of order 2; thus χ ∉ Ψ(G), and for σ supercuspidal with σ ⊗ χ ≇ σ the twist σ ⊗ χ lies in a different Bernstein component even though `(σ ⊗ χ)|_(PGL₂(ℤ_p))` = `σ|_(PGL₂(ℤ_p))`; the idempotent e, not e_K alone, separates them. For ℚ_p^× (noncompact centre) a unitary character is not isolated in the full unitary dual, being a limit of unramified twists; it is isolated among characters with a fixed value at p.

*Needs:* SmoothRepresentationsOfLocalGroups SR.3 / unramified-characters; SmoothRepresentationsOfLocalGroups SR.3 / bernstein-decomposition; SmoothRepresentationsOfLocalGroups SR.3 / cuspidal-splitting; SmoothRepresentationsOfLocalGroups SR.3a / cuspidal-representations; SmoothRepresentationsOfLocalGroups SR.1 / corner-irreducibles; SmoothRepresentationsOfLocalGroups SR.1 / hecke-module-equivalence; SRU.1 / fell-topology; SRU.2 / unitary-dual-smooth.

### 4.9 Coxeter and contraction inputs (*coxeter-contraction-inputs*)

Prove the finite Coxeter-complex alternating-character identity identifying the parabolic sum in SRU.4.1 with the finite-Hecke sign constituent: for every split finite reductive group, its character is the alternating sum over all standard parabolics and its degree is q raised to the number of positive roots. The Coxeter complex has reduced top homology only; use its orientation character to fix the sign. For rank zero its reduced degree −1 convention gives the one-dimensional trivial representation, and in type A₁ the character is the permutation character on ℙ¹ minus 1, of degree q. The geometric constituent/exponent calculation in SRU.4.4 is the separate Rodier target, with the exact positivity-set convention stated there (CIK71 §4, pp. 93–95; GS23 proof of Proposition 11.3, p. 33).

The contraction/Mautner propagation theorem used by SRU.4.5 is also a target: for every escaping Cartan sequence in an isotropic almost simple local group and every weak operator cluster of a strongly continuous unitary action, its range is fixed by G⁺. This is applied only after reducing to an appropriate subsequence and its contracting root groups; prove the propagation from those groups to G⁺. The zero weak cluster has range {0}; the trivial action has cluster id and range H = H^(G⁺). These compute both endpoints (CCLTV §1, pp. 1–2, for the all-characteristic semisimple statement).

*Needs:* finite-dimensional representation and compact-operator APIs; SmoothRepresentationsOfLocalGroups SR.1.5; ReductiveGroups Layer 7; ReductiveGroupsPartII RG2.3–RG2.4; CIK71 §4.

### Examples

For GL₂(𝔽₃), the permutation representation on ℙ¹ has dimension 4 = 1+3, and the finite Steinberg constituent has dimension 3. For SL₃(𝔽₂), its degree is 2³ = 8. On S₃, identified with GL₂(𝔽₂), the degree-two type has projector eigenvalue 1, whereas the character average without its degree has eigenvalue ½. Rank-one p-adic St is a complementary-series limit; rank-two split St is isolated.

### Dependencies

The statement carriers and the proposed proof inputs are the individual Needs lines above. This layer consumes SRU.0; SRU.1; SRU.2; SRU.3. Finite Steinberg and contraction inputs are proved in this layer, and isolation additionally uses the limit and tempered-local-topology inputs of SRU.3.

## Layer SRU.5: The generic unitary spherical dual

### 5.1 Real parts of the supplied Satake parameters (*real-satake-parameter*)

Let k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting). For s ∈ T^∨ = Hom(X^∨, ℂ^×), χ_s := s ∘ val_T : T(k) → ℂ^× with ⟨val_T(t), λ⟩ = val_k(λ(t)) (Ciubotaru–Harris (6.1)); X(s) := i_B(χ_s) (normalised, SR.2) and L(s) its unique K-spherical irreducible subquotient; s ↦ L(s) is a bijection from W-orbits in T^∨ to irreducible K-spherical representations, s being the Satake parameter (SR.4 spherical-parameter, satake-isomorphism, with complex coefficients and the positive square root `q^(1/2)` ∈ ℂ fixing normalised induction). Write s = s_c·s_ν with s_ν = r(s) the positive part and s_c = s/r(s) the compact part of LieHighestWeightPartII N5 positive-real-part (T^∨_ℝ = X ⊗ `ℝ_(>0)`, T^∨_c = X ⊗ S¹), and define the real part ν ∈ t^∨_ℝ = X ⊗ ℝ as the q-logarithm of r(s), so that s_ν = exp(ν log q) with q ≥ 2; s_ν is a real Satake parameter, X(ν) := X(s_ν), L(ν) := L(s_ν). C₀ = {ν : ⟨α^∨, ν⟩ ≥ 0 for α ∈ Π}, `C_(0,h)` = {ν ∈ C₀ : w₀ν = −ν} (hermitian locus), A₀ = {ν ∈ C₀ : ⟨γ^∨, ν⟩ < 1} (γ^∨ the highest coroot), ρ = half the sum of positive roots; the trivial representation is L(ρ). Convention: with (6.1), `χ_(s_ν)(λ^∨(ϖ))` = `q^(⟨λ^∨, ν⟩)`, so for dominant ν the spherical L(ν) is the unique irreducible subrepresentation of X(ν) (and the unique quotient of X(−ν)); Barbasch–Ciubotaru's χ_ν(τ(a)) = `|a|^(⟨τ, ν⟩)` differs by ν ↦ −ν, which changes no statement of SRU.5–SRU.7 because L(ν) and L(−ν) are hermitian duals and unitarity is preserved. (CH26, §6, (6.1)–(6.6), PDF p. 16)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. X(s)^K is one-dimensional by the Iwasawa decomposition (ReductiveGroupsPartII RG2.4), so X(s) has exactly one K-spherical constituent L(s) (SR.2 induced-invariants). The Hecke character of L(s) is evaluation of the Satake transform at s; the Satake isomorphism identifies H(G, K) with ℂ[T^∨]^W (SR.4), so L(s) ≅ L(s') iff s' ∈ W·s. The decomposition, its uniqueness and its Weyl equivariance are those of N5 positive-real-part; only the q-logarithm ν and its Satake and chamber specialisations are defined here. Sign of the convention: val_T(λ^∨(ϖ)) = λ^∨ gives `χ_(s_ν)(λ^∨(ϖ))` = `q^(⟨λ^∨, ν⟩)`; for PGL₂ and ν = ρ this is `δ_B^(−1/2)`, and i_B(`δ_B^(−1/2)`) = Ind_B 1 has the trivial representation as subrepresentation (SR.3.4 steinberg).

The defining object has the following API.

- The real part ν = log_q r(s) ∈ X ⊗ ℝ of the N5 positive part r(s), with s = s_c · q^ν for the N5 compact part s_c.
- ν(w·s) = w·ν(s) for w ∈ W, from the Weyl equivariance of r.
- C₀, `C_(0,h)` = {ν ∈ C₀ | w₀ ν = −ν} and A₀ = {ν ∈ C₀ | ⟨γ^∨, ν⟩ < 1} as subsets of X ⊗ ℝ.

**Checks.**

- For G = PGL₂(ℚ_p), L(s_ρ) is the trivial representation and ⟨α^∨, ρ⟩ = 1.
- At q = 2, s = diag(−2, −½) in the dual SL₂(ℂ) of PGL₂ has compact part −I and positive part diag(2, ½); deleting the compact factor changes the Satake parameter, since diag(2, ½) is not W-conjugate to diag(−2, −½), while for diag(i, −i) the real part is 0 and the compact part is the element itself.
- For ν = 0, s = s_c is compact and X(s_c) is unitarily induced.
- For PGL₂, s = `q^(1/4)` and s' = `q^(1/3)` are not W-conjugate, so L(s) ≇ L(s').

For G = PGL₂ the Satake parameters are s ∈ ℂ^× modulo s ↦ s⁻¹; the trivial representation is L(`q^(1/2)`) = L(ρ), and L(1) = X(1) is the unitary spherical principal series at the centre. For every s, L(s) ≅ L(w·s) for w ∈ W, and s = s_c s_ν with s_c = 1 iff s ∈ T^∨_ℝ.

Additional inputs for this route: BC1, §1.2, (1.2.1)–(1.2.2), p. 2.

*Needs:* SmoothRepresentationsOfLocalGroups SR.4 / spherical-parameter; SmoothRepresentationsOfLocalGroups SR.4 / satake-isomorphism; SmoothRepresentationsOfLocalGroups SR.4 / torus-character-dictionary; SmoothRepresentationsOfLocalGroups SR.2 / parabolic-induction; SmoothRepresentationsOfLocalGroups SR.2 / induced-invariants; ReductiveGroupsPartII RG2.5 / langlands-dual-group; ReductiveGroupsPartII RG2.4 / iwasawa-decomposition; LieHighestWeightPartII N5 positive-real-part.

### 5.2 Half-integral real parts and geometric Satake parameters (*half-integral-parameter*)

In the setting of real-satake-parameter, let (V, ρ_V) be a finite-dimensional representation of g^∨ (equivalently of G^∨). A real parameter ν ∈ t^∨_ℝ is half-integral with respect to V if ⟨χ, ν⟩ ∈ ½ℤ for every weight χ of V; the Satake parameter s = s_c s_ν is then called geometric with respect to V (Ciubotaru–Harris Definition 6.3). This is a condition on the real part only, not algebraicity of s_c. For a fixed 0 ≤ ε < ½, `C₀^(½+ε)` := {ν ∈ C₀ : ⟨α^∨, ν⟩ ∈ ε + ½ℤ for all α^∨ ∈ Φ^∨} ((6.11)); `C₀^(½)` is the set of ν ∈ C₀ half-integral for the adjoint representation. In fundamental-weight coordinates ν = Σ νᵢ ωᵢ, ν ∈ `C₀^(½)` iff every νᵢ ∈ `½ℤ_(≥0)`. (CH26, Definition 6.3 and (6.11)–(6.13), PDF p. 17)

V finite-dimensional; ν real.

One proof route is as follows. Weights of the adjoint representation are the roots of g^∨, i.e. the coroots α^∨ of G; so adjoint half-integrality is ⟨α^∨, ν⟩ ∈ ½ℤ for all coroots, equivalently for the simple ones. For ν dominant, ⟨αᵢ^∨, ν⟩ = νᵢ in fundamental-weight coordinates.

The defining object has the following API.

- half-integrality V ν :⇔ ∀ χ ∈ weights of V, ⟨χ, ν⟩ ∈ (1/2 : ℝ) • ℤ.
- Half-integrality for the adjoint representation ↔ ∀ α^∨ ∈ Φ^∨, ⟨α^∨, ν⟩ ∈ ½ℤ ↔ (for dominant ν) every fundamental coordinate νᵢ ∈ `½ℤ_(≥0)`.
- s is geometric for V iff its real part is half-integral for V.
- `C₀^(½+ε)` for 0 ≤ ε < ½.
- ρ is half-integral for every V.

**Checks.**

- For G = PGL₃, ⟨α^∨, ρ⟩ ∈ {1, 2} for the positive coroots, so ρ ∈ `C₀^(½)`.
- ν = 0 is half-integral for every V.
- For G = PGL₂ and ν = ¼α (so ⟨α^∨, ν⟩ = ½), ν is half-integral for the adjoint representation but not for the standard representation of SL₂(ℂ), whose weights ±α^∨/2 pair to ±¼.
- For G = G₂ every weight of every representation of G^∨ = G₂(ℂ) lies in the root lattice, so adjoint half-integrality implies half-integrality for all V.
- The rank-zero trivial representation has the single weight 0, whose pairing is 0 ∈ ½ℤ; the empty positive-root set does not exclude it.

ρ is half-integral for every representation of G^∨ (its pairings with weights are half-integers), so the trivial representation L(ρ) is geometric for all V. The real part ν of a tempered spherical representation is 0, half-integral for every V.

*Needs:* SRU.5 / real-satake-parameter; RepresentationTheory/LieHighestWeight / Layer 2-weights-of-a-module-and-their-integrality.

### 5.3 Tempered spherical representations (*spherical-tempered-criterion*)

In the setting of real-satake-parameter, L(s) is tempered iff its real part ν is 0; in that case L(s) = X(s) is the irreducible principal series unitarily induced from the unitary character χ_s (Ciubotaru–Harris Lemma 5.2, in local form). (CH26, Lemma 5.2, PDF p. 12)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. If ν=0, χ_s is unitary and normalised induction is tempered. In the adjoint setting of real-satake-parameter, irreducibility follows from the unramified irreducibility criterion; hence its spherical constituent is tempered. No argument uses unitarizability alone to deduce irreducibility. Conversely use the spherical Langlands classification and Casselman’s tempered exponent criterion, precisely as in CH26 Lemma 5.2, pp. 12–13: a nonzero dominant real part gives a nonzero positive Langlands exponent, incompatible with temperedness. The Jacquet exponent set of an individual spherical constituent need not be Weyl stable.

For PGL₂(ℚ_p), the spherical L(s) is tempered iff |s| = 1; the trivial representation L(`q^(1/2)`) is not tempered.

*Needs:* SRU.5 / real-satake-parameter; SRU.2 / unitary-induction; SRU.5 / unramified-principal-series-irreducibility; SmoothRepresentationsOfLocalGroups SR.3 / casselman-criterion; SmoothRepresentationsOfLocalGroups SR.3 / langlands-classification; SmoothRepresentationsOfLocalGroups SR.3 / square-integrable-tempered.

### 5.4 Irreducibility of unramified principal series (*unramified-principal-series-irreducibility*)

In the setting of real-satake-parameter: (1) for s regular (trivial stabiliser in W), X(s) is irreducible iff α^∨(s) ≠ `q^(±1)` for every root α (Casselman 1980 Proposition 3.5(b)); (2) for general s and G adjoint (so G^∨ simply connected and every centraliser `Z_(G^∨)(s)` connected), X(s) is irreducible iff α^∨(s) ≠ `q^(±1)` for every root α (Kato81 Theorem 2.2, p. 935; its second condition, that W_s be generated by reflections, holds automatically); (3) for a real dominant ν, X(ν) is irreducible iff ⟨α^∨, ν⟩ ≠ 1 for every positive coroot α^∨ (Ciubotaru–Harris p. 17; Barbasch–Ciubotaru §3.1). (Cas80, Theorem 3.1 and Proposition 3.5(b), PDF p. 16)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. (1): Casselman's intertwining operators T_w with `T_(w⁻¹)` ∘ T_w = `c_(w⁻¹)(wχ)`c_w(χ) and c_α(χ) = (1 − q⁻¹χ(a_α))/(1 − χ(a_α)) for split groups (Casselman 1980 Theorem 3.1); irreducibility iff the product over all positive roots is nonzero (Proposition 3.5(b)). (2): Kato extends (1) to singular s; for G adjoint, Steinberg's theorem makes `Z_(G^∨)(s)` connected and W_s its Weyl group, generated by reflections. (3): for real dominant ν, α^∨(s_ν) = `q^(⟨α^∨, ν⟩)` with ⟨α^∨, ν⟩ ≥ 0 for positive α, so only the value 1 can occur.

For PGL₂ with s=diag(t,t⁻¹), reducibility occurs exactly at t²=`q^(±1)`. At t=+`q^(1/2)` the Jordan–Hölder constituents are 1 and St; at t=−`q^(1/2)` both are twisted by g ↦ `(−1)^(v(det g))`, the unramified quadratic character of k^× composed with det (trivial on 𝐆(O), but not an element of Ψ(G), which is trivial for PGL₂). These endpoint principal series are nonsplit extensions, not Hilbert direct sums. For PGL₂ and the real parameter ν with ⟨α^∨, ν⟩ = 1, X(ν) contains the trivial and Steinberg representations.

Additional inputs for this route: CH26, §6, after Definition 6.3, p. 17; BC1, §3.1, pp. 16–17.

*Needs:* SRU.5 / real-satake-parameter; SmoothRepresentationsOfLocalGroups SR.2 / principal-series-jacquet; SmoothRepresentationsOfLocalGroups SR.1 / iwahori-matsumoto; ReductiveGroupsPartII RG2.5 / langlands-dual-group; SRU.5.27, full-root-datum Hecke comparison.

### 5.5 Generic spherical representations (*spherical-generic-criterion*)

In the setting of real-satake-parameter, each X(s) has a unique generic irreducible subquotient (Rodier73), and L(s) is generic iff X(s) is irreducible, i.e. iff L(s) = X(s) (Barbasch–Moy; Ciubotaru–Harris p. 17). Consequently a tempered L(s) is generic (Ciubotaru–Harris Corollary 5.7, local part). (CH26, §6, after Definition 6.3; Corollary 5.7, PDF p. 17)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. Uniqueness of the generic constituent: SRU.3 rodier-heredity for P = B. If X(s) is irreducible, L(s) = X(s) is generic (every principal series is generic). If L(s) is generic, its Iwahori-fixed H(K, I)-module contains both the trivial character (spherical) and the sign character (generic, by the split generic/sign adapter of SRU.5.27, valid over every nonarchimedean local field; G is adjoint, so T(k) permutes the generic characters transitively and genericity does not depend on the Whittaker datum); for adjoint G Barbasch–Moy show this forces L(s) = X(s) (Barbasch–Ciubotaru §1.2, [BM4]). Tempered spherical: ν = 0 (spherical-tempered-criterion), so |α^∨(s)| = 1 ≠ `q^(±1)` and X(s) is irreducible (unramified-principal-series-irreducibility), hence generic.

The trivial representation L(ρ) is not generic (rank ≥ 1), and X(ρ) is reducible. Every L(s_c) with s_c compact is generic and equal to X(s_c).

Additional inputs for this route: BC1, §1.2, p. 2; §3.1, pp. 16–17.

*Needs:* SRU.5 / real-satake-parameter; SRU.5 / spherical-tempered-criterion; SRU.5 / unramified-principal-series-irreducibility; SRU.3 / rodier-heredity; SRU.5.27, split generic/sign adapter.

### 5.6 Hermitian spherical representations (*spherical-hermitian-criterion*)

In the setting of real-satake-parameter, L(s) admits a nonzero G-invariant hermitian form iff some w ∈ W maps s to s̄⁻¹ (Barbasch–Ciubotaru §1.2); for a real dominant ν this means w₀ν = −ν (Ciubotaru–Harris (6.5)). When w₀ = −1 (types A₁, B, C, `D_(2m)`, G₂, F₄, E₇, E₈) every real ν is hermitian; Ciubotaru–Harris list B, C, G₂, F₄, E₇, E₈. (BC1, §§1.2 and 3.1, PDF p. 2)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. An invariant hermitian form is an isomorphism L(s) → conj(L(s)~); the contragredient of L(s) is L(s⁻¹) and its complex conjugate L(s̄⁻¹), so the condition is L(s) ≅ L(s̄⁻¹), i.e. s̄⁻¹ ∈ W·s (real-satake-parameter). For s = s_ν real, s̄⁻¹ = `s_(−ν)`; for dominant ν, −ν ∈ W·ν iff −ν = w₀ν.

For PGL₃ (w₀ ≠ −1) the real dominant ν = ω₁ is not hermitian. For PGL₂ every real ν is hermitian.

Additional inputs for this route: CH26, §6, (6.5), p. 17.

*Needs:* SRU.5 / real-satake-parameter; SRU.2 / unitary-structure; SmoothRepresentationsOfLocalGroups SR.0 abelian-category / smooth-dual.

### 5.7 The generic unitary spherical region (*generic-unitary-region*)

In the setting of real-satake-parameter, U₀^g := {ν ∈ C₀ : ⟨α^∨, ν⟩ ≠ 1 for every α^∨ ∈ `Φ^(∨,+)` and L(ν) is unitary} parametrises the generic spherical unitary representations with real Satake parameter (Ciubotaru–Harris (6.4)); U₀^g ⊆ `C_(0,h)`. The hyperplanes ⟨α^∨, ν⟩ = 1, α^∨ ∈ `Φ^(∨,+)`, cut C₀ into m = ∏ᵢ (dᵢ + h)/dᵢ open regions (dᵢ the fundamental degrees of Φ^∨; 105 for F₄, 25 080 for E₈); the dominant alcoves include their faces on chamber walls through zero; U₀^g is a union of open regions intersected with `C_(0,h)`. Unitarity of L(s_c s_ν) for noncentral s_c is not governed by U₀^g. (CH26, §6, (6.4)–(6.6), PDF p. 17)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. By spherical-generic-criterion and unramified-principal-series-irreducibility, ν ∈ C₀ gives a generic L(ν) iff ⟨α^∨, ν⟩ ≠ 1 for all positive coroots. Unitarity requires hermitian, so U₀^g ⊆ `C_(0,h)` (spherical-hermitian-criterion). The count of regions is the classical count of the Shi-type arrangement in the dominant chamber, quoted by Ciubotaru–Harris.

The defining object has the following API.

- U₀^g as a subset of X ⊗ ℝ.
- U₀^g ⊆ `C_(0,h)`.
- ν ∈ U₀^g ↔ ν ∈ C₀ ∧ (∀ α^∨ > 0, ⟨α^∨, ν⟩ ≠ 1) ∧ L(ν) unitarizable ↔ L(ν) generic, unitarizable, with ν dominant.
- The number of open regions of C₀ cut out by the walls ⟨α^∨, ν⟩ = 1 is ∏ᵢ (dᵢ + h)/dᵢ.
- 0 ∈ U₀^g.

**Checks.**

- For G = PGL₂, U₀^g = {c·ω : 0 ≤ c < 1} with ⟨α^∨, ω⟩ = 1.
- 0 ∈ U₀^g: X(0) is unitarily induced and irreducible.
- ρ ∉ U₀^g although L(ρ) is unitary (trivial): ⟨α^∨, ρ⟩ = 1 for simple coroots, so L(ρ) is not generic.
- For F₄ (h = 12, degrees 2, 6, 8, 12) the number of regions is (14·18·20·24)/(2·6·8·12) = 105.
- For A₁ the two regions are [0,1) and (1,∞) in the coordinate ⟨α^∨,ν⟩; exactly the first is unitary and includes 0. Omitting chamber-wall faces would incorrectly exclude the tempered parameter.

For PGL₂, U₀^g = {ν ∈ C₀ : ⟨α^∨, ν⟩ < 1} = A₀, the spherical complementary series; it has the single region below the wall. 0 ∈ U₀^g for every G.

*Needs:* SRU.5 / real-satake-parameter; SRU.5 / spherical-generic-criterion; SRU.5 / spherical-hermitian-criterion; SRU.5 / unramified-principal-series-irreducibility; SRU.2 / unitary-structure.

### 5.8 The fundamental alcove is unitary (*fundamental-alcove-unitary*)

In the setting of real-satake-parameter, A₀ ∩ `C_(0,h)` ⊆ U₀^g: for hermitian dominant ν with ⟨γ^∨, ν⟩ < 1, L(ν) = X(ν) is generic and unitary (Ciubotaru–Harris Lemma 6.7). (CH26, Lemma 6.7, PDF p. 18)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. X(0) is unitarily induced and irreducible, hence unitary (SRU.2 unitary-induction, unramified-principal-series-irreducibility). On the segment t ↦ tν, t ∈ [0, 1], every X(tν) is irreducible (⟨α^∨, tν⟩ ≤ ⟨γ^∨, ν⟩ < 1 for positive coroots) and hermitian (w₀ν = −ν), with hermitian forms given by normalised long intertwining operators depending continuously on t. The signature of a continuous family of nondegenerate hermitian forms on the K-types is constant (KS71, the complementary-series argument; the constancy of signature of the operators a_μ(χ) on facets, Barbasch–Ciubotaru §3.2), so X(ν) is unitary.

For PGL₂ this is the classical complementary series 0 ≤ ⟨α^∨, ν⟩ < 1. For PGL₃ (w₀ ≠ −1) only the hermitian ν = c(ω₁ + ω₂), 0 ≤ c < ½, of A₀ are covered.

Additional inputs for this route: BC1, §3.1–3.2, pp. 16–17.

*Needs:* SRU.5 / generic-unitary-region; SRU.2 / unitary-induction; SRU.5 / unramified-principal-series-irreducibility; SRU.5 / spherical-hermitian-criterion; SRU.5.27, signature constancy.

### 5.9 Unbounded regions are not unitary (*unbounded-not-unitary*)

In the setting of real-satake-parameter, if ν ∈ C₀ and ⟨αᵢ^∨, ν⟩ > 1 for some simple coroot αᵢ^∨, then ν ∉ U₀^g (Ciubotaru–Harris Lemma 6.8). (CH26, Lemma 6.8, PDF p. 18)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. Use normalized long-intertwiner signature forms on the spherical and detecting Weyl types, as in BCP §5.2, pp. 53–54. Their signs change across the simple-root threshold 1. Constancy of signature on each irreducible hermitian region gives nonpositivity beyond that threshold. Coefficient decay alone does not supply this exclusion.

For PGL₂, ν with ⟨α^∨, ν⟩ > 1 gives X(ν) irreducible but not unitary: its spherical function grows or fails to decay.

Additional inputs for this route: BCP, §5.2, Lemma (2) and following explanation, p. 53.

*Needs:* SRU.5 / generic-unitary-region; SmoothRepresentationsOfLocalGroups SR.2 / principal-series-jacquet; SmoothRepresentationsOfLocalGroups SR.2 / casselman-pairing; SRU.5 / unramified-principal-series-irreducibility; SRU.5.27, detecting signatures.

### 5.10 Barbasch–Moy: unitarity through the Iwahori–Hecke algebra (*barbasch-moy-unitarity*)

Let G be split over a nonarchimedean local field (characteristic zero is assumed by Barbasch–Moy and Barbasch–Ciubotaru; Ciubotaru–Harris §7 note the assumption is unnecessary for the Hecke-algebraic statements) and I an Iwahori subgroup. An irreducible representation π with π^I ≠ 0 is unitarizable iff the simple H(G, I)-module π^I is unitary for the *-structure f*(g) = conj f(g⁻¹) (BM89, Theorems 1.1–1.2, cited by its locator); the Iwahori–Matsumoto involution preserves hermitian and unitary modules and exchanges spherical and generic ones; and the problem reduces to the graded affine Hecke algebra of the centraliser of s_c at the real infinitesimal character ν (BM93, Theorem 8.1, printed p. 634). (BC1, §§1.1–1.2, PDF p. 1)

G split; π irreducible Iwahori-spherical.

One proof route is as follows. The Borel–Casselman equivalence V ↦ V^I (SR.3.4 borel-casselman-block) matches invariant hermitian forms on V with H(G, I)-invariant forms on V^I, the *-operation being adjoint for unitary structures (positive-definiteness on V reduces to V^I by e_I-averaging over K-types: BM89). The Iwahori–Matsumoto involution of H(G, I) (SR.1 iwahori-matsumoto) is a *-automorphism up to the sign twist, hence preserves unitarity; on the trivial character it gives the sign character. The reduction to real infinitesimal character and to the graded algebra of `Z_(G^∨)(s_c)` is Lusztig's reduction made *-compatible by Barbasch–Moy; it is cited.

The trivial and Steinberg representations correspond under the Iwahori–Matsumoto involution; both are unitary. For non-real s_c the unitarity of L(s_c s_ν) is decided in the graded Hecke algebra of `Z_(G^∨)(s_c)`, not of G^∨ (the noncentral-compact dependence).

*Needs:* SmoothRepresentationsOfLocalGroups SR.3 / borel-casselman-block; SmoothRepresentationsOfLocalGroups SR.1 / iwahori-matsumoto; SmoothRepresentationsOfLocalGroups SR.1 / bernstein-presentation; SRU.2 / unitary-structure; SRU.5.27, characteristic-independent affine/graded comparison.

### 5.11 Classification of the generic unitary spherical dual (*generic-unitary-classification*)

In the setting of real-satake-parameter, U₀^g is the intersection of `C_(0,h)` with a union of 2^d alcoves of C₀ including A₀, where d = 0 for PGL(n) and SO(2n+1), ⌊(n−1)/2⌋ for PSp(2n), n − 1 for PSO(4n) (n ≥ 2) and PSO(4n+2) (n ≥ 1), 1 for G₂, F₄, E₆, 3 for E₇ and 4 for E₈ (Ciubotaru–Harris Theorem 6.9, on the hermitian locus `C_(0,h)`). Explicitly (Barbasch–Ciubotaru §3.2–3.4), where the letters name the type of the root system Φ^∨ of the dual group, which is the root system of the Hecke algebra in BC1 §3.3: the C formula applies to G = SO(2n+1) (dual Sp(2n)), the B formula to G = PSp(2n) (dual Spin(2n+1)), and type D is self-dual. Type A: ν = (ν₁, …, ν_k, (0,) −ν_k, …, −ν₁) with 0 ≤ ν₁ ≤ ⋯ ≤ ν_k < ½; dual type C (G = SO(2n+1)): 0 ≤ ν₁ ≤ ⋯ ≤ νₙ < ½; dual types B and D (G = PSp(2n), PSO(2n)): the alternating conditions of Barbasch–Ciubotaru Theorem 3.3, made precise in SRU.5.28; G₂: {3ν₁ + 2ν₂ < 1} ∪ {2ν₁ + ν₂ < 1 < 3ν₁ + ν₂}; F₄ (coordinates of BC1 §3.4): {2ν₁ < 1} ∪ {ν₁ + ν₂ + ν₃ − ν₄ < 1 < ν₁ + ν₂ + ν₃ + ν₄}; E₆, E₇, E₈: the 2, 8 and 16 alcoves of Barbasch–Ciubotaru §7.2. The type-A case is part of Tadić's classification of the unitary dual of GL(n), owned upstream by AutomorphicSpectralTheory §7.0b. (CH26, Theorem 6.9, PDF p. 18)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. By barbasch-moy-unitarity the question is the unitarity of spherical modules of the graded Hecke algebra at real parameter ν. The signature forms and the detecting Weyl types of SRU.5.27 determine the unitary regions; their constancy holds on each irreducible hermitian region. The case analysis is Barbasch (classical types), Ciubotaru (F₄, E₆) and Barbasch–Ciubotaru (E₇, E₈, and G₂, F₄ in their coordinates), and Tadić for GL(n); its Weyl-type signature calculations and characteristic-independent comparison are the targets of SRU.5.27, with the explicit output inequalities in SRU.5.28.

For PGL₂, d = 0 and U₀^g = A₀. For G = PSp₄ (dual type B₂), ν = (0, ¾) satisfies the B condition with i = 2, since ¾ < 1 − 0, and its highest-coroot value ¾ < 1 puts it in A₀; reading the C formula for G = PSp₄ would wrongly require ¾ < ½. For G₂, d = 1: U₀^g has the fundamental alcove {3ν₁ + 2ν₂ < 1} and the second alcove {2ν₁ + ν₂ < 1 < 3ν₁ + ν₂} in Barbasch–Ciubotaru's coordinates.

Additional inputs for this route: BC1, §3.2 Theorem, §3.3 Theorem, §3.4 Proposition, pp. 17–18.

*Needs:* SRU.5 / barbasch-moy-unitarity; SRU.5 / generic-unitary-region; SRU.5 / fundamental-alcove-unitary; SRU.5 / unbounded-not-unitary; SRU.5.27; AutomorphicSpectralTheory §7.0b.

### 5.12 Nonzero integral root values are not unitary (*integral-root-wall*)

In the setting of real-satake-parameter, if ν ∈ C₀ and ⟨α^∨, ν⟩ ∈ `ℤ_(>0)` for some positive coroot α^∨, then ν ∉ U₀^g (Ciubotaru–Harris Proposition 6.10). Equivalently, for a real or central-compact s with α^∨(s) = q^m, m ∈ ℤ ∖ {0}, the generic L(s) is not unitary (Corollary 6.32(2), in that sector; the real or central-compact sector). (CH26, Proposition 6.10, PDF p. 18)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting). ν real (s_c = 1 or central).

One proof route is as follows. A point with ⟨α^∨, ν⟩ = m ∈ `ℤ_(>0)` lies on an affine wall, hence in no open alcove; by generic-unitary-classification U₀^g is contained in a union of open alcoves intersected with `C_(0,h)`.

For PGL₂, ν with ⟨α^∨, ν⟩ = 2 gives an irreducible non-unitary X(ν).

*Needs:* SRU.5 / generic-unitary-classification.

### 5.13 Reduction of half-integral parameters (*half-integral-reduction*)

In the setting of real-satake-parameter, with 0 ≤ ε < ½: `C₀^(½+ε)` = ∅ unless ε ∈ {0, ¼}, and if G is quasi-simple of rank ≥ 2 then `C₀^(½+ε)` = ∅ unless ε = 0 ((6.12)). For ν = Σ νᵢωᵢ ∈ `C₀^(½)`, every νᵢ ∈ `½ℤ_(≥0)`, and if moreover ν ∈ U₀^g then every νᵢ ∈ {0, ½} ((6.13)). (CH26, §6.2, (6.11)–(6.13), PDF p. 19)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. Applying the condition to α^∨ and −α^∨ gives 2ε ∈ ½ℤ, so ε ∈ {0, ¼}. In rank ≥ 2 take simple coroots α₁^∨, α₂^∨ with β^∨ = α₁^∨ + α₂^∨ a coroot: ⟨β^∨, ν⟩ ∈ 2ε + ½ℤ and ∈ ε + ½ℤ force ε ∈ ½ℤ, so ε = 0. νᵢ = ⟨αᵢ^∨, ν⟩ ∈ `½ℤ_(≥0)`; by unbounded-not-unitary νᵢ ≤ 1, and νᵢ = 1 is excluded by genericity (wall ⟨αᵢ^∨, ν⟩ = 1), leaving {0, ½}.

For PGL₂ (rank one) ε = ¼ is possible: ⟨α^∨, ν⟩ = ¼ gives ⟨±α^∨, ν⟩ ∈ ¼ + ½ℤ; Ciubotaru–Harris use only ε = 0 there.

*Needs:* SRU.5 / half-integral-parameter; SRU.5 / unbounded-not-unitary; SRU.5 / generic-unitary-region.

### 5.14 Half-integral generic unitary points for PGL(n) (*half-integral-type-a*)

For G = PGL(n) in the setting of real-satake-parameter, write a dominant hermitian ν in standard coordinates as (a₁, …, a_k, −a_k, …, −a₁) for n = 2k and (a₁, …, a_k, 0, −a_k, …, −a₁) for n = 2k + 1, with a₁ ≥ ⋯ ≥ a_k ≥ 0; the generic unitary region is 0 ≤ a_k ≤ ⋯ ≤ a₁ < ½ ((6.15), Tadić). Then `U₀^(g,½)` = {0, ½ω_k} for n = 2k (the point a₁ = ⋯ = a_k = ¼) and `U₀^(g,½)` = {0} for n odd (Ciubotaru–Harris §6.3). (CH26, §6.3, PDF p. 20)

G = PGL(n), n ≥ 2; standard coordinates of Ciubotaru–Harris §6.3.

One proof route is as follows. For n = 2k, ν is half-integral for the adjoint representation iff a_k ∈ ¼ℤ and the consecutive differences νᵢ − νᵢ₊₁ lie in ½ℤ; inside (6.15) this leaves a₁ = ⋯ = a_k ∈ {0, ¼}, i.e. ν ∈ {0, ½ω_k}, and ½ω_k satisfies (6.15). For n odd, half-integrality forces every aᵢ ∈ ½ℤ, and (6.15) leaves only aᵢ = 0.

For PGL₂ (k = 1), `U₀^(g,½)` = {0, ½ω₁}, the complementary-series point with ⟨α^∨, ν⟩ = ½. For PGL₃, `U₀^(g,½)` = {0}.

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification; SRU.5 / spherical-hermitian-criterion.

### 5.15 Half-integral generic unitary points for SO(2n+1) (*half-integral-type-b*)

For G = SO(2n+1), with coroots α₁^∨ = 2ε₁, αᵢ^∨ = −εᵢ₋₁ + εᵢ (2 ≤ i ≤ n), weights ω₁ = ½(ε₁ + ⋯ + εₙ), ωᵢ = εᵢ + ⋯ + εₙ and highest coroot γ^∨ = 2εₙ (Ciubotaru–Harris §6.4): the only coroot of the maximal level r₀ = 2n − 1 is γ^∨ (Barbasch, Theorem 3.1), the unitary bound reads ν₁ + 2ν₂ + ⋯ + 2νₙ < 1, and `U₀^(g,½)` = {0, ½ω₁}; ⟨γ^∨, ½ω₁⟩ = ½, so ½ω₁ lies in A₀. (CH26, §6.4, PDF p. 20)

G = SO(2n+1); coordinates of Ciubotaru–Harris §6.4.

One proof route is as follows. By generic-unitary-classification every ν ∈ U₀^g has ⟨γ^∨, ν⟩ < 1, i.e. ν₁ + 2ν₂ + ⋯ + 2νₙ < 1. With νᵢ ∈ {0, ½} (half-integral-reduction) this forces ν₂ = ⋯ = νₙ = 0, leaving 0 and ½ω₁, and ½ω₁ ∈ A₀ is unitary (fundamental-alcove-unitary).

For SO(3) ≅ PGL₂ (n = 1), the result agrees with half-integral-type-a: {0, ½ω₁}.

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification; SRU.5 / fundamental-alcove-unitary.

### 5.16 Half-integral generic unitary points for PSp(2n) (*half-integral-type-c*)

For n ≥ 2, for G = PSp(2n), with coroots α₁^∨ = ε₁, αᵢ^∨ = −εᵢ₋₁ + εᵢ, weights ωᵢ = εᵢ + ⋯ + εₙ and highest coroot γ^∨ = εₙ₋₁ + εₙ (Ciubotaru–Harris §6.5): the maximal level is r₀ = n for n odd and n + 1 for n even, with the coroots (6.16), (6.17); the resulting bounds force ν₁ = ⋯ = `ν_(⌊n/2⌋)` = 0 and `Σ_(j > ⌊n/2⌋)` νⱼ < 1, leaving ½ωⱼ for j > ⌊n/2⌋, of which ½ωⱼ (j < n) lie on the wall ⟨γ^∨, ν⟩ = 1. Hence `U₀^(g,½)` = {0, ½ωₙ}, with ⟨γ^∨, ½ωₙ⟩ = ½. (CH26, §6.5, PDF p. 20)

G = PSp(2n); coordinates of Ciubotaru–Harris §6.5. n ≥ 2 for the displayed `ε_(n−1)`+ε_n formula; the rank-one case PSp₂ = PGL₂ is handled by half-integral-type-a.

One proof route is as follows. The coroots of level r₀ give the inequalities 2ν₁ + ν₂ + ⋯ < 1, …, displayed in §6.5 for n odd and even (generic-unitary-classification, after Barbasch Theorem 3.1). With νᵢ ∈ {0, ½} (half-integral-reduction) they force ν₁ = ⋯ = `ν_(⌊n/2⌋)` = 0 and at most one νⱼ = ½ with j > ⌊n/2⌋. For ⌊n/2⌋ < j < n, ⟨γ^∨, ½ωⱼ⟩ = 1, so ½ωⱼ is not generic; ½ωₙ ∈ A₀ is unitary (fundamental-alcove-unitary).

For PSp(2) ≅ PGL₂, {0, ½ω₁} as in type A. For PSp(4), the candidates ½ω₁ (excluded by ν₁ = 0) and ½ω₂ leave `U₀^(g,½)` = {0, ½ω₂}. For n=1 use PSp₂=PGL₂ and type A₁; do not interpret ε₀ in the rank ≥2 formula.

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification; SRU.5 / fundamental-alcove-unitary; SRU.5 / generic-unitary-region.

### 5.17 Half-integral generic unitary points for PSO(2n) (*half-integral-type-d*)

For G = PSO(2n), with coroots α₁^∨ = ε₁ + ε₂, αᵢ^∨ = −εᵢ₋₁ + εᵢ, weights ω₁ = ½(ε₁ + ⋯ + εₙ), ω₂ = ½(−ε₁ + ε₂ + ⋯ + εₙ), ωᵢ = εᵢ + ⋯ + εₙ (i ≥ 3) and highest coroot γ^∨ = εₙ₋₁ + εₙ (Ciubotaru–Harris §6.6): for n even the maximal level is r₀ = n − 1 with the coroots (6.18), and `U₀^(g,½)` = {0, ½ω₁, ½ω₂, ½ωₙ}; for n odd hermitian parameters need ν₁ = ν₂, which excludes ½ω₁ and ½ω₂, and `U₀^(g,½)` = {0, ½ωₙ}. All listed nonzero points pair with γ^∨ to ½ and lie in A₀. (CH26, §6.6, PDF p. 21)

G = PSO(2n), n ≥ 3; coordinates of Ciubotaru–Harris §6.6. For irreducible type D use n ≥ 4; D₃ is interpreted through A₃, and D₂ through A₁ × A₁.

One proof route is as follows. For n even the level-r₀ coroots (6.18) force ν₃ = ⋯ = `ν_(n/2)` = 0 and at most one of ν₁, ν₂, νⱼ (j > n/2) equal to ½ (generic-unitary-classification, half-integral-reduction). The points ½ωⱼ with n/2 < j < n lie on the wall ⟨γ^∨, ν⟩ = 1; ½ω₁, ½ω₂, ½ωₙ pair with γ^∨ to ½ and lie in A₀, hence are unitary. For n odd, w₀ν = −ν forces ν₁ = ν₂ (spherical-hermitian-criterion), excluding ½ω₁ and ½ω₂.

**Checks.**

- D₂ is reducible with root system A₁ × A₁; the simple-type formula is not applied at n = 2. D₃ has the A₃ list {0,½ω₃} in this numbering.

For PSO(8) (n = 4) the three nonzero points ½ω₁, ½ω₂, ½ω₄ are permuted by triality. For PSO(6) ≅ PGL₄ (n = 3), {0, ½ω₃} matches half-integral-type-a with k = 2 under the isomorphism.

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification; SRU.5 / fundamental-alcove-unitary; SRU.5 / spherical-hermitian-criterion.

### 5.18 Half-integral generic unitary points for G₂ (*half-integral-type-g2*)

For G = G₂ in Bourbaki coordinates (6.19), the unique coroot of the maximal level r₀ = 3 is β^∨ = 2α₁^∨ + α₂^∨, giving the unitary bound 2ν₁ + ν₂ < 1 ((6.20)); hence ν₁ = 0, ν₂ ∈ {0, ½}, and ½ω₂ lies on the wall ⟨γ^∨, ν⟩ = 1 for the highest coroot γ^∨ = 3α₁^∨ + 2α₂^∨. So `U₀^(g,½)` = {0} (Ciubotaru–Harris §6.7). (CH26, §6.7, PDF p. 22)

G = G₂; coordinates (6.19).

One proof route is as follows. The level bound is from Ciubotaru's classification (generic-unitary-classification, Ciubotaru F₄ paper Appendix B as cited). 2ν₁ < 1 with ν₁ ∈ ½ℤ gives ν₁ = 0; ν₂ < 1 gives ν₂ ∈ {0, ½}; ⟨3α₁^∨ + 2α₂^∨, ½ω₂⟩ = 1.

½ω₂ is the real part of the G₂ witness of g2-noncentral-witness, which is not generic for s_c = 1.

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification.

### 5.19 Half-integral generic unitary points for F₄ (*half-integral-type-f4*)

For G = F₄ in the coordinates (6.21), the unique coroot of the maximal level r₀ = 9 is β^∨ = (1, 1, 1, −1) = α₁^∨ + 2α₂^∨ + 4α₃^∨ + 2α₄^∨, giving ν₁ + 2ν₂ + 4ν₃ + 2ν₄ < 1 ((6.22)); hence ν₂ = ν₃ = ν₄ = 0, ν₁ ∈ {0, ½}, and ½ω₁ lies on the wall of the highest coroot γ^∨ = (2, 0, 0, 0). So `U₀^(g,½)` = {0} (Ciubotaru–Harris §6.8). (CH26, §6.8, PDF p. 22)

G = F₄; coordinates (6.21).

One proof route is as follows. The level bound comes from Ciubotaru's F₄ table (generic-unitary-classification). The inequality with νᵢ ∈ `½ℤ_(≥0)` leaves ν = 0 or ½ω₁, and ⟨γ^∨, ½ω₁⟩ = 1.

In the coordinates (6.21), ⟨(2,0,0,0), ½ω₁⟩ = ⟨(2,0,0,0), (½,0,0,0)⟩ = 1.

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification.

### 5.20 Half-integral generic unitary points for E₆ (*half-integral-type-e6*)

For G = E₆ in the coordinates (6.28), hermitian parameters satisfy ν₁ = ν₆ and ν₃ = ν₅; the unique coroot of the maximal level r₀ = 9 is β^∨ = α₁^∨ + α₂^∨ + 2α₃^∨ + 2α₄^∨ + 2α₅^∨ + α₆^∨ ((6.29)), giving 2ν₃ < 1, 2ν₄ < 1, 2ν₅ < 1 and ν₁ + ν₂ + ν₆ < 1; hence the only nonzero candidate is ½ω₂, which lies on the wall of the highest coroot. So `U₀^(g,½)` = {0} (Ciubotaru–Harris §6.11). (CH26, §6.11, PDF p. 24)

G = E₆; coordinates (6.28).

One proof route is as follows. The level bound is from Ciubotaru's E₆ paper and Barbasch–Ciubotaru §7.2.1 (generic-unitary-classification). ν₃ = ν₄ = ν₅ = 0; ν₁ = ν₆ with ν₁ + ν₂ + ν₆ < 1 forces ν₁ = ν₆ = 0; ½ω₂ pairs to 1 with γ^∨.

The hermitian condition is needed: ½ω₁ alone satisfies the level bound but is not hermitian for E₆ (w₀ ≠ −1).

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification; SRU.5 / spherical-hermitian-criterion.

### 5.21 Half-integral generic unitary points for E₇ (*half-integral-type-e7*)

For G = E₇ in the coordinates (6.26), the coroots of the maximal level r₀ = 9 are the four listed in (6.27) (labels 46–49 of Barbasch–Ciubotaru), giving 2ν₃, 2ν₄, 2ν₅, 2ν₆ < 1 and ν₁ + ν₂ + ν₇ < 1; the candidates ½ω₁, ½ω₂ lie on the wall of the highest coroot γ^∨ = −ε₇ + ε₈, while ⟨γ^∨, ½ω₇⟩ = ½. So `U₀^(g,½)` = {0, ½ω₇} (Ciubotaru–Harris §6.10). (CH26, §6.10, PDF p. 23)

G = E₇; coordinates (6.26).

One proof route is as follows. The level bound is from Barbasch–Ciubotaru §7.2.2 (generic-unitary-classification). The inequalities leave ν₃ = ⋯ = ν₆ = 0 and at most one of ν₁, ν₂, ν₇ equal to ½. ½ω₁, ½ω₂ are on the wall γ^∨ = 1; ½ω₇ is in A₀, hence unitary (fundamental-alcove-unitary).

½ω₇ is the extra E₇ point that fundamental-separators removes using the 56-dimensional representation (pairing ¾).

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification; SRU.5 / fundamental-alcove-unitary.

### 5.22 Half-integral generic unitary points for E₈ (*half-integral-type-e8*)

For G = E₈ in the coordinates (6.23)–(6.24), the coroots of the maximal level r₀ = 15 are the four listed in (6.25) (labels 89–92 of Barbasch–Ciubotaru), giving 2ν₂, 2ν₃, 4ν₄, 3ν₅, 2ν₆, 2ν₇ < 1 and ν₁ + ν₈ < 1; the candidates ½ω₁ and ½ω₈ lie on the wall of the highest coroot γ^∨ = ε₇ + ε₈. So `U₀^(g,½)` = {0} (Ciubotaru–Harris §6.9). (CH26, §6.9, PDF p. 22)

G = E₈; coordinates (6.23)–(6.24).

One proof route is as follows. The level bound is from Barbasch–Ciubotaru §7.2.3 (generic-unitary-classification). The inequalities leave ν₂ = ⋯ = ν₇ = 0 and ν₁, ν₈ ∈ {0, ½}, not both ½. ⟨γ^∨, ½ω₁⟩ = ⟨γ^∨, ½ω₈⟩ = 1.

In (6.24), ω₈ = ε₇ + ε₈, so ⟨ε₇ + ε₈, ½ω₈⟩ = 1.

*Needs:* SRU.5 / half-integral-reduction; SRU.5 / generic-unitary-classification.

### 5.23 Half-integral generic unitary spherical parameters (*half-integral-generic-unitary*)

In the setting of real-satake-parameter, `U₀^(g,½)` := U₀^g ∩ `C₀^(½)` is {0, `½ω_(n/2)`} for PGL(n), n even, and {0} for n odd; {0, ½ω₁} for SO(2n+1); {0, ½ωₙ} for PSp(2n); {0, ½ω₁, ½ω₂, ½ωₙ} for PSO(2n), n even, and {0, ½ωₙ} for n odd; {0, ½ω₇} for E₇; {0} for G₂, F₄, E₆, E₈ (Ciubotaru–Harris Theorem 6.14, numbering of §§6.3–6.11); every nonzero element lies in the fundamental alcove A₀, and `U₀^(g,½)` = {0} unless G is of type `A_(n−1)` (n even), B, C, D or E₇. (CH26, Theorem 6.14, PDF p. 19)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

One proof route is as follows. Assemble the nine type-by-type computations; the common strategy (Ciubotaru–Harris, proof of Theorem 6.14) is: the classification gives a maximal level r₀ ≥ 1 with ⟨α^∨, ν⟩ < 1 for all coroots of that level; the half-integral points satisfying these inequalities either lie on a reducibility wall (not generic) or are among the listed exceptions, all of which lie in A₀.

For G₂, a generic unitary spherical L(ν) with real ν half-integral for the adjoint representation is tempered.

*Needs:* SRU.5 / half-integral-type-a; SRU.5 / half-integral-type-b; SRU.5 / half-integral-type-c; SRU.5 / half-integral-type-d; SRU.5 / half-integral-type-g2; SRU.5 / half-integral-type-f4; SRU.5 / half-integral-type-e6; SRU.5 / half-integral-type-e7; SRU.5 / half-integral-type-e8.

### 5.24 Fundamental representations separate the extra half-integral points (*fundamental-separators*)

In the setting of half-integral-generic-unitary: `½ω_(n/2)` is not half-integral for the defining representation V(ω₁^∨) of SL(n) (n even); ½ω₁ is not half-integral for the defining representation V(ωₙ^∨) of Sp(2n) (G = SO(2n+1)); ½ωₙ is not half-integral for the spin representation V(ω₁^∨) of Spin(2n+1) (G = PSp(2n)); for G = PSO(2n), ½ωₙ is not half-integral for the spin representation V(ω₁^∨) and ½ω₁, ½ω₂ are not for the defining representation V(ωₙ^∨); and ½ω₇ is not half-integral for the 56-dimensional V(ω₇^∨) of E₇ (Ciubotaru–Harris Proposition 6.31). The pairings are ¼ in the classical cases and ¾ for E₇. For type D both the spin and the defining representation are needed. (CH26, Proposition 6.31, PDF p. 24)

Numbering of Ciubotaru–Harris §§6.3–6.11.

One proof route is as follows. By the highest-weight half-integrality test of LieHighestWeightPartII N5 it suffices to compute ⟨λ^∨, ν⟩ for the listed highest weights, which are ¼ (classical) and ¾ (E₇).

For PGL₂ (n = 2), ⟨ω₁^∨, ½ω₁⟩ = ¼ for the standard representation of SL₂(ℂ).

*Needs:* LieHighestWeightPartII N5 (highest-weight half-integrality); SRU.5 / half-integral-generic-unitary; RepresentationTheory/LieHighestWeight / Layer 4-the-classification-of-finite-dimensional-irreducibles.

### 5.25 The local generic temperedness test (*generic-temperedness-test*)

In the setting of real-satake-parameter, let s = s_c·s_ν with s_c = 1 or s_c central in G^∨ (the real or central-compact sector). If L(s) is generic and unitary, then s is geometric for the adjoint representation of G^∨ and for the fundamental representations of fundamental-separators iff ν = 0, i.e. iff L(s) = L(s_c) is tempered (Ciubotaru–Harris Corollary 6.32(1), corrected scope). As printed, for arbitrary s_c, the statement is false: see g2-noncentral-witness. (CH26, Corollary 6.32(1), PDF p. 25)

k a nonarchimedean local field of any characteristic with residue field 𝔽_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting). s = s_c·s_ν with s_c = 1 or s_c central in G^∨ (the real or central-compact sector).

One proof route is as follows. For central s_c, X(s_c s_ν) is the twist of X(s_ν) by the unitary character of G corresponding to s_c, so L(s) is generic unitary iff L(ν) is; WLOG ν dominant, so ν ∈ U₀^g. Geometric for the adjoint representation means ν ∈ `C₀^(½)`, so ν ∈ `U₀^(g,½)` (half-integral-generic-unitary). Every nonzero point of `U₀^(g,½)` fails half-integrality for a listed fundamental representation (fundamental-separators); hence ν = 0, and L(s) is tempered (spherical-tempered-criterion). The converse is immediate.

For G = PGL₂ and s real with ν = ½ω₁ (a complementary-series point), the standard representation of SL₂(ℂ) detects non-geometricity. The G₂ witness of g2-noncentral-witness lies outside the hypothesis (its s_c is not central).

*Needs:* SRU.5 / half-integral-generic-unitary; SRU.5 / fundamental-separators; SRU.5 / spherical-tempered-criterion; SRU.5 / generic-unitary-region.

### 5.26 The G₂ witness for noncentral compact parts (*g2-noncentral-witness*)

Let G be split G₂ over k and s_c ∈ T^∨ the involution with (aα₁^∨ + bα₂^∨)(s_c) = (−1)^a (α₁^∨ the short simple coroot); its centraliser in G^∨ has type A₁ × Ã₁. For ν = ½ω₂ and s = s_c s_ν, X(s) is irreducible, L(s) = X(s) is generic and unitary, s is geometric for every representation of G^∨, and ν ≠ 0. Hence Corollary 6.32(1) fails for noncentral s_c, and the real part ½ω₂ is an extraneous point of CS(G₂, 0). (CH26, Corollary 6.32(1), tested on the explicitly specified parameter, PDF p. 25)

G split G₂; s_c and ν as stated.

One proof route is as follows. On the positive coroots (a, b) = (1,0), (0,1), (1,1), (2,1), (3,1), (3,2), α^∨(s) = −1, `q^(1/2)`, −`q^(1/2)`, `q^(1/2)`, −`q^(1/2)`, −q, never `q^(±1)`; at the endpoint the stabiliser W_s is trivial; along the whole deformation use the general, not just regular, irreducibility criterion, so X(s) is irreducible (unramified-principal-series-irreducibility) and generic. w₀ = −1 fixes s_c and negates ν, so X(s) is hermitian; along t ↦ s_c `s_(tν)`, t ∈ [0, 1], the same computation gives irreducibility, and at t = 0 the representation is unitarily induced, so X(s) is unitary (deformation as in fundamental-alcove-unitary). Every weight of G₂(ℂ) lies in the root lattice and ν is half-integral for the adjoint representation, hence for all representations (half-integral-parameter: every weight of every representation of G₂(ℂ) lies in the root lattice).

L(s_ν) itself (real part only) is not generic: ⟨3α₁^∨ + 2α₂^∨, ν⟩ = 1, so ν ∉ U₀^g; the unitarity of L(s) is governed by the centraliser of s_c, not by U₀^g.

*Needs:* SRU.5 / unramified-principal-series-irreducibility; SRU.5 / fundamental-alcove-unitary; SRU.5 / half-integral-parameter; SRU.5 / spherical-hermitian-criterion; SRU.5.27, compact-centralizer signature comparison.

### 5.27 Signature and characteristic-independent Hecke comparison (*signature-hecke-comparison*)

For each reduced based root datum, each compact semisimple central character and its associated positive Hecke parameters, construct the long-intertwiner hermitian forms on spherical standard modules and compute their signatures on the detecting finite Weyl types. Prove constancy on each irreducible hermitian region and equivalence of positivity with unitarity of the corresponding spherical module. State the *-compatible affine-to-graded equivalence with the full lattice and centralizer action, not just a root-system type. These are the inputs used for the exclusion beyond a simple-root value 1 and for the all-type alcove theorem. Prove the comparison algebraically at the level of Hecke algebras, so it applies equally to mixed- and equal-characteristic local fields after the supplied Iwahori equivalence (BC1 §§1.2, 3.1–3.4 and 7.2; BCP §5.2, pp. 53–54; BC3 Theorems 1.3.1 and 1.4.1).

**The generic/sign adapter for split groups.** Let G = 𝐆(F) with 𝐆 a split connected reductive group over any nonarchimedean local field F with residue field 𝔽_q, a pinning (B, T, (x_α)) over O, K = 𝐆(O), I the preimage of B(𝔽_q) in K, w₀ ∈ K a representative of the longest element of W, and ψ_K the K-compatible generic character of U (trivial on x_α(𝔭) and nontrivial on x_α(O) for every simple root α, as in SRU.4.3). Prove that the I-fixed vectors of the Gelfand–Graev representation c-Ind_U^G ψ_K form the left H(G, I)-module H(G, I) ⊗_(H(K,I)) sgn, where sgn is the character T_s ↦ −1 of the finite Hecke algebra H(K, I) ≅ H(W, q): the function supported on U w₀ I with value ψ_K(u) at u w₀ (well defined because U ∩ w₀ I w₀⁻¹ = U(𝔭)) generates (c-Ind_U^G ψ_K)^I freely over the Bernstein subalgebra ℂ[X_*(T)] of SR.1 bernstein-presentation and is an eigenvector of every T_s, s ∈ S, with eigenvalue −1. Deduce that for every irreducible smooth π with π^I ≠ 0 the Whittaker dimension dim Hom_U(π, ψ_K) equals the multiplicity of sgn in the H(K, I)-module π^I, which is at most one; in particular π is ψ_K-generic iff sgn occurs in π^I. For adjoint 𝐆 the torus T(F) permutes the generic characters of U transitively, so the equivalence then holds for every generic character. (MP21, Theorem 3 with χ = 1, whose depth-zero proof imposes no restriction on the characteristic of F or on q, printed pp. 6–7; CS18, Theorem 1.1, cited by its locator.)

One proof route is as follows. G = ⊔_(x ∈ W̃) U x I by the Iwasawa decomposition of ReductiveGroupsPartII RG2.4 and the Iwahori–Bruhat decomposition of SR.1 iwahori-matsumoto, so an I-fixed function in c-Ind_U^G ψ_K is determined by its values at the x ∈ W̃ for which ψ_K is trivial on U ∩ x I x⁻¹. The Jacquet module of c-Ind_U^G ψ_K along the opposite unipotent radical is C_c^∞(T) (SR.2 geometric-lemma: only the open Bruhat cell supports ψ_K-equivariant functionals, as in SRU.3.7), and for a representation generated by its I-fixed vectors the map V^I → (V_(Ū))^(T(O)) is an isomorphism (SR.3.4 borel-casselman-block); hence (c-Ind_U^G ψ_K)^I is free of rank one over ℂ[X_*(T)] = C_c(T(O)\T/T(O)), generated by the displayed function. The equation T_s f = −f for a simple reflection s reduces, through the reduction K → 𝐆(𝔽_q) and the rank-one subgroup SL₂(𝔽_q) attached to s, to the character sum Σ_(u ∈ 𝔽_q) ψ₀(u) = 0 over the residue field, which leaves −1 after the identity coset is separated; this is the computation of Chan–Savin and is valid for every q. H(G, I) ⊗_(H(K,I)) sgn is free of rank one over ℂ[X_*(T)] on 1 ⊗ 1 (SR.1 bernstein-presentation, H(G, I) = ℂ[X_*(T)] ⊗ H(K, I) as vector spaces), so h ⊗ 1 ↦ h·f is an isomorphism. For the Whittaker dimension, Hom_U(π, ψ_K) ≅ Hom_G(π, Ind_U^G ψ_K) ≅ Hom_G(c-Ind_U^G ψ_K⁻¹, π̃) (SR.2.3 whittaker-functionals; smooth and compact induction from U are contragredient), the Iwahori block of SR.3.4 identifies this with Hom_(H(G,I))((c-Ind_U^G ψ_K⁻¹)^I, π̃^I) = Hom_(H(K,I))(sgn, π̃^I), and π̃^I is the dual H(K, I)-module of π^I under T_w ↦ T_(w⁻¹), which fixes sgn; the bound one holds because π^I is a subquotient of X(χ)^I ≅ H(W, q), the regular module, in which sgn occurs once.

**The generic/sign adapter for unramified groups.** Let G = 𝐆(k) with 𝐆 connected reductive, quasi-split over k and split over an unramified extension, K hyperspecial with reduction K → 𝐆(𝔽_q) (quasi-split over 𝔽_q by Lang's theorem), B = TU a Borel subgroup with T = Z_G(A) for the maximal split torus A, and I ⊂ K the preimage of a Borel subgroup of 𝐆(𝔽_q). H(G, I) satisfies the Iwahori–Matsumoto relations with the parameters q_s = [IsI : I] (SR.1 iwahori-matsumoto, nonsplit form, and SR.3.4 iwahori-components), and its finite part H(K, I) has the sign character T_s ↦ −1. The K-compatible datum is ψ_K = ∏_a ψ₀ ∘ Tr_(k_a/k), where a runs over the simple relative roots, U_a/U_(2a) is identified by the pinning with the unramified extension k_a attached to the Galois orbit of a, and ψ₀ is a character of k of conductor O; since the trace of an unramified extension is surjective on integers, ψ_K is trivial on U ∩ K⁺ and restricts to a generic character of the unipotent radical of the Borel subgroup of 𝐆(𝔽_q), and for the multipliable simple root of type `²A_(2n)` the depth-zero quotient of U_a at the hyperspecial vertex maps onto U_a/U_(2a), so the datum exists. Prove the same identification (c-Ind_U^G ψ_K)^I ≅ H(G, I) ⊗_(H(K,I)) sgn, free of rank one over the Bernstein subalgebra ℂ[T(k)/(I ∩ T(k))], and the same Whittaker/sign equivalence and dimension formula for irreducible π with π^I ≠ 0; the rank-one reductions are to SL₂(𝔽_q) and, for the multipliable root, to the unramified SU₃(𝔽_q), and both character sums equal −1. This is the notion of generic module transported by BC3 in SRU.6.2. (Luo26, Theorem (Corollary 5.1) and Corollary 5.2, pp. 1–2, stated there for finite extensions of ℚ_p, with Bruhat–Tits inputs valid over every nonarchimedean local field.)

**Checks.**

- In rank one the normalized intertwiner has positive form for 0 ≤ ⟨α^∨,ν⟩ < 1 and a detecting negative direction past 1; the reducible endpoint has separate trivial and Steinberg constituents.
- For the noncentral G₂ involution the centralizer is A₁ × A₁ and all six coroot values listed in SRU.5.26 avoid q and q⁻¹; using the ambient real G₂ chamber would give the wrong answer.
- At q = 2 and q = 3 the two finite-Hecke eigenvalues are respectively (2,−1) and (3,−1), still distinct over ℂ; no good-prime restriction is inserted.
- For the split torus 𝐆 = 𝔾_m, U = 1, W = 1, H(K, I) = ℂ and sgn is the trivial character; c-Ind_U^G ψ_K = C_c^∞(F^×), whose O^×-fixed vectors form ℂ[X_*(T)] = ℂ[ℤ], free of rank one on the indicator of O^×; every unramified character has Whittaker dimension 1, the multiplicity of sgn in its one-dimensional I-fixed space.
- For GL₂(F) the trivial representation has π^I the trivial character of H(W, q) (T_s acts by q), in which sgn has multiplicity 0, and Hom_U(1, ψ_K) = 0; the Steinberg representation has St^I = sgn and Whittaker dimension 1; an irreducible unramified principal series has π^I ≅ H(W, q), in which sgn occurs once, and is generic with one-dimensional Whittaker space, in agreement with the GL₂ multiplicity-one theorem of SR.2.3. For the SL₂(ℚ₃) constituent of SRU.4.3 with T_s = 3 on its one-dimensional I-fixed space the formula gives Whittaker dimension 0 for ψ_K, although that constituent is generic for a character of conductor ℤ₃: the formula is for ψ_K only.
- For 𝐆 = SL₂ over 𝔽₂((t)), q = 2: the character sum over 𝔽₂ is 1 + (−1) = 0, the eigenvalues 2 and −1 of T_s are distinct, and sgn is detected; residue characteristic 2 and equal characteristic are both admitted.
- For the unramified quasi-split SU₃(k) the datum on the multipliable root group U_a/U_(2a) ≅ k' (k'/k unramified quadratic) is ψ₀ ∘ Tr_(k'/k), trivial on 𝔭' and nontrivial on O' because Tr(O') = O; a datum ψ₁ ∘ Tr_(k'/k) with ψ₁ of conductor 𝔭 is trivial on O' and does not restrict to a generic character of the reduction, so it is not depth-zero generic at the hyperspecial vertex, and the Hecke-module identification is not asserted for it.

*Needs:* SRU.2 invariant forms; SmoothRepresentationsOfLocalGroups SR.1.5 and SR.3.4; ReductiveGroupsPartII RG2.5; LieHighestWeight weight spaces. For the two generic/sign adapters: SmoothRepresentationsOfLocalGroups SR.1 / iwahori-matsumoto; SR.1 / bernstein-presentation; SR.2 / whittaker-functionals; SR.2 / compact-induction; SR.2 / geometric-lemma; SR.3.4 / borel-casselman-block; SR.3.4 / iwahori-components; ReductiveGroupsPartII RG2.3 / hyperspecial-vertices; RG2.3 / reductive-quotient-of-special-fibre; RG2.4 / iwasawa-decomposition; ReductiveGroups Layer 7.

The highest-weight half-integrality test consumed from LieHighestWeightPartII N5 says that for adjoint-half-integral ν, all weights of V(λ^∨) pair in ½ℤ exactly when λ^∨ does. On PGL₂, the standard highest weight pairs with ½ω₁ to ¼, so that representation fails the test even though the adjoint test passes (CH26 Lemma 6.30, p. 24).

### 5.28 Explicit classical and exceptional regions (*explicit-regions*)

The condition for dual types B and D in SRU.5.11 (G = PSp(2n) and G = PSO(2n)) has the following precise meaning in the coordinates of BC1 §3.3. After the dominant ordering and, in type D, the sign symmetry of the first standard coordinate, write 0 ≤ a₁ ≤ ⋯ ≤ aₙ < 1. Put a₀ = 0 solely for this endpoint convention. There is an index 1 ≤ i ≤ n such that aᵢ < 1−aᵢ₋₁, and, if i < n, 1−aᵢ₋₁ < aᵢ₊₁ < ⋯ < aₙ. For each j with i ≤ j < n, the open interval (aⱼ,aⱼ₊₁) contains an odd number, counted with multiplicity, of the values 1−aₗ for 1 ≤ l < i. Retain the hermitian condition from SRU.5.6. This includes the rank-one range 0 ≤ a₁ < 1 without referring to an out-of-range coordinate (BC1 §3.3, p. 18).

For E₆, E₇ and E₈, let bⱼ(ν) = ⟨βⱼ,ν⟩, where the coroots βⱼ are defined by the vectors below in the standard eight-coordinate realizations of CH26 §§6.9–6.11. Restrict throughout to dominant hermitian ν. A row (L,H) denotes the set on which every bⱼ with j in L is strictly below 1 and every bⱼ with j in H is strictly above 1. The unitary region is the union of the following rows. The dominant inequalities are imposed in every row, including chamber faces where a simple-root value is zero (BC1 §7.2.1–§7.2.4, pp. 46–47).

| Type | L | H |
| --- | --- | --- |
| E6 | 36 | ∅ |
| E6 | 34 | 35 |
| E7 | 63 | ∅ |
| E7 | 61 | 62 |
| E7 | 58, 59 | 60 |
| E7 | 53, 54, 55 | 56, 57 |
| E7 | 46, 47, 48, 49 | 50, 51, 52 |
| E7 | 53, 59 | 56 |
| E7 | 49, 53, 54 | 52, 56 |
| E7 | 47, 48, 49, 53 | 51, 52 |
| E8 | 120 | ∅ |
| E8 | 113, 114 | 115 |
| E8 | 109, 110 | 111, 112 |
| E8 | 91, 92, 97, 98 | 95, 96, 101 |
| E8 | 90, 91, 92, 97 | 94, 95, 96 |
| E8 | 89, 90, 91, 92 | 93, 94, 95, 96 |
| E8 | 104, 110 | 107, 112 |
| E8 | 104, 105, 106 | 107, 108 |
| E8 | 118 | 119 |
| E8 | 97, 110 | 101, 112 |
| E8 | 97, 105, 106 | 101, 108 |
| E8 | 116 | 117 |
| E8 | 97, 98, 106 | 101, 102 |
| E8 | 97, 98, 99 | 96, 101, 102 |
| E8 | 97, 98, 99, 100 | 101, 102, 103 |
| E8 | 114 | 112 |

The next table gives 2βⱼ, so every listed integer vector is divided by 2. The labels are local to their type; no enumeration of unstated roots is assumed.

| Type | j | 2βⱼ |
| --- | --- | --- |
| E6 | 34 | (-1,1,-1,1,1,-1,-1,1) |
| E6 | 35 | (-1,-1,1,1,1,-1,-1,1) |
| E6 | 36 | (1,1,1,1,1,-1,-1,1) |
| E7 | 46 | (-1,1,-1,1,1,-1,-1,1) |
| E7 | 47 | (-1,1,1,-1,-1,1,-1,1) |
| E7 | 48 | (1,-1,-1,1,-1,1,-1,1) |
| E7 | 49 | (0,0,0,0,2,2,0,0) |
| E7 | 50 | (-1,-1,1,1,1,-1,-1,1) |
| E7 | 51 | (-1,1,-1,1,-1,1,-1,1) |
| E7 | 52 | (1,-1,-1,-1,1,1,-1,1) |
| E7 | 53 | (1,1,1,1,1,-1,-1,1) |
| E7 | 54 | (-1,-1,1,1,-1,1,-1,1) |
| E7 | 55 | (-1,1,-1,-1,1,1,-1,1) |
| E7 | 56 | (1,1,1,1,-1,1,-1,1) |
| E7 | 57 | (-1,-1,1,-1,1,1,-1,1) |
| E7 | 58 | (1,1,1,-1,1,1,-1,1) |
| E7 | 59 | (-1,-1,-1,1,1,1,-1,1) |
| E7 | 60 | (1,1,-1,1,1,1,-1,1) |
| E7 | 61 | (1,-1,1,1,1,1,-1,1) |
| E7 | 62 | (-1,1,1,1,1,1,-1,1) |
| E7 | 63 | (0,0,0,0,0,0,-2,2) |
| E8 | 89 | (1,-1,1,1,1,1,-1,1) |
| E8 | 90 | (1,1,-1,1,1,-1,1,1) |
| E8 | 91 | (1,1,1,-1,-1,1,1,1) |
| E8 | 92 | (-1,-1,-1,1,-1,1,1,1) |
| E8 | 93 | (-1,1,1,1,1,1,-1,1) |
| E8 | 94 | (1,-1,1,1,1,-1,1,1) |
| E8 | 95 | (1,1,-1,1,-1,1,1,1) |
| E8 | 96 | (-1,-1,-1,-1,1,1,1,1) |
| E8 | 97 | (0,0,0,0,0,0,-2,2) |
| E8 | 98 | (-1,1,1,1,1,-1,1,1) |
| E8 | 99 | (1,-1,1,1,-1,1,1,1) |
| E8 | 100 | (1,1,-1,-1,1,1,1,1) |
| E8 | 101 | (0,0,0,0,0,-2,0,2) |
| E8 | 102 | (-1,1,1,1,-1,1,1,1) |
| E8 | 103 | (1,-1,1,-1,1,1,1,1) |
| E8 | 104 | (0,0,0,0,-2,0,0,2) |
| E8 | 105 | (-1,1,1,-1,1,1,1,1) |
| E8 | 106 | (1,-1,-1,1,1,1,1,1) |
| E8 | 107 | (0,0,0,-2,0,0,0,2) |
| E8 | 108 | (-1,1,-1,1,1,1,1,1) |
| E8 | 109 | (0,0,-2,0,0,0,0,2) |
| E8 | 110 | (-1,-1,1,1,1,1,1,1) |
| E8 | 111 | (0,-2,0,0,0,0,0,2) |
| E8 | 112 | (1,1,1,1,1,1,1,1) |
| E8 | 113 | (2,0,0,0,0,0,0,2) |
| E8 | 114 | (-2,0,0,0,0,0,0,2) |
| E8 | 115 | (0,2,0,0,0,0,0,2) |
| E8 | 116 | (0,0,2,0,0,0,0,2) |
| E8 | 117 | (0,0,0,2,0,0,0,2) |
| E8 | 118 | (0,0,0,0,2,0,0,2) |
| E8 | 119 | (0,0,0,0,0,2,0,2) |
| E8 | 120 | (0,0,0,0,0,0,2,2) |

**Checks.**

- At ν = 0 all bⱼ are 0, so the first row of each type holds and every row with nonempty H fails. This gives the tempered parameter and detects reversed inequalities.
- The displayed E₆, E₇ and E₈ unions have respectively 2, 8 and 16 rows. Their highest coroots are β₃₆, β₆₃ and β₁₂₀; the Euclidean squared length of each is 2, matching the simply-laced normalization.
- In type B₂, (a₁,a₂) = (0,¾) uses i = 2 and gives a₂ < 1−a₁. In B₃, (1/5,2/5,9/10) uses i = 2, and exactly the one number 4/5 lies between 2/5 and 9/10. A parity condition allowing zero such numbers would admit the wrong regions.

*Needs:* SRU.5.27; LieHighestWeight Layers 1–2 for the fixed root pairing; BC1 §§3.3 and 7.2.

### Examples

In type A₁ the nonzero adjoint-half-integral unitary point is ½ω₁; its pairing with the standard dual highest weight is ¼, excluding geometricity for all representations. For G₂ the six positive-coroot values at the noncentral witness are −1, q^(1/2), −q^(1/2), q^(1/2), −q^(1/2), −q: none is q or q⁻¹ for q ≥ 2. At the same real part without the compact sign, the highest coroot has value q, so the principal series is reducible. For E₇ the exceptional point pairs to ¾ with the 56-dimensional highest weight.

### Dependencies

The statement carriers and the proposed proof inputs are the individual Needs lines above. This layer consumes SRU.0–SRU.2, the Whittaker heredity input of SRU.3.7 and its characteristic-independent generic/sign adapter in SRU.5.27. The root and weight calculations consume LieHighestWeight and LieHighestWeightPartII N5; signature comparisons are targets of this layer.

## Layer SRU.6: Unramified nonsplit groups

### 6.1 The τ-fixed dual group and the split group G(τ) (*tau-fixed-dual-group*)

Let k a nonarchimedean local field, G = 𝐆(k) with 𝐆 quasi-simple of adjoint type, quasi-split, split over an unramified extension and not split, with k'/k the unramified extension of least degree d splitting 𝐆; A a maximal split torus, M = Z_G(A), K a special maximal compact subgroup attached to A, B ⊃ A a Borel subgroup (Ciubotaru–Harris §7). The inner class of G gives a pinned automorphism τ of G^∨ of order d ∈ {2, 3}, normalised by τ(`X_(α^∨)`) = `X_(τ(α^∨))` on root vectors. Unramified characters of M form the torus T'^∨ = Spec ℂ[Λ(M)] with X^*(T'^∨) = X^*(T^∨)^τ and W(G, A) = W^τ ((7.1)); the map η' : T^∨ ⋊ ⟨τ⟩ → T'^∨, (s, τ) ↦ η(s), induces a bijection between τ-conjugacy classes of semisimple elements of G^∨ and W^τ-orbits in T'^∨ ((7.2)). X(s) = i_B(χ_s) and L(s) for s ∈ T'^∨ are as in SRU.5. G^∨(τ) := {g ∈ G^∨ : τ(g) = g} is connected reductive (G^∨ simply connected), and G(τ) is the split k-group with dual G^∨(τ): for the types `²A_(2n−1)`, `²A_(2n)`, ²D_n, ³D₄, ²E₆ of G, G(τ) has type B_n, C_n, `C_(n−1)`, G₂, F₄ respectively (Table 1). For real ν ∈ t'^∨_ℝ = (t^∨_ℝ)^τ write L^G(ν) and `L^(G(τ))(ν)`. (CH26, §7, (7.1)–(7.3) and Table 1, PDF p. 25)

k a nonarchimedean local field, G = 𝐆(k) with 𝐆 quasi-simple of adjoint type, quasi-split, split over an unramified extension and not split, with k'/k the unramified extension of least degree d splitting 𝐆; A a maximal split torus, M = Z_G(A), K a special maximal compact subgroup attached to A, B ⊃ A a Borel subgroup (Ciubotaru–Harris §7).

One proof route is as follows. (7.1)–(7.2) are Borel's description of the unramified L-group parameters (Borel79, §6, Lemma 6.4 and Proposition 6.7), which SR.4 frobenius-component-invariants and spherical-parameter state for unramified groups. Connectedness of G^∨(τ): fixed points of a semisimple automorphism of a simply connected group are connected (Steinberg68, Theorem 8.1); its type is read off from the folded Dynkin diagram, giving Table 1.

The defining object has the following API.

- G^∨(τ) := the fixed subgroup of the pinned automorphism τ of G^∨.
- G^∨(τ) is connected reductive when G^∨ is simply connected.
- G(τ), the split group over k with full root datum dual to G^∨(τ); its isogeny is retained and it need not be adjoint.
- Table 1: `²A_(2n−1)` ↦ B_n, `²A_(2n)` ↦ C_n, ²D_n ↦ `C_(n−1)`, ³D₄ ↦ G₂, ²E₆ ↦ F₄.
- X^*(T'^∨) = X^*(T^∨)^τ and W(G, A) = W^τ.
- Semisimple τ-conjugacy classes of G^∨ ≃ W^τ-orbits in T'^∨ via η'.

**Checks.**

- For G = PSU(2,2), the split companion G is of type B₂ (SO₅).
- For G of type ³D₄, τ has order 3 and the split companion G is of type G₂.
- The quasi-split PSU₃ splits over the unramified quadratic extension and therefore also over the unramified extension of degree 4; the least splitting degree is d = 2, the order of τ, whereas the quartic extension would give 4.
- For τ = id (G split), G^∨(τ) = G^∨ and the split companion G = G.
- The split companion is defined by the dual fixed-group root datum; for PSU₃ its dual is SO₃ and its companion is SL₂. No subgroup embedding into PSU₃ is part of this construction: a root-system label alone does not define such an embedding.
- For PSU₃ the fixed dual is SO₃ and the split companion is Sp₂=SL₂, not PGL₂. Type A₁ alone does not determine the isogeny.

For G = PSU(2, 2) (²A₃), G^∨ = SL₄(ℂ), G^∨(τ) = Sp₄(ℂ) and G(τ) = SO₅, of type B₂. For G = PSU(3) (²A₂), G^∨(τ) = SO₃(ℂ) and G(τ) = Sp₂ = SL₂, of type C₁.

Additional inputs for this route: BC3, §6.2 before Corollary 6.2.6, p. 29.

*Needs:* SmoothRepresentationsOfLocalGroups SR.4 / frobenius-component-invariants; SmoothRepresentationsOfLocalGroups SR.4 / spherical-parameter; ReductiveGroupsPartII RG2.5 / pinned-automorphisms; ReductiveGroupsPartII RG2.5 / galois-action-on-dual-group; SRU.5 / real-satake-parameter.

### 6.2 Unitary transfer from nonsplit unramified to split groups (*nonsplit-unitary-transfer*)

In the setting of tau-fixed-dual-group, for every real ν ∈ t'^∨_ℝ, L^G(ν) is unitary iff `L^(G(τ))(ν)` is unitary, and generic unitary iff `L^(G(τ))(ν)` is generic unitary (Ciubotaru–Harris Theorem 7.4, a case of Barbasch–Ciubotaru 2013 Corollary 6.2.6). Barbasch–Ciubotaru assume characteristic zero (§1.3); Ciubotaru–Harris note that the assumption is unnecessary, the statement being one about graded Hecke algebras. (CH26, Theorem 7.4, PDF p. 26)

k a nonarchimedean local field, G = 𝐆(k) with 𝐆 quasi-simple of adjoint type, quasi-split, split over an unramified extension and not split, with k'/k the unramified extension of least degree d splitting 𝐆; A a maximal split torus, M = Z_G(A), K a special maximal compact subgroup attached to A, B ⊃ A a Borel subgroup (Ciubotaru–Harris §7). ν real.

One proof route is as follows. Use the arbitrary-root-datum unitary equivalences of BC3 Theorems 1.3.1 and 1.4.1 and Corollary 6.2.6, retaining the sign type that detects genericity. Prove the affine-to-graded *-comparison on root data and positive parameters, independently of local-field characteristic. Identify the Hecke parameters and lattice of G with those of its split companion; transport invariant hermitian forms and the spherical and sign types in both directions. This includes the Sp(2n) versus PSp(2n) isogeny adapter, rather than silently applying an adjoint-only classification. Genericity on both sides is read through the generic/sign adapters of SRU.5.27: for G with the K-compatible datum ψ_K of the unramified adapter, and for the split companion G(τ) with its own ψ_K, L(ν) is generic iff its I-fixed module contains the sign character of the finite Hecke algebra, which is the notion of generic module that BC3 transport.

For ν = 0 both sides are unitary principal series and the statement is immediate. For G = PSU(2,2) the generic unitary real spherical parameters are those of SO₅ (type B₂) in SRU.5 generic-unitary-classification.

Additional inputs for this route: BC3, §1.3, p. 3; Corollary 6.2.6, p. 29; BC3, §1.3, Theorem 1.3.1; §1.4, Theorem 1.4.1, pp. 3–4; §6.2, Corollary 6.2.6 and Example 6.2.7, p. 29.

*Needs:* SRU.6 / tau-fixed-dual-group; SRU.5 / barbasch-moy-unitarity; SRU.5 / spherical-generic-criterion; SmoothRepresentationsOfLocalGroups SR.3; SRU.5.27, lattice and generic/sign comparison.

### 6.3 The generic temperedness test for nonsplit unramified groups (*nonsplit-generic-temperedness*)

In the setting of tau-fixed-dual-group, assume G is not the quasi-split form of PSU(2n+1), and let s = s_c s_ν ∈ T'^∨ with s_c = 1 or central. If L^G(s) is generic and unitary, then s is geometric with respect to all finite-dimensional representations of G^∨ ⋊ ⟨τ⟩ iff ν = 0, i.e. iff L^G(s) = L^G(s_c) is tempered (Ciubotaru–Harris Corollary 7.5, with the parameter hypotheses of SRU.5 generic-temperedness-test; the noncentral-compact counterexample). The representations used are the adjoint representation (τ-stable, whose restriction contains the adjoint representation of G^∨(τ)), V ⊕ V^τ for G^∨ = SL(2n) (restricting to two copies of the defining representation of Sp(2n)), and the sum of the two half-spin representations for G^∨ = Spin(2n) (restricting to two copies of the spin representation of Spin(2n−1)). (CH26, Corollary 7.5, PDF p. 26)

k a nonarchimedean local field, G = 𝐆(k) with 𝐆 quasi-simple of adjoint type, quasi-split, split over an unramified extension and not split, with k'/k the unramified extension of least degree d splitting 𝐆; A a maximal split torus, M = Z_G(A), K a special maximal compact subgroup attached to A, B ⊃ A a Borel subgroup (Ciubotaru–Harris §7). G not the quasi-split PSU(2n+1) s_c = 1 or central. A compact part called central means central in the full L-dual group and compatible with a unitary unramified character twist; being central merely in the abelian parameter torus is insufficient. Otherwise keep the compact part equal to one.

One proof route is as follows. By nonsplit-unitary-transfer, `L^(G(τ))(ν)` is generic unitary. Restrictions to G^∨(τ) of the listed representations of G^∨ ⋊ ⟨τ⟩ contain the adjoint representation of G^∨(τ) and the fundamental representations of SRU.5 fundamental-separators for the type of G(τ); for the exceptional G(τ) (G₂, F₄) the adjoint representation suffices since `U₀^(g,½)` = {0}. SRU.5 generic-temperedness-test applied to G(τ) gives ν = 0.

For G of type ²E₆, G(τ) = F₄ and the adjoint representation alone forces ν = 0. For the quasi-split PSU(2n+1) the argument fails (odd-unitary-residual).

*Needs:* SRU.6 / nonsplit-unitary-transfer; SRU.5 / generic-temperedness-test; SRU.5 / fundamental-separators.

### 6.4 The residual candidate for the odd quasi-split unitary group (*odd-unitary-residual*)

Let G be the quasi-split form of PSU(2n+1): G^∨ = SL(2n+1, ℂ), G^∨(τ) = SO(2n+1, ℂ), G(τ) = Sp(2n). Assume L^G(ν) is generic and unitary, ν is real, and the geometric half-integrality test holds for every finite-dimensional representation of the ambient dual SL(2n+1,ℂ). Under these hypotheses, the argument of nonsplit-generic-temperedness leaves the two possibilities ν = 0 and ν = ½ωₙ (the G(τ)-weight in the numbering of Ciubotaru–Harris §6.5): the adjoint representation of G^∨ restricts to contain the adjoint representation of G^∨(τ), which leaves {0, ½ωₙ} (SRU.5 half-integral-type-c for PSp(2n)), and ½ωₙ is excluded for PSp(2n) only by the spin representation of Spin(2n+1, ℂ), which does not factor through SO(2n+1, ℂ) and so does not occur in any representation of SL(2n+1, ℂ) (Ciubotaru–Harris Remark 7.6). This is not an automorphic counterexample. (CH26, Remark 7.6, PDF p. 27)

G the quasi-split adjoint unitary group in 2n + 1 variables over k. L^G(ν) generic unitary, ν real, and the half-integrality condition holds in every finite-dimensional ambient-dual representation; the Sp/PSp comparison requires the full-isogeny adapter of SRU.6.2.

One proof route is as follows. nonsplit-unitary-transfer and SRU.5 half-integral-type-c for PSp(2n) give ν ∈ {0, ½ωₙ}. Representations of SL(2n+1, ℂ) restrict to SO(2n+1, ℂ), on which the centre of Spin(2n+1, ℂ) acts trivially; the spin representation is faithful on that centre, so it is not a constituent.

For n = 1 (PSU(3)), G(τ) = SL₂ and the residual candidate is ½ω₁, the half-integral complementary-series point of SL₂.

*Needs:* SRU.6 / nonsplit-unitary-transfer; SRU.5 / half-integral-type-c; SRU.5 / fundamental-separators; SRU.6.2, full-isogeny adapter.

### Examples

For PSU₃, the pinned fixed dual is SO₃ and the split companion is Sp₂ = SL₂. Replacing it by PGL₂ changes the weight lattice and introduces a spin representation which does not descend to SO₃. For ²A₃ the companion is SO₅, for ³D₄ it is G₂, and for ²E₆ it is F₄. At ν = 0 the transfer compares unitary principal-series spherical constituents on both sides.

### Dependencies

The statement carriers and the proposed proof inputs are the individual Needs lines above. This layer consumes SRU.2, SRU.5 and the pinned-dual-group supplier contract. The full-isogeny and generic/sign comparison is the target in SRU.6.2; no adjoint companion is assumed.

## Layer SRU.7: Kazhdan–Lusztig parameters and spherical complementary series

### 7.1 The Aubert–Zelevinsky involution (*aubert-involution*)

Let G = 𝐆(F) be reductive over a nonarchimedean local field with minimal parabolic B and simple roots Δ, and R(G) the Grothendieck group of finite-length smooth complex representations. D_G := `Σ_(J⊆Δ)` `(−1)^(|J|)` `i_(P_J)` ∘ `r_(P_J)` on R(G), with normalised induction and Jacquet functors of the standard parabolics P_J (Aubert Définition 1.5). D_G commutes with the contragredient, satisfies D_G ∘ `i_(P_J)` = `i_(P_J)` ∘ `D_(L_J)` and `r_(P_J)` ∘ D_G = Ad(w) ∘ `D_(L_(J'))` ∘ `r_(P_(J'))`, where w is the longest element of {x ∈ W : x⁻¹(J) ⊂ Φ⁺}, J' = w⁻¹(J), and Ad(w) transports representations of `L_(J')` to L_J (Théorème 1.7(1)–(2); Ban02 Theorem 3.1(3)), is an involution, D_G² = id (1.7(3)), and acts on an irreducible cuspidal π by `(−1)^(|Δ|)` (1.7(4)). For irreducible π, ±D_G(π) is irreducible for a unique sign (Corollaire 3.9); AZ(π) denotes this irreducible representation. AZ preserves cuspidal support, AZ(1_G) = St_G for split G, and for GL_n it is Zelevinsky's involution (Théorème 2.3), the involution of SR.5.3. Use Aubert’s corrected exact resolution in the 1996 erratum to prove irreducibility up to sign. The same target over positive-characteristic local fields uses exact complex Jacquet functors and the same Bruhat filtration; no characteristic-zero assumption is inserted into that algebraic argument. (Aub96, corrected exact resolution theorem, pp. 4687–4690, PDF p. 1)

G reductive over a nonarchimedean local field; representations of finite length.

One proof route is as follows. D_G is additive and well defined on R(G): i_P is exact and preserves finite length (SR.2 parabolic-induction; SR.3 finite-length (1)); r_P is exact over ℂ (SR.2 jacquet-lemma), takes admissible to admissible (SR.2 jacquet-invariants) and finitely generated to finitely generated (SR.2 jacquet-module), hence finite length to finite length (SR.3 finite-length (2)). Théorème 1.7(2) is the geometric lemma (SR.2 geometric-lemma) summed with signs over the subsets J; (3) follows from (2) by induction on the semisimple rank and (4) for cuspidals; (1) uses Casselman's duality of r_P with the contragredient. Use the corrected exact resolution of Aub96, pp. 4687–4690: filter by Bruhat support, identify the graded differential with the parabolic combinatorial complex, and use its exactness to prove concentration in the required degree. Combine this with Aub95 Corollary 3.9; Ban02 Theorem 3.1 gives an independent statement of the endpoint. Cuspidal support: every term `i_(P_J)` ∘ `r_(P_J)(π)` has the cuspidal support of π (SR.3 cuspidal-support). AZ(1) = St for split G: by Théorème 1.7(2) with J = ∅, r_B(D_G[1]) = ±Ad(w₀)(r_B 1) = ±`δ_B^(1/2)`, a single exponent; among the constituents of i_B(`δ_B^(1/2)`) only St_G has normalised Jacquet module `δ_B^(1/2)` (SR.3.4 steinberg; SRU.4 rodier-steinberg-series), so AZ(1) = St_G.

The defining object has the following API.

- D_G : R(G) →+ R(G), `Σ_(J ⊆ Δ)` `(−1)^(|J|)` [`i_(P_J)` (`r_(P_J)` π)].
- D_G (D_G x) = x.
- D_G ∘ `i_(P_J)` = `i_(P_J)` ∘ `D_(L_J)`.
- `r_(P_J)` ∘ D_G = Ad(w) ∘ `D_(L_(J'))` ∘ `r_(P_(J'))`, with w the longest element of W satisfying w⁻¹(J) ⊂ Φ⁺ and J' = w⁻¹(J).
- D_G [π] = `(−1)^(|Δ|)` [π] for irreducible cuspidal π.
- AZ(π), the irreducible representation with [AZ(π)] = ± D_G [π].
- AZ(π) and π have the same cuspidal support.
- For GL_n, AZ agrees with the Zelevinsky involution of SR.5.3 (Z(m) ↦ L(m)).
- AZ(1_G) = St_G for split G.

**Checks.**

- For G = GL₂(ℚ_p), D_G[1] = [i_B(`δ_B^(−1/2)`)] − [1] = [St], so AZ(1) = St.
- For G a torus (Δ = ∅), D_G = id.
- In type A₂ with J = {α₁}, the longest w with w⁻¹(α₁) > 0 is s₂s₁, and w⁻¹(α₁) = α₂, so J' = {α₂} and the comparison runs from `L_(α₂)` to `L_(α₁)`; reading J' = w(J) would give {−α₁ − α₂}, which is not a set of simple roots.
- For a supercuspidal π of GL₂(ℚ_p), D_G[π] = −[π] and AZ(π) = π.
- D_G[1] is the class of an irreducible only up to sign in general: for PGL₃, D_G[1] = [St] while for a supercuspidal of PGL₂ it is −[π]; AZ takes the irreducible representative, not D_G itself.
- In rank one D_G[1] = [i_B(δ_B^(−1/2))] − [1] = [St], while D_G[σ] = −[σ] for a supercuspidal σ. In rank two D_G[1] = [St] and D_G[σ] = [σ]; these values fix the global sign convention.

For GL₂(ℚ_p): AZ(1) = St, AZ(St) = 1, and AZ fixes every irreducible principal series and every supercuspidal. D_G² = id on R(G).

Additional inputs for this route: Aub95, §1, Définition 1.5 and Théorème 1.7, p. 2181; Aub95, §2, Théorème 2.3, p. 2185; Aub95, §3, Corollaire 3.9, p. 2189; CH26, §4.2, Proposition 4.5 and proof, p. 12; Ban02, §3, Theorem 3.1(1)–(6), p. 678.

*Needs:* SmoothRepresentationsOfLocalGroups SR.2 / parabolic-induction; SmoothRepresentationsOfLocalGroups SR.2 / jacquet-module; SmoothRepresentationsOfLocalGroups SR.2 / jacquet-lemma; SmoothRepresentationsOfLocalGroups SR.2 / jacquet-invariants; SmoothRepresentationsOfLocalGroups SR.2 / geometric-lemma; SmoothRepresentationsOfLocalGroups SR.3 / finite-length; SmoothRepresentationsOfLocalGroups SR.3 / cuspidal-support; SmoothRepresentationsOfLocalGroups SR.3 / steinberg; SRU.4 / rodier-steinberg-series; SmoothRepresentationsOfLocalGroups SR.5 / highest-derivative-adapter; SRU.4.4; the corrected resolution of Aub96.

### 7.2 Aubert duality preserves the semisimple parameter (*aubert-semisimple-parameter*)

Let G be connected reductive over a nonarchimedean local field and π irreducible (Ciubotaru–Harris state it for tempered π). Then π and AZ(π) are constituents of the same normalised parabolically induced representation of a cuspidal datum; hence their semisimple local parameters (the semisimple-parameter supplier contract) coincide: L^ss(AZ(π)) = L^ss(π) (Ciubotaru–Harris Proposition 4.5). No equality of monodromy operators is asserted. (CH26, Proposition 4.5, PDF p. 12)

π irreducible; the semisimple parameter L^ss and its compatibility with normalised parabolic induction, from the semisimple-parameter supplier contract (the semisimple-parameter contract on ExcursionOperatorsAndSpectralActionPartII SC3–SC4). A fixed field isomorphism ℂ ≅ Q̄_ℓ (ℓ ≠ p), through which complex representations are compared with the ℓ-adic coefficients of that parameter.

One proof route is as follows. Same cuspidal support: aubert-involution. The semisimple parameter of an irreducible constituent of i_P(σ) is that of σ composed with the Levi embedding, with the half-modulus twist of normalised induction accounted for, both by the compatibility with normalised parabolic induction in the semisimple-parameter contract (ExcursionOperatorsAndSpectralActionPartII SC4); it depends only on the cuspidal support.

For GL₂, L^ss(1) = L^ss(St) = `|·|^(1/2)` ⊕ `|·|^(−1/2)`, while the Weil–Deligne monodromies differ (0 and nonzero).

*Needs:* SRU.7 / aubert-involution; ExcursionOperatorsAndSpectralActionPartII SC4 and its semisimple-parameter contract; ExcursionOperatorsAndSpectralActionPartII SC4, normalized-induction parameter contract.

### 7.3 Kazhdan–Lusztig parameters (*kazhdan-lusztig-parameters*)

Let k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). A Kazhdan–Lusztig triple is (s, e, ρ) with s ∈ G^∨ semisimple, e ∈ g^∨ nilpotent with Ad(s)e = q·e, and ρ an irreducible representation of the component group A(s, e) = π₀(`Z_(G^∨)(s, e)`) of Springer type (occurring in the homology of the variety of Borel subalgebras containing e and fixed by s), on which the centre of G^∨ acts trivially; triples are taken up to G^∨-conjugacy. g^∨_q denotes the q-eigenspace of Ad(s); G^∨(s) = `Z_(G^∨)(s)` acts on it with finitely many orbits and a unique open orbit. For an s-adapted Lie triple (e, h, f) with h ∈ t^∨_ℝ and s ∈ T^∨, s₀ := s `q^(−h/2)` commutes with the triple. (CH26, §8.1, Kazhdan–Lusztig parameters, PDF p. 27)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). G is adjoint, so its centre is connected and the classification is Kazhdan–Lusztig's (KL87, Theorem 7.12).

One proof route is as follows. Finiteness of G^∨(s)-orbits on g^∨_q and the open orbit are the graded (Vinberg–Lusztig) version of finiteness of nilpotent orbits. The Springer-type condition uses the Springer correspondence on the component groups; it is a definition here, with the geometric inputs (nilpotent orbits, sl₂-triples, Springer fibres) specified in the supplier contracts (the triple-centralizer and graded-open-orbit contracts).

The defining object has the following API.

- A triple (s, e, ρ) with s semisimple in G^∨, e ∈ g^∨ nilpotent, Ad(s) e = q • e, ρ an irreducible representation of π₀(Z(s, e)) of Springer type.
- g^∨_q := {x ∈ g^∨ | Ad(s) x = q • x}.
- The unique open G^∨(s)-orbit in g^∨_q.
- s₀ = s `q^(−h/2)` for an sl₂-triple through e with h real in t^∨.
- G^∨ acts on triples by conjugation; the classification is up to this action.

**Checks.**

- (s, 0, triv) is a KL triple for every semisimple s.
- For PGL₂ and s = diag(`q^(1/2)`, `q^(−1/2)`) ∈ SL₂(ℂ), e = the upper nilpotent satisfies Ad(s)e = qe.
- For PGL₂ and s = 1, a nonzero nilpotent e does not satisfy Ad(s)e = qe.
- If |α(s)| = 1 for every root α of G^∨ (s compact), then g^∨_q = 0.
- For q = 2 and s = diag(√2,1/√2), Ad(s)e = 2e; for s = 1 it is e ≠ 2e when e ≠ 0. The excluded q = 1 would collapse these two cases.

For PGL₂: triples (s, 0, triv) for all s, and (s, e ≠ 0, triv) for s with eigenvalue ratio q, the latter giving the Steinberg representation and its twist by g ↦ `(−1)^(v(det g))`. The spherical triples are exactly those with e = 0 and ρ trivial.

*Needs:* ReductiveGroupsPartII RG2.5 / langlands-dual-group; RepresentationTheory/LieHighestWeight / Layer 0-sl₂-representation-theory-the-engine; LieHighestWeightPartII N0, triple-centralizer contract; LieHighestWeightPartII N0–N1, graded-open-orbit contract; SpringerResolutionAndCharacteristicCycles S.

### 7.4 The Kazhdan–Lusztig classification of Iwahori-spherical representations (*kazhdan-lusztig-classification*)

Let k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). Irreducible smooth representations of G with nonzero Iwahori-fixed vectors are in bijection, π(s, e, ρ) ↔ (s, e, ρ), with G^∨-conjugacy classes of Kazhdan–Lusztig triples (KL87, Theorem 7.12, cited by its locator; G adjoint has connected centre). Moreover: (1) π(s, e, ρ) is K-spherical iff e = 0, and then ρ is trivial and π(s, 0, triv) = L(s) with s the Satake parameter; (2) π(s, e, ρ) is tempered iff s₀ is compact; (3) π(s, e, ρ) is generic iff ρ is trivial and e lies in the open G^∨(s)-orbit of g^∨_q; (4) AZ(L(s)) = π(s, e, triv) with e in that open orbit (Ciubotaru–Harris §5 and §8.1). (CH26, §8.1, PDF p. 27; proof of Corollary 5.7, PDF p. 15)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

One proof route is as follows. The Iwahori block is equivalent to H(G, I)-modules (SR.3.4 borel-casselman-block), and H(G, I) is the affine Hecke algebra with Bernstein presentation (SR.1). Kazhdan–Lusztig realise H(G, I) in the equivariant K-theory of the Steinberg variety of G^∨ and classify simple modules by standard modules in the homology of fixed-point varieties; use the coherent equivariant K-theory supplier contract. (1) Spherical modules contain the trivial H(K, I)-character, which occurs exactly for e = 0; (2) Casselman's criterion in terms of the exponents of the standard module; (3) Barbasch–Moy (BM94) for the generic criterion; (4) on Iwahori-spherical modules the Aubert involution is the Iwahori–Matsumoto involution (az-iwahori-matsumoto), which exchanges spherical and generic modules with the same s. The adjoint hypothesis is essential to the simplified spherical criterion as written. With arbitrary isogeny e=0 need not force the component-group representation to be trivial. A general dictionary must impose e=0 and trivial enhancement, and keep the Whittaker datum in the generic criterion; that extension is not claimed here.

For PGL₂: L(s) = π(s, 0, triv); St = π(diag(`q^(1/2)`, `q^(−1/2)`), e, triv); at s = diag(`q^(1/2)`, `q^(−1/2)`) the q-eigenspace is the line of e, the open orbit is e ≠ 0, so AZ(1) = St. Tempered spherical representations have s₀ = s compact and g^∨_q = 0, so they are the only irreducible representations with that s (Ciubotaru–Harris, proof of Corollary 5.7).

*Needs:* SRU.7 / kazhdan-lusztig-parameters; SRU.7 / az-iwahori-matsumoto; SmoothRepresentationsOfLocalGroups SR.3 / borel-casselman-block; SmoothRepresentationsOfLocalGroups SR.1 / bernstein-presentation; SmoothRepresentationsOfLocalGroups SR.3 / casselman-criterion; SRU.5 / spherical-generic-criterion; SpringerResolutionAndCharacteristicCycles S, coherent equivariant K-theory contract; LieHighestWeightPartII N0–N1, graded-open-orbit contract.

### 7.5 Aubert duality on the Iwahori block preserves unitarity (*az-iwahori-matsumoto*)

Let k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). On irreducible Iwahori-spherical representations, AZ corresponds under V ↦ V^I to the central-character-preserving Iwahori–Matsumoto involution of H(G, I) specified below, which preserves hermitian and unitary modules. Hence AZ(π) is unitarizable iff π is, for Iwahori-spherical π; in particular AZ of a tempered Iwahori-spherical representation is unitarizable. (La24, Definition 4.2 and Theorem 4.3, PDF p. 18)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

One proof route is as follows. Fix the central-character-preserving convention of La24 Definition 4.2, p. 18, in Bernstein generators: IM(T_s)=−qT_s⁻¹ for finite simple reflections, and IM(θ_x)=`T_(w₀)` `θ_(w₀x)` `T_(w₀)⁻¹`. It fixes the Bernstein centre. The other common convention with θ_x↦`θ_(−x)` has a different effect on central characters and must not be substituted here. Kato’s alternating induction–restriction identity identifies this involution with D_G on the Iwahori block, using compatibility of Iwahori invariants with normalised induction and Jacquet restriction (La24 Theorem 4.3, p. 18). Agreement on 1 and St and induction compatibility alone would not prove equality of functors. For the graded convention tw↦(−1)^ℓ(w)tw and ω↦−ω, unitarity is preserved (CiF4 Theorem 3.1, pp. 10–11 of the author version). Passing to the central-character-preserving version composes with the opposition automorphism/inner conjugacy, which preserves positive forms; retain this convention adapter through the affine-to-graded equivalence. SRU.5 barbasch-moy-unitarity: the Iwahori–Matsumoto involution preserves unitary H(G, I)-modules (Barbasch–Ciubotaru §1.1, after [BM1]). Tempered representations are unitarizable (SR.3.3 and SRU.2 unitary-induction).

AZ(St) = 1 is unitary. For PGL₂ the complementary series L(ν), 0 < ⟨α^∨, ν⟩ < 1, are fixed by AZ (they are full principal series) and unitary.

Additional inputs for this route: BC1, §1.1, p. 1; CH26, §8.1, p. 28; CiF4, §3.1, Theorem 3.1, pp. 10–11 of the author version.

*Needs:* SRU.7 / aubert-involution; SRU.5 / barbasch-moy-unitarity; SmoothRepresentationsOfLocalGroups SR.1 / iwahori-matsumoto; SRU.2 / unitary-induction; SmoothRepresentationsOfLocalGroups SR.3 / square-integrable-tempered.

### 7.6 The nilpotent partition of the spherical dual (*nilpotent-partition*)

Let k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). For a nilpotent G^∨-orbit O^∨ ⊆ g^∨, Sph(G, O^∨) is the set of G^∨-classes of s with AZ(L(s)) = π(s, e, triv), e ∈ O^∨ ((8.1)); these sets partition the K-spherical dual. For a Lie triple (e^∨, h^∨, f^∨) of O^∨, s = `q^(h^∨/2)` ∈ Sph(G, O^∨) is the central point. For s ∈ T^∨ write s = `q^(ℜ(s))` s_c with ℜ(s) ∈ t^∨_ℝ and Sph(G, O^∨)₀ for the set of real parts. SU(G) is the spherical unitary dual (s with L(s) unitarizable), CS(G, O^∨) = SU(G) ∩ Sph(G, O^∨) the spherical complementary series attached to O^∨, and CS(G, O^∨)₀ its real parts; SU(G) = ⊔ CS(G, O^∨). Z(O^∨) = `C_(G^∨)(e^∨, h^∨, f^∨)` is reductive, possibly disconnected, with Lie algebra z(O^∨); G(O^∨) is the split group dual to Z(O^∨)°; choosing a Cartan subalgebra a^∨ ⊆ z(O^∨) inside t^∨, for s with trivial or central compact part, ℜ(s) ∈ Sph(G, O^∨)₀ can be written ℜ(s) = ½h^∨ + ν with ν ∈ a^∨_ℝ, regarded as a parameter in Sph(G(O^∨), 0)₀ ((8.2)). (CH26, §8.1, (8.1)–(8.2), PDF p. 27)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

One proof route is as follows. The partition: each L(s) has exactly one AZ dual, whose KL triple has e in the open orbit of g^∨_q (kazhdan-lusztig-classification (4)); its G^∨-saturation is O^∨. Central point: for s = `q^(h^∨/2)`, Ad(s)e^∨ = qe^∨ and the triple has s₀ = 1 compact, so π(s, e^∨, triv) is tempered and L(s) is its AZ dual (Barbasch–Ciubotaru §1.3, (1.3.1)). Use LieHighestWeightPartII N0 for existence and conjugacy of triples, its triple-centralizer contract for the reductive centralizer and its graded-open-orbit contract for the open graded orbit. The real-character decomposition is the Barbasch–Moy orbit construction (BC1 §1.3, (1.3.1)–(1.3.2)).

The defining object has the following API.

- Sph(G, O^∨) as a set of semisimple classes of G^∨.
- The Sph(G, O^∨) over nilpotent orbits O^∨ partition the spherical dual.
- `q^(h^∨/2)` ∈ Sph(G, O^∨) for a Lie triple of O^∨.
- SU(G) := {s | L(s) unitarizable}.
- CS(G, O^∨) := SU(G) ∩ Sph(G, O^∨), with real parts CS(G, O^∨)₀.
- Z(O^∨) = `C_(G^∨)(e^∨, h^∨, f^∨)` and the split group G(O^∨) dual to Z(O^∨)°.
- For s with trivial or central compact part, every ℜ(s) ∈ Sph(G, O^∨)₀ is W-conjugate to ½h^∨ + ν with ν in a Cartan subalgebra of z(O^∨).

**Checks.**

- For PGL₂ there are two strata: O = 0 (s with α^∨(s) ≠ `q^(±1)`) and O regular (s = `q^(±ρ)` up to the quadratic twist).
- The real-parameter slice {ν ∈ C₀ | q^ν ∈ CS(G,0)} equals U₀^g. The real parts of the full stratum with arbitrary compact parts need not equal U₀^g: the noncentral G₂ witness gives a strict extra point.
- For O^∨ regular, the central point = q^ρ and L(q^ρ) is the trivial representation.
- The stratum of s is not determined by ℜ(s) alone when s_c is noncentral: for G₂ the witness s_c `s_(½ω₂)` lies in Sph(G₂, 0) while `s_(½ω₂)` does not (SRU.5 g2-noncentral-witness).

For O^∨=0, the real slice {ν | q^ν∈CS(G,0)} equals U₀^g up to W. This does not identify all real parts CS(G,0)₀ when arbitrary compact parts are allowed. For regular O^∨ the real slice is {q^ρ}; the full stratum also contains central compact twists zq^ρ. For PGL₂ the two choices of z give the trivial and unramified quadratic characters.

Additional inputs for this route: BC1, §1.3, (1.3.1)–(1.3.2), p. 3.

*Needs:* SRU.7 / kazhdan-lusztig-classification; SRU.7 / aubert-involution; SRU.5 / real-satake-parameter; SRU.2 / unitary-structure; RepresentationTheory/LieHighestWeight / Layer 0-sl₂-representation-theory-the-engine; LieHighestWeightPartII N0, triple-centralizer contract; LieHighestWeightPartII N0–N1, graded-open-orbit contract.

### 7.7 The central point is unitary (*central-point-unitary*)

In the setting of nilpotent-partition, for every nilpotent O^∨ the spherical representation L(`q^(h^∨/2)`) at the central point is unitarizable (Ciubotaru–Harris §8.1). (CH26, §8.1, central-point argument, PDF p. 28)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

One proof route is as follows. L(`q^(h^∨/2)`) = AZ(π(`q^(h^∨/2)`, e^∨, triv)) with the second tempered (nilpotent-partition, step 2). az-iwahori-matsumoto: the AZ dual of a tempered Iwahori-spherical representation is unitarizable.

For O^∨ regular the central point is the trivial representation; for O^∨ = 0 it is X(1), a unitary principal series.

*Needs:* SRU.7 / nilpotent-partition; SRU.7 / az-iwahori-matsumoto.

### 7.8 Complementary series reduce to the triple centraliser (*centralizer-reduction*)

In the setting of nilpotent-partition, with G split adjoint: assuming s has trivial or central compact part, if O^∨ is not the orbit 4A₁ of E₈, s ∈ CS(G, O^∨) and ℜ(s) = ½h^∨ + ν with ν ∈ Sph(G(O^∨), 0)₀, then ν ∈ CS(G(O^∨), 0)₀ (Ciubotaru–Harris Theorem 8.3). For 4A₁ in E₈ the complementary series has an extra region beyond that of the centraliser C₄ (e8-4a1-exclusion). (CH26, Theorem 8.3, PDF p. 28)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). O^∨ ≠ 4A₁ ⊂ E₈. s=`q^(ℜ(s))` or s=`zq^(ℜ(s))` with z compact and central in the full dual group; strip the corresponding unitary unramified character twist first. No assertion here covers arbitrary noncentral compact part.

One proof route is as follows. Strip a central compact part using its unitary unramified character twist (with the full root datum retained). For the remaining real parameter, use the real graded-Hecke equivalence. For noncentral compact part the relevant graded root system is that of `Z_(G^∨)(s_c)`, so replacing it by G^∨ at ℜ(s) would be invalid. The classification of the spherical unitary dual (Barbasch for classical types, Ciubotaru for F₄ and E₆, Barbasch–Ciubotaru for E₇, E₈) shows, case by case, that the ν occurring are in the zero complementary series of G(O^∨), except for 4A₁ in E₈; the case analysis is cited.

For O^∨ = 0, G(O^∨) = G and the statement is the definition of U₀^g. For O^∨ regular, Z(O^∨) is the centre, G(O^∨) is trivial and ν = 0.

*Needs:* SRU.7 / nilpotent-partition; SRU.5 / barbasch-moy-unitarity; SRU.5 / generic-unitary-classification; LieHighestWeightPartII N3, orbit-tables contract; LieHighestWeightPartII N0, triple-centralizer contract.

### 7.9 Extraneous real parts (*extraneous-point*)

In the setting of nilpotent-partition, let s = φ(Frob) ∈ CS(G, O^∨) be geometric in the sense of SRU.5 half-integral-parameter (for every representation of G^∨). Its real part ℜ(s) is extraneous if it is not W-conjugate to the central point ½h^∨ (Ciubotaru–Harris Definition 8.4). (CH26, Definition 8.4 and Remark 8.6, PDF p. 28)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

One proof route is as follows. Well defined: ℜ(s) is defined up to W, and the central point of O^∨ up to W.

The defining object has the following API.

- s is extraneous for O iff s ∈ CS(G, O), s is geometric, and ℜ(s) ∉ W • {½h^∨}.
- The central point is not extraneous.
- For G^∨ = Sp(6), O = (2,2,2), the real part (0, ½, 1) is extraneous.

**Checks.**

- For G^∨ = Sp(6) and O^∨ = (2,2,2), the real part (0, ½, 1) ≠ (½, ½, ½) up to W, and it is the extraneous point of Remark 8.6.
- For G^∨ = Sp(6) and O^∨ = (2,2,2), the central real part (½, ½, ½) is geometric and unitary but not extraneous: its squared distance from the central point is 0, while that of (0, ½, 1) is ½, the squared norm of the difference (−½, 0, ½) (the squared norms of the two points are ¾ and 5/4), so omitting the comparison with the central point would make the central point extraneous.
- For PGL₂ and O^∨ = 0, the real part ν = ¼ω has root pairing ¼; its spherical representation is generic and unitary (¼ < 1) but ν is not adjoint-half-integral, hence not extraneous; omitting geometricity from the definition would make it extraneous.

The central point itself is never extraneous. For Sp(6) and O^∨ = (2,2,2), ½h^∨ = (½, ½, ½) and the point (0, ½, 1) is extraneous (Remark 8.6).

*Needs:* SRU.7 / nilpotent-partition; SRU.5 / half-integral-parameter; SRU.7 / central-point-unitary.

### 7.10 Extraneous points for symplectic and spin duals (*extraneous-classical*)

In the setting of extraneous-point, with G of connected centre and s = s_c q^ν with s_c = 1 or s_c central in G^∨: (1) if G^∨ = Sp(2n) and O^∨ has partition with rᵢ parts equal to i (Σ i rᵢ = 2n, rᵢ even for i odd), so that Z(O^∨) = `∏_(i odd)` Sp(rᵢ) × `∏_(j even)` O(rⱼ), the extraneous real parts are ½h^∨ + ½ `Σ_(j even, rⱼ ≥ 3)` εⱼ `v_(rⱼ)`, εⱼ ∈ {0, 1} not all zero, where for an orthogonal factor so(r), r ≥ 3, with standard coordinates ε₁, …, `ε_(⌊r/2⌋)` on its Cartan subalgebra (the weights of its defining representation are the ±εᵢ, together with 0 for r odd) the vector direction is v_r := `ε_(⌊r/2⌋)`: for r ≥ 5 it is the fundamental coweight `ω_(⌊r/2⌋)` of SRU.5.16–5.17 in the reversed numbering of Ciubotaru–Harris, for r = 3 it is ε₁ = ω₁ of B₁, and for r = 4 it is ε₂ = ω₁ + ω₂ for D₂ = A₁ × A₁, which is not a fundamental coweight; (2) if G^∨ = Spin(n) and O^∨ has rᵢ parts equal to i (Σ i rᵢ = n, rᵢ even for i even), the extraneous real parts are ½h^∨ + ½ `Σ_(i odd, rᵢ ≥ 3)` εᵢ `v_(rᵢ)` with the same vector directions, Σ εᵢ even and not all εᵢ zero (Ciubotaru–Harris Theorem 8.5(1)–(2), which print the fundamental coweight `ω_(⌊r/2⌋)` for every r ≥ 3; for r = 4 that is the spin-type weight ½(−ε₁ + ε₂) of D₂, whose half-shift is not geometric). These lists are not asserted for noncentral compact parts. (CH26, Theorem 8.5(1)–(2), PDF p. 28)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). G of connected centre s = s_c q^ν with s_c = 1 or s_c central in G^∨.

One proof route is as follows. Write ℜ(s) = ½h^∨ + ν with ν ∈ CS(G(O^∨), 0)₀ (centralizer-reduction). ½h^∨ is half-integral for every representation (sl₂-theory), so ν is half-integral for every representation of g^∨ and for the adjoint representation of z(O^∨). Apply SRU.5 half-integral-generic-unitary to each simple factor of z(O^∨): ν is 0 or an exception of Theorem 6.14 on each factor. Standard representation of G^∨: it forces νᵢ = 0 on the factors that are not of the listed orthogonal type, and on an orthogonal factor so(r) acting on the multiplicity space of the parts of size j it forces every standard coordinate ⟨εᵢ, ν⟩ into ½ℤ, because the weights of the standard representation restricted to so(r) × sl₂ are ±εᵢ (and 0 for r odd) plus the weights of the j-dimensional sl₂-module, which are half-integers for Sp(2n) (j even) and integers for Spin(n) (j odd). The nonzero candidates on so(r) are the half-integral generic unitary points of its root system: SRU.5.16 for r odd, r ≥ 5, and SRU.5.17 for r even, r ≥ 6, where the standard-coordinate condition removes the spin points ½ω₁, ½ω₂ and leaves ½v_r; for r = 3 the root system A₁ with root ε₁ leaves the single point ½ε₁; for r = 4 the root system A₁ × A₁ with roots ε₁ ± ε₂ leaves the points with ⟨ε₁, ν⟩, ⟨ε₂, ν⟩ ∈ ½ℤ and |⟨ε₁ ± ε₂, ν⟩| < 1, whose nonzero Weyl orbit is that of ½ε₂, while the single-factor points ¼(ε₁ ± ε₂) = ½ω₁, ½ω₂ fail the standard-coordinate condition. For Spin(n) the spin modules impose the parity Σ εᵢ even; the remaining points are half-integral for G^∨ (Ciubotaru–Harris, proof of Theorem 8.5, cases (2)–(3); the rank-one and D₂ cases are proved here separately).

Remark 8.6: for Sp(6) and O^∨ = (2,2,2) (r₂ = 3), the unique extraneous real part is ½h^∨ + ½v₃ = ½h^∨ + ½ε₁ = (0, ½, 1) up to W. For Sp(8) and O^∨ = (2,2,2,2) (r₂ = 4, Z(O^∨) = O(4)), the shift ½v₄ = ½ε₂ gives the dominant real part (0, ½, ½, 1) in the reversed coordinates: the weights of the standard representation are ±⟨εᵢ, ν⟩ ± ½, hence 0, ±½ and ±1, all in ½ℤ, and the two A₁ factors of so(4) pair with ½ε₂ to ½ < 1; the printed shift ½ω₂ = ¼(−ε₁ + ε₂) would give the weights ±¼ and ±¾, which are not half-integral, so it is neither geometric nor extraneous. For O^∨ with every rⱼ ≤ 2 (j even), there are no extraneous points.

*Needs:* SRU.7 / centralizer-reduction; SRU.7 / extraneous-point; SRU.5 / half-integral-generic-unitary; SRU.5 / fundamental-separators; RepresentationTheory/LieHighestWeight / Layer 0-sl₂-representation-theory-the-engine; LieHighestWeightPartII N2; LieHighestWeightPartII N0, triple-centralizer contract.

### 7.11 Extraneous points for exceptional duals (*extraneous-exceptional*)

In the setting of extraneous-point, with G of connected centre and s = s_c q^ν with s_c = 1 or s_c central in G^∨: the extraneous real parts occur only for O^∨ = B₃ (real part ω₁ + ½ω₃ + ½ω₄) and Ã₁ + A₁ (½ω₁ + ½ω₄) in F₄; D₅(a₁) + A₁ in E₇ (½(ω₁ + ω₂ + ω₃ + ω₆ + ω₇)); and the following four E₈ points: D₆ (centraliser B₂), ω₁+½ω₄+½ω₆+ω₈; A₆ (centraliser 2A₁), ½ω₁+½ω₄+½ω₇+½ω₈; A₄+A₂ (centraliser 2A₁), ½ω₁+½ω₅+½ω₈; A₂+2A₁ (centraliser B₃+A₁), ½ω₂+½ω₈ (Ciubotaru–Harris Theorem 8.5(3)–(5)); there are none for G₂ and E₆ in this sector. Without the restriction on s_c the list is not exhaustive: the G₂ witness (SRU.5 g2-noncentral-witness) gives a geometric unitary s ∈ CS(G₂, 0) with real part ½ω₂ ≠ 0. (CH26, Theorem 8.5(3)–(5), PDF p. 28)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). G of connected centre s = s_c q^ν with s_c = 1 or s_c central in G^∨.

One proof route is as follows. As in extraneous-classical, ν ∈ CS(G(O^∨), 0)₀ is, on each simple factor of z(O^∨), 0 or an exception of Theorem 6.14; the exceptional orbits and centraliser types come from the tables of nilpotent orbits (the orbit-tables contract). For each remaining candidate compute the simple-root and fundamental-weight pairings of G^∨; the survivors are those listed (Ciubotaru–Harris, proof of Theorem 8.5, case (4)); the F₄, B₃ coordinate is corrected by an orthogonal decomposition. The Levi of type B₃ has ½h^∨ = ω₁ + ω₂ = (5/2, ½, ½, ½) in (6.21), and its centraliser direction (0, 0, 1, −1) is orthogonal to it, so the stratum's real parts are ω₁ + ω₂ + t(0, 0, 1, −1), of squared norm 7 + 2t², with complementary series 0 ≤ t < 1. The point ω₁ + ½ω₃ + ½ω₄ = (5/2, 1, ½, 0) is a coordinate permutation, hence a Weyl conjugate, of ω₁ + ω₂ + ½(0, 0, 1, −1) = (5/2, ½, 1, 0), the stratum point with t = ½ and squared norm 15/2; the printed ω₁ + ω₂ + ½ω₃ + ½ω₄ = (4, 3/2, 1, ½) has squared norm 39/2, which in this stratum would force t = 5/2, outside the complementary series. Ciubotaru's B₃ row (CiF4, §3.2, p. 14) is read with 3/2 − ν in its second coordinate: as printed, with 3/2 + ν, its direction is not orthogonal to the central point (3/2, 3/2, 3/2, ½), which is recorded as a misprint.

For F₄ and O^∨ = B₃ the corrected point ω₁ + ½ω₃ + ½ω₄ has Euclidean coordinates (5/2, 1, ½, 0) in (6.21). After the sign correction it is Weyl-conjugate to Ciubotaru's B₃ parameter at ν = ½, namely (2, 1, 3/2, ½): the reflection in α₁^∨ = (1, −1, −1, −1) sends it to (5/2, ½, 1, 0), a coordinate permutation of (5/2, 1, ½, 0). The printed value of CH26 Theorem 8.5(3) has squared norm 39/2 and lies outside the stratum's complementary series. For G₂ the restricted sector has no extraneous point, while the noncentral witness s_c `s_(½ω₂)` is extraneous.

*Needs:* SRU.7 / centralizer-reduction; SRU.7 / extraneous-point; SRU.5 / half-integral-generic-unitary; SRU.5 / g2-noncentral-witness; SRU.7 / e8-4a1-exclusion; LieHighestWeightPartII N3, orbit-tables contract.

### 7.12 The extra E₈, 4A₁ region has no half-integral points (*e8-4a1-exclusion*)

For G of type E₈ and O^∨ = 4A₁ (Z(O^∨) of type C₄), in the coordinates ℜ(s) = ½h^∨ + (0, 0, ν₁, ν₁, ν₂, ν₂, −ν₃ + ν₄, ν₃ + ν₄) with 0 ≤ ν₁ ≤ ν₂ ≤ ν₃ ≤ ν₄, the complementary series is {ν₄ < ½} ∪ {ν₁ + ν₄ < 1, ν₂ + ν₃ < 1, ν₂ + ν₄ > 1, −ν₁ + ν₃ + ν₄ < 3/2 < ν₁ + ν₃ + ν₄} ((8.8)), and its extra region (the second set) contains no parameter half-integral for the adjoint representation (Ciubotaru–Harris §8.3; both coordinate lattices are tested separately). (CH26, §8.3, (8.8), PDF p. 30)

G of type E₈; coordinates of Barbasch–Ciubotaru Table 13 and §6.4.1 as used by Ciubotaru–Harris.

One proof route is as follows. Adjoint half-integrality imposes two lattice possibilities: all four centralizer coordinates are nonnegative half-integers, or all lie in ¼ + ½ℤ. In the half-integer case ν₁ + ν₄ < 1 implies ν₄ < 1 and hence ν₄ ≤ ½; then ν₂ + ν₄ ≤ 1, contradicting the extra-region inequality. In the quarter-integer case ν₁ ≥ ¼ and ν₁ + ν₄ < 1 imply ν₄ < ¾. Thus every νᵢ ≤ ¼, so ν₂ + ν₄ ≤ ½ < 1, again contradicting the extra-region inequality. Even the weaker bound ν₄ ≤ ¾ forces ν₂ = ν₃ = ¾ if ν₂ + ν₄ > 1, contradicting ν₂ + ν₃ < 1.

**Checks.**

- At (½,½,½,½), ν₁+ν₄ = 1 violates the strict upper bound. At (¼,¾,¾,¾), ν₂+ν₃ = 3/2 violates its bound 1. In the half-integer lattice ν₄ < 1 implies ν₄ ≤ ½; in the quarter lattice ν₁ ≥ ¼ implies ν₄ < ¾.

The point ν = (½, ½, ½, ½) violates ν₁ + ν₄ < 1; the point (¼, ¾, ¾, ¾) violates ν₂ + ν₃ < 1.

*Needs:* SRU.7 / nilpotent-partition; SRU.5 / half-integral-parameter; LieHighestWeightPartII N3, orbit-tables contract.

### 7.13 Unitarity with noncentral compact part reduces to the centraliser of s_c (*noncentral-compact-reduction*)

Let k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). For s = s_c q^ν with s_c compact (noncentral allowed) and ν real, L(s) is unitarizable iff the spherical module of the graded affine Hecke algebra attached to the centraliser `Z_(G^∨)(s_c)` (its root datum and the Hecke parameters determined by s_c) at the real parameter ν is unitary (BM93, Theorem 8.1, printed p. 634). Unitarity of L(s) is therefore not governed by U₀^g of G when s_c is noncentral; the generic temperedness test and the extraneous-point lists of SRU.5 and SRU.7 are stated only for real or central-compact s. (BC1, §1.2, reduction to real infinitesimal character, PDF p. 2)

k a nonarchimedean local field (any characteristic) with residue field 𝔽_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). s_c compact, possibly noncentral.

One proof route is as follows. At each compact semisimple s_c use the *-compatible affine-to-graded reduction, retaining its centralizer root datum, lattice, parameters and any component action. The unitary locus in that graded category pulls back exactly to the unitary spherical locus over s_c. Intersect this locus with the ambient representation-weight half-integrality lattice, and assign its strata by saturating the open q-eigenspace orbit in the ambient dual group. This supplies the general centralizer formulation for every compact part; the finite lists in SRU.7.10–SRU.7.11 concern its real or central-compact fiber.

For s_c central, `Z_(G^∨)(s_c)` = G^∨ and the statement reduces to SRU.5. For G₂ and the involution s_c of g2-noncentral-witness, the centraliser is of type A₁ × Ã₁.

Additional inputs for this route: CH26, §6.12, Corollary 6.32, p. 25.

*Needs:* SRU.5 / barbasch-moy-unitarity; SRU.5 / g2-noncentral-witness; SRU.7 / kazhdan-lusztig-parameters; SRU.5.27; LieHighestWeightPartII N0–N3, graded-open-orbit contract.

### Examples

For PGL₂, AZ exchanges 1 and St. Their semisimple parameters are |·|^(1/2) ⊕ |·|^(−1/2), but the monodromy ranks are 0 and 1. For dual Sp₆ and orbit (2,2,2), the central real part (½,½,½) has squared Euclidean norm 3/4 and the extraneous point (0,½,1) has squared norm 5/4, proving that they are not Weyl conjugate. The noncentral G₂ example is in the zero nilpotent stratum at a real part excluded from the real slice, so real parts alone do not index strata.

### Dependencies

The statement carriers and the proposed proof inputs are the individual Needs lines above. This layer consumes SRU.0; SRU.1; SRU.2; SRU.3; SRU.4; SRU.5; SRU.6. The coherent equivariant K-theory, triple-centralizer, graded-open-orbit and orbit-tables contracts are proof inputs for enhanced parameters and the orbit tables, rather than statements inferred from a source citation.

## Downstream consumers

GlobalShtukasAndFunctionFieldLanglandsPartII uses the local generic temperedness tests, geometric weight patterns and complementary-series constraints in its Ramanujan–Arthur argument; it must retain the real or central-compact hypothesis when it uses the finite lists. MetaplecticAutomorphicFormsPartII uses relative isolation and the isolated-summand theorem for local-global comparisons. LocalLanglandsCorrespondenceForG2 uses the characteristic-zero isolation and weak-containment inputs. These are consumers, not prerequisites. The analytic results also apply directly to finite covers such as Mp₂ₙ(F) and to finite products with compact factors.

Types and Moy–Prasad extensions, parahoric centers, density and trace Paley–Wiener, mod-p Bernstein centers, GLₙ newforms and Newton cocenters are separate continuations of the base smooth-representation roadmap. They enter none of the Needs lines here.

## References

- GS23: Wee Teck Gan and Gordan Savin, *The local Langlands conjecture for G_2*. Forum of Mathematics, Pi 11 (2023), e28, published version. The arXiv v2 numbering differs. [Legal source](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/local_langlands_conjecture_for_g2.pdf).
- CH26: Dan Ciubotaru and Michael Harris, *On the generalized Ramanujan and Arthur conjectures over function fields*. arXiv:2311.15300v1; all numbering here refers to v1. [Legal source](https://arxiv.org/abs/2311.15300v1).
- BHV: Bachir Bekka, Pierre de la Harpe and Alain Valette, *Kazhdan's Property (T)*. Cambridge University Press, 2008, published text in the UNIGE institutional repository; PDF page numbers include its front matter. [Legal source](https://access.archive-ouverte.unige.ch/access/metadata/19c0d173-9917-4a95-b246-5f2eda3727b9/download).
- Ber92: Joseph Bernstein, notes by Karl E. Rumelhart, *Representations of p-adic groups (Harvard lectures, Fall 1992)*. author copy [Legal source](https://personal.math.ubc.ca/~cass/research/pdf/bernstein.pdf).
- Cas95: William Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*. draft of 1 May 1995, author copy [Legal source](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf).
- Cas80: William Casselman, *The unramified principal series of p-adic groups I. The spherical function*. Compositio Mathematica 40 (1980), no. 3, 387–406 (Numdam) [Legal source](http://www.numdam.org/item/CM_1980__40_3_387_0.pdf).
- HO: Volker Heiermann and Eric Opdam, *On the tempered L-function conjecture*. arXiv:0908.0699v4; published American Journal of Mathematics 135 (2013), no. 3, 777–799 [Legal source](https://arxiv.org/abs/0908.0699v4).
- BC1: Dan Barbasch and Dan Ciubotaru, *Whittaker unitary dual of affine graded Hecke algebras of type E*. arXiv:0708.4036v2; published Compositio Mathematica 145 (2009), 1563–1616 [Legal source](https://arxiv.org/abs/0708.4036v2).
- BC3: Dan Barbasch and Dan Ciubotaru, *Unitary equivalences for reductive p-adic groups*. arXiv:0909.5241v3; published American Journal of Mathematics 135 (2013), no. 6, 1633–1674 [Legal source](https://arxiv.org/abs/0909.5241v3).
- Aub95: Anne-Marie Aubert, *Dualité dans le groupe de Grothendieck de la catégorie des représentations lisses de longueur finie d'un groupe réductif p-adique*. Transactions of the American Mathematical Society 347 (1995), no. 6, 2179–2189 [Legal source](https://www.ams.org/journals/tran/1995-347-06/S0002-9947-1995-1285969-0/S0002-9947-1995-1285969-0.pdf).
- CCLTV: Raf Cluckers, Yves Cornulier, Nicolas Louvet, Romain Tessera and Alain Valette, *The Howe–Moore property for real and p-adic groups*. arXiv:1003.1484v1; published Mathematica Scandinavica 109 (2011), 201–224 [Legal source](https://arxiv.org/abs/1003.1484v1).
- GI18: Wee Teck Gan and Atsushi Ichino, *The Shimura–Waldspurger correspondence for Mp_2n*. arXiv:1705.10106v3; published Annals of Mathematics 188 (2018), no. 3, 965–1016 [Legal source](https://arxiv.org/abs/1705.10106v3).
- CIK71: Charles W. Curtis, Nagayoshi Iwahori and Robert Kilmoyer, *Hecke algebras and characters of parabolic type of finite groups with (B,N)-pairs*. Publ. Math. IHÉS 40 (1971), 81–116 [Legal source](https://www.numdam.org/item/PMIHES_1971__40__81_0.pdf).
- BCP: Dan Barbasch, Dan Ciubotaru and Alessandra Pantano, *Unitarizable minimal principal series of reductive groups*. arXiv:0804.1937v1; PDF carries September 16, 2021 in its header [Legal source](https://arxiv.org/abs/0804.1937v1).
- La24: Ruben La, *The Iwahori–Matsumoto dual for tempered representations of Lusztig’s geometric Hecke algebras*. arXiv:2403.14528v2 (14 August 2024) [Legal source](https://arxiv.org/abs/2403.14528v2).
- Ban02: Dubravka Ban, *The Aubert involution and R-groups*. Ann. Sci. ÉNS (4) 35 (2002), 673–693 [Legal source](https://www.numdam.org/item/ASENS_2002_4_35_5_673_0.pdf).
- CiF4: Dan Ciubotaru, *The unitary I-spherical dual for split p-adic groups of type F4*. Author version, pp. 1–49; published Represent. Theory 9 (2005), 94–137, DOI 10.1090/S1088-4165-05-00206-2 [Legal source](https://www.math.utah.edu/~ptrapa/math-library/ciubotaru/ciubotaru_F4.pdf).
- Aub96: Anne-Marie Aubert, *Erratum to Dualité dans le groupe de Grothendieck…*, Transactions of the American Mathematical Society 348 (1996), 4687–4690. [Publisher open archive](https://doi.org/10.1090/S0002-9947-96-01776-X).
- BM89: Dan Barbasch and Allen Moy, *A unitarity criterion for p-adic groups*, Inventiones Mathematicae 98 (1989), 19–37, Theorems 1.1–1.2; paywalled, cited by its locator. [Publisher page](https://doi.org/10.1007/BF01388842).
- BM93: Dan Barbasch and Allen Moy, *Reduction to real infinitesimal character in affine Hecke algebras*, Journal of the American Mathematical Society 6 (1993), 611–635, Theorem 8.1. [Publisher open archive](https://www.ams.org/journals/jams/1993-06-03/S0894-0347-1993-1186959-0/S0894-0347-1993-1186959-0.pdf).
- BM94: Dan Barbasch and Allen Moy, *Whittaker models with an Iwahori fixed vector*, 1994; cited by its locator.
- KL87: David Kazhdan and George Lusztig, *Proof of the Deligne–Langlands conjecture for Hecke algebras*, Inventiones Mathematicae 87 (1987), 153–215, Theorem 7.12; paywalled, cited by its locator. [Publisher page](https://doi.org/10.1007/BF01389157).
- HM07: Volker Heiermann and Goran Muić, *On the standard modules conjecture*, Mathematische Zeitschrift 255 (2007), 847–853; paywalled, cited by its locator as used in HO Corollary 1.2.
- MP21: Manish Mishra and Basudev Pattanayak, *Principal series component of Gelfand–Graev representation*. arXiv:2010.13341v3 (17 April 2021) [Legal source](https://arxiv.org/abs/2010.13341v3).
- Luo26: Yi Luo, *Iwahori component of the Gelfand–Graev representation for reductive groups*. arXiv:2607.17163v2 (31 July 2026) [Legal source](https://arxiv.org/abs/2607.17163v2).
- CS18: Kei Yuen Chan and Gordan Savin, *Iwahori component of the Gelfand–Graev representation*, Mathematische Zeitschrift 288 (2018), 125–133, Theorem 1.1; paywalled, cited by its locator. [Publisher page](https://doi.org/10.1007/s00209-017-1882-3).
- Kato81: Shin-ichi Kato, *Irreducibility of principal series representations for Hecke algebras of affine type*, Journal of the Faculty of Science, University of Tokyo 28, 929–943, Theorem 2.2. [Institutional source](https://doi.org/10.15083/00039616).
- Ber74: Joseph Bernstein, *All reductive p-adic groups are tame*. Functional Analysis and its Applications 8 (1974), 91–93; cited by its locator for the admissibility of irreducible unitary representations (SRU.2.6).
- Mi73: Dragan Miličić, *On C*-algebras with bounded trace*. Glasnik Matematički, Serija III 8(28) (1973), 7–22, Theorem 5; cited by its locator (SRU.3.3).
- Rodier73: François Rodier, *Whittaker models for admissible representations of reductive p-adic split groups*. In Harmonic analysis on homogeneous spaces (Williamstown 1972), Proceedings of Symposia in Pure Mathematics 26, American Mathematical Society (1973), 425–430; cited by its locator (SRU.3.7, SRU.5.5).
- Rodier81: François Rodier, *Décomposition de la série principale des groupes réductifs p-adiques*. In Noncommutative harmonic analysis and Lie groups (Marseille 1980), Lecture Notes in Mathematics 880, Springer (1981), 408–424; cited by its locator (SRU.4.4).
- KS71: Anthony W. Knapp and Elias M. Stein, *Intertwining operators for semisimple groups*. Annals of Mathematics (2) 93 (1971), 489–578; cited by its locator for the signature-constancy complementary-series argument (SRU.5.8).
- Steinberg68: Robert Steinberg, *Endomorphisms of linear algebraic groups*. Memoirs of the American Mathematical Society 80 (1968), Theorem 8.1; cited by its locator (SRU.6.1).
- Borel79: Armand Borel, *Automorphic L-functions*. In Automorphic forms, representations and L-functions (Corvallis 1977), Proceedings of Symposia in Pure Mathematics 33, part 2, American Mathematical Society (1979), 27–61, §6, Lemma 6.4 and Proposition 6.7; cited by its locator (SRU.6.1).
