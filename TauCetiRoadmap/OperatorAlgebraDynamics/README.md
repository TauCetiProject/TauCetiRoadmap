# Operator-algebra dynamics, crossed products, and equilibrium

Develop continuous actions on C*-algebras and their full and reduced crossed
products, induction and imprimitivity, Takai duality, Hausdorff groupoid
C*-algebras, and equilibrium states of quantum systems. Build the analytic
constructions and representation theory that connect these subjects: integrated
forms, Hilbert-module completions, disintegration, modular characterization of
KMS states, and the thermodynamic limit of quantum spin systems.

## Scope, conventions, and dependencies

D8 is the single owner of the CCR/CAR and Weyl algebraic relations, their regular representations and their basic field operators. QuantumFoundations QF4 owns the generic Fock/second-quantization API and proves the normalization adapter `Φ_D8(h)=(a(h)+a†(h))/√2` on its specified invariant domain; RQFT consumes D8's Weyl representation and QF4's Fock adapter explicitly.

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
  [VonNeumannAlgebras V4.0.Decomposition](../VonNeumannAlgebras/README.md)
  (its separable commuting-representation reduction) for reduction over that given diagonal.
  V8 owns discrete von Neumann crossed products and the arbitrary-LCH
  [VonNeumannAlgebras V8.LCHRegularNormalBridge](../VonNeumannAlgebras/README.md).
  D2 consumes this bridge for the comparison with regular weak closures.
  V10–V11 owns modular theory and the later second-countable normal
  crossed-product weight/duality development. D4 uses V11's harmonic-analysis layer:
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

### D1.CentralTwists. Continuous central multiplier cocycles

For every D1 action α on a possibly nonunital complex C*-algebra A, use
C1's multiplier algebra `M(A)=𝓜(ℂ,A)` and its unique unital extension
`α̃_s`. Construct this extension as an action, with
`α̃_s(m)α_s(a)=α_s(ma)` and `α_s(a)α̃_s(m)=α_s(am)`.
Prove uniqueness, identity and composition, preservation of the center and
unitaries, and joint strict continuity on bounded multiplier sets. The
strict topology here is C1's topology, not the norm topology of
`DoubleCentralizer`.

A normalized continuous central α-cocycle is a map
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

A twisted covariant pair consists of a nondegenerate representation π of
A and a strongly continuous map `U:G→U(H)` with

```
U_e=1,
U_s π(a) U_s*=π(α_s(a)),
U_s U_t=π̃(ω(s,t)) U_(st).
```

Here π̃ is C1's multiplier extension; U is not a genuine representation
unless the represented cocycle is trivial. Construct the integrated form
by the vector integral `T_fξ=∫π(f(s))U_sξ dμ(s)` and prove
`‖T_f‖≤‖f‖₁`, multiplicativity and star preservation with the displayed
modular factor. Establish the compact-support proof and L¹ extension in
D1's arbitrary-LCH scope; do not substitute an operator-norm Bochner
integral. Give the intertwiner, unitary equivalence, direct sum,
nondegeneracy and irreducibility comparisons and inverse recovery of the
pair. Extend the correspondence to nondegenerate covariant maps into
multiplier algebras and adjointable operators, with strict continuity on
the unitary family.

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
NQS M2's targets, with these fiber identifications as inputs.

A pointwise choice of lifts of a ray action supplies neither Borel
measurability nor continuity. Apply the Borel theorem only to lifts
already shown to be Borel, and the continuous theorem only when its strict
continuity hypotheses have been established. These distinct regularity
hypotheses are part of the input, including for central M(A)-valued
cocycles: no claim here assigns a topological completion to an arbitrary
unqualified set-theoretic central cocycle.

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
with `αbar_s(ρ(a))=ρ(α_s(a))`. Consume the arbitrary-LCH
[VonNeumannAlgebras V8.LCHRegularNormalBridge](../VonNeumannAlgebras/README.md)
and its pointwise strong-star/ultraweak continuity equivalence, predual
normality and regular-realization comparison. Identify the coefficient and
group maps under this isomorphism, including the zero representation case.
The order is D1's C*-regular construction, then the V8 normal bridge, then
this D2 comparison; the bridge does not consume this comparison. Later
V11 weight/duality results keep their stated second-countability hypotheses.
The C*-construction and this regular weak-closure comparison both retain
arbitrary locally compact Hausdorff G.

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
makes d constant on O, so the common commutant is ℂI. Apply D1's integrated
intertwiner dictionary and CStarAlgebras C2's nonzero Schur criterion.
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
`x−y∈θℤ+ℤ` for real lifts. Their common primitive kernel is0, even when the
representations are inequivalent. Prove the orbit quotient is indiscrete by
density of every orbit. This supplies Rieffel main pp47–48's concrete example;
it does not identify the orbit quotient with the primitive ideal space.
[OrbitRepresentationTargets.lean](OrbitRepresentationTargets.lean) records
the point-separating diagonal-commutant adapter, transitive scalar conclusion
and rotation phase on native ℓ² and bounded-operator carriers.

### D2.CentralTwists. Reduced central twisted products

For each D1.CentralTwists system complete `C_c(G,A)` with the same right
action and inner product as D2. Its identification with the standard
`L²(G,A)` module is still `f(r)↦α_(r⁻¹)(f(r))`. Prove left twisted
convolution is a bounded adjointable operator with adjoint the displayed
twisted star. In standard-module coordinates its coefficient map is
`aξ(r)=α_(r⁻¹)(a)ξ(r)` and its projective unitary is
`V_sξ(r)=α̃_(r⁻¹)(ω(s,s⁻¹r))ξ(s⁻¹r)`; multiplication here is the
multiplier action on A. Prove the formulas on compact-support sections,
A-linearity, boundedness, adjoints and extension, and show interior
tensoring with a nondegenerate ρ gives precisely D1.CentralTwists'
Hilbert-space regular pair.

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
above. D2's existing untwisted V8.LCHRegularNormalBridge comparison and
D2.FreeGroups are retained with their stated inputs and conclusions;
a normal twisted crossed product is not a prerequisite for this C* theory.
The dependency order is C1/A7/H1–H3 → D1.CentralTwists →
D2.CentralTwists. The scalar Borel route is A7/C1 → D1.BorelPrefix →
D1.TwistedBorel; the all-weight decomposition and type-I applications are
consumers of these two sections. It has no edge from those applications
or from V11 crossed-product duality back into D1.

### D2.FreeGroups. Powers averaging, simplicity and the canonical trace

For a discrete group Γ use D1–D2's full and reduced group C*-completions,
counting Haar measure, and `λ(g)δ_h=δ_(gh)` on `ℓ²(Γ,ℂ)`. The finite-support
group algebra is `MonoidAlgebra ℂ Γ`. Prove that D2's coefficient expectation
specializes to the faithful tracial state `τ(x)=⟨δ_1,xδ_1⟩`, with
`τ(Σ_g c_g λ(g))=c_1`. Define the Powers property by the following exact
partition condition: for every finite `F⊆Γ∖{1}` and every integer `N≥1`
there are `Γ=C⊔D` and `γ_1,…,γ_N` with `fC∩C=∅` for every `f∈F` and
pairwise disjoint sets `γ_j D`. No countability assumption is part of
this definition or of the averaging criterion below.

Prove this property for `FreeGroup ι` whenever the basis ι has two distinct
elements, at arbitrary cardinality. In particular this includes every
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
basis elements. For a
nonzero closed two-sided ideal, normalize a nonzero positive element by
its strictly positive τ-value, average it to within distance less than1
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
Compare with [FreeProbability F3](../FreeProbability/README.md)'s independent
F₂ full/reduced norm obstruction; that calculation is not a prerequisite
for the Powers argument. Construct canonical isometric embeddings of reduced
subgroup algebras by the right-coset decomposition of the regular Hilbert
space, including `Cr*(F₂)→Cr*(FreeGroup ι)`. No K-theory result is used here.
The empty-basis algebra is ℂ and the singleton-basis algebra is C(𝕋);
the latter has many traces and is not simple. OperatorKTheory K7 owns the
separate free-basis K-group calculation and its full/reduced comparison.

For the partition and averaging argument use de la Harpe,
[*On simplicity of reduced C*-algebras of groups*](https://arxiv.org/html/math/0509450),
Definition9 and Theorem14. Prove the finite-word construction, general
operator estimate and unique-trace corollary specified here; the source's
self-adjoint ideal proof alone does not substitute for those interfaces.

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

These models give the specified mathematics of Rieffel main pp140–142 /
archive 0210_026 pp13–15. Preserve their single-additional-irrep and
two-point-spectrum claims, and the withdrawn sum-of-projections argument,
as source errors. Main p138 / archive 0210_026 p11 has conflicting
coefficient-algebra readings and an unjustified singleton-projection/unit
identification; this model does not resolve that original-input ambiguity.

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
in ℝ². Deduce T₀, failure of T₁ and failure of Hausdorffness.
In the Rieffel main p137 / archive 0210_026 p10 comparison, preserve the
source's reversed neighborhood-containment assertions separately; an
arbitrary neighborhood of a half-axis need not contain the origin or a
fixed nonzero hyperbola orbit. This target computes the orbit space,
without identifying it with a crossed-product primitive space.

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

**D3.LCAWeyl — translation covariance and the general LCA Weyl dictionary.**
For every locally compact Hausdorff abelian G, use V11's compact-open
Pontryagin dual, positive-character Fourier transform and evaluation
biduality. With `α_s(f)(t)=f(s⁻¹t)`, prove the equivalence between
nondegenerate covariant pairs `(π,U)` for `(C₀(G),G,α)` and pairs of
strongly continuous unitary representations U of G and V of its dual
satisfying `U_s V_χ U_s*=conjugate(χ(s)) V_χ`. Extend π to multipliers and
set `V_χ=π̃(t↦χ(t))`. Conversely integrate V to C*(Ĝ), use its Fourier
isomorphism with C₀(G) sending the canonical multiplier at χ to
`t↦χ(t)`, and prove nondegeneracy, covariance and both inverse laws.
Compare the integrated Fourier formula with V11's positive-character
convention, including the dual Haar normalization. Prove compatibility
with bounded intertwiners, unitary equivalence and Hilbert direct sums.
Replacing V_χ by V_(χ⁻¹) gives the alternative commutator χ(s); explicitly
track this change when comparing Rieffel main p66 / archive 0209_001 p17,
whose real exponential and final abstract pairing displays use opposite
signs. No assertion about differentiating unbounded generators is needed.

Through D3's explicit `C₀(G)⋊ltG≅K(L²G)` prove that every such
nondegenerate Weyl pair is a multiplicity amplification of the Schrödinger
pair `U_sξ(t)=ξ(s⁻¹t)`, `V_χξ(t)=χ(t)ξ(t)` on L²(G). Construct the
intertwining unitary and its multiplicity space using rank-one operators;
allow arbitrary Hilbert multiplicity and zero multiplicity. The nonzero
irreducible pair has multiplicity one and is unique up to unitary
equivalence. This uses the representation theory of compact operators,
not a finite-dimensional real-space restriction of Stone–von Neumann.

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
S,S† and I. Apply [VonNeumannAlgebras V4.0.Decomposition](../VonNeumannAlgebras/README.md)'s reduction of a separable C*-representation
commuting with a given diagonal to this auxiliary algebra,
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
Construct the antisymmetric Hilbert Fock space and its creation and
annihilation operators, vacuum state and faithful CAR representation.
Reuse finite-dimensional exterior/Clifford algebra from
[SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md);
build the Hilbert completion and norm estimates here. Show that finite
subspace inclusions give the CAR inductive limit, including separable
infinite-dimensional h and its matrix stages.

For a complex pre-Hilbert space h, prove that the norm identity extends its antilinear generators uniquely to the Hilbert completion and induces the canonical generator-preserving isomorphism `CAR(h)≃CAR(completion h)`. State represented-family uniqueness for nonzero unital CAR families: universality and simplicity make the map onto the generated C*-algebra an isomorphism. Preserve the source's omitted zero-representation exception. For h=0 the universal unital algebra is ℂ; distinguish this from the nonunital closed algebra generated by only zero operators. Prove `CAR(h)` is separable iff h is separable, using the generator isometry in one direction and countably many star polynomials on dense generators in the other.

For bounded complex-linear U and bounded antilinear V on the complete complex Hilbert carrier h (using its completion in the pre-Hilbert comparison), define the antilinear adjoint by `⟨V* x,y⟩=⟨V y,x⟩` in the second-linear convention. Prove that
`V*U+U*V=0=UV*+VU*` and `U*U+V*V=1=UU*+VV*`
are the components of the real-orthogonality identities for `T=U+V`. Under these four relations construct the unique CAR automorphism `γ(a(f))=a(Uf)+a(Vf)*`, with inverse obtained from the real adjoint `T*=U*+V*`. Pin the CAR calculation by `⟨Uf,Ug⟩+⟨Vg,Vf⟩=⟨f,g⟩` and `⟨Uf,Vg⟩+⟨Ug,Vf⟩=0`. The Majorana generators `c(f)=a(f)+a(f)*` give the equivalent real-orthogonal construction `c(f)↦c(Tf)`. QF consumes this universal CAR automorphism and owns its Fock/domain comparison; any criterion for unitary implementation is a separate target.

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
  Appendix D for D1.BorelPrefix: Theorem D.3 and Lemma D.4 (p. 370) for
  measurable homomorphisms of locally compact groups and Steinhaus's
  theorem, Theorem D.11 (p. 372) for Borel homomorphisms from Polish groups,
  Lemma D.20 and Theorem D.23 (pp. 375–376) for countably generated Borel
  structures and Mackey's topology on measurable groups, Proposition D.28
  (p. 383) for ω-representations and the circle extension, and Lemmas D.37,
  D.42 and D.43 (pp. 391–395) for the Polish unitary group and Borel
  coefficients.
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

For central multiplier cocycles use the equations and cochain direction in
D1.CentralTwists and D2.CentralTwists. [Delfín–Farsi–Packer,
*Twisted crossed products of Banach algebras*, §§2–4 and §6](https://arxiv.org/html/2509.24106v1)
gives a continuous multiplier-action and universal-property reference;
its later Lᵖ results have additional countability hypotheses. The
C*-norm, star, regular module and arbitrary-LCH localized integration
arguments are targets here with the scope fixed above.

Use Mathlib's star-algebra equivalences, nonunital star homomorphisms,
positive continuous linear functionals, `ContinuousMap`, compactly supported
functions, Lp, Bochner integrals and `PontryaginDual`. Extend Tau Ceti's
`RepresentationTheory/Continuous/{Unitary,Integrated}/Basic` for integrated
covariant representations, and its `Analysis/Bochner/LocallyCompactGroup`
and `Topology/Algebra/PontryaginDual` harmonic interfaces. The
topology on the total `Arrow` and on composable arrows is LieGroupoidsPoisson
G0's. Algebraic crossed products
and Tau Ceti's Galois/Brauer development do not supply the analytic norms or
completions here. Preserve the C*-module conventions discussed in the
[module-convention Zulip discussion](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/redefining%20%60Inner%60%20in%20%60InnerProductSpace%20%F0%9D%95%9C%20%F0%9D%95%9C%60/with/487074289)
and adopted in H1–H3. [Suggested.lean](Suggested.lean) prototypes the action,
covariance, vector-integral and KMS interfaces; this README is definitive.
