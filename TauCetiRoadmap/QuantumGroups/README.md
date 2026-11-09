# Roadmap: quantum groups: compact reconstruction and generic rank-one representations

**Summary.** Build compact quantum groups from their C*-algebras and from their unitary
representation categories. Develop Haar integration, arbitrary-Hilbert-space
corepresentations, the dense Hopf *-algebra, weighted Peter–Weyl theory and
universal/reduced completions before reconstruction. Work out the deformation
SUq(2) and free orthogonal quantum groups, including their tensor categories,
dimensions, Haar laws and the full/reduced distinction.
On Tau Ceti's generic quantized enveloping algebra U_q(sl₂), with its signed
simple modules, complete reducibility, locally finite and type-1 module
categories and Clebsch–Gordan maps, add the Biedenharn–Elliott pentagon, the
pivotal and spherical structure of its finite-dimensional modules and their
precise comparison with the compact SUq(2) example.

## Scope and ownership

This roadmap owns the compact quantum-group construction, reconstruction and
examples in Layers 1–7, the classical locally compact function-algebra diagrams
in §1.1, and the parts of generic complex rank-one representation theory in
Layer 8 that Tau Ceti does not prove.
VonNeumannAlgebras V13b.SpatialNorm owns the spatial norm and the minimal
C*-tensor product with its representation independence and slice maps.
HilbertModules H1–H3 owns Hilbert C*-modules, their adjointable and compact
operators, the free module `H⊗A` and interior tensor products. CStarAlgebras
C1.7 and C1.CommutativeMultiplierMorphisms own multiplier algebras with the
strict topology and the commutative multiplier and pullback facts, and
CStarAlgebras C5.1–C5.2 own the tensor products of star homomorphisms, the
flip, the associator and the identification `C₀(X)⊗min B≅C₀(X,B)`. Layer 0
owns the free-module coaction legs built on these, elementary C*-categories
with standard conjugates and the unitary Temperley–Lieb category; §1.1 owns
the identification `C₀(X,C₀(Y))≅C₀(X×Y)` and specializes the pullback facts
to group maps. These foundations are independent of quantum-group
reconstruction. Section 0.2 is the single home of C*-categories with their
orthogonal sums, projection splittings and additive dagger Karoubi completion,
the finite-Hilbert and Hilbert-module C*-categories, C*-tensor categories with
conjugate solutions, standard solutions, intrinsic dimension, the balanced
unitary dual functor and signed self-dualities; §0.3 is the single home of
the unitary Temperley–Lieb category
with its Hom-space adjoint, positive trace forms, C*-norms, standard conjugates
and generic and truncated fusion. CategoricalOperatorAlgebras CA1a–CA2a and
TemperleyLiebOperatorAlgebras Layer 3 come later in the build and consume these
objects from §§0.2–0.3 rather than construct them a second time.
VonNeumannAlgebras owns the operator-closure theory (the
bicommutant theorem, Kaplansky density and the finite-dimensional
classification), normal functionals and the trace-class predual, the state
space and GNS representation, Tomita–Takesaki theory, the KMS condition and
full left Hilbert algebras with their canonical weights; §§1.2, 2.2–2.3, 3.4
and 6.2 consume these by section.
TemperleyLieb Layers 0–7 supplies the algebraic diagrams, trace, negligible
ideal, Jones–Wenzl objects and algebraic envelopes. Subfactors §§3.1–3.3 owns
the analytic adjoint on the Temperley–Lieb algebras, Markov uniqueness, Jones's
positivity theorem, the positive path models and the C*-norms of the Jones
quotients; §0.3 consumes them and builds the unitary tensor category on the
diagram category. Layer 7 identifies it with quantum-group intertwiners.
The algebraic coaction and matrix-coefficient infrastructure is supplied by Tau
Ceti, and so are Hopf *-algebras (`TauCeti.StarCoalgebra`) with the bijectivity
of their antipode and the algebraic cancellation maps of a Hopf algebra, which
§§3.1 and 4.1 consume; Mathlib supplies algebraic tensors, quotient algebras and
module theory. Layer 8's algebra is implemented in Tau Ceti and consumed here:
`TauCeti.UqSl2` with its presentation, iterated Ore presentation, PBW basis,
domain property and Hopf structure; the Verma modules and signed ladder modules
`TauCeti.UqSl2.LadderModule` with the classification of finite-dimensional
simples; the Casimir element and the polynomial center; finite complete
reducibility; the semisimplicity, ladder decomposition and type-1 theory of
locally finite modules; Clebsch–Gordan isomorphisms, their inverse projections
and the recoupling of triple tensor products; contragredients, quantum traces
and formal characters; the compact real form with its invariant metric; and the
classical specialization, under `TauCeti/QuantumGroups/UqSl2/`, together with
the σ-derivation Ore extension `TauCeti.OreExtension` and the category
`TauCeti.FiniteHopfModuleCat` with its monoidal, rigid and double-dual
structure. This roadmap owns the Layer 8 statements Tau Ceti does not prove:
the Biedenharn–Elliott pentagon and dual compatibility of the Clebsch–Gordan
maps, the pivotal and spherical structure on finite modules with its
comparison with PivotalSpherical, the group-algebra comparison and the
representation ring of §8.5, the corollaries of finite complete reducibility
listed in §8.3, and the SUq(2) comparison of §8.6.

Apart from §1.1's classical locally compact example, Layers 1–7 concern compact
symmetry. General locally compact quantum groups, their unbounded Haar weights and
general multiplicative-unitary reconstruction are outside the scope. The general
Hilbert-algebra/weight correspondence of VonNeumannAlgebras Layer 11 supplies the
compact Haar comparison in §3.4. Layer 4
constructs the particular compact regular multiplicative unitary. Quantum-group
actions and crossed products are outside the scope. Layer 8 is algebraic and
has no C*-completion hypothesis in its classification.

## Conventions

Algebras and Hilbert spaces are complex. Compact quantum groups have a nonzero
unital C*-algebra A and a unital star homomorphism
`Δ:A→A⊗_min A`. Neither A nor the representation Hilbert space is assumed
separable. Finite-dimensional coefficient matrices use orthonormal bases and
column vectors: `δ(e_j)=Σ_i e_i⊗u_ij` and
`Δ(u_ij)=Σ_k u_ik⊗u_kj`. Matrix star is conjugate transpose;
`bar u=(u_ij*)` is entrywise star, and is a different operation.
Pin tensor corepresentations to `U_13 V_23`, with entries
`(u⊠v)_((i,k),(j,l))=u_ij v_kl`, as in Tau Ceti's native
`Comodule.TensorProduct`; thus `χ_(u⊠v)=χ_u χ_v`.
Algebraic tensors use Mathlib `TensorProduct` over ℂ; analytic tensors use the
minimal C*-tensor product. Insert associators and unit identifications in leg
notation. Scalar products are conjugate-linear in the first variable.

A morphism `(A,Δ_A)→(B,Δ_B)` is a unital star homomorphism f with
`Δ_B f=(f⊗f)Δ_A`. This is the direction of the function-algebra map; the
corresponding compact-group arrow has the reverse direction. Fiber functors
are faithful complex-linear dagger strong monoidal functors to finite Hilbert
spaces, with unitary tensor and unit constraints. Quantum dimension means the
intrinsic C*-tensor-category dimension, and Hilbert dimension means the rank of
the underlying vector space. These can differ.

## Exact supplier contracts

| Supplier | Interface consumed here |
| --- | --- |
| [TemperleyLieb Layers 0–7](../TemperleyLieb/README.md) | Algebraic diagrams and reflections, the presentation theorem for the endomorphism algebras, trace, Jones–Wenzl objects, negligible ideal and the Goodman–Wenzl theorem, algebraic path models, quotients and Karoubi envelopes. Section 0.3 constructs the unitary category on them. |
| [Subfactors §§3.1–3.3](../Subfactors/README.md) | §3.1: the analytic adjoint on Tau Ceti's `TauCeti.TemperleyLieb ℂ δ n` for real δ. §3.2: Markov uniqueness, Jones–Wenzl projections, the trace radical `R_n` as a †-stable ideal and Jones's positivity theorem `markovTrace_nonneg_iff`. §3.3: the positive path models on the half-line and on `A_(m−1)`, `ker π_n=R_n`, the Jones quotients `Q_n` with faithful positive traces, their finite-dimensional C*-norms and the normalised traces `tr_n=δ⁻ⁿτ_n` (§0.3). |
| [VonNeumannAlgebras Layers 0,1,3,4,10,11,13](../VonNeumannAlgebras/README.md) | Layer 0: weak-* compact state space of a nonzero unital C*-algebra, GNS cyclic vector, recovery and unitary uniqueness, state separation and the faithful Gelfand–Naimark representation (§§1.2, 2.3, 7.1). V13b.SpatialNorm: the spatial norm on an algebraic tensor product of concrete C*-algebras, `A⊗_min B`, `‖a⊗b‖_min=‖a‖‖b‖`, representation independence, slice maps of bounded functionals and isometric inclusions (§§0.1, 1.1–1.2). Layer 1: the bicommutant theorem on `StarSubalgebra`/`ContinuousLinearMapWOT` carriers, Kaplansky density, operator topologies (§§3.4, 6.2). Layer 3: finite-dimensional von Neumann algebras as sums of matrix algebras with multiplicity spaces (§6.2). V4.Core, V4.PositivePredual, V4.Normality: trace-class predual, normal functionals and vector states (§3.4). V10.ModularTheory and V10.KMS: `S = JΔ^(1/2)`, `JMJ = M′`, the modular group `σ_t(x) = Δ^(it)xΔ^(−it)` and its KMS characterisation and uniqueness for faithful normal states (§3.4). Layer 11: full left Hilbert algebras, their full closure, Tomita's theorem for them, the canonical faithful normal semifinite weight on the left von Neumann algebra and its GNS Hilbert algebra (§3.4). |
| [HilbertModules H1–H3](../HilbertModules/README.md) | H1: complete right Hilbert A-modules in the opposite-algebra convention, the separated completion, Hilbert direct sums over arbitrary index sets and the free module `H⊗A` with `⟨ξ⊗a,η⊗b⟩=⟨ξ,η⟩a*b` (§§0.1, 2.1). H2: adjointable operators `L_A(E,F)` with composition, adjoints and `‖T*T‖=‖T‖²`, rank-one maps `θ_(x,y)`, module compact operators `K_A(E,F)`, `L_A(E)≅𝓜(ℂ, K_A(E))` with the strict topology on bounded sets, and `K_A(H⊗A)≅K(H)⊗min A` and `L_A(H⊗A)≅𝓜(ℂ, K(H)⊗min A)` for arbitrary H; §0.2 builds the Hilbert-module C*-category from these (§§0.1, 0.2, 2.1–2.3, 4.2). H3: interior tensor products along correspondences, the adjointable maps they induce, associators and unitors (§§0.1, 2.1). |
| [CStarAlgebras §§1.7–1.8, 5.1–5.2](../CStarAlgebras/README.md) | C1.7: the strict topology on `𝓜(ℂ, A)`, the unique strictly continuous extension of a nondegenerate star homomorphism, `𝓜(ℂ, C₀(X))=C_b(X)` with strict convergence on bounded sets as uniform convergence on compact sets (§1.1). C1.CommutativeMultiplierMorphisms: continuous maps as nondegenerate star homomorphisms `C₀(Y)→C_b(X)` by pullback, contravariant composition, and landing in `C₀(X)` exactly for proper maps (§1.1). C5.1: tensor products `f⊗g` of star homomorphisms on `⊗min` with their norm bounds, the unit inclusions, the flip and the associator (§§0.1, 1.1–1.2, 2.1, 4.2, 5.1). C5.2: `C₀(X)⊗min B≅C₀(X,B)` and `C(X)⊗min C(Y)≅C(X×Y)` with pullback naturality (§§1.1, 6.3). |
| [RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md) | Classical Peter–Weyl, compact Haar integration and the SU(2) representation calculation used for comparisons. |
| [RepresentationTheory/LieHighestWeight, Layer 0](../RepresentationTheory/LieHighestWeight/README.md) | The standard irreducible `sl₂`-module V(m) of highest weight m, realised in Tau Ceti as `TauCeti.Sl2Std`, and the native `sl (Fin 2) ℂ`/`IsSl2Triple` conventions, against which §8.7 compares the classical specialization. |
| [OperatorAlgebraDynamics D1–D2](../OperatorAlgebraDynamics/README.md) | Full/reduced discrete-group C*-algebras, canonical quotient/expectation and the invariant-mean/Reiter P₁/P₂ comparison. |
| [FreeProbability F1,F3,F6](../FreeProbability/README.md) | Scalar moments, the free-group adjacency norm/full–reduced counterexample and the standard semicircular law; Q7 supplies the quantum-group character realization. |
| [AmenableGroups, Layers 1,5,7](../AmenableGroups/README.md) | Layer 1 invariant means, Layer 5 discrete Følner criterion, Layer 7 locally compact amenability; Q4 constructs the reduced-counit comparison using D2's Reiter comparison. |
| [PivotalSpherical Layers 0–2 and 7](../PivotalSpherical/README.md) | Algebraic double-right-dual, pivotal, trace and spherical conventions consumed by Q3 and Q8.5, compared with §0.2’s unitary duality. Layer7’s FDRep is the group-algebra comparison target for Q8.5. |

**From Mathlib.** `CStarModule` in `Analysis/CStarAlgebra/Module/Defs.lean`
provides the module inner product and Cauchy–Schwarz; completeness is a separate
`CompleteSpace` hypothesis. Use `CStarModule` at the opposite coefficient algebra
for right modules, and `WithCStarModule` finite products from
`Analysis/CStarAlgebra/Module/Constructions.lean`. Use
`PositiveLinearMap.GNS` and `PositiveLinearMap.gnsStarAlgHom` from
`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean` for Hilbert GNS, and
`WeakDual.isCompact_closedBall` from `Analysis/Normed/Module/WeakDual.lean` for
Banach–Alaoglu. From `Analysis/InnerProductSpace/Spectrum.lean` use
`ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` and
`ContinuousLinearMap.finite_dimensional_eigenspace`; the latter excludes the
zero eigenvalue. `VonNeumannAlgebra` in `Analysis/VonNeumannAlgebra/Basic.lean`
is a star subalgebra equal to its double commutant; VonNeumannAlgebras Layer 1
identifies it with the weakly closed unital star subalgebras. Use native `Coalgebra`, `Bialgebra`, `HopfAlgebra`, `Coalgebra.counit` and
`HopfAlgebra.antipode`. The multiplier algebra is `DoubleCentralizer`, notation
`𝓜(ℂ, A)`, in `Analysis/CStarAlgebra/Multiplier.lean`, a C*-algebra with no
strict topology and no extension theorem at the pin. Matrix norms are those of
`CStarMatrix` (`Analysis/CStarAlgebra/CStarMatrix.lean`), and star homomorphisms
are completely positive by `NonUnitalStarAlgHomClass.instCompletelyPositiveMapClass`
(`Analysis/CStarAlgebra/CompletelyPositiveMap.lean`). Gelfand duality for
commutative unital C*-algebras is `gelfandStarTransform` with
`gelfandStarTransform_naturality` and `WeakDual.CharacterSpace.compContinuousMap`
(`Analysis/CStarAlgebra/GelfandDuality.lean`), together with
`WeakDual.CharacterSpace.homeoEval` (`Topology/ContinuousMap/Ideals.lean`).
Cauchy–Schwarz for positive functionals is
`PositiveLinearMap.norm_map_star_mul_le` in
`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean`.

**From Tau Ceti.** `Algebra.Coalgebra.Comodule` provides
comodules, comodule homomorphisms, categories, corestriction, duals and finite
matrix coefficients. Consume its `Subcomodule`, `IsCompletelyReducible`,
`fixedSubcomodule`, `Finite/Monoidal`, `Finite/RightRigid` and
`Comodule.convolutionAction` interfaces for subobjects, duality and convolution.
`Finite/RightRigid` supplies antipode-twisted right duals for arbitrary
Hopf algebras. `Finite/Rigid` uses commutativity and supplies both duals
for the classical function-algebra case. For noncommutative Pol(G),
construct left duals using its bijective antipode and S⁻¹, and compare
them with §0.2's chosen conjugates and pivotal structure.
Use Mathlib `WithConv` for convolution notation.
In particular consume `coefficientMatrix`, its counit,
comultiplication and inverse-antipode equations, and `matrixComodule` with its
coefficient reconstruction. Add Hilbert/star/unitary structure to these APIs;
do not replace the algebraic coaction with a private matrix-corepresentation
carrier. The analytic free-module coaction is compared with that algebraic API
on the coefficient core.
`TauCeti.StarCoalgebra` (`Algebra/Coalgebra/Star.lean`) is star preservation of
the comultiplication, `Δ(a*)=Δ(a)*` for the tensor star `(x⊗y)*=x*⊗y*`, with
`TauCeti.StarCoalgebra.counit_star`; on it `Algebra/HopfAlgebra/Star.lean`
proves `TauCeti.HopfAlgebra.antipode_star_antipode_star` (`S(S(a*)*)=a`),
`TauCeti.HopfAlgebra.antipode_bijective` and the algebra isomorphism
`TauCeti.HopfAlgebra.antipodeAlgEquivOp` onto the opposite algebra, with inverse
`a↦S(a*)*` (§3.1). `Algebra/HopfAlgebra/Cancellation.lean` constructs the
cancellation equivalences `TauCeti.HopfAlgebra.comulMulRightEquiv`
(`a⊗b↦Δ(a)(1⊗b)`) and `TauCeti.HopfAlgebra.leftMulComulEquiv`
(`a⊗b↦(a⊗1)Δ(b)`) with antipode inverses, and for bijective antipode
`TauCeti.HopfAlgebra.comulMulLeftEquiv` (§4.1).
Layer 8 consumes the quantum integers `TauCeti.quantumInteger` and
`TauCeti.laurentQuantumInteger` with the predicate
`TauCeti.IsGenericQuantumParameter` (`QuantumGroups/QuantumInteger/`),
`TauCeti.UqSl2` and its theory (`QuantumGroups/UqSl2/`), the Ore extensions
`TauCeti.OreExtension` with `TauCeti.SigmaDerivation` (`Algebra/OreExtension/`),
`TauCeti.IsLocallyFiniteModule` (`RingTheory/Finiteness/LocallyFinite.lean`),
`TauCeti.FiniteHopfModuleCat` (`Algebra/Category/FiniteHopfModuleCat/`), the
classes `TauCeti.PivotalCategory` and `TauCeti.SphericalCategory`
(`CategoryTheory/Monoidal/Pivotal/`) and `TauCeti.Sl2Std`
(`Algebra/Lie/Sl2/Standard.lean`); §§8.1–8.7 name the declarations used.

## How to read the build

Layer 0 constructs the shared analytic and categorical prerequisites, stated at
the generality of their sources rather than only at the instances Layers 1–7
consume: Layer 7 uses §0.3 only at loop parameters d ≥ 2, while §0.3 also covers
the discrete range d = 2cos(π/m).
Layers 1–4 construct Haar theory, representations, the Hopf core and its
completions. Layers 5–7 build the universal examples, reconstruct compact
quantum groups from fiber data and identify their representations. Layer 8
consumes Tau Ceti's algebraic rank-one theory, adds the pentagon and the
pivotal and spherical structure in §8.5, compares it with the compact examples
in §8.6 and records the classical specialization in §8.7.
The labels Q1–Q8 refer to these same layers. Local *Needs:* lines distinguish
the statement's carriers from inputs used by the specified proof route.
A citation "Q8 item k" denotes §8.k, for k = 1, …, 7; the two that other
roadmaps cite are:

- Q8 item 1 → §8.1, the presentation, PBW basis and Hopf structure of U_q(sl₂),
  which are Tau Ceti's `TauCeti.UqSl2` and its §8.1 declarations;
- Q8 item 5 → §8.5, the finite Hopf-module category over a field, cited as
  FiniteHopfModuleCat k H, with its monoidal structure and its right and left duals,
  which are Tau Ceti's `TauCeti.FiniteHopfModuleCat k H` and its §8.5 structures.

## Layer 0: Analytic and categorical foundations

### 0.1 Free-module coaction legs

Consume HilbertModules H1 for complete right Hilbert A-modules over an
arbitrary, possibly nonunital, C*-algebra A in the native opposite-algebra
convention: the separated completion of a positive semidefinite module, the
Hilbert direct sums over arbitrary index sets and the free module `H⊗A` with
`⟨ξ⊗a,η⊗b⟩=⟨ξ,η⟩a*b` for every complex Hilbert space H. Consume
HilbertModules H2 for the adjointable operators `L_A(E,F)`, the rank-one maps
`θ_(x,y)z=x⟨y,z⟩`, the module compact operators `K_A(E,F)`, the
identification `L_A(E)≅𝓜(ℂ, K_A(E))` with its strict topology on bounded
sets, and the isometric star isomorphisms `K_A(H⊗A)≅K(H)⊗min A` and
`L_A(H⊗A)≅𝓜(ℂ, K(H)⊗min A)`. Consume HilbertModules H3 for the interior
tensor product `E⊗_B F` of a right Hilbert B-module along a B–C
correspondence, the adjointable maps `T⊗_B 1` it induces, its associators and
its unitors. Neither separability of H nor countable generation is assumed
anywhere below.

Construct here the leg identifications that §2.1 uses to state the
corepresentation equation on an arbitrary H. For a unital star homomorphism
`φ:A→B` of unital C*-algebras, B is an A–B correspondence through φ, and the
map `ξ⊗a⊗b↦ξ⊗φ(a)b` is a unitary `(H⊗A)⊗_φ B≅H⊗B` of right Hilbert
B-modules: on elementary tensors both inner products equal
`⟨ξ,η⟩b*φ(a)*φ(a′)b′`, and the image contains every `ξ⊗b`, so the isometry
determined on elementary tensors is onto. Transporting `T⊗_φ 1` through it
defines the leg `T_φ∈L_B(H⊗B)` of an adjointable `T∈L_A(H⊗A)`. Prove that
`T↦T_φ` is a unital star homomorphism `L_A(H⊗A)→L_B(H⊗B)`, contractive,
isometric when φ is injective, strictly continuous on bounded sets, with
`(T_φ)_ψ=T_(ψ∘φ)` for a second unital star homomorphism `ψ:B→C`, and equal
to `S⊗φ(a)` on the elementary operator `S⊗a`, `ξ⊗a′↦Sξ⊗aa′`, for `S∈B(H)`
and `a∈A`. For `Δ:A→A⊗min A` the leg is `(id⊗Δ)T`; for `ι₁(a)=a⊗1` it is
`T_12`, and for `ι₂(a)=1⊗a` it is `T_13`, the leg numbering of
Kustermans–Vaes (Notations and conventions, p.840). Since `ι₂=σ∘ι₁` for the
flip automorphism σ of `A⊗min A` (CStarAlgebras C5.1), the composition law
gives `T_13=(T_12)_σ`. The coefficientwise flip `W(ξ⊗x)=ξ⊗σ(x)` satisfies
`W(yc)=W(y)σ(c)` and `⟨Wy,Wz⟩=σ(⟨y,z⟩)`, so it is a σ-semilinear isometry of
`H⊗(A⊗min A)` and not a unitary of this Hilbert module; conjugation by it
agrees with the leg along σ, `(T_12)_σ=WT_12W`, because both maps are strictly
continuous on bounded sets and send `S⊗c` to `S⊗σ(c)`. Isometry for
injective φ holds because `‖T_φ(x⊗1)‖=‖φ(⟨Tx,Tx⟩)‖^(1/2)=‖Tx‖`; strict
continuity holds because a bounded strictly convergent net converges on
every `x⊗b`, whose span is dense.

The leg identifications have the following API.

- The leg of an adjointable operator along a unital star homomorphism is adjointable, with `(T_φ)*=(T*)_φ`, `(ST)_φ=S_φT_φ` and `1_φ=1`; legs compose along composites of star homomorphisms.
- Legs are contractive, isometric for injective φ, strictly continuous on bounded sets, and determined by their values on elementary operators, where they act as φ on the coefficient.

**Checks.**

- For H=ℂ and unital A, `ℂ⊗A` is the self-module A, `L_A(A)=A` acting by left multiplication, and `T_φ=φ(T)`; for A=B=ℂ and φ=id every leg is the identity, and for H=0 every module and every leg is zero.
- For the sign character u of C₂, with H=ℂ and `U=u∈C(C₂)`, `(id⊗Δ)U=Δ(u)=u⊗u` because `u(gh)=u(g)u(h)`, and `U_12U_13=(u⊗1)(1⊗u)=u⊗u`, so the corepresentation equation holds. Taking ι₂ for ι₁ in both legs instead gives `(1⊗u)(1⊗u)=1⊗u²=1≠u⊗u`.
- For the counit `ε:C(C₂)→ℂ` and the projection `T=1[s]` of norm 1, `T_ε=ε(1[s])=0`: the leg along a non-injective homomorphism is contractive but not isometric.
- For H=ℂ, A=C(C₂) and the flip σ of `A⊗min A`, the leg of `U_12=u⊗1` along σ is `σ(u⊗1)=1⊗u=U_13`. The coefficientwise flip W sends `(1⊗1)(u⊗1)=u⊗1` to `1⊗u`, whereas `W(1⊗1)·(u⊗1)=u⊗1`: W is not right `(A⊗min A)`-linear, so no unitary of the Hilbert module `A⊗min A` has its formula.

*Needs:* HilbertModules H1–H3; CStarAlgebras C5.1 for the flip and the unit inclusions ι₁, ι₂ of `A⊗min A`; VonNeumannAlgebras V13b.SpatialNorm for the minimal tensor product itself. Kustermans–Vaes, Notations and conventions, p.840, for the unique strictly continuous extension of a nondegenerate star homomorphism to multiplier algebras and for leg numbering; the leg identifications for unital φ are derived above.

### 0.2 C*-categories and standard conjugates

Add a conjugate-linear involutive dagger to a native complex-linear category
with Banach Hom spaces, contractive composition, ‖f†f‖=‖f‖² and positivity of
f†f in End(X). Develop finite linking algebras, orthogonal sums and projection
splittings; construct the additive and dagger Karoubi completion and its
universal property for linear dagger functors. Prove automatic contractivity
of those functors and isometry when faithful. Construct the finite Hilbert
category and Hilbert-module category with their operator norms (Longo–Roberts
§2, pp.4–5, and Appendix, pp.48–49).

For a C*-tensor category require dagger-compatible tensor products and unitary
associators and unitors. Use native rigid pairings for conjugates. In a rigid
category with simple unit, finite sums and subobjects, define standard
conjugate solutions by equality of the left and right induced traces on
End(X). Construct them, prove uniqueness up to unitary transport and prove
that their common dimension is the minimum of ‖R‖‖R̄‖ among conjugate
solutions. Prove additivity, multiplicativity, and compatibility with subobjects
and unitary tensor equivalences (Longo–Roberts §3, especially Lemma 3.3,
Theorems 3.8 and 3.11; Neshveyev–Tuset §2.2, Definitions 2.2.10 and 2.2.12,
Theorems 2.2.14 and 2.2.17). Prove d(X) ≥ 1 for nonzero X, because the unit is
a subobject of X⊗X̄, with equality exactly when X is invertible: equality
forces X⊗X̄≅1 by additivity and positivity of dimensions (Neshveyev–Tuset
§2.7, Definition 2.7.1 and the remark following it). Transport these solutions
to the balanced unitary dual functor, a dagger-compatible dual functor
(`(f∨)†=(f†)∨`) with unitary tensorator, and to the pivotal and spherical
structures of PivotalSpherical. For a unitary self-duality r:X→X∨ keep the signed condition
`bar(r) r=ε φ_X`, ε=±1, where bar(f)=(f†)∨ and φ is the pivotal comparison.
Prove invariance of the sign on a simple self-dual object. Neshveyev–Tuset §2.5
normalise a self-conjugate simple object by `R̄=−τR` with τ=±1, so their τ is
−ε; the SU(2) fundamental object has ε=−1 and τ=1. A faithful Hilbert
fiber functor carries conjugate solutions to solutions, but need not carry
standard solutions to standard solutions; its Hilbert dimension is at most
the intrinsic dimension.

The analytic-category and duality interfaces have the following API.

- Dagger functors preserve unitary arrows, sums and projection splittings through their universal properties; faithful functors preserve Hom norms.
- Standard solutions give positive dimensions, coherent duals and equal left/right categorical traces on endomorphisms; arbitrary conjugate solutions need not be standard.
- Signed self-dualities transport along unitaries; negative sign is distinct from a positive loop value, and neither evaluation nor coevaluation is generally unitary.

**Checks.**

- For T=diag(2,1) in finite Hilbert spaces, ‖T†T‖=4=‖T‖². Using Hilbert–Schmidt norms instead gives √17≠5.
- The idempotent [[1,1],[0,0]] has norm √2 and is not self-adjoint; its range projection is diag(1,0). Only the latter splits by an isometry and its adjoint. End(0) has identity of norm 0.
- In Hilb_f, the standard cup for ℂ² has squared norm 2 and both zigzags are identities. Rescaling its two conjugate cups by 2 and 1/2 keeps the zigzags but gives squared norms 8 and 1/2, so the pair is not standard.
- At q=1/2, the fundamental quantum-group object has intrinsic dimension 5/2 and Hilbert dimension 2. Its forgotten conjugate solution has norm product 5/2>2; assuming a faithful fiber functor preserves standardness would give a false equality.
- On ℂ², J(z₁,z₂)=(−conj z₂,conj z₁) satisfies J²=−I; ordinary conjugation squares to I. Both are antiunitary, so antiunitarity alone does not choose the sign.

*Needs:* HilbertModules H2 for the module-category example; Mathlib `CategoryTheory.Category`, `CategoryTheory.Linear`, `CategoryTheory.MonoidalCategory`, `CategoryTheory.Karoubi` and native rigid pairings; PivotalSpherical Layers 0–2,7. Longo–Roberts §§2–3 and Appendix; signed equations also follow by transporting the two conjugate equations.

### 0.3 The unitary Temperley–Lieb category

Fix a positive loop parameter d with d≥2 or d=2cos(π/m), m≥3. Consume
Subfactors §3.1 for the analytic adjoint on Tau Ceti's `TauCeti.TemperleyLieb ℂ d n`;
Subfactors §3.2 for Markov uniqueness, the Jones–Wenzl projections, the trace
radical `R_n` as a †-stable two-sided ideal and Jones's positivity theorem
`markovTrace_nonneg_iff`, which singles out exactly these d among all d>0; and
Subfactors §3.3 for the positive path models on the half-line and on `A_(m−1)`,
`ker π_n=R_n` and the finite-dimensional C*-norms of the Jones quotients
`Q_n=TL_n/R_n`. The trace used here is Subfactors' normalised `tr_n=d⁻ⁿτ_n`,
which closes a diagram and divides by d^n on n strands. Transport these facts
to the endomorphism algebras of TemperleyLieb's diagram category through the
presentation theorem of TemperleyLieb Layer 4.

Extend the adjoint to all Hom spaces of the complex diagram category,
Hom(k,l)→Hom(l,k), by vertical reflection and complex conjugation of
coefficients, and prove it conjugate-linear, involutive, contravariant and
compatible with the tensor product. Prove that `⟨x,y⟩=tr_k(x†y)` is a positive
semidefinite Hermitian form on Hom(k,l), because x†y lies in End(k), and that
its null space is the Hom(k,l) part of the negligible ideal of TemperleyLieb
Layer 6; on End(n) this null space is `R_n`. At d≥2 the negligible ideal is
zero, and at d=2cos(π/m) it is the tensor ideal generated by the Jones–Wenzl
projection on m−1 strands (the Goodman–Wenzl theorem of TemperleyLieb Layer 6).
Give every Hom space of the negligible quotient its C*-norm: the endomorphism
algebra of k⊕l in the additive completion of the quotient is a
finite-dimensional *-algebra with a faithful positive trace, hence a C*-algebra
by the reusable lemma of Subfactors §3.3, and Hom(k,l) is its off-diagonal
corner.

For δ=−d compare the signed and positive endomorphism algebras by
`e_i↦−e_i`, preserving the normalized trace and analytic adjoint. Construct
the unitary tensor category from the positive negligible quotient and its
finite additive projection completion; prove its Hom norms, dagger, standard
conjugates and fusion rules. For d≥2 its simples have labels k≥0 and the
usual step-two tensor rule; for d=2cos(π/m) retain labels 0,…,m−2 and truncate
the upper tensor index to min(k+l,2(m−2)−k−l). This analytic category uses
the algebraic envelopes and fusion in TemperleyLieb Layers 6–7. The signed
endomorphism-algebra isomorphism is not a claim that the signed cups become
symmetric positive cups (Longo–Roberts §§2–3; Penneys §§4.5–4.6).

The unitary Temperley–Lieb category has the following API.

- The adjoint on Hom spaces is conjugate-linear, involutive, contravariant and monoidal, and restricts on End(n) to the adjoint of Subfactors §3.1.
- The trace forms on Hom spaces are positive semidefinite with null spaces the negligible Hom spaces; the quotient Hom spaces carry C*-norms from the finite linking algebras.
- Generator sign change preserves normalized traces and projection towers; cup signs remain separate duality data.
- The additive projection completion is a rigid C*-tensor category, with the algebraic Jones–Wenzl ranges as its simple objects and the stated generic and truncated fusion.

**Checks.**

- The cup ∪∈Hom(0,2) has adjoint the cap, and ∪†∪ is the closed loop d·id_0, so ‖∪‖²=d; at d=5/2, p=∪∪†/d is a projection with tr_2(p)=1/d²=4/25 and tr_2(1−p)=21/25. A linear reflection would send i∪ to i∪† and give the form value ⟨i∪,i∪⟩=−d<0.
- At d=2 the simple objects have dimensions 1,2,3,4 and nothing is negligible. At d=√2 (m=4) the labels are 0,1,2 with dimensions 1,√2,1, and the Jones–Wenzl projection on three strands has trace [4]=d³−2d=0, so it is negligible.
- At δ=−5/2, signed e=−(5/2)p and positive e=(5/2)p both give e²=δ e in their own parameter and tr_2(p)=4/25. Their normalized three-term projection relation has coefficient 4/25.
- At m=3, the simple labels are 0,1 and 1⊗1=0; at d=2 the same tensor product is 0⊕2. A generic fusion rule in the discrete case gives a spurious summand.

*Needs:* Subfactors §§3.1–3.3; TemperleyLieb Layers 0–7, specifically the presentation theorem, the categorical trace, the negligible ideal with the Goodman–Wenzl theorem, and the envelopes; §0.2. Penneys §§4.5–4.6 (Proposition 4.5.3, Facts 4.5.5, Examples 4.6.12 and 4.6.14) for the truncated quotients; Neshveyev–Tuset §2.5, pp.54–55, for the unitary Temperley–Lieb category at d≥2 and d=2cos(π/m), m≥4, and p.52 for the sign τ; the case m=3 rests on Subfactors §3.3 and Penneys Example 4.6.14; the sign comparison follows on generators and closed-diagram traces.

### Examples

The sign character of C₂, the rescaled cup and the negligible Jones–Wenzl projection
at d=√2 distinguish the leg, dagger-category and diagram-positivity interfaces.

### Dependencies

Section 0.1 uses HilbertModules H1–H3, CStarAlgebras C5.1 and VonNeumannAlgebras
V13b.SpatialNorm; §0.2 adds native category theory, HilbertModules H2 and
PivotalSpherical; §0.3 adds Subfactors §§3.1–3.3 and TemperleyLieb. None consumes
Layers 1–8 or quantum-group reconstruction.

## Layer 1: C*-bialgebras, cancellation and Haar integration

### 1.1 ClassicalMultipliers: the function algebra of a locally compact group
For a locally compact Hausdorff group G, without compactness or countability
assumptions, put `A=C₀(G,ℂ)`. Obtain the isometric star isomorphism
`A⊗min A≅C₀(G×G)`, `f⊗g↦((x,y)↦f(x)g(y))`, by composing the identification
`C₀(G)⊗min C₀(G)≅C₀(G,C₀(G))` of CStarAlgebras C5.2 with the identification
`C₀(X,C₀(Y))≅C₀(X×Y)`, `F↦((x,y)↦F(x)(y))`, proved here for locally compact
Hausdorff X and Y: the image function is continuous, and it vanishes at
infinity because F(K), for K the compact set where ‖F(x)‖≥ε, is totally
bounded in C₀(Y), so finitely many approximants confine the set where
|F(x)(y)|≥ε to a product of compact sets; the inverse `H↦(x↦H(x,·))` takes
values in C₀(Y) and is continuous by the tube lemma on the compact set where
|H|≥ε; both maps preserve products, stars and the supremum norm. Transport
the multipliers along it: CStarAlgebras C1.7 identifies `𝓜(ℂ, C₀(X))` with
the bounded continuous functions C_b(X), with the strict topology on bounded
sets as uniform convergence on compact sets.
Construct the nondegenerate star homomorphism
`Δ:A→𝓜(ℂ, A⊗min A)`, `Δ(f)(g,h)=f(gh)`, from pullback by multiplication.
Specialize CStarAlgebras C1.CommutativeMultiplierMorphisms to the
multiplication map G×G→G to obtain nondegeneracy, continuity and star
preservation. Prove the group-specific
norm identity by evaluating at (g,1), and identify the multiplier action on C₀(G×G).
Construct `ε:A→ℂ`, `ε(f)=f(1)`, and the inclusion of constants
`η:ℂ→𝓜(ℂ, A)`. Inversion is a proper homeomorphism, so its pullback is the
isometric involutive star automorphism `S:A→A`, `S(f)(g)=f(g⁻¹)`;
also give its multiplier extension to C_b(G).

Specialize the same pullback theorem to multiplication on the first and last
two coordinates to obtain Δ⊗id and id⊗Δ as nondegenerate maps from A⊗min A into
`𝓜(ℂ, A⊗min A⊗min A)`, with the associator of CStarAlgebras C5.1. Extend
them by the unique strictly continuous extensions of CStarAlgebras C1.7 and prove
`(Δ⊗id)̃∘Δ=(id⊗Δ)̃∘Δ`, by evaluation as
`f((gh)k)=f(g(hk))`, so that `(C₀(G),Δ)` is a bi-C*-algebra in the sense of
Kustermans–Vaes (Definition 2.1, p.853). Specialize it to the two unit inclusions to obtain the nondegenerate slice maps
`id⊗ε, ε⊗id:A⊗min A→A`; their multiplier extensions are evaluation
at `(g,1)` and `(1,g)` on C_b(G×G). Prove both counit identities,
with the canonical inclusion of A in `𝓜(ℂ, A)` on the right.

Make the inverse diagrams equally explicit. Specializing the proper-pullback theorem to the closed diagonal gives
the nondegenerate star homomorphism
`d:A⊗min A→A`, `d(a⊗b)=ab`; its multiplier extension is
`d̃(H)(g)=H(g,g)`. Compose it with the tensor inversion maps to obtain
`r₊(H)(g)=H(g,g⁻¹)` and `r₋(H)(g)=H(g⁻¹,g)` on C_b(G×G).
Prove `r₊∘Δ=η∘ε=r₋∘Δ` and all tensor/pullback comparison diagrams.
These compositions take values in `𝓜(ℂ, A)`; the constant ε(f) need not lie
in A when G is noncompact. On elementary tensors the formulas are
`aS(b)` and `S(a)b`. Their extension here uses commutativity and the
specified diagonal pullback; it does not posit a continuous multiplication
star homomorphism from an arbitrary noncommutative C*-tensor product.
For compact G compare these maps with Q1's unital function-algebra
example. These identities follow by evaluation from associativity, the two
unit laws and the two inverse laws, using the contravariant composition of
CStarAlgebras C1.CommutativeMultiplierMorphisms for strict composition and
the tensor identifications above.

The defining objects have the following API.

- The coproduct is isometric and its strict extensions respect composition and both unit slices.
- Inversion is an involutive isometric star automorphism; the diagonal and two inverse restrictions have the stated elementary-tensor values.

**Checks.**

- For the trivial group and f=2+i, Δf=εf=Sf=2+i; both inverse composites are the scalar 2+i, whereas the zero map fails normalization.
- For G=ℤ and f=1[0], Δf(m,n)=1[m+n=0], with norm 1 and value 1 at every (N,−N); it is not in C₀(ℤ²). Both inverse composites are the constant 1, and both unit slices are f.
- For G=S₃, g=(12), h=(23), and f=1[(123)], Δf(g,h)=1 but Δf(h,g)=0. This distinguishes multiplication from opposite multiplication.
- For a=1[1], b=1[−1] on ℤ, diagonal restriction gives 0, r₊(a⊗b)=1[1] and r₋(a⊗b)=1[−1]; inversion sends 1[1] to 1[−1] and its square returns 1[1].
- On ℤ×ℤ, H(m,n)=1[m=n=0] corresponds to F=1[0]⊗1[0] under `C₀(ℤ,C₀(ℤ))≅C₀(ℤ×ℤ)`, whereas H(m,n)=1[m+n=0] has x↦H(x,·)=δ_(−x) continuous into C₀(ℤ) with constant norm 1, so it lies in neither C₀(ℤ,C₀(ℤ)) nor C₀(ℤ×ℤ): fibrewise vanishing at infinity does not replace vanishing on the product.

*Needs:* CStarAlgebras C1.7 and C1.CommutativeMultiplierMorphisms for commutative multipliers, the strict topology and pullbacks; CStarAlgebras C5.1–C5.2 and VonNeumannAlgebras V13b.SpatialNorm for `C₀(G)⊗min C₀(G)≅C₀(G,C₀(G))` and the associator; Mathlib `ZeroAtInftyContinuousMap`, `BoundedContinuousFunction` and continuous group operations; the identification `C₀(X,C₀(Y))≅C₀(X×Y)` is proved above. Kustermans–Vaes, Definition 2.1, p.853, for the bi-C*-algebra axioms (a nondegenerate `Δ:A→𝓜(ℂ, A⊗min A)` with coassociative strict extensions) that `(C₀(G),Δ)` satisfies, and Notations and conventions, p.840, for strict extensions to multiplier algebras; the group-specific verifications are derived above.

### 1.2 Cancellation and Haar states

Construct coassociative unital C*-bialgebras and their morphisms using the
native star homomorphisms and CStarAlgebras C5.1's minimal tensor products of
star homomorphisms. Develop tensor
leg maps, their associativity/naturality, positive slice maps and compatibility
with Δ. A compact quantum group satisfies both cancellation conditions:

- The linear span of `Δ(A)(1⊗A)` is norm dense in A⊗_min A.
- The linear span of `Δ(A)(A⊗1)` is norm dense in A⊗_min A.

Develop equivalent cancellation-span formulations and transport by isomorphism,
opposite/co-opposite structures and tensor products. Cancellation is a density
condition on linear spans, not a pointwise surjectivity assertion. Give a
coassociative unital bialgebra failing cancellation, functions on
a finite monoid with an absorbing element that is not a group.

Define convolution of bounded functionals by `φ*ψ=(φ⊗ψ)Δ`. Prove boundedness,
associativity, positivity, preservation of states and separate weak-*
continuity. Define left invariance by `(id⊗h)Δ(a)=h(a)1` and right
invariance by `(h⊗id)Δ(a)=h(a)1`. Prove existence of a state h satisfying
both and uniqueness among even one-sided invariant states, without a
separability assumption. Build the proof's reusable pieces: Cesàro means of
convolution powers of a state, weak-* cluster points fixed by that state, and
the domination lemma saying `ω≤ρ` and `h*ρ=ρ*h=h` imply
`h*ω=ω*h=ω(1)h`. Prove the finite-intersection argument for all positive
functionals using both cancellation conditions. Supply the slice testing and
positive-functional separation that turn these equations into invariance.

Call h the Haar state. Specialize the native GNS Hilbert space and representation
to h, and develop their coefficient maps and null ideal. A compact quantum group is reduced when its
Haar state is faithful. Prove the tensor-product Haar formula and the
isomorphism transport law; do not assert Haar pullback along every morphism.
For C(G) recover ordinary compact-group Haar integration. Pin the
coefficient crosswalk to CompactGroups: its π_ij(g)=⟪π(g)e_j,e_i⟫
is conjugate to u_ij(g)=⟪e_i,π(g)e_j⟫ in this roadmap.
Transport coproduct, star and the defining SU(2) representation with
this conjugation explicitly. For a discrete
group Γ construct `Δ(u_g)=u_g⊗u_g` on its full group C*-algebra by
the universal unitary-representation property. On the reduced algebra
construct the Fell-absorption unitary
`W(δ_g⊗δ_h)=δ_g⊗δ_(gh)` and prove
`W(λ_s⊗1)W*=λ_s⊗λ_s`; this supplies the reduced-norm extension
of Δ. Prove coassociativity and both cancellation conditions using
the dense span of group unitaries. Identify both Haar states with
coefficient at the identity. Q4 proves the concrete nonfaithful full-group-algebra example
after the reduced-counit comparison has been established.

The defining objects have the following API.

- Bialgebra morphisms preserve the coproduct and compose; cancellation is invariant under isomorphism and tensor products.
- Convolution is associative, positive on positive functionals and state preserving; the Haar state is normalized, both invariant and unique.
- The GNS null ideal and tensor-product Haar state have the stated coefficient formulas.

**Checks.**

- For C(C₂), h(a,b)=(a+b)/2 and h(1)=1. Point evaluation at the identity gives 1 on 1[e], while h gives 1/2, excluding evaluation as Haar.
- On the monoid {1,0} with absorbing 0, Δf(0,1)=Δf(0,0)=f(0); the span Δ(A)(A⊗1) has dimension 3 instead of 4 and fails cancellation.
- For ℂΓ, h(u_g)=0 for g≠e and h(1)=1; convolution of two such functionals has the same values. On Γ=ℤ, W(δ_1⊗δ_2)=δ_1⊗δ_3 and W(λ_1⊗1)W* sends δ_1⊗δ_2 to δ_2⊗δ_3.

*Needs:* CStarAlgebras C5.1; VonNeumannAlgebras V13b.SpatialNorm for slice maps and Layer 0 for the weak-* compact state space, state separation and the GNS cyclic vector; Mathlib `PositiveLinearMap.GNS`; OperatorAlgebraDynamics D1–D2; RepresentationTheory/CompactGroups, Haar measure. Haar existence: Timmermann Theorem 5.1.6.

### Examples

C(C₂) and C*(ℤ) give the finite and infinite classical cases; §1.1 also treats C₀(ℤ).

### Dependencies

§1.1 uses only CStarAlgebras C1.7, C1.CommutativeMultiplierMorphisms and C5.1–C5.2 with VonNeumannAlgebras V13b.SpatialNorm. §1.2 adds CStarAlgebras C5.1's minimal tensor products of star homomorphisms, VonNeumannAlgebras Layer 0 and OperatorAlgebraDynamics D1–D2.

## Layer 2: Unitary corepresentations and Peter–Weyl theory

### 2.1 Analytic corepresentations and intertwiners

For arbitrary Hilbert H define a unitary corepresentation as a coaction
`δ:H→H⊗A` on the free right Hilbert A-module satisfying
`⟨δξ,δη⟩=⟨ξ,η⟩1`, `[δ(H)A]=H⊗A`, and coassociativity.
Construct the equivalent unitary operator `U∈L_A(H⊗A)` with
`δξ=U(ξ⊗1)` and `(id⊗Δ)U=U_12 U_13`. Build the leg extensions on
`H⊗A⊗A` needed to state this equation even when H is infinite-dimensional
as interior tensor products of adjointable operators (HilbertModules H3, in
the leg form of §0.1): (id⊗Δ)U is
U⊗_Δ1 on `(H⊗A)⊗_Δ(A⊗min A)≅H⊗(A⊗min A)`, the unital Δ making A⊗min A an
A–(A⊗min A) correspondence; U_12 is the interior tensor product U⊗_(ι₁)1
along ι₁(a)=a⊗1, and U_13 is U⊗_(ι₂)1 along ι₂(a)=1⊗a, which equals the leg
(U_12)_σ along the flip σ of `A⊗min A` (§0.1).
A general corepresentation operator is *invertible*
and satisfies the same equation; arbitrary noninvertible solutions are not
included in its unitarization theorem.
Construct the strictly continuous extension of positive slice maps from
`K(H)⊗_min A` to `𝓜(ℂ, K(H)⊗_min A)=L_A(H⊗A)` and its tensor-leg
and order laws; these are the slice maps used by Haar averaging below.

Intertwiners are bounded linear T with `(T⊗1)U=V(T⊗1)`.
Develop identities, composition, dagger for unitary objects, norm-closed
intertwiner spaces, invariant closed subspaces and projections, kernels,
closures of ranges, polar intertwiners and orthogonal complements. Construct
finite sums, arbitrary Hilbert sums, tensor products and their associators;
prove unitary change-of-basis formulas. For finite Hilbert H express analytic unitarity by its
coefficient matrix in an orthonormal basis, and prove independence of
that basis by unitary conjugation. Construct the coefficient-matrix description and the
finite Hilbert forgetful functor, proving it faithful, complex-linear and
dagger strong monoidal. Q3 compares it with native comodules after the
Hopf core has been constructed.

The defining objects have the following API.

- Coactions correspond to unitary free-module operators, and tensor-leg maps respect associators.
- Intertwiners form norm-closed spaces stable under composition and dagger; invariant projections give orthogonal summands.
- Finite, arbitrary Hilbert sums and tensor products have their stated universal maps and coefficient matrices.

**Checks.**

- For the trivial CQG on ℂ, δξ=ξ⊗1 and U=1, including H=0. The zero operator on H=ℂ fails the isometry equation 0=1.
- For the sign representation of C₂, the nonidentity coefficient is −1 and its tensor square is 1. Using a direct-sum rule instead would give −2.
- On the S₃ permutation representation, g=(12),h=(23) give u₁₃(gh)=1 and u₁₃(hg)=0; the column coefficient coproduct fixes the tensor order.

*Needs:* Layer 1; HilbertModules H1–H3 for the free module, its adjointable operators with the strict topology and interior tensor products, and §0.1 for the legs; CStarAlgebras C5.1 and VonNeumannAlgebras V13b.SpatialNorm for minimal tensors and slice maps; §0.2. Timmermann Definitions 5.1.4 and §5.3.

### 2.2 Unitarization and complete reducibility

Prove every invertible corepresentation operator similar to a unitary one by
Haar averaging `T=(id⊗h)(U*U)` and its positive invertibility; derive the
identity `U*(T⊗1)U=T⊗1` and unitarize by
`(T^(1/2)⊗1)U(T^(-1/2)⊗1)`. Prove every nonzero
unitary corepresentation has a nonzero finite-dimensional invariant subspace.
Construct Haar averages of compact-operator compressions, their invariant
compact C*-algebra and a nonzero finite-rank spectral projection. Deduce
irreducibles finite-dimensional and, using a maximal orthogonal family,
every unitary corepresentation an arbitrary Hilbert direct sum of finite
irreducibles. State and prove Schur's lemma, uniqueness of multiplicities
and the unitary comparison of decompositions. No countable-sum restriction
is introduced.

The defining objects have the following API.

- Haar averaging of an invertible corepresentation gives a positive invertible invariant form and a similarity to a unitary representation.
- Every unitary corepresentation decomposes as a Hilbert sum of finite irreducibles, with unique multiplicities.

**Checks.**

- For U=1 on ℂ², the averaged operator T is I₂ and the unitarized operator is I₂; its irreducible multiplicity is 2.
- For the C₂ representation U(s)=[[1,2],[0,−1]], averaging U*U and I gives T=[[1,1],[1,3]], determinant 2; U(s)*TU(s)=T.
- For U=0 on ℂ, averaging gives T=0, which has no inverse. This excludes noninvertible solutions of the corepresentation equation.

*Needs:* §2.1; Layer 1 Haar state; HilbertModules H2 module compacts; Mathlib's compact self-adjoint spectral theorem, `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` and `ContinuousLinearMap.finite_dimensional_eigenspace` in `Analysis/InnerProductSpace/Spectrum.lean`, applied to the Haar-averaged compact operators without separability of H. Timmermann Theorem 5.3.3.

### 2.3 The regular corepresentation

Construct the regular corepresentation by
`δ_h(Λ_h(a))=(Λ_h⊗id)Δ(a)`, proving its isometry by right Haar
invariance and its dense module range by cancellation. Prove the
closed linear span of its slices is A and every finite irreducible occurs
in it. Give explicit coefficient projections and finite coefficient
approximants. This is density of the span of coefficients; it does not say
every element of A is one coefficient of one finite irreducible.

The defining objects have the following API.

- The regular coaction descends through the Haar null space and extends isometrically with dense module range.
- All finite irreducibles occur, and finite coefficient spans are dense in the algebra.

**Checks.**

- For C₂ the regular space has dimension 2 and contains the trivial and sign characters once each; the sum of their dimensions is 2.
- For S₃ the regular multiplicities are 1,1,2 for irreducible dimensions 1,1,2; the resulting dimension is 1+1+4=6.
- For the trivial group, Λ(2)=2 and δ_hΛ(2)=2⊗1; coefficient span is ℂ. A zero regular coaction would send this vector to 0.

*Needs:* §§1.2,2.1–2.2; Mathlib `PositiveLinearMap.GNS`; VonNeumannAlgebras Layer 0 for the GNS cyclic vector and coefficient formulas. Timmermann Propositions 5.3.7–5.3.8.

### Examples

The C₂ sign object and S₃ regular representation distinguish tensor and direct-sum constructions.

### Dependencies

Layer 1; HilbertModules H1–H3 and §0.1; §0.2; VonNeumannAlgebras Layer 0; §§2.2–2.3 use the Haar averaging and spectral-projection route.

## Layer 3: The Hopf *-core, orthogonality and modular data

### 3.1 Orthogonality and the Hopf core

For each finite irreducible unitary u construct the conjugate matrix
bar u and prove its algebraic coaction irreducible by conjugating
invariant subspaces. For each row i construct the coefficient intertwiner
`e_j↦Λ_h(u_ij*)` into the regular corepresentation. It is nonzero
because `Σ_j h(u_ij u_ij*)=1`; invariance of its kernel and
irreducibility make it injective. Its finite-dimensional invariant image
gives the unitary regular restriction, and thereby invertibility of
bar u. Using Haar invariance and Schur's lemma,
construct the positive invertible unitarizing matrix F̃, normalized by
`Tr F̃=Tr F̃⁻¹`, with `bar u* F̃ bar u=F̃`. Prove this determines
F̃ uniquely. This construction precedes the antipode. Bundle the normalized positive two-sided integral as `AlgebraicHaar`.
The headline `schur_orthogonality` states both
orthogonality formulas directly from these finite Haar forms:

`h(u_ij* u_kl)=δ_jl (F̃⁻¹)_ik/Tr(F̃⁻¹)`,

`h(u_ij u_kl*)=δ_ik F̃_jl/Tr(F̃)`.

Coefficients of inequivalent irreducibles are orthogonal in both forms.
Prove coefficient linear independence and the algebraic Peter–Weyl direct
sum. Now let Pol(G) be their linear span; prove it a dense unital
*-subalgebra, with Δ in its algebraic tensor square. Construct the native
coalgebra/bialgebra/Hopf structure with `ε(u_ij)=δ_ij` and
`S(u_ij)=u_ji*`, using the just-proved independence for well-definedness.
A Hopf *-algebra means a native complex Hopf algebra with compatible
star algebra structure and star-preserving Δ, Tau Ceti's
`TauCeti.StarCoalgebra ℂ A`; the headlines of Layers 3 and 4 take its defining
equation `Δ(a*)=Δ(a)*` as the hypothesis `hΔ`. Consume from Tau Ceti that ε is
star-preserving (`TauCeti.StarCoalgebra.counit_star`), that S is bijective
(`TauCeti.HopfAlgebra.antipode_bijective`) and that `S⁻¹(a)=S(a*)*`
(`TauCeti.HopfAlgebra.antipode_star_antipode_star`, `S(S(a*)*)=a`), and Mathlib's
`HopfAlgebra.antipode_mul_antidistrib` for `S(ab)=S(b)S(a)`. For a unitary
coefficient matrix u in an orthonormal basis prove `S(u_ij)=u_ji*`, that is,
the entrywise antipode is the matrix adjoint, from Tau Ceti's left-inverse
equation `S(u)u=1` (`Comodule.map_antipode_mul_coefficientMatrix`) and
`uu*=1`.
Prove products, sums and basis-change compatibility, morphisms preserving
cores and the unitary finite-comodule comparison with Q2. The native
algebraic dual has coefficient matrix bar u in the dual basis; construct
its Hilbert structure using F̃.
Only now construct `F∈Hom(u,S²u)`, normalized positive with
`Tr F=Tr F⁻¹`, and prove `F̃=Fᵗ` as a theorem.

The defining objects have the following API.

- The normalized unitarizing matrix is positive definite and unique; the two weighted Schur forms distinguish its inverse and transpose.
- The coefficient core is a dense Hopf star algebra, functorial under quantum-group morphisms.
- Algebraic Haar invariance, positivity and normalization use actual slice equations, and force nontriviality of the algebra.

**Checks.**

- For a one-dimensional unitary character, F̃=1, h(u*u)=h(uu*)=1; a rescaled F̃=2 violates Tr F̃=Tr F̃⁻¹ since 2≠1/2.
- For the SUq(2) fundamental matrix at q=1/2, F̃=diag(2,1/2), Tr F̃=5/2, and the first Schur form has diagonal weights 1/5,4/5. Thus h(a*a)=1/5 and h(c*c)=4/5.
- For ℂ[C₂] the identity-coefficient integral has h(1)=1 and h((1+u)*(1+u))=2; the zero functional has normalization 0 and is excluded.
- For [[0,i],[1,0]], matrix adjoint is [[0,1],[−i,0]], while entrywise conjugation is [[0,−i],[1,0]]. The dual conventions must keep these distinct.

*Needs:* Layer 2; native Tau Ceti comodule coefficients, `TauCeti.StarCoalgebra` and `Algebra/HopfAlgebra/Star.lean`; Mathlib Hopf algebra. Neshveyev–Tuset Theorem 1.4.2, p.9, whose `ρ_U` is F̃ᵗ; Timmermann Propositions 3.2.9,3.2.17 and Theorem 5.4.1.

### 3.2 Plancherel theory and modular characters

Complete the weighted coefficient spaces in L²(h), with norm squared
`Σ_(α,i,j,k) conjugate(c_ij^α)(F̃_α⁻¹)_ik c_kj^α/Tr(F̃_α⁻¹)`
for a coefficient sum Σ c_ij^α u_ij^α. Identify the regular
representation multiplicities and this Plancherel formula.
Build algebraic convolution with functionals, pinning
`φ*a=(id⊗φ)Δ(a)` and `a*φ=(φ⊗id)Δ(a)`, and construct Woronowicz
characters `f_z(u_ij)=(F^z)_ij`, with complex powers of the positive F.
First prove these are well-defined linear functionals, basis independent,
with `f_0=ε`, `f_z*f_w=f_(z+w)`, `f_z∘S=f_(-z)` and
`f_z(a*)=conjugate(f_(-conjugate z)(a))`, without assuming
multiplicativity. From the preceding coefficient orthogonality derive
`h(ab)=h(bθ(a))` for θ(a)=f_1*a*f_1; on a coefficient matrix
θ(u)=FuF. Derive the identity on a in the irreducible coefficient
basis and b in the starred-coefficient basis, then extend bilinearly.
Use the identity three times to prove
`h(cθ(ab))=h(cθ(a)θ(b))` for every c, and use Plancherel
faithfulness to deduce θ(ab)=θ(a)θ(b), with θ(1)=1.
Then ε∘θ=f_2 is a character. Convolution and antipode give
multiplicativity of f_(2m) for all integral m. Own the finite
Vandermonde step: for fixed a,b, the defect
f_z(ab)−f_z(a)f_z(b) is a finite sum Σ_j c_j λ_j^z
with distinct positive λ_j. Its values at z=2m, m≥0, vanish;
the first finitely many equations have invertible Vandermonde matrix
on the distinct λ_j², so every c_j=0. Thus all f_z are
multiplicative before they are used in a pivotal monoidality argument.
For every finite unitary corepresentation w, define F_w by
`(F_w)_ij=f_1(w_ij)`. Prove it is positive invertible, agrees with the
normalized F on irreducibles, and is block diagonal on direct sums. This
defines F on reducible objects independently of the trace normalization.
Derive F_(u⊠v)=F_u⊗F_v from the character law.

The defining objects have the following API.

- The weighted coefficient norm gives the Plancherel isometry and the regular multiplicities.
- Modular characters obey convolution, star and antipode laws and are multiplicative; their matrices respect sums and tensor products.

**Checks.**

- At q=1/2, a coefficient sum a+c has squared Haar norm 1/5+4/5=1, with zero mixed term; replacing the weights by 1/2 would lose the individual norms.
- On the fundamental SUq(2) coefficient a, F=diag(2,1/2) gives f_z(a)=2^z and θ(a)=4a; f_0(a)=1 and f_1*f_1(a)=4=f_2(a).
- For exponential bases λ₁=1,λ₂=2, the m=0,1 equations have matrix [[1,1],[1,4]], determinant 3; a defect vanishing at these two even integers has both coefficients zero.

*Needs:* §3.1; Mathlib positive matrix powers and Vandermonde determinant; Timmermann Theorem 3.2.19 and Theorems 5.4.3,5.4.5. The finite Vandermonde argument is the displayed derivation from those coefficient formulas.

### 3.3 Duals, pivots and Kac type

Construct duals and fusion multiplicities with their finite decomposition
and Frobenius reciprocity laws. On the native finite-comodule monoidal
category construct left duals via the inverse of the explicitly supplied
`Function.Bijective (HopfAlgebra.antipode)` and their evaluation/coevaluation
triangle identities. Package the resulting `RigidCategory` as a named
definition, installed locally in every statement using its left duals,
pivot, pivotal traces or dimensions. In the commutative case consume native
`TauCeti.HopfAlgebra.antipode_antipode` and `antipodeAlgEquiv`
for S⁻¹=S, identify the pairings with native Finite/Rigid’s existing
global instance, and use that native instance in the classical cases. For Pol(G), pin the pivotal comodule map
`j_V(v)=can_V((id⊗f_1)δ(v))` into V**, where can_V is the ordinary
double-dual identification. Its matrix is F; prove colinearity using
S²u=FuF⁻¹ and monoidal naturality using the character law for f_1.
Identify the right and left pivotal traces with tr(Ff) and tr(F⁻¹f),
respectively. Use §0.2’s balanced unitary dual functor with the stated
algebraic evaluation/coevaluation. Compare its dagger-dual equations
with these evaluations/coevaluations; their squared norms are both
Tr F=Tr F⁻¹. Transport its Hilbert metrics and prove j is unitary,
`j†j=id` and `jj†=id`; evaluations and coevaluations are not
asserted unitary maps. In orthonormal coefficient bases the metric is
F̃ on the native right dual, F̃⁻¹ on the S⁻¹ left dual and F⁻²
on the double dual. Compare this pivotal structure with §0.2's balanced
conjugates and standard solutions. Prove the intrinsic dimension
`d(u)=Tr F=Tr F⁻¹`, its additivity/multiplicativity, `d(u)≥dim_H(u)`
and equality precisely when the normalized F is the identity. Prove the
corresponding Kac equivalences: Haar traciality, S²=id on Pol(G), and
all these F matrices equal to one. In that case recover ordinary
dimension-normalized orthogonality and an involutive antipode on
the Hopf core. Q4 constructs its bounded extensions to A_u
and A_r.

The defining objects have the following API.

- Inverse-antipode duals satisfy both triangle equations and compare with native commutative duals.
- The pivotal map is monoidal, the traces are tr(Ff) and tr(F⁻¹f), and intrinsic dimension is additive and multiplicative.
- Haar traciality, S²=id and identity normalized F matrices are equivalent.

**Checks.**

- For F=I₂, both pivotal dimensions are 2 and the ordinary dimension is 2; Haar is tracial in the classical SU(2) example.
- For F=diag(2,1/2), both traces are 5/2>2, but tr(F diag(1,0))=2 and tr(F⁻¹ diag(1,0))=1/2; the latter projection is not an irreducible intertwiner.
- For the trivial object, evaluation and coevaluation are scalar identities and both triangle composites are 1; on a two-dimensional classical object the cup norm squared is 2, so it is not a unitary map.

*Needs:* §§3.1–3.2; §0.2; PivotalSpherical Layers 0–2,7; native Tau Ceti Finite/RightRigid and commutative Finite/Rigid. Timmermann §3.2 and §5.4.

### 3.4 Tomita comparison

Derive `S²(a)=f_(-1)*a*f_1` and
compare the already proved modular identity with this S² formula,
using the same explicitly defined convolution actions.
Construct `σ_t(a)=f_(it)*a*f_(it)` and
`τ_t(a)=f_(-it)*a*f_(it)`, their group laws and norm-continuous
actions on the core. Prove `S²=τ_(-i)` and the KMS crosswalk
`h(ab)=h(b σ_(-i)(a))` for analytic core elements.
Prove the core is a dense Tomita algebra in Haar GNS, construct its
commuting right action, and prove the GNS vector separating for the
left von Neumann closure. Thus the vector Haar state is faithful normal
there. Identify the full closure of this concrete Tomita algebra with
the full left Hilbert algebra of VonNeumannAlgebras Layer 11, including its
left representation, closable involution and polar operators. Consume that
layer's Tomita theorem for full left Hilbert algebras and its canonical-weight
comparison, and prove its recovered weight is this Haar vector state. First
implement σ_t by the Haar-preserving unitaries U_tΛ(a)=Λ(σ_t(a)) and obtain
normal automorphisms of the von Neumann closure. Prove the KMS identity on
the analytic core, extend it by density, and use the uniqueness of the modular
group among KMS flows for a faithful normal state (VonNeumannAlgebras V10.KMS,
in the same convention `σ_t(x)=Δ^(it)xΔ^(−it)`) to identify this group with
Δ_h^(it)(·)Δ_h^(−it).
Derive its action from the KMS boundary equation rather
than treating all f_z as bounded states on a completion.

The defining objects have the following API.

- The modular and scaling groups obey the specified convolution formulas and preserve the analytic core.
- The completed Tomita algebra recovers the faithful normal Haar vector state and its modular automorphisms.

**Checks.**

- At q=1/2, σ_t(a)=4^(it)a and σ_(-i)(a)=4a; h(aa*)=4/5=h(a*σ_(-i)(a)). The inverse modular convention gives 1/20 instead.
- On the coefficient c at q=1/2, S²(c)=q²c=c/4 and τ_(-i)(c)=c/4, whereas σ_t(c)=c.
- For the classical trivial group, F=1, σ_t=τ_t=id and the GNS modular operator is 1; its polar involution is complex conjugation.

*Needs:* §§3.1–3.3; VonNeumannAlgebras V10.ModularTheory, V10.KMS and Layer 11, and V4.Normality for the faithful normal vector state. Timmermann Theorems 3.2.19,5.4.5; the Tomita identification uses the stated KMS uniqueness route.

### Examples

The SUq(2) fundamental coefficients at q=1/2 have weights 1/5 and 4/5, dimension 5/2 and nontrivial modular group.

### Dependencies

Layer 2; native Hopf/comodule API; PivotalSpherical Layers 0–2,7 and §0.2 for §3.3; VonNeumannAlgebras V4.Normality, V10.ModularTheory, V10.KMS and Layer 11 for §3.4.

## Layer 4: Algebraic compact type and the two completions

### 4.1 Algebraic compact type

Develop nonzero Hopf *-algebras of compact type over ℂ on the native Hopf API.
The headline `compactType_iff` equates a normalized positive Haar integral
with linear spanning by `unitaryCoefficientSet`, the coefficients of all finite
unitary native comodules in coordinate bases. Prove the equivalence with all
finite comodules unitarizable, spanning by finite unitary coefficients,
and a basis of coefficients of pairwise inequivalent unitary irreducibles.
An algebraic finite unitary comodule is a native finite-dimensional
comodule with a Hilbert inner product whose coefficient matrix in an
orthonormal basis is unitary; prove independence of that basis.
In the positive-integral direction first prove algebraic faithfulness of
a nonzero invariant integral on the Hopf *-algebra: neither h(a·) nor
h(·a) vanishes identically for nonzero a. Under positivity use
Cauchy–Schwarz to deduce `h(a*a)>0`. For an initial finite Hilbert product
use the averaged form `⟨v,w⟩_h=h(⟨δv,δw⟩_A)`.
The counit makes δ injective, so its orthonormal coefficient expansion
gives a sum `Σ_i h(a_i*a_i)>0` for v≠0. Prove Haar invariance of
this form and algebraic unitarization; no C*-order lower bound
is assumed before completion. Develop Q3's conjugate/orthogonality API
algebraically. In the coefficient direction first prove independence of
simple coefficient coalgebras and the spanning-to-direct-sum decomposition.
Then define the invariant functional which is one on the trivial
coefficient and zero on the other irreducible blocks, and prove that
the conjugate of each finite unitary comodule is equivalent to a member
of the unitary family. Construct positive F̃ from that unitary comparison,
then derive orthogonality from invariance/Schur theory algebraically;
these steps do not assume an analytic positive Haar state. Use these matrices
and the displayed orthogonality forms to prove `h(a*a)>0` for a≠0.
This positivity is a theorem needed for completion and reconstruction;
coefficient spanning alone is not defined to mean existence of a positive
state. The algebraic cancellation maps with their antipode inverses are Tau
Ceti's `TauCeti.HopfAlgebra.comulMulRightEquiv` and
`TauCeti.HopfAlgebra.leftMulComulEquiv`, with
`TauCeti.HopfAlgebra.comulMulLeftEquiv` for the bijective antipode of a Hopf
*-algebra.

With these algebraic orthogonality relations and the positivity `h(a*a)>0`,
the derivations of §§3.2–3.3 hold on every Hopf *-algebra with an
`AlgebraicHaar` h. The headline `haar_modular_automorphism` states that there
is exactly one algebra automorphism θ with `h(ab)=h(bθ(a))` for all a and b; on
a unitary coefficient matrix θ(u)=FuF, and uniqueness is the faithfulness of h
(Neshveyev–Tuset Theorem 1.7.3, p.22). The headline
`haar_trace_iff_antipode_involutive` is the Kac equivalence: h is a trace
exactly when S∘S is the identity (Neshveyev–Tuset Proposition 1.7.7, p.23).

The defining objects have the following API.

- For a nonzero Hopf star algebra, positive normalized Haar and spanning by finite unitary coefficients are equivalent.
- A positive normalized invariant integral has exactly one modular automorphism, and it is a trace exactly when the antipode is involutive.
- Every finite comodule is unitarizable; coefficient independence gives the algebraic Peter–Weyl sum.
- The algebraic cancellation maps, consumed from Tau Ceti, have inverses determined by the antipode, so `Δ(A)(1⊗A)` and `Δ(A)(A⊗1)` both span `A⊗A`.

**Checks.**

- For ℂ with Δ1=1⊗1, h(z)=z, the coefficient 1 spans ℂ; both sides of the compact-type equivalence hold.
- For ℂ[C₂], the two group-like unitary coefficients 1,u form a basis and h((a+bu)*(a+bu))=|a|²+|b|², positive for every nonzero pair.
- For the zero algebra, coefficient span equals the whole zero space, but a linear functional sends 1=0 to 0≠1. Nontriviality is necessary for the equivalence.
- For primitive self-adjoint x in ℂ[x], invariance would give (id⊗h)Δx=x+h(x) and h(x)1 on the two sides, forcing x=0. Thus no normalized invariant integral exists.
- On ℂ[S₃] with h(u_g)=δ_(g,e), h(u_g u_k)=δ_(gk,e)=δ_(kg,e), so h is a trace, θ=id and S²(u_g)=u_g. On the SUq(2) core at q=1/2, θ(a)=4a gives h(aa*)=4/5=h(a*θ(a)), while h(a*a)=1/5 and S²(c)=c/4: both sides of the Kac equivalence fail. The inverse automorphism, θ⁻¹(a)=a/4, would give h(a*θ⁻¹(a))=1/20.

*Needs:* Mathlib Hopf algebra; native Tau Ceti finite comodules and `Algebra/HopfAlgebra/Cancellation.lean`; §3.1 algebraic orthogonality route; §§3.2–3.3 for the modular identity and the Kac equivalences. Timmermann Proposition 2.2.4, Remark 2.2.2(iv)(c), Theorem 3.2.12; Neshveyev–Tuset Theorem 1.6.6, p.18, for the invariant functional of a Hopf *-algebra generated by unitary coefficients, Theorem 1.7.3, p.22, and Proposition 1.7.7, p.23.

### 4.2 Universal and reduced completions

Construct the universal C*-norm as the supremum over star representations.
Prove finiteness on every coefficient sum using unitary entries, and
nondegeneracy using the faithful algebraic Haar GNS representation.
Construct A_u and its universal extension property, extended Δ and ε,
and prove both cancellation conditions. For Kac cores construct the bounded involutive antipode on A_u.
Construct A_r by the Haar GNS
representation, prove the core embeds faithfully and h_r is faithful,
and extend Δ with its cancellation conditions, and in the Kac case
extend its bounded involutive antipode. Compare the GNS
regular corepresentation with Q2's regular object on the original
completion. Build the regular unitary
on `L²(h)⊗L²(h)` from

`U(Λ(a)⊗Λ(b))=(Λ⊗Λ)(Δ(a)(1⊗b))`.

Prove this formula preserves inner products by right Haar invariance,
is onto by algebraic cancellation, satisfies the pentagon
`U_12 U_13 U_23=U_23 U_12`, and implements
`Δ_r(λ(a))=U(λ(a)⊗1)U*`. Prove the resulting tensor-norm estimates
and extension to A_r. These are statements for this regular construction.

Construct the canonical quotient A_u→A_r and, for every C*-completion
of this compact-type core with its quantum-group structure, the compatible
maps from the universal completion and to the reduced completion. Compare
all their finite unitary representation categories and dense cores.
A_u has bounded counit; A_r need not. The algebraic antipode need not
be bounded even on A_u. Prove extension/transport with the stated norm
bounds `‖f(a)‖_target≤C‖a‖_source` on the core, including
the contractive star-map case; an arbitrary Hopf *-map need not extend
between reduced norms.

The defining objects have the following API.

- The universal norm is finite and separates points, and the Haar reduced completion has faithful Haar.
- The canonical completion maps preserve the dense core and its finite unitary category.
- The regular multiplicative unitary satisfies the stated pentagon and implements the reduced coproduct.

**Checks.**

- For Γ=ℤ, the regular unitary sends (δ_1,δ_2) to (δ_1,δ_3); both pentagon words send (δ_1,δ_2,δ_3) to (δ_1,δ_3,δ_6).
- For the trivial core ℂ, universal and reduced norms of 2+i are both √5 and the quotient is the identity.
- For C₂ the core element 1+u has norm 2 in both completions and Haar square norm 2; equality of C*-norm and Haar norm would give the wrong value √2.

*Needs:* §4.1; HilbertModules H2 and §0.1 for the comparison with Q2's regular corepresentation; CStarAlgebras C5.1 for minimal tensor products of star homomorphisms; VonNeumannAlgebras Layer 0 for states, GNS representations and state separation, and V13b.SpatialNorm for the spatial norm on `L²(h)⊗̂L²(h)`. Bédos–Murphy–Tuset §2 and §3, especially Theorem 3.6.

### 4.3 Coamenability

Define coamenability as the universal-to-reduced quotient being an
isomorphism. Prove its isomorphism invariance and the equivalences with
a bounded reduced counit, existence of a nonzero character on A_r,
and faithfulness of the universal Haar state. For an intermediate
completion A the corresponding criterion is faithfulness of h_A
together with boundedness of ε_A, not faithfulness alone.
Build the proof's slice-invariant Haar null ideal and the counit
testing identity: a bounded reduced counit forces this ideal in A_u
to vanish. Construct Haar-preserving translation maps from a reduced
character, their inverse on each coefficient block, and their unitary
GNS implementation; use their reduced-norm extensions to recover the
counit. Compare all canonical completion maps.
For group algebras prove coamenability equivalent to
amenability of Γ, including the reduced-counit criterion and the
nonamenable free-group counterexample. Identify `A_u(ℂΓ)=C*(Γ)` and
`A_r(ℂΓ)=C*_r(Γ)` compatibly with Q1's coproducts and canonical
quotient. Consume F3's Cayley-tree norm
calculation `‖λ(s)+λ(s)⁻¹+λ(t)+λ(t)⁻¹‖=2sqrt(3)<4`. The full counit
takes this sum to four, so it cannot extend to the reduced algebra.
Consume F3's noninjectivity theorem under those identifications and
deduce nonamenability and the nonfaithful full Haar state. Build the reduced-counit/amenability
comparison via positive regular coefficients, almost invariant ℓ²
vectors, D2's Reiter P₂ equivalence and the invariant-mean/Følner
interfaces of AmenableGroups. Do not confuse this compact-side
terminology with Haar traciality or with amenability of a compact group.
For classical compact groups identify Pol(G), A_r=C(G), and the
ordinary reduced counit and inversion using Haar's full support. Apply
the bounded-reduced-counit criterion here to prove A_u=A_r=C(G).
Reconstruction below determines the Hopf
*-core; Q4 specifies its chosen completions separately.

The defining objects have the following API.

- Coamenability is invariant under isomorphism and is equivalent to a bounded reduced counit, a reduced character and universal Haar faithfulness.
- For group cores it is equivalent to amenability; classical compact groups have a single compatible completion.

**Checks.**

- For Γ=ℤ, the interval F_N=[−N,N] has boundary ratio 2/(2N+1), tending to 0; the reduced counit takes u to 1.
- For the free group on two generators, the adjacency sum has reduced norm 2√3<4 but counit value 4; it cannot have a bounded star-character extension.
- For the reduced free-group CQG, Haar is faithful while the reduced counit is unbounded. Faithfulness alone therefore does not characterize coamenability of an intermediate completion.

*Needs:* §4.2; OperatorAlgebraDynamics D2; AmenableGroups Layers 1,5,7; FreeProbability F3. Bédos–Murphy–Tuset Theorems 2.2,2.8,3.6 and Corollary 2.9.

### Examples

ℂ[C₂] has one completion; the free-group core distinguishes its universal and reduced completions.

### Dependencies

§4.1 is algebraic; §4.2 uses §0.1, HilbertModules H2, CStarAlgebras C5.1, VonNeumannAlgebras Layer 0 and V13b.SpatialNorm; §4.3 uses OperatorAlgebraDynamics D2, AmenableGroups Layers 1,5,7 and FreeProbability F3.

## Layer 5: Compact matrix presentations

### 5.1 Matrix generation and SUq(2)

A compact matrix quantum group has a finite unitary matrix u whose entries
generate A as a C*-algebra and whose entrywise conjugate matrix is invertible and `Δ(u_ij)=Σ_k u_ik⊗u_kj`.
Prove the coefficient criterion: a unital coassociative C*-bialgebra whose
finite unitary coefficients with invertible conjugates span a dense
subalgebra satisfies both cancellation conditions. Develop bounded
universal presentations, core generation and their matrix-coordinate
universal properties before using them in Q6.

For real q with `0<|q|≤1`, construct SUq(2), generated by a,c and

`u=[[a,−q c*],[c,a*]]`,

with u unitary. Equivalently impose `a*a+c*c=1`, `aa*+q²c*c=1`,
`c*c=cc*`, `ac=q ca` and `ac*=q c*a`. Prove equivalence of these
presentations (u is unitary exactly when these five relations hold, for
every real q), existence
and nonzero representations. Construct
`Δ(a)=a⊗a−q c*⊗c` and `Δ(c)=c⊗a+a*⊗c`, prove coassociativity,
invertibility of the conjugate matrix and cancellation. On the core
prove `ε(a)=1`, `ε(c)=0`, `S(a)=a*`, `S(c)=−q c` and
`S(c*)=−q⁻¹c*`. Construct its ordered monomial basis, coefficient
core and concrete star representations. Prove `SU_1(2)≃C(SU(2))`
as compact matrix quantum groups; q=0 is not in this quantum-group family.

The defining objects have the following API.

- The bounded matrix presentation has the stated universal property and a coproduct respecting its relations.
- The SUq(2) unitary-matrix and generator-relation presentations agree, and its coefficient core has the stated antipode and basis.

**Checks.**

- At every allowed q, a=1,c=0 gives u=I₂ and a nonzero representation; a=c=0 violates the first relation 0=1.
- At q=1, a=0,c=1 gives u=[[0,−1],[1,0]], whose adjoint product is I₂; q=1/2 with this same tuple gives aa*+q²c*c=1/4≠1.
- At q=1/2, S(c)=−c/2 and S(c*)=−2c*, so S²(c)=c/4; replacing both factors by −1 would incorrectly make S²(c)=c.

*Needs:* Layers 1,3,4; CStarAlgebras C5.1 for minimal tensor products of star homomorphisms; VonNeumannAlgebras Layer 0 for representations and state separation. Timmermann Chapter 6 §2; Bédos–Murphy–Tuset §2, pp.12–14.

### 5.2 Free orthogonal quantum groups

For a nonempty finite index set of cardinality n, take invertible complex
F with `F bar F=cI`, c real and nonzero. Construct the free orthogonal
quantum group O_F^+, with universal A_o(F) generated by a unitary matrix
u and relation `u=F bar u F⁻¹`. Prove the universal norm is finite,
the algebra nonzero, and Δ(u_ij)=Σ_k u_ik⊗u_kj defines a compact
matrix quantum group. Build its Hopf core and generator maps. Prove
presentation comparisons under nonzero scalar rescaling of F and unitary
basis changes, with the induced transformation of the fundamental matrix.
Construct the cup `E(1)=Σ_ij F_ji e_i⊗e_j` and verify
`(E*⊗1)(1⊗E)=cI`. Prove E(1) invariant for `u⊠u` under the defining
relations, `Σ_(j,l) u_ij F_lj u_kl=F_ki`.
Retain the sign of c. Normalize the two conjugate
solutions and identify their self-duality map r with §0.2's signed
variant: the normalized cup E/√|c| has zigzag sign ε=sign(c),
corresponding to r̄r=εφ and to J²=ε in the finite-Hilbert realization.
Here `J(v)=F conjugate(v)/sqrt(|c|)` is an antilinear map. Prove it
is antiunitary precisely when F is proportional to a unitary; compare
the general map through Rep(O_F^+)'s chosen unitary dual functor and its
fibre Hilbert metrics.
Derive `d(u)≤‖E(1)‖²/|c|`, with
`‖E(1)‖²/|c|≥n` by AM–GM. Prove equality in this latter inequality
iff F is proportional to a unitary. Q7 proves irreducibility and then
standardness of this solution and the intrinsic-dimension equality.
Symmetric self-duality
and negative Frobenius–Schur sign are distinct; positive symmetric TL
cups cannot silently replace the signed conjugate data.

The defining objects have the following API.

- Free orthogonal universal presentations respect rescaling and unitary congruence of F.
- The signed cup satisfies its invariant and zigzag equations, with normalized sign sign(c).
- The dimension bound and antiunitarity criterion distinguish a general admissible F from a scalar multiple of a unitary.

**Checks.**

- For F=[[0,1],[−2,0]], F bar F=−2I, the cup is −2e₀⊗e₁+e₁⊗e₀, its squared norm is 5 and its normalized zigzag is −I.
- For that F, the intrinsic dimension bound is 5/2>2, and J(e₀)=−√2 e₁ has squared norm 2, so J is not antiunitary.
- For F=I₂, c=1, the cup squared norm is 2 and J is conjugation. For n=1,F=1, the relation gives u*=u and u²=1, the C₂ boundary case.

*Needs:* §5.1; §0.2; Layer 3 duality. Banica Proposition 1 and Lemma 1; Malacarne §2, Lemma 2.1.

### Examples

SU₁(2) is classical, SU_(1/2)(2) is non-Kac, and the one-dimensional free orthogonal example is C*(C₂).

### Dependencies

Layers 1,3,4; CStarAlgebras C5.1; VonNeumannAlgebras Layer 0; §0.2 for signed conjugates.

## Layer 6: Tannaka–Krein reconstruction

### 6.1 Reconstruction from a fiber functor

Let C be an essentially small rigid C*-tensor category, closed under
finite sums and subobjects, with simple unit, and a unitary fiber functor
τ:C→Hilb_f. Use a skeleton in `Type u` and form the coefficient algebra
in the same controlled universe; prove independence of the skeleton.
Define its coefficient algebra by generators and relations imposed by all
intertwiners, multiplication, star, Δ, ε and S. Prove the Hopf *-laws
and that its coefficients are unitary. Apply Q4's *proved* compact-type
positivity and completion theorems. Construct a unitary monoidal
equivalence C≃Rep_f(G) and the natural unitary monoidal comparison of τ
with the forgetful functor. Prove full faithfulness by recovering exactly
the prescribed intertwiner spaces, and essential surjectivity through
finite sums, conjugates and subobjects.

The defining objects have the following API.

- The coefficient quotient respects all intertwiner relations and carries Hopf star operations.
- The reconstructed representation category is equivalent to the original one with its fiber functor, independently of skeleton choice.

**Checks.**

- For finite Hilbert spaces with their ordinary forgetful functor, every linear map is an intertwiner, so coefficient relations leave only ℂ and the trivial CQG.
- For Rep(C₂) with its forgetful functor, the reconstructed core is C(C₂), dimension 2; collapsing the sign coefficient to 1 would reduce it to dimension 1.
- For Rep(S₃), the irreducible block dimensions give 1²+1²+2²=6 coefficients. Taking only diagonal coefficients would give 1+1+2=4 and fail reconstruction.

*Needs:* §4.1–§4.2; §5.2; §0.2. Malacarne Theorem 4.1, preprint pp.5–6.

### 6.2 Finite generators and filtered unions

Give the concrete finite-generator construction: spaces
`C(k,l)⊆B(H^⊗k,H^⊗l)` contain identities and are closed under
tensor product, composition and dagger; there is a cup
`R:ℂ→H⊗H` with `(R*⊗1)(1⊗R)=±1`. Construct the tensor algebra
of coefficient functionals, with
A=T(B(H)*), A_(≤n)=⊕_(k=0)^n B(H^⊗k)* and finite intertwiner
commutant B_n. Construct the bialgebra on A with
Δ(u_ij)=Σ_k u_ik⊗u_kj and ε(u_ij)=δ_ij. Identify the degree-k
part with the dual coalgebra of B(H^⊗k), preserving the
U_13 V_23 tensor coefficient convention. Construct its annihilator subspace/coideal
I_n=B_n^⊥ inside A_(≤n). Prove the compatibility
I_(n+1)∩A_(≤n)=I_n using the bicommutant theorem of
VonNeumannAlgebras Layer 1 on the finite-dimensional spaces H^⊗k, and prove
A_(≤m)I_n+I_n A_(≤m)⊆I_(m+n). Prove counit vanishes on I_n
and its coproduct lies in I_n⊗A_(≤n)+A_(≤n)⊗I_n. The finite
truncation is a coalgebra, with no assertion that it is a subalgebra.
Prove the increasing union I=⋃_n I_n is a bi-ideal of the full A, and
construct the induced finite-stage injections A_(≤n)/I_n→A/I.
For H=0 construct the quotient ℂ and trivial compact quantum group
directly, including its degree-zero coefficient comparison. For dim H>0 pass through
Q5's free orthogonal Hopf core: write
R=Σ_(i,j) F_ji e_i⊗e_j with F bar F=±1, and construct the
bi-ideal I_F generated by its cup relations. Prove I_F⊆I and
A/I_F≅Pol(O_F^+) (Malacarne Lemma 2.1), preserving coefficient
generators. Transport the star and antipode through this comparison;
prove the remaining ideal a Hopf *-ideal. Use finite-dimensional
bicommutants to show no extra intertwiners have been imposed. Construct
the generator reduction by adjoining conjugates and finite sums.

For an arbitrary generating set, use its finite subsets, their full rigid
C*-subcategories, the compatible coefficient embeddings and filtered
union of Hopf *-cores. Prove every object and intertwiner appears in
such a finite subcategory. Construct the canonical isomorphism from
this filtered union to the generators-and-relations algebra defined
above, preserving every coefficient, Hopf structure and the
fiber-compatible representation equivalence. The resulting equivalence
has the stated generality. Do not assert a single finite-dimensional
fundamental matrix for an infinitely generated C.

The defining objects have the following API.

- Finite coefficient truncations inject compatibly, and their annihilators form a Hopf star ideal in the full tensor algebra.
- Finite generating subcategories assemble by filtered union and recover every object and intertwiner.

**Checks.**

- For H=0, degree zero is ℂ and all positive-degree coefficient spaces are zero; the quotient is ℂ, not the zero algebra.
- For H=ℂ, the degree ≤1 tensor space has dimension 2, with distinct degree-zero and degree-one basis vectors; multiplying the degree-one vector by itself leaves this truncation.
- For a character category generated by two independent characters z,w, a single generator misses w, whereas their finite generating subset contains zw. This distinguishes filtered union from one fixed fundamental matrix.

*Needs:* §6.1 coefficient-algebra definition; §5.2; VonNeumannAlgebras Layers 1 and 3 for finite-dimensional bicommutants and the classification of finite-dimensional von Neumann algebras. Malacarne Lemmas 1.2, 2.1, 2.2 and 3.1 and the proof of Theorem 4.1, preprint pp.2–6.

### 6.3 Uniqueness and commutative reconstruction

Prove uniqueness up to Hopf *-isomorphism with its fiber-compatible
representation data, and naturality under unitary equivalences of
fiber-functor pairs. Compare universal and reduced reconstructed compact
quantum groups using Q4; do not turn algebraic uniqueness into a claim
of a unique C*-norm. For symmetric fiber data preserving the usual Hilbert flip, prove
the reconstructed coefficient algebra commutative. Prove every
commutative compact quantum group is C(G): recover a compact Hausdorff
space by Gelfand duality and associative multiplication from Δ.
Cancellation spans separate pairs and imply both topological cancellation
laws. Prove a compact Hausdorff cancellative semigroup is a group:
construct an idempotent in each closed cyclic subsemigroup using a
minimal compact subsemigroup; cancellation makes it the global identity,
and compactness of powers supplies inverses. Construct the identity
and inverse without assuming boundedness of the core ε and S.
Prove the resulting counit/inversion agree with the core maps, and
that the representation equivalence recovers its original fiber data.
Ordinary compact-group Haar has full support, so every commutative
compact quantum group has faithful Haar. Compare this reconstruction
with Q4's single classical-group completion theorem A_u=A_r=C(G),
including its counit, inversion and original fibre functor.

The defining objects have the following API.

- Fiber-compatible equivalence determines the Hopf core and its specified completions.
- Symmetric fiber data gives a commutative core; a commutative compact CQG reconstructs a compact group with matching counit, inverse and Haar.

**Checks.**

- For inclusion {e}→C₂, the function map is ℂ²→ℂ, (a,b)↦a; reversing it loses the required arrow direction.
- For the finite absorbing monoid {1,0}, 0·1=0·0 with 1≠0, so it fails cancellation and cannot pass group reconstruction.
- For C(C₂), the recovered identity is e, the inverse fixes both elements, and Haar gives each point mass 1/2; both points lie in its support.

*Needs:* §§6.1–6.2; Mathlib `gelfandStarTransform`, `gelfandStarTransform_naturality`, `WeakDual.CharacterSpace.compContinuousMap` and `WeakDual.CharacterSpace.homeoEval` for Gelfand duality; CStarAlgebras C5.2 for `C(X)⊗min C(X)≅C(X×X)`; Layer 1 cancellation. Malacarne Theorem 4.1 for fiber reconstruction; the compact-semigroup step is the idempotent/cancellation argument stated above.

### Examples

Finite Hilbert spaces reconstruct ℂ; Rep(C₂) and Rep(S₃) reconstruct their 2- and 6-dimensional function algebras.

### Dependencies

Layers 4–5; §0.2; VonNeumannAlgebras Layers 1 and 3 for finite-dimensional bicommutants; CStarAlgebras C5.2 and Mathlib's Gelfand duality for §6.3.

## Layer 7: SUq(2), free orthogonal fusion and Haar calculations

### 7.1 SUq(2) representations and Haar integration

For SUq(2) construct exactly one irreducible r_k of Hilbert dimension
k+1 for every k≥0, the conjugate solutions, matrix coefficients and
Clebsch–Gordan intertwiners. Prove the SU(2) fusion rules and completeness,
including the classical endpoint and the negative-q signed duality.
For `0<|q|<1`, compute the Haar functional on the ordered monomial basis
and prove its functional-calculus consequence
`h(f(c*c))=(1−q²)Σ_(j≥0)q^(2j) f(q^(2j))` for continuous f.
Derive the normalized F matrices, quantum dimensions, modular character
values and modular group on generators. At q=1 identify r_1 with the
defining matrix action on ℂ², and hence with CompactGroups' su2Irrep 1
by an actual unitary intertwiner. Derive Haar integration of all ordered
monomials from the SU(2) unit-sphere coordinates
a=√(1−t)z, c=√t w, 0≤t≤1 and z,w∈𝕋: prove normalized invariant
measure has pushforward dt dz dw, using the sphere-volume Jacobian
and invariance. Phase integration gives the monomial values and
`h(f(c*c))=∫_0^1 f(t)dt`, including non-class functions.
For q=−1 construct the
reduced matrix-function model `a=sqrt(1−t) z σ₃`,
`c=sqrt(t) w σ₁`, (t,z,w)∈[0,1]×𝕋², and prove the Haar
state is the integral of the normalized 2×2 trace with dt and Haar
dz,dw. Prove the core representation faithful and the invariant
monomial identities; in particular `h(f(c*c))=∫_0^1 f(t)dt`.
Neither endpoint is obtained by substituting into a divergent series.
Prove SUq(2) coamenable throughout `0<|q|≤1`. In the interior
use the weighted shift model on ℓ²(ℕ×ℤ),
`a e_(k,j)=√(1−q^(2k)) e_(k−1,j)` and `c e_(k,j)=q^k e_(k,j+1)`, with
e_(−1,j)=0, and identify its kernel with the Haar null ideal. For the unit
vectors `ξ_n=n^(−1/2)Σ_(k<n) e_(k,0)` the values
`⟨ξ_n,aξ_n⟩=n⁻¹Σ_(1≤k<n)√(1−q^(2k))` tend to 1. The vector states at ξ_n
have a weak-* cluster point ω in the state space of B(ℓ²(ℕ×ℤ)), and ω(a)=1;
restrict ω to the reduced image. Since a*a≤1 and aa*≤1, Cauchy–Schwarz for
positive functionals gives ω(a*a)=ω(aa*)=1=|ω(a)|², hence ω(c*c)=ω(cc*)=0.
For a state, ω(x*x)=|ω(x)|² forces ω(yx)=ω(y)ω(x) for every y, by
Cauchy–Schwarz applied to x−ω(x)1, and ω(xx*)=|ω(x)|² forces
ω(xy)=ω(x)ω(y). So a, a*, c and c* lie in the multiplicative domain of ω,
which is a closed star subalgebra, and ω is a character of the reduced
algebra with ω(a)=1 and ω(c)=0. Apply Q4's character criterion.
At q=1 use the classical comparison; at q=−1 identify the above
faithful-Haar matrix-function model with the reduced completion and
take its character at t=0, z=1 on the σ₃ eigenvalue-one component.

The defining objects have the following API.

- SUq(2) simples, tensor decompositions and conjugate solutions cover the signed parameter interval including both endpoints.
- Haar monomial integration yields the interior geometric distribution and endpoint uniform distribution of c*c.
- The reduced character proves coamenability and compares all completions.

**Checks.**

- At q=1/2, h(c*c)=4/5 and h((c*c)²)=16/21. At either endpoint q=±1 these values are 1/2 and 1/3, so direct substitution in the geometric series is invalid.
- For r₁⊗r₁, Hilbert dimensions give 2·2=1+3; at q=1/2 intrinsic dimensions give (5/2)²=1+21/4.
- At q=−1,t=0,z=1, the matrix model has a=σ₃,c=0; evaluation on the positive σ₃ eigenspace sends a to 1,c to 0, the counit character.
- At q=1/2, ⟨ξ_2,aξ_2⟩=(1/2)√(3/4)=√3/4 and ⟨ξ_3,aξ_3⟩=(√3/2+√15/4)/3, and the averages tend to 1; every single basis vector has ⟨e_(k,0),ae_(k,0)⟩=0, so vector states at basis vectors cannot produce the character.

*Needs:* Layers 3–6; VonNeumannAlgebras Layer 0 for the weak-* compact state space of B(ℓ²(ℕ×ℤ)); Mathlib `PositiveLinearMap.norm_map_star_mul_le` and `PositiveLinearMap.norm_map_mul_star_le` for Cauchy–Schwarz; RepresentationTheory/CompactGroups, SU(2). Bédos–Murphy–Tuset Theorem 2.12, pp.13–14, for the weighted shift model, and Corollary 2.13; Timmermann Chapter 6 §2. Endpoint integration follows the explicit models above.

### 7.2 Free orthogonal fusion and coamenability

For O_F^+ and n≥2 prove Banica's representation theorem. Construct the
concrete tensor category generated by its signed cup/cap maps and identify
it with the entire intertwiner category by Q6 and the universal
presentation. Prove End(u)=ℂ, hence the normalized conjugate solution
from Q5 is standard and `d(u)=‖E(1)‖²/|c|`. For cup-cap projections on adjacent tensor factors prove
`p_i²=p_i*=p_i`, distant commutation and
`β p_i p_(i±1) p_i=p_i`, with
`β=c⁻²‖E(1)‖⁴=d(u)²`. Compare with the TL positive quotient while
retaining the signed conjugate structure. Construct the Catalan dimension
upper bound. Choose real q with `0<|q|≤1` by `|q|+|q|⁻¹=d(u)` and
`sign(q)=−sign(c)`, and use the SUq(2) signed cup, Haar moment
crosswalk. The signed algebraic loop is δ=−(q+q⁻¹)=sign(c)d(u),
whereas §0.3 uses the positive-loop parameter d(u). Identify normalized
projections p_i in both presentations; the signed generator is δ p_i
and the positive generator is d(u)p_i. Prove the generator rescaling,
normalized Markov trace and quotient comparison, keeping the signed
cup/duality data separate from that algebra isomorphism. Use the Haar moment
calculation and faithful TL trace form to transfer the matching lower
bound. Prove the positive quotient comparison and the intertwiner
dimension equality, then build
the irreducibles/Jones–Wenzl ranges. Prove all irreducibles are r_k,
k≥0, r_0=1,r_1=u, with

`r_k⊗r_l ≃ r_|k−l| ⊕ r_|k−l|+2 ⊕ … ⊕ r_(k+l)`.

Separate the dimension recurrences: Hilbert dimensions have
`a_0=1,a_1=n,a_(k+1)=n a_k−a_(k−1)`; intrinsic dimensions
replace n by d(u). Prove equality of the two scales exactly when F
is proportional to a unitary, and work out a non-Kac admissible F.
Prove the Haar distribution of the self-adjoint fundamental character
χ=Σ_i u_ii is the centered variance-one semicircular law on [−2,2],
using its Catalan moments and compactly supported moment uniqueness.
For n>2 deduce failure of coamenability: ε(χ)=n whereas the reduced
Haar spectral support is [−2,2]. Supply the faithful-Haar spectral
support argument and the invertibility contradiction. For n=2 prove
that nonzero scalar rescaling and unitary congruence `F↦VFVᵗ`
reduce every admissible F to `[[0,1],[−q⁻¹,0]]` for a real
`0<|q|≤1`, and construct the induced compact-quantum-group
isomorphism `O_F^+≃SUq(2)`. At n=1 prove instead
`A_o(F)=C*(ℤ/2)`, with two irreducibles and two-point character law;
the infinite fusion and semicircular assertions do not hold there.

The defining objects have the following API.

- Signed cup intertwiners identify the complete free orthogonal representation category and its fusion.
- Hilbert and intrinsic dimensions obey different recurrences unless F is proportional to a unitary.
- The fundamental character has the semicircular law for n≥2, yielding the stated coamenability classification.

**Checks.**

- For F=[[0,1],[−2,0]], d=5/2, signed loop δ=−5/2 and positive loop 5/2. The generators are −(5/2)p and (5/2)p, while β=d²=25/4 is unchanged.
- For n=2,d=5/2, Hilbert dimensions start 1,2,3,4; intrinsic dimensions start 1,5/2,21/4,85/8. Equality of the sequences would already fail at r₁.
- For n=3, ε(χ)=3 lies outside [−2,2], excluding coamenability. Semicircular moments m₂=1,m₄=2 differ from the n=1 two-point law with m₂=m₄=1.

*Needs:* §7.1; §§5.2,6.1–6.2; TemperleyLieb Layers 0–7; §0.3; FreeProbability F1,F6. Banica Theorem 1 and Proposition 2, pp.1–4.

### Examples

The parameters n=1,2,3 distinguish the two-point law, coamenable rank-two case and noncoamenable semicircular examples.

### Dependencies

Layers 3–6; TemperleyLieb Layers 0–7; §0.3; VonNeumannAlgebras Layer 0; FreeProbability F1,F6.

## Layer 8: Generic U_q(sl₂), signed modules and integrability

Work over ℂ. Modules in this layer are algebraic modules, with no topology or
finite-dimensional assumption unless stated. The presentation, iterated Ore
presentation, PBW basis, domain property and Hopf structure of §8.1 hold for
every q≠0; at q=±1 the totalized presentation is the commutative algebra
ℂ[E,F,K,K⁻¹]. From §8.2 on the classification theorems take q generic: q≠0
and q^r≠1 for every positive integer r, the native predicate
`TauCeti.IsGenericQuantumParameter q`; in particular q≠±1. Quantum integers are
the native `TauCeti.quantumInteger`, [r]_q=(q^r−q^(−r))/(q−q⁻¹) for r∈ℤ with the
denominator totalized at q=±1, with the recurrence
[r+1]_q=(q+q⁻¹)[r]_q−[r−1]_q (`TauCeti.quantumInteger_add_one`), the sign law
[−r]_q=−[r]_q (`TauCeti.quantumInteger_neg`) and nonvanishing for r≠0 at
generic q (`TauCeti.quantumInteger_ne_zero`); `TauCeti.laurentQuantumInteger`
is the Laurent polynomial in ℤ[v,v⁻¹] that evaluates to it.

### 8.1 Presentation, PBW and Hopf API

U_q is the native `TauCeti.UqSl2 q`, the `RingQuot` of `FreeAlgebra ℂ` on the
generators `TauCeti.UqSl2.Generator` by the relations `TauCeti.UqSl2.Rel q`:
KK⁻¹=K⁻¹K=1, KE=q²EK, KF=q⁻²FK and EF−FE=(K−K⁻¹)/(q−q⁻¹). The images of the
generators are `TauCeti.UqSl2.e`, `f`, `k` and `kInv`, and
`TauCeti.UqSl2.kUnit` bundles K with its inverse. The universal property for
relation-respecting generator tuples in an arbitrary complex algebra is
`TauCeti.UqSl2.lift` on `TauCeti.UqSl2.GeneratorTuple`, and
`TauCeti.UqSl2.induction` gives extensionality on generators. For every q≠0
the ordered monomials F^a K^b E^c, (a,b,c)∈ℕ×ℤ×ℕ, form the basis
`TauCeti.UqSl2.pbwBasis` (`TauCeti.UqSl2.pbwBasis_apply`), the triangular
decomposition U⁻⊗U⁰⊗U⁺≃U_q is `TauCeti.UqSl2.triangularEquiv`, and the
subalgebra inclusions are `TauCeti.UqSl2.transcendental_f`,
`TauCeti.UqSl2.transcendental_e` and `TauCeti.UqSl2.laurentEval_kUnit_injective`.

The PBW basis comes from the iterated Ore presentation. The reusable
σ-derivation Ore extension is the native `TauCeti.OreExtension σ δ` over a
k-algebra R, on finitely supported left-coefficient sequences, with
T r=σ(r)T+δ(r) for a k-algebra endomorphism σ and a `TauCeti.SigmaDerivation σ`,
a k-linear δ with δ(rs)=σ(r)δ(s)+δ(r)s. Its left monomial basis
`TauCeti.OreExtension.monomialBasis` exists for every σ; the right-coefficient
basis `TauCeti.OreExtension.rightCoeffLinearEquiv` needs σ bijective; over a
domain an injective σ gives a domain (`TauCeti.OreExtension.isDomain`); the
universal property is `TauCeti.OreExtension.liftAlgHom`; and
`TauCeti.OreExtension.skewPolynomialEquiv` identifies δ=0 with Mathlib's
`SkewPolynomial` under the local action `RingHom.powersMulSemiringAction`
induced by σ, with no global q-dependent instance. Starting from ℂ[K,K⁻¹],
adjoin F with σ_F(K)=q²K and then E with σ_E(K)=q⁻²K, σ_E(F)=F, δ_E(K)=0 and
δ_E(F)=(K−K⁻¹)/(q−q⁻¹); the triangular-matrix algebra map
r↦[[σ_E(r),δ_E(r)],[0,r]] supplies the σ_E-derivation
(`TauCeti.SigmaDerivation.ofMatrix`). For every q≠0,
`TauCeti.UqSl2.oreTowerEquiv` identifies the tower `TauCeti.UqSl2.OreTower`
with U_q; its left-coefficient basis K^b F^a E^c equals q^(−2ab) F^a K^b E^c,
which gives the PBW basis, and both twists are injective, so U_q is a domain,
`TauCeti.UqSl2.instIsDomain`. Neither step uses the generic hypothesis: δ_E
respects the relation FK=q²KF of the first extension because δ_E(FK)=δ_E(F)K
and δ_E(q²KF)=q²σ_E(K)δ_E(F) both equal K(K−K⁻¹)/(q−q⁻¹) for every q≠0.

Under `[Fact (q≠0)]`, the native `HopfAlgebra` instance
`TauCeti.UqSl2.instHopfAlgebra` lives on this quotient, with ΔK=K⊗K,
ΔE=E⊗1+K⊗E and ΔF=F⊗K⁻¹+1⊗F (`TauCeti.UqSl2.comul_k`, `TauCeti.UqSl2.comul_e`,
`TauCeti.UqSl2.comul_f`), εK=1, εE=εF=0, S(K)=K⁻¹, S(E)=−K⁻¹E and S(F)=−FK
(`TauCeti.UqSl2.counit_k`, `TauCeti.UqSl2.antipode_e`,
`TauCeti.UqSl2.antipode_f`). The square of the antipode is conjugation by K⁻¹
(`TauCeti.UqSl2.antipode_antipode`), S is bijective
(`TauCeti.UqSl2.antipode_bijective`), and `TauCeti.UqSl2.antipodeEquiv` is S as
an algebra isomorphism onto the opposite algebra, with inverse x↦K S(x) K⁻¹.
The automorphisms E↦tE, F↦t⁻¹F for t≠0 are `TauCeti.UqSl2.rescale`, and the
algebra isomorphism from the q⁻¹ presentation sending K to K⁻¹ and fixing E and
F is `TauCeti.UqSl2.inverseParameterEquiv`. It is not a Hopf isomorphism for
this coproduct; its transported coproduct is
`TauCeti.UqSl2.inverseParameterComul`, with
`TauCeti.UqSl2.inverseParameterComul_inverseParameterEquiv`.

The defining objects have the following API.

- The presentation and Ore tower have universal maps, extensionality and the same ordered monomial basis for every q≠0; the quotient is a domain for every q≠0.
- The coproduct, counit and antipode respect the relations, including negative K powers; the coproduct convention is fixed on generators.
- Quantum integers have Laurent expressions, sign and recurrence laws and are nonzero at nonzero integers under the generic hypothesis.

**Checks.**

- At q=1/2, [−2]_q=−5/2,[−1]_q=−1,[0]_q=0,[1]_q=1,[2]_q=5/2; q−q⁻¹=−3/2 is nonzero. At q=1 the totalized quotient formula gives 0, unlike the Laurent specialization [2]_1=2.
- The PBW monomials with indices (0,0,0),(0,−1,0),(1,0,1) are 1,K⁻¹,FE. At q=1/2, KF=4FK agrees with q^(−2ab)=4 for a=b=1; the inverse coefficient 1/4 fails.
- On L₁⁺ at q=1/2, K=diag(1/2,2), K⁻¹=diag(2,1/2), E=[[0,1],[0,0]], F=[[0,0],[1,0]]; EF−FE=diag(1,−1)=(K−K⁻¹)/(−3/2).
- At q=0, the relations and invertible K force E=F=0; hence a PBW family indexed by arbitrary E,F powers would contain zero. At q=±1 the totalized presentation is commutative, so the generic center theorem cannot apply.
- At q=i, where q²=−1 and i⁴=1, KE=−EK, KF=−FK and EF−FE=(K−K⁻¹)/(2i). With σ_E(K)=−K, σ_E(F)=F and δ_E(F)=(K−K⁻¹)/(2i), both δ_E(FK) and δ_E(q²KF)=(−1)(−K)(K−K⁻¹)/(2i) equal K(K−K⁻¹)/(2i), so the Ore tower, the basis F^aK^bE^c and the domain property hold at this root of unity. There K⁴ is central, since K⁴E=q⁸EK⁴=EK⁴, but it is not a polynomial in Ω, whose nonconstant polynomials all have a nonzero F^nE^n coefficient: genericity is needed for the center of §8.3, not for PBW.
- For the Ore relation with σ=id, δ(x)=1, Tx=xT+1; at δ=0 it becomes Tx=xT. For σ(x)=2x, δ=0 it becomes Tx=2xT, distinguishing the two independent inputs.

*Needs:* Tau Ceti `QuantumGroups/UqSl2/{Basic,PBW,Triangular,OreTower,Hopf,Antipode,Rescale}`, `QuantumGroups/UqSl2/InverseParameter/`, `QuantumGroups/QuantumInteger/` and `Algebra/OreExtension/`; Mathlib FreeAlgebra, RingQuot, LaurentPolynomial, SkewPolynomial, TensorProduct, HopfAlgebra. Virelizier §2.3, Proposition 2.4, p.8, fixes the Hopf convention and monomial spanning.

### 8.2 Modules, weights and highest-weight construction

Modules are native complex modules with a U_q action and a compatible scalar
tower, equivalently complex algebra maps to `Module.End ℂ V`; intertwiners,
kernels, quotients and arbitrary algebraic direct sums are native. Tensor and
dual actions come from §8.5's generic Hopf-module construction after §8.1's
Hopf structure; the weight and highest-weight arguments of this section use no
tensor or dual input. The K eigenspaces and generalized eigenspaces are
`TauCeti.UqSl2.weightSpace` and `TauCeti.UqSl2.genWeightSpace`, with E and F
shifting λ to q²λ and q⁻²λ. Local finiteness, finite dimension over ℂ of each
cyclic U_q-submodule with the scalar tower ℂ→U_q, is the native predicate
`TauCeti.IsLocallyFiniteModule ℂ (UqSl2 q) V`. The Verma module
`TauCeti.UqSl2.VermaModule q μ` is the quotient by the left ideal UE+U(K−μ),
with basis F^j v₀, j≥0, for nonzero q and μ (`TauCeti.UqSl2.VermaModule.basis`),
its singular-vector criterion
`TauCeti.UqSl2.VermaModule.e_smul_vec_succ_eq_zero_iff`, its simplicity
criterion `TauCeti.UqSl2.VermaModule.isSimpleModule_iff` and its simple
quotient `TauCeti.UqSl2.VermaModule.ladderModuleEquivQuotient`. For m≥0 and a
sign ε∈ℤˣ the signed ladder module `TauCeti.UqSl2.LadderModule q m ε` is L_m^ε,
with basis v₀,…,v_m and K v_j=εq^(m−2j)v_j, F v_j=[j+1]_q v_(j+1) and
E v_j=ε[m−j+1]_q v_(j−1), with out-of-range vectors zero. At generic q it is
simple (`TauCeti.UqSl2.LadderModule.isSimpleModule`), the L_m^ε are pairwise
nonisomorphic (`TauCeti.UqSl2.LadderModule.nonempty_linearEquiv_iff`) and each
has endomorphism algebra ℂ
(`TauCeti.UqSl2.LadderModule.algebraMap_end_bijective`).
`TauCeti.UqSl2.existsUnique_linearEquiv_ladderModule` classifies every
finite-dimensional simple module at generic q as exactly one L_m^ε, deriving a
highest vector from the finite K spectrum without assuming K diagonalizable.
With the pairwise nonisomorphism, (m,ε)↦L_m^ε is a bijection onto the
finite-dimensional simples, since εq^m=ε′q^(m′) forces q^(2(m−m′))=1, hence
m=m′ under the generic hypothesis and then ε=ε′.

The defining objects have the following API.

- Weights shift by q² and q⁻²; cyclic local finiteness is over ℂ, with a compatible scalar tower.
- Verma quotients have the prescribed basis and singular vectors; the signed finite ladders are simple, distinct and exhaust finite simples.

**Checks.**

- At q=1/2, L₀⁺ has K=1 and L₀⁻ has K=−1, with E=F=0 in both; the two nonisomorphic one-dimensional simples cannot be identified.
- For L₂⁺ the weights are 1/4,1,4; F coefficients are 1,5/2,0 and E coefficients are 0,5/2,1. The EF−FE diagonal is 5/2,0,−5/2, equal to [2−2j]_q.
- For L₁⁻, K=diag(−1/2,−2), E=[[0,−1],[0,0]], F=[[0,0],[1,0]]; EF−FE=diag(−1,1), the negative of the positive ladder. The zero module has dimension 0 and is not simple.

*Needs:* §8.1; Tau Ceti `QuantumGroups/UqSl2/{Weights,HighestWeight,SimpleClassification}`, `QuantumGroups/UqSl2/Verma/`, `QuantumGroups/UqSl2/LadderModule/Basic.lean` and `RingTheory/Finiteness/LocallyFinite.lean`; Mathlib Module, IsScalarTower and Submodule. Virelizier Example 3.3, Proposition 3.7 and Corollary 3.8, pp.11–12, give the type-1 inputs.

### 8.3 Casimir and finite-dimensional complete reducibility

The Casimir element `TauCeti.UqSl2.casimir` is Ω=EF+(q⁻¹K+qK⁻¹)/(q−q⁻¹)²,
which the commutator relation rewrites as Ω=FE+(qK+q⁻¹K⁻¹)/(q−q⁻¹)². It is
central (`TauCeti.UqSl2.casimir_mem_center`) and transcendental over ℂ for
every q≠0 (`TauCeti.UqSl2.transcendental_casimir`), and at generic q the whole
center is ℂ[Ω] by PBW leading-coefficient reduction
(`TauCeti.UqSl2.center_eq_adjoin_casimir`), with
`TauCeti.UqSl2.polynomialAlgEquivCenter` the isomorphism ℂ[X]≃Z(U_q) sending X
to Ω. On a highest-weight vector of weight μ it acts by
`TauCeti.UqSl2.casimirScalar q μ`=(qμ+q⁻¹μ⁻¹)/(q−q⁻¹)², which on L_m^ε is
ε(q^(m+1)+q^(−m−1))/(q−q⁻¹)²; these scalars are pairwise distinct at generic q
(`TauCeti.UqSl2.casimirScalar_units_mul_pow_inj`). At generic q every
finite-dimensional U_q-module is semisimple,
`TauCeti.UqSl2.isSemisimpleModule_of_finiteDimensional`, with no
diagonalizability of K assumed: the module splits into Casimir blocks, and on
the top generalized weight space W of a block E W=0, F^r is injective on W for
r≤m and F^(m+1)W=0 by the commutator formula
E F^r=F^r E+[r]_q F^(r−1)(q^(1−r)K−q^(r−1)K⁻¹)/(q−q⁻¹), which forces K=εq^m
on W. The multiplicity of L_m^ε in a finite-dimensional V is
dim Hom_U(L_m^ε,V), read off the formal character
(`TauCeti.UqSl2.finrank_linearMap_ladderModule_eq_formalCharacter_coeff_sub`).

Derive from complete reducibility and the classification, at generic q, that K
acts diagonalizably on every finite-dimensional module with eigenvalues ±q^k,
that every short exact sequence of finite-dimensional modules splits, and the
Hom formula dim Hom_U(V,W)=Σ_(m,ε) a_(m,ε) b_(m,ε) for V≅⊕(L_m^ε)^(a_(m,ε)) and
W≅⊕(L_m^ε)^(b_(m,ε)), with End_U(V)≅Π_(m,ε) M_(a_(m,ε))(ℂ).

The defining objects have the following API.

- The Casimir generates the center freely and separates the signed finite simples.
- Every finite-dimensional complex module splits into signed simples, with unique multiplicities and diagonalizable K.

**Checks.**

- At q=1/2, Ω on L₀⁺,L₁⁺,L₂⁺ is respectively 10/9,17/9,65/18; on the corresponding negative simples these values are negated, and all six are distinct.
- On L₁⁺ at q=1/2, FE=diag(0,1), while the toral term (qK+q⁻¹K⁻¹)/(q−q⁻¹)² is diag(17/9,8/9); their sum is (17/9)I₂. In the other form EF=diag(1,0) and (q⁻¹K+qK⁻¹)/(q−q⁻¹)²=diag(8/9,17/9), with the same sum; mixing the two orderings, FE plus the second toral term, gives diag(8/9,26/9), which is not scalar.
- L₀⁻⊕L₁⁺ has dimension 1+2=3 and Casimir blocks −10/9,17/9, so dim Hom_U(L₁⁺,L₀⁻⊕L₁⁺)=1 and End_U(L₀⁻⊕L₁⁺)≅ℂ×ℂ. The zero module is also semisimple. In the algebra itself Ω has PBW leading term FE, so Ω² has leading term F²E² with coefficient 1, distinct from degree-one polynomials.

*Needs:* §§8.1–8.2; Tau Ceti `QuantumGroups/UqSl2/{Center,CompleteReducibility,Character}` and `QuantumGroups/UqSl2/Casimir/`; Mathlib polynomial evaluation, IsSemisimpleModule and primary decomposition. Virelizier Theorem 3.13 and Corollary 3.14, p.13, give the type-1 splitting.

### 8.4 Arbitrary local finiteness and the type-1 distinction

At generic q an arbitrary locally finite module is semisimple,
`TauCeti.UqSl2.isSemisimpleModule_of_isLocallyFiniteModule`, and is isomorphic
to an algebraic direct sum of signed finite simples with arbitrary index set,
`TauCeti.UqSl2.isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule`;
the converse is part of that equivalence. The evaluation isomorphism
⊕_(m,ε) (L_m^ε⊗Hom_U(L_m^ε,V))≃V, with U_q acting on the left factors and
natural in V, is `TauCeti.UqSl2.ladderModuleTensorHomEquiv`. Type 1, the native
`TauCeti.UqSl2.IsTypeOne`, is K diagonalizable with eigenvalues in {q^k:k∈ℤ}, an
algebraic eigenspace direct sum even for infinite V. Type 1 with locally
nilpotent E,F, type 1 with local finiteness, and being a direct sum of the
L_m^+ are equivalent
(`TauCeti.UqSl2.isTypeOne_and_forall_exists_pow_smul_eq_zero_iff_exists_linearEquiv_dfinsupp_ladderModule`,
`TauCeti.UqSl2.isTypeOne_and_isLocallyFiniteModule_iff_exists_linearEquiv_dfinsupp_ladderModule`).
Signed type 1, `TauCeti.UqSl2.IsSignedTypeOne`, is algebraic spanning by K
eigenvectors with eigenvalues in {±q^k}, and together with local nilpotence of E
and F it characterizes unrestricted local finiteness,
`TauCeti.UqSl2.isSignedTypeOne_and_forall_exists_pow_smul_eq_zero_iff_isLocallyFiniteModule`.
The one-dimensional L_0^- (K=−1, E=F=0) is locally finite and locally nilpotent
but not of type 1 (`TauCeti.UqSl2.LadderModule.not_isTypeOne`), so the
unsigned integral-weight condition is not equivalent to unrestricted local
finiteness.

The defining objects have the following API.

- Local finiteness gives an arbitrary algebraic direct sum of finite signed simples and the evaluation isomorphism.
- Signed integral weights plus local nilpotence of both ladders characterize local finiteness; positive integral weights select the positive family.

**Checks.**

- L₀⁻ has one-dimensional cyclic span, E¹=F¹=0 and K=−1; at q=1/2 no q^z is −1. Thus local finiteness is true and type 1 is false.
- In the algebraic direct sum of countably many L₀⁺, every nonzero vector has cyclic dimension 1 and E=F=0, while the whole module has infinite dimension. Finite total dimension is not required.
- In the Verma module of highest weight 1, F^jv₀ is nonzero for every j and its weights are 4^j at q=1/2; it has signed integral weights but its highest cyclic span is infinite-dimensional. Local nilpotence of F excludes it.
- On the zero module the cyclic dimension is 0, the eigenvector span is the whole zero space, and n=0 already annihilates its only vector; both sides of the equivalence hold.

*Needs:* §§8.1–8.3; Tau Ceti `QuantumGroups/UqSl2/{LocallyFinite,TypeOne}`; Mathlib algebraic direct sums. Virelizier §3.2 supplies the type-1 convention.

### 8.5 Tensor, dual and explicit Clebsch–Gordan theory

For any Hopf algebra H over a field k, the finite Hopf-module category over k is
the native `TauCeti.FiniteHopfModuleCat k H`, a type synonym of native
`CategoryTheory.ObjectProperty.FullSubcategory` on `ModuleCat.{u} H` for
k:Type u and H:Type v, cut out by finite dimension over k after restriction
along `algebraMap k H`. The carrier universe is u, so the unit k, k-duals and
tensor-over-k stay in the category and match native FDRep; this is the category
that HopfologicalAlgebra §2.1 cites as FiniteHopfModuleCat k H (Q8 item 5).
Its faithful forgetful functor `TauCeti.FiniteHopfModuleCat.forgetToModule` to
`ModuleCat.{u} k` and the finite-basis shrink
`TauCeti.FiniteHopfModuleCat.ofShrink`, with the H-linear comparison
`TauCeti.FiniteHopfModuleCat.ofShrinkEquiv`, carry higher-universe finite
modules to these small models. Its native `MonoidalCategory` structure has
tensor over k through the coproduct and the counit unit action, not the tensor
over H of a commutative H, and makes `forgetToModule k H` monoidal. Right duals
are the contragredients through S,
`TauCeti.FiniteHopfModuleCat.instRightRigidCategory`, for every Hopf algebra;
given `Function.Bijective (HopfAlgebra.antipode)` the inverse-antipode left
duals `TauCeti.FiniteHopfModuleCat.leftDual` and the rigid structure
`TauCeti.FiniteHopfModuleCat.rigidCategory` are definitions, installed locally
in every statement that uses left duals, the pivot, pivotal traces, dimensions
or the dual compatibility of Clebsch–Gordan maps. For a unit g of H with
S²=Ad(g), the double-dual trivialization j_V(v)(φ)=φ(gv) is the natural
isomorphism `TauCeti.FiniteHopfModuleCat.unitEvalNatIso`, monoidal when g is
group-like in the sense of native `IsGroupLikeElem k g` (Mathlib
`RingTheory/Coalgebra/GroupLike.lean`), by
`TauCeti.FiniteHopfModuleCat.unitEvalNatIso_isMonoidal`; such a g makes S
bijective, `TauCeti.HopfAlgebra.antipode_bijective_of_antipode_antipode`.

Bundle this monoidal trivialization, with the rigid structure of the bijective
antipode, as a `TauCeti.PivotalCategory` instance on
`TauCeti.FiniteHopfModuleCat k H` for a group-like g with S²=Ad(g), and
instantiate it at U_q with g=K⁻¹, which is group-like
(`TauCeti.UqSl2.counit_kInv`, `TauCeti.UqSl2.comul_kInv`) with S²=Ad(K⁻¹) by
`TauCeti.UqSl2.antipode_antipode`: for every q≠0 the rigid structure
`TauCeti.FiniteHopfModuleCat.rigidCategory` of
`TauCeti.UqSl2.antipode_bijective` and the pivotal structure with pivot K⁻¹
are instances on `TauCeti.FiniteHopfModuleCat ℂ (TauCeti.UqSl2 q)`.
For H=k[G], restrict native
`Rep.equivalenceModuleMonoidAlgebra` to finite objects and identify this
monoidal category, its duals and the trivial pivot g=1 with PivotalSpherical
Layer 7's `FDRep k G`, consuming Layer 7's `RigidCategory (FDRep k G)`,
constructed from its canonical `LeftRigidCategory (FGModuleCat k)` and native
`Action` rigid instances, together with Mathlib's right duals. For H=k[G] prove
that the generic S⁻¹ left dual and its evaluation and coevaluation agree with
these canonical duals, using S⁻¹=S, and prove the comparison as a monoidal
equivalence rather than treating the native unbundled equivalence as monoidal.

On U_q at generic q the Clebsch–Gordan theory is native. The highest vector of
weight εδq^(m+n−2j) in L_m^ε⊗L_n^δ is
`TauCeti.UqSl2.clebschGordanVector`, Σ_(i=0)^j α_i v_i⊗v_(j−i) with α₀=1 and
α_(i+1)=−δ q^(m−2i)[n−j+i+1]_q/[m−i]_q α_i for 0≤i<j
(`TauCeti.UqSl2.clebschGordanCoeff`); the module maps
`TauCeti.UqSl2.clebschGordanInclusion` extend it along the normalized F ladder,
and `TauCeti.UqSl2.clebschGordanEquiv` is the isomorphism
L_m^ε⊗L_n^δ≃⊕_(j=0)^min(m,n) L_(m+n−2j)^(εδ). Their inverse projections
`TauCeti.UqSl2.clebschGordanProjection` are the Casimir spectral projections and
are natural (`TauCeti.UqSl2.clebschGordanInclusion_projection_naturality`), and
`TauCeti.UqSl2.clebschGordanRecouplingEquiv` is the change of decomposition on
triple products L_a^ε⊗L_b^δ⊗L_c^ζ through the tensor associator, the
module-level form of the 6j symbols. For r≥0 the symmetric quantum binomial
formulas are `TauCeti.UqSl2.comul_e_pow` and `TauCeti.UqSl2.comul_f_pow`:
Δ(E^r)=Σ_(s=0)^r q^(s(r−s)) [r choose s]_q E^s K^(r−s)⊗E^(r−s) and
Δ(F^r)=Σ_(s=0)^r q^(s(r−s)) [r choose s]_q F^(r−s)⊗F^s K^(−(r−s)). The two
tensor orders of the sign representation, with their basis rescalings, are
`TauCeti.UqSl2.LadderModule.signTensorEquiv` and
`TauCeti.UqSl2.LadderModule.tensorSignEquiv`; the contragredient of L_m^ε, with
action (aφ)(v)=φ(S(a)v), is identified with L_m^ε by
`TauCeti.UqSl2.LadderModule.contragredientEquiv`. The double-dual map
v↦(φ↦φ(K⁻¹v)) is `TauCeti.UqSl2.doubleDualEquiv`, and for every module
endomorphism φ the two twisted traces agree,
tr_V(Kφ)=tr_V(K⁻¹φ) whenever q−q⁻¹≠0
(`TauCeti.UqSl2.trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp`). On L_m^ε both
traces of K⁻¹ and of K are ε[m+1]_q
(`TauCeti.UqSl2.LadderModule.trace_rep_kInv`,
`TauCeti.UqSl2.LadderModule.trace_rep_k`), and the formal weight character
`TauCeti.UqSl2.formalCharacter` is multiplicative on tensor products and
determines a finite-dimensional module at generic q
(`TauCeti.UqSl2.nonempty_linearEquiv_iff_formalCharacter_eq`).

Prove the Biedenharn–Elliott pentagon for these recoupling isomorphisms on
L_a^ε⊗L_b^δ⊗L_c^ζ⊗L_d^θ: the two composites of recouplings between the five
bracketings of the quadruple product, built from
`TauCeti.UqSl2.clebschGordanRecouplingEquiv` on triple subproducts and the
actual associator, agree in channel coordinates. Prove that the
Clebsch–Gordan maps are compatible with dual evaluation and coevaluation of
the rigid structure above. Compare `TauCeti.UqSl2.LadderModule.contragredientEquiv`
and the U_q left and right duals and pivot with the generic construction above.
Identify Tau Ceti's `TauCeti.rightTrace` and `TauCeti.leftTrace`, taken with
the pivotal pairing `TauCeti.pivotalExactPairing` (the chosen right-dual pairing
transported along the pivot), as rightTrace(f)=tr_V(gf) and
leftTrace(f)=tr_V(g⁻¹f) for the pivot j_V(v)(φ)=φ(gv): on a basis e_i with dual
basis e^i the pivotal coevaluation is 1↦Σ_i e^i⊗g⁻¹e_i and the pivotal
evaluation is v⊗φ↦φ(gv). Compare them with PivotalSpherical's rightTrace and
leftTrace in its right-dual convention, and deduce from the trace identity
above that for q−q⁻¹≠0 the pivotal category of finite U_q-modules is a
`TauCeti.SphericalCategory`, with common pivotal dimension ε[m+1]_q on L_m^ε
and [m+1]_q on the positive family; at generic q the hypothesis holds because
q²≠1. Construct the representation ring, the Grothendieck ring of finite
modules with the tensor product, and identify it through the formal character
with the subring of the integral monoid algebra of ℂ spanned by the characters
Σ_(j=0)^m [εq^(m−2j)]. These statements use algebraic tensors and the Hopf
module actions, independent of Q1–Q7's C*-tensor-category construction.

The defining objects have the following API.

- The finite Hopf-module category has tensor over the base field, counit unit, antipode duals and faithful forgetful functors.
- A group-like pivot implements S² and gives pivotal traces; at U_q the rigid and pivotal structures with pivot K⁻¹ are instances for every q≠0, and the rank-one signed category is spherical for q−q⁻¹≠0.
- Normalized Clebsch–Gordan maps obey the stated recurrence, invertibility, dual compatibility and pentagon.

**Checks.**

- At q=1/2, m=n=j=1, α₀=1 and α₁=−1/2; ΔE annihilates v₀⊗v₁−(1/2)v₁⊗v₀ because its top coefficient is 1/2−1/2=0.
- For r=2, the middle coefficient in Δ(E²) is q[2]_q=5/4=1+q², while using q⁻¹[2]_q would give 5.
- On L₁⁺, g=K⁻¹ has trace 5/2, as does g⁻¹. On L₀⁻, both traces are −1, so discarding the sign changes the pivotal dimension.
- At q=±1, where the presentation is the commutative algebra ℂ[E,F,K,K⁻¹], the one-dimensional module ℂ with K=2 and E=F=0 is a finite module on which the identity has rightTrace=tr(K⁻¹)=1/2 and leftTrace=tr(K)=2: the pivotal structure with pivot K⁻¹ exists, the category is not spherical, and the hypothesis q−q⁻¹≠0 of the sphericity statement cannot be dropped. A pivot K in place of K⁻¹ would swap the two values without equalizing them.
- For L₁⊗L₁, dimensions give 4=3+1; for L₀⁻⊗L₀⁻ the resulting sign is + and dimension 1. For H=k[C₂], S=S⁻¹ sends the nonidentity generator to itself, so the two dual actions agree.

*Needs:* §§8.1–8.4; Tau Ceti `Algebra/Category/FiniteHopfModuleCat/`, `Algebra/HopfAlgebra/InverseAntipode.lean`, `CategoryTheory/Monoidal/Pivotal/` and `QuantumGroups/UqSl2/{Antipode,Hopf,ComulPow,TensorProduct,QuantumTrace,Character}` with `QuantumGroups/UqSl2/ClebschGordan/`, `QuantumGroups/UqSl2/Dual/` and `QuantumGroups/UqSl2/LadderModule/SignTensor.lean`; Mathlib ModuleCat, FGModuleCat, ExactPairing and Rep.equivalenceModuleMonoidAlgebra; PivotalSpherical Layers 0–2,7. Virelizier Lemma 2.3 and Proposition 4.1, pp.6–7,13–14; the pentagon and the trace comparisons are the displayed constructions.

### 8.6 Compact real form and the SUq(2) comparison

For real q the compact real form K*=K, E*=KF, F*=EK⁻¹ is the native star
structure `TauCeti.UqSl2.instStarRing` (`TauCeti.UqSl2.star_k`,
`TauCeti.UqSl2.star_e`, `TauCeti.UqSl2.star_f`), and for real q≠0 the coproduct
is a star homomorphism, `TauCeti.UqSl2.instStarCoalgebra`, so U_q is a Hopf
*-algebra in the sense of §3.1, with S⁻¹(x)=S(x*)*
(`TauCeti.UqSl2.star_antipode_star`). For real q>0 with q−q⁻¹≠0, in particular
for 0<q<1, the positive invariant Hermitian form on L_m^+ with h₀=1 and
h_j/h_(j−1)=[m−j+1]_q/([j]_q q^(m−2j)) is
`TauCeti.UqSl2.LadderModule.invariantForm`: it is positive definite
(`TauCeti.UqSl2.LadderModule.invariantForm_pos`), every element of U_q acts by
adjoints, ⟨a v,w⟩=⟨v,a* w⟩ (`TauCeti.UqSl2.LadderModule.invariantForm_smul`), K
is positive (`TauCeti.UqSl2.LadderModule.invariantForm_k_pos`), and at generic
real q every invariant sesquilinear form is a multiple of it
(`TauCeti.UqSl2.LadderModule.eq_smul_invariantForm`).

Build the coefficient Hopf pairing and monoidal equivalence between finite
positive-K modules (finite direct sums of the L_m^+) and Q5/Q7's SUq(2) finite
unitary corepresentations, comparing the actual fundamental matrix
[[a,−q c*],[c,a*]], cup, antipode and conjugate conventions in the orthonormal
basis v_j/√h_j. The matching cup, written in the original ladder basis, is
proportional to v₀⊗v₁−q v₁⊗v₀. Compare the pivotal and positive intrinsic
dimensions. On the orthonormal fundamental basis pin the pairing by
(⟨K,u_ij⟩)=diag(q,q⁻¹), (⟨E,u_ij⟩)=[[0,q^(−1/2)],[0,0]] and
(⟨F,u_ij⟩)=[[0,0],[q^(1/2),0]]. These fix its values on a,c,a*,c* through the
stated fundamental matrix. Prove both Hopf pairing equations and the
star/antipode comparison from these values, then extend to all finite
coefficients and intertwiners. Negative-K signed modules remain in the
algebraic classification; they are not identified with this positive-K compact
representation category.

The defining objects have the following API.

- The compact real involution makes every positive ladder a positive-K star representation with the stated invariant metric.
- The coefficient pairing induces the monoidal equivalence with finite unitary SUq(2) corepresentations and compares cups and dimensions.

**Checks.**

- At q=1/2, m=1, h₀=1,h₁=1/2. The adjoint of E in this metric is 2F=KF; setting h₁=1 would incorrectly give F.
- In the orthonormal basis, E has upper entry √2 and F lower entry 1/√2, while K=diag(1/2,2); their commutator is diag(1,−1).
- The ladder cup v₀⊗v₁−(1/2)v₁⊗v₀ is annihilated by ΔE and ΔF; L₀⁻ has K=−1 and is excluded by positive K.

*Needs:* §§8.1–8.5; Tau Ceti `QuantumGroups/UqSl2/Star.lean` and `QuantumGroups/UqSl2/LadderModule/InnerProduct.lean`; §§5.1,7.1; Layer 3 coefficient duality. The pairing is derived from the displayed matrices and Virelizier §2.3 Hopf relations; Timmermann Chapter 6 §2 supplies the compact presentation.

### 8.7 Classical finite-module comparison

For the positive family the matrices of E, F, K and EF−FE on L_m^+ in the
ladder basis are the integral ladder matrices
`TauCeti.UqSl2.ladderMatrixE`, `TauCeti.UqSl2.ladderMatrixF`,
`TauCeti.UqSl2.ladderMatrixK` and `TauCeti.UqSl2.ladderMatrixH` over ℤ[v,v⁻¹],
with Laurent quantum integers as entries, evaluated at v=q
(`TauCeti.UqSl2.LadderModule.toMatrix_rep_e`,
`TauCeti.UqSl2.LadderModule.toMatrix_rep_f`,
`TauCeti.UqSl2.LadderModule.toMatrix_rep_k`). Their evaluation at v=1 is the
classical specialization `TauCeti.UqSl2.ClassicalLadder K m`, a module over
native `sl (Fin 2) K` sending the standard basis (e,f,h) to E v_j=(m−j+1)v_(j−1),
F v_j=(j+1)v_(j+1) and H v_j=(m−2j)v_j, an `IsSl2Triple` for m≠0 in K
(`TauCeti.UqSl2.ClassicalLadder.isSl2Triple`). Over a field of characteristic
zero, `TauCeti.UqSl2.ClassicalLadder.equivSl2Std` is a Lie-module isomorphism
onto `TauCeti.Sl2Std K m`, the standard irreducible V(m) of
RepresentationTheory/LieHighestWeight Layer 0, sending v_j to (m choose j)w_j
for the coordinate basis w_j of V(m): the binomial factors record the two basis
normalizations rather than identifying them. This is an explicit
representation-family specialization; substitution into U_q's denominator
presentation does not define U(sl₂).

The order within Q8 is presentation/PBW/Hopf → weights/Verma/simple modules
→ Casimir/finite splitting → local finiteness and tensor theory → the
compact/classical comparisons. Section 8.6 additionally consumes Q5/Q7's
compact coefficient core; Q1–Q7 have no dependency on Q8. Generic higher-rank
and root-of-unity quantized enveloping algebras are separate from the rank-one
classification specified here.

The defining objects have the following API.

- Laurent-polynomial ladder matrices specialize to the highest-weight sl₂ module with an actual Lie-module comparison.
- The comparison preserves the chosen basis normalization and does not specialize the denominator quotient as an algebra.

**Checks.**

- At v=1,m=1, E=[[0,1],[0,0]], F=[[0,0],[1,0]], H=diag(1,−1); [E,F]=H and [H,E]=2E.
- At v=1,m=2, F coefficients are 1,2,0 and E coefficients 0,2,1; [E,F]=diag(2,0,−2). The map to V(2) sends v₀,v₁,v₂ to w₀,2w₁,w₂, and F v₀=v₁ goes to 2w₁=f·w₀=(2−0)w₁; the unscaled identity v_j↦w_j would send F v₀ to w₁≠2w₁. At m=0 all three matrices are zero.
- The Laurent expression [2]_v=v+v⁻¹ specializes to 2, while the totalized rational formula at v=1 gives 0/0=0. Only the Laurent-family specialization gives the classical action.

*Needs:* §8.2; Tau Ceti `QuantumGroups/UqSl2/ClassicalSpecialization.lean` and `Algebra/Lie/Sl2/Standard.lean`; Mathlib LaurentPolynomial, LieModule, sl and IsSl2Triple; RepresentationTheory/LieHighestWeight Layer 0. Virelizier Example 3.3 gives the Laurent form of the ladder.

### Examples

The signed one-dimensional ladders, the fundamental two-dimensional module and their three-dimensional sum test the full generic classification; the root of unity q=i separates the PBW and center statements.

### Dependencies

§8.1 → §8.2 → §8.3 → §§8.4–8.5, all on Tau Ceti's `QuantumGroups/UqSl2/` and `Algebra/Category/FiniteHopfModuleCat/`. Section 8.5 additionally uses PivotalSpherical Layers 0–2,7; §8.6 uses Layers 3,5,7; §8.7 uses RepresentationTheory/LieHighestWeight Layer 0. Layers 1–7 do not consume Layer 8.

## Downstream consumers

QuantumEnvelopingAlgebras Layer 1 (QEA1) consumes §8.1, which it cites as
Q8 item 1, for its rank-one comparison. HopfologicalAlgebra §2.1 consumes
§8.5's finite Hopf-module category, which it cites as Q8 item 5, for its
monoidal category of all H-modules. CategoricalOperatorAlgebras consumes §0.2
for the C*-categories, their completions, the finite-Hilbert and Hilbert-module
examples, conjugate and standard solutions, intrinsic dimension, the balanced
unitary dual functor and signed self-dualities that its CA1a and CA2a use.
TemperleyLiebOperatorAlgebras Layer 3
consumes §0.3 for the unitary Temperley–Lieb category, its Hom norms, standard
conjugates and fusion rules.

## References

- J. Kustermans and S. Vaes, [*Locally compact quantum groups*](http://www.numdam.org/item/ASENS_2000_4_33_6_837_0/), Ann. Sci. École Norm. Sup. (4) 33 (2000), 837–934: Notations and conventions, p.840, for strict extensions to multiplier algebras and leg numbering (§§0.1, 1.1); Definition 2.1, p.853, for bi-C*-algebras (§1.1).
- R. Longo and J. E. Roberts, [*A Theory of Dimension*](https://arxiv.org/abs/funct-an/9604008v1) (1996 preprint), §2, pp.4–9; §3, pp.10–17, especially Lemma 3.3 and Theorems 3.8,3.11; Appendix, pp.48–49. Section 0.2 transports the strict-category formulas with native associators and unitors.
- D. Penneys, [*Unitary Quantum Symmetries Lite*, Part I, Chapter 4](https://people.math.osu.edu/penneys.2/UQSL/PartI/UQSLPartIChapter4.pdf), Proposition 4.5.3 and Facts 4.5.5, pp.158–159; Examples 4.6.12 and 4.6.14, pp.163–164, for the truncated quotients at roots of unity. These locators use the chapter's printed page numbers, not PDF page indices.
- S. Neshveyev and L. Tuset, [*Compact Quantum Groups and Their Representation Categories*](https://folk.universitetetioslo.no/sergeyn/papers/CQGRC.pdf) (SMF, 2013; author's copy), Theorem 1.4.2, p.9, for the orthogonality relations, whose `ρ_U` is the transpose of §3.1's F̃; Theorem 1.6.6, p.18, for the invariant functional on a Hopf *-algebra generated by unitary coefficients; Theorem 1.7.3, p.22, for the modular identity `h(ab)=h(bσ_(−i)(a))`; Proposition 1.7.7, p.23, for the Kac equivalences; §2.2, Definitions 2.2.10 and 2.2.12, Theorems 2.2.14 and 2.2.17, pp.32–35, for standard solutions and the intrinsic dimension; §2.5, p.52, for the normalisation `R̄=−τR` and pp.54–55 for the unitary Temperley–Lieb category at d≥2 and d=2cos(π/m), m≥4; §2.7, Definition 2.7.1, p.70, for d≥1.
- Timmermann, [*An Invitation to Quantum Groups and Duality*](https://doi.org/10.4171/043) (EMS, 2008),
  Proposition 2.2.4 and Remark 2.2.2(iv)(c), for algebraic
  integral faithfulness and its strict-positivity consequence;
  Chapters 3 and 5: Definitions 5.1.1,5.1.4, Theorem 5.1.6;
  Theorem 5.3.3, Propositions 5.3.7–5.3.8; Theorems 5.4.1,5.4.3,5.4.5.
  Theorem 3.2.12 proves coefficient-based compact-type positivity;
  Propositions 3.2.9,3.2.17 and Theorem 3.2.19 give the two F conventions
  and modular characters. Chapter 6 §§2,4 supplies matrix examples.
- Bédos–Murphy–Tuset, [*Co-Amenability of compact quantum groups*](https://arxiv.org/abs/math/0010248),
  Theorems 2.2,2.8,3.6 and Corollary 2.9, pp.6,10–11,18–19,
  for the general completion/counit/character criteria; Theorem 2.12
  and Corollary 2.13, pp.13–14, for the weighted shift model and the signed interior SUq(2) result.
  Timmermann Proposition 2.2.4 supplies algebraic integral
  faithfulness; strict positivity here also uses the explicit positive
  Haar-functional hypothesis. It is not analytic Haar faithfulness on
  an arbitrary completion.
- The q=−1 matrix-function model, its monomial invariance calculation
  and endpoint character are direct constructions specified here.
  The interior geometric-series Haar formula is not applied at q=±1.
- Malacarne, [*Woronowicz Tannaka–Krein duality and free orthogonal quantum
  groups*](https://arxiv.org/abs/1602.04807v1), Theorems 1.1 and 4.1,
  Lemmas 1.2, 2.1, 2.2 and 3.1, preprint pp.2–6: reconstruction, intertwiner
  recovery and the filtered finite-generator argument.
- Banica, [*The representation theory of free orthogonal quantum
  groups*](https://arxiv.org/abs/math/9806063), Proposition 1, Lemma 1,
  Proposition 2 and Theorem 1, pp.1–4. The valid infinite-fusion range
  is n≥2, as in its abstract; the one-dimensional presentation gives
  the separate ℤ/2 boundary case.
- Mathlib `RingTheory/HopfAlgebra`, `RingTheory/Bialgebra`,
  `Algebra/Star/Unitary` and matrix star/tensor APIs fix the algebraic
  vocabulary. Tau Ceti's `Comodule/MatrixCoefficient/{Matrix,FromMatrix}`
  fixes the matrix orientation and inverse-antipode identities.
  Use these existing algebraic interfaces and §0.2's analytic dagger
  structure for all required additions.
- Virelizier, [*Quantum groups*](https://www.math.virelizier.com/sources/cours/QuantumGroupM2.pdf),
  §§2.3–4.1, for the fixed rank-one Hopf convention, type-1 finite modules
  and fusion. The signed generalized-weight splitting, the locally finite
  theorem, the explicit Clebsch–Gordan maps, the pentagon, the compact
  pairing and the classical specialization in Q8 are not claimed from those
  source sections.
- Etingof–Gelaki–Nikshych–Ostrik,
  [*Tensor Categories*](https://math.mit.edu/~etingof/egnobookfinal.pdf),
  §§5.1–5.3 for bialgebra/Hopf representation categories and duals,
  as supplementary background. Q8 specifies its own module
  classification, quantum function-algebra comparison and conventions.
- Mathlib `Algebra/SkewPolynomial/Basic.lean` constructs the zero-derivation
  skew extension on `SkewMonoidAlgebra`; Tau Ceti's
  `TauCeti.OreExtension.skewPolynomialEquiv` identifies it with the Ore
  extension at δ=0 under the local action induced by σ (§8.1).
