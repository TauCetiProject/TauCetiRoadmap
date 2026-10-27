# Operator-algebra dynamics, crossed products, and equilibrium

Develop continuous actions on C*-algebras and their full and reduced crossed
products, induction and imprimitivity, Takai duality, Hausdorff groupoid
C*-algebras, and equilibrium states of quantum systems. Build the analytic
constructions and representation theory that connect these subjects: integrated
forms, Hilbert-module completions, disintegration, modular characterization of
KMS states, and the thermodynamic limit of quantum spin systems.

## Scope, conventions, and dependencies

D8 is the single owner of the CCR/CAR and Weyl algebraic relations, their regular representations and field operators, and the antisymmetric and symmetric Hilbert Fock representations: the Fock carriers and vacuum, creation and annihilation operators, the bosonic finite-particle domain, the Segal field `Φ₀(f)=(a(f)+a†(f))/√2` on that domain, its essential self-adjointness, and the identification of its closure with the Stone generator `Φ(f)` of the Fock Weyl representation. Quantum-statistical and quantum-field-theoretic developments consume these D8 results; unitary implementability of Bogoliubov automorphisms in Fock representations is not a target of this roadmap.

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
variable. Use [HilbertModules](../HilbertModules/README.md)'s opposite-algebra
implementation for right modules.

Fix left Haar measure μ. Write `c(g)=Measure.modularCharacter g` in the
convention `∫ f(xg) dμ(x)=c(g)∫ f(x) dμ(x)`. Thus Williams's modular function
is `Δ(g)=c(g)⁻¹`. Formulae involving different groups use their respective
Haar measures and modular functions. Fourier transforms and dual actions use
positive characters: `f̂(χ)=∫ f(g)χ(g) dμ(g)` and
`α̂χ(f)(g)=χ(g)f(g)`.

- [BanachAlgebras A7](../BanachAlgebras/README.md) supplies L¹ convolution,
  vector integration, Haar modular identities, and the support and Fubini
  arguments needed without global σ-finiteness. Its amenability dependency
  is the [AmenableGroups roadmap](../AmenableGroups/README.md).
- [CStarAlgebras C1–C2](../CStarAlgebras/README.md) supplies representations,
  approximate units, multipliers, ideals and quotients; C5 supplies tensor
  products and analytic inductive limits; C6 supplies nuclearity and CP
  approximation, and C7 supplies exactness. [HilbertModules H1–H4](../HilbertModules/README.md) supplies
  adjointable operators, interior tensor products, induction, Morita
  equivalence, and linking algebras.
- [VonNeumannAlgebras V0–V4](../VonNeumannAlgebras/README.md) supplies states,
  GNS, operator topologies and normal representations. D5 consumes
  [VonNeumannAlgebras V4.0.Fields](../VonNeumannAlgebras/README.md) for independent measurable Hilbert/operator fields,
  [SelfAdjointSpectralTheory SA-B85](../OperatorTheory/SelfAdjointSpectralTheory/README.md) for the unit-space diagonal C₀ theorem, then
  [VonNeumannAlgebras V4's separable commuting-representation reduction](../VonNeumannAlgebras/README.md)
  (the V4.0.Decomposition contract) for reduction over that given diagonal.
  V8 owns discrete von Neumann crossed products; V10–V11 owns modular theory
  and normal locally compact crossed products. D2 proves the comparison
  with their regular weak closures. D4 uses V11's harmonic-analysis layer:
  dual Haar normalization, Plancherel and Pontryagin biduality for locally
  compact abelian groups, independently of the normal crossed-product theorem.
- [OperatorTheory/SelfAdjointSpectralTheory](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
  and [OneParameterSemigroups](../OneParameterSemigroups/README.md) supply
  self-adjoint generators, their spectral calculus, Part B's PVM carrier,
  integration and representation-PVM API, and strongly continuous
  one-parameter groups. Use their `LinearPMap` domains and graph closures.
  D5 consumes SA-B85's diagonal theorem for nondegenerate C₀(X)
  representations on separable Hilbert spaces, X second-countable locally
  compact Hausdorff. Its order is V4.0.Fields → SA-B85 →
  V4.0.Decomposition → D5; D5 is not a prerequisite for those suppliers.
- Use the topological groupoid vocabulary shared with
  [LieGroupoidsPoisson G0](../LieGroupoidsPoisson/README.md):
  `CategoryTheory.Groupoid`, topology on the total `Arrow`, and continuous
  composition on composable arrows. Write `gh` for first h, then g
  (`h ≫ g` in category notation). G0 owns the total-arrow and composable-arrow topologies and continuous
  groupoid operations. D5 consumes that topological layer and builds Haar,
  integration and representation interfaces; smooth structures are not
  prerequisites.

D1–D4 form the group-action development; D5–D6 use D1's integration tools and
the module foundations, and compare transformation groupoids with D1–D2.
D7–D9 form the equilibrium development. Operator K-theory consumes crossed
products and duality; it owns Pimsner–Voiculescu and Connes–Thom sequences.
Neither K-theory nor C*-classification is a prerequisite here. General
non-Hausdorff groupoids, groupoid primitive-ideal classification, and
interacting continuum gases are outside this roadmap.

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

A covariant pair `(π,U)` satisfies `U_s π(a)=π(α_s(a)) U_s`. Construct its
integrated form by the vector formula
`(π⋊U)(f)ξ=∫ π(f(s))U_s ξ dμ(s)`. Establish integrability, boundedness by
`‖f‖₁`, multiplicativity and preservation of star. Strong continuity alone
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
algebras and adjointable operators on Hilbert modules. Recover the pair from
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

## D2. Regular representations, reduced products, and amenability

Use D1's regular covariant representation. Build the regular Hilbert A-module by completing `C_c(G,A)` with
right action `(f·a)(s)=f(s)α_s(a)` and inner product
`⟨f,g⟩=∫ α_(s⁻¹)(f(s)*g(s)) dμ(s)`. Prove that
`f(s)↦α_(s⁻¹)(f(s))` identifies it with the standard `L²(G,A)` module.
Left convolution is adjointable, with adjoint given by convolution with f*;
interior tensoring with ρ recovers the regular Hilbert-space representation.

Define `‖f‖r` by any faithful ρ and prove independence of ρ, agreement with
the regular module norm, and domination by the full norm. Construct `A⋊rG`
as the completion and as the quotient of the full crossed product by the
regular kernel. Develop its canonical multiplier maps, equivariant
functoriality, and factorization of all regular representations. Prove
`A⋊id,rG≃A⊗min Cr*(G)`. Show that the closure in the weak operator topology
of the regular C*-representation agrees with the V8 or V11 von Neumann
crossed product under the following hypotheses: ρ is nondegenerate,
M=ρ(A)'', and there is a σ-weakly continuous normal action αbar on M
with `αbar_s(ρ(a))=ρ(α_s(a))`. Here G is discrete for V8 or second
countable for V11. Prove σ-weak continuity of this automorphism action
implies the pointwise strong-star continuity used by V11, using the
positive-vector norm identities. Identify the coefficient and group maps under this
isomorphism; the C*-construction itself retains arbitrary locally compact G.

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
[RepresentationTheory/CompactGroups](../RepresentationTheory/CompactGroups/README.md).

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
`Ind_H^G(D,β)⋊G` is Morita equivalent to `D⋊H`. Construct the module on
`C_c(G,D)` with its Haar integrals, actions and both inner products; prove
positivity, norm estimates, compatibility, fullness and completion. For the
restricted-action model fix `γ_H(h)=Δ_G(h)^(1/2)Δ_H(h)^(-1/2)` and

```
⟨f,g⟩_(A⋊H)(h) = γ_H(h) ∫ α_(s⁻¹)(f(s)*g(sh)) dμ_G(s).
```

Use the matching left action, right action and left inner product of
Williams Theorem 4.22. Establish their conversion from the general induced
model, including the modular rescaling; the subgroup and ambient modular
functions need not agree. Interior tensoring gives induction of
representations and intertwining operators. Prove induction in stages for
closed subgroups and compatibility of the module and covariant descriptions.
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
module formulae when identifying this construction with H3's abstract
linking-algebra theory.

## D4. Dual actions and Takai duality

For locally compact abelian G use `PontryaginDual G` with its compact-open
topology. From V11's Fourier–Plancherel and evaluation biduality layer,
construct the strongly continuous dual action
`α̂χ(f)(s)=χ(s)f(s)` and prove its multiplier formulae, functoriality and
compatibility with full and reduced completions. Normalize the dual Haar
measure so that the positive-character Fourier transform is unitary on L²;
identify G with its bidual by `s↦(χ↦χ(s))`.

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

For a nondegenerate representation L of C*(G) on separable H, put X=G⁰
and let `ρ_L(h)=L̃(m(h))` for h∈C₀(G⁰), where m is the nondegenerate
unit-space multiplier map constructed above and L̃ is L's multiplier extension.
Prove ρ_L is nondegenerate: choose compactly supported unit-space cutoffs
h_i with `0≤h_i≤1`, eventually equal to1 on each prescribed compact subset
of X. For f∈C_c(G), the compact sets r(supp f) and s(supp f) give
`m(h_i)f→f` and `f m(h_i)→f` in I-norm. The dense span L(C_c(G))H
and `‖ρ_L(h_i)‖≤1` then give strong convergence `ρ_L(h_i)→I`.
Consume [VonNeumannAlgebras V4.0.Fields](../VonNeumannAlgebras/README.md) for measurable Hilbert fields, square-integrable
sections, rectangular decomposable maps and RN measure-change/zero-extension
unitaries, and [SelfAdjointSpectralTheory SA-B85](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
for the diagonal spectral representation of this nondegenerate C₀(G⁰)
representation. The unit space G⁰ is second-countable locally compact Hausdorff.

For two such representations L₁,L₂ and a bounded intertwiner T, prove
that multiplier extension makes T intertwine their unit-space representations.
Use SA-B79/B85 on the direct-sum representation and its off-diagonal corner
to transport spectral projections and full diagonal L∞ actions; for controls
μ₁,μ₂ use `λ=μ₁+μ₂` and Fields' onto RN transport to λ-fields with zero
fibres off each density support. No equivalence of the two controls is
assumed for a bounded intertwiner. On H₁⊕H₂ the off-diagonal block
`S(ξ₁,ξ₂)=(0,Tξ₁)`, and S†, commute with the common diagonal. Form the
separable unital C*-algebra generated by `diag(ρ₁(h),ρ₂(h))`, h∈C₀(G⁰),
S,S† and I. Apply [V4.0.Decomposition's reduction of a separable C*-representation
commuting with a given diagonal](../VonNeumannAlgebras/README.md) to this auxiliary algebra,
and Fields' rectangular criterion to recover measurable fibre maps, with
essential norm, adjoint, composition and fibrewise-unitarity comparisons.
Here V4.0.Decomposition denotes reduction over the given diagonal supplied
by SA-B85. The full groupoid representation L is not assumed to commute
with C₀(G⁰). Identify its unit-space spectral measure class and multiplicity
with the shared direct-integral construction, and prove almost-everywhere
transport for equivalent base measures. Include H=0, zero controls/fields
and the empty unit space, where nondegeneracy forces H=0; keep the onto
zero-fibre transport in these cases. D5 proves quasi-invariance and constructs
the inter-fibre unitaries U_γ, saturated conull reduction and disintegration
below; continuous Hilbert fields in H5 alone do not supply these targets.

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
`C*(G)`–`C*(H)` module. Prove that the unit-space corner projections are
full and that the linking C*-algebra is `C*(L)`. Establish the regular corner
norm equalities and identify the reduced linking algebra with `Cr*(L)`;
obtain `Cr*(G)∼M Cr*(H)`. If `J_G=ker(C*(G)→Cr*(G))` and similarly for H,
prove that the full module carries `J_H` to `J_G` under ideal correspondence
and that its quotient by `X J_H` is the reduced module. Develop composition
and natural unitary identifications through interior tensor products.

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
states a target.

## D7. Analytic dynamics, KMS states, and modular theory

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
`F_ab(t)=ω(a τ_t(b))` and `F_ab(t+iβ)=ω(τ_t(b)a)`. Prove the equivalent
analytic identity `ω(a τ_(iβ)(b))=ω(ba)`, the norm bound
`|F_ab(z)|≤‖a‖‖b‖`, and the sufficiency of checking on a norm-dense invariant
algebra of entire elements. Treat β<0 on the reversed strip, and β=0 as
the full space of tracial states. Prove invariance for β≠0; it is not a
consequence of the β=0 trace condition. Develop pullback under equivariant
quotients, tensor products of KMS states, restrictions to invariant
subalgebras when the restriction has norm one, and stability under weak-*
limits that are states, for a fixed dynamics.
For the rotation action on `C(S¹)`, evaluation states are traces but need
not be invariant; use this example to distinguish the β=0 convention.

For β≠0 construct the GNS implementing group, extend τ normally to
`M=πω(A)''`, and prove that Ωω is separating for M. Using V10's modular
operator prove `σ_t^ω=τ̄_(-βt)`. Conversely this equality for a faithful
normal GNS state implies the KMS condition. For a normal state on a given
von Neumann algebra retain the support qualification: a modular KMS flow
exists on that algebra exactly when its support is central; the flow is
uniquely determined on the supported corner. Distinguish faithfulness on
the GNS von Neumann algebra from faithfulness on the original A.

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
the GNS center with the maximal KMS representing measure. In general prove
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

Develop bounded perturbations of faithful normal states using V10's
standard form. If Ω represents ω, define the perturbed vector for bounded
self-adjoint Q by `Ω^Q=exp((log Δω+Q)/2)Ω` and normalize its vector state
to obtain ω^Q. Prove existence of this vector, normalization, the
cocycle/analytic-continuation formula, continuous dependence, the inverse
perturbation law, and its modular characterization. For a β-KMS state,
Q=βP corresponds to subtracting the physical energy P, giving generator
`δ−i[P,·]`. Establish this sign by the finite-dimensional Gibbs calculation
and prove compatibility with the abstract bounded-perturbation construction.

## D8. CAR, Weyl algebras, and free equilibrium states

For a complex Hilbert space h construct CAR(h), generated by an antilinear
map a with `{a(f),a(g)}=0` and `{a(f),a(g)*}=⟨f,g⟩1`. Prove the universal
property, `‖a(f)‖=‖f‖`, functoriality for isometric inclusions, gauge action,
simplicity, and the finite-dimensional identification `CAR(ℂⁿ)≃M_(2ⁿ)(ℂ)`.
Construct the antisymmetric Hilbert Fock space `F_a(h)`, the Hilbert direct
sum over n≥0 of the closed antisymmetric subspaces `Λⁿ(h)` of the completed
n-th Hilbert tensor powers, with vacuum Ω=1∈Λ⁰(h)=ℂ; take it as a closed
subspace of the full Fock space and completed tensor powers of
[FreeProbability F3](../FreeProbability/README.md). Define the creation
operator `a†(f)ψ=√(n+1)·P_a(f⊗ψ)` on `Λⁿ(h)`, linear in f, where P_a is the
antisymmetrizing projection, and the annihilation operator `a(f)=a†(f)*`,
antilinear in f, with a(f)Ω=0. Prove that both are bounded with
`‖a(f)‖=‖a†(f)‖=‖f‖`, that they satisfy the CAR above, and that sending
each generator of CAR(h) to the Fock annihilation operator a(f) extends to a
faithful representation π_F of CAR(h) whose vacuum vector state
is the quasi-free state with S=0 below (Bratteli–Robinson 2, §5.2.1).
Reuse finite-dimensional exterior/Clifford algebra from
[SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md);
build the Hilbert completion and norm estimates here. Show that finite
subspace inclusions give the CAR inductive limit, including separable
infinite-dimensional h and its matrix stages.

For a complex pre-Hilbert space h, prove that the norm identity extends its antilinear generators uniquely to the Hilbert completion and induces the canonical generator-preserving isomorphism `CAR(h)≃CAR(completion h)`. State represented-family uniqueness for nonzero unital CAR families: universality and simplicity make the map onto the generated C*-algebra an isomorphism. Preserve the source's omitted zero-representation exception. For h=0 the universal unital algebra is ℂ; distinguish this from the nonunital closed algebra generated by only zero operators. Prove `CAR(h)` is separable iff h is separable, using the generator isometry in one direction and countably many star polynomials on dense generators in the other.

For bounded complex-linear U and bounded antilinear V on the complete complex Hilbert carrier h (using its completion in the pre-Hilbert comparison), define the antilinear adjoint by `⟨V* x,y⟩=⟨V y,x⟩` in the second-linear convention. Prove that
`V*U+U*V=0=UV*+VU*` and `U*U+V*V=1=UU*+VV*`
are the components of the real-orthogonality identities for `T=U+V`. Under these four relations construct the unique CAR automorphism `γ(a(f))=a(Uf)+a(Vf)*`, with inverse obtained from the real adjoint `T*=U*+V*`. Pin the CAR calculation by `⟨Uf,Ug⟩+⟨Vg,Vf⟩=⟨f,g⟩` and `⟨Uf,Vg⟩+⟨Ug,Vf⟩=0`. The Majorana generators `c(f)=a(f)+a(f)*` give the equivalent real-orthogonal construction `c(f)↦c(Tf)`. D8 owns this universal CAR automorphism only; a criterion for its unitary implementation in the antisymmetric Fock representation is not a target here.

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

For a real symplectic space `(V,σ)` construct the universal unital Weyl
C*-algebra with `W(0)=1`,
`W(f)W(g)=exp(−iσ(f,g)/2)W(f+g)` and `W(f)*=W(−f)`.
Prove `W(f)*W(f)=W(f)W(f)*=1`, so each generator is unitary.
Develop symplectic functoriality, linear independence of the Weyl
generators, the canonical trace, and the nondegenerate form's simplicity.
Distinguish the algebraic symplectic data from continuity: a representation
is regular if `t↦π(W(tf))` is strongly continuous for each f. Fix the generator sign by `π(W(tf))=exp(itΦ(f))`. Construct field operators by Stone's theorem in regular representations, their invariant domains and the Weyl-to-commutator relation on those domains.
Assume the real symplectic form is nondegenerate for this spectrum argument. Prove `‖W(f)−1‖=2` for nonzero f. More generally prove `σ(W(f))=𝕋` for every nonzero `f`: nondegeneracy supplies `g` whose Weyl conjugation rotates `W(f)` by any prescribed unit scalar, and the nonempty unitary spectrum is rotation invariant. Deduce `‖W(f)−z·1‖=2` for `z∈𝕋`, and hence `‖W(f)−W(g)‖=2` whenever `f≠g`. If the real symplectic space is nonzero, choose `f₀≠0`; the family `W(tf₀)`, `t∈ℝ`, is uncountable and uniformly separated, proving that the universal Weyl algebra is nonseparable even for finite-dimensional nonzero symplectic spaces. Keep the zero-space algebra `ℂ` separate. A nontrivial continuous one-particle flow therefore need not give a point-norm continuous Weyl-algebra action.

For `V=h_ℝ`, `σ(f,g)=Im⟨f,g⟩`, construct the symmetric Hilbert Fock
space `F_s(h)`, the Hilbert direct sum over n≥0 of the closed symmetric
subspaces `Symⁿ(h)` of the completed n-th Hilbert tensor powers of
FreeProbability F3, with vacuum
Ω=1∈Sym⁰(h)=ℂ, and its finite-particle subspace `D_fin`, the algebraic direct
sum of the `Symⁿ(h)`. On D_fin define `a†(f)ψ=√(n+1)·P_s(f⊗ψ)` for
ψ∈Symⁿ(h), linear in f, where P_s is the symmetrizing projection, and a(f),
antilinear in f, by `a(f)Ω=0` and `a(f)(g⊗ⁿ)=√n·⟨f,g⟩·g⊗⁽ⁿ⁻¹⁾` extended
linearly and continuously on each Symⁿ(h). Prove that a(f) and a†(f) map
D_fin into itself, that `⟨a†(f)φ,ψ⟩=⟨φ,a(f)ψ⟩` for φ,ψ∈D_fin, that
`[a(f),a†(g)]=⟨f,g⟩` and `[a(f),a(g)]=0` on D_fin, and that
`‖a(f)ψ‖≤√n‖f‖‖ψ‖` and `‖a†(f)ψ‖≤√(n+1)‖f‖‖ψ‖` for ψ∈Symⁿ(h). Define the
Segal field `Φ₀(f)=(a(f)+a†(f))/√2` on D_fin. Prove that every vector of
D_fin is analytic for Φ₀(f), using `‖Φ₀(f)ᵏψ‖≤(√2‖f‖)ᵏ√((n+k)!/n!)‖ψ‖`
for ψ∈Symⁿ(h); prove here Nelson's criterion that a symmetric operator with
a dense invariant set of analytic vectors is essentially self-adjoint, in
the `LinearPMap` graph-closure language of SelfAdjointSpectralTheory, and
deduce that Φ₀(f) is essentially self-adjoint on D_fin; that the
unitaries `W_F(f)=exp(i·closure(Φ₀(f)))` satisfy the Weyl relations above
and define a regular representation π_F of the Weyl algebra of `(h_ℝ,σ)`;
and that in π_F the Stone generator `Φ(f)` defined above equals
`closure(Φ₀(f))`, so `π_F(W(tf))=exp(it·closure(Φ₀(f)))`. The factor 1/√2 is
fixed by two computations on D_fin: `[Φ₀(f),Φ₀(g)]=i·Im⟨f,g⟩`, which is the
commutator that the Weyl relation `W(f)W(g)=exp(−iσ(f,g)/2)W(f+g)` forces on
generators; and `⟨Ω,Φ₀(f)²Ω⟩=‖f‖²/2`, which gives the vacuum characteristic
function `ω₀(W(f))=⟨Ω,π_F(W(f))Ω⟩=exp(−‖f‖²/4)` (Bratteli–Robinson 2,
§5.2.1). The unnormalized field `a(f)+a†(f)` would give commutator
`2i·Im⟨f,g⟩` and characteristic function `exp(−‖f‖²/2)`, and is excluded
by both. For real symmetric covariance forms q require
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
Prove the strip KMS identities on Weyl correlations, normal extension of
the dynamics in its regular GNS representation, and the modular
characterization there. In this Weyl setting define β-KMS to mean that
the invariant regular state's GNS dynamics extends to a σ-weakly continuous
normal flow and its normal vector state satisfies the W*-strip KMS
condition; prove its Weyl-correlation characterization. Prove uniqueness
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

## Sources and API alignment

- [Dana Williams, *Crossed Products of C*-Algebras*, draft 3.1](https://math.dartmouth.edu/~dana/cpcsa/draft3.1.pdf):
  Lemma 1.61 and §1.4 for Haar and Fourier conventions; Chapter 2 for
  covariant representations and the universal completion; Proposition 3.19
  for full ideal exactness; Theorem 4.1, Corollary 4.17 and Theorems 4.22–4.24
  for symmetric and Green imprimitivity; Theorem 5.9 for induction in
  stages; Theorem 7.1, Lemma 7.8, Theorem
  7.13 and Corollary 7.18 for Takai, reduced norms, amenability and nuclearity.
- Jean Renault, *A Groupoid Approach to C*-Algebras*, LNM 793 (1980):
  Chapter I §§2–3 for Haar systems and quasi-invariant measures; Chapter II
  §§1–2 for convolution, integrated representations and the regular norm;
  Chapter III for AF and Cuntz groupoids. Use the modern sources below for
  general disintegration, equivalence and ideal hypotheses.
- [Muhly–Williams, *Renault's Equivalence Theorem for Groupoid Crossed Products*](https://arxiv.org/abs/0707.3566):
  Theorem 5.5, Theorem 7.8 and Appendix B. Use the scalar Hausdorff
  specialization. D5 builds the groupoid-specific measurable-representation
  and disintegration prerequisites over V4.0.Fields, SA-B85 and
  V4.0.Decomposition in the stated unit-space/auxiliary-algebra order.
- [Sims–Williams, *Renault's Equivalence Theorem for Reduced Groupoid C*-algebras*](https://arxiv.org/abs/1002.3093):
  Definition 2, Lemmas 3–5 and Theorems 13 and 17 for linking groupoids,
  reduced corner norms and the quotient of the full equivalence module.
- [Takeishi, *On nuclearity of C*-algebras of Fell bundles over étale
  groupoids*](https://arxiv.org/abs/1301.6883), Theorem5.4, for the nuclearity
  converse and its compact-bisection/positive-definite approximation proof.
  D6 uses the trivial line bundle. Renault ChapterIII Proposition2.7 gives
  the independent representation-theoretic Cuntz universal identification;
  D6's gauge-core route also constructs its injectivity proof.
- [Aidan Sims, *Hausdorff étale groupoids and their C*-algebras*](https://www.aidansims.com/files/GroupoidsNotes-2017.pdf):
  §§4.1–4.3 for amenability, diagonal uniqueness, exact sequences, strong
  effectiveness and ideal lattices; §5.1 for diagonal regularity and maximal
  abelianness. Keep the hypotheses of these modern formulations.
- Bratteli–Robinson, *Operator Algebras and Quantum Statistical Mechanics 2*,
  second edition: §§5.2–5.3 for CAR/CCR, analytic elements, KMS and ground
  states; Theorems 5.3.10 and 5.3.30 for modular characterization and the
  simplex; Volume1 Lemma4.1.19, Definition4.1.20, Proposition4.1.22 and
  Theorem4.1.25 for orthogonal measures and their commutant correspondence;
  Theorem 5.4.4 for bounded perturbations; Theorem 6.2.4,
  Definition 6.2.16 and Theorem 6.2.18 for spin dynamics and Gibbs/KMS;
  Theorems 6.2.40 and 6.2.42 for pressure and the variational principle;
  Proposition 6.2.45 for high-temperature uniqueness.

Use Mathlib's star-algebra equivalences, nonunital star homomorphisms,
positive continuous linear functionals, `ContinuousMap`, compactly supported
functions, Lp, Bochner integrals and `PontryaginDual`. Extend Tau Ceti's
`RepresentationTheory/Continuous/{Unitary,Integrated}/Basic` for integrated
covariant representations, and its `Analysis/Bochner/LocallyCompactGroup`
and `Topology/Algebra/PontryaginDual` harmonic interfaces. Follow the
topology-on-`Arrow` and composable-arrow design of LieGroupoidsPoisson G0.
The algebraic crossed products of Tau Ceti's `Algebra/CrossedProduct`
(its Galois/Brauer development) do not supply the analytic norms or
completions here. Preserve the C*-module conventions discussed in the
[module-convention Zulip discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/redefining%20%60Inner%60%20in%20%60InnerProductSpace%20%F0%9D%95%9C%20%F0%9D%95%9C%60/with/487074289)
and adopted in H1–H3. [Suggested.lean](Suggested.lean) prototypes the action,
covariance, vector-integral and KMS interfaces; this README is definitive.
