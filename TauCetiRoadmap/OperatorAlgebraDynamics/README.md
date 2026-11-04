# Operator-algebra dynamics, crossed products, and equilibrium

**Summary.** Develop continuous actions on C*-algebras and their full and reduced crossed
products, induction and imprimitivity, Takai duality, Hausdorff groupoid
C*-algebras, and equilibrium states of quantum systems. Build the analytic
constructions and representation theory that connect these subjects: integrated
forms, Hilbert-space induction through imprimitivity bimodules, the harmonic
analysis of locally compact abelian groups that duality needs (the Fourier
isomorphism of the full group C*-algebra, the dual Haar measure with the
Plancherel unitary and Fourier inversion, and the Pontryagin duality theorem),
standard-fibre direct integrals and disintegration, KMS states with their
simplex, and the thermodynamic limit of quantum spin systems.

## Scope and ownership

This roadmap owns continuous actions of locally compact Hausdorff groups on
C*-algebras and their full and reduced crossed products, including the
central twisted products of D1.CentralTwists and D2.CentralTwists and the
scalar Borel fibers of D1.BorelPrefix and D1.TwistedBorel; the Hilbert-space
induction through imprimitivity bimodules of D1.Modules; induction and
imprimitivity (D3) with the locally compact abelian Weyl dictionary of
D3.LCAWeyl; the harmonic analysis of locally compact abelian groups in
D4.Harmonic (the Fourier isomorphism of the full group C*-algebra, the dual
Haar measure, the Plancherel unitary, Fourier inversion and the Pontryagin
duality theorem, for every locally compact Hausdorff abelian group) and Takai
duality (D4); Haar groupoids, their convolution algebras, the
standard-fibre direct integrals of D5.Fields, disintegration and equivalence
(D5–D6), with the concrete orbit, sequence, saddle-flow and residue-class
models of D2 and D6; KMS states, ground states and the KMS simplex (D7); CAR
and Weyl algebras with their free equilibrium states (D8); and quantum spin
systems with the thermodynamic limit (D9).

It leaves to named roadmaps:

- The unitary Stone–von Neumann theorem for the real Heisenberg group and
  its Hilbert multiplicity form: MetaplecticAutomorphicForms §1.2.
  D3.LCAWeyl proves the general locally compact abelian statement through
  `C₀(G)⋊G≅K(L²G)`, with `G=ℝⁿ` as one instance. Neither roadmap proves the
  other's theorem, and the comparison of the two statements on `L²(ℝⁿ)` is
  made in neither.
- The decomposition of `C*(E_ω)` into all central weights and its type-I
  consequences: NoncompactQuantumSymmetry M2.FixedTwistTypeI, which builds
  the circle extension `E_ω` and its weight-one sector from its own Layer M1
  (the subsection on Borel multipliers and locally continuous extension
  cocycles) and Layer P.3. D1.TwistedBorel stops at the single-weight fibers
  `J_k(E_ω)≅C*(G,ω^k)`; the all-weight decomposition is not built here.
- Pimsner–Voiculescu and Connes–Thom sequences and the free-basis K-group
  calculation: OperatorKTheory K7. The dimension-group classification of AF
  algebras and the translation-lifting construction: CStarClassification
  CL5. The concrete Toeplitz algebra on `ℓ²(ℕ)`: CStarAlgebras C8.
- The independent full/reduced norm obstruction for F₂: FreeProbability F3;
  it is not a prerequisite for the Powers argument of D2.FreeGroups.
- The von Neumann crossed products `M⋊̄G` themselves, with the regular–normal
  bridge: VonNeumannAlgebras V8 (discrete G, and the regular construction on
  `L²(G,H)` for a normal action) and V11 (second-countable G). D2 proves,
  under the hypotheses stated there, that the weak-operator closure of the
  regular representation of `A⋊_rG` is the von Neumann algebra generated on
  `L²(G,H)` by the diffused copy of `ρ(A)''` and the translation unitaries;
  this is the regular form of V8's `M⋊̄G` with that definition unfolded, and no
  C*-result below depends on it. Tomita–Takesaki modular theory, the modular
  characterization `σ^ω_t=τ̄_(−βt)` of a KMS state on its GNS von Neumann
  algebra with its converse and support qualification, and Araki's bounded
  perturbations of faithful normal states: VonNeumannAlgebras V10; nothing
  below has them as a prerequisite.
- Hilbert C*-modules beyond Mathlib's `CStarModule`: the C*-algebra `L_A(E)`
  of adjointable maps and the compact module operators `K_A(E)`, the
  interior tensor product `E⊗_φF` of two modules with its induced operators
  and associativity, the form `A≅K_B(E)` of imprimitivity bimodules, the
  linking algebra `K_B(E⊕B)`, induction as an equivalence of representation
  categories, the Rieffel correspondence of ideals and strong Morita
  equivalence as an equivalence relation: HilbertModules H2–H3. D1.Modules
  keeps only the instance in which the second factor is a Hilbert space: the
  induced Hilbert space `X⊗_ρH` of a Hilbert-space representation ρ through
  a module X with a left action by adjointable maps, the Gram positivity
  that its inner product needs, and the two-inner-product imprimitivity
  bimodules of Green and Renault with their completion from dense
  pre-bimodules, which D3 and D6 construct explicitly.
- Measurable Hilbert fields, direct integrals, decomposable operators, the
  rectangular criterion and change of measure for general measurable fields:
  VonNeumannAlgebras V4.0.Fields, which reaches D5 through
  SelfAdjointSpectralTheory SA-B85's diagonal model of a separable `C₀(X)`
  representation; the reduction of a separable C*-representation over a
  general measurable field belongs to the same owner. D5.Fields proves the decomposable-operator criterion, the measure-change
  unitaries, the reduction over a given diagonal and the transport theorem
  only in SA-B85's standard-fibre model, in which every fibre is a subspace of
  one `ℓ²(ℕ)` and every operator field is a measurable matrix field.
- The generic Fock/second-quantization API and the normalization adapter
  `Φ_D8(h)=(a(h)+a†(h))/√2` on its invariant domain: QuantumFoundations
  Layer 6 (6.3–6.4). D8 is the single owner of the CCR/CAR and Weyl
  algebraic relations, their regular representations and their basic field
  operators; RelativisticQuantumFieldTheory consumes D8's Weyl
  representation and the Fock adapter of QuantumFoundations 6.4.

General non-Hausdorff groupoids, groupoid primitive-ideal classification and
interacting continuum gases are outside this roadmap, and so is Bochner's
theorem for positive-definite functions on a general locally compact abelian
group: D4.Harmonic reaches the dual Haar measure, the Plancherel unitary,
Fourier inversion and the Pontryagin duality theorem through Tau Ceti's
cyclic spectral theorem for the regular representation and the Fourier
isomorphism of the group C*-algebra, starting from the character
correspondence that BanachAlgebras A7 supplies. Neither K-theory nor
C*-classification is a prerequisite here.

## Conventions

C*-algebras are complex and may be nonunital. Groups in D1–D4 are arbitrary
locally compact Hausdorff groups; separability and second countability are not
standing assumptions there. Groupoids in D5–D6 are second-countable locally
compact Hausdorff topological groupoids with Haar systems. Equilibrium theory
in D7 allows nonunital algebras except where unitality is specified; the CAR,
Weyl, and spin algebras in D8–D9 are unital.

An action is a homomorphism `G →* (A ≃⋆ₐ[ℂ] A)` with point-norm continuity
`∀ a, Continuous (fun g => α g a)`. A unitary representation is strongly
continuous when every orbit in its Hilbert space is continuous. Mathlib's
`ContRepresentation` makes each operator continuous; it does not impose this
continuity in the group variable. Use Tau Ceti's
`ContRepresentation.IsUnitary` and state strong continuity separately.
Hilbert-space and right Hilbert-module inner products are linear in the second
variable. A right Hilbert A-module is Mathlib's `CStarModule Aᵐᵒᵖ E` with
`CompleteSpace E`: the class carries a left action of the opposite algebra,
`x·a = MulOpposite.op a • x`, and its axiom `⟪x, op a • y⟫ = op a * ⟪x, y⟫`
reads, after `MulOpposite.unop`, as the right-module law `⟨x, y a⟩=⟨x,y⟩a`;
`⟨x a, y⟩=a*⟨x,y⟩` then follows from `CStarModule.star_inner`. Write `⟨x,y⟩_A` for the
unopposed A-valued inner product and `‖x‖²=‖⟨x,x⟩_A‖` for the norm.

Fix left Haar measure μ. Write `c(g)=Measure.modularCharacter g` in the
convention `∫ f(xg) dμ(x)=c(g)∫ f(x) dμ(x)`. Thus Williams's modular function
is `Δ(g)=c(g)⁻¹`. Formulae involving different groups use their respective
Haar measures and modular functions. Fourier transforms and dual actions use
positive characters: `f̂(χ)=∫ f(g)χ(g) dμ(g)` and
`α̂χ(f)(g)=χ(g)f(g)`.

## Exact supplier contracts

- BanachAlgebras A7 supplies L¹ convolution,
  vector integration, Haar modular identities, and the support and Fubini
  arguments needed without global σ-finiteness. Its amenability dependency
  is the AmenableGroups roadmap.
- CStarAlgebras C1–C2 supplies representations,
  approximate units, multipliers, ideals and quotients, and C1 the nonunital
  commutative Gelfand isomorphism `A≅C₀(X)` onto the nonzero character space,
  used by D4.Harmonic; C5 supplies tensor products and analytic inductive
  limits; C6 supplies nuclearity and CP approximation, and C7 supplies
  exactness.
- From Mathlib: `CStarModule` (Hilbert C*-modules, the norm `‖x‖=√‖⟨x,x⟩‖`,
  `CStarModule.norm_inner_le`, the self-module instance and
  `WithCStarModule.instCStarModuleComplex`, which makes a Hilbert space a
  right ℂ-module) and `CStarMatrix` (the C*-algebra `M_n(A)` with its
  continuous functional calculus), used by D1.Modules; `ContRepresentation`
  (a representation by bounded operators, continuous in each operator), used
  by D1; `PositiveLinearMap.GNS` and `PositiveLinearMap.gnsNonUnitalStarAlgHom`
  (the GNS space and representation of a positive functional),
  `VonNeumannAlgebra` with `VonNeumannAlgebra.commutant` (the
  double-commutant definition on a Hilbert space) and
  `ContinuousLinearMapWOT` (the weak operator topology), used by D7 and D8;
  `PontryaginDual` with its compact-open topology, its locally compact
  abelian group structure and `Circle`, `ContinuousMulEquiv` (an isomorphism
  of topological groups), `Measure.IsHaarMeasure` and `Lp`, used by
  D3.LCAWeyl and D4.
- From Tau Ceti: `ContRepresentation.IsUnitary` and
  `ContRepresentation.integratedOperatorL1`, used by D1;
  `ContRepresentation.exists_pontryaginMeasureTransform_eq_inner` (the
  cyclic spectral theorem: the diagonal matrix coefficient `g↦⟨ξ,U_gξ⟩` of a
  strongly continuous unitary representation of a locally compact abelian
  group is the transform `g↦∫χ(g)dν(χ)` of a finite inner regular measure ν
  on the dual, stated for the additive form of the group),
  `MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular`
  (two finite inner regular measures on the dual with the same transform are
  equal) and `TauCeti.PontryaginDual.continuous_coe_eval_const`, used by
  D4.Harmonic;
  `TauCeti.circleEquivPontryaginDualInt` (the dual of ℤ is the circle), used
  by D4.Harmonic's Checks.
- BanachAlgebras A7 supplies, for locally compact abelian G, the character
  correspondence between the Gelfand spectrum of `L¹(G)` and the Pontryagin
  dual with its compact-open topology, and its Fourier uniqueness theorem on
  `L¹(G)`; D4.Harmonic builds the Fourier isomorphism of the full group
  C*-algebra, the dual Haar measure, the Plancherel unitary, Fourier
  inversion and the Pontryagin duality theorem on it.
- OperatorTheory/SelfAdjointSpectralTheory
  and [OneParameterSemigroups](../../Completed/OneParameterSemigroups/README.md) supply
  self-adjoint generators, their spectral calculus, Part B's PVM carrier,
  integration and representation-PVM API, and strongly continuous
  one-parameter groups. Use their `LinearPMap` domains and graph closures.
  D5 consumes SA-B85's diagonal theorem for nondegenerate C₀(X)
  representations on separable Hilbert spaces, X second-countable locally
  compact Hausdorff. Its order is SA-B85 → D5.Fields → D5; D5 is not a
  prerequisite for that supplier.
- Use the topological groupoid vocabulary shared with
  LieGroupoidsPoisson G0:
  `CategoryTheory.Groupoid`, topology on the total `Arrow`, and continuous
  composition on composable arrows. Write `gh` for first h, then g
  (`h ≫ g` in category notation). G0 owns the total-arrow and composable-arrow topologies and continuous
  groupoid operations. D5 consumes that topological layer and builds Haar,
  integration and representation interfaces; smooth structures are not
  prerequisites.

## How to read the build

D1–D4 form the group-action development: D1 builds integrated forms and full
crossed products and, in D1.Modules, the Hilbert-space induction through
bimodules that D2, D3 and D6 use; D4.Harmonic builds the Fourier isomorphism
of the full group C*-algebra, the dual Haar measure with the Plancherel
unitary and Fourier inversion, and the Pontryagin duality theorem, which
D3.LCAWeyl and D4.Takai consume. D5–D6 use D1's integration tools, D1.Modules and the standard-fibre
direct integrals of D5.Fields, and compare transformation groupoids with
D1–D2. D7–D9 form the equilibrium development. Operator K-theory consumes
crossed products and duality. The dependency order of the twisted sections
is C1/A7/D1.Modules → D1.CentralTwists → D2.CentralTwists, and A7/C1 →
D1.BorelPrefix → D1.TwistedBorel; D5's order is SA-B85 → D5.Fields → D5.
Every layer ends with its Examples and Dependencies. `Suggested.lean` states
the headline theorems that are statable against the pinned libraries, each
named in backticks at its target below; its module docstring names the
headline theorems that are not statable and the carrier each lacks.

## D1. Covariant representations and full crossed products

Develop actions, equivariant *-homomorphisms, invariant subalgebras and ideals,
quotient actions, conjugacy, restriction to closed subgroups, and induced
actions on multipliers. Prove joint continuity from point-norm continuity,
using the isometry of automorphisms. Extend nondegenerate representations to
multipliers and relate strict continuity of multiplier unitaries to strong
continuity in nondegenerate Hilbert-space representations.

For a system `(A,G,α)`, construct the convolution algebra on `C_c(G,A)`:

```
(f * g)(s) = ∫ f(r) α_r(g(r⁻¹s)) dμ(r)
f*(s)     = c(s) α_s(f(s⁻¹)*) .
```

Prove continuity and compact support of convolution, associativity, the
involution laws, and `‖f*g‖₁≤‖f‖₁‖g‖₁`, `‖f*‖₁=‖f‖₁`. Complete to the
twisted L¹ Banach *-algebra, prove density of compactly supported functions,
and construct approximate units compatible with those of A. Include zero
algebras, nonunital coefficients, restriction of compact supports, and the
scalar trivial-action comparison with A7.

A covariant pair `(π,U)` satisfies `U_s π(a)=π(α_s(a)) U_s`
(`IsCovariant`). Construct its
integrated form by the vector formula
`(π⋊U)(f)ξ=∫ π(f(s))U_s ξ dμ(s)`. Establish integrability, boundedness by
`‖f‖₁` (`exists_integratedOperator`, for every integrable f and every
inner-regular μ: local compactness and inner regularity make the integrand
strongly measurable on the σ-finite support of f, since a continuous orbit
has separable range on each compact set), multiplicativity
(`integrated_convolution`: for left Haar μ and compactly supported continuous
f,g, `(π⋊U)(f*g)=(π⋊U)(f)(π⋊U)(g)` with `*` the displayed `convolution`;
this identity uses covariance, the group law and strong continuity of U, not
unitarity) and preservation of star (Williams, Proposition 2.23, p. 49).
Strong continuity alone
does not give norm continuity into B(H); the vector integral is the defining
construction. Extend Tau Ceti's existing scalar integrated-representation
API to these coefficient-valued integrands. Reuse
`ContRepresentation.integratedOperatorL1` and its vector formula: transport
its AddGroup/Multiplicative notation along the tagging equivalences for a
multiplicative G, and prove equality for scalar coefficients. The existing
convolution theorem is abelian and has `SecondCountableTopologyEither`;
prove the nonabelian twisted formula first for compact-support integrands
on finite-measure compact pieces, then extend by L¹ approximation. This
supplies the stated generality without global σ-finiteness or separability.

For a representation ρ of A construct the regular covariant representation
on `L²(G,Hρ)`:
`ρ̃(a)ξ(r)=ρ(α_(r⁻¹)(a))ξ(r)` and `λ_s ξ(r)=ξ(s⁻¹r)`.
Prove its strong continuity, nondegeneracy when ρ is nondegenerate, and
covariance. Prove the integrated regular representation of a faithful ρ
is injective on C_c(G,A), using its kernel/vector tests and approximate
identities.

Define the full norm as the supremum of the integrated representation norms.
Control universes by a bounded-cardinality family of cyclic representations
and prove that the resulting supremum agrees with all representations.
Prove finiteness, definiteness using regular representations, the C*-identity,
and independence of the indexing family; complete to `A⋊αG`. Construct its
canonical nondegenerate coefficient map into `M(A⋊αG)` and strictly continuous
unitary group map, with covariance and dense integrated span. Prove the
universal property for nondegenerate covariant homomorphisms into multiplier
algebras `M(B)` (Williams, §2.6 and Theorem 2.61, p. 72). Recover the pair from
the integrated representation; prove compatibility with intertwining maps,
unitary equivalence, direct sums, nondegeneracy and irreducibility.

For equivariant *-homomorphisms construct the induced full crossed-product
maps and prove identity, composition and surjectivity for quotient maps.
For every invariant closed ideal I prove the short exact sequence
`0 → I⋊G → A⋊G → (A/I)⋊G → 0`; identify the first image as the closed ideal
generated by `C_c(G,I)`. Construct full group C*-algebras and prove
`ℂ⋊G≃C*(G)` and `A⋊idG≃A⊗max C*(G)`, with the specified generator maps.
Identify C5's universal algebra on countably many unitaries with the
full C*-algebra of the free group on ℕ, matching each generator and
proving both universal properties induce inverse maps.

**Checks.**

- For G trivial and μ the point mass, `f*g=f(e)g(e)` and `f*=f(e)*`, and
  the integrated form is `π(f(e))`. The direction of the action in the
  convolution is pinned by G=ℤ/3 acting on `A=ℂ³` by the cyclic shift
  `α_1(e_j)=e_(j+1)` with counting measure: for `f=δ_1⊗e_0` and
  `g=δ_1⊗e_2`, the displayed formula gives `(f*g)(2)=e_0·α_1(e_2)=e_0`,
  while the inverse convention `α_(r⁻¹)(g(r⁻¹s))` gives `e_0·α_(−1)(e_2)=e_0·e_1=0`;
  the composite `π(e_0)U_1π(e_2)U_1=π(e_0α_1(e_2))U_2=π(e_0)U_2` is nonzero
  for a faithful π, so only the displayed convention makes
  `(π⋊U)(f*g)=(π⋊U)(f)(π⋊U)(g)`.
- For A=ℂ, trivial action, and U the regular representation of G on
  `L²(G)`, the integrated form is left convolution `λ(f)`, and
  `‖λ(f)‖≤‖f‖₁` is sharp for `f≥0` on an abelian G.
- Counting measure on ℤ with the trivial action: `(f*g)(n)=Σ_k f(k)g(n−k)`
  and `f*(n)=overline(f(−n))`, the unimodular case `c=1`; for the `ax+b`
  group the factor `c(s)` in `f*` is not 1, and omitting it breaks
  `‖f*‖₁=‖f‖₁`.

*Needs:* BanachAlgebras A7 (vector integration, Haar modular identities,
localized Fubini); CStarAlgebras C1 (approximate units, multipliers, strict
topology); Tau Ceti `ContRepresentation` and `ContRepresentation.IsUnitary`;
Mathlib `MeasureTheory.Measure.modularCharacter`.

### D1.Modules. Hilbert-space induction through imprimitivity bimodules

In the convention fixed above, a right Hilbert B-module X is a complete
`CStarModule Bᵐᵒᵖ X`; Mathlib supplies the inner-product laws, the norm
`‖x‖²=‖⟨x,x⟩_B‖`, the Cauchy–Schwarz inequality `‖⟨x,y⟩_B‖≤‖x‖‖y‖`
(`CStarModule.norm_inner_le`) and the self-module instance, and a Hilbert
space H is a right ℂ-module through `WithCStarModule.instCStarModuleComplex`.
A left action of a C*-algebra A on X by adjointable maps is a
*-homomorphism φ from A to the bounded B-linear maps of X such that
`⟨φ(a)x,y⟩_B=⟨x,φ(a*)y⟩_B` for all a, x, y. Only this datum is used below;
the C*-algebra of all adjointable maps of X is not built here.

Prove the Gram positivity: for `x_1,…,x_n∈X` the matrix `G=(⟨x_i,x_j⟩_B)` is
positive in `M_n(B)` (`CStarMatrix`). Route: for every column `b∈Bⁿ`,
`b*Gb=⟨Σ_ix_ib_i,Σ_jx_jb_j⟩_B≥0`; G is self-adjoint, so the nonunital
continuous functional calculus in `M_n(B)` gives `G=G₊−G₋` with
`G₊G₋=0`; for `y=G₋^(1/2)` and every column b, `(yb)*G(yb)=−b*G₋²b`, which
is both `≥0` by the first step and `≤0`, so `‖G₋b‖²=‖b*G₋²b‖=0` for every
column b, and an approximate unit of B in each coordinate gives `G₋=0`.
Consequently, for a representation ρ of B on a Hilbert space H and
`ξ_1,…,ξ_n∈H`, `Σ_(i,j)⟨ξ_i,ρ(⟨x_i,x_j⟩_B)ξ_j⟩≥0`, because `ρ⊗1_n` is a
*-homomorphism `M_n(B)→B(Hⁿ)` and preserves positivity.

For a representation ρ of B on H construct the induced Hilbert space
`X⊗_ρH` as the separated completion of the algebraic tensor product `X⊙H`
for the form `⟨x⊗ξ,y⊗η⟩=⟨ξ,ρ(⟨x,y⟩_B)η⟩` (Williams, Proposition I.1,
p. 479, with the Hilbert B-module Y=H); its positivity is the consequence
above. Prove the balancing law `xb⊗ξ=x⊗ρ(b)ξ` and the density of the image
of `X⊙H`. For a left action φ of A on X by adjointable maps prove that
`Ind_Xρ(a)(x⊗ξ)=φ(a)x⊗ξ` extends to a bounded operator of norm at most
`‖a‖` and that `Ind_Xρ` is a *-representation of A on `X⊗_ρH`. Route: in
the unitization `A⁺` write `‖a‖²·1−a*a=r*r` and extend φ to `A⁺` with
`φ(1)=id`; then `‖a‖²⟨x_i,x_j⟩_B−⟨φ(a)x_i,φ(a)x_j⟩_B=⟨φ(r)x_i,φ(r)x_j⟩_B` is a
Gram matrix, so `‖Σ_iφ(a)x_i⊗ξ_i‖²≤‖a‖²‖Σ_ix_i⊗ξ_i‖²`. Prove that `Ind_Xρ`
is nondegenerate when ρ is nondegenerate and `φ(A)X` is dense in X, that a
bounded intertwiner `S:H→H'` of ρ and ρ' induces `1⊗S` intertwining
`Ind_Xρ` and `Ind_Xρ'`, that unitarily equivalent ρ induce unitarily
equivalent representations, that direct sums induce direct sums, and that
for `X=B` with the multiplication action and nondegenerate ρ, `b⊗ξ↦ρ(b)ξ`
is a unitary `B⊗_ρH≅H` carrying `Ind_Bρ` to ρ.

Prove the stage lemma that D3 and D6 use. Let X be a right Hilbert B-module
with a left A-action, Y a right Hilbert C-module with a left B-action, Z a
right Hilbert C-module with a left A-action, and `X⊙Y→Z`, `x⊗y↦x·y`, a
bilinear pairing with `⟨x·y,x'·y'⟩_C=⟨y,⟨x,x'⟩_By'⟩_C`,
`(xb)·y=x·(by)` and `a(x·y)=(ax)·y`. Then for every representation ρ of C
on H the map `x⊗(y⊗ξ)↦(x·y)⊗ξ` is an isometry
`X⊗_(Ind_Yρ)(Y⊗_ρH)→Z⊗_ρH` intertwining `Ind_X(Ind_Yρ)` with `Ind_Zρ`, and
it is unitary when the pairing has dense range in Z. Route: on elementary
tensors both inner products equal `⟨ξ,ρ(⟨y,⟨x,x'⟩_By'⟩_C)ξ'⟩`. No interior
tensor product `X⊗_BY` of two modules is formed.

An A–B imprimitivity bimodule is an A–B bimodule X that is a full right
Hilbert B-module and a full left Hilbert A-module, the left inner product
`_A⟨x,y⟩` being linear in its first variable with `_A⟨ax,y⟩=a·_A⟨x,y⟩`,
`_A⟨x,y⟩*=_A⟨y,x⟩` and `_A⟨x,x⟩≥0`, each action adjointable for the other
inner product (`⟨ax,y⟩_B=⟨x,a*y⟩_B`, `_A⟨xb,y⟩=_A⟨x,yb*⟩`), and the
compatibility `_A⟨x,y⟩z=x⟨y,z⟩_B`; fullness means that the inner products
span dense subspaces of A and of B. A pre-imprimitivity bimodule over dense
*-subalgebras `A₀⊆A`, `B₀⊆B` has the same laws with values in A₀ and B₀,
actions bounded for the induced norms and inner products of dense range, and
completes to an imprimitivity bimodule (Williams, (IB1)–(IB4) and (a)–(d),
pp. 114–115). Prove that the two norms coincide: `a=_A⟨x,x⟩` and
`b=⟨x,x⟩_B` satisfy `ax=xb`, so `‖b‖³=‖xb‖_B²=‖ax‖_B²≤‖a‖²‖x‖_B²=‖a‖²‖b‖`
gives `‖b‖≤‖a‖`, and symmetrically; the bound `‖ax‖_B≤‖a‖‖x‖_B` is the
Gram-matrix estimate above for the left action. Write `A∼_MB` when an A–B
imprimitivity bimodule exists; this is the conclusion of D3's and D6's
equivalence theorems, and its properties as a relation are not developed
here. Prove that induction through an imprimitivity bimodule carries
nondegenerate representations of B to nondegenerate representations of A:
`x=lim_n x⟨x,x⟩_B^(1/n)` because `⟨x−xu,x−xu⟩_B=b(1−u)²` for `b=⟨x,x⟩_B` and
`u=b^(1/n)`; the closed span I of `⟨X,X⟩_B` is a closed two-sided ideal of
B, by `⟨x,y⟩_Bc=⟨x,yc⟩_B` and `c*⟨x,y⟩_B=⟨xc,y⟩_B`, hence a C*-subalgebra
containing b and therefore every `b^(1/n)`; so `xb^(1/n)` lies in the
closure of `X⟨X,X⟩_B`, which is the closure of `_A⟨X,X⟩X` by
`x⟨y,z⟩_B=_A⟨x,y⟩z`, and `_A⟨X,X⟩X` is dense in X. No fullness is needed
for this direction.

- The Gram positivity `(⟨x_i,x_j⟩_B)≥0` in `M_n(B)` and its Hilbert-space
  consequence.
- The induced Hilbert space `X⊗_ρH`: positivity, balancing, density, the
  induced representation `Ind_Xρ` with its norm bound, nondegeneracy,
  intertwiners, unitary equivalence, direct sums, and `B⊗_ρH≅H`.
- The stage lemma for a compatible pairing `X⊙Y→Z`.
- Imprimitivity bimodules and their pre-versions: the compatibility law,
  equality of the two norms, completion, and induction through a bimodule.

**Checks.**

- The right self-module: Mathlib's self-module instance of `Bᵐᵒᵖ` has
  `⟪x,y⟫=y·star x` in `Bᵐᵒᵖ`, which is `⟨x,y⟩_B=x*y` after `unop`; for
  `B=M_2(ℂ)` and `x=E_12` this is `E_21E_12=E_22`, while the left self-module
  of B itself gives `E_12E_21=E_11`. The two instances on the one carrier
  differ, which is why right modules are written over `Bᵐᵒᵖ`.
- Gram positivity pins the order of the entries: for `X=B=M_2(ℂ)`,
  `x_1=E_11`, `x_2=E_12`, the matrix `(x_i*x_j)` in `M_2(M_2(ℂ))=M_4(ℂ)` has
  entries `δ_(ik)δ_(jl)` at `((i,k),(j,l))`, which is `ww*` for
  `w=e_(1,1)+e_(2,2)` and is positive of rank one; the transposed convention
  `(x_j*x_i)` has entries `δ_(jk)δ_(il)`, the flip of `ℂ²⊗ℂ²`, with
  eigenvalue `−1` on `e_(1,2)−e_(2,1)`.
- Sign of the induced inner product: for `B=M_2(ℂ)`, `X=B`, `ρ=id` on ℂ²,
  `x_1=−E_12`, `x_2=E_11`, `ξ_1=e_1`, `ξ_2=e_2`, the displayed form on
  `x_1⊗ξ_1+x_2⊗ξ_2` is `‖x_1ξ_1+x_2ξ_2‖²=0`, while the form with `⟨y,x⟩_B` in
  place of `⟨x,y⟩_B` gives `2Re⟨x_2ξ_1,x_1ξ_2⟩=−2`: the transposed convention
  is not positive.
- `X=B` and ρ nondegenerate: `B⊗_ρH≅H` by `b⊗ξ↦ρ(b)ξ`; for `ρ=0` on `H≠0`
  the induced space is 0, so nondegeneracy is needed for the identification.
  With the multiplication pairing `B⊙B→B`, the stage isometry composed with
  these identifications is the identity of H, and for `ρ=0` all three
  induced spaces are 0.
- Adjointability of the left action is a hypothesis: the inclusion of
  `J={f:f(0)=0}` into `B=C([0,1])`, as a map of right B-modules, is bounded
  and B-linear but has no adjoint, since an adjoint `T*` would satisfy
  `conj(f)g=conj(f)T*g` for all `f∈J`, so `T*g=g` on `(0,1]`, forcing
  `g∈J` for every `g∈B`.
- `ℂⁿ` as an `M_n(ℂ)`–ℂ bimodule with `_M⟨x,y⟩=xy*` and `⟨x,y⟩_ℂ=x*y`
  satisfies `(xy*)z=x(y*z)` and is full on both sides, so `M_n(ℂ)∼_Mℂ`;
  with ℂ acting on the left and `_ℂ⟨x,y⟩=y*x` instead, `x=e_1`, `y=z=e_2`
  give `_ℂ⟨e_1,e_2⟩e_2=0≠e_1=e_1⟨e_2,e_2⟩_ℂ`, so `ℂ²` is not a ℂ–ℂ
  imprimitivity bimodule although `ℂ∼_Mℂ` through ℂ itself; the two norms
  agree there, `‖xx*‖=‖x‖²=x*x`.

*Needs:* Mathlib `CStarModule`, `WithCStarModule.instCStarModuleComplex`,
`CStarMatrix` with the nonunital continuous functional calculus,
`Unitization` and `UniformSpace.Completion`; CStarAlgebras C1 (approximate
units, positivity in the unitization).

### D1.CentralTwists. Continuous central multiplier cocycles

For every D1 action α on a possibly nonunital complex C*-algebra A, use
C1's multiplier algebra `M(A)=𝓜(ℂ,A)` and its unique unital extension
`α̃_s`. Construct this extension as an action, with
`α̃_s(m)α_s(a)=α_s(ma)` and `α_s(a)α̃_s(m)=α_s(am)`.
Prove uniqueness, identity and composition, preservation of the center and
unitaries, and joint strict continuity on bounded multiplier sets. The
strict topology here is C1's topology, not the norm topology of
`DoubleCentralizer`.

A normalized continuous central α-cocycle (`CentralCocycle`) is a map
`ω:G×G→U(Z(M(A)))` satisfying

```
ω(e,s)=ω(s,e)=1,
α̃_r(ω(s,t)) ω(r,st)=ω(r,s) ω(rs,t).
```

Continuity means that both `(s,t)↦ω(s,t)a` and
`(s,t)↦aω(s,t)` are norm continuous for every a∈A. Construct the
trivial cocycle, products, inverses, restriction along continuous group
homomorphisms, and transport by conjugacy of coefficient systems. Prove
the cocycle identity at inverses
`ω(s,s⁻¹)=α̃_s(ω(s⁻¹,s))`, closure under these operations, and the
joint continuity of products with varying A-valued coefficients. Treat A=0
with the native zero-algebra unit convention. No unitality, separability or
second-countability hypothesis is imposed on this continuous LCH theory.
Centrality allows α to remain an honest action; a noncentral Busby–Smith
pair, whose action law is instead `α_sα_t=Ad(ω(s,t))α_(st)`, is a
different input and is not encoded as a central cocycle.

Construct `C_c(G,A)` and `L¹(G,A,α,ω)` with

```
(f *_ω g)(s) = ∫ f(r) α_r(g(r⁻¹s)) ω(r,r⁻¹s) dμ(r),
f^{*_ω}(s)   = c(s) ω(s,s⁻¹)* α_s(f(s⁻¹)*).
```

Multiplication by a multiplier is its actual left or right action on A;
the displayed values lie in A. Prove continuity, support containment
`supp(f*_ωg)⊆supp(f)supp(g)`, inverse support for star, associativity,
conjugate linearity, involutivity, reversal of products and
`‖f*_ωg‖₁≤‖f‖₁‖g‖₁`, `‖f^{*_ω}‖₁=‖f‖₁`.
Use A7's localized Haar/Fubini and Bochner-measurability bridges before
passing to almost-everywhere classes and the complete Banach *-algebra;
prove representative independence and C_c density. Construct a contractive
two-sided approximate identity from A7's shrinking-support kernels and
C1's contractive approximate identity of A. Use a joint net directed also
by finite coefficient sets and error tolerances, so strict continuity of ω
is used on the coefficients being approximated, without a uniform strict
bound over all of A's unit ball. Prove convergence first on C_c and then
on L¹. These arguments include nonunital and zero coefficients.

A twisted covariant pair (`CentralCovariantPair`) consists of a nondegenerate
representation π of A and a strongly continuous map `U:G→U(H)` with

```
U_e=1,
U_s π(a) U_s*=π(α_s(a)),
U_s U_t=π̃(ω(s,t)) U_(st).
```

Here π̃ is C1's multiplier extension; U is not a genuine representation
unless the represented cocycle is trivial. Construct the integrated form
by the vector integral `T_fξ=∫π(f(s))U_sξ dμ(s)` and prove
`‖T_f‖≤‖f‖₁` (`exists_centralIntegratedOperator`), multiplicativity and
star preservation with the displayed modular factor. Establish the compact-support proof and L¹ extension in
D1's arbitrary-LCH scope; do not substitute an operator-norm Bochner
integral. Give the intertwiner, unitary equivalence, direct sum,
nondegeneracy and irreducibility comparisons and inverse recovery of the
pair. Extend the correspondence to nondegenerate covariant maps into
multiplier algebras, with strict continuity on the unitary family.

For a nondegenerate representation ρ, let ρ̃ denote its multiplier
extension. On `L²(G,Hρ)` construct

```
Π_ρ(a)ξ(r) = ρ(α_(r⁻¹)(a))ξ(r),
V_s^ω ξ(r) = ρ̃(α̃_(r⁻¹)(ω(s,s⁻¹r))) ξ(s⁻¹r).
```

Prove boundedness, unitarity, strong continuity, covariance,
`V_s^ω V_t^ω=Π̃_ρ(ω(s,t))V_(st)^ω` and nondegeneracy. Establish the
kernel/vector tests and the approximate-identity argument proving that a
faithful nondegenerate ρ gives an injective integrated map on C_c and on
L¹. Use these regular representations to prove definiteness of the full
universal norm. Repeat D1's bounded-cardinality cyclic-representation
construction, C*-identity, universality, independence and completion, now
for these projective covariant pairs; denote the result `A⋊_(α,ω)G`.

Construct the canonical nondegenerate map i_A into its multiplier algebra
and the strictly continuous projective unitary map i_G, with the above
relations and dense integrated span. On the dense C_c algebra their left
and right multiplier actions are

```
(i_A(a)f)(s)=af(s),        (fi_A(a))(s)=f(s)α_s(a),
(i_G(t)f)(s)=α_t(f(t⁻¹s))ω(t,t⁻¹s),
(fi_G(t))(s)=c(t)f(st⁻¹)ω(st⁻¹,t).
```

Prove these are double centralizers, preserve star in the appropriate
multiplier identities, and yield
`i_G(t)*=ĩ_A(ω(t⁻¹,t)*)i_G(t⁻¹)`. Prove the full universal property
and pair recovery using these actual maps and approximate units, including
the zero algebra. For ω=1 give canonical isometric *-isomorphisms with all
of D1's ordinary C_c, L¹, full completion, coefficient/group maps and
representation correspondences, natural for every map specified below.

For a normalized strictly continuous central unitary cochain b define

```
ω^b(s,t)=b(s) α̃_s(b(t)) ω(s,t) b(st)*,
U_s^b=π̃(b(s))U_s,
(T_b f)(s)=f(s)b(s).
```

Prove ω^b is a cocycle and that `T_b` is an isometric *-isomorphism
**from the ω^b algebra to the ω algebra**, with inverse `f(s)↦f(s)b(s)*`.
Extend it to the full completion with
`i_G^(ω^b)(s)↦ĩ_A^ω(b(s))i_G^ω(s)` and i_A unchanged. Prove the
identity/composition/inverse laws, compatibility with integration and
intertwiners, and the commutation of cochain transport with conjugacy,
restriction and compatible coefficient maps. Construct the abelian group of
normalized continuous central cocycles, the coboundary homomorphism from
normalized central unitary cochains, and its cohomology quotient; show that
an explicit cochain witness induces the displayed isomorphism and that a
class alone supplies existence rather than a preferred map. These are central cochains;
no conclusion about arbitrary noncentral exterior equivalence is implicit.

For an equivariant coefficient *-homomorphism φ:A→B, specify twist
compatibility on actual coefficients:
`φ(aω_A(s,t))=φ(a)ω_B(s,t)` and
`φ(ω_A(s,t)a)=ω_B(s,t)φ(a)` for all a,s,t. Construct the pointwise
C_c/L¹ and full crossed-product maps, identity, composition and
surjectivity for quotient maps. This includes degenerate φ; for a
nondegenerate φ prove equivalence to
`φ̃(ω_A(s,t))=ω_B(s,t)`, and prove the multiplier-generator formulas.
For every invariant closed ideal I restrict each multiplier to I, prove
centrality/unitarity/strict continuity there, and pass it to A/I. Prove
`0→I⋊_(α,ω)G→A⋊_(α,ω)G→(A/I)⋊_(α,ω)G→0`, with the first
image generated by `C_c(G,I)`. Restrict the system to every closed
subgroup H with H's own Haar measure and modular character, and construct
the full map `A⋊_(α|H,ω|H)H→M(A⋊_(α,ω)G)` on generators. Restricting
functions G→A to H is a compact-support operation, not an L¹ bounded
crossed-product homomorphism in general. Include trivial and finite groups,
scalar continuous cocycles, conjugate cocycles and coboundaries as tests.
For discrete scalar ω identify the finite-support dense algebra with
Tau Ceti's `twistedMonoidAlgebra ℂ G ω` after the circle-to-complex-unit
transport. Reuse its basis multiplication and `equivOfCoboundary` direction,
construct the compatible star, and prove agreement of the counting-Haar
C*-completion. The existing algebraic carrier is not that completion.
For every locally compact abelian M take G=M×M̂ and
`ω((m,χ),(n,ψ))=ψ(m)`. Construct the strongly continuous Schrödinger
family `(Π_(m,χ)ξ)(x)=χ(x)ξ(x+m)` on L²(M), with the additive Haar
convention, and prove its projective relation and vector-integral
comparison. In this bicharacter case prove
`ω(−x,x)=ω(x,−x)=ω(x,x)⁻¹`, so the scalar star can also be written
`f*(x)=overline(f(−x))ω(x,x)`; the adjoint of Π_x instead has the factor
`overline(ω(x,−x))`. These identities fix the phase conventions consumed
by Heisenberg-module constructions.

**Checks.**

- The trivial cocycle `ω=1` on any system satisfies every law, and
  `L¹(G,A,α,1)` is D1's untwisted algebra with the same formulas.
- For G=ℤ/2 with generator a and A=ℂ, `ω(a,a)=−1` (all other values 1) is a
  normalized cocycle: the identity `α̃_r(ω(s,t))ω(r,st)=ω(r,s)ω(rs,t)` at
  `r=s=t=a` reads `ω(a,a)ω(a,e)=ω(a,a)ω(e,a)`, both sides `−1`. Its twisted
  algebra is `ℂ[ℤ/2,ω]≃ℂ`-span of `1,u` with `u²=−1`, which is `ℂ⊕ℂ` with
  `u↦(i,−i)`, while the untwisted algebra has `u²=1`; the cochain `b(a)=i`
  trivializes ω, and `T_b` sends `δ_a` to `iδ_a`, matching the direction
  ω^b → ω.
- For A=0 every value is the unit of `M(0)=0`, both continuity conditions
  hold, and all constructions return the zero algebra.
- A noncentral Busby–Smith pair with `α_sα_t=Ad(ω(s,t))α_(st)` and ω not
  central, for example the inner action of a nonabelian finite group on
  `M_n(ℂ)` with its Schur multiplier, does not satisfy the `central` law
  and is excluded; the cocycle law alone does not exclude it.
- In the bicharacter case `G=M×M̂`, for `M=ℤ/2` the values are `±1` and
  `ω(x,x)=ψ(m)` for `x=(m,ψ)`; the star formula `f*(x)=overline(f(−x))ω(x,x)`
  agrees with `c(x)ω(x,x⁻¹)*α_x(f(x⁻¹)*)` because `ω(x,−x)=ω(x,x)⁻¹=ω(x,x)`
  there, and differs from the adjoint phase `overline(ω(x,−x))` only by the
  stated inverse.

*Needs:* D1 (integrated forms, regular representation, universal norm);
CStarAlgebras C1 (multiplier algebra, strict topology, approximate units);
BanachAlgebras A7 (Haar integration, modular character, localized Fubini);
D1.Modules (induced Hilbert spaces);
Tau Ceti `twistedMonoidAlgebra` and `TwistedMonoidAlgebra.equivOfCoboundary`
for the discrete scalar comparison; Mathlib `DoubleCentralizer` and `unitary`.

### D1.BorelPrefix. Polish unitary groups, automatic continuity and Borel circle extensions

This prefix is the bridge from measurable to continuous representation
data used by D1.TwistedBorel. It uses only Mathlib, A7's Haar integration
and Fubini theorems and C1's unitary carrier; it uses no induction, type-I
theory or result of D1.TwistedBorel.

For a complex Hilbert space H let `U(H)_s` be `unitary (H →L[ℂ] H)` with
the topology induced by `ContinuousLinearMap.toPointwiseConvergenceCLM`
into `H →Lₚₜ[ℂ] H`, Mathlib's topology of pointwise convergence. It is a
type synonym: the norm topology that `unitary (H →L[ℂ] H)` already carries
is strictly finer when H is infinite-dimensional. Prove that the strong and
weak operator topologies agree on unitaries, by
`‖Uh−Vh‖²=2‖h‖²−2Re⟨Uh,Vh⟩`, and that multiplication and inversion are
continuous, so `U(H)_s` is a topological group (Williams, Lemma D.42).
For separable H prove that `U(H)_s` is Polish: with a dense sequence
`(h_k)` in the unit ball, `Σ_k 2^(−k)(‖(U−V)h_k‖+‖(U*−V*)h_k‖)` is a
complete compatible metric, the unitaries being closed in the strong*
Polish unit ball (Williams, Lemmas D.37 and D.42). For H=0 the group is
trivial; for dim H=1 it is 𝕋 with its usual topology.

Prove the coefficient comparison: for separable H and every measurable
space X, a map `φ:X→U(H)_s` is Borel iff `x↦φ(x)h` is Borel into H for
each h, iff `x↦⟨k,φ(x)h⟩` is Borel for all h,k, iff the last holds for h,k
in one countable dense set. The Borel sets of the Polish space `U(H)_s`
are generated by countably many point-separating continuous coefficients
(Williams, Lemma D.20 applied to `U(H)_s`, and Lemma D.43).

Prove automatic continuity: if G is a Polish group and K is a topological
group whose topology is separable and metrizable, every Borel-measurable
group homomorphism G→K is continuous (Williams, Theorem D.11, through the
Baire property of Borel sets, Lemmas D.15–D.16). Prove also that a
second-countable locally compact Hausdorff group is Polish, so every lcsc
group is an admissible source. For a locally compact source a route
avoiding category is available: cover K by countably many translates of a
small identity neighbourhood, find a preimage of positive Haar measure
inside a compact identity neighbourhood of G, and apply Steinhaus's theorem
`div_mem_nhds_one_of_haar_pos` (Williams, Theorem D.3 and Lemma D.4).
Mathlib's `AddMonoidHom.continuous_of_measurable` treats only additive
homomorphisms from a locally compact normed group into a real normed space,
so it does not apply to `U(H)_s`. A ℚ-linear map ℝ→ℝ that is not ℝ-linear,
built from a Hamel basis, is a discontinuous homomorphism; by the theorem
it is not Borel, and measurability cannot be dropped.

For a second-countable locally compact Hausdorff group G and a normalized
Borel `ω:G×G→𝕋` with `ω(r,s)ω(rs,t)=ω(s,t)ω(r,st)`, let `E_ω=𝕋×G` with
`(z,s)(w,t)=(zwω(s,t),st)`, inverse
`(z,s)⁻¹=(overline(z)·overline(ω(s,s⁻¹)),s⁻¹)`, and the product Borel
structure of `𝕋×G`, which is standard. Prove that the group operations are
Borel and that the product of normalized Haar measure on 𝕋 with μ is a
nonzero σ-finite left-invariant measure. Prove Mackey's theorem: an
analytic Borel group carrying such a measure has exactly one
second-countable locally compact group topology whose Borel sets are the
given ones, and the measure is a Haar measure for it (Williams,
Theorem D.23, with Lemmas D.40–D.44). Existence embeds the group in
`U(L²)_s` by its left-regular representation; uniqueness is automatic
continuity of the identity map. Apply it to `E_ω`: `i(z)=(z,e)` and
`j(z,s)=s` are Borel homomorphisms, hence continuous; i is a homeomorphism
onto the closed central kernel of j, and j is open by
`MonoidHom.isOpenMap_of_sigmaCompact`. For continuous ω the product
topology is an lcsc group topology with the same Borel sets, so by
uniqueness it is the Mackey topology. For a normalized Borel cochain
`b:G→𝕋` and `ω^b(s,t)=b(s)b(t)ω(s,t)overline(b(st))`, the map
`ψ_b(z,s)=(zb(s),s)` is a Borel isomorphism **from `E_(ω^b)` to `E_ω`**,
hence a topological isomorphism. Check: for G=ℤ/2 with generator a,
`ω(a,a)=−1` and `b(a)=i` give `ω^b=1`; `(1,a)` has order 4 in `E_ω`, while
`ψ_b(1,a)=(i,a)` squares to `(1,e)`, so `E_ω≃𝕋×ℤ/2` although the
coordinate section is not a homomorphism.

A strong-Borel ω-representation on a separable Hilbert space H is a Borel
map `V:G→U(H)_s` with `V_e=1` and `V_sV_t=ω(s,t)V_(st)`. Prove that
`(z,s)↦zV_s` is a Borel homomorphism `E_ω→U(H)_s`, hence a strongly
continuous unitary representation in which `(z,e)` acts by z; conversely
`s↦W(1,s)` is a strong-Borel ω-representation for every such
representation W. These correspondences are mutually inverse and preserve
intertwiners, direct sums and unitary equivalence (Williams,
Proposition D.28). On `L²(G,μ)` construct the twisted left-regular family
`(λ^ω_s f)(x)=ω(s,s⁻¹x)f(s⁻¹x)`; prove unitarity and
`λ^ω_sλ^ω_t=ω(s,t)λ^ω_(st)` from left invariance and the cocycle law at
`(s,t,t⁻¹s⁻¹x)`, and strong Borel measurability by the coefficient
comparison, using jointly Borel representatives and Fubini on the lcsc
product. Separability of H and second countability of G make `U(H)_s` and
`E_ω` Polish; the Borel hypothesis on ω makes `E_ω` a Borel group. No
statement here uses the projective quotient `U(H)_s/𝕋`.

**Checks.**

- For H=0 the group `U(H)_s` is trivial; for dim H=1 it is 𝕋 with its usual
  topology, and the metric `Σ_k 2^(−k)(‖(U−V)h_k‖+‖(U*−V*)h_k‖)` on 𝕋 is
  `2|z−w|Σ_k 2^(−k)|h_k|`, a constant multiple of `|z−w|`.
- For G=ℤ/2, `ω(a,a)=−1`: `(1,a)` has order 4 in `E_ω`, `ψ_b(1,a)=(i,a)`
  squares to `(1,e)`, and `E_ω≃𝕋×ℤ/2` although the coordinate section is
  not a homomorphism; for ω=1, `E_ω=𝕋×G` with the product topology.
- A ℚ-linear map ℝ→ℝ built from a Hamel basis that is not ℝ-linear is a
  discontinuous homomorphism, hence not Borel: measurability cannot be
  dropped from the automatic-continuity theorem.
- The twisted regular family on `L²(ℤ/2)` for `ω(a,a)=−1` has
  `λ^ω_aλ^ω_a=−1`, while the untwisted regular representation has
  `λ_a²=1`; a definition that forgets the factor `ω(s,s⁻¹x)` cannot
  distinguish the two.

*Needs:* Mathlib `ContinuousLinearMap.toPointwiseConvergenceCLM`,
`div_mem_nhds_one_of_haar_pos`, `MonoidHom.isOpenMap_of_sigmaCompact`;
BanachAlgebras A7 (Haar integration and Fubini); CStarAlgebras C1 (the
unitary carrier); Williams, Appendix D as cited at each claim.

### D1.TwistedBorel. Scalar Borel fibers of circle extensions

For normalized scalar Borel ω on a second-countable locally compact
Hausdorff G, consume D1.BorelPrefix: the Mackey lcsc topology on
`E_ω=𝕋×_ωG`, the coefficient comparison and automatic continuity for
`U(H)_s`, the correspondence of strong-Borel ω-representations with
representations of `E_ω`, and the strong-Borel twisted regular family.
This route uses neither the projective quotient `U(H)_s/𝕋` nor any
type-I or all-central-weight result. With
`(z,s)(w,t)=(zwω(s,t),st)`, construct the twisted L¹ Banach *-algebra
using the same displayed convolution and scalar involution
`f^{*_ω}(s)=c(s)overline(ω(s,s⁻¹))overline(f(s⁻¹))`.
Use jointly Borel representatives and the lcsc scalar Fubini theorem.
Merely Borel ω gives no C_c multiplication and no strongly continuous
coordinate lift on G. Its covariant objects on separable Hilbert spaces are strong-Borel unitary
families with multiplier ω; prove their equivalence to strongly continuous
representations of E_ω in which `(z,e)` acts by z. Use separable cyclic
models and their orthogonal direct sums for arbitrary Hilbert spaces,
and prove this supplies every nondegenerate representation of the completed
algebra. For an arbitrary possibly degenerate *-representation, split its
Hilbert space into the closed essential subspace and its orthogonal zero
summand; recover the projective unitary family on the essential subspace.

Normalize Haar on 𝕋 to mass one and choose Haar on E_ω by
`∫_E F=∫_G∫_𝕋 F(z,s) dz dμ(s)` in these Borel coordinates; prove
this formula and `c_E(z,s)=c_G(s)`. Construct the central projection
`p_1=∫_𝕋 overline(z)i_E(z,e) dz` in M(C*(E_ω)) and prove that
`F_f(z,s)=overline(z)f(s)` is an isometric L¹ *-isomorphism onto
`p_1 L¹(E_ω)`, with inverse `f(s)=∫_𝕋 zF(z,s) dz` on that ideal.
Prove `p_1*=p_1=p_1²` and the character-one universal property, giving
`C*(G,ω)≃p_1 C*(E_ω)`. Construct its approximate identity by projecting
an L¹ approximate identity of E_ω, and prove faithfulness of the twisted
regular integrated L¹ representation. Prove the vector-integral and
pair-recovery identities, the reduced comparison
`C*_r(G,ω)≃p_1 C*_r(E_ω)` by the weight-one L² subspace, and compatibility
with the full-to-reduced quotient. Construct the Borel cochain transport
in the same direction `f↦fb` as above; compare the Borel extension
isomorphism `(z,s)↦(zb(s),s)` with its topological realization. For
continuous scalar ω identify this construction with D1.CentralTwists and
D2.CentralTwists. For each integer k the same result for ω^k identifies
`J_k(E_ω)≃C*(G,ω^k)` using `p_k=∫overline(z^k)i_E(z,e)dz`.
The decomposition into all weights and its type-I consequences remain
NoncompactQuantumSymmetry M2's targets, with these fiber identifications as inputs.

A pointwise choice of lifts of a ray action supplies neither Borel
measurability nor continuity. Apply the Borel theorem only to lifts
already shown to be Borel, and the continuous theorem only when its strict
continuity hypotheses have been established. These distinct regularity
hypotheses are part of the input, including for central M(A)-valued
cocycles: no claim here assigns a topological completion to an arbitrary
unqualified set-theoretic central cocycle.

**Checks.**

- For ω=1, `p_1` is the projection onto the weight-one summand of
  `C*(𝕋×G)=c₀(ℤ)⊗C*(G)`, and `C*(G,1)=C*(G)`.
- For G=ℤ/2 with `ω(a,a)=−1`, `C*(G,ω)=ℂ⊕ℂ` (the span of `1,u`, `u²=−1`),
  and `p_1C*(E_ω)` is the weight-one summand of `C*(E_ω)=⊕_k J_k`; the
  weight `k=2` fiber is `C*(G,ω²)=C*(G,1)=ℂ⊕ℂ` with `u²=1`.
- For a continuous ω the fiber `p_1C*(E_ω)` agrees with D1.CentralTwists'
  `ℂ⋊_(id,ω)G`; a construction using the `z` rather than `overline(z)` weight
  would produce `C*(G,ω⁻¹)` instead.

*Needs:* D1.BorelPrefix (Mackey topology, coefficient comparison,
automatic continuity, strong-Borel correspondence); D1 (full completion,
approximate units, pair recovery); BanachAlgebras A7 (lcsc scalar Fubini);
CStarAlgebras C1 (multipliers of `C*(E_ω)`).

### Examples

The cyclic shift of `ℤ/3` on `ℂ³` pins the convolution convention; the
`ax+b` group pins the modular factor in the involution; `ℤ/2` with
`ω(a,a)=−1` pins the cocycle, cochain and circle-extension conventions, and
its twisted algebra `ℂ⊕ℂ` with `u²=−1` recurs in D1.CentralTwists,
D1.BorelPrefix, D1.TwistedBorel and D2.CentralTwists; `M_2(ℂ)` with `E_11`,
`E_12` pins the order of the Gram-matrix entries and the sign of the induced
inner product.

### Dependencies

BanachAlgebras A7; CStarAlgebras C1 and C5; Mathlib `ContRepresentation`,
`MeasureTheory.Measure.modularCharacter`, `CStarModule`, `CStarMatrix`,
`DoubleCentralizer`, `unitary`, `ContinuousLinearMap.toPointwiseConvergenceCLM`,
`div_mem_nhds_one_of_haar_pos` and `MonoidHom.isOpenMap_of_sigmaCompact`; Tau
Ceti `ContRepresentation.IsUnitary`, `ContRepresentation.integratedOperatorL1`,
`twistedMonoidAlgebra` and `TwistedMonoidAlgebra.equivOfCoboundary`. Within
the layer: D1 → D1.Modules → D1.CentralTwists, and D1 → D1.BorelPrefix →
D1.TwistedBorel.

## D2. Regular representations, reduced products, and amenability

Use D1's regular covariant representation. Build the regular right Hilbert
A-module (D1.Modules) by completing `C_c(G,A)` with
right action `(f·a)(s)=f(s)α_s(a)` and inner product
`⟨f,g⟩_A=∫ α_(s⁻¹)(f(s)*g(s)) dμ(s)`. Prove that
`f(s)↦α_(s⁻¹)(f(s))` identifies it with the standard `L²(G,A)` module.
Prove that left convolution by `f∈C_c(G,A)` is a bounded module map with
adjoint left convolution by `f*`, so that `C_c(G,A)` acts on the left of
`L²(G,A)` by adjointable maps in the sense of D1.Modules, and that for a
nondegenerate representation ρ of A on H the map
`ξ⊗η↦(r↦ρ(α_(r⁻¹)(ξ(r)))η)` extends to a unitary from the induced Hilbert
space `L²(G,A)⊗_ρH` of D1.Modules onto `L²(G,H)` (Williams, Proposition
I.21, p. 494, for the density of `C_c(G,H)`) carrying the induced operator
of left convolution by f to the integrated regular representation
`(ρ̃⋊λ)(f)` of D1: the regular representation is induced from ρ.

Define `‖f‖r` by any faithful ρ and prove independence of ρ, agreement with
the operator norm of left convolution by f on the module `L²(G,A)`, and
domination by the full norm. Construct `A⋊rG`
as the completion and as the quotient of the full crossed product by the
regular kernel. Develop its canonical multiplier maps, equivariant
functoriality, and factorization of all regular representations. Prove
`A⋊id,rG≃A⊗min Cr*(G)`. The C*-construction retains arbitrary locally
compact Hausdorff G. Prove the weak-closure identification under the
following hypotheses: ρ is a nondegenerate representation of A on H,
`M=ρ(A)''`, and there is an action `ᾱ` of G on M by normal automorphisms,
σ-weakly continuous in the group variable, with `ᾱ_s(ρ(a))=ρ(α_s(a))`. For
`m∈M` let `ρ̄(m)` be the diffused operator `(ρ̄(m)ξ)(t)=ᾱ_(t⁻¹)(m)ξ(t)` on
`L²(G,H)`, so that `ρ̄(ρ(a))=ρ̃(a)`. Prove that the closure in the weak
operator topology of `(ρ̃⋊λ)(A⋊_rG)` is the von Neumann algebra generated
by `ρ̄(M)` and the translation unitaries `1⊗λ_s`: the integrated operators
lie in that algebra because they are weak-operator integrals of its
elements; conversely each `ρ̄(m)` is the strong limit of `ρ̃(a_i)` along a
bounded net `ρ(a_i)→m` of the Kaplansky density theorem, by dominated
convergence of `∫‖(ᾱ_(t⁻¹)(ρ(a_i))−ᾱ_(t⁻¹)(m))ξ(t)‖²dt`, and `1⊗λ_s` is a
strong limit of integrated operators of an approximate identity translated
by s. Prove first that σ-weak continuity of `s↦ᾱ_s(m)` implies its
σ-strong-star continuity, from the identity
`φ((ᾱ_s(m)−m)*(ᾱ_s(m)−m))=φ(ᾱ_s(m*m))−φ(ᾱ_s(m)*m)−φ(m*ᾱ_s(m))+φ(m*m)`
for a positive normal functional φ, which makes `t↦ᾱ_(t⁻¹)(m)ξ(t)`
continuous for `ξ∈C_c(G,H)` and `ρ̄(m)` well defined and bounded by `‖m‖`.
Identify the coefficient and group maps under this description. No
C*-result below depends on this identification.

**Checks.**

- G trivial: the regular module is A itself with `⟨a,b⟩_A=a*b`, the induced
  space `A⊗_ρH` is H, and the regular representation is ρ.
- `A=ℂ` with the trivial action: `L²(G,ℂ)⊗_ρH=L²(G)⊗H` and left convolution
  by f induces `λ(f)⊗1`.
- The direction of the action in the unitary: for `G=ℤ/2` acting on `A=ℂ²` by
  the swap, `ρ=id` on ℂ², and `ξ=δ_a⊗e_1`, `⟨ξ,ξ⟩_A=α_a(e_1)=e_2`, so
  `‖ξ⊗η‖²=|η_2|²`; the displayed map gives `ρ(α_a(e_1))η=η_2e_2` of the
  same norm, while `ξ⊗η↦(r↦ρ(ξ(r))η)` gives `η_1e_1` and is not isometric.

For discrete G, finite sums `∑ a_g u_g` form a dense *-subalgebra. Construct
the faithful conditional expectation `E:A⋊rG→A`, `E(∑a_gu_g)=a_e`, and
contractive Fourier-coefficient maps `x↦E(xu_g*)`. Prove coefficient
uniqueness, covariance, positivity and faithfulness, and naturality under
equivariant maps. The corresponding full expectation factors through the
regular quotient; its faithfulness is equivalent to that quotient being
injective. Include the trivial group, finite groups, and scalar group
algebras as normalization tests.

For invariant I prove injectivity of `I⋊rG→A⋊rG` and surjectivity onto
`(A/I)⋊rG`. Define exactness of a locally compact group by exactness in the
middle for every such reduced sequence. Prove that amenability implies
`A⋊G≃A⋊rG` for every action, hence exactness of the group. Give the
approximation argument through Reiter's condition P₁. Construct, from an
invariant mean, positive norm-one L¹ functions whose left translates
converge in L¹ uniformly on each compact set; prove the converse and the
square-root P₂ approximation. Prove the converse P₂ criterion too:
almost invariant unit vectors ξ in L² give the norm-one L¹ densities
`|ξ|²`, with `‖|λ_sξ|²−|ξ|²‖₁≤2‖λ_sξ−ξ‖₂`.
Their integration states have an invariant weak-* cluster point, giving
amenability; include the discrete ℓ² specialization. Use those vectors to show the trivial
representation weakly contained in the regular one, and transfer covariant
integrated norms by tensoring and absorption. Prove the compact-support
approximation and integrated norm estimates; do not insert exactness as an unconditional
property of reduced crossed products. Prove that a nuclear A and amenable G
give a nuclear crossed product, using C6's CP approximations.
For exact A and amenable G prove the crossed product is exact.
Establish the coefficient-tensor identification
`(A⋊rG)⊗min D ≃ (A⊗min D)⋊rG` for the trivial action on D,
using regular representations. Apply it to a coefficient exact sequence:
exactness of A followed by exactness of the amenable group's reduced
crossed-product functor proves the assertion. Include the full-product
identification and generator formulas for G=ℤ, used by
CStarClassification CL5's translation and lifting construction.
For compact G
also identify the regular decomposition through Peter–Weyl, reusing
RepresentationTheory/CompactGroups.

### D2.OrbitRepresentations. Discrete orbits and irrational rotations

Let a discrete group G act by homeomorphisms on a locally compact Hausdorff X.
For p∈X use the actual orbit O=G·p as an index set and form
`H_p=lp (fun _ : O => ℂ) 2`. The orbit's subspace topology in X may be
nondiscrete; it is its underlying set that indexes this Hilbert sum. Construct
`(π_p(f)ξ)(x)=f(x)ξ(x)` for f∈C₀(X) and
`(U_gξ)(x)=ξ(g⁻¹x)`. Prove π_p is a nondegenerate *-representation, U is
unitary and strongly continuous for discrete G, and covariance holds for
`α_g(f)(x)=f(g⁻¹x)`. Prove
`‖π_p(f)‖=sup_(x∈O)|f(x)|` and
`ker π_p={f:f|_(closure O)=0}`; thus its coefficient representation is
faithful exactly when O is dense. Nondegeneracy follows by local compactly
supported functions on each finite set of orbit points and Hilbert-sum density.

Prove the integrated full crossed-product representation Π_p is irreducible.
For a bounded operator T commuting with π_p(C₀(X)), its matrix coefficients
between δ_x and δ_y satisfy `(f(x)−f(y))T_xy=0`. Separation of distinct
points by C₀(X) makes every off-diagonal coefficient zero; the native ℓ² basis
then gives `Tξ(x)=d(x)ξ(x)`, with `sup_x|d(x)|≤‖T‖`. Commutation with U
makes d constant on O, so the common commutant is ℂI
(`transitive_commutant_scalar`, stated on the Hilbert sum of any transitive
G-set with a point-separating family of diagonal operators). Apply D1's
integrated intertwiner dictionary and CStarAlgebras C2's nonzero Schur
criterion.
No discrete-subspace hypothesis on O or countability of G or O is required.
Prove Π_p and Π_q are unitarily equivalent exactly when p,q lie in the same
orbit. For different orbits, use the same point-separation argument to show
every intertwiner has all matrix coefficients zero. Equivariant homeomorphisms
of systems induce the corresponding orbit-index unitary comparisons.

If the action is free at p, identify H_p with ℓ²(G) by g↦g·p and prove this
is exactly D1/D2's regular covariant representation induced from evaluation at p.
Consequently Π_p factors through the reduced crossed product; prove that this
reduced representation is faithful exactly when O is dense. For the forward
criterion use its diagonal coefficients
`⟨δ_g,Π_p(a)δ_g⟩=E(a)(g·p)`, applied to a*a, continuity and faithfulness of E.
For necessity use a nonzero coefficient function vanishing on closure O.
Arbitrary stabilizers still give the full representation above. For a fixed
point and a nonamenable G its group representation is trivial and does not
factor through C*_r(G); this is the scalar test preventing an unrestricted
reduced-factorization claim.

For θ∉ℚ take `X=AddCircle (1:ℝ)`. To match OperatorKTheory K7's
`α_n(f)(x)=f(x+nθ)`, use the geometric action n·x=x−nθ. Every orbit is free
and dense. In the integer index of H_x the generators are
`(uξ)(n)=ξ(n−1)` and `(vξ)(n)=exp(2πi(x−nθ))ξ(n)`;
prove `uv=exp(2πiθ)vu`, matching K7's ordered generators. The positive
geometric rotation instead gives the parameter −θ with this covariance
convention. Prove all these representations are faithful and irreducible,
while the representations at x,y are unitarily equivalent iff
`x−y∈θℤ+ℤ` for real lifts. Their common primitive kernel is 0, even when the
representations are inequivalent. Prove the orbit quotient is indiscrete by
density of every orbit. The orbit quotient is not identified with the
primitive ideal space.

**Checks.**

- For G=ℤ/2 swapping the two points of X={p,q}, `H_p=ℂ²`, `π_p(f)=diag(f(p),f(q))`
  and U_a the swap; the commutant of both is the scalars, the representation
  is faithful because O=X, and the representations at p and q are unitarily
  equivalent (same orbit).
- For θ∉ℚ and x∈X, `(uvξ)(n)=exp(2πi(x−(n−1)θ))ξ(n−1)` and
  `(vuξ)(n)=exp(2πi(x−nθ))ξ(n−1)`, so `uv=exp(2πiθ)vu`; the positive
  rotation n·x=x+nθ gives `uv=exp(−2πiθ)vu`, the parameter −θ.
- For x,y with `x−y∉θℤ+ℤ`, the eigenvalue sets of `π_x(z)` and `π_y(z)`,
  z the coordinate function, are the disjoint dense sets
  `{exp(2πi(x−nθ))}` and `{exp(2πi(y−nθ))}`, so no nonzero intertwiner
  exists; both kernels are 0.
- For a fixed point p and G=F₂, `H_p=ℂ`, U is the trivial character, and
  `Π_p` restricted to the group is the trivial representation of `C*(F₂)`,
  which does not factor through `C*_r(F₂)` (D2.FreeGroups); a claim that
  every orbit representation factors through the reduced crossed product
  fails here.

*Needs:* D1 (integrated forms, intertwiner dictionary); D2 (regular
representation, coefficient expectation, reduced crossed product);
CStarAlgebras C2 (Schur criterion, irreducible representations); Mathlib
`lp`, `AddCircle`, `MulAction.IsPretransitive`.

### D2.CentralTwists. Reduced central twisted products

For each D1.CentralTwists system complete `C_c(G,A)` with the same right
action and inner product as D2. Its identification with the standard
`L²(G,A)` module is still `f(r)↦α_(r⁻¹)(f(r))`. Prove left twisted
convolution is a bounded adjointable operator with adjoint the displayed
twisted star. In standard-module coordinates its coefficient map is
`aξ(r)=α_(r⁻¹)(a)ξ(r)` and its projective unitary is
`V_sξ(r)=α̃_(r⁻¹)(ω(s,s⁻¹r))ξ(s⁻¹r)`; multiplication here is the
multiplier action on A. Prove the formulas on compact-support sections,
A-linearity, boundedness, adjoints and extension, and show that the
induced Hilbert space `⊗_ρH` of D1.Modules for a nondegenerate ρ is
`L²(G,H_ρ)` carrying precisely D1.CentralTwists' regular pair.

Define the reduced norm by this module. Prove its agreement with every
faithful nondegenerate ρ, definiteness on C_c/L¹, domination by the full
norm and independence of ρ. Construct `A⋊_(α,ω),r G` as the completion
and as the quotient by the regular kernel, with canonical quotient q,
multiplier maps, generator relations and regular factorization. Extend
the compatible coefficient maps, ideals, quotient maps, closed-subgroup
multiplier maps and cochain transports of D1.CentralTwists to reduced
products and prove q commutes with them. For cochain b give the regular
intertwining unitary explicitly: in standard-module coordinates
`(W_bξ)(r)=α̃_(r⁻¹)(b(r))ξ(r)` and
`W_b V_s^(ω^b) W_b*=Π̃(b(s))V_s^ω`.
Prove the corresponding equality for integrated forms, on the module
and after tensoring with ρ.

For discrete G retain all D2 coefficient-expectation conclusions with
`u_su_t=ĩ_A(ω(s,t))u_(st)`,
`u_s*=ĩ_A(ω(s⁻¹,s)*)u_(s⁻¹)`, and
`E(Σ a_su_s)=a_e`. Prove coefficient recovery, uniqueness, positivity,
faithfulness, naturality and full-expectation factorization through q.
Use counting Haar measure for these formulas. For an invariant ideal
prove injectivity of the reduced ideal map and surjectivity of the
reduced quotient map. Middle exactness is proved when G is amenable;
no claim of middle exactness for arbitrary G is made. Reuse D2's actual
P₁/P₂ construction, proving the twisted absorption unitary and its
integrated estimates before concluding q is an isomorphism for amenable
G. Prove the nuclear-coefficient and exact-coefficient consequences under
this amenability hypothesis, using C6/C7 and the reduced tensor comparison
`(A⋊_(α,ω),r G)⊗min D≃(A⊗min D)⋊_(α⊗id,ω⊗1),r G`.
Construct the induced multiplier cocycle ω⊗1 by the nondegenerate
coefficient tensor map, including nonunital D; prove the tensor norm and
generator formulas. Include the corresponding maximal/full comparison.
For α trivial and ω scalar identify
`A⋊_(id,ω)G≃A⊗max C*(G,ω)` and
`A⋊_(id,ω),r G≃A⊗min C*_r(G,ω)` with their actual generators.
For compact G compare the regular decomposition with the weight sector of
the compact scalar extension when ω is scalar.

At ω=1 prove that these identifications recover the entire ordinary
D1–D2 construction and every map/expectation/norm/amenability/tensor result
above. No von Neumann crossed product, twisted or untwisted, is a
prerequisite for this C* theory.
The dependency order is C1/A7/D1.Modules → D1.CentralTwists →
D2.CentralTwists. The scalar Borel route is A7/C1 → D1.BorelPrefix →
D1.TwistedBorel; the all-weight decomposition and type-I applications are
consumers of these two sections. It has no edge from those applications
or from von Neumann crossed-product duality back into D1.

**Checks.**

- At ω=1 every formula of this section is D2's: the regular module, the
  expectation `E(Σa_su_s)=a_e` and the generator relation `u_su_t=u_(st)`.
- For G=ℤ/2, A=ℂ and `ω(a,a)=−1`: the finite group is amenable, so
  `ℂ⋊_(id,ω)ℤ/2=ℂ⋊_(id,ω),rℤ/2`, the algebra spanned by `1,u_a` with
  `u_a²=ĩ_A(ω(a,a))=−1`; the relation `u_a*=ĩ_A(ω(a,a)*)u_a=−u_a` makes
  `u_au_a*=−u_a²=1`, and `E(x+yu_a)=x`. A definition with `u_s*=u_(s⁻¹)`
  would give `u_a*=u_a`, which is not unitary here.
- For a nonamenable G, for example F₂ with ω=1, q is not injective: the
  trivial character of `C*(F₂)` does not factor through the reduced
  algebra (D2.FreeGroups), so middle exactness is asserted only under
  amenability.
- For α trivial, ω scalar and D nonunital, `(A⋊_(id,ω),rG)⊗min D` and
  `(A⊗min D)⋊_(id,ω⊗1),rG` agree on the generators `(a u_s)⊗d` and
  `(a⊗d)u_s`; the induced cocycle `ω⊗1` has values in `M(A⊗D)`, not in
  `A⊗D`.

*Needs:* D1.CentralTwists (twisted L¹, full completion, multiplier maps,
cochain transport); D2 (regular module, expectation, P₁/P₂ approximation,
tensor identification); D1.Modules (induced Hilbert spaces); CStarAlgebras C5–C7 (tensor products, nuclearity,
exactness).

### D2.FreeGroups. Powers averaging, simplicity and the canonical trace

For a discrete group Γ use D1–D2's full and reduced group C*-completions,
counting Haar measure, and `λ(g)δ_h=δ_(gh)` on `ℓ²(Γ,ℂ)`. The finite-support
group algebra is `MonoidAlgebra ℂ Γ`. Prove that D2's coefficient expectation
specializes to the faithful tracial state `τ(x)=⟨δ_1,xδ_1⟩`, with
`τ(Σ_g c_g λ(g))=c_1`. Define the Powers property by the following exact
partition condition (de la Harpe, Definition 9, p. 7): for every finite `F⊆Γ∖{1}` and every integer `N≥1`
there are `Γ=C⊔D` and `γ_1,…,γ_N` with `fC∩C=∅` for every `f∈F` and
pairwise disjoint sets `γ_j D`. No countability assumption is part of
this definition or of the averaging criterion below.

Prove this property for `FreeGroup ι` whenever the basis ι has two distinct
elements, at arbitrary cardinality (`exists_powers_partition`; de la Harpe,
Corollary 12(i), p. 8, gives it for free products through the dynamical
criterion of his Proposition 11, while the construction below is a direct
reduced-word argument). In particular this includes every
finite rank `F_n=FreeGroup (Fin n)`, n≥2. Consume Mathlib's `FreeGroup.toWord`,
its reduction and multiplication API, rather than a second free-word
carrier. Give an explicit construction: choose distinct positive generators
a,b and `L` larger than all reduced-word lengths in F. Conjugation by
`w=a b^L` makes every `w f w⁻¹` start with a and end with a⁻¹. For this
conjugated finite set take C to be words starting with b or b⁻¹ and D its
complement; `b^j D`, `1≤j≤N`, are disjoint. Transport the partition back
by left multiplication by w⁻¹ and take `γ_j=b^j w`. Prove the reduced-word
claims, including F empty and words that are powers of b.

Develop the reusable Hilbert-space estimate for any discrete group with the
Powers property. If
`x=Σ_(f∈F)c_f λ(f)` and P_j projects onto `ℓ²(γ_j D)`, prove
`(1−P_j)λ(γ_j)xλ(γ_j)* (1−P_j)=0` and

```
‖(1/N) Σ_j λ(γ_j)xλ(γ_j)*‖ ≤ 2 ‖x‖ / sqrt N.
```

This is the estimate in the proof of de la Harpe's Theorem 14 (pp. 10–11).
State and prove the projection estimate also for an arbitrary bounded
operator with this zero-compression property and pairwise orthogonal P_j.
It does not require x self-adjoint: decompose each conjugate T_j as
`P_j T_j+(1−P_j)T_j P_j` and use the orthogonal ranges in the first sum
and in the adjoint of the second. Construct the coordinate projections
on the existing `lp` Hilbert carrier and prove their norm and orthogonality
identities. The projections need not belong to the group C*-algebra.

By centered finite-support approximation prove, for every x in `Cr*(Γ)`
and every ε>0, that a finite average of conjugations by the canonical group
unitaries has distance less than ε from `τ(x)1`. Prove the simultaneous
finite-family version using one common support and partition, the averaging
maps' unital positivity and contractivity, and the resulting membership
`τ(x)1∈closure(conv{λ(g)xλ(g)* : g∈Γ})`.

Deduce that `Cr*(Γ)` is simple and τ is its unique tracial state whenever Γ
has the Powers property, and specialize to `FreeGroup ι` with at least two
basis elements (`reducedFreeGroup_isSimpleRing` and
`reducedFreeGroup_trace_unique`, on the C*-algebra `generatedCStarAlgebra`
generated by the left-regular unitaries, which are pinned by the coordinate
law `(λ(g)ξ)(h)=ξ(g⁻¹h)` on `lp (fun _ : FreeGroup ι => ℂ) 2`; simplicity
is stated as `IsSimpleRing`, so for every two-sided ideal, closed or not). For a
nonzero closed two-sided ideal, normalize a nonzero positive element by
its strictly positive τ-value, average it to within distance less than 1
of the unit, and obtain an invertible element in the ideal. Also deduce
that every nonzero algebraic two-sided ideal is the whole algebra: its
closure is a nonzero closed ideal and a dense ideal contains an invertible
element. Thus the assertion about two-sided ideals does not silently change
its meaning when no closure is written. Tracial-state uniqueness follows
from invariance under each finite conjugate average and density.

These conclusions concern reduced group C*-algebras. Full `C*(FreeGroup ι)`
has the trivial character. For a nontrivial canonical generator u, the
element u−1 lies in its proper kernel and is nonzero, as its regular image
moves δ_1. Thus the full algebra is not simple when the basis has at least
two elements, and the canonical regular quotient cannot be injective.
Compare with FreeProbability F3's independent
F₂ full/reduced norm obstruction; that calculation is not a prerequisite
for the Powers argument. Construct canonical isometric embeddings of reduced
subgroup algebras by the right-coset decomposition of the regular Hilbert
space, including `Cr*(F₂)→Cr*(FreeGroup ι)`. No K-theory result is used here.
The empty-basis algebra is ℂ and the singleton-basis algebra is C(𝕋);
the latter has many traces and is not simple. OperatorKTheory K7 owns the
separate free-basis K-group calculation and its full/reduced comparison.

For the partition and averaging argument use de la Harpe, *On simplicity
of reduced C*-algebras of groups*: Definition 9 (p. 7) for the Powers
property, Corollary 12(i) (p. 8) for free products, the proof of Theorem 14
(pp. 10–11) for the projection decomposition, the estimate `2‖x‖/√N` and
the invertible element within distance less than 1 of the unit, and the
Dixmier-property remark (p. 19) for the unique trace. The explicit
reduced-word partition, the estimate for an arbitrary operator with the
zero-compression property and the algebraic-ideal and unique-trace
conclusions are proved here as stated.

**Checks.**

- F=∅, N=2, with `w=ab`: C the words starting with b^(±1), D the rest;
  `bD` and `b²D` are disjoint because a reduced word in `b^jD` has exactly
  j leading b's; the transported `γ_j=b^jw` keep this.
- `F={b}` with L=2 and `w=ab²`: `wbw⁻¹=ab a⁻¹` starts with a and ends with
  a⁻¹, so `(wbw⁻¹)C∩C=∅`; a partition that put the words starting with a
  into C would fail, since `(aba⁻¹)·a=ab` starts with a.
- For `x=λ(f)`, `f∈F`, and `ξ=δ_c` with c∈C: `λ(γ_j)xλ(γ_j)*` maps
  `ℓ²(γ_jC)` into `ℓ²(γ_jfC)⊆ℓ²(γ_jD)`, so the compression by `1−P_j` on
  both sides is 0; for N=1 the estimate gives `‖λ(γ_1)xλ(γ_1)*‖≤2‖x‖`,
  which is weaker than the trivial bound and shows the estimate only
  improves with N.
- The singleton basis: `Cr*(FreeGroup (Fin 1))=C(𝕋)` has the evaluation
  traces at every point of 𝕋 and is not simple; the Powers property fails
  for ℤ at `F={1}`, N=3: `(C+1)∩C=∅` leaves C at most half of every
  interval of even length, so D has at least half, while three pairwise
  disjoint translates of D leave D at most a third of every long interval
  up to boundary terms. For N=2 the partition into even and odd integers
  with `γ_2−γ_1=1` does satisfy the condition.
- Full versus reduced: `u−1` for a canonical generator u is in the kernel
  of the trivial character of `C*(FreeGroup ι)` and `λ(u)δ_1−δ_1≠0`, so
  the full algebra is not simple when the basis has two elements.

*Needs:* D1–D2 (full and reduced group C*-algebras, expectation,
regular quotient); CStarAlgebras C1 (ideals, invertible elements near the
unit); Mathlib `FreeGroup.toWord`, `FreeGroup.reduce`, `lp`, `lp.single`,
`StarAlgebra.adjoin`, `StarSubalgebra.topologicalClosure`,
`IsSimpleRing`.

**D2.BoundedSequenceTranslation.** Take the coefficient algebra exactly as
`B=ℓ∞(ℤ,ℂ)`, using native `lp (fun _ : ℤ=>ℂ) ∞`, and
`α_k(f)(n)=f(n−k)`. Construct its unital C*-structure and translation action
with the supremum norm. On `H=ℓ²(ℤ,ℂ)` construct diagonal M_f and the
bilateral shift `Uδ_n=δ_(n+1)`, and prove covariance, `‖M_f‖=‖f‖∞`
and the coordinate/matrix-coefficient formulas. Prove the integrated
representation of `R=B⋊αℤ` is faithful. Use D2's amenable full/reduced
comparison and the circle gauge action implemented by
`V_zδ_n=z^nδ_n`; averaging this action is the coefficient expectation
and is faithful. This works for the nonseparable coefficient algebra B.

Identify the image with the operator-norm closure of the bounded finite-band
operators on H: T has bandwidth at most N when
`⟨δ_i,Tδ_j⟩=0` for `|i−j|>N`. For such a T construct the bounded sequences
`f_k(i)=⟨δ_i,Tδ_(i−k)⟩`, with `‖f_k‖∞≤‖T‖`, and prove the actual equality
`T=Σ_(k=−N)^N M_(f_k)U^k`. Prove equality first on the coordinate vectors
and then by finite-support density. Conversely every finite integrated sum
has finite bandwidth. Give the resulting isometric star-algebra isomorphism;
this concrete closure is the uniform Roe algebra of the integer line.
Only this explicitly defined model is in this target.

The elements `E_ij=M_(1_{i})U^(i−j)` are actual matrix units and rank-one
operators. Prove their finite span is the finite-support matrix algebra,
its norm closure is K(H), and that the inclusion
`c₀(ℤ)⋊ℤ→R` has exactly this image, using D3's translation model.
Thus K(H) is an essential simple closed ideal in R: if T≠0 choose a
coordinate vector δ_j with Tδ_j≠0, then some E_ii T E_jj is a nonzero
multiple of E_ij. Use this also to prove irreducibility of the faithful
representation, its scalar commutant, and `Z(R)=ℂ1`. Its image contains
1_H and H is infinite-dimensional, so R is not CCR. No singleton
characteristic function is identified with the coefficient identity.

Construct the nonzero unital quotient
`Q=(ℓ∞(ℤ)/c₀(ℤ))⋊ℤ` and the exact sequence
`0→K(H)→R→Q→0`, using D1's full exactness and amenability.
Give its quotient maps on f and U and prove the kernel assertion.
Every nonzero irreducible representation of R is either the faithful
standard representation or an irreducible representation of Q pulled
back through the quotient. Prove this by restriction to the compact ideal
and unique nondegenerate multiplier extension, with equivalence and kernel
comparisons. Every nonzero closed ideal of R contains K(H); hence the
closed ideals are 0 and the inverse images of the closed ideals of Q.
Identify `Prim(R)={η}⊔Prim(Q)`, η=0, with opens ∅ and
`{η}∪O` for O open in Prim(Q). In particular η is open and dense;
Prim(Q) is its closed complement. This is a quotient-spectrum description,
without identifying the boundary with the circle of SequenceToeplitz.

Prove R and Q have no unital complex characters. For the even-integer
projection p, covariance gives `UpU*=1−p`; a character would send p
to an idempotent scalar equal to 1 minus itself, which is impossible.
The same relation holds in Q. Construct the faithful inclusion of
SequenceToeplitz's C₊⋊ℤ in R from its translation-invariant coefficient
inclusion, respecting the common compact ideal and quotient maps.
The C₊ example's circle characters need not extend to R.

**Checks.**

- `E_ijδ_n=M_(1_{i})δ_(n+i−j)=[n=j]δ_i`, so E_ij is the rank-one operator
  `δ_j↦δ_i`, and `E_ijE_kl=[j=k]E_il`; with the opposite shift sign
  `Uδ_n=δ_(n−1)` the same formula would give `δ_(2i−j)↦δ_i` instead.
- For `T=M_fU^k`, `⟨δ_i,Tδ_j⟩=f(i)[i=j+k]`, bandwidth |k|, and
  `f_k(i)=⟨δ_i,Tδ_(i−k)⟩=f(i)` recovers f; `f_m=0` for m≠k.
- The even projection `p=M_(1_{2ℤ})` satisfies `UpU*=M_(1_{2ℤ+1})=1−p`; a
  character χ would give `χ(p)=1−χ(p)` with `χ(p)∈{0,1}`, so none exists.
- With `c₀(ℤ)` in place of `ℓ∞(ℤ)` the same representation has image
  `K(H)`, the translation model of D3; the unit and the quotient Q appear
  only for the bounded coefficients.
- R is not CCR because `M_1=1_H` is in the image and H is
  infinite-dimensional; `c₀(ℤ)⋊ℤ=K(H)` is CCR.

*Needs:* D1 (crossed product, exactness for invariant ideals); D2
(amenable full/reduced comparison, gauge expectation); D3
(`C₀(G)⋊G≅K(L²G)` for G=ℤ); CStarAlgebras C1–C2 (ideals, quotients,
irreducible representations, primitive ideal space); Mathlib `lp`,
`lp.single`.

**D2.SequenceToeplitz — an asymmetric sequence algebra and its crossed product.**
Inside native `lp (fun _ : ℤ=>ℂ) ∞` construct the closed nonunital
star subalgebra
`C₊={f:lim_(n→−∞)f(n)=0 and lim_(n→+∞)f(n) exists in ℂ}`,
with its supremum norm. Pin translation to `α_k(f)(n)=f(n−k)`.
Give the limit character ℓ₊, its kernel c₀(ℤ), and the equivariant exact
sequence `0→c₀(ℤ)→C₊→ℂ→0`, with trivial action on ℂ.
Let `B=C₊⋊αℤ`. Use D1's full exactness and D2's amenable full/reduced
comparison to construct
`0→K(ℓ²(ℤ))→B→C(𝕋)→0`.
In the concrete covariant representation on ℓ²(ℤ), let M_f be diagonal
multiplication and `Ue_n=e_(n+1)`. Prove this representation faithful,
using its circle gauge action and faithful conditional expectation, and
identify the ideal by the explicit matrix units `M_(δ_i) U^(i−j)`.
For finite integrated sums the quotient map is
`q(Σ_k M_(f_k)U^k)(z)=Σ_k ℓ₊(f_k)z^k`; prove its continuous extension,
surjectivity and exact kernel.

Classify all nonzero irreducible representations of B: the faithful
representation on ℓ²(ℤ), and the characters `ev_z∘q`, z∈𝕋.
Prove completeness by restricting an irreducible to the compact ideal:
if nonzero it is its unique standard irreducible representation and
extends uniquely; otherwise it factors through C(𝕋).
Give the primitive kernels and hull–kernel topology explicitly. Writing
η for the faithful kernel 0, the underlying set is `{η}∪𝕋`; its open
sets are ∅ and `{η}∪O` with O open in 𝕋, including O=∅.
Thus η is open and dense and the circle is closed with its usual topology.
Classify all closed ideals from these opens, with their quotient maps.
Prove B is type I by splitting each factor representation according to
the support of its compact ideal: the nonzero support gives a compact
operator amplification, and the zero-support case factors through the
commutative quotient. Prove B is not CCR, since its faithful irreducible
image contains the infinite-rank diagonal projection
`e=M_(1_[0,∞))`.

Prove e is a full projection of B and identify the full corner eBe with
CStarAlgebras C8's concrete Toeplitz algebra on ℓ²(ℕ), by
`eUe↦S`, where S is the forward unilateral shift. Show the diagonal
coefficients restricted to ℕ are convergent sequences, recover their
finite-rank diagonal parts from `S^n(1−SS*)S*^n`, and prove both corner
inclusions. Match `eK(ℓ²(ℤ))e` with K(ℓ²(ℕ)), q(e)=1 and the symbol
of S with z, so the corner extension is exactly C8's Toeplitz extension.
Deduce its faithful representation and circle of character representations,
the same generic-point-plus-circle primitive topology, and type I but
non-CCR status. For an arbitrary nondegenerate representation prove the
finite sums of rank-one diagonal projections converge strongly to the
support of the compact ideal; the orthogonal complement is the quotient
representation, on which S is unitary. They need not converge to I.

**Checks.**

- `ker ℓ₊=c₀(ℤ)`: `ℓ₊(f)=0` together with `lim_(n→−∞)f(n)=0` is vanishing
  at both ends.
- `q(e)=1` for `e=M_(1_[0,∞))`, and `eUe` acts on `ℓ²(ℕ)` by
  `δ_n↦δ_(n+1)`, the unilateral shift S, with `1−SS*` the rank-one
  projection onto δ_0; this is C8's Toeplitz extension.
- The nonzero irreducible representations are the standard one and the
  circle of characters `ev_z∘q`, z∈𝕋: a classification with a single
  additional irreducible, or a two-point primitive space, is refuted by the
  characters of `C(𝕋)`.
- In the character `ev_z∘q` every `E_nn` is sent to 0, so
  `Σ_(n)π(E_nn)` converges strongly to 0, not to I; in the standard
  representation it converges to I.
- B is not CCR: e has infinite rank in the standard representation; the
  quotient `C(𝕋)` is commutative, so B is type I.

*Needs:* D1 (full exactness); D2 (amenable comparison, gauge
expectation); D2.BoundedSequenceTranslation (matrix units, the inclusion
`C₊⋊ℤ→R`); CStarAlgebras C2 (irreducible representations, primitive
ideals, type I and CCR) and C8 (the concrete Toeplitz algebra); Mathlib
`lp`.

**D2.SaddleFlow — the orbit topology of a diagonal real flow.**
For the continuous action `t·(x,y)=(exp(t)x,exp(−t)y)` of ℝ on ℝ²,
classify orbits and compute the quotient topology directly. The nonaxis
orbits are the four quadrant branches indexed by `r=|xy|>0`;
each is closed. The remaining orbits are the four open half-axes and the
origin. Each half-axis orbit has closure equal to itself together with
the origin. On each quadrant family use the usual topology on r>0.
At a half-axis give a neighborhood basis consisting of that half-axis
point and the intervals `0<r<ε` in its two adjacent quadrant families;
these neighborhoods exclude the origin. At the origin give a basis
consisting of the origin, all four half-axis points and `0<r<ε` in
all four quadrant families. Prove these bases from saturated open sets
in ℝ². Deduce T₀, failure of T₁ and failure of Hausdorffness. This target
computes the orbit space, without identifying it with a crossed-product
primitive space.

**Checks.**

- `xy` is invariant, so the orbit of (x,y) with `xy=r>0` is the branch
  `{(u,r/u):u>0}` of its quadrant, closed in ℝ²; the orbit of (x,0), x>0,
  is the open positive x-half-axis, whose closure adds the origin.
- The saturated open set `{(x,y):x>0,|xy|<ε}` is a neighbourhood of the
  positive x-half-axis point that contains neither the origin nor any
  branch with r≥ε; so a half-axis point is T₀-separated from the origin,
  and a neighbourhood of a half-axis point need not contain the origin.
- Every neighbourhood of the origin contains the four half-axis points,
  so T₁ fails; the neighbourhoods of the +x and +y half-axis points both
  contain the first-quadrant branches with `0<r<ε`, so they meet and the
  quotient is not Hausdorff.
- On the branches of one quadrant the quotient topology is the usual
  topology of `r∈(0,∞)`: the map `(x,y)↦xy` is continuous and open on the
  open quadrant.

*Needs:* Mathlib `Real.exp`, quotient topologies and `IsOpenMap`; no
operator-algebra input.

### Examples

The irrational rotation algebra through its orbit representations with
`uv=exp(2πiθ)vu`; the reduced free-group algebra with its Powers partition
`w=ab^L`; the uniform Roe algebra `ℓ∞(ℤ)⋊ℤ` with its essential compact
ideal and no characters; the asymmetric sequence algebra `C₊⋊ℤ` with its
generic-point-plus-circle primitive space and Toeplitz corner; the saddle
flow with its non-Hausdorff orbit space.

### Dependencies

D1 with D1.Modules and D1.CentralTwists; BanachAlgebras A7; AmenableGroups
(invariant means and Følner conditions); CStarAlgebras C1, C2, C5–C8;
RepresentationTheory/CompactGroups (Peter–Weyl); FreeProbability F3 is a
comparison, not an input; Mathlib `lp`, `lp.single`, `AddCircle`,
`MulAction.IsPretransitive`, `FreeGroup.toWord`, `FreeGroup.reduce`,
`StarAlgebra.adjoin`, `StarSubalgebra.topologicalClosure` and
`IsSimpleRing`. The weak-closure identification at the end of D2's main
body uses Mathlib `VonNeumannAlgebra` and the Kaplansky density theorem and
is consumed by nothing below.

## D3. Induction and imprimitivity

For a closed subgroup H and an H-algebra `(D,β)`, construct

```
Ind_H^G(D,β) = { f ∈ C_b(G,D) |
  f(sh)=β_(h⁻¹)(f(s)), and (sH ↦ ‖f(s)‖) ∈ C₀(G/H) }.
```

Develop its norm, evaluation maps, approximate units, functoriality,
left-translation G-action, and associated-bundle interpretation. When β is
the restriction of α, prove that `f(s)↦α_s(f(s))` identifies this algebra
with `C₀(G/H,A)` carrying
`σ_t φ(rH)=α_t(φ(t⁻¹rH))`. Supply the compact-support lifting and partition
of unity lemmas used in density and fullness arguments.

Prove Green imprimitivity for arbitrary closed H:
`Ind_H^G(D,β)⋊G` is strongly Morita equivalent to `D⋊H` through an
imprimitivity bimodule in the sense of D1.Modules. Construct the module on
`C_c(G,D)` with its Haar integrals, actions and both inner products; prove
positivity, norm estimates, compatibility, fullness and completion. For the
restricted-action model fix `γ_H(h)=Δ_G(h)^(1/2)Δ_H(h)^(-1/2)` and

```
⟨f,g⟩_(A⋊H)(h) = γ_H(h) ∫ α_(s⁻¹)(f(s)*g(sh)) dμ_G(s).
```

Use the matching left action, right action and left inner product of
Williams Theorem 4.22. Establish their conversion from the general induced
model, including the modular rescaling; the subgroup and ambient modular
functions need not agree. Induction through this bimodule (D1.Modules)
gives the induced representations `Ind_H^G` of covariant pairs of `(D,H,β)`
and of their bounded intertwiners. Prove induction in stages for closed
subgroups `K⊆H⊆G`: the pairing `C_c(G,D)⊙C_c(H,D)→C_c(G,D)` of Williams,
Lemma 5.10, satisfies the compatibility laws of D1.Modules' stage lemma and
has dense range, so `Ind_H^G(Ind_K^Hπ)` is unitarily equivalent to `Ind_K^Gπ`
for every covariant pair π of `(D,K,β|_K)` (Williams, Theorem 5.9); prove
also the compatibility of the module and covariant descriptions.
Identify H=G and H={e}, and prove
`C₀(G)⋊ltG≃K(L²G)` by explicit compactly supported integral kernels.

Prove symmetric imprimitivity. If K and H act freely and properly on the
left and right of a locally compact Hausdorff P, the actions commute, and
α and β are commuting actions on A, define induced algebras by
`F(ph)=β_(h⁻¹)(F(p))` and `F(kp)=α_k(F(p))`, respectively, with norm
vanishing at infinity on the corresponding orbit space. Their commuting
actions are `σ_kF(p)=α_k(F(k⁻¹p))` and `τ_hF(p)=β_h(F(ph))`.
Construct the imprimitivity bimodule on `C_c(P,A)` from Williams Theorem 4.1
and prove
`Ind_H^P(A,β)⋊σK ∼M Ind_K^P(A,α)⋊τH`. Develop equivariance,
change-of-variable and orbit-space APIs and derive Green's general theorem
as the specialization P=G. Preserve the actual Haar factors in the dense
module formulae; the identification of these explicit bimodules with the
abstract `A≅K_B(X)` and linking-algebra descriptions is HilbertModules
H3's.

**Checks.**

- H=G: the equivariance condition with h ranging over G makes f determined
  by `f(e)`, so `Ind_G^G(D,β)=D` and Green's theorem reads `D⋊G∼_MD⋊G`
  through the self-bimodule; H={e}: `Ind_(e)^G(D,id)=C₀(G,D)` and the
  theorem reads `C₀(G,D)⋊G∼_MD`, which for `D=ℂ` is `C₀(G)⋊G∼_Mℂ`, consistent
  with `C₀(G)⋊G≅K(L²G)` and `K(H)∼_Mℂ` through H.
- The modular factor: for the `ax+b` group G and its dilation subgroup
  `H={(a,0)}`, `Δ_H=1` while `Δ_G(a,0)≠1`, so `γ_H(a,0)=Δ_G(a,0)^(1/2)≠1`;
  the star law `⟨f,g⟩*=⟨g,f⟩` in `A⋊H` holds exactly when
  `γ_H²=Δ_G/Δ_H`, as the substitution `s=th` in the integral shows, and
  the definition without `γ_H` breaks it. For unimodular G and H, `γ_H=1`.
- `C₀(G)⋊G≅K(L²G)` for G finite of order n: both sides have dimension n²,
  and the integrated representation is `M_n(ℂ)`; a trivial action in place
  of translation would give `C(G)⊗C*(G)`, whose centre has dimension at
  least n, while `M_n(ℂ)` has a one-dimensional centre. For
  G=ℤ the identification is the `c₀(ℤ)⋊ℤ=K(ℓ²(ℤ))` of
  D2.BoundedSequenceTranslation.
- Symmetric imprimitivity with P=G, K=G acting on the left and H⊆G on the
  right, β the restriction of α: `Ind_G^G(A,α)=A`, the other induced algebra
  is `Ind_H^G(A,β)`, and the statement is Green's theorem; with K=H={e} and
  P a point both sides are A.

*Needs:* D1 (crossed products, universal property, integrated forms,
multiplier maps); D1.Modules (imprimitivity bimodules, induced Hilbert
spaces, the stage lemma); D2 (regular representations, for the compact
operator identification); BanachAlgebras A7 (Haar measures on G and H,
modular identities); Mathlib Haar measure on `G/H` and the quotient
integral formula, with the quasi-invariant-measure version for a closed
non-normal H as a target here; CStarAlgebras C1 (approximate units,
multipliers).

**D3.LCAWeyl — translation covariance and the general LCA Weyl dictionary.**
For every locally compact Hausdorff abelian G, use `PontryaginDual G` with
its compact-open topology and D4.Harmonic's identification `C*(Ĝ)≅C₀(G)`,
the Fourier isomorphism applied to Ĝ composed with D4.Harmonic's Pontryagin
duality theorem. With `α_s(f)(t)=f(s⁻¹t)`, prove the equivalence between
nondegenerate covariant pairs `(π,U)` for `(C₀(G),G,α)` and pairs of
strongly continuous unitary representations U of G and V of its dual
satisfying `U_s V_χ U_s*=conjugate(χ(s)) V_χ`. Extend π to multipliers and
set `V_χ=π̃(t↦χ(t))`. Conversely integrate V to C*(Ĝ), use its Fourier
isomorphism with C₀(G) sending the canonical multiplier at χ to
`t↦χ(t)`, and prove nondegeneracy, covariance and both inverse laws.
The integrated Fourier formula is D4.Harmonic's positive-character
transform on Ĝ, with the dual Haar measure of the inversion theorem. Prove compatibility
with bounded intertwiners, unitary equivalence and Hilbert direct sums.
Replacing V_χ by V_(χ⁻¹) gives the alternative commutator χ(s); the
displayed relation is Williams's Heisenberg relation `S_χR_s=χ(s)R_sS_χ`
with `R=U`, `S=V` (Williams, Definition 4.26 and Lemma 4.28, pp. 135–136).
No assertion about differentiating unbounded generators is needed.

Through D3's explicit `C₀(G)⋊ltG≅K(L²G)` prove that every such
nondegenerate Weyl pair is a multiplicity amplification of the Schrödinger
pair `U_sξ(t)=ξ(s⁻¹t)`, `V_χξ(t)=χ(t)ξ(t)` on L²(G). Construct the
intertwining unitary and its multiplicity space using rank-one operators;
allow arbitrary Hilbert multiplicity and zero multiplicity. The nonzero
irreducible pair has multiplicity one and is unique up to unitary
equivalence (Williams, Theorem 4.24, p. 133, and Theorem 4.29, p. 137).
This uses the representation theory of compact operators,
not a finite-dimensional real-space restriction of Stone–von Neumann. For
`G=ℝⁿ` the Schrödinger pair on `L²(ℝⁿ)` is the one of the unitary
Stone–von Neumann theorem that MetaplecticAutomorphicForms §1.2 states; the
comparison of the two statements is made in that later roadmap, and no
second real-case proof is given here.

**Checks.**

- G=ℤ/2: `Ĝ=ℤ/2`, the Schrödinger pair on ℂ² has U_a the swap and
  `V_χ=diag(1,−1)` for the nontrivial χ, and `U_aV_χU_a*=diag(−1,1)=overline(χ(a))V_χ`;
  every Heisenberg pair of ℤ/2 is a multiple of this two-dimensional one.
- G=ℤ: `Ĝ=𝕋` and `V_zξ(t)=z^tξ(t)` on `ℓ²(ℤ)`: `(U_sV_zξ)(t)=z^(t−s)ξ(t−s)`
  and `(V_zU_sξ)(t)=z^tξ(t−s)`, so `U_sV_zU_s*=overline(z^s)V_z`; with
  `V_(z⁻¹)` in place of V_z the phase is `z^s`.
- G=ℝ with `χ_ξ(t)=exp(iξt)`: `U_sV_(χ_ξ)U_s*=exp(−iξs)V_(χ_ξ)`, the Weyl
  relation with the stated sign; the Fourier transform
  `f̂(χ)=∫f(g)χ(g)dμ(g)` sends the canonical multiplier at χ of `C*(Ĝ)` to
  the function `t↦χ(t)`, and the conjugate-character transform would send
  it to `t↦overline(χ(t))`, changing the covariance to `χ(s)`.
- Zero multiplicity is the pair on H=0, nondegenerate vacuously; a pair on
  `L²(G)⊕L²(G)` has multiplicity two and is reducible.

*Needs:* D3 (`C₀(G)⋊G≅K(L²G)` with its integral kernels); D4.Harmonic
(the dual group, `C*(Ĝ)≅C₀(G)`, the Pontryagin duality theorem and the dual
Haar measure); CStarAlgebras C1 (multiplier extensions) and C2 (the
representation theory of compact operators); Mathlib `PontryaginDual`.

### Examples

`H=G` and `H={e}` in Green's theorem; the `ax+b` group and its dilation
subgroup for the modular factor `γ_H`; `C₀(G)⋊G≅K(L²G)` for finite G and
for G=ℤ; the Schrödinger pairs of `ℤ/2`, ℤ and ℝ with their covariance
phases `conj(χ(s))`.

### Dependencies

D1, D1.Modules and D2; D4.Harmonic for D3.LCAWeyl (`C*(Ĝ)≅C₀(G)`, the
Pontryagin duality theorem and the dual Haar measure); BanachAlgebras
A7; CStarAlgebras C1–C2; Mathlib Haar measure, `PontryaginDual` and the
quotient integral formula on `G/H` where it applies.

## D4. Dual actions and Takai duality

D4.Harmonic builds the harmonic analysis of a locally compact abelian group
that duality needs: the Fourier isomorphism of the full group C*-algebra,
the dual Haar measure with the Plancherel unitary and Fourier inversion, the
Pontryagin duality theorem, and with it the identification `C*(Ĝ)≅C₀(G)`;
D4.Takai is the duality theorem.

### D4.Harmonic. Fourier isomorphism, Plancherel, inversion and Pontryagin duality

Let G be a locally compact Hausdorff abelian group with a regular Haar
measure μ (Mathlib `Measure.IsHaarMeasure` together with `Measure.Regular`:
the class `IsHaarMeasure` does not include regularity, and regular Haar
measures are unique up to a positive scalar by Mathlib
`isMulLeftInvariant_eq_smul_of_regular`) and
`Ĝ=PontryaginDual G`, the continuous characters `G→𝕋` with the compact-open
topology, a locally compact abelian group by Mathlib's instance.
BanachAlgebras A7 supplies the bijection of Ĝ with the Gelfand spectrum of
`L¹(G)`, `χ↦(f↦∫f(g)χ(g)dμ(g))`, and the agreement of the compact-open
topology with the Gelfand topology (Williams, Proposition 1.76 and Lemma
1.78, pp. 24–25). Define the Fourier transform `f̂(χ)=∫f(g)χ(g)dμ(g)` on
`L¹(G)` in the positive-character convention of this roadmap (Williams,
(1.20), p. 26, in the same convention) and prove `f̂∈C₀(Ĝ)`,
`‖f̂‖_∞≤‖f‖₁`, `(f*g)^=f̂ĝ`, `(f*)^=conj(f̂)`, and that `f↦f̂` is the
Gelfand transform of `L¹(G)` under A7's correspondence.

Prove the Fourier isomorphism: `f↦f̂` extends to a *-isomorphism
`C*(G)≅C₀(Ĝ)` of D1's full group C*-algebra `ℂ⋊G`, so that the universal
norm of `f∈L¹(G)` is `sup_χ|f̂(χ)|` (Williams, Proposition 3.1, p. 82, whose
proof runs through one-dimensional irreducible representations). Route:
`C*(G)` is a commutative C*-algebra, because `L¹(G)` is commutative and
dense; CStarAlgebras C1's nonunital Gelfand isomorphism gives
`C*(G)≅C₀(Ω)` for its nonzero character space Ω; every character of
`C*(G)` restricts to a character of `L¹(G)`, and every character of
`L¹(G)` is a one-dimensional representation, hence bounded by the universal
norm, so restriction is a bijection `Ω→Ĝ`; it is a homeomorphism because
the characters are uniformly bounded and `L¹(G)` is dense, so weak-*
convergence on `L¹(G)` and on `C*(G)` agree, and A7 identifies the
resulting topology with the compact-open one. The composite
`C*(G)≅C₀(Ω)≅C₀(Ĝ)` sends f to f̂. Prove that the regular quotient
`C*(G)→C*_r(G)` is an isomorphism for abelian G, by D2's amenable
comparison and the amenability of abelian groups, so the same transform
identifies the reduced algebra on `L²(G)` with `C₀(Ĝ)`.

Prove the dual Haar measure and the Plancherel theorem
(`exists_dualHaar_plancherel_inversion`): there is a regular Haar measure μ̂ on Ĝ,
the dual measure of μ, such that `f↦f̂` on `L¹(G)∩L²(G)` is isometric into
`L²(Ĝ,μ̂)` and extends to a unitary `F:L²(G,μ)≅L²(Ĝ,μ̂)` (Rudin, Theorem
1.6.1; Williams's Example 7.11, p. 198, uses it in this form). Route, through
the cyclic spectral theorem for the regular representation and not through
Bochner's theorem: for `f∈C_c(G)` Tau Ceti's
`ContRepresentation.exists_pontryaginMeasureTransform_eq_inner`, applied to
the left-regular representation λ in additive notation, gives a finite inner
regular measure `ν_f` on Ĝ with `⟨f,λ_sf⟩=∫χ(s)dν_f(χ)`, hence
`⟨f,λ(h)f⟩=∫ĥdν_f` for `h∈L¹(G)` by the integrated form. Prove
`ν_(λ(k)f)=|k̂|²ν_f` for `k∈C_c(G)` from `λ(k)*=λ(k*)` and `(k*)^=conj(k̂)`:
both sides are finite inner regular measures with the transform
`s↦⟨λ(k)f,λ_sλ(k)f⟩`, so they agree by Tau Ceti's
`MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular`;
and, since `λ(k)f=k*f=f*k=λ(f)k` on an abelian group, deduce the consistency
identity `|k̂|²ν_f=|f̂|²ν_k`. Define μ̂ on the open set `{f̂≠0}` as
`|f̂|⁻²ν_f`; the consistency identity glues these to one Radon measure on
Ĝ, because every χ has some `f=conj(χ)φ` with `φ≥0` nonzero in `C_c(G)` and
`f̂(χ)=∫φ>0`. Prove translation invariance: multiplication by a character
`χ₀` is a unitary of `L²(G)` with `⟨χ₀f,λ_s(χ₀f)⟩=conj(χ₀(s))⟨f,λ_sf⟩`, so
`ν_(χ₀f)` is the translate of `ν_f` by `χ₀⁻¹`, as `|(χ₀f)^|²` is of `|f̂|²`.
Thus μ̂ is a Haar measure with `∫|f̂|²dμ̂=ν_f(Ĝ)=‖f‖₂²` on `C_c(G)`; extend
by density, and prove surjectivity of F from the facts that its range is
closed and invariant under multiplication by every `ĝ`, `g∈L¹(G)`, and that
these functions are dense in `C₀(Ĝ)` (a conjugation-closed subalgebra that
separates the points of Ĝ and vanishes nowhere, Stone–Weierstrass). Prove
that μ̂ is the unique regular Haar measure making the transform isometric and that
`μ↦cμ` gives `μ̂↦c⁻¹μ̂`.

Prove Fourier inversion (`exists_dualHaar_plancherel_inversion`): for
`f∈L¹(G)` with `f̂∈L¹(Ĝ,μ̂)`, `f(x)=∫f̂(χ)conj(χ(x))dμ̂(χ)` for almost every
x, so f has a continuous representative (Rudin, Theorem 1.5.1). Route from
Plancherel by an approximate identity `φ_n≥0` in `C_c(G)` with `∫φ_n=1`:
for `f∈L¹∩L²`, polarized Plancherel gives
`(f*φ_n)(x)=∫conj(χ(x))φ̂_n(χ)f̂(χ)dμ̂(χ)`, since `t↦conj(φ_n(t⁻¹x))` has
transform `χ↦χ(x)conj(φ̂_n(χ))`; `φ̂_n→1` boundedly and `f*φ_n→f` in `L¹`,
so dominated convergence gives the formula; for general `f∈L¹` apply this
to `f*φ_n∈L¹∩L²` and let n grow.

Prove the Pontryagin duality theorem (`pontryagin_duality`): the evaluation
map `ev:G→(Ĝ)^`, `ev(s)(χ)=χ(s)`, is an isomorphism of topological groups
(Rudin, Theorem 1.7.2; Williams, p. 27, states it from Folland). Route:
ev is a continuous homomorphism because evaluation is jointly continuous on
`Ĝ×G` and compact sets of characters are equicontinuous; it is injective
because `(λ_xf)^=ev(x)f̂` and Plancherel give `λ_xf=f` for every `f∈L²(G)`
when `ev(x)=1`, while `λ_x1_V≠1_V` for a compact identity neighbourhood V
with `xV∩V=∅`; it is open onto its image because for an open identity
neighbourhood U the function `f=g*g̃` with `g=1_V/√μ(V)`, `VV⁻¹⊆U`, has
`f(e)=1`, `f̂=|ĝ|²∈L¹(Ĝ)` with `∫f̂dμ̂=1`, and inversion shows that
`|χ(x)−1|<ε` on a compact set carrying all but ε of `f̂dμ̂` forces
`|f(x)−1|<3ε`, hence `x∈U`; its image is closed because a locally compact
subgroup of a Hausdorff group is closed. Surjectivity: `ev(G)` is a closed
subgroup of `(Ĝ)^`; for `ξ₀∉ev(G)`, Plancherel on the group Ĝ gives, for
indicator functions of compact neighbourhoods in `(Ĝ)^`, functions
`F∈L¹(Ĝ)` whose transform `F̂` on `(Ĝ)^` is a convolution of two such
indicators, equal to 1 at ξ₀ and 0 on `ev(G)` (Rudin, §2.6); then
`∫F(χ)f̂(χ)dμ̂(χ)=∫f(x)F̂(ev(x))dμ(x)=0` for every `f∈L¹(G)`, so Fμ̂
annihilates the dense subalgebra `{f̂}` of `C₀(Ĝ)` and `F=0`, a
contradiction.

With the Pontryagin duality theorem `ev:G≅(Ĝ)^`, apply the Fourier
isomorphism to Ĝ with the dual Haar measure μ̂ and compose with ev:
`C*(Ĝ)≅C₀(G)` sends D1's canonical unitary of `C*(Ĝ)` at χ to the function
`t↦χ(t)` and `f∈L¹(Ĝ)` to `t↦∫f(χ)χ(t)dμ̂(χ)`. This is the isomorphism
D3.LCAWeyl and D4.Takai use. It does not depend on the scaling of μ̂: a
function f represents, with respect to `cμ̂`, the element of `C*(Ĝ)` that
`cf` represents with respect to μ̂, and the multiplier formula involves no
measure.

- The Fourier transform on `L¹(G)` with its algebraic laws, as the Gelfand
  transform under A7's correspondence.
- The Fourier isomorphism `C*(G)≅C₀(Ĝ)` of the full group C*-algebra, with
  the universal norm `sup|f̂|`, and the agreement of full and reduced group
  C*-algebras for abelian G.
- The dual Haar measure μ̂ of μ, the Plancherel unitary `F:L²(G)≅L²(Ĝ)`
  extending `f↦f̂` from `L¹∩L²`, and Fourier inversion for `f∈L¹(G)` with
  `f̂∈L¹(Ĝ)`, stated together as `exists_dualHaar_plancherel_inversion`: for
  every locally compact Hausdorff abelian group with Borel structures on G
  and Ĝ and every regular Haar measure μ on G, there is a regular Haar
  measure on Ĝ for which both hold.
- The Pontryagin duality theorem `pontryagin_duality`: for every locally
  compact Hausdorff abelian group there is an isomorphism of topological
  groups `G≅(Ĝ)^` whose underlying map is evaluation.
- The identification `C*(Ĝ)≅C₀(G)` with its action on canonical unitaries.

**Checks.**

- `G=ℤ/2` with counting measure: `Ĝ={1,χ}` with `χ(a)=−1`, `f̂(1)=f_0+f_1`
  and `f̂(χ)=f_0−f_1` for `f=(f_0,f_1)`, so `C*(ℤ/2)≅ℂ⊕ℂ` with `δ_a↦(1,−1)`;
  the universal norm of `δ_e+δ_a` is 2 and that of `δ_a` is 1, and
  `(δ_a*δ_a)^=(δ_e)^=(1,1)=((1)²,(−1)²)` as multiplicativity requires.
- `G=ℤ` with counting measure: `Ĝ≅𝕋` by `z↦(n↦zⁿ)`
  (`TauCeti.circleEquivPontryaginDualInt`), `f̂(z)=Σf(n)zⁿ`, and
  `C*(ℤ)≅C(𝕋)` sends the generator `δ_1` to the coordinate function z. The
  classical Fourier coefficient `∫f(e^(iθ))e^(−inθ)dθ/2π` (Williams, (1.21),
  p. 27) is the transform of a function on 𝕋 at the character `z↦z^(−n)`; in
  this roadmap's convention it is the value at `−n` of the transform on 𝕋.
- `G=ℝ` with Lebesgue measure: the characters are `χ_ξ(x)=e^(iξx)` and
  `f̂(ξ)=∫f(x)e^(iξx)dx`; Mathlib's `Real.fourierIntegral` integrates
  `f(x)e^(−2πiwx)`, so it is this transform at `χ_(−2πw)`.
- G trivial: `Ĝ` is trivial, `C*(G)=ℂ=C₀(point)`, and ev is the identity.
- For noncompact G neither `C*(G)` nor `C₀(Ĝ)` has a unit, since Ĝ is
  compact exactly when G is discrete: for G=ℝ the right side is `C₀(ℝ)`, and
  the unital Gelfand transform does not apply, which is why C1's nonunital
  isomorphism is the input; for G=ℤ the right side is the unital `C(𝕋)`
  with `δ_0↦1`.
- The conjugate-character transform `∫f(g)conj(χ(g))dμ(g)` is the transform
  at `χ⁻¹`; under it the canonical unitary at χ of `C*(Ĝ)` would go to
  `t↦conj(χ(t))`, which changes the covariance phase of D3.LCAWeyl to
  `χ(s)`.
- Non-example: for `G=S₃` the characters `G→𝕋` factor through `ℤ/2` while
  `C*(S₃)=ℂ⊕ℂ⊕M_2(ℂ)` is not commutative, so no isomorphism of `C*(G)` with
  `C₀` of the character group exists; the abelian hypothesis is used.
- The dual measure of counting measure on a finite abelian group of order n
  is `1/n` times counting measure on Ĝ: for `f=δ_e`, `f̂≡1`, `‖f‖₂²=1` and
  `Σ_χ|f̂(χ)|²=n`, so counting measure on Ĝ fails Plancherel by the factor n
  for `n≥2`; the dual measure of counting measure on ℤ is the normalized
  Haar measure of 𝕋, where Plancherel is Parseval's identity for Fourier
  series; the dual measure of Lebesgue measure on ℝ is `dξ/2π` for the
  characters `χ_ξ`.
- The conjugate in the inversion formula, on `G=ℤ/3` with `f=δ_1`:
  `f̂(χ)=χ(1)` and `(1/3)Σ_χf̂(χ)conj(χ(x))=(1/3)Σ_χχ(1−x)=[x=1]=f(x)`,
  while the formula with `χ(x)` in place of `conj(χ(x))` gives
  `(1/3)Σ_χχ(1+x)=[x=−1]=f(−x)`, the reflected function; the two differ at
  `x=1`.
- Pontryagin duality for `G=ℤ`: `Ĝ=𝕋` and `(Ĝ)^=ℤ` through
  `n↦(z↦zⁿ)`, with `ev(n)(z)=zⁿ`, so ev is the identity of ℤ under this
  identification, and the discrete topology is recovered since
  `|zⁿ−1|<1` for all `z∈𝕋` forces `n=0`; for `G=𝕋`, `ev(z)(n)=zⁿ` and the
  pulled-back neighbourhoods `{z:|zⁿ−1|<ε for n in a finite set}` are the
  usual ones. For the trivial group ev is the identity of a point.
- The cyclic measure of the regular representation: for `G=ℤ/2` with
  counting measure and `f=δ_0`, `⟨f,λ_sf⟩=[s=0]`, so `ν_f` is `(1/2)` times
  counting measure on `Ĝ={1,χ}`, and `|f̂|⁻²ν_f=ν_f` is the dual measure,
  as the first Check requires.

*Needs:* BanachAlgebras A7 (`L¹(G)` and the character correspondence with
its topology); D1 (`C*(G)=ℂ⋊G`, its universal norm and canonical unitaries,
the integrated form of λ); CStarAlgebras C1 (the nonunital commutative
Gelfand isomorphism); D2 and AmenableGroups (the amenable comparison for
abelian G); Tau Ceti
`ContRepresentation.exists_pontryaginMeasureTransform_eq_inner`,
`MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular`
and `TauCeti.PontryaginDual.continuous_coe_eval_const`; Mathlib
`PontryaginDual`, `Circle`, `ContinuousMulEquiv`, Haar measure with
`Measure.IsHaarMeasure`, `Lp`, and the Stone–Weierstrass theorem applied on
the one-point compactification of Ĝ; Tau Ceti
`TauCeti.circleEquivPontryaginDualInt` for the Checks.

### D4.Takai. The Takai duality theorem

For locally compact abelian G use `PontryaginDual G` with its compact-open
topology. From D4.Harmonic's `C*(Ĝ)≅C₀(G)`, dual Haar measure, Plancherel
unitary, Fourier inversion and Pontryagin duality theorem, construct the
strongly continuous dual action
`α̂χ(f)(s)=χ(s)f(s)` and prove its multiplier formulae, functoriality and
compatibility with full and reduced completions. Use D4.Harmonic's dual Haar
measure, for which the positive-character Fourier transform is unitary on
L²; identify G with its bidual by `s↦(χ↦χ(s))`.

Construct the Takai isomorphism
`(A⋊αG)⋊α̂Ĝ ≃ A⊗K(L²G)` and prove that it intertwines the double-dual
action with `α⊗Ad ρ`, where `ρ_s ξ(r)=ξ(rs)` for this unimodular G.
Give the maps on the canonical coefficient and both group multiplier
representations and verify the dense integrated formulae. Build the
intermediate identification with the diagonal action on `C₀(G,A)` and use
D3's integral-kernel compact-operator identification. Prove naturality under
equivariant maps, independence of the allowed Haar rescaling, and the same
statement for reduced products, using amenability of abelian groups.
Compute the finite abelian, G=ℤ and G=ℝ instances, including the Fourier
and translation signs. The result is an equivariant isomorphism with these
specified maps, not merely an abstract Morita equivalence.

**Checks.**

- G finite abelian of order n and `A=ℂ` with the trivial action:
  `ℂ⋊G=C*(G)≅C(Ĝ)` with the dual action equal to translation on Ĝ, so the
  iterated product is `C(Ĝ)⋊Ĝ≅K(ℓ²(Ĝ))=M_n(ℂ)`, of dimension n², and the
  right side `ℂ⊗K(ℓ²(G))` is `M_n(ℂ)` too; a statement with `A⊗C*(G)` on
  the right would be commutative of dimension n and wrong for `n≥2`.
- G=ℤ and `A=ℂ`: `C*(ℤ)≅C(𝕋)` by D4.Harmonic, the dual action of 𝕋 is
  rotation, and `C(𝕋)⋊𝕋≅K(ℓ²(ℤ))=ℂ⊗K(L²(ℤ))`.
- The direction of the double-dual action: for `G=ℤ/3` and `A=ℂ` the
  isomorphism carries the double-dual action of the generator `s=1` to
  `Ad ρ_1` on `M_3(ℂ)`, with `ρ_1e_t=e_(t−1)` from `ρ_sξ(r)=ξ(rs)`; the
  conjugate-character convention identifies G with its bidual through
  `s↦ev(s⁻¹)` and would give `Ad ρ_(−1)`, which differs from `Ad ρ_1` on
  `ℓ²(ℤ/3)`; on `ℤ/2` the two agree, so that instance does not detect the
  sign.
- G trivial: both sides are A, the dual group is trivial, and the reduced
  statement coincides with the full one.

*Needs:* D1–D2 (full and reduced crossed products, `A⋊idG≃A⊗maxC*(G)`,
the amenable comparison for abelian G); D3 (`C₀(G)⋊G≅K(L²G)` by integral
kernels); D4.Harmonic (`C*(Ĝ)≅C₀(G)`, the full/reduced agreement, the dual
Haar measure with the Plancherel unitary, Fourier inversion and the
Pontryagin duality theorem); Mathlib `PontryaginDual`.

### Examples

`ℤ/2`, ℤ and ℝ for the Fourier transform and its conventions against
Mathlib's `Real.fourierIntegral`; `S₃` as the non-abelian non-example;
Takai duality for finite abelian groups, for ℤ, and the `ℤ/3` sign witness
of the double-dual action.

### Dependencies

D1–D2 and D3; BanachAlgebras A7; AmenableGroups; CStarAlgebras C1; Mathlib
`PontryaginDual`, `Circle`, `ContinuousMulEquiv`, Haar measure and `Lp`;
Tau Ceti `ContRepresentation.exists_pontryaginMeasureTransform_eq_inner`,
`MeasureTheory.FiniteMeasure.ext_of_forall_pontryaginMeasureTransform_eq_of_innerRegular`,
`TauCeti.PontryaginDual.continuous_coe_eval_const` and
`TauCeti.circleEquivPontryaginDualInt`.

## D5. Haar groupoids, convolution, and disintegration

Consume LieGroupoidsPoisson G0's unit/arrow and composable-pair topology
and continuous operations. Develop the Haar-theoretic restrictions to
isotropy, invariant subsets, reductions, transformation groupoids and
continuous groupoid actions on that interface. A Haar system is a family of positive Radon measures λᵘ with
support exactly `Gᵘ=r⁻¹(u)`, continuous integration of compactly supported
functions, and left invariance
`∫ f(γ η) dλˢ⁽ᵞ⁾(η)=∫ f(η) dλʳ⁽ᵞ⁾(η)`. Prove openness of range and
source and compact-support continuity of the integration map. Haar systems
are supplied data; local compactness alone does not produce them. Let λᵤ
be the image of λᵘ under inversion, a measure on the source fiber.

Construct `C_c(G)` with

```
(f*g)(γ) = ∫ f(η) g(η⁻¹γ) dλʳ⁽ᵞ⁾(η)
f*(γ)    = conjugate (f(γ⁻¹))
‖f‖I     = max (sup_u ∫ |f| dλᵘ) (sup_u ∫ |f| dλᵤ).
```

Prove compact support, continuity, the *-algebra identities and I-norm
estimates, and construct approximate identities in the compact-support
inductive-limit topology. Define the full C*-norm using I-bounded
*-representations and the reduced norm using the regular representations
on `L²(G_u,λ_u)`:
`L_u(f)ξ(γ)=∫ f(γ η⁻¹)ξ(η) dλ_u(η)`. Prove that this family separates
`C_c(G)`, yields a C*-norm, and is dominated by the full norm. Complete both
algebras and construct the canonical regular quotient and the nondegenerate
unit-space multiplier maps `hf=(h∘r)f`, `fh=f(h∘s)`.

Build the measure-theoretic representation layer explicitly. For a Radon
measure μ on the unit space set `ν=∫λᵘ dμ(u)`. Quasi-invariance means ν and
its inverse image ν⁻¹ have the same null sets. Develop the Radon–Nikodym
cocycle `D=dν/dν⁻¹`, its inverse and composable-pair identities on appropriate
conull sets, the symmetric measure `ν₀=D^(-1/2)ν`, and change of density under
equivalent base measures. Use Mathlib measures, measurable maps, integrals
and almost-everywhere equality rather than an independent measure language.

**Checks.**

- A group G as a one-unit groupoid with Haar measure as its Haar system:
  `f↦Δ_G^(1/2)f` is a *-isomorphism from D1's convolution algebra `C_c(G)`
  (coefficients ℂ) onto the groupoid convolution algebra, since
  `(Δ^(1/2)f)*(Δ^(1/2)g)=Δ^(1/2)(f*g)` and the groupoid star of `Δ^(1/2)f`
  is `Δ^(1/2)` times D1's `f*(s)=Δ(s)⁻¹conj(f(s⁻¹))`; without the factor the
  two involutions differ by `Δ(s)⁻¹`, visibly for the `ax+b` group.
- The I-norm of a one-unit groupoid is `max(‖f‖₁,‖Δ⁻¹f‖₁)`, because `λ_u` is
  the image of Haar measure under inversion; it equals `‖f‖₁` exactly for
  unimodular G.
- The pair groupoid `X×X` with `λ^x=δ_x×μ`: convolution is kernel
  composition `(f*g)(x,z)=∫f(x,y)g(y,z)dμ(y)`, `f*(x,z)=conj(f(z,x))`, and
  the support axiom `supp λ^x=G^x` forces μ to have full support; the
  symmetric measure `ν=μ×μ` is inversion invariant, so `D=1`.
- Quasi-invariance for a one-unit groupoid with `μ=δ`: `ν` is Haar measure,
  `dν⁻¹/dμ=Δ⁻¹`, so `D=Δ_G` and `ν₀=Δ^(−1/2)ν`; `D=1` exactly for unimodular
  G.

*Needs:* the topological groupoid layer named in Exact supplier contracts
(the total-arrow and composable-arrow topologies); D1–D2
(the group and transformation-groupoid comparisons); BanachAlgebras A7
(Haar measure and modular identities); CStarAlgebras C1 (full completions,
multipliers); Mathlib Radon measures, `Measure.rnDeriv`, measurable maps
and Bochner integration.

**D5.Fields — standard-fibre direct integrals and decomposable
operators.** Over a second-countable locally compact Hausdorff space X with
a finite Borel measure μ (a σ-finite measure is replaced by an equivalent
finite one; the constructions depend only on the measure class), a
standard-fibre field is a family of coordinate sets `N(x)⊆ℕ` such that each
`{x:n∈N(x)}` is Borel, with fibres `H(x)` the closed span of
`{e_n:n∈N(x)}` in `ℓ²(ℕ)`. This is the form in which SA-B85 delivers the
diagonal model of a nondegenerate separable representation of `C₀(X)`:
`N(x)` is its set of active coordinates and `m(x)=|N(x)|` its multiplicity.
Construct the direct integral `L²(X∗H,μ)` as the Bochner-measurable
`h:X→ℓ²(ℕ)` with `h(x)∈H(x)` for almost every x and `∫‖h(x)‖²dμ<∞`,
modulo null sets, a closed subspace of `L²(X,μ;ℓ²(ℕ))` (Mathlib's `Lp`) and
hence a Hilbert space, and the diagonal operators `T_φ`,
`(T_φh)(x)=φ(x)h(x)` for bounded Borel φ, the image of `L∞(X,μ)`. For two
such fields H, K over X and an operator field `T(x)∈B(ℓ²(ℕ))` whose matrix
coefficients `⟨e_i,T(x)e_j⟩` are Borel, with `T(x)H(x)⊆K(x)` and
`‖T(x)‖` essentially bounded, construct the decomposable operator
`∫⊕T(x)dμ(x)` and prove: it determines the restrictions `T(x)|_(H(x))` up to
a μ-null set (Williams, Lemma F.20, p. 417); its norm is the essential
supremum of `‖T(x)|_(H(x))‖`; composition and adjoint are fibrewise; it is
unitary onto `L²(X∗K,μ)` iff `T(x):H(x)→K(x)` is unitary for almost every
x; and the rectangular criterion: a bounded `T:L²(X∗H,μ)→L²(X∗K,μ)` is
decomposable iff `TT^H_φ=T^K_φT` for every bounded Borel φ (Williams,
Theorem F.21, p. 418, for `H=K`). Route in this model: for `i,j∈ℕ` the
compression `t_(ij)=P_iTQ_j:L²(X,μ)→L²(X,μ)`, where `Q_j` sends f to
`x↦f(x)1_(j∈N(x))e_j` and `P_i` takes the i-th coordinate, commutes with
every multiplication by a bounded Borel function, hence is multiplication
by `t_(ij)(1)`, which is essentially bounded by `‖t_(ij)‖` because
`‖t_(ij)(1)1_B‖²=‖t_(ij)(1_B)‖²≤‖t_(ij)‖²μ(B)` for every Borel B; the
functions `t_(ij)` are the matrix coefficients of the field. For equivalent
finite measures μ,ν on X construct the unitary `W:L²(X∗H,μ)→L²(X∗H,ν)`,
`(Wh)(x)=(dμ/dν)(x)^(1/2)h(x)` (Williams, Proposition F.33(d), p. 423),
prove it intertwines the diagonal operators and carries decomposable
operators to decomposable operators with the same fibres, and for `μ≪λ`
construct the zero-extended λ-field, with `N(x)=∅` where the density
vanishes, and the onto isometry obtained by multiplying by `(dμ/dλ)^(1/2)`.

Prove the reduction of a representation over a given diagonal: for a
separable C*-algebra A and a representation ρ of A on `L²(X∗H,μ)` commuting
with every diagonal operator, there is a Borel field `x↦π_x` of
representations of A on `H(x)`, unique up to a μ-null set, with
`ρ(a)=∫⊕π_x(a)dμ(x)` for every a (Williams, Proposition F.26 with its
proof, p. 419, where the diagonal is produced rather than given; route:
apply the rectangular criterion to `ρ(a)` for a in a countable dense
*-subalgebra, choose Borel representatives, discard the null set on which
linearity, multiplicativity, the star law or the norm bound fails, and
extend by continuity). Prove the transport theorem: a unitary between two
such direct integrals over standard bases that intertwines two such direct
integrals of representations and their diagonal algebras is, up to null
sets, a Borel isomorphism τ of the bases with `τ_*μ` equivalent to ν,
composed with a Borel field of unitaries `V(x):H(x)→K(τ(x))` intertwining
`π_x` with `ρ_(τ(x))` and with the measure-change unitary (Williams,
Proposition F.33, p. 423). SA-B85's diagonal model of a nondegenerate
separable representation of `C₀(X)` is a standard-fibre field in this
sense, its `L∞(X)` action is the diagonal operators, and it is the input of
the disintegration below. Borel Hilbert bundles whose fibres are abstract
separable Hilbert spaces with a fundamental sequence of sections (Williams,
Definition F.1, p. 409) are not constructed here, and the measurable
Gram–Schmidt that identifies such a bundle with a standard-fibre field
are VonNeumannAlgebras V4.0.Fields', as Scope and ownership records.

- The direct integral `L²(X∗H,μ)` and its diagonal operators; for the
  constant field `N(x)=ℕ` it is `L²(X,μ;ℓ²(ℕ))` and the decomposable
  operators are the essentially bounded Borel `B(ℓ²(ℕ))`-valued fields
  (Williams, Definition E.16 and Theorem E.17, p. 405).
- Decomposable operators: the *-algebra of essentially bounded Borel
  matrix fields with the essential-supremum norm, equal to the commutant of
  the diagonal algebra; the rectangular criterion; fibrewise unitarity.
- The measure-change unitaries, their composition along chains of equivalent
  measures, and the zero-extension isometry for `μ≪λ`.
- The reduction over a given diagonal with its uniqueness, and the transport
  theorem.

**Checks.**

- X a single point with `μ=δ`: `L²(X∗H,μ)=H(x_0)`, the diagonal operators are
  the scalars, every operator is decomposable, and the reduction over the
  diagonal returns ρ itself.
- `X=[0,1]` with Lebesgue μ and `N(x)={0}`: the diagonal operators are
  `L∞[0,1]`, which is its own commutant, so every decomposable operator is a
  multiplication operator; the Volterra operator `(Vf)(x)=∫_0^x f` does not
  commute with multiplication by x (`VM_x1=x²/2` while `M_xV1=x²`), so it is
  not decomposable.
- `X=[0,1]`, `N(x)={0}`, μ Lebesgue and `dν=2x dx`: `(Wf)(x)=(2x)^(−1/2)f(x)`
  and `∫|Wf|²dν=∫|f|²dμ`, while the map without the square root is not an
  isometry.
- `X=[0,1]` with `N(x)={0,1}` and `A=M_2(ℂ)` acting by constant matrices:
  the reduction over the diagonal gives `π_x=id` for almost every x; for a
  Borel unitary field u, `a↦` multiplication by `x↦u(x)au(x)*` is
  decomposable with `π_x=Ad u(x)`, and the transport theorem identifies the
  two fields by `V(x)=u(x)` over `τ=id`.
- A varying dimension function: `X=[0,1]`, `N(x)={0}` for `x<1/2` and
  `N(x)={0,1}` for `x≥1/2` gives `L²([0,1/2])⊕L²([1/2,1];ℂ²)`, the diagonal
  operators are still `L∞[0,1]`, and multiplication by `x↦1_(x≥1/2)E_01`
  is decomposable while the constant field `E_10` (`e_0↦e_1`) is not, since
  it does not map `H(x)=span{e_0}` into itself for `x<1/2`; the constant
  field `E_01` does, sending `e_0` to 0 there.
- Empty X or `μ=0`: the direct integral is 0, with the zero representation
  and the empty field.

*Needs:* Mathlib `Lp` with values in `ℓ²(ℕ)`, Radon–Nikodym derivatives,
Bochner integration and the Borel structure of a second-countable locally
compact Hausdorff space; SelfAdjointSpectralTheory SA-B85 (the diagonal
`C₀(X)` model used as input).

For a nondegenerate representation L of C*(G) on separable H, put X=G⁰
and let `ρ_L(h)=L̃(m(h))` for h∈C₀(G⁰), where m is the nondegenerate
unit-space multiplier map constructed above and L̃ is L's multiplier extension.
Prove ρ_L is nondegenerate: choose compactly supported unit-space cutoffs
h_i with `0≤h_i≤1`, eventually equal to 1 on each prescribed compact subset
of X. For f∈C_c(G), the compact sets r(supp f) and s(supp f) give
`m(h_i)f→f` and `f m(h_i)→f` in I-norm. The dense span L(C_c(G))H
and `‖ρ_L(h_i)‖≤1` then give strong convergence `ρ_L(h_i)→I`.
Use D5.Fields for standard-fibre direct integrals, rectangular
decomposable maps and the measure-change and zero-extension unitaries, and SelfAdjointSpectralTheory SA-B85
for the diagonal spectral representation of this nondegenerate C₀(G⁰)
representation. The unit space G⁰ is second-countable locally compact Hausdorff.

For two such representations L₁,L₂ and a bounded intertwiner T, prove
that multiplier extension makes T intertwine their unit-space representations.
Use SA-B79/B85 on the direct-sum representation and its off-diagonal corner
to transport spectral projections and full diagonal L∞ actions; for controls
μ₁,μ₂ use `λ=μ₁+μ₂` and D5.Fields' onto transport to λ-fields with zero
fibres off each density support. No equivalence of the two controls is
assumed for a bounded intertwiner. On H₁⊕H₂ the off-diagonal block
`S(ξ₁,ξ₂)=(0,Tξ₁)`, and S†, commute with the common diagonal. Form the
separable unital C*-algebra generated by `diag(ρ₁(h),ρ₂(h))`, h∈C₀(G⁰),
S,S† and I. Apply D5.Fields' reduction of a separable C*-representation
commuting with a given diagonal to this auxiliary algebra,
and its rectangular criterion to recover measurable fibre maps, with
essential norm, adjoint, composition and fibrewise-unitarity comparisons.
The full groupoid representation L is not assumed to commute
with C₀(G⁰). Identify its unit-space spectral measure class and multiplicity
with the shared direct-integral construction, and prove almost-everywhere
transport for equivalent base measures. Include H=0, zero controls/fields
and the empty unit space, where nondegeneracy forces H=0; keep the onto
zero-fibre transport in these cases. D5 proves quasi-invariance and constructs
the inter-fibre unitaries U_γ, saturated conull reduction and disintegration
below; continuous Hilbert fields alone do not supply these targets.

A measurable unitary representation consists of such a field and measurable
unitaries `U_γ:H_s(γ)→H_r(γ)` satisfying the groupoid laws on a saturated
conull reduction. Construct its integrated form by

```
(L(f)ξ)(u) = ∫ f(γ) U_γ ξ(s(γ)) D(γ)^(-1/2) dλᵘ(γ),
```

initially in matrix coefficients, with the norm bound `‖L(f)‖≤‖f‖I`.
Prove disintegration of every nondegenerate representation of `C*(G)` on a
separable Hilbert space. Establish the stronger pre-representation form:
a homomorphism on a dense invariant domain, with dense generated range,
compact-support inductive-limit continuous matrix coefficients and the
adjoint identity, extends to bounded operators with the same I-bound and
then disintegrates. Construct the base measure, fiber matrix coefficients,
saturated conull reduction and intertwining unitary; use the general
Muhly–Williams disintegration theorem's hypotheses. Derive the arbitrary
Hilbert-space representation theory by orthogonal sums of cyclic
representations, proving separability of `C*(G)` under the standing
second-countability hypothesis. Develop equivalence and intertwiner
compatibility, including change of base measure within a measure class.

For a second-countable locally compact group acting on a second-countable
locally compact Hausdorff X, take arrows `(g,x):x→gx` and the range-fiber
Haar system from left Haar measure on the group. Identify both full and
reduced groupoid algebras with the D1–D2 crossed products for
`α_g(a)(x)=a(g⁻¹x)`. On compactly supported functions the map from the
crossed-product convention to the groupoid convention is
`F↦((g,x)↦Δ(g)^(1/2) F(g)(gx))`. Prove the star, convolution and
representation identities, including the half-modular factor. Include a
group as a one-unit groupoid and the pair groupoid of X with a full-support
Radon measure μ, whose algebra is `K(L²(X,μ))`, as tests of the measure
conventions.

**Checks.**

- A second-countable group G as a one-unit groupoid: `G⁰` is a point,
  `ρ_L` is trivial, the field is the single Hilbert space H with
  `U_γ=U_g` a strongly continuous unitary representation, `D=Δ`, and the
  integrated form is `∫f(g)U_gΔ(g)^(−1/2)dμ(g)`, which is D1's
  `∫F(g)U_gdμ(g)` for `F=Δ^(−1/2)f`, consistent with the dictionary
  `F↦Δ^(1/2)F` of the previous Check.
- The pair groupoid `X×X` with a full-support μ: every nondegenerate
  representation of `C*(X×X)=K(L²(X,μ))` is a multiple of the standard one
  (CStarAlgebras C2), the unit-space measure class is that of μ, the field
  is constant with `U_(x,y)` the identity of the multiplicity space, and
  `D=1`; the integrated form of the one-dimensional field with `U=1` is the
  kernel operator `(L(f)ξ)(u)=∫f(u,v)ξ(v)dμ(v)`, while a field with
  `U_(x,y)=−1` for `x≠y` violates `U_γU_η=U_(γη)` since `(−1)(−1)≠−1`.
- The empty unit space: nondegeneracy forces H=0 and every control measure
  is zero; the zero-fibre transport is the identity of 0.
- The transformation groupoid `G⋉X` with G acting on a point: the dictionary
  `F↦((g,x)↦Δ(g)^(1/2)F(g)(gx))` reduces to `f↦Δ^(1/2)f`, and the half-modular
  factor is what makes the groupoid star agree with D1's star.

*Needs:* D5.Fields (standard-fibre direct integrals, the rectangular
criterion, the reduction over a given diagonal and the transport theorem);
SelfAdjointSpectralTheory SA-B79 and SA-B85 (the diagonal `C₀(G⁰)` model
and the transport of spectral projections); D1–D2 (integrated forms, the
group case); CStarAlgebras C1–C2 (multiplier extensions, representations of
compact operators); Mathlib standard Borel spaces and Bochner integration.

### Examples

Groups as one-unit groupoids, with `D=Δ_G`; the pair groupoid with
`C*(X×X)=K(L²(X,μ))` and `D=1`; the transformation groupoid of the
irrational rotation as the comparison with D2; `[0,1]` with constant and
with varying coordinate sets for the direct integrals.

### Dependencies

D1–D2; the topological groupoid vocabulary named in Exact supplier
contracts; SelfAdjointSpectralTheory SA-B79 and SA-B85; BanachAlgebras A7;
CStarAlgebras C1–C2; Mathlib `Lp`, `Measure.rnDeriv`, Radon measures,
standard Borel spaces and Bochner integration. Within the layer: SA-B85 →
D5.Fields → the representation and disintegration targets.

## D6. Groupoid equivalence and the étale ideal theory

A `(G,H)`-equivalence is a locally compact Hausdorff space Z with commuting
free proper left G and right H actions, open anchor maps, and anchor-induced
homeomorphisms `Z/H≃G⁰` and `G\Z≃H⁰`. Develop orbit maps, the unique arrow
carrying one point of an anchor fiber to another, the opposite equivalence,
and balanced composition. Construct the linking groupoid
`L=G⊔Z⊔Zop⊔H` with unit space `G⁰⊔H⁰`, and its Haar system from those of G
and H. Verify multiplication, inversion, topology and continuity of the
integrals, keeping the source and range of each corner explicit.

For `C_c(Z)` define left and right convolution actions, and inner products
using the orbit-pair maps and Haar integrals. For example, the right inner
product is
`⟨ξ,η⟩_H(h)=∫ conjugate(ξ(g⁻¹z)) η(g⁻¹zh) dλʳ⁽ᶻ⁾(g)`, where
`s_Z(z)=r_H(h)`; prove independence of z. Complete to an imprimitivity
`C*(G)`–`C*(H)` bimodule in the sense of D1.Modules. Prove that `C*(L)`
decomposes under the unit-space projections, full projections in its
multiplier algebra, into the corners `C*(G)`, `C*(H)` and this bimodule;
its identification with the abstract linking algebra `K_(C*(H))(X⊕C*(H))`
is HilbertModules H3's. Establish the regular corner
norm equalities and identify the reduced linking algebra with `Cr*(L)`;
obtain `Cr*(G)∼M Cr*(H)`. If `J_G=ker(C*(G)→Cr*(G))` and similarly for H,
prove that the full module carries `J_H` to `J_G` under ideal correspondence
and that its quotient by `X J_H` is the reduced module. Develop composition
of equivalences `Z₁×_HZ₂` and prove, through the pairing
`C_c(Z₁)⊙C_c(Z₂)→C_c(Z₁×_HZ₂)` and D1.Modules' stage lemma, that inducing
along the composite is unitarily equivalent to inducing along `Z₂` and then
along `Z₁`, naturally in both factors.

**Checks.**

- For groups G and H, an equivalence Z is a free transitive bitorsor, so
  `G≅H`; for `Z=G` the module is `C_c(G)` with the convolution actions and
  the theorem reads `C*(G)∼_MC*(G)` through the self-bimodule.
- The pair groupoid `X×X` and the one-point groupoid: `Z=X` with
  `(x,y)·y=x` is an equivalence, the right inner product is
  `⟨ξ,η⟩=∫conj(ξ(y))η(y)dμ(y)`, independent of the chosen z, the module
  completes to `L²(X,μ)`, and the theorem reads `K(L²(X,μ))∼_Mℂ`; the
  linking groupoid is the pair groupoid of `X⊔{∞}`, whose algebra
  `K(L²(X⊔{∞}))` has the corners `K(L²(X))`, ℂ and `L²(X)`.
- A space Z on which G acts freely and properly but with `Z/H` not
  homeomorphic to `G⁰`, for instance `Z=G×{1,2}` with H trivial, is not an
  equivalence: the anchor condition fails, and the would-be conclusion
  `C*(G)∼_Mℂ` is false for noncompact G.
- For the reduced algebras, `J_G=ker(C*(F₂)→C*_r(F₂))≠0` by D2.FreeGroups,
  and the module `C_c(F₂)` of the self-equivalence carries `J_(F₂)` to
  itself; the quotient by `XJ_H` is the reduced module `C*_r(F₂)`.

*Needs:* D5 (Haar systems, the convolution algebras, full and reduced
completions, the regular representations); D1.Modules (imprimitivity
bimodules, their completion, the stage lemma); D2 (the regular kernel);
CStarAlgebras C1 (ideals, multipliers).

For étale groupoids use the canonical counting Haar system. Develop open
bisections, their product and inverse, locally finite compact-support
decompositions, and the ample specialization using compact open bisections.
Construct the injective coefficient-function map `j:Cr*(G)→C₀(G)` extending
the identity on `C_c(G)`, with pointwise bounds by the reduced norm. Prove
that restriction to units extends to a faithful conditional expectation
`E:Cr*(G)→C₀(G⁰)`. Functions supported in open bisections normalize the
diagonal and their linear span is dense. No zero-dimensionality assumption
is needed for this normalizer statement.

Throughout the remaining D6 targets G is étale with the counting Haar
system. Define effectiveness by `interior{γ:r(γ)=s(γ)}=G⁰`, topological principality
by density of units with trivial isotropy, and strong effectiveness by
effectiveness of every closed invariant reduction. Prove equivalence of
the first two under the standing second countability. For effective G
prove the diagonal is maximal abelian and every nonzero ideal meets it
nontrivially; equivalently a *-homomorphism faithful on the diagonal is
faithful on `Cr*(G)`. Develop the diagonal's approximate unit, normalizers
and faithful expectation as the Cartan-pair structure, without requiring
general reconstruction of arbitrary Cartan pairs.

Define topological amenability by continuous systems of probability
measures m_iᵘ on the range fibers with
`‖γ_*m_iˢ⁽ᵞ⁾−m_iʳ⁽ᵞ⁾‖₁→0` uniformly on compact sets of arrows. For étale G
develop compact-support cutoffs of these means and the resulting
approximately invariant functions. Prove
`G amenable ⇔ C*(G) nuclear ⇔ Cr*(G) nuclear`; amenability also
makes the regular quotient injective. Build the positive-definite kernels
and completely positive maps used in these implications. For the converse,
use nuclear finite-matrix c.c.p. factorizations approximating cutoff
functions on a finite relatively compact bisection cover of a compact K,
and their products f* f. Form the Hilbert-module vector from the positive
matrix of images of matrix units; approximate it by compact-section
coordinates and take its pointwise length ζ. Prove `h=ζ* * ζ` is
compactly supported positive definite, bounded by 1 on units, and close
to 1 uniformly on K by the factorization's module translation estimate.
Direct these approximants by K and the error tolerance, and prove the
positive-definite-function criterion equivalent to the stated invariant
means. This is the trivial-line-bundle case of Takeishi's construction. Equality of the
full and reduced algebras alone is not used as a definition or converse.

For an invariant open U prove the full short exact sequence for the
restriction to U and its closed complement F. On reduced algebras prove
injectivity at U and surjectivity onto F. Prove middle exactness for
amenable G using amenability of the reductions and full/reduced comparison.
For amenable strongly effective G, prove the lattice isomorphism
`U↦closure(C_c(G|U))` between invariant open subsets and closed ideals.
For nonempty G⁰, prove that effective minimal G has simple reduced algebra;
for amenable G,
simplicity is equivalent to effectiveness and minimality. Mere effectiveness
does not replace strong effectiveness in the ideal-lattice theorem.

**Checks.**

- A discrete group Γ as an étale groupoid: `C₀(G⁰)=ℂ`, the expectation E is
  the canonical trace `τ(x)=⟨δ_1,xδ_1⟩` of D2.FreeGroups, and `j(x)(g)` is
  D2's Fourier coefficient `τ(xλ(g)*)`.
- The transformation groupoid of the irrational rotation `ℤ⋉𝕋`: free
  action, so effective; dense orbits, so minimal; amenable, so full and
  reduced agree; hence `C(𝕋)⋊ℤ` is simple, which matches the zero primitive
  kernels of D2.OrbitRepresentations.
- Effectiveness is needed: `ℤ/2` acting trivially on a point is minimal and
  amenable, its isotropy interior is the whole groupoid, and
  `C*_r(ℤ/2)=ℂ⊕ℂ` is not simple.
- Strong effectiveness is needed: the transformation groupoid of ℤ acting on
  `ℤ⊔{+∞}` by translation fixing `+∞` (the spectrum of D2.SequenceToeplitz's
  `C₊`) is effective, because `(n,+∞)` is a limit of the non-isotropy
  arrows `(n,k)`, but its closed invariant reduction to `{+∞}` is the group
  ℤ, which is not effective; it has exactly three invariant open sets, ∅, ℤ
  and `ℤ⊔{+∞}`, while `C₊⋊ℤ` has the closed ideals indexed by the closed
  subsets of 𝕋 of D2.SequenceToeplitz, more than three.
- Amenability is needed for nuclearity: the one-unit groupoid `F₂` has
  `C*(F₂)≠C*_r(F₂)` by D2.FreeGroups, so neither algebra is nuclear.

*Needs:* D5 (étale groupoids with counting Haar systems, full and reduced
algebras, regular representations); D2 (the expectation on discrete group
algebras, amenability); CStarAlgebras C1 (ideals, approximate units) and
C6 (nuclearity, completely positive approximations); Mathlib `IsOpen`,
`interior` and locally finite partitions of unity.

Construct the tail-equivalence groupoid of a Bratteli diagram with a single
initial vertex, finite levels and edge sets, every vertex reachable from
the initial vertex, and no sinks. Give its cylinder bisections, increasing
elementary equivalence relations R_k and inductive-limit topology:
R_k is open and is the finite disjoint union, over level-k vertices v,
of `P_v×P_v×Y_v`, where P_v is the finite discrete set of prefixes and
Y_v the compact cylinder space of tails from v. A subset is open iff its
intersection with every R_k is open. The finite-dimensional algebra stage
is the span of constant-tail prefix matrix units; density follows by
refining cylinder functions to higher levels, not by treating Y_v as finite. Prove principality, amenability, and the
identification of its algebra with the corresponding finite-dimensional
matrix inductive limit, including the incidence multiplicities. This is
the groupoid model of AF algebras; their dimension-group classification
belongs to CStarClassification. For `2≤n<∞`, construct the full-shift
groupoid of triples `(x,k−l,y)` with `shift^k x=shift^l y`.
Give the Deaconu–Renault topology with basic bisections
`Z(U,k,l,V)={(x,k−l,y):x∈U,y∈V,shift^k x=shift^l y}`, where the two
shift restrictions are homeomorphisms onto the same open set. Verify its
compatibility with cylinder prefix bisections; a subspace topology on
X×ℤ×X is not this topology. Prove étaleness,
amenability, effectiveness and minimality; identify the characteristic
functions of the prefix bisections with isometries `S_i` satisfying
`S_i* S_j=δ_ij` and `∑ S_i S_i*=1`.
D6 owns the universal unital C*-algebra O_n of these Cuntz families:
construct its universal norm/completion and generator maps. Construct the
gauge action by its universal property, the faithful circle-averaging
expectation, and its fixed core as the direct limit of matrix algebras
M_(n^k), generated by `s_μ s_ν*` with |μ|=|ν|=k. Prove gauge-invariant
uniqueness: a gauge-equivariant homomorphism injective on the core is
injective, using faithfulness of the expectation. The map to the groupoid
algebra is onto; prove injectivity on each matrix core and gauge equivariance,
then apply uniqueness. Thus establish the universal groupoid identification
and deduce simplicity and nuclearity from the groupoid theorems. Identify
the integer cocycle and its gauge action, without making classification of all groupoid KMS
states as a target.

**Checks.**

- The Bratteli diagram with one vertex and `n_k` edges at level k: the tail
  space is `Π_k{1,…,n_k}`, the elementary relations `R_k` have `P_v` of size
  `n_1⋯n_k`, and the algebra is the UHF algebra `M_(n_1)⊗M_(n_2)⊗⋯`; a
  diagram with one edge at every level gives a point and the algebra ℂ.
- The full shift on one symbol, n=1: the space is a point, the groupoid is
  the group ℤ of the integer cocycle, and `C*(ℤ)=C(𝕋)` is neither simple nor
  the algebra of a minimal effective groupoid; this is why `2≤n` is assumed.
- For n=2 the prefix bisections `Z(X,1,0,X)` restricted to the cylinders
  `[i]` give isometries `S_0`, `S_1` with `S_i*S_j=δ_(ij)` and
  `S_0S_0*+S_1S_1*=1`, since `[0]⊔[1]=X`; the gauge action is
  `z·S_i=zS_i`, and the core at level k is spanned by `s_μs_ν*` with
  `|μ|=|ν|=k`, of dimension `4^k=(2^k)²`.
- A topology on `X×ℤ×X` finer or coarser than the Deaconu–Renault one: the
  subspace topology makes the bisection `Z(U,1,0,V)` fail to be open in the
  groupoid when `shift` is not injective on U, so étaleness fails.

*Needs:* D5 (étale groupoids, their algebras); CStarAlgebras C5 (inductive
limits) and C1 (universal C*-algebras from generators and relations); the
D6 ideal theory above (simplicity and nuclearity from amenability,
effectiveness and minimality).

**Concrete Cuntz families on separable Hilbert space.** For every complete
infinite-dimensional separable complex Hilbert space H and every integer
n≥1, construct n closed mutually orthogonal infinite-dimensional subspaces
H_j and linear isometries S_j:H→H with range H_j. Obtain a Hilbert basis
b indexed by ℕ using native `HilbertBasis`, the countability of an
orthonormal family in a separable metric space, and the exclusion of a
finite basis by infinite dimension. Use the quotient/remainder equivalence
`Nat.divModEquiv n` to partition the basis and prescribe
`S_j(b_k)=b_(nk+j)`, j∈Fin n. Extend this rule through `HilbertBasis.repr`
and the native orthogonal-family/Hilbert-sum construction. Prove
`S_j*(b_k)=b_(k/n)` when k mod n=j and zero otherwise, then
`S_i* S_j=δ_ij Id` and `∑_j S_j S_j*=Id` as continuous-linear-map
identities. Identify H_j with the closed span of its residue-class basis,
prove S_j S_j* is its orthogonal projection, and construct the resulting
unitary identification of H with the finite Hilbert sum of the H_j.
Include n=1 with H₀=H and S₀=Id. For n≥2 use D6's existing universal
property to construct the unital representation O_n→B(H) carrying its
specified generators to these S_j; compare the generator equations and
pullback under a change of Hilbert basis by its actual unitary map. This
realizes the universal algebra on the given H (`exists_residue_family`;
the relations are Cuntz's defining relations for O_n, Cuntz, §1).

**Checks.**

- n=1: `S_0=Id`, and both relations are `Id=Id`.
- n=2: `S_0b_k=b_(2k)`, `S_1b_k=b_(2k+1)`; `S_0*b_3=0` since `3 mod 2≠0`,
  `S_1*b_3=b_1`, and `(S_0S_0*+S_1S_1*)b_3=S_1b_1=b_3`.
- The shift family `S_jb_k=b_(k+j)` fails: `S_0=Id` and
  `S_1*S_0=S_1*≠0`, so the orthogonality `S_i*S_j=δ_ij` singles out the
  residue-class rule.
- For a unitary W with `Wb_k=b'_k`, the family `WS_jW*` is the residue
  family of the basis b'; two bases give unitarily equivalent families.
- On a finite-dimensional H≠0 no family with `S_i*S_j=δ_ij` and n≥2 exists,
  since the ranges would be n orthogonal copies of H; on a nonseparable H
  there is no ℕ-indexed Hilbert basis, and the target's hypothesis is
  separability.

*Needs:* D6 (universal O_n and its gauge-invariant uniqueness); Mathlib
`HilbertBasis`, `HilbertBasis.repr`, `exists_hilbertBasis`,
`Nat.divModEquiv`, `ContinuousLinearMap.adjoint`.

### Examples

Groups as self-equivalences; the pair groupoid against the point; the
irrational rotation, `ℤ/2` on a point and ℤ on `ℤ⊔{+∞}` as the three
hypotheses of the simplicity and ideal-lattice theorems; UHF algebras from
Bratteli diagrams; the full shift and `O_n` with the residue-class family
on a separable Hilbert space.

### Dependencies

D5 and D5.Fields; D1.Modules; D2; CStarAlgebras C1, C2, C5 and C6; Mathlib
`HilbertBasis`, `Nat.divModEquiv`, `ContinuousLinearMap.adjoint` and
point-set topology.

## D7. Analytic dynamics, KMS states, and the KMS simplex

For a point-norm continuous real action τ build its densely defined closed
*-derivation δ as the strong generator. Develop its domain as a *-algebra,
the Leibniz and star identities, invariant cores, resolvents, and bounded
self-adjoint perturbations `δ+i[P,·]`. Use the one-parameter group API and
construct the perturbing unitary cocycles by norm-convergent iterated
integrals. Define entire analytic elements by actual entire A-valued
extensions of their orbits. Gaussian smearing gives a dense invariant
*-subalgebra; prove uniqueness of continuation, multiplication, star,
time-shift and strip bounds, with the star relation
`τ_z(a)*=τ_(conjugate z)(a*)`.

For β>0 define a β-KMS state ω by bounded continuous functions on
`0≤Im z≤β`, holomorphic in the interior, with boundary values
`F_ab(t)=ω(a τ_t(b))` and `F_ab(t+iβ)=ω(τ_t(b)a)` (`IsKMS`). Prove the
equivalent analytic identity `ω(a τ_(iβ)(b))=ω(ba)` (`kms_entire_identity`,
for an entire A-valued extension of the orbit of b: the strip function of
(a,b) and `z↦ω(aτ_z(b))` agree on ℝ and hence on the strip by reflection
across the real axis), the norm bound
`|F_ab(z)|≤‖a‖‖b‖`, and the sufficiency of checking on a norm-dense invariant
algebra of entire elements. Treat β<0 on the reversed strip, and β=0 as
the full space of tracial states. Prove invariance for β≠0
(`kms_invariant`); it is not a consequence of the β=0 trace condition. Develop pullback under equivariant
quotients, tensor products of KMS states, restrictions to invariant
subalgebras when the restriction has norm one, and stability under weak-*
limits that are states, for a fixed dynamics.
For the rotation action on `C(S¹)`, evaluation states are traces but need
not be invariant; use this example to distinguish the β=0 convention.

**Checks.**

- For `A=M_n(ℂ)`, `τ_t=Ad exp(itK)` and the Gibbs state
  `ω(x)=Tr(exp(−βK)x)/Tr(exp(−βK))`: `τ_(iβ)(b)=exp(−βK)b exp(βK)` and
  `ω(aτ_(iβ)(b))=Tr(exp(−βK)a exp(−βK)b exp(βK))/Z=Tr(exp(−βK)ba)/Z=ω(ba)`.
  For `K=diag(0,1)`, `a=E_12`, `b=E_21`: `τ_(iβ)(b)=exp(−β)b`, so
  `ω(aτ_(iβ)(b))=exp(−β)/(1+exp(−β))=ω(E_22)=ω(ba)`, while the opposite
  sign `τ_(−iβ)(b)=exp(β)b` gives `exp(β)/(1+exp(−β))≠ω(ba)`.
- β=0: the degenerate strip reduces the condition to `ω(ab)=ω(ba)`, and
  the evaluation states of the rotation on `C(S¹)` satisfy it without
  being invariant.
- For the trivial dynamics a bounded strip function with constant boundary
  values `ω(ab)` on ℝ and `ω(ba)` on `ℝ+iβ` is constant by reflection
  across ℝ, so only traces are KMS for the trivial dynamics.

*Needs:* OneParameterSemigroups (strongly continuous groups, generators,
analytic vectors); CStarAlgebras C2 (states); Mathlib `DifferentiableOn`,
`Bornology.IsBounded`, `PositiveLinearMap`.

For β≠0 construct, from invariance (`kms_invariant`), the GNS implementing
unitary group `U_tπ_ω(a)Ω_ω=π_ω(τ_t(a))Ω_ω`, prove it is strongly continuous
from the point-norm continuity of τ, and extend τ to the double commutant
`M=π_ω(A)''` (Mathlib's `VonNeumannAlgebra`) by `τ̄_t=Ad U_t`, a group of
*-automorphisms of M whose orbits `t↦τ̄_t(x)` are continuous for the weak
operator topology (`ContinuousLinearMapWOT`). Prove that the vector state
`ω̄=⟨Ω_ω,·Ω_ω⟩` on M is τ̄-invariant and satisfies the strip condition of
this section for τ̄ on the *-algebra `π_ω(A)`. The identification of τ̄
with the modular group of ω̄ on M, `σ^ω̄_t=τ̄_(−βt)`, its converse for a
faithful normal state, the separating property of Ω_ω, and the support
qualification for a normal state on a given von Neumann algebra are
VonNeumannAlgebras V10's.

For unital A prove that Kβ is convex and weak-* compact, and, when nonempty,
a Choquet simplex, defined here by unique maximal representing probability
measure for every point in the convex order. Its extreme states are exactly its factor states;
distinct extreme KMS states have disjoint GNS representations. Build the
barycenter, convex order on representing probability measures, maximal
measures, and central decomposition used here. Build Tomita's orthogonal
state-measure decomposition. For a representing measure define the
positive functionals obtained by integration on Borel sets. For a
decomposition ω=ω₁+ω₂, orthogonality means the canonical GNS isometry
`H_ω→H_(ω₁)⊕H_(ω₂)` is onto; prove its equivalent projection criterion
in the commutant. Require this for the functionals of a Borel set and
its complement. Use SelfAdjointSpectralTheory SA-B14's projection-valued-measure
carrier. Own the measure obtained from these orthogonal decompositions and prove
its range lies in the GNS commutant; consume SA-B44's integration to construct
its L∞ representation, proving descent through the representing measure's
a.e. classes via SA-B50 and `P(B)=0↔μ(B)=0`, using the cyclic GNS
vector's separating property for the commutant. For compact-space commutative
representations consume SA-B59 and SA-B67's supported, possibly degenerate
version. For separable A construct the measurable
fields of cyclic representations and the corresponding direct-integral
GNS identification. Prove the correspondence between orthogonal decompositions and
abelian subalgebras of the commutant, and identify the central measure from
the GNS center with the maximal KMS representing measure (D5.Fields for
the measurable fields and the direct integral). In general prove
the unique maximal representing-measure theorem; for separable A prove the metrizable
version with the unique measure supported on the extreme boundary. Supply
the measurable decomposition and its comparison with the GNS center, not
an unspecified appeal to a simplex predicate.

Define ground states and prove equivalence of: τ-invariance with
nonnegative GNS generator; bounded analytic continuation of correlations
to the upper half-plane; and `−i ω(a*δ(a))≥0` on the generator domain.
Prove that weak-* limits of β-KMS states as β→+∞ are ground states whenever
the limit is a state; unitality guarantees this norm-one condition.
For a self-adjoint matrix Hamiltonian K and `τ_t=Ad exp(itK)`, prove the
unique β-KMS state is `Tr(exp(−βK)·)/Tr(exp(−βK))`, including β=0, and
prove its zero-temperature limit is `Tr(P₀·)/Tr(P₀)`, where P₀ is
the projection onto the lowest eigenspace.

For a bounded self-adjoint `P∈A` and the perturbed dynamics `τ^P` with
generator `δ−i[P,·]`, constructed above through its unitary cocycle, fix the
sign of perturbation theory in finite dimensions: for `A=M_n(ℂ)` and
`τ_t=Ad exp(itK)`, the β-KMS state of `τ^P` is the Gibbs state of `K−P`,
with density proportional to `exp(−βK+βP)`, so the perturbation `Q=βP` of
the state corresponds to subtracting the energy P. Araki's bounded
perturbations `Ω^Q=exp((log Δ_ω+Q)/2)Ω` of faithful normal states, their
normalization, cocycle formula, inverse law and modular characterization,
which reproduce this sign, are VonNeumannAlgebras V10's.

**Checks.**

- Faithfulness on M against faithfulness on A: for `A=ℂ⊕ℂ` with the trivial
  dynamics and `ω=(1,0)`, ω is not faithful on A, `M=π_ω(A)''=ℂ`, and ω̄ is
  faithful on M.
- The implementing group of the Gibbs state of `M_n(ℂ)`: on the GNS space
  `M_n(ℂ)` with `⟨a,b⟩=Tr(ρa*b)`, `ρ=exp(−βK)/Z`, `U_ta=exp(itK)a exp(−itK)`
  satisfies `U_tπ_ω(a)Ω=τ_t(a)=π_ω(τ_t(a))Ω` for `Ω=1`, and `U_t` is unitary
  because `ρ` commutes with `exp(itK)`.
- The sign of perturbations: `K=diag(0,1)`, `P=diag(0,1)` make `τ^P` the
  trivial dynamics, whose β-KMS state is the trace `(½,½)`, the Gibbs state
  of `K−P=0`; the opposite sign, the Gibbs state of `K+P=diag(0,2)` with
  weights proportional to `(1,exp(−2β))`, is not a trace.

*Needs:* D7's KMS condition and analytic elements above; OneParameterSemigroups
(strongly continuous groups, generators); SelfAdjointSpectralTheory SA-B14,
SA-B44, SA-B50, SA-B59, SA-B67 and SA-B79 (the PVM carrier, integration,
null sets, commutative representations); D5.Fields (measurable fields and
direct integrals for separable A); CStarAlgebras C2 (states, factor states,
disjointness); Mathlib `PositiveLinearMap.GNS`, `VonNeumannAlgebra`,
`VonNeumannAlgebra.commutant` and `ContinuousLinearMapWOT`.

### Examples

`M_n(ℂ)` with `Ad exp(itK)` and its Gibbs state, which pins the sign of
`τ_(iβ)` and of bounded perturbations; the rotation on `C(S¹)` for the
`β=0` convention; `ℂ⊕ℂ` for faithfulness on M against faithfulness on A.

### Dependencies

OneParameterSemigroups; SelfAdjointSpectralTheory Part B as listed; D5.Fields;
CStarAlgebras C2; Mathlib `DifferentiableOn`, `Bornology.IsBounded`,
`PositiveLinearMap`, `PositiveLinearMap.GNS`, `VonNeumannAlgebra` and
`ContinuousLinearMapWOT`. The modular characterization on M is
VonNeumannAlgebras V10's, as Scope and ownership records, and is consumed
by nothing here.

## D8. CAR, Weyl algebras, and free equilibrium states

For a complex Hilbert space h construct CAR(h), generated by an antilinear
map a with `{a(f),a(g)}=0` and `{a(f),a(g)*}=⟨f,g⟩1`. Prove the universal
property, `‖a(f)‖=‖f‖`, functoriality for isometric inclusions, gauge action,
simplicity, and the finite-dimensional identification `CAR(ℂⁿ)≃M_(2ⁿ)(ℂ)`.
Construct the antisymmetric Hilbert Fock space and its creation and
annihilation operators, vacuum state and faithful CAR representation.
Reuse finite-dimensional exterior/Clifford algebra from
RepresentationTheory/SpinRepresentations;
build the Hilbert completion and norm estimates here. Show that finite
subspace inclusions give the CAR inductive limit, including separable
infinite-dimensional h and its matrix stages.

For a complex pre-Hilbert space h, prove that the norm identity extends its antilinear generators uniquely to the Hilbert completion and induces the canonical generator-preserving isomorphism `CAR(h)≃CAR(completion h)`. State represented-family uniqueness for nonzero unital CAR families: universality and simplicity make the map onto the generated C*-algebra an isomorphism. Preserve the source's omitted zero-representation exception. For h=0 the universal unital algebra is ℂ; distinguish this from the nonunital closed algebra generated by only zero operators. Prove `CAR(h)` is separable iff h is separable, using the generator isometry in one direction and countably many star polynomials on dense generators in the other.

For bounded complex-linear U and bounded antilinear V on the complete complex Hilbert carrier h (using its completion in the pre-Hilbert comparison), define the antilinear adjoint by `⟨V* x,y⟩=⟨V y,x⟩` in the second-linear convention. Prove that
`V*U+U*V=0=UV*+VU*` and `U*U+V*V=1=UU*+VV*`
are the components of the real-orthogonality identities for `T=U+V`. Under these four relations construct the unique CAR automorphism `γ(a(f))=a(Uf)+a(Vf)*`, with inverse obtained from the real adjoint `T*=U*+V*`. Pin the CAR calculation by `⟨Uf,Ug⟩+⟨Vg,Vf⟩=⟨f,g⟩` and `⟨Uf,Vg⟩+⟨Ug,Vf⟩=0`. The Majorana generators `c(f)=a(f)+a(f)*` give the equivalent real-orthogonal construction `c(f)↦c(Tf)`. QuantumFoundations 6.3–6.4 builds the Fock implementation `Γ(U)` of a one-particle unitary U on D8's Fock carriers, which realizes the case `V=0` of this automorphism, and owns the Fock/domain comparison of the field operators; any criterion for unitary implementation of a general `(U,V)` is a separate target.

Construct gauge-invariant quasi-free CAR states for every positive
contraction S on h. Define them by vanishing of monomials with unequal
creation and annihilation counts, two-point function
`ω_S(a(f)*a(g))=⟨g,Sf⟩`, and the determinant Wick formula
`ω_S(a(f₁)*⋯a(fₙ)* a(gₙ)⋯a(g₁))=det[⟨gᵢ,Sfⱼ⟩]_(i,j)`.
Prove positivity, norm one, uniqueness,
restriction to subspaces and continuity in the covariance. For a
self-adjoint one-particle Hamiltonian h₀, prove that
`τ_t(a(f))=a(exp(it h₀)f)` is a point-norm continuous action and that its
unique β-KMS state is the gauge-invariant quasi-free state with
`S=(1+exp(βh₀))⁻¹`, interpreting this as bounded Borel functional calculus.
Include negative β, β=0, finite modes, and the occupation-number formula;
derive the KMS identity on analytic vectors and extend by continuity.

For a real vector space V with an alternating bilinear form σ, construct the universal unital Weyl
C*-algebra with `W(0)=1`,
`W(f)W(g)=exp(−iσ(f,g)/2)W(f+g)` and `W(f)*=W(−f)`.
Prove `W(f)*W(f)=W(f)W(f)*=1`, so each generator is unitary.
Develop symplectic functoriality, linear independence of the Weyl
generators, the canonical trace, and the nondegenerate form's simplicity.
Distinguish the algebraic symplectic data from continuity: a representation
is regular if `t↦π(W(tf))` is strongly continuous for each f. Fix the generator sign by `π(W(tf))=exp(itΦ(f))`. Construct each field operator Φ(f) of a regular representation as the self-adjoint generator given by Stone's theorem.
Domains are taken one finite-dimensional real subspace F⊆V at a time. Regularity and the Weyl product law make `f↦π(W(f))` jointly strongly continuous on F, since in a basis it is a continuous phase times a product of strongly continuous unitary families. With Lebesgue measure on F from any basis, let `D_F` be the span of the vectors
`π_φξ=∫_F φ(f)π(W(f))ξ df` for `φ∈C_c^∞(F)` and ξ in the representation space.
Prove that `D_F` is dense, by an approximate identity in `C_c^∞(F)`, and that for `g∈F` it lies in the domain of Φ(g) with
`iΦ(g)π_φξ=π_ψξ`, `ψ(f)=−(∂_gφ)(f)−(i/2)σ(g,f)φ(f)`,
so `D_F` is invariant under every Φ(g), g∈F. It is also invariant under each `π(W(tg))`, which sends `π_φξ` to `π_χξ` with `χ(f)=φ(f−tg)exp(−iσ(tg,f)/2)`. Prove that a dense subspace of the domain of a unitary group's generator that is invariant under the group is a core: if η is orthogonal to `(Φ(g)±i)D_F`, then for each ζ∈D_F the bounded function `u(t)=⟨η,π(W(tg))ζ⟩` satisfies `u′=u` for the sign + and `u′=−u` for the sign −, so u=0 and η⊥D_F, hence η=0; the closure of the restriction of Φ(g) to D_F is then self-adjoint by SelfAdjointSpectralTheory SA-A21 and equals Φ(g). Hence `D_F` is a common core for all Φ(g), g∈F. On `D_F` prove real linearity `Φ(sf+tg)=sΦ(f)+tΦ(g)` and the commutator relation `[Φ(f),Φ(g)]=iσ(f,g)` for f,g∈F, by differentiating `π(W(sf))π(W(tg))π(W(sf))*=exp(−istσ(f,g))π(W(tg))` at s=t=0. Check: for `V=ℝ²` with `σ(e₁,e₂)=1`, the Schrödinger representation on `L²(ℝ)` with Φ(e₁) multiplication by x and `Φ(e₂)=−i d/dx` satisfies `π(W(se₁))π(W(te₂))=exp(−ist/2)π(W(se₁+te₂))` and `[Φ(e₁),Φ(e₂)]=i`, matching both displayed signs. No domain common to all f∈V is asserted: for `V=L⁰([0,1],ℝ)`, σ=0 and W(f) multiplication by `exp(if)` on `L²([0,1])`, the representation is regular, but for every nonzero ξ some measurable f has `fξ∉L²`, so the intersection of the domains of all Φ(f) is {0}.
For every alternating real bilinear form σ, including degenerate forms, prove
`σ(W(f))=𝕋` whenever `f≠0`, and consequently `‖W(f)−z·1‖=2` for every
`z∈𝕋`. Construct the twisted regular Weyl family on `ℓ²(V,ℂ)` by
`U_f δ_v=exp(−iσ(f,v)/2)δ_(f+v)`. Verify unitarity and the Weyl product
and star laws, giving a representation of the universal algebra. For
`f≠0`, each coset `v+ℤf` is invariant under U_f, and alternatingness makes
its phase constant: `σ(f,v+mf)=σ(f,v)`. Identify this restriction with a
constant-phase bilateral shift on `ℓ²(ℤ,ℂ)`. Prove that shift's spectrum
is 𝕋 using normalized finite-support geometric vectors as approximate
eigenvectors. Thus the represented spectrum contains 𝕋; spectrum inclusion
under the unital representation and unitarity of W(f) give the universal
spectrum equality. Continuous functional calculus gives the displayed
norm, including `‖W(f)−1‖=2`. No nondegeneracy or regularity of the twisted
regular representation is required for this universal-algebra argument;
the simplicity theorem above retains its nondegeneracy hypothesis.

Use the Weyl product law and multiplication by unitaries to deduce
`‖W(f)−W(g)‖=2` whenever `f≠g`, with the scalar Weyl phase included.
If `V≠0`, choose `f₀≠0`; the family `W(tf₀)`, `t∈ℝ`, is uncountable
and uniformly separated. Prove that the universal Weyl algebra is
nonseparable even for finite-dimensional nonzero V and for degenerate σ.
Keep the zero-space algebra ℂ separate. A nontrivial continuous one-particle
flow therefore need not give a point-norm continuous Weyl-algebra action.

For `V=h_ℝ`, `σ(f,g)=Im⟨f,g⟩`, construct the symmetric Hilbert Fock
representation, field operators and vacuum characteristic function
`ω₀(W(f))=exp(−‖f‖²/4)`. For real symmetric covariance forms q require
`q(f,f)≥0` and `|σ(f,g)|²≤q(f,f)q(g,g)` for all f,g, and construct the
quasi-free state with characteristic function `exp(−q(f,f)/4)`.
Prove positivity, uniqueness from the characteristic function, regularity
and Wick's formula. In the gauge-invariant case develop the complex
sesquilinear covariance description; a bounded covariance is represented
by a bounded positive operator C≥I, with `q(f,g)=Re⟨f,Cg⟩`.
For a positive self-adjoint h₀
with `h₀≥εI`, ε>0, and β>0, construct the thermal covariance
`Cβ=coth(βh₀/2)=I+2(exp(βh₀)−I)⁻¹` and state
`ωβ(W(f))=exp(−⟨f,Cβf⟩/4)`.
Prove the strip KMS identities on Weyl correlations. For an invariant
regular state ω construct the GNS implementing unitary group
`U_tπ_ω(W(f))Ω_ω=π_ω(W(exp(ith₀)f))Ω_ω`, prove its strong continuity from
regularity and the continuity of the characteristic function along the
flow, and extend the dynamics to `M=π_ω(W)''` by `τ̄_t=Ad U_t`, with orbits
continuous for the weak operator topology. In this Weyl setting define
β-KMS to mean that the vector state of Ω_ω on M satisfies the strip
condition of D7 for the flow τ̄ on M; prove its Weyl-correlation
characterization. The modular characterization of this condition on M is
VonNeumannAlgebras V10's. Prove uniqueness
among gauge-invariant quasi-free β-KMS states with bounded covariance:
write its occupation covariance as a bounded T=(C−I)/2 and derive
`⟨(exp(βh₀)−1)g,Tf⟩=⟨g,f⟩` for analytic spectral-cutoff vectors g.
Justify differentiating the Weyl KMS correlations to two-point functions,
including cutoff/domain bounds. Spectral cutoffs and the bounded inverse
then force `T=(exp(βh₀)−1)⁻¹` on all vectors. Do not assume the difference
of two positive covariances is positive. A bounded one-argument-invariant
positive form vanishes under the gap, as a consequence of the same spectral
argument; jointly invariant forms do not satisfy that criterion.
The spectral gap makes the thermal bounded covariance formulae defined
for every f∈h. Gapless Bose condensation and interacting
continuum fields are outside this development. Do not apply the
point-norm C*-system theorem to this Weyl flow without its continuity
hypothesis.

**Checks.**

- `CAR(ℂ)=M_2(ℂ)` with `a=E_12`: `a²=0` and `a*a+aa*=E_22+E_11=1`, so
  `‖a‖=1=‖f‖`; the Jordan–Wigner generators `a(e_1)=E_12⊗1` and
  `a(e_2)=σ_3⊗E_12` on `M_2⊗M_2`, `σ_3=diag(1,−1)`, anticommute because
  `E_12σ_3=−E_12` and `σ_3E_12=E_12`, while `E_12⊗1` and `1⊗E_12` commute
  and do not satisfy the relations.
- Antilinearity of a is forced by the relation: `{a(if),a(f)*}=⟨if,f⟩=−i‖f‖²`
  agrees with `a(if)=−ia(f)`, while a linear a would give `i‖f‖²`.
- Quasi-free states on `CAR(ℂ)` with `S=s`: `ω_s(a*a)=s` and
  `ω_s(aa*)=1−s`, the density `diag(1−s,s)`, a state exactly when
  `0≤s≤1`; `S=0` is the Fock vacuum and `S=1` the filled state, with
  `ω_1(a(f)a(g)*)=⟨f,g⟩−⟨f,g⟩=0`.
- The KMS sign: for `h₀=ε` on ℂ, `τ_t(a)=a(e^(itε)f)=e^(−itε)a(f)`, which is
  `Ad exp(itK)` for `K=diag(0,ε)` on `M_2`; the Gibbs state of D7 gives
  `ω(a*a)=ω(E_22)=1/(e^(βε)+1)=(1+e^(βε))⁻¹`, the stated `S`; the convention
  `τ_t(a(f))=a(e^(−ith₀)f)` would give `(1+e^(−βε))⁻¹`, an occupation above
  one half for `ε>0`.
- The Weyl signs: for `V=ℝ²` with `σ(e_1,e_2)=1`, the Schrödinger pair
  `W(se_1)=e^(isx)` and `(W(te_2)ψ)(x)=ψ(x+t)` satisfies
  `W(se_1)W(te_2)=e^(−ist)W(te_2)W(se_1)`, the consequence
  `W(f)W(g)=e^(−iσ(f,g))W(g)W(f)` of the displayed product law.
- The vacuum characteristic function is positive definite: for `f_1=0`,
  `f_2=f` the Gram matrix `(ω₀(W(f_i)*W(f_j)))` is
  `[[1,e^(−‖f‖²/4)],[e^(−‖f‖²/4),1]]` with determinant `1−e^(−‖f‖²/2)>0`,
  whereas `exp(+‖f‖²/4)` would give a negative determinant.
- Thermal covariance for `h₀=ε>0`: `coth(βε/2)=1+2/(e^(βε)−1)`, the
  occupation `T=(e^(βε)−1)⁻¹`, with `C_β→1` (the vacuum) as `β→∞` and
  `C_β→∞` as `β→0`.
- `σ=0` on `V=ℝ`: the Weyl algebra is `C*(ℝ_d)` of the discrete real line,
  with `‖W(s)−W(t)‖=2` for `s≠t`, nonseparable although V is
  one-dimensional.

*Needs:* D7 (the KMS condition, analytic elements, GNS implementation);
CStarAlgebras C2 (states), C5 (inductive limits, tensor products);
RepresentationTheory/SpinRepresentations (finite-dimensional Clifford and
exterior algebras); OneParameterSemigroups and SelfAdjointSpectralTheory
SA-A21 (Stone's theorem, cores); Mathlib `VonNeumannAlgebra`,
`ContinuousLinearMapWOT`, `PositiveLinearMap.GNS` and the matrix
exponential `NormedSpace.exp`; the hyperbolic cotangent is written out as
`(exp x+1)/(exp x−1)`.

### Examples

`CAR(ℂ)=M_2(ℂ)` and the Jordan–Wigner generators; Fermi–Dirac and
Bose–Einstein occupations for a one-mode Hamiltonian; the Schrödinger
representation of the Weyl relations on `L²(ℝ)`; `C*(ℝ_d)` as the
degenerate Weyl algebra.

### Dependencies

D7; CStarAlgebras C2 and C5; RepresentationTheory/SpinRepresentations;
OneParameterSemigroups; SelfAdjointSpectralTheory SA-A21; Mathlib
`VonNeumannAlgebra`, `ContinuousLinearMapWOT`, `PositiveLinearMap.GNS`
and the matrix exponential `NormedSpace.exp`.

## D9. Quantum spin systems and the thermodynamic limit

For a countable site set L and a fixed integer d≥1, construct local matrix
algebras `A_Λ=⊗_(x∈Λ) M_d(ℂ)` and their unital inclusions for finite Λ.
Construct the quasi-local C*-inductive limit, density of local observables,
commutation of disjoint regions, tensor decomposition into a finite region
and its complement, product states and normalized partial-trace
expectations. For `L=ℤ^ν`, ν≥1, construct translations and prove their
asymptotic abelianness. For d=1 prove the scalar specialization has a
unique state, which is β-KMS for every β.

An interaction Φ assigns self-adjoint `Φ(X)∈A_X` to nonempty finite subsets
X of L. Define `H_Φ(Λ)=∑_(X⊆Λ) Φ(X)`, the local inner dynamics, and the
interaction norm

```
Mλ(Φ) = ∑_(n≥0) exp(λn) sup_(x∈L)
          ∑_(X∋x, |X|=n+1) ‖Φ(X)‖ .
```

For some λ>0 assume `Mλ(Φ)<∞`. Prove absolute convergence of the local
derivation `δ(A)=i∑_(X∩Λ≠∅)[Φ(X),A]`, independence of a local support Λ
for A, closability, and that the local algebra is a core for its closure.
Construct the point-norm continuous infinite-volume action; prove that
`Ad exp(itH_Φ(Λ))` converges on each observable uniformly on compact time
intervals as Λ increases to L. Develop comparison estimates under a change
of interaction, restriction, and addition of a bounded local perturbation.
Include finite-range interactions on lattices and on-site product models.

Construct the finite-volume Gibbs states and their extensions using the
normalized trace on the complement. Prove existence of weak-* cluster
points and that every such thermodynamic limit is a β-KMS state. Define
the norm-convergent surface energy
`W_Φ(Λ)=∑_(X∩Λ≠∅, X∩Λᶜ≠∅) Φ(X)` and prove convergence from the interaction
bound. The Gibbs condition is: Ωω is separating in its GNS von Neumann
algebra and, for every finite Λ, the normalized perturbation by
`Q=β πω(W_Φ(Λ))` from D7 factors as
`ω^Q=ω_(Λ,β)⊗ω̃_(Λᶜ)` for a state on the complement. Prove this condition
equivalent to β-KMS. More generally retain the precise sufficient
hypotheses of Bratteli–Robinson Theorem 6.2.18: convergence of the local
dynamics, existence of every surface energy, and the local algebra being
a generator core. The perturbation removes the boundary interaction; its
sign is fixed by D7.

For translation-invariant interactions on `ℤ^ν` build the thermodynamic
variational principle. Define the interaction Banach norm
`‖Φ‖B=∑_(X∋0) ‖Φ(X)‖/|X|`, assume it finite, and use finite boxes or van
Hove nets. Fix for each a∈ℕ_(>0)^ν the partition of ℤ^ν by translates
of the rectangular tile Λ_a. Let n⁻_Λ(a) count tiles contained in Λ and
n⁺_Λ(a) tiles meeting Λ. A net of nonempty finite regions is van Hove
when its volumes tend to infinity and n⁻_Λ(a)/n⁺_Λ(a)→1 for every a.
Prove translation and boundary-neighborhood formulations and their
compatibility with boxes and tile estimates. Construct mean energy
`e_Φ(ω)=∑_(X∋0) ω(Φ(X))/|X|`, mean entropy
`s(ω)=lim |Λ|⁻¹ S(ω|A_Λ)`, and pressure
`p(βΦ)=lim |Λ|⁻¹ log Tr(exp(−βH_Φ(Λ)))`.
Develop finite-matrix entropy and relative entropy
`D(ρ||σ)=Tr(ρ(logρ−logσ))`, with infinity when the support condition
fails, and `0 log0=0` in entropy. Prove positivity for trace-one ρ,σ,
ordinary subadditivity, and the relative-entropy calculus for an arbitrary
positive reference σ used in the monotonicity argument.
Prove strong subadditivity `S(ABC)+S(B)≤S(AB)+S(BC)`. For a concrete route,
build the compression inequality for −log from its resolvent integral and
positive block-matrix Schur complements. On Hilbert–Schmidt matrices form
the positive relative modular operator `L_σ R_(ρ⁻¹)` for invertible ρ,σ.
Construct the partial-trace isometry
`V(x ρ_A^(1/2))=(x⊗1)ρ_AB^(1/2)`, verify its modular compression
identity, and apply the −log inequality to obtain relative-entropy
monotonicity under partial trace. Extend by ε-regularization to the support
cases, then apply monotonicity to ρ_ABC and `1_A⊗ρ_BC` to prove the
stated entropy inequality. Give entropy concavity and the mixture bounds
used to prove affinity of the mean. Supply boundary estimates and all
limit arguments, including strong-subadditivity transfer of successive
entropy increments in lexicographic tile order. Prove independence of the admissible exhaustion,
affinity and upper semicontinuity of mean entropy on translation-invariant
states, convexity and Lipschitz continuity of pressure, and

```
p(βΦ) = sup_(ω translation-invariant state) (s(ω) − β e_Φ(ω)).
```

For the stronger assumption `∑_(X∋0) ‖Φ(X)‖exp(λ|X|)<∞` for some λ>0,
prove equivalence, for translation-invariant states, of maximizing this
functional, the Gibbs condition and β-KMS. The pressure existence theorem
and the equilibrium equivalence have distinct interaction hypotheses.

Finally prove a quantitative high-temperature uniqueness theorem. Set

```
Mλ,d(Φ) = ∑_(n≥0) exp(λn) d^(2n) sup_(x∈L)
            ∑_(X∋x, |X|=n+1) ‖Φ(X)‖ .
```

For d≥2, if this is finite, prove uniqueness of the β-KMS state whenever
`|β|Mλ,d(Φ) < (λ/2)/(1+exp(λ)d³/(d−1))`, by the perturbation/contraction
argument of Bratteli–Robinson Proposition 6.2.45. This is a sufficient
region, not an assertion of a sharp critical temperature. Work out the
interaction norms and resulting bound for finite-range nearest-neighbor
spin interactions, as well as exact Gibbs and thermodynamic formulae for
the on-site model.

**Checks.**

- The nearest-neighbour Ising interaction on ℤ, `Φ({x})=hσ_3` and
  `Φ({x,x+1})=Jσ_3⊗σ_3`: every x lies in one singleton and two edges, so
  `Mλ(Φ)=|h|+2|J|e^λ` and `Mλ,2(Φ)=|h|+8|J|e^λ`, finite for every λ; the
  high-temperature region at `λ=1` is `|β|(|h|+8e|J|)<1/(2+16e)`, a
  sufficient condition far below the known uniqueness for all β in one
  dimension, as the statement allows.
- The surface energy of `Λ=[0,N]` for that interaction is
  `Φ({−1,0})+Φ({N,N+1})`, of norm at most `2|J|` independently of N.
- The on-site model `Φ({x})=hσ_3` without interactions: `H_Φ(Λ)` has
  `Tr exp(−βH_Φ(Λ))=(2cosh(βh))^(|Λ|)`, so `p(βΦ)=log(2cosh(βh))`; the
  product Gibbs state has `e_Φ=−h tanh(βh)` and `s=log(2cosh(βh))−βh tanh(βh)`,
  and `s−βe_Φ=p(βΦ)`, so the variational supremum is attained there.
- Relative entropy: `D(ρ‖ρ)=0`; `ρ=diag(1,0)`, `σ=diag(0,1)` gives `+∞`;
  `ρ=diag(1,0)`, `σ=diag(½,½)` gives `log 2>0`; the GHZ state on
  `ℂ²⊗ℂ²⊗ℂ²` has `S(ABC)=0`, `S(B)=S(AB)=S(BC)=log 2`, so strong
  subadditivity reads `log 2≤2log 2`, and the reversed inequality fails.
- Van Hove: the boxes `[−n,n]^ν` are van Hove for every tile; the segments
  `[0,n]×{0}` in `ℤ²` have volume tending to infinity but contain no
  translate of the tile `Λ_((1,2))`, so `n⁻/n⁺=0` and they are not van Hove.
- `d=1`: every `A_Λ=ℂ`, the quasi-local algebra is ℂ, its unique state is
  KMS for every β, and every interaction norm is 0.

*Needs:* D7 (KMS states, ground states, bounded perturbations and their
sign); CStarAlgebras C5 (tensor products, inductive limits) and C2
(states); Mathlib `Matrix.trace`, the matrix exponential `NormedSpace.exp`,
the logarithm of a positive-definite matrix as the Hermitian functional
calculus `cfc Real.log` of `Matrix.IsHermitian`, `Matrix.PosSemidef` and
Schur complements; Bratteli–Robinson as cited.

### Examples

The nearest-neighbour Ising chain for the interaction norms and the
high-temperature bound; the on-site model for pressure, mean entropy and
the variational principle; the GHZ state for strong subadditivity;
segments in `ℤ²` as a non-van-Hove net.

### Dependencies

D7; CStarAlgebras C2 and C5; Mathlib matrix analysis (`Matrix.trace`,
`Matrix.PosSemidef`, the exponential `NormedSpace.exp` and the logarithm
of a positive-definite matrix through the Hermitian functional calculus).

## Downstream consumers

- NoncompactQuantumSymmetry consumes D1 (covariant pairs, integrated forms,
  group C*-algebras), D3 (Green imprimitivity, modular normalization,
  induction in stages) and D5 (Haar-system groupoid convolution and
  disintegration).
- CStarClassification CL5 consumes D2's full and reduced products by ℤ with
  their generator formulas.
- OperatorKTheory K7 consumes the crossed products of D1–D2 and the duality
  of D4.
- LieGroupoidsPoisson names D5 as the consumer of its topological groupoid
  layer G0.
- SelfAdjointSpectralTheory names D5 as a consumer of SA-B85's diagonal
  `C₀(X)` representation.
- FreeProbability F3 compares its F₂ norm obstruction with D2.FreeGroups and
  records D6 as the owner of the finite universal `O_n`.
- QuantumFoundations Layer 6 (6.3–6.4) consumes D8's Fock carriers, its
  sector formulas for the creation and annihilation operators and the
  Segal-field adapter; the Fock implementation `Γ(U)b̄(f)Γ(U)*=b̄(Uf)` of a
  one-particle unitary U built there is the case `V=0` of D8's universal CAR
  automorphism. RelativisticQuantumFieldTheory consumes D8's Weyl
  representation.
- NoncompactQuantumSymmetry M2.FixedTwistTypeI's single-weight fiber
  identification `J_k(E_ω)≅C*(G,ω^k)` is D1.TwistedBorel's; that section
  consumes it for the all-weight decomposition `C*(E_ω)≅⊕_kJ_k(E_ω)`.
- FactorRigidity, Subfactors, CompactQuantumMetricSpaces, QuantumGroups,
  NoncommutativeGeometry and CategoricalOperatorAlgebras cite D1–D2, D6, D7
  or D8 for crossed products, Cuntz algebras, KMS states or the CAR algebra
  with its Fock representation.

## Sources and API alignment

- Dana Williams, *Crossed Products of C*-Algebras*, draft 3.1 (the author's
  page at Dartmouth; page numbers are the printed ones):
  Lemma 1.61 and §1.4 for Haar and Fourier conventions; Proposition 1.76,
  Lemma 1.78 and Corollary 1.79 (pp. 24–26) for the dual group as the Gelfand
  spectrum of `L¹(G)` with the compact-open topology, (1.20) (p. 26) for the
  Fourier transform in the positive-character convention, and Proposition
  3.1 (p. 82) for `C*(G)≅C₀(Ĝ)`, all for D4.Harmonic; Chapter 2 for
  covariant representations and the universal completion, with Proposition
  2.23 (p. 49) for the integrated form and §2.6 with Theorem 2.61 (p. 72) for
  the universal property; §4.1 (pp. 114–115) for the axioms of
  pre-imprimitivity bimodules and inner-product modules (D1.Modules);
  Appendix E (Definition E.16 and Theorem E.17, p. 405) and Appendix F
  (Definition F.1, p. 409, for the general bundles not constructed here;
  Lemma F.20, p. 417; Theorem F.21, p. 418; Proposition F.26, p. 419;
  Proposition F.33, p. 423) for direct integrals, decomposable operators and
  their reduction and transport theorems, specialised in D5.Fields to
  standard fibres; Appendix I (Proposition I.1, p. 479; Proposition I.21,
  p. 494) for induced Hilbert spaces and `L²(G,H)` (D1.Modules, D2);
  Theorem 5.9 and Lemma 5.10 for induction in stages; Proposition 3.19
  for full ideal exactness; Theorem 4.1, Corollary 4.17 and Theorems 4.22–4.24
  for symmetric and Green imprimitivity and `C₀(G)⋊G≅K(L²G)` (Theorem 4.24,
  p. 133); Definition 4.26, Lemma 4.28 and Theorem 4.29 (pp. 135–137) for
  Heisenberg pairs and the von Neumann uniqueness theorem of D3.LCAWeyl;
  Theorem 7.1 with Lemmas 7.2–7.4, Lemma 7.8, Theorem
  7.13 and Corollary 7.18 for Takai, reduced norms, amenability and nuclearity;
  p. 27 for the statement of the Pontryagin duality theorem and Example
  7.11 (p. 198) for the Plancherel identity on `C_c(G)`, both of which
  Williams takes from Folland.
  Appendix D for D1.BorelPrefix: Theorem D.3 and Lemma D.4 (p. 370) for
  measurable homomorphisms of locally compact groups and Steinhaus's
  theorem, Theorem D.11 (p. 372) for Borel homomorphisms from Polish groups,
  Lemma D.20 and Theorem D.23 (pp. 375–376) for countably generated Borel
  structures and Mackey's topology on measurable groups, Proposition D.28
  (p. 383) for ω-representations and the circle extension, and Lemmas D.37,
  D.42 and D.43 (pp. 391–395) for the Polish unitary group and Borel
  coefficients.
- Walter Rudin, *Fourier Analysis on Groups*, Interscience (1962; Wiley
  Classics reprint 1990): Theorem 1.5.1 (inversion), Theorem 1.6.1
  (Plancherel), Theorem 1.7.2 (Pontryagin duality) and §2.6 (transforms
  equal to 1 on a compact set and 0 off a neighbourhood), cited by locator
  for D4.Harmonic. Rudin's proofs of inversion and Plancherel pass through
  Bochner's theorem; the routes D4.Harmonic gives do not.
- Jean Renault, *A Groupoid Approach to C*-Algebras*, LNM 793 (1980):
  Chapter I §§2–3 for Haar systems and quasi-invariant measures; Chapter II
  §§1–2 for convolution, integrated representations and the regular norm;
  Chapter III for AF and Cuntz groupoids. Use the modern sources below for
  general disintegration, equivalence and ideal hypotheses.
- Muhly–Williams, *Renault's Equivalence Theorem for Groupoid Crossed
  Products*, arXiv:0707.3566:
  Theorem 5.5, Theorem 7.8 and Appendix B. Use the scalar Hausdorff
  specialization. D5 builds the groupoid-specific measurable-representation
  and disintegration prerequisites over D5.Fields and SA-B85 in the stated
  unit-space/auxiliary-algebra order.
- Sims–Williams, *Renault's Equivalence Theorem for Reduced Groupoid
  C*-algebras*, arXiv:1002.3093:
  Definition 2, Lemmas 3–5 and Theorems 13 and 17 for linking groupoids,
  reduced corner norms and the quotient of the full equivalence module.
- Takeishi, *On nuclearity of C*-algebras of Fell bundles over étale
  groupoids*, arXiv:1301.6883, Theorem 5.4, for the nuclearity
  converse and its compact-bisection/positive-definite approximation proof.
  D6 uses the trivial line bundle. Renault, Chapter III, Proposition 2.7, gives
  the independent representation-theoretic Cuntz universal identification;
  D6's gauge-core route also constructs its injectivity proof.
- Aidan Sims, *Hausdorff étale groupoids and their C*-algebras*, lecture
  notes (2017, the author's page):
  §§4.1–4.3 for amenability, diagonal uniqueness, exact sequences, strong
  effectiveness and ideal lattices; §5.1 for diagonal regularity and maximal
  abelianness. Keep the hypotheses of these modern formulations.
- Bratteli–Robinson, *Operator Algebras and Quantum Statistical Mechanics 2*,
  second edition: §§5.2–5.3 for CAR/CCR, analytic elements, KMS and ground
  states; Theorem 5.3.30 for the simplex; Volume 1, Lemma 4.1.19, Definition 4.1.20, Proposition 4.1.22 and
  Theorem 4.1.25 for orthogonal measures and their commutant correspondence;
  Theorem 5.4.4 for the sign of bounded perturbations checked in finite
  dimensions; Theorem 6.2.4,
  Definition 6.2.16 and Theorem 6.2.18 for spin dynamics and Gibbs/KMS;
  Theorems 6.2.40 and 6.2.42 for pressure and the variational principle;
  Proposition 6.2.45 for high-temperature uniqueness.
- Pierre de la Harpe, *On simplicity of reduced C*-algebras of groups*,
  arXiv:math/0509450: Definition 9 (p. 7), Corollary 12 (p. 8), Theorem 14
  with its proof (pp. 10–11) and the Dixmier-property remark (p. 19), for
  D2.FreeGroups.
- Joachim Cuntz, *Simple C*-algebras generated by isometries*, Comm. Math.
  Phys. 57 (1977): §1 for the defining relations of O_n, cited by locator
  for D6's concrete families.

For central multiplier cocycles use the equations and cochain direction in
D1.CentralTwists and D2.CentralTwists. Delfín–Farsi–Packer,
*Twisted crossed products of Banach algebras*, arXiv:2509.24106, §§2–4
(general locally compact G; §§5–6 assume second countability), gives a
continuous multiplier-action and universal-property reference. The
C*-norm, star, regular module and arbitrary-LCH localized integration
arguments are targets here with the scope fixed above.

Use Mathlib's star-algebra equivalences, nonunital star homomorphisms,
positive continuous linear functionals, `ContinuousMap`, compactly supported
functions, Lp, Bochner integrals, `CStarModule`, `VonNeumannAlgebra`,
`ContinuousLinearMapWOT`, `PositiveLinearMap.GNS` and `PontryaginDual`. Extend Tau Ceti's
`RepresentationTheory/Continuous/{Unitary,Integrated}/Basic` for integrated
covariant representations, and its `Analysis/Bochner/LocallyCompactGroup`,
`Analysis/Fourier/Pontryagin` (the cyclic spectral theorem and the
inner regular uniqueness theorem that D4.Harmonic's Plancherel route uses)
and `Topology/Algebra/PontryaginDual` harmonic interfaces. The
topology on the total `Arrow` and on composable arrows is LieGroupoidsPoisson
G0's. Algebraic crossed products
and Tau Ceti's Galois/Brauer development do not supply the analytic norms or
completions here. Preserve the C*-module convention of D1.Modules.
`Suggested.lean` states the headline theorems named in
backticks at their targets; this README is definitive.
