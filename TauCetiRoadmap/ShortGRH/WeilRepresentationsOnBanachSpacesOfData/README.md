# Weil representations on Banach spaces of data

**Summary.** This roadmap builds the Weil representation of unitary groups over a CM field and the theta lifts of
automorphic functions, in the form in which the shorter proof uses them. The argument of the family runs as follows: a
one-sided bound for a sum over primes gives a half-plane free of zeros of Dirichlet L-functions, and the one-sided
bound comes from comparing an upper and a lower bound for the covolume of a lattice of theta lifts
(OneSidedPrimeSumBoundsAndAdmissibleData). Every lift in both bounds is an integral of an automorphic function
against the theta kernel of a unitary dual pair, and every theta kernel is the theta functional of a vector moved by
the Weil representation. This roadmap supplies those objects and the laws that the upper bound
(ThetaLiftChainsAndTheSeesawIdentity, CompositeThetaLiftsAndShortForms), the spanning theorem
(SecondMomentsOfPoincareSeries) and the lower bound (DeterminantsOfThetaLiftChains,
NormsOfThetaLiftsAndExchangeIdentities, CongruencesOfTwistedThetaLifts) take from it.

The route does not use a Schrödinger model on a Lagrangian. Over a CM field `E` with Weil data (a splitting character
`υ`, a purely imaginary `ȷ ∈ E` and a finite idele `α`), the vectors of the Weil representation of a hermitian space of
rank `n` are the integrable functions on `𝔸_E^n` that are reproduced by twisted convolution with a *vacuum* (a Gaussian
at the infinite places times a twisted indicator of a lattice at the finite places), with the `L¹` norm: a Banach space
of data. It stands in for the Schwartz–Bruhat space of a polarisation and the Hilbert space of the Schrödinger model;
no comparison with them is used, and later steps use vectors of this space that are not Schwartz functions (Bochner
integrals of a vector against a discrete-series coefficient, Fock vectors of finite moment). On it the unitary group
acts continuously with operator norms bounded by powers of the norm of the group element, the theta functional is a
continuous linear form, and the moderate growth of theta kernels follows from these two facts alone.

The headline theorems are these.

(1) *The adelic Weil representation* (3.5, 3.6, 5.6). Let `E` be a CM field containing a primitive `5040`-th root of
unity, with Weil data, and `V` a hermitian space over `E` of rank `n` with an adelic frame. The unitary group `U(V)(𝔸)`
acts on the Banach space of data `𝒮(V)` by a jointly continuous representation `ω` that preserves the inner product,
transforms the Heisenberg operators by `ω(g)ϱ(x)ω(g)⁻¹ = ϱ(gx)` and has `‖ω(g)‖ ≤ C·∏_w ‖g_w‖^n·[Ô^n : Ô^n ∩ g_f⁻¹Ô^n]^{1/2}`;
a continuous linear form invariant under the Heisenberg operators of the rational vectors exists, is unique up to a
scalar, and is invariant under `ω(γ)` for every rational point `γ` of `U(V)`.

(2) *Convergence and adjointness of theta lifts* (6.4). For any jointly continuous representation of
`U(S)(𝔸) × U(T)(𝔸)` on a Banach space and any continuous functional invariant under the rational points of both
groups, the kernel `θ(ω(g, h)φ)` is bounded by `C‖φ‖(ht(g)·ht(h))^A`; the lift of a rapidly decreasing automorphic
function converges, has moderate growth, depends continuously on `φ`, and its Petersson adjoint is the descent.

(3) *Rapid decay* (6.6). The theta kernel of a unitary pair with a datum supported, at a set of places, on maps of
full rank decays rapidly in the height of the corresponding group, uniformly for real data of bounded moments.

(4) *Lifts between discrete-series types* (7.2, 7.3). For Harish-Chandra parameters in the block relation with large
gaps, the product of joint harmonics is an *edge*: with any finite datum, theta lifts carry bounded automorphic
functions fixed by the projector kernel of one type to functions fixed by that of the other, in both directions,
without Howe duality.

(5) *Seesaw, unfolding and periods* (7.4, 8.8, 8.9, 8.10). Proportionality of weighted sums of periods passes from
lifts to transposed lifts; one step of the unfolding of a Bessel or Fourier–Jacobi period of a theta lift; Fourier
coefficients of theta lifts along the centre of a unipotent radical as integrals over stabilisers; vanishing of all
descents of a form forces the vanishing of its periods over complementary unitary groups.

(6) *The unramified correspondence at split places* (9.3). At a place `w` split in `E/E⁺`, on a datum that is the
vacuum at `w`, the Hecke polynomial operators of the two groups satisfy
`P^T_w(X/α) = ∏_{l<k}(1 − q_w^l X)·P^S_{w̄}(q_w^k X/β)`, and theta lifts carry Hecke eigenforms with Hecke polynomial
`p` to Hecke eigenforms with polynomial `∏_{l<k}(1 − q_w^l αX)·p(q_w^k αβ⁻¹X)`.

There are nine layers. Layer 1 is the reproducing model of a Heisenberg datum on a locally compact abelian group and
its Weil operators. Layer 2 is the Fock model at the real places. Layer 3 builds the adelic Weil representation over a
CM field with Weil data, its theta functionals, its vacuum projections and the tame local Gauss sum. Layer 4 reads
vectors as theta functions. Layer 5 is the mixed model along Witt decompositions and the invariance of the theta
functional under rational points. Layer 6 is the Weil representation of a unitary dual pair and the laws of its theta
kernels. Layer 7 is theta lifts between forms: joint harmonics, edges, arrows, the seesaw for periods and the lift
between definite groups by jets. Layer 8 is graded spaces, Bessel groups, constant terms, unfolding and periods.
Layer 9 is Hecke operators at split places and their transfer through theta lifts.

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. The names of [ShortProof] occur only on that line.
- *The field.* `E` is a CM field with maximal totally real subfield `E⁺`, complex conjugation `y ↦ ȳ`, and a CM type
  `Φ`: for each infinite place `w` an embedding `τ_w : E → ℂ`. Its adele ring is `𝔸 = ℂ^Φ × 𝔸_f` (`E` is totally
  complex); `Ô ⊂ 𝔸_f` is the ring of integral finite adeles; conjugation acts on `𝔸` and on the finite places
  (`w ↦ w̄`). For a set `S` of finite places, `S̄` is the set of conjugates, `e_S ∈ 𝔸_f` the idempotent equal to `1` at
  the places of `S` and `0` elsewhere, and `S` is *conjugation-free* if `S ∩ S̄ = ∅`. `ψ` is the standard additive
  character of `𝔸/E` (the composite of `Tr_{E/ℚ}` with the standard character of `𝔸_ℚ/ℚ`), `ψ_f` its finite part,
  `q_w` the residue cardinality at `w` and `ϖ_w` a uniformiser. These objects and the condition that `E` contain a
  primitive `5040`-th root of unity are those of AdelicUnitaryGroupsAndAlgebraicModularForms §2.1; the facts on such
  fields that are used are cited where they are used (the one on inert places is 3.3 (d)).
- *Hermitian spaces and groups.* For a finite set `n` and signs `s : n → {±1}`, with `ε_s ∈ GL_n(𝔸)` equal to `diag(s)`
  at the infinite places and `1` at the finite places, the group `G_s` of the `g ∈ GL_n(𝔸)` with `g*ε_s g = ε_s` (the
  product of the groups `U(s)(ℂ)` at the infinite places and of `G_f = G_{f,n}`), `K₀ = G_f ∩ GL_n(Ô)`, levels, the
  *hermitian spaces* `V = (J, x)` of signature `s` (`J ∈ GL_n(E)` hermitian, `x*Jx = ε_s`: an adelic frame), their
  rational points `Γ_V` (the image of `U(J)(E)` under `γ ↦ x⁻¹γx`), the *standard* spaces (all signs `+1`, `x = 1`) and
  `I_n` (of rank `n`), the heights `ht(g) ≥ 1` (the inverse of the first minimum of the lattice of `V` moved by `g`, cut
  off at `1`), *automorphic*, *rapidly decreasing* and *moderate* functions on `G_s`, quotient measures and Petersson
  products are as in AdelicUnitaryGroupsAndAlgebraicModularForms §§1.1, 3.1, 4.2, 5.1, where `G_s` is written `G(s)` and
  is identified with `U(V)(𝔸)` through the frame. Here `Λ_V = x⁻¹E^n ⊂ 𝔸^n` is the lattice of *rational vectors*; the
  lattice of `V` whose first minimum gives the heights is the integral lattice of
  AdelicUnitaryGroupsAndAlgebraicModularForms §3.1, written `Λ_V` there.
- *Characters of `U(1)`.* *Automorphic characters* `a` of `U(1)` (characters of `U(1)(𝔸)/U(1)(E)`), their weights
  `γ = (γ_w)` and their tame parts are as in IdelicReciprocityCountsAndCyclotomicClassGroups §7.1. For `g ∈ G_s`,
  `det g ∈ U(1)(𝔸)`.
- *Theta values.* After 3.6, an element `f` of the space of data `𝒮(V)` is read through its *theta function*
  `y ↦ f(y) := θ_V(ϱ(y)f)` on `𝔸^n`; the integrable function that `f` is by definition is written `f°` when it is
  meant.
- *Matrices.* `A*` is the conjugate transpose; matrices act on columns; `M_{a×b}` are `a × b` matrices.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `β, e, M(β, e), ϱ, ⟨·,·⟩` | Heisenberg datum, vacuum, reproducing model, Heisenberg operators, inner product | 1.1 |
| `Δ, c, ω` | multiplier, cocycle, Weil operators | 1.1, 1.3 |
| `ε, U(ε), β_ε, ζ, A_i, B_i` | signs, `U(p, q)`, real Heisenberg datum, holomorphic coordinates, raising and lowering operators | 2.1 |
| `𝓕(ε), ω_ε, Δ_∞, v_P` | Fock space, its Weil representation, real multiplier, polynomial vector | 2.1 |
| `M_N(v)` | moments on Fock space | 2.3 |
| `υ, ȷ, α, c₀, ψ₀, κ_w` | Weil data, `(1 − ȷ⁻¹)/2`, `z ↦ ψ_f(ȷαᾱz)`, `(2π Im τ_w(ȷ))^{−1/2}` | 3.1 |
| `β_s, vac, μ` | adelic Heisenberg datum, adelic vacuum, its measure | 3.1 |
| `β_f, e_f, λ, Δ_f, χ_f, χ_𝔸` | finite datum, lattice vacuum, lattice measure, finite multiplier, `υ|·|^{−1/2}` | 3.2 |
| `𝒮(V), ω_V, Δ` | space of data, adelic Weil representation, adelic multiplier | 3.4, 3.5 |
| `realVec, finVec, v ⊗ f, pr_∞` | real and finite coordinates, real insertion, `f ↦ vac_∞ ⊗ f` | 3.4 |
| `ϱ_f, P^S, 𝒮_f(V)` | finite Heisenberg operators, vacuum projections, finite part | 3.4, 3.7 |
| `θ_V, f(y), f°` | theta functional, theta function of `f`, underlying function | 3.6 |
| `f₁ ⊠ f₂` | product of data along a splitting of coordinates | 3.8 |
| `Θ_f, J_a(f), u_γ` | entire theta function, jet series, real image | 4.1, 4.2 |
| `𝔞₀, T_γ, S_γ, {γ, γ′}` | the lattice `E ∩ αÔ`, translations, signed translations, Riemann form | 4.3 |
| `D = (k, l, ι), m(a, g₀), n(c, b)` | splitting along an isotropic frame, Levi and unipotent elements | 5.1 |
| `ρ_S, B_S, Ψ·f` | Schrödinger action above `S`, box, named datum | 5.3, 5.4 |
| `ev_D, f[x]` | zero term and slices | 5.5 |
| `Hom(S, T), ω_{a,b}, θ_{a,b}` | space of maps, Weil representation and theta kernel of a pair | 6.1 |
| `𝔪, Ψ̃, θ^{S,T}_{a,b}[Ψ, P]` | modulus, lift of a function modulo `𝔪`, kernel modulo `𝔪` | 6.1 |
| `L_φ y, L^t_φ` | theta lift, transposed lift | 6.4 |
| `Y = (X, string), R, U, T, 𝔢` | graded space, Bessel group, unipotent group, string map, shift | 8.1 |
| `Λ_x, Λ⁻, Λ⁺` | lattice of a finite point, its intersection with and projection to `X^⊥` | 8.2 |
| `ψ_U, 𝒲_φ` | unipotent character, equivariant function of an algebraic form | 8.6 |
| `T_{w,j}, P_w(X), (X; q)_k` | Hecke operators and Hecke polynomial at a split place, `∏_{l<k}(1 − q^l X)` | 9.1, 9.2 |

## Layer 1: The reproducing model of a Heisenberg datum

This layer is abstract: a locally compact abelian group with an alternating bicharacter and a vacuum. It covers the
real places (Layer 2), the finite adeles and the full adeles (Layer 3) at once.

### 1.1 Heisenberg data, vacua and the reproducing model

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

Let `W` be a second countable locally compact abelian group with a Haar measure `μ`.

- A *Heisenberg datum* on `W` is a continuous `β : W × W → ℂ`, multiplicative in each variable, with `|β| = 1` and
  `β(x, x) = 1`. A *representation* of `β` on a complex normed space `X` is a family of linear isometries `ϱ(x)`,
  `x ∈ W`, with `ϱ(x)ϱ(y) = β(x, y)ϱ(x + y)` and `(x, v) ↦ ϱ(x)v` jointly continuous.
- A *vacuum* for `(β, μ)` is a continuous, integrable, real-valued, even function `e` on `W` with `e(0) = 1` and
  `∫_W e(z)·β(z, y)·β(z + y, x)·e(x − y − z) dμ(z) = e(y)·e(x)` for all `x, y ∈ W`.
- The *reproducing model* `M(β, e)` is the space of integrable `v : W → ℂ` with
  `v(x) = ∫_W v(y)·β(y, x)·e(x − y) dμ(y)` for every `x`, with the norm `‖v‖ = ∫_W |v| dμ`. `W` acts on it by
  `(ϱ(y)v)(x) = β(y, x)·v(x − y)`; the *vacuum vector* is `e`; `⟨v, w⟩ = ∫_W conj(v)·w dμ`.
- Let a topological group `G` act continuously on `W` by automorphisms preserving `β` and `μ`. A *multiplier* is a
  continuous `Δ : G → ℂ` with `Δ(1) = 1` and `Δ(g⁻¹) = conj Δ(g)`; its *cocycle* is
  `c(g, h) = Δ(g)Δ(h)Δ((gh)⁻¹)·∫∫ e(hx)·e(ghy)·β(x, y)·e(x + y) dμ(x) dμ(y)`, and the *Weil operator* of `g` is
  `ω(g)v = Δ(g)·∫_W v(y)·ϱ(gy)e dμ(y)` (a Bochner integral in `M(β, e)`).

*Needs:* none.

[ShortProof], `Lib/Weil/Construction/HeisenbergModel` (`New.Heisenberg`, `New.Heisenberg.Rep`, `New.Heisenberg.IsVacuum`,
`New.Heisenberg.IsVacuum.Model`, `New.Heisenberg.IsVacuum.heisenbergRep`, `New.Heisenberg.IsVacuum.vacElem`,
`New.Heisenberg.IsVacuum.modelInner`, `New.Heisenberg.MultiplierAction`), `Lib/Weil/Construction/WeilOperators`
(`New.Heisenberg.IsVacuum.weilOp`)

### 1.2 Superposition and Schur's lemma in the reproducing model

*Origin:* adapted from the published theory of the Heisenberg representation (the uniqueness theorem of Stone and von
Neumann, and Schur's lemma): here for the `L¹` space of functions reproduced by a vacuum, on any group `W` of 1.1.

*Method of the formal proof:* the reproducing kernel `β(y, x)e(x − y)` has modulus at most one, which bounds values by
the norm and gives continuity by dominated convergence and completeness from `L¹`. Superposition is the identity of the
vacuum read as `∫ v(y)ϱ(y)e dμ(y) = v`. A bounded operator commuting with the Heisenberg operators passes inside the
superposition integral, and an invariant form is determined by its values on translates of the vacuum, which the
identity of the vacuum evaluates.

Let `β`, `μ`, `e` be as in 1.1, `M = M(β, e)`.

- (a) `∫|e|² dμ = 1` and `|e| ≤ 1`. `M` is a Banach space; each `v ∈ M` is continuous with `|v(x)| ≤ ‖v‖`; `ϱ` is a
  representation of `β` on `M`; `⟨ϱ(x)e, v⟩ = v(x)`.
- (b) *Superposition.* For every bounded linear map `T` from `M` to a Banach space, `T(v) = ∫ v(y)·T(ϱ(y)e) dμ(y)`;
  two bounded maps that agree on every `ϱ(y)e` are equal; `∫ v(y)·ϱ(y)w dμ(y) = w(0)·v` for `v, w ∈ M`. For every
  continuous `K : W → X` with `‖K‖` bounded there is a bounded `L : M → X` such that `A(L v) = B(v)` for every `v`
  whenever bounded `A` on `X` and `B` on `M` satisfy `A(K(y)) = B(ϱ(y)e)` for every `y`.
- (c) *Schur's lemma.* A bounded operator `T` on `M` that commutes with every `ϱ(y)` is the scalar `(Te)(0)`. A bounded
  sesquilinear form `B` on `M` with `B(ϱ(x)f, ϱ(x)g) = B(f, g)` for all `x` is `B(e, e)·⟨·,·⟩`; more generally, for an
  integrable family `B_z` over a measure space `(Z, ν)` whose integral is invariant in this sense,
  `∫ B_z(v, w) dν(z) = (∫ B_z(e, e) dν(z))·⟨v, w⟩`.

*Needs:* 1.1.

[ShortProof], `Lib/Weil/Construction/HeisenbergModel` (`New.Heisenberg.IsVacuum.integral_norm_sq_eq_one`,
`New.Heisenberg.IsVacuum.norm_le_one`, `New.Heisenberg.IsVacuum.norm_apply_le`, `New.Heisenberg.IsVacuum.continuous`,
`New.Heisenberg.IsVacuum.modelInner_heisenbergOp_vacElem`, `New.Heisenberg.IsVacuum.map_eq_integral`,
`New.Heisenberg.IsVacuum.hom_ext`, `New.Heisenberg.IsVacuum.integrated_eq_smul`, `New.Heisenberg.IsVacuum.exists_lift`,
`New.Heisenberg.IsVacuum.eq_smul_one_of_commute`, `New.Heisenberg.IsVacuum.integral_form_eq_mul_modelInner`,
`New.Heisenberg.IsVacuum.form_eq_mul_modelInner`)

### 1.3 Weil operators: the product rule up to the cocycle

*Origin:* particular to this proof: the Weil operators of an action that preserves a Heisenberg datum, defined from the
overlap with the vacuum, and their product rule up to the explicit cocycle of 1.1, in place of a comparison with the
Schrödinger model on a parabolic subgroup.

*Method of the formal proof:* `ω(g)` carries `ϱ(x)` to `ϱ(gx)` because `G` preserves `β` and `μ`; so
`ω((gh)⁻¹)ω(g)ω(h)` commutes with the Heisenberg operators, and by 1.2 (c) it is the scalar read off at the vacuum,
which is the double integral of the cocycle. `ω(g⁻¹)` is then both an inverse and an adjoint of `ω(g)`. Continuity:
`v ↦ ω(g)v` is Lipschitz with a constant independent of `g`, and `g ↦ ω(g)v` is continuous for fixed `v`.

Let `G` act on `W` as in 1.1, with multiplier `Δ` and cocycle `c`, and let `ω` be its Weil operators on `M = M(β, e)`.

- (a) `ω((gh)⁻¹)ω(g)ω(h) = c(g, h)` for all `g, h ∈ G`. If `c(g, 1) = 1` for every `g`, then
  `ω(g)ω(h) = c(g, h)·ω(gh)`, every `ω(g)` preserves `⟨·,·⟩`, and the `s` with `c(g, s) = 1` for every `g` form a
  subgroup of `G`.
- (b) If `c = 1`, then `g ↦ ω(g)` is a homomorphism (the *Weil representation*) and:
  `ω(g)ϱ(x) = ϱ(gx)ω(g)`; `⟨ω(g)v, ω(g)w⟩ = ⟨v, w⟩`;
  `(ω(g)v)(x) = Δ(g)·∫ v(y)·β(gy, x)·e(x − gy) dμ(y)`, which is `Δ(g)·v(g⁻¹x)` when `e(gy) = e(y)` for all `y`;
  `conj Δ(g)·(ω(g)e)(0) = 1`; `‖ω(g)‖ ≤ ‖e‖·|Δ(g)|`; and, if `G` is first countable, `(g, v) ↦ ω(g)v` is jointly
  continuous.

*Needs:* 1.1, 1.2.

[ShortProof], `Lib/Weil/Construction/WeilOperators` (`New.Heisenberg.IsVacuum.weilOp_inv_mul_weilOp_mul_weilOp`,
`New.Heisenberg.IsVacuum.weilOp_mul`, `New.Heisenberg.IsVacuum.modelInner_weilOp`,
`New.Heisenberg.IsVacuum.cocycleRadical`, `New.Heisenberg.IsVacuum.weilRep`,
`New.Heisenberg.IsVacuum.weilRep_heisenbergOp`, `New.Heisenberg.IsVacuum.weilRep_apply_eq_integral`,
`New.Heisenberg.IsVacuum.weilRep_apply_of_vacuum_smul`, `New.Heisenberg.IsVacuum.conj_delta_mul_weilRep_vacElem`,
`New.Heisenberg.IsVacuum.norm_weilRep_le`, `New.Heisenberg.IsVacuum.continuous_weilRep`)

### 1.4 Orthogonal sums, Wiener's bound and transport

*Origin:* particular to this proof: tensor products of reproducing models over an orthogonal sum, a bound for sums of a
bounded map over a lattice of Heisenberg translates (of the type of Wiener's amalgam bound), and transport of models
along isomorphisms.

*Method of the formal proof:* on an orthogonal sum the twisted convolution identity factors, which gives the vacuum,
the measure and the tensor product; the product rule follows by 1.2 (b) from its value on translates of the vacuum.
Wiener's bound: superposition writes `v` as an integral of translates of `u`, and the translates by a lattice meet a
compact set in finitely many points.

- (a) *Orthogonal sums.* Let `(W_i, β_i, μ_i, e_i)` (`i = 1, 2`) be as in 1.1 and `φ : W₁ × W₂ → W` an isomorphism of
  topological groups with `β(φ(x), φ(y)) = β₁(x₁, y₁)β₂(x₂, y₂)` and `e(φ(x)) = e₁(x₁)e₂(x₂)`. Then `e` is a vacuum
  for `β` and the image of `μ₁ × μ₂`, and this image is the Haar measure for which `e` is a vacuum. The tensor product
  `(v ⊗ w)(φ(x₁, x₂)) = v(x₁)w(x₂)` is a bounded bilinear map `M(β₁, e₁) × M(β₂, e₂) → M(β, e)` with
  `‖v ⊗ w‖ = ‖v‖·‖w‖`, `⟨v ⊗ w, v′ ⊗ w′⟩ = ⟨v, v′⟩⟨w, w′⟩`, `e₁ ⊗ e₂ = e` and
  `ϱ(φ(a, b))(v ⊗ w) = ϱ(a)v ⊗ ϱ(b)w`. If groups act on the three spaces with cocycle `1`, and `g` acts as `(g₁, g₂)`
  through `φ` with `Δ(g) = Δ₁(g₁)Δ₂(g₂)`, then `ω(g)(v ⊗ w) = ω(g₁)v ⊗ ω(g₂)w`. The restriction `r(u)(b) = u(φ(0, b))`
  is a bounded map `M(β, e) → M(β₂, e₂)` with `∫ v(y)·ϱ(φ(y, 0))u dμ₁(y) = v ⊗ r(u)`.
- (b) *Wiener's bound.* Let `T` be a bounded map from `M(β, e)` to a Banach space, `u ∈ M(β, e)` with `u(0) ≠ 0`,
  `κ : W₁ → W` a continuous homomorphism from a locally compact Hausdorff group, `g` integrable on `W₁` and
  `t : W → W₁` with `‖T(ϱ(z + κ(x))u)‖ = ‖g(t(z) + x)‖` for all `z, x`. Then there are a compact `B ⊂ W₁` and `C ≥ 0`
  such that for every additive group `I`, every homomorphism `φ : I → W₁` and every `v`:
  `Σ_{i∈I} ‖T(ϱ(κ(φ(i)))v)‖ ≤ #φ⁻¹(B)·C·‖v‖`.
- (c) *Transport.* Let `φ : W′ → W` be an isomorphism of topological groups and `σ` the identity or complex
  conjugation, with `σ(β(φ(x), φ(y))) = β′(x, y)` and `e(φ(x)) = e′(x)`. Then `v ↦ σ ∘ v ∘ φ` is a norm-preserving
  `σ`-semilinear map `M(β, e) → M(β′, e′)`.

*Needs:* 1.1–1.3.

[ShortProof], `Lib/Weil/Construction/WeilOperators` (`New.Heisenberg.OrthogonalSum`,
`New.Heisenberg.OrthogonalSum.isVacuum`, `New.Heisenberg.OrthogonalSum.measurePreserving_equiv`,
`New.Heisenberg.OrthogonalSum.tmul`, `New.Heisenberg.OrthogonalSum.modelInner_tmul`,
`New.Heisenberg.OrthogonalSum.norm_tmul`, `New.Heisenberg.OrthogonalSum.tmul_vacElem`,
`New.Heisenberg.OrthogonalSum.heisenbergOp_tmul`, `New.Heisenberg.OrthogonalSum.weilRep_tmul`,
`New.Heisenberg.OrthogonalSum.exists_restriction`, `New.Heisenberg.IsVacuum.wiener_bound`,
`New.Heisenberg.IsVacuum.transport`, `New.Heisenberg.IsVacuum.norm_transport`)

## Layer 2: The Fock model at the real places

At a real place the Heisenberg datum is that of `ℂ^ι` with a signed hermitian form, the vacuum is the Gaussian, and the
group is `U(p, q)`. The Fock space here is an `L¹` space of functions reproduced by the Gaussian; it stands in for the
Hilbert space of entire functions and the Bargmann transform of ThetaKernelsForUnitaryDualPairs §3.45, and no
comparison with them is used.

### 2.1 The Fock model of `U(ε)` and the triviality of its cocycle

*Origin:* adapted from Bargmann (1961), the Fock space, and Kashiwara and Vergne (1978) and Howe (1989), the Fock model
of the oscillator representation: here the `L¹` space of functions on `ℂ^ι` reproduced by the Gaussian, for the group
`U(ε)` of a sign vector in place of the metaplectic group, with the multiplier `conj det(u₋₋)` and its trivial
cocycle.

*Method of the formal proof:* the identity of the vacuum and the cocycle identity are Gaussian integrals over `ℂ^ι` and
`ℂ^ι × ℂ^ι`, computed by completing the square; a translate of the vacuum is `e(x)e(y)exp(Σ_i conj ζ(y)_i ζ(x)_i)`, so
polynomial vectors are derivatives of translates of the vacuum along the Heisenberg action; external products are
1.4 (a).

Let `ι` be finite, `ε : ι → {±1}` (also the matrix `diag(ε)`), `U(ε) = {g ∈ GL_ι(ℂ) : g*εg = ε}` acting on `ℂ^ι` by
matrices. Put `β_ε(x, y) = exp((y*εx − x*εy)/2)`, `e(x) = exp(−|x|²/2)`, `μ = π^{−|ι|}·Lebesgue`,
`ζ(x)_i = x̄_i` if `ε_i = 1` and `ζ(x)_i = x_i` if `ε_i = −1`, and `Δ_∞(u) = conj det(u₋₋)` with `u₋₋` the block of `u`
on `{i : ε_i = −1}`. Let `A_i = X_i`, `B_i = ∂_i` if `ε_i = 1` and `A_i = −∂_i`, `B_i = X_i` if `ε_i = −1`, as operators
on polynomials in variables indexed by `ι`.

- (a) `e` is a vacuum for `(β_ε, μ)`, and `β_ε(y, x)·e(x − y) = e(x)e(y)·exp(Σ_i conj(ζ(y)_i)·ζ(x)_i)`.
- (b) `U(ε)` preserves `β_ε` and `μ`, and `Δ_∞` is a multiplier with trivial cocycle:
  `Δ_∞(g)Δ_∞(h)Δ_∞((gh)⁻¹)·∫∫ e(hx)e(ghy)β_ε(x, y)e(x + y) dμ(x) dμ(y) = 1` for all `g, h ∈ U(ε)`. Moreover
  `|Δ_∞(u)| ≤ ‖u‖^{|ι|}` for the operator norm of the standard hermitian norm. By 1.3 the Weil operators form a
  jointly continuous representation `ω_ε` of `U(ε)` on the *Fock space* `𝓕(ε) := M(β_ε, e)` preserving `⟨·,·⟩`, with
  `‖ω_ε(u)‖ ≤ ‖e‖·‖u‖^{|ι|}`.
- (c) For every polynomial `P`, `v_P(x) := P(ζ(x))·e(x)` lies in `𝓕(ε)`; `P ↦ v_P` is injective; and `t ↦ ϱ(tx)v_P`
  (`t ∈ ℝ`) is differentiable at `0` in `𝓕(ε)` with derivative `v_{D_x P}`, `D_x = Σ_i (x_i A_i − conj(x_i ε_i) B_i)`.
- (d) *External products.* For a finite set `T`, `(⊗_τ v_τ)(x) = ∏_τ v_τ(x_{τ,·})` is a bounded multilinear map
  `∏_τ 𝓕(ε) → 𝓕(ε ∘ pr₂)` (signs on `T × ι`) with `⟨⊗v_τ, ⊗w_τ⟩ = ∏_τ ⟨v_τ, w_τ⟩` and `⊗_τ v_{P_τ} = v_{∏_τ P_τ}` (each
  `P_τ` in the variables `(τ, ·)`); for block-diagonal `u = (u_τ)`, `Δ_∞(u) = ∏_τ Δ_∞(u_τ)` and
  `ω(u)(⊗v_τ) = ⊗ω(u_τ)v_τ`. Along a splitting `ι = ι₁ ⊔ ι₂` compatible with the signs, `v_P ⊗ v_Q = v_{PQ}`.

*Needs:* 1.1–1.4.

[ShortProof], `Lib/Weil/Fock/Basic` (`New.Fock.realHeisenberg`, `New.Fock.realVac`, `New.Fock.isVacuum_realVac`,
`New.Fock.beta_mul_realVac`, `New.Fock.realMultiplier`, `New.Fock.norm_realMultiplier_le`,
`New.Fock.realMultiplier_mul_integral_eq_one`, `New.Fock.realAction`, `New.Fock.fockSpace`, `New.Fock.realWeil`,
`New.Fock.polyVector`, `New.Fock.polyVector_apply`, `New.Fock.polyVector_injective`,
`New.Fock.hasDerivAt_realHeisenbergOp`, `New.Fock.piTensor`, `New.Fock.fockInner_piTensor`,
`New.Fock.piTensor_polyVector`, `New.Fock.realMultiplier_blockU`, `New.Fock.realWeil_piTensor`,
`New.Fock.realBoxProd_polyVector`), `Lib/Weil/Fock/OscillatorPair` (`New.Fock.norm_realWeil_le`)

### 2.2 Polynomial vectors: the Fischer pairing, density and the derivative

*Origin:* adapted from Bargmann (1961) and Kashiwara and Vergne (1978) and Howe (1989) (ThetaKernelsForUnitaryDualPairs
§3.45): here on the Fock space of 2.1: the inner product of polynomial vectors as the Fischer pairing, density of the
polynomial vectors for the `L¹` norm, and the derivative of `ω_ε` on polynomial vectors.

*Method of the formal proof:* differentiating `ω(u)ϱ(x) = ϱ(ux)ω(u)` along `x` gives commutation rules that move `A_j`
and `B_j` across `ω(u)`; with `u = 1` they make `X_i` adjoint to `∂_i`; density follows from 1.2 (b) and the
approximation of 2.3; the derivative is computed on translates of the vacuum and transported by the commutation rules.

With the notation of 2.1, for polynomials `P, Q`:

- (a) `(ω_ε(u)e)(0) = det(u₋₋)⁻¹`.
- (b) `⟨v_Q, ω_ε(u)v_{A_jP}⟩ = Σ_i u_{ij}ε_i·⟨v_{B_iQ}, ω_ε(u)v_P⟩` and
  `ε_j·⟨v_Q, ω_ε(u)v_{B_jP}⟩ = Σ_i conj(u_{ij})·⟨v_{A_iQ}, ω_ε(u)v_P⟩`.
- (c) `⟨v_{X_iP}, v_Q⟩ = ⟨v_P, v_{∂_iQ}⟩`, and `⟨v_P, v_Q⟩ = (P̄(∂)Q)(0)` with `P̄` the polynomial with conjugate
  coefficients; in particular `⟨v_{X^μ}, v_{X^{μ′}}⟩ = μ!` if `μ = μ′` and `0` otherwise.
- (d) The polynomial vectors are dense in `𝓕(ε)`.
- (e) If `γ : ℝ → U(ε)` has `γ(0) = 1` and is differentiable at `0` with derivative `Y`, then `t ↦ ω_ε(γ(t))v_P` is
  differentiable at `0` with derivative `v_{dω(Y)P}`, `dω(Y) = Σ_{a,b} Y_{ab}·A_aB_b`.

*Needs:* 1.2, 2.1, 2.3.

[ShortProof], `Lib/Weil/Fock/PolynomialVectors` (`New.Fock.realWeil_vacVector_apply_zero`,
`New.Fock.fockMatrixCoeff_raiseOp`, `New.Fock.fockMatrixCoeff_lowerOp`, `New.Fock.fockInner_X_mul`,
`New.Fock.fockInner_polyVector`, `New.Fock.fockInner_polyVector_monomial`, `New.Fock.denseRange_polyVector`,
`New.Fock.hasDerivAt_realWeil`)

### 2.3 Moments and approximation by polynomial vectors

*Origin:* particular to this proof: weighted `L¹` norms on the Fock space of 2.1 in place of Schwartz seminorms, with
simultaneous approximation by polynomial vectors in all of them and a bound for linear forms that change little under
short Heisenberg translations.

*Method of the formal proof:* the bounds for translates and for `ω_ε(u)` follow from `1 + ‖y + z‖ ≤ (1 + ‖y‖)(1 + ‖z‖)`
and the integral formula of 1.3 (b); Minkowski's inequality for Bochner integrals; approximation by truncating the
exponential series of the reproducing kernel inside the superposition formula; the bound for linear forms by Taylor
expansion of `ℓ(ϱ(y)v_P)` along the Heisenberg derivatives of 2.1 (c) and induction on `N`.

For `v ∈ 𝓕(ε)` and `N ∈ ℕ` let `M_N(v) = ∫ (1 + ‖y‖)^N·|v(y)| dμ(y) ∈ [0, ∞]` (`‖y‖` the maximum norm on `ℂ^ι`); `v`
has *finite moments* if `M_N(v) < ∞` for all `N`.

- (a) `M_0(v) = ‖v‖`; `M_N(ϱ(y)v) ≤ (1 + ‖y‖)^N·M_N(v)`; `M_N(v_P) < ∞` for every polynomial `P` (so `e` has finite
  moments); `M_N(ω_ε(u)v) ≤ |Δ_∞(u)|·(1 + ‖u‖)^N·M_N(e)·M_N(v)` (operator norm of `u` for the maximum norm); for a
  measurable family `F` on a σ-finite measure space, `M_N(∫ F) ≤ ∫ M_N(F)`, and if `∫ M_N(F) < ∞` for every `N`, then
  `F` is Bochner integrable and `∫ F` has finite moments.
- (b) If `v` has finite moments, there are polynomials `P_k` with `M_N(v − v_{P_k}) → 0` as `k → ∞`, for every `N`.
- (c) Let `ℓ` be a continuous linear form on `𝓕(ε)`. If `|ℓ(ϱ(z)e)| ≤ S·(1 + ‖z‖)^N` for all `z`, then
  `|ℓ(v)| ≤ S·M_N(v)`. For each `N` there is `C` such that for every `t ≥ 0`, every `ℓ` and every `v`:
  `|ℓ(v)| ≤ C·‖ℓ‖·t^N·M_N(v)`, provided (when `t < 1`) that `|ℓ(f)| ≤ B` holds for every `f` and `B` with
  `|ℓ(f) − ℓ(ϱ(y)f)| ≤ B` for all `‖y‖ ≤ t`.

*Needs:* 1.2, 1.3, 2.1.

[ShortProof], `Lib/Weil/Fock/WeightedNorms` (`New.Fock.fockMoment`, `New.Exchange.IsSchwartzVector`,
`New.Fock.fockMoment_zero`, `New.Fock.fockMoment_realHeisenbergOp_le`, `New.Fock.enorm_le_mul_fockMoment`,
`New.Fock.fockMoment_polyVector_ne_top`, `New.Fock.isSchwartzVector_vacVector`, `New.Fock.fockMoment_integral_le`,
`New.Fock.isSchwartzVector_integral`, `New.Fock.exists_tendsto_fockMoment`, `New.Fock.fockMoment_realWeil_le`,
`New.Fock.exists_norm_realHeisenbergOp_polyVector_le`, `New.Fock.exists_enorm_le_mul_fockMoment_of_norm_sub_le`)

### 2.4 Harmonic matrix coefficients and oscillator pairs on matrices

*Origin:* adapted from Kashiwara and Vergne (1978) and Howe (1989), the Fock model of the oscillator representation and
its dual pairs (ThetaKernelsForUnitaryDualPairs §3.45): here on the Fock space of 2.1: the coefficients between
polynomial vectors killed by the mixed second derivatives, their positivity at positive definite elements, and the two
commuting determinant-twisted actions on matrices with their growth and derivatives.

*Method of the formal proof:* Euler's identity and 2.2 (b) give an induction on the degree that reduces
`⟨v_Q, ω(u)v_P⟩` to `Q = 1`, which 2.2 (a) and the substitution by `C(u)` evaluate; positivity at a positive definite
`z` because the coefficient becomes a Fischer pairing of `v_P` with a positive substitution of itself; on matrices,
`x ↦ hxg⁻¹` is the Kronecker product `h ⊗ (g⁻¹)ᵀ`, whose norm is at most `‖g‖·‖h‖`, and the derivatives come from
2.2 (e).

With the notation of 2.1, for `u ∈ U(ε)` let `C(u) = P₊uP₊ + P₋ūP₋`, with `P_±` the coordinate projections onto
`{i : ε_i = ±1}` and `ū` the entrywise conjugate.

- (a) Let `d` be a labelling of `ι` with `u_{ij} = 0` whenever `d_i ≠ d_j`, and `P, Q` polynomials with
  `∂_i∂_jP = ∂_i∂_jQ = 0` whenever `d_i = d_j` and `ε_i ≠ ε_j`. Then `C(u)` is invertible and
  `⟨v_Q, ω_ε(u)v_P⟩ = det(u₋₋)⁻¹·⟨v_{Q′}, v_P⟩`, where `Q′` is `Q` after the substitution
  `X_b ↦ Σ_t (C(u)⁻¹)_{tb}X_t`.
- (b) *Oscillator pairs.* Let `R`, `C` be finite with signs `ε` on `R` and `ε′` on `C`, and give `R × C` the signs
  `η(r, c) = ε_rε′_c`; let `A_{(r,c)}`, `B_{(r,c)}` be the operators of 2.1 for `η`. For `γ, γ′ ∈ ℤ` put
  `π(h) = det(h)^γ·ω_η(x ↦ hx)` for `h ∈ U(ε)` and `π′(g) = det(g)^{γ′}·ω_η(x ↦ xg⁻¹)` for `g ∈ U(ε′)`, acting on the
  Fock space of `R × C` matrices. Then `π` and `π′` are commuting, strongly continuous representations preserving the
  bounded positive definite form `⟨·,·⟩`, with `‖π(h)‖ ≤ c·‖h‖^{|R×C|}` and `‖π′(g)‖ ≤ c·‖g‖^{|R×C|}`. On polynomial
  vectors the derivative of `π` is `E_{ab} ↦ Σ_c A_{(a,c)}B_{(b,c)} + γδ_{ab}` and that of `π′` is
  `E_{ab} ↦ −Σ_r A_{(r,b)}B_{(r,a)} + γ′δ_{ab}`, in the sense of 2.2 (e).
- (c) *Positivity.* For `z ∈ U(ε)` positive definite and `P ≠ 0` with no monomial containing two variables of one
  column from rows of opposite signs, `⟨v_P, π(z)v_P⟩ > 0`; the same for `π′`, with rows and columns exchanged.

*Needs:* 2.1, 2.2; HolomorphicDiscreteSeriesOfUnitaryGroups §8.1 (b), (d) (oscillator actions, termwise harmonic
polynomials).

[ShortProof], `Lib/Weil/Fock/OscillatorPair` (`New.Fock.complexLinearPart`, `New.Fock.det_complexLinearPart`,
`New.Fock.fockMatrixCoeff_eq_fockInner`, `New.Fock.pairHom`, `New.Fock.norm_pairHom_le`, `New.Fock.detTwist`,
`New.Fock.isUnitaryRep_detTwist`, `New.Fock.isDerivedAction_detTwist`, `New.Fock.fockInner_detTwist_pos`,
`New.OscillatorRep`, `New.OscillatorPair`, `New.Fock.oscillatorRep_detTwist_inr`, `New.Fock.oscillatorRep_detTwist_inl`,
`New.Fock.oscillatorPair_detTwist`)

## Layer 3: The adelic Weil representation of a hermitian space

Over a CM field with Weil data, the adeles `𝔸^n` split as the orthogonal sum of the Fock coordinates at the infinite
places and the finite adeles. The finite datum carries a lattice vacuum and a multiplier read from the lattice
`Ô^n ∩ g⁻¹Ô^n`; its cocycle is a Gauss sum, and it is trivial. With 2.1 this gives the Weil representation of the
adelic unitary group on the Banach space of data, its theta functional, and the finite part spanned by translates of
the vacuum.

### 3.1 Weil data and the adelic Heisenberg datum

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

Let `E` be a CM field with CM type `Φ` that contains a primitive `5040`-th root of unity.

- A *splitting character* of `E` is a unitary character `υ` of `𝔸^×/E^×` with `υ(x̄) = υ(x)⁻¹`, and with
  `υ(x) = ∏_{w∈Φ} x_w/|x_w|` whenever the finite part of `x` is a unit of `Ô`.
- *Weil data* `(ȷ, α, υ)` for `E` are: `ȷ ∈ E` with `ȷ̄ = −ȷ` and `Im τ_w(ȷ) > 0` at every infinite place; a finite idele
  `α` with `ord_w(ȷαᾱ) = −ord_w(𝔇_E)` at every finite place `w` (`𝔇_E` the different); a splitting character `υ`; such
  that `c₀ := (1 − ȷ⁻¹)/2` is an algebraic integer and `υ(ϖ_w) = −1` at every finite place `w = w̄`. Put
  `ψ₀(z) = ψ_f(ȷαᾱz)` for `z ∈ 𝔸_f`, `κ_w = (2π Im τ_w(ȷ))^{−1/2}`, and `χ_𝔸(x) = υ(x)|x|^{−1/2}` on ideles.
- For signs `s` on a finite set `n`, the *adelic Heisenberg datum* on `𝔸^n` is `β_s(x, y) = ψ(½ȷ·y*ε_s x)`, and the
  *adelic vacuum* is
  `vac(x) = exp(−π Σ_{i,w} Im τ_w(ȷ)·|x_{i,w}|²)·ψ_f(−¼·x_f*x_f)` if `x_f ∈ αÔ^n`, and `vac(x) = 0` otherwise.
  The measure `μ` on `𝔸^n` is the image of `π^{−|Φ×n|}·Lebesgue × λ` (`λ` the Haar measure on `𝔸_f^n` with
  `λ(Ô^n) = 1`) under `(y, z) ↦ (κ_w y_{w,i}, αz)`, the *real and finite coordinates*.
- `realVec(y)` is the adelic vector with components `κ_w y_{w,i}` at the infinite places and finite part `0`
  (`y ∈ ℂ^{Φ×n}`); `finVec(z) = (0, αz)` for `z ∈ 𝔸_f^n`; the *finite image* of `γ ∈ E^n` is `α⁻¹γ ∈ 𝔸_f^n`; and the
  *semicharacter* is `semi(z) = ψ₀(½c₀·z*z)`.

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §2.1 (adeles, standard character, 5040 condition);
IdelicReciprocityCountsAndCyclotomicClassGroups §7.2 (existence of splitting characters).

[ShortProof], `Lib/Weil/Construction/WeilData` (`New.SplittingChar`, `New.WeilData`, `New.WeilData.scaleIdele`,
`New.WeilData.traceOne`, `New.vacuumFn`, `New.vacuumFn_eq_exp_mul_ite`, `New.adelicHeisenberg`),
`Lib/Weil/Construction/FiniteMultiplier` (`New.stdLattice.selfDualAddChar`, `New.stdLattice.semichar`, `New.chiAdelic`),
`Lib/Weil/Construction/AdelicRepresentation` (`New.vacuumMeasure`, `New.realVec`, `New.finVec`)

### 3.2 The finite datum, its lattice vacuum and the finite multiplier

*Origin:* particular to this proof: the Heisenberg datum of the finite adeles of a CM field with Weil data, the
self-duality of `Ô` for `ψ₀`, the lattice vacuum, and the multiplier `Δ_f` read from the lattice `Ô^n ∩ g⁻¹Ô^n`, with its
laws on the finite unitary group.

*Method of the formal proof:* self-duality from the order of `ȷαᾱ` at each place; the identity of the vacuum is an
average of characters over `Ô^n`; the multiplier is computed through elementary divisors place by place (a saturating
matrix is moved to diagonal form by integral matrices), which gives its values, the measure of `Ô^n ∩ g⁻¹Ô^n`, and,
for unitary `g`, the symmetry between `g` and `(g*)⁻¹`.

Let `E` carry Weil data and let `n` be finite. Put `β_f(x, y) = ψ₀(½y*x)` on `𝔸_f^n`, `e_f(z) = semi(z)` for
`z ∈ Ô^n` and `e_f(z) = 0` otherwise, and let `λ` be the Haar measure with `λ(Ô^n) = 1`.

- (a) `z ∈ Ô` if and only if `ψ₀(zu) = 1` for every `u ∈ Ô`. `e_f` is a vacuum for `(β_f, λ)`.
- (b) *The multiplier.* For `g ∈ GL_n(𝔸_f)` call `u ∈ GL_n(𝔸_f)` *saturating* if `u` and `gu` are integral and
  `u⁻¹ = l + mg` with `l, m` integral; then `uÔ^n = Ô^n ∩ g⁻¹Ô^n`, saturating `u` exist, and
  `Δ_f(g) := χ_𝔸(det u)` (the idele with finite part `det u` and infinite part `1`) does not depend on the choice of
  `u`. For `k, k′ ∈ GL_n(Ô)` and `d` diagonal, `Δ_f(kdk′) = ∏_i χ_𝔸(δ_i)` with `δ_iÔ = Ô ∩ d_i⁻¹Ô`;
  `Δ_f(g⁻¹) = χ_𝔸(det g)·Δ_f(g)`; `λ(Ô^n ∩ g⁻¹Ô^n) = |Δ_f(g)|⁻²`; `Δ_f` is multiplicative on block-diagonal matrices
  and on products of matrices that differ from `1` at disjoint sets of places.
- (c) *On the unitary group.* For `g ∈ G_f`: `Δ_f(g⁻¹) = conj Δ_f(g)`; `Δ_f(g) = 1` if `g ∈ K₀`;
  `|Δ_f(g)|² = [Ô^n : Ô^n ∩ g⁻¹Ô^n]`; `υ(det g)·Δ_f(g) = conj Δ_f(g)`; and if `S` is conjugation-free and `g` is `1`
  outside `S ∪ S̄`, then `Δ_f(g) = |Δ_f(a)|²·conj χ_𝔸(det a)`, where `a ∈ GL_n(𝔸_f)` equals `g` at the places of `S`
  and `1` elsewhere.

*Needs:* 1.1, 1.2, 3.1; AdelicUnitaryGroupsAndAlgebraicModularForms §§3.1, 3.2 (b) (`G_f`, `K₀`, supports of
elements).

[ShortProof], `Lib/Weil/Construction/FiniteMultiplier` (`New.stdLattice.forall_selfDualAddChar_mul_eq_one_iff`,
`New.stdLattice.finVac`, `New.stdLattice.finHeisenberg`, `New.latticeMeasure`, `New.stdLattice.isVacuum_finVac`,
`New.IsSaturating`, `New.IsSaturating.exists_isSaturating`, `New.IsSaturating.glMultiplier_eq`, `New.glMultiplier`,
`New.glMultiplier_mul_diagGL_mul`, `New.glMultiplier_inv`, `New.latticeMeasure_inter_eq_glMultiplier`,
`New.glMultiplier_fromBlocks`, `New.glMultiplier_mul_of_map_evalAt_eq_one`, `New.finMultiplier`, `New.finMultiplier_inv`,
`New.finMultiplier_eq_one_of_mem`, `New.norm_finMultiplier_sq`, `New.upsilon_mul_finMultiplier`,
`New.finMultiplier_eq_of_supportedOn`)

### 3.3 The finite cocycle is a Gauss sum and is trivial

*Origin:* adapted from Kudla (1994) and Harris, Kudla and Sweet (1996), the splittings of the Weil representation over
unitary groups (ThetaKernelsForUnitaryDualPairs §4.4a): here at all finite places at once, as the triviality of the
cocycle of the multiplier `Δ_f` of 3.2 on the lattice vacuum, for CM fields with a primitive `5040`-th root of unity.

*Method of the formal proof:* the double integral of the cocycle is, after multipliers, a Gauss sum over a finite
`Ô`-module; the cocycle has modulus one and is `1` when one argument lies in `K₀`; the `s` with `c_f(·, s) = 1` form a
subgroup containing `K₀`, and `G_f` is generated by `K₀` and the elements that are `1` outside a pair `{w, w̄}`. At a
split place every term of the Gauss sum is `1` and the ratio of multipliers is nonnegative. At an inert place
`q_w = r²` with `r ≡ 3 (mod 4)` by (d), the multipliers are powers of `−r`, and a lemma on sums of roots of unity over orbits
of size four (multiplication by a fourth root of unity) fixes the sign by a congruence modulo `4`. For (d): `E` contains
`√−1` and an algebraic integer of trace `1` and norm `2` over `E⁺`, so a place `w = w̄` does not lie above `2`, and
conjugation induces on its residue field an automorphism of order two that moves `√−1`; hence `q_w = r²` and `−1` is
not a square in the field with `r` elements.

Let `E` carry Weil data. For `g, s ∈ G_f` put
`c_f(g, s) = Δ_f(g)Δ_f(s)Δ_f((gs)⁻¹)·∫∫ e_f(sx)·e_f(gsy)·β_f(x, y)·e_f(x + y) dλ(x) dλ(y)`.

- (a) There are a finite `Ô`-module `Q` and `γ : Q → 𝔸_f` with `c_f(g, s)Δ_f(s⁻¹)Δ_f(gs) = (Σ_{q∈Q} ψ₀(γ(q)))·Δ_f(g)`,
  `ψ₀(γ(tq)) = ψ₀(t̄t·γ(q))` for `t ∈ Ô`, and `tQ = 0` whenever `t·s⁻¹` is integral.
- (b) `|c_f(g, s)| = 1`, and `c_f(g, s) = 1` if `s ∈ K₀`.
- (c) `c_f(g, s) = 1` for all `g, s ∈ G_f`: the action of `G_f` on `𝔸_f^n` with multiplier `Δ_f` has trivial cocycle.
- (d) *Inert places.* For every finite place `w` with `w̄ = w`, `q_w = r²` for an integer `r ≡ 3 (mod 4)`. (Only the
  primitive `5040`-th root of unity in `E` is used.)

*Needs:* 1.3, 3.2; AdelicUnitaryGroupsAndAlgebraicModularForms §3.2 (b) (generation of `G_f`).

[ShortProof], `Lib/Weil/Construction/FiniteCocycle` (`New.stdLattice.finProjAction`,
`New.stdLattice.exists_gauss_sum_finProjAction`, `New.stdLattice.finProjAction_cocycle_eq_one_of_mem`,
`New.stdLattice.norm_cocycle_eq_one`, `New.stdLattice.finMultiplier_div_nonneg_of_isSplit`,
`New.stdLattice.exists_finMultiplier_eq_neg_pow`, `New.stdLattice.eq_one_of_gauss_sum_of_inert`,
`New.stdLattice.mem_cocycleRadical`, `New.stdLattice.finAction`), `Lib/Weil/Construction/FiniteMultiplier`
(`New.eq_one_of_apply_apply_eq_neg`), `Lib/General/NumberTheory/FrobeniusOrbits`
(`New.HasPrimitiveRoot5040.exists_sq_eq_q_of_inert`)

### 3.4 The Banach space of data

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the real and finite coordinates make `(𝔸^n, β_s, vac, μ)` the orthogonal sum
(1.4 (a)) of the Fock datum of 2.1 for the signs `(w, i) ↦ s_i` and the finite datum of 3.2.

Let `E` carry Weil data and `V = (J, x)` be a hermitian space of signature `s` on `n`.

- The *space of data* of `V` is `𝒮(V) := M(β_s, vac)` for the measure `μ` of 3.1: the integrable functions on `𝔸^n`
  reproduced by `β_s(y, x)vac(x − y)`, with the `L¹` norm. It depends on `s` only; `vac = vac_V`, `ϱ` and `⟨·,·⟩` are
  those of 1.1.
- The *adelic multiplier* of `g ∈ G_s` is `Δ(g) = ∏_w Δ_∞(g_w)·Δ_f(g_f)`, with `Δ_∞` of 2.1 for the signs `s` and `Δ_f`
  of 3.2; `ω_V(g)` is the Weil operator (1.1) of `g` acting on `𝔸^n` by its matrix.
- *Real insertion.* For `v` in the Fock space `𝓕(s ∘ pr₂)` of `ℂ^{Φ×n}` and `f ∈ 𝒮(V)`,
  `v ⊗ f := ∫ v(y)·ϱ(realVec(y))f dμ_∞(y)` (`μ_∞ = π^{−|Φ×n|}·Lebesgue`), and `pr_∞(f) := e_∞ ⊗ f` with `e_∞` the Gaussian.
- *Finite operators.* `ϱ_f(z) := semi(z)·ϱ(finVec(z))` for `z ∈ 𝔸_f^n`; for a set `S` of finite places,
  `P^S f := ∫_{Ô^n} ϱ_f(e_{S∪S̄}·y)f dλ(y)`; the *finite part* `𝒮_f(V)` is the linear span (not its closure) of the
  vectors `ϱ_f(z)vac`, `z ∈ 𝔸_f^n`.

The space `𝒮(V)` stands in for the Schwartz–Bruhat space of a polarisation and the Schrödinger model of
ThetaKernelsForUnitaryDualPairs §4.4a. It is a Banach space (1.2), its vectors are not assumed smooth or rapidly
decreasing, and the later layers use vectors of it that are not known to be Schwartz functions; no comparison with the
Schwartz model is used.

*Needs:* 1.1, 1.4, 2.1, 3.1, 3.2; AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 (hermitian spaces, the group
`G_s`).

[ShortProof], `Lib/Weil/Construction/AdelicRepresentation` (`New.adelicSum`, `New.weilMultiplier`, `New.vacuumMeasure`,
`New.adelicAction`, `New.𝒮`, `New.Space.ϱ`, `New.Space.ω`, `New.Space.dataInner`, `New.Space.vacElem`,
`New.Space.integrated`, `New.Space.finHeisenbergOp`, `New.Space.projOn`, `New.Space.projReal`),
`Lib/Weil/Construction/VacuumProjections` (`New.Space.finitePart`)

### 3.5 The adelic Weil representation

*Origin:* adapted from Kudla (1994) and Harris, Kudla and Sweet (1996), the global Weil representation of a unitary
group assembled from local splittings (ThetaKernelsForUnitaryDualPairs §4.4a): here for one unitary group of a
hermitian space over a CM field with Weil data, on the space of data of 3.4, built without a polarisation and
normalised by its coefficient against the vacuum.

*Method of the formal proof:* the cocycle of `Δ` is the product of the real cocycle, trivial by 2.1 (b), and the
finite one, trivial by 3.3 (c), through the orthogonal sum of 3.4; then 1.3 applies. The bound for `|Δ|` is 2.1 (b) and
3.2 (c).

Let `E` carry Weil data and `V` be a hermitian space of signature `s` on `n`.

- (a) `vac` is a vacuum for `(β_s, μ)`, and `G_s`, acting on `𝔸^n` by matrices with multiplier `Δ`, has trivial cocycle.
- (b) `ω_V` is a homomorphism from `G_s` to the bounded operators on `𝒮(V)`; `(g, f) ↦ ω_V(g)f` is jointly continuous;
  `ω_V(g)` preserves `⟨·,·⟩`; `ω_V(g)ϱ(x) = ϱ(gx)ω_V(g)`; `⟨vac, ω_V(g)vac⟩ = (conj Δ(g))⁻¹`; and
  `‖ω_V(g)‖ ≤ ‖vac‖·|Δ(g)| ≤ ‖vac‖·∏_w ‖g_w‖^n·[Ô^n : Ô^n ∩ g_f⁻¹Ô^n]^{1/2}`, with `‖g_w‖` the operator norm for the
  standard hermitian norm on `ℂ^n`.
- (c) Two bounded maps on `𝒮(V)` that agree on all `ω_V(g)ϱ(y)vac`, for one fixed `g` and all `y`, are equal.
- (d) `ω_V(g)(v ⊗ f) = (ω(g_∞)v) ⊗ ω_V(g_f)f`, where `ω(g_∞)` is the external product (2.1 (d)) of the
  representations `ω_s` at the infinite places.

ThetaKernelsForUnitaryDualPairs §4.4a constructs the Weil representation of a unitary pair on Schwartz functions for
every quadratic extension of number fields and every pair of splitting characters, and characterises it; the route
needs only one unitary group over these CM fields, on the space of data, and obtains the pairs from it in 6.1.

*Needs:* 1.3, 1.4, 2.1, 3.2, 3.3, 3.4.

[ShortProof], `Lib/Weil/Construction/AdelicRepresentation` (`New.adelicAction`, `New.Space.continuous_omega`,
`New.Space.omega_rho`, `New.Space.dataInner_omega`, `New.Space.dataInner_vacElem_omega_vacElem`, `New.Space.norm_omega_le`,
`New.Space.ext_of_vacElem`), `Lib/Weil/Construction/VacuumProjections` (`New.Space.omega_integrated`)

### 3.6 Theta functionals

*Origin:* adapted from Weil (1964) and Mumford (1966, 1983), the theta distribution of the lattice model and the
unitarity of the theta functional (ThetaLiftsForDefiniteUnitaryGroups §1.8): here on the space of data of 3.4:
existence and uniqueness up to a scalar, the summation formula over rational vectors, and the reading of a vector as its
theta function.

*Method of the formal proof:* the characters `x ↦ β_s(x, γ)²`, `γ ∈ Λ_V`, form a separating family of characters of
the compact group `𝔸^n/Λ_V`; for two forms invariant under `ϱ(Λ_V)` the coefficients `⟨f′, ϱ(γ)f⟩` are summable over
`Λ_V` and their sum is computed by Poisson summation on that quotient; existence by averaging the vacuum coefficient;
uniqueness by Schur's lemma 1.2 (c) for the form `(f, f′) ↦ ℓ(f)·conj θ(f′)`.

Let `V` be a hermitian space of signature `s` on `n`. A *theta functional* for `V` is a continuous linear form `θ` on
`𝒮(V)` with `θ(ϱ(γ)f) = θ(f)` for `γ ∈ Λ_V`, normalised so that the mean of `|θ(ϱ(x)vac)|²` over `𝔸^n/Λ_V` (for the
Haar probability measure) is `1`.

- (a) Theta functionals exist, and every continuous linear form invariant under `ϱ(Λ_V)` is a multiple of any of them.
  For the orthogonal sum `Σ_s` of the rank-one spaces of signs `s_i` there is a theta functional with
  `θ(ϱ(x)vac) = ∏_i θ_{s_i}(x_i)`, where `θ_{±1}` are fixed theta functionals of the two rank-one spaces.
- (b) *Summation.* If `ℓ`, `ℓ′` are continuous and invariant under `ϱ(Λ_V)` and `c` is the mean of
  `ℓ(ϱ(x)vac)·conj ℓ′(ϱ(x)vac)`, then `Σ_{γ∈Λ_V} c·⟨f′, ϱ(γ)f⟩ = ℓ(f)·conj ℓ′(f′)`, the sum being absolutely
  convergent. In particular `Σ_{γ∈Λ_V} ⟨f′, ϱ(γ)f⟩ = θ(f)·conj θ(f′)` for a theta functional `θ`.
- (c) *Theta functions.* Fix a theta functional `θ_V` (normalised in 5.6 (d)) and write `f(y) := θ_V(ϱ(y)f)`. Then
  `f ↦ (y ↦ f(y))` is injective; `(f, y) ↦ f(y)` is jointly continuous with `|f(y)| ≤ ‖θ_V‖·‖f‖`;
  `β_s(γ, y)·f(γ + y) = f(y)` for `γ ∈ Λ_V`; and `⟨f, f′⟩` is the mean of `f′(y)·conj f(y)` over `𝔸^n/Λ_V`.
- (d) *Transport.* Let `V′` be a hermitian space of signature `s′` on `n′`, `T : 𝒮(V′) → 𝒮(V)` a bounded
  `σ`-semilinear map (`σ` the identity or conjugation) and `φ : 𝔸^{n′} → 𝔸^n` an isomorphism of topological groups with
  `T(ϱ(x)f) = ϱ(φ(x))T(f)` for all `x`, `f`, `φ(Λ_{V′}) ⊂ Λ_V` and `⟨Tvac, Tvac⟩ = 1`. Then for every theta functional
  `θ` of `V`, `σ ∘ θ ∘ T` is a theta functional of `V′`.

*Needs:* 1.2, 3.4, 3.5.

[ShortProof], `Lib/Weil/Construction/AdelicRepresentation` (`New.Space.ratVectors`, `New.Space.IsRatInvariant`,
`New.Space.IsThetaFunctional`, `New.Space.isDualFamily_beta_sq`, `New.Space.summable_modelInner`,
`New.Space.IsRatInvariant.hasSum_modelInner`, `New.Space.exists_isThetaFunctional`,
`New.Space.IsThetaFunctional.exists_eq_apply_smul`, `New.Space.IsThetaFunctional.eq_smul`,
`New.Space.IsThetaFunctional.injective_apply_heisenbergOp`, `New.lineTheta`, `New.exists_isThetaFunctional_signedSpace`,
`New.Space.IsThetaFunctional.comp`, `New.Space.rawTheta`, `New.Space.θ`, `New.Space.isThetaFunctional_rawTheta`,
`New.Space.apply_vecAtPoint_add`, `New.Space.dataInner_eq_quotMean`, `New.Space.norm_apply_le`,
`New.Space.hasSum_dataInner`)

### 3.7 Vacuum projections and the finite part

*Origin:* particular to this proof: the projections `P^S` onto the vectors fixed by the finite Heisenberg operators of
the integral vectors above a set of places, the action of finite points on their images, and the finite part of the
space of data with its orthonormal basis of translates of the vacuum.

*Method of the formal proof:* `ϱ_f` is a representation of the compact group `Ô^n` by 3.2 (a), so its mean is a
self-adjoint projection; `ω(g)` normalises it when `g` is integral at `S`; on vectors fixed by `P^S`, elements supported
on `S ∪ S̄` act through the lattice `Ô^n ∩ g⁻¹Ô^n`, which gives the scalar `Δ_f(g⁻¹)⁻¹` and the expansion of `ω(g)vac`;
orthonormality of the translates is a computation with the vacuum coefficient.

Let `V` be a hermitian space on `n` and `S` a set of finite places.

- (a) `P^S` is a bounded self-adjoint idempotent, and `(P^S f)°(y) = f°(y)` if `α⁻¹y_f` is integral at every place of
  `S ∪ S̄`, and `0` otherwise.
- (b) `ω_V(g)P^S = P^Sω_V(g)` if `g_w ∈ GL_n(O_w)` for every `w ∈ S`. If `g ∈ G_f` is `1` outside `S ∪ S̄` and
  `P^S f = f`, then `P^S ω_V(g)f = Δ_f(g⁻¹)⁻¹·f`, and `ω_V(g)f = f` if moreover `g ∈ K₀`.
- (c) `⟨vac, f⟩·vac = pr_∞(P^{all} f)`, where `all` is the set of all finite places; and for `g ∈ G_f`,
  `ω_V(g)vac = (Δ_f(g)/|Δ_f(g)|²)·Σ_q ϱ_f(g·y_q)vac`, the sum over representatives `y_q` of `Ô^n/(Ô^n ∩ g⁻¹Ô^n)`.
- (d) For representatives `r(q)` of `𝔸_f^n/Ô^n` the vectors `ϱ_f(r(q))vac` are orthonormal and span `𝒮_f(V)`.
  `ϱ_f(y)vac = vac` for `y ∈ Ô^n`. `𝒮_f(V)` is stable under every `ϱ_f(z)`, every `P^S` and every `ω_V(g)`,
  `g ∈ G_f`; each `f ∈ 𝒮_f(V)` is fixed by `ω_V(k)` for all `k ∈ G_f` near `1`; `pr_∞ f = f` for `f ∈ 𝒮_f(V)`; and a
  vector of `𝒮_f(V)` fixed by `ϱ_f(gy)` for every `y ∈ Ô^n` is a multiple of `ω_V(g)vac`.
- (e) `ω_V(g)(v ⊗ f) = (ω(g_∞)v) ⊗ ω_V(g_f)f`. If `P^S f = f` and a bounded linear map `L` vanishes on every
  `v_P ⊗ ϱ_f(y)vac` with `P` a polynomial and `y ∈ 𝔸_f^n` zero at the places of `S ∪ S̄`, then `L(f) = 0`.

*Needs:* 2.2, 3.2, 3.4, 3.5.

[ShortProof], `Lib/Weil/Construction/VacuumProjections` (`New.Space.dataInner_projOn`, `New.Space.projOn_projOn`,
`New.Space.projOn_val`, `New.Space.omega_projOn`, `New.Space.projOn_omega`, `New.Space.omega_eq_self_of_mem_stdLevel`,
`New.Space.dataInner_vacElem_smul_vacElem`, `New.Space.omega_vacElem_sum`, `New.Space.dataInner_finHeisenbergOp_rep_vacElem`,
`New.Space.span_finHeisenbergOp_rep_vacElem`, `New.Space.finHeisenbergOp_vacElem`, `New.Space.finHeisenbergOp_add`,
`New.Space.omega_mem_finitePart`, `New.Space.eventually_omega_eq_self`, `New.Space.projReal_eq_self_of_mem_finitePart`,
`New.Space.exists_eq_smul_omega_vacElem`, `New.Space.omega_integrated`, `New.Space.map_eq_zero_of_map_integrated_eq_zero`,
`New.Space.projOn_mem_finitePart`)

### 3.8 Products of data and changes of coordinates

*Origin:* particular to this proof: the product of data along a splitting of the coordinates compatible with the signs,
and the transport of data along changes of coordinates that keep the Gaussian and the Heisenberg datum up to
conjugation.

*Method of the formal proof:* both are 1.4 (a) and (c) for the adelic data; the multiplier is multiplicative on
block-diagonal elements by 2.1 (d) and 3.2 (b).

- (a) Let `e : n₁ ⊔ n₂ → n` be a bijection with `s ∘ e = s₁ ⊔ s₂`, and `V`, `V₁`, `V₂` spaces of these signatures. The
  product `(f₁ ⊠ f₂)°(x) = f₁°(x ∘ e|_{n₁})·f₂°(x ∘ e|_{n₂})` is a bounded bilinear map `𝒮(V₁) × 𝒮(V₂) → 𝒮(V)` with
  `vac ⊠ vac = vac`, `ϱ(x)(f₁ ⊠ f₂) = ϱ(x₁)f₁ ⊠ ϱ(x₂)f₂`, `⟨f₁ ⊠ f₂, f₁′ ⊠ f₂′⟩ = ⟨f₁, f₁′⟩⟨f₂, f₂′⟩`, compatible with real
  insertion; for `g` block diagonal with blocks `g₁, g₂`, `Δ(g) = Δ(g₁)Δ(g₂)` and
  `ω_V(g)(f₁ ⊠ f₂) = ω_{V₁}(g₁)f₁ ⊠ ω_{V₂}(g₂)f₂`.
- (b) Let `σ` be the identity or conjugation, and `φ : 𝔸^n → 𝔸^{n₁}` the product of a real-linear change `A` of the real
  coordinates that keeps the Gaussian and the real Heisenberg datum up to `σ`, and an additive homeomorphism `B` of the
  finite coordinates with `B(Ô^n) = Ô^{n₁}`, `B(x)*B(x) = −x*x` and `ψ₀(½B(y)*B(x)) = σ(ψ₀(½y*x))`. Then
  `D_φ(f) = σ ∘ f° ∘ φ` is a norm-preserving `σ`-semilinear map `𝒮(V₁) → 𝒮(V)` with `D_φ(ϱ(φ(x))f) = ϱ(x)D_φ(f)` and
  `D_φ(vac) = vac`; if `φ(gx) = g₁φ(x)` and `σ(Δ(g₁)) = c·Δ(g)`, then `D_φ(ω(g₁)f) = c·ω(g)D_φ(f)`.

*Needs:* 1.4, 2.1, 3.2, 3.4, 3.5.

[ShortProof], `Lib/Weil/Construction/ProductsAndTransport` (`New.G.blockEmb`, `New.Space.boxProd`, `New.Space.boxProd_val`,
`New.Space.rho_boxProd`, `New.Space.boxProd_vacElem`, `New.Space.dataInner_boxProd`, `New.Space.boxProd_integrated`,
`New.weilMultiplier_fromBlocks`, `New.Space.omega_boxProd`, `New.CoordChange`, `New.CoordChange.map`,
`New.CoordChange.map_rho`, `New.CoordChange.norm_map`, `New.CoordChange.map_vacElem`, `New.CoordChange.map_omega`)

### 3.9 The tame local Gauss sum

*Origin:* adapted from the published theory of Gauss sums of tamely ramified characters of local fields: here over a
finite product of non-archimedean local fields, for the modulus of the Gauss sum only, obtained from the Gauss sum of a
character of the determinant over a finite ring.

*Method of the formal proof:* the integral over `O` is a finite sum over `R = O/ϖO` against the primitive additive
character `ψ_R(x mod ϖ) = ψ(ϖ⁻¹x)` of `R`, that is, a Gauss sum `Σ_{u∈R} η(u)ψ_R(yu)` of `η` over the finite ring `R`.
For primitive `η` and `ψ_R` this Gauss sum is `Γ·η⁻¹(y)` with `|Γ|² = #R` (the twisting rule and Fourier inversion on
`R`: the case `n = 1` of the Gauss sum of a character of the determinant over `n × n` matrices over a finite ring), which
gives the value at units, the vanishing at non-units and the modulus of the constant.

Let `F` be a finite product of non-archimedean local fields, `O` its ring of integers, `ϖ ∈ O` a product of
uniformisers, `R = O/ϖO`, and `dx` the Haar measure with `vol(O) = 1`. Let `χ` be a character of `F^×` whose inverse
restricted to `O^×` is inflated from a primitive character `η` of `R` (`η` is `0` off `R^×`, `η(x mod ϖ) = χ⁻¹(x)` for
`x ∈ O^×`, and for every `a ≠ 0` in `R` some `c` has `η(1 + ca) ∉ {0, 1}`), and `ψ` a continuous character of `F` with
`{t : ψ(tO) = 1} = O`. Then there is `γ ∈ ℂ` with `|γ|² = 1/#R` such that for every `t ∈ F`

`∫_O χ⁻¹(x)·1_{O^×}(x)·ψ(tx) dx = γ·χ(ϖt)` if `ϖt ∈ O^×`, and `= 0` otherwise.

The formal proof proves it for a ring `F` with a compact open subring `O` of volume `1`, a topologically nilpotent
`ϖ ∈ O ∩ F^×` and the valuation-pair property, which covers finite products of local fields. The library has the
scalar Gauss sums of primitive Dirichlet characters modulo `N` and over finite fields
(`DirichletCharacter.IsPrimitive.norm_gaussSum`, Mathlib's `gaussSum_mulShift_of_isPrimitive`); missing are the local
integral form and the finite rings `O/ϖO` in general.

*Needs:* none.

[ShortProof], `Lib/Weil/TameGaussSum` (`New.TameLocalChar.norm_eq_one`, `New.TameLocalChar.isLocallyConstant_invOnUnits`,
`New.Exchange.exists_local_gauss_sum`, `New.invOnUnits_mul`), `Lib/General/Analysis/FiniteFourier`
(`New.Exchange.exists_matrixFourier_eq_mul_inv_det`)

## Layer 4: Theta functions of vectors

A vector of the space of data is read through its values `f(y) = θ_V(ϱ(y)f)`. At the real places these values, times
a Gaussian, form an entire function; for standard spaces the finite Heisenberg operators act on it by translations
along the lattice `𝔞₀^n`, the vacuum spans the theta functions of `𝔞₀^n`, and Fourier inversion over finite groups
writes the theta functions of a sublattice `δ̄𝔞₀^n` through translates of the vacuum.

### 4.1 Real data and the entire theta function

*Origin:* adapted from Bargmann (1961, 1967), the Bargmann transform and the Fock pairing of a polynomial as a Taylor
coefficient (ThetaLiftsForDefiniteUnitaryGroups §1.7): here on the space of data: insertion of a Fock vector at the
real places, the theta value of such a vector as an integral, and the entire theta function of a vector fixed by
`pr_∞`.

*Method of the formal proof:* the insertion is a Bochner integral of Heisenberg translates, so bounded maps pass inside
it; the inner product factors by 1.4 (a); a vector whose values vanish at all real points vanishes, by the
quasi-periodicity of 3.6 (c) and the density of `Λ_V + (real points)`; for `pr_∞ f = f` the value at a real point is an
integral of `f` against the translate of the Gaussian, which is `exp(Σ y_p conj w_p)` times Gaussians, hence entire in
`y`.

Let `V` be a hermitian space of signature `s` on `n`, `v, w` in the Fock space `𝓕(s ∘ pr₂)` of `ℂ^{Φ×n}`, and
`f, f′ ∈ 𝒮(V)`.

- (a) For every bounded `T` from `𝒮(V)` to a Banach space, `T(v ⊗ f) = ∫ v(y)·T(ϱ(realVec(y))f) dμ_∞(y)`;
  `⟨v ⊗ f, w ⊗ f′⟩ = ⟨v, w⟩·⟨pr_∞ f, pr_∞ f′⟩`; if `pr_∞ f ≠ 0` and `v ⊗ f = 0` then `v = 0`; and
  `θ_V(v ⊗ f) = ∫ v(y)·f(realVec(y)) dμ_∞(y)`.
- (b) If `f(realVec(y)) = 0` for every `y ∈ ℂ^{Φ×n}`, then `f = 0`.
- (c) Let all signs be `+1`. If `pr_∞ f = f` (for instance `f ∈ 𝒮_f(V)`, 3.7 (d)), then
  `Θ_f(y) := f(realVec(y))·exp(|y|²/2)` is an entire function on `ℂ^{Φ×n}`, and
  `Θ_f(y) = ∫ exp(Σ_p y_p·conj w_p)·e(w)·f(realVec(w)) dμ_∞(w)`. For every `f` and every polynomial `P`,
  `θ_V(v_P ⊗ f) = ∫ P(conj y)·Θ_f(y)·exp(−|y|²) dμ_∞(y)`, with `Θ_f(y) := f(realVec(y))·exp(|y|²/2)`.

*Needs:* 2.1, 3.4–3.7.

[ShortProof], `Lib/Weil/MixedModel/RealTheta` (`New.Space.map_integrated_eq_integral_realVec`,
`New.Space.dataInner_integrated`, `New.Space.eq_zero_of_integrated_eq_zero`, `New.Space.theta_integrated`,
`New.Space.entireTheta`, `New.Space.eq_zero_of_apply_realVec_eq_zero`, `New.Space.entireTheta_eq_integral`,
`New.Space.differentiable_entireTheta`, `New.Space.theta_integrated_polyVector_eq_integral_entireTheta`)

### 4.2 Jet series and translation by rational vectors

*Origin:* adapted from Weil (1964) and Mumford (1966, 1983), the translates of the theta function of a lattice vector
(ThetaLiftsForDefiniteUnitaryGroups §1.8, clause *Translates*): here on the space of data of a standard space, with the
jet series of a vector defined through the theta values of polynomial vectors.

*Method of the formal proof:* the identity for jets is the definition of the jet series, read through the Fischer
pairing; for a standard space a rational vector is the sum of its real image and its finite image in the coordinates of
3.1, and quasi-periodicity (3.6 (c)) turns the finite translation into the opposite real translation; the semicharacter
of the finite image is computed by the product formula for `ψ`.

Let `V` be a hermitian space of signature `s` on `n`. For `a ∈ ℂ` the *jet series* of `f ∈ 𝒮(V)` is the power series
`J_a(f) = Σ_μ (a^{|μ|}/μ!)·θ_V(v_{z^μ} ⊗ f)·z^μ` in the variables `z_{w,i}`, `(w, i) ∈ Φ × n`. For a polynomial `P` let
`jet_P(F) = (P(∂)F)(0)`. For `γ ∈ E^n` its *real image* `u_γ ∈ ℂ^{Φ×n}` has components `κ_w⁻¹·τ_w(γ_i)`.

- (a) `jet_P(J_a(f)) = θ_V(v_{P(a·)} ⊗ f)` for every polynomial `P`, and the constant term of `J_a(f)` is
  `θ_V(pr_∞ f)`.
- (b) For `f ∈ 𝒮_f(V)` and `x ∈ 𝔸_f^n` there is `γ ∈ E^n` with `α⁻¹γ − x ∈ Ô^n` and
  `ϱ(finVec(α⁻¹γ))f = ϱ(finVec(x))f`.
- (c) Let `V` be standard. Then `γ ∈ E^n ⊂ 𝔸^n` has real and finite coordinates `(u_γ, α⁻¹γ)`, and
  `Θ_{ϱ(finVec(α⁻¹γ))f}(z) = exp(u*z − |u|²/2)·Θ_f(z − u)` with `u = u_γ`. Moreover
  `semi(α⁻¹γ) = exp(−πi·E(bu_γ, u_γ))`, where `E(u, v) = Im(u*v)/π` and `(bu)_{w,i} = conj τ_w(c₀)·u_{w,i}`.

The *Schur jet matrix* of a power series `F` for a shape `κ` is the matrix of the jets of `F` along the entries of the
Schur matrix of `κ` (IntegralRepresentationsOfGeneralLinearGroups §1.1 (f)); two vectors `f`, `f′` have *conjugate jets*
under an automorphism `σ` of `ℂ` and a permutation `π` of the places if `σ` applied to the coefficients of `J_t(f)` gives
`J_{t′}(f′)` with the variables renamed by `π`. That `J_a(f)` is the Taylor series of `z ↦ Θ_f(az)` for `f` in the finite
part of a space of signs `+1` is DivisibilityOfThetaDerivatives §4.4 (b). ThetaLiftsForDefiniteUnitaryGroups
§1.8 states the translation law for the Bargmann transform of a lattice vector of a definite pair; it is stated here
because the model differs and no comparison is used.

*Needs:* 2.2, 3.6, 3.7, 4.1.

[ShortProof], `Lib/Weil/Construction/ThetaJets` (`New.Space.IsStd`, `New.Space.jetSeries`, `New.Space.jet_jetSeries_eq_theta`,
`New.schurJet`, `New.Space.IsJetConjugate`, `New.Space.constantCoeff_jetSeries`, `New.realImage`,
`New.exists_finiteImage_approx`, `New.vecAtPoint_eq_adelicSum`, `New.entireTheta_translate_finiteImage`,
`New.semichar_finiteImage`)

### 4.3 The theta dictionary for the standard lattice

*Origin:* adapted from Weil (1964) and Mumford (1966, 1983), the theta line of a self-dual lattice
(ThetaLiftsForDefiniteUnitaryGroups §1.8, clauses *Sections* and *Translates*): here for the one self-dual lattice
`𝔞₀^n` of a standard space, with theta functions defined by signed translations, on the space of data.

*Method of the formal proof:* the translations compose with the phase of the Riemann form, which the product formula
for `ψ` identifies with `ψ₀`; self-duality of `𝔞₀^n` comes from that of `Ô` (3.2 (a)); the real images of `𝔞₀^n` form a
lattice on which the Riemann form is unimodular with a semicharacter of Appell–Humbert type, so the space of its theta
functions has dimension one by the dimension formula; `Θ_vac` is a nonzero element of it by 4.2 (c).

Let `𝔞₀ = E ∩ αÔ`, so that `𝔞₀^n = {γ ∈ E^n : α⁻¹γ ∈ Ô^n}`. For `γ ∈ E^n` and `F` on `ℂ^{Φ×n}` put
`(T_γF)(z) = exp(−(u*z + |u|²/2))·F(z + u)` with `u = u_γ`, `{γ, γ′} = Im(u_γ*u_{γ′})/π`, and
`S_γ = semi(α⁻¹γ)·T_γ`. For a subgroup `Y ⊂ E^n`, an entire function `F` is a *theta function for `Y`* if `S_γF = F`
for every `γ ∈ Y`.

- (a) `T_γT_{γ′} = exp(πi{γ, γ′})·T_{γ+γ′}` and `exp(πi{γ, γ′}) = ψ₀(½(α⁻¹γ′)*(α⁻¹γ))`. `γ ∈ 𝔞₀^n` if and only if
  `exp(2πi{γ, y}) = 1` for all `y ∈ 𝔞₀^n`; for `δ ∈ E^×`, `γ ∈ δ̄𝔞₀^n` if and only if `exp(2πi{γ, y}) = 1` for all
  `y ∈ δ⁻¹𝔞₀^n`. On `𝔞₀^n`, `S_{γ+γ′} = S_γS_{γ′}`, and for `γ ∈ 𝔞₀^n` the number `k = Σ_{w,i} |τ_w(γ_i)|²` is an
  integer with `semi(α⁻¹γ) = (−1)^k`. The real images of `𝔞₀^n` form a lattice of full rank in `ℂ^{Φ×n}`.
- (b) For every `V`, `f ↦ Θ_f` (defined as in 4.1 (c)) is injective on `𝒮(V)`, and `Θ_vac ≠ 0`.
- (c) Let `V` be standard. Then `Θ_{ϱ(finVec(α⁻¹γ))φ} = T_{−γ}Θ_φ` and `Θ_{ϱ_f(α⁻¹γ)φ} = S_{−γ}Θ_φ`; for
  `φ ∈ 𝒮_f(V)` the values `φ(finVec(x))`, `x ∈ 𝔸_f^n`, are exactly the values `(T_γΘ_φ)(0)`, `γ ∈ E^n`; and `Θ_vac` is a
  theta function for `𝔞₀^n`.
- (d) Let `V` be standard. An entire function `F` is a theta function for `𝔞₀^n` if and only if `F = c·Θ_vac` for some
  `c ∈ ℂ`.

ThetaLiftsForDefiniteUnitaryGroups §1.8 states (d) for every self-dual lattice of a definite pair through
`h⁰(L(H, α)) = 1` for every principal polarisation (AbelianSchemesAndArithmeticModuli A5.4, a deep result); the route
needs the one lattice `𝔞₀^n`. The library has the dimension of theta sections on a one-dimensional complex torus
(`TauCeti.finrank_thetaSections`); missing are higher dimensions, CM lattices and the link with the space of data.

*Needs:* 3.2, 3.6, 3.7, 4.1, 4.2; AbelianSchemesWithThetaStructuresAndTheirCohomology §1.2 (c) (Frobenius' dimension
formula).

[ShortProof], `Lib/Weil/Construction/ThetaDictionary` (`New.fockForm`, `New.idealLattice`, `New.ratShift`,
`New.ratRiemannForm`, `New.signedShift`, `New.IsThetaFunction`, `New.ratShift_ratShift`, `New.exp_ratRiemannForm`,
`New.mem_idealLattice_iff_ratPhase`, `New.mem_star_smul_idealLattice_iff`, `New.semichar_finiteImage_add`,
`New.signedShift_add`, `New.exists_semichar_finiteImage_eq_neg_one_zpow`, `New.realLattice`,
`New.Space.injective_entireThetaHom`, `New.Space.entireTheta_vacElem_ne_zero`, `New.Space.entireTheta_rho`,
`New.Space.range_apply_finVec_eq_range_ratShift_entireTheta`, `New.Space.entireTheta_finHeisenbergOp`,
`New.Space.isThetaFunction_vacElem`, `New.mem_thetaSpace_iff_isThetaFunction`, `New.finrank_thetaSpace_realLattice`,
`New.Space.isThetaFunction_iff`)

### 4.4 Fourier inversion for theta functions of a sublattice

*Origin:* adapted from Weil (1964) and Mumford (1966, 1983), the theta functions of a polarised lattice and their
translates (ThetaLiftsForDefiniteUnitaryGroups §1.8): here the theta functions for `δ̄𝔞₀^n` are written through the
`N^r` translates of `Θ_vac` by Fourier inversion over finite groups, on the space of data, with the integrality of the
coefficients.

*Method of the formal proof:* for `F` a theta function for `δ̄𝔞₀^n` and `y ∈ δ⁻¹𝔞₀^n`, the average of `S_{−γ}T_yF` over
`γ ∈ 𝔞₀^n/δ̄𝔞₀^n` is a theta function for `𝔞₀^n`, hence `c_yΘ_vac` by 4.3 (d); orthogonality of the characters of the
finite group `δ⁻¹𝔞₀^n/𝔞₀^n` (dual to `𝔞₀^n/δ̄𝔞₀^n` by 4.3 (a)) inverts the averages; injectivity (4.3 (b)) transfers the
identities to vectors; integrality because each value of `c_y·vac` is a sum of values of `φ` times roots of unity.

Let `V` be standard of rank `n`, `δ ∈ E` integral at every finite place with `δδ̄ = N ∈ ℕ`, `N ≠ 0`, and `r = |Φ|·|n|`.

- (a) Systems of representatives of `δ⁻¹𝔞₀^n/𝔞₀^n` and of `𝔞₀^n/δ̄𝔞₀^n` have `N^r` elements each.
- (b) Let `(y_i)`, `(γ_j)` be such systems and `F` a theta function for `δ̄𝔞₀^n`. There are `c_i ∈ ℂ` with
  `c_i·Θ_vac = Σ_j S_{−γ_j}T_{y_i}F` for every `i`, and `Σ_i c_i·T_{−y_i}Θ_vac = N^r·F`.
- (c) If `φ ∈ 𝒮(V)` and `Θ_φ` is a theta function for `δ̄𝔞₀^n`, there are `c_i` with
  `c_i·vac = Σ_j ϱ_f(α⁻¹γ_j)ϱ(finVec(−α⁻¹y_i))φ` and `Σ_i c_i·ϱ(finVec(α⁻¹y_i))vac = N^r·φ`. Every theta function for
  `δ̄𝔞₀^n` is `Θ_φ` for some `φ ∈ 𝒮_f(V)`.
- (d) *Integrality.* Let `V` be any hermitian space, `p` a prime, `ι_p : ℂ → ℂ_p` a ring homomorphism and `φ ∈ 𝒮(V)`
  with `|ι_p(φ(finVec(x)))| ≤ 1` for all `x ∈ 𝔸_f^n`. If `c·vac = Σ_j ϱ_f(a_j)ϱ(finVec(b))φ` (a finite sum), then
  `|ι_p(c·vac(finVec(x)))| ≤ 1` for all `x`.

ThetaLiftsForDefiniteUnitaryGroups §1.8, read whole with `h⁰ = 1` for the principal polarisation and Fourier inversion
on the finite group, implies (a)–(c); the route avoids the general dimension formula for sublattices and needs only
4.3 (d). The library has an explicit basis of level-`k` theta sections on a one-dimensional torus
(`TauCeti.thetaSectionsBasis`); nothing in higher dimension.

*Needs:* 3.7, 4.2, 4.3.

[ShortProof], `Lib/Weil/Construction/FourierInversion` (`New.IsRepresentativeSystem`,
`New.card_representatives_idealLattice`, `New.IsThetaFunction.sum_ratShift_sum_signedShift`,
`New.Space.exists_smul_entireTheta_vacElem_eq`, `New.Space.fourier_inversion`,
`New.Space.exists_entireTheta_eq_of_isThetaFunction`, `New.Space.exists_fourier_coefficients`,
`New.Space.exists_sum_finHeisenbergOp_apply_eq`, `New.Space.norm_mul_vacElem_le_one_of_eq_sum`)

## Layer 5: Mixed models and the invariance of the theta functional

Along a rational Witt decomposition `V = (lE^p ⊕ kE^p) ⊥ ιV₀`, the *zero term* of a vector is its mean along the
adelic points of the isotropic frame `k`, a vector of the space of data of the core `V₀`; its *slices* are the zero
terms of its Heisenberg translates along `l`. The slices obey the law of a mixed Schrödinger model, they expand the
theta functional, and they transform by explicit formulas under the parabolic subgroup. From these laws the theta
functional is invariant under all rational points.

### 5.1 Isotropic splittings, parabolic elements and adapted points

*Origin:* adapted from Scharlau (1985), Chapter 7, and Knus (1991), the Witt decomposition of a Hermitian space over a
field with involution (HermitianFormsAndLattices §1.2): here a rational Witt decomposition along an isotropic frame of
any rank with its adelic frames, the Levi and unipotent elements of the stabiliser of the frame, and points adapted to
the decomposition.

*Method of the formal proof:* coordinates in the frames `(l, ι, k)` give the Levi decomposition by block computations;
adapted points from Sylvester's law of inertia and Gram–Schmidt at the infinite places and integral bases at the finite
places; generation of `U(J)(E)` by the two opposite Siegel parabolics by a Bruhat-type reduction of rational unitary
matrices.

Let `V = (J, x)` (signature `s` on `n`) and `V₀ = (J₀, x₀)` (signature `s₀` on `n₀`) be hermitian spaces and `p` a
finite set with `|n| = |n₀| + 2|p|`.

- A *splitting* `D` of `V` over `V₀` along `p` is `(k, l, ι)` with `k, l ∈ M_{n×p}(E)`, `ι ∈ M_{n×n₀}(E)`, `k*Jk = 0`,
  `l*Jl = 0`, `l*Jk = 1`, `ι*Jι = J₀`, `ι*Jk = ι*Jl = 0`. Its adelic frames are `x⁻¹k`, `x⁻¹l`, `x⁻¹ιx₀`; every
  `y ∈ 𝔸^n` is uniquely `y = la + ιw + kb` (adelic frames, `a, b ∈ 𝔸^p`, `w ∈ 𝔸^{n₀}`). The *hyperbolic space* `H_p`
  has Gram matrix `(0 1; 1 0)`, signs `+1` on the first and `−1` on the second copy of `p`, and an explicit adelic
  frame.
- *Levi and unipotent elements:* `m(a, g₀)` (`a ∈ GL_p(𝔸)`, `g₀ ∈ G_{s₀}`) acts by `a` on the frame `k`, by `(a*)⁻¹` on
  `l` and by `g₀` on `ι`; `n(c, b)` (`c ∈ M_{n₀×p}(𝔸)`, `b ∈ M_p(𝔸)`) fixes `k` pointwise and acts trivially on `V/k^⊥`
  and on the core, with only the hermitian part of `b` mattering.
- `g ∈ G_s` is *adapted* to `t ∈ GL_p(𝔸)` if the columns of `g⁻¹(lt^{−*}, kt, ι)` (adelic frames) are orthonormal for the
  standard positive definite form at each infinite place and integral at the finite places.
- A family `T_x : 𝒮(V) → 𝒮(V₀)` (`x ∈ 𝔸^p`) of bounded maps has the *mixed law* if
  `T_x(ϱ(la + ιw + kb)f) = ψ(½ȷ·b*(2x + a))·ϱ₀(w)T_{x+a}f` for all `a, b, w, f`.

Statements:

- (a) `n(c, b)n(c′, b′) = n(c + c′, b + ȷc*ε_{s₀}c′ + b′)` and `m(a, g)n(c, b)m(a, g)⁻¹ = n(gca*, aba*)`.
- (b) If `g ∈ G_s` maps the adelic frame `k` to `k·a` for an adelic matrix `a`, then `g = n(c, b)·m(a, g₀)` with `g₀`
  the block of `g` on the core; `g` is some `n(c, b)` if and only if it fixes the frame `k` pointwise and has core
  block `1`.
- (c) Rational `a`, `g₀`, `c`, `b` give rational points; there is a compact `K ⊂ G_s` such that every `n(c, b)` has a
  rational `n(y, z)` with `n(y, z)n(c, b) ∈ K`.
- (d) For every `t ∈ GL_p(𝔸)` there is `γ ∈ G_s` adapted to `t`, with a reindexing that carries `s` to the signs of
  `H_p ⊕ V₀`.
- (e) If `V₀ = 0`, the rational Siegel parabolic subgroups `{γ : γk ∈ kGL_p(E)}` and `{γ : γl ∈ lGL_p(E)}` generate
  `U(J)(E)`.

Existence of a splitting along every isotropic frame `k` with a left inverse, with a core that is again a hermitian
space with an adelic frame, is AdelicUnitaryGroupsAndAlgebraicModularForms §3.5.

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §§3.1, 3.5 (spaces with adelic frames, splittings).

[ShortProof], `Lib/Weil/MixedModel/IsotropicSplitting` (`New.hyperbolicSigns`, `New.hyperbolicSpace`,
`New.Exchange.IsOrthoIntegral`, `New.Space.Splitting`, `New.Space.Splitting.levi`, `New.Space.Splitting.radicalElement`,
`New.Space.Splitting.ActsOnFrame`, `New.Space.Splitting.IsMixedLaw`, `New.Space.Splitting.frameAt`,
`New.Space.Splitting.IsAdapted`, `New.Space.Splitting.radicalElement_mul`, `New.Space.Splitting.levi_conj_radicalElement`,
`New.Space.Splitting.exists_eq_radicalElement_mul_levi`, `New.Space.Splitting.exists_eq_radicalElement_iff`,
`New.Space.Splitting.levi_mem_Gamma`, `New.Space.Splitting.radicalElement_mem_Gamma`,
`New.Space.Splitting.exists_isCompact_rat_mul_radicalElement_mem`, `New.Space.Splitting.exists_isAdapted_and_frame_eq`,
`New.Space.Splitting.siegelParabolic`, `New.Space.Splitting.siegelParabolic_sup_symm_eq_top`)

### 5.2 Base-adapted splittings

*Origin:* particular to this proof: splittings whose adelic frames are themselves orthonormal at the infinite places and
integral at the finite places, their stability, and the factorisation of such a splitting through the splitting that
removes hyperbolic planes.

*Method of the formal proof:* block computations with the adelic frames.

A splitting `D` is *base-adapted* if the columns of the adelic frames `(x⁻¹l, x⁻¹k, x⁻¹ιx₀)` are orthonormal for the
standard positive definite form at each infinite place and integral at the finite places.

- (a) `H_p` has a splitting over `0` with `l` the first and `k` the second copy of `p`; the adelic frame of `H_p` and
  its inverse are orthonormal at the infinite places and integral at the finite places, so this splitting is
  base-adapted. `H_q ⊕ V` has a base-adapted splitting over `V` along `q` (the splitting that removes the planes).
  Exchanging `k` and `l`, and composing two base-adapted splittings, give base-adapted splittings.
- (b) If `D` is base-adapted along `p` and `e : n₁ ⊔ q ≃ p`, there is a base-adapted splitting `A₁` of `V` over
  `H_q ⊕ V₀` along `n₁` whose composite with the splitting that removes the planes has frame `k ∘ e` and core embedding
  `ι`; for `p` of one element there is a base-adapted splitting with the reindexed frame and the same `ι`.

*Needs:* 5.1.

[ShortProof], `Lib/Weil/MixedModel/AdaptedSplitting` (`New.hyperbolicSplitting`, `New.Exchange.IsBaseAdapted`,
`New.Exchange.removePlanes`, `New.Exchange.exists_isBaseAdapted_reindex`,
`New.Exchange.exists_isBaseAdapted_comp_removePlanes`), `Lib/Weil/MixedModel/IsotropicSplitting`
(`New.Exchange.isOrthoIntegral_hyperbolicSpace`)

### 5.3 Schwartz–Bruhat functions above a set of places

*Origin:* adapted from the published theory of the Schrödinger model of the Heisenberg group of a local field: here on
the finite adeles above a set `S` of places disjoint from its conjugate, for functions that see only the components at
`S`, in the polarisation given by the components at `S` and at `S̄`.

*Method of the formal proof:* a locally constant function with compact support is constant on cosets of a small box,
so it is a finite combination of coset indicators; the Heisenberg law is a computation with `ψ₀` and the conjugation
that exchanges `S` and `S̄`; the box is fixed by the normalised operators of the integral vectors by self-duality of `Ô`.

Let `S` be a set of finite places (possibly infinite). A function `Ψ` on `𝔸_f^n` is *Schwartz–Bruhat above `S`* if
`Ψ(e_Sx) = Ψ(x)`, `Ψ` is locally constant, and `e_S·supp Ψ` lies in a compact set. Let `B_S = {x : e_Sx ∈ Ô^n}` (the
*box*), and put `(ρ_S(y)Ψ)(x) = ψ₀(½y*·e_S(2x + y))·Ψ(x + y)`, and `⟨Ψ, Ψ′⟩_S = ∫_{B_{S^c}} conj(Ψ)·Ψ′ dλ`.

- (a) Let `Ψ` be Schwartz–Bruhat above `S`. If `t` is a finite idele such that `Ψ` is constant on `x + tB_S` for every
  `x` in its support, then `Ψ` is a finite combination of indicators of such cosets with coefficients its values. If
  a subspace `P` of functions contains, for each `y` in the support of `Ψ` and some neighbourhood `U` of `y`, the
  indicator of every coset `z + tB_S` (`t` integral) whose points satisfy `e_S x ∈ U`, then `Ψ ∈ P`.
- (b) Let `S` be conjugation-free. Then `ρ_S(y)ρ_S(y′) = β_f(e_{S∪S̄}y, e_{S∪S̄}y′)·ρ_S(y + y′)`;
  `semi(e_{S∪S̄}y)·ρ_S(y)1_{B_S} = 1_{B_S}` when `y` is integral at `S ∪ S̄`; for `Ψ` Schwartz–Bruhat above `S`,
  `ρ_S(e_Sy)Ψ = Ψ(· + y)` and `(ρ_S(ē_Sy)Ψ)(x) = ψ₀(y*e_Sx)·Ψ(x)`, where `ē_S = e_{S̄}`.
- (c) Let `S` be conjugation-free. Every Schwartz–Bruhat function above `S` is a finite combination
  `Σ_y c_y·ρ_S(y)1_{B_S}`.

*Needs:* 3.1, 3.2.

[ShortProof], `Lib/Weil/MixedModel/SchwartzBruhat` (`New.integralBox`, `New.boxIndicator`, `New.IsSchwartzBruhat`,
`New.cosetIndicator`, `New.schrodingerAct`, `New.schrodingerCombination`, `New.localInner`,
`New.IsSchwartzBruhat.eq_sum_cosetIndicator`, `New.IsSchwartzBruhat.mem_of_cosets`, `New.schrodingerAct_schrodingerAct`,
`New.semichar_smul_schrodingerAct`, `New.schrodingerAct_boxIndicator`, `New.IsSchwartzBruhat.schrodingerAct_idem`,
`New.IsSchwartzBruhat.schrodingerAct_star_idem_smul`, `New.Space.mem_range_schrodingerCombination`)

### 5.4 Data named by Schwartz–Bruhat functions

*Origin:* particular to this proof: the vector `Ψ·f` of the space of data named by a Schwartz–Bruhat function above a
conjugation-free set of places, defined through the finite Heisenberg operators and `P^S`, with its laws.

*Method of the formal proof:* the naming is well defined because the inner product of two named vectors is computed by
the local inner product (3.7 (d) gives orthonormality of translates); the laws then reduce to translates of the box,
where they are 5.3 (b) and 3.7 (b), (c).

Let `S` be conjugation-free. For `Ψ = Σ_y c_y·ρ_S(y)1_{B_S}` (5.3 (c)) and `f ∈ 𝒮(V)` put
`Ψ·f := Σ_y c_y·ϱ(finVec(e_{S∪S̄}y))P^S f`.

- (a) `Ψ·f` does not depend on the representation of `Ψ` and is linear in `Ψ` and `f`; `1_{B_S}·f = P^S f`;
  `ϱ(finVec(e_{S∪S̄}y))(Ψ·f) = (ρ_S(y)Ψ)·f`; `⟨Ψ·f, Ψ′·f′⟩ = ⟨Ψ, Ψ′⟩_S·⟨P^S f, P^S f′⟩`; `Ψ·f ∈ 𝒮_f(V)` when
  `f ∈ 𝒮_f(V)`; and for disjoint `S`, `T` with `S ∪ T` conjugation-free and `Ψ′` Schwartz–Bruhat above `T`,
  `(ΨΨ′)·f = Ψ·(Ψ′·f)`.
- (b) *Weil action.* For `g ∈ G_s`, the vector `u = ω_V(g)((1_{B_S} ∘ g_f)·f)` is fixed by `P^S` and
  `ω_V(g)(Ψ·f) = (Ψ ∘ g_f⁻¹)·u`. If `g ∈ G_f` is `1` outside `S ∪ S̄`, then
  `ω_V(g)(Ψ·f) = conj χ_𝔸(det_S g)·(Ψ ∘ g⁻¹)·f`, with `det_S g` the idele equal to `det g_w` at `w ∈ S` and `1`
  elsewhere.
- (c) *Products and transport.* For `Ψ`, `Ψ′` Schwartz–Bruhat above the same `S`, `(Ψ·vac) ⊠ (Ψ′·vac) = Θ·vac` for
  `Θ(x) = Ψ(x₁)Ψ′(x₂)` (3.8 (a)); and a change of
  coordinates `D_φ` of 3.8 (b) whose finite part `B` carries `e_{S′}` to `e_S` and `e_{S′∪S̄′}` to `e_{S∪S̄}` maps
  `Ψ·vac` to `(σ ∘ Ψ ∘ B)·vac`.

*Needs:* 3.7, 3.8, 5.3.

[ShortProof], `Lib/Weil/MixedModel/NamedData` (`New.Space.heisenbergCombination`, `New.Space.schrodingerOp`,
`New.Space.schrodingerOp_boxIndicator`, `New.Space.schrodingerOp_schrodingerAct_boxIndicator`,
`New.Space.rho_schrodingerOp`, `New.Space.dataInner_schrodingerOp`, `New.Space.schrodingerOp_mem_finitePart`,
`New.Space.schrodingerOp_union`, `New.Space.omega_schrodingerOp`, `New.Space.omega_schrodingerOp_of_mem_supportedOn`,
`New.Space.boxProd_schrodingerOp`, `New.CoordChange.map_schrodingerOp`)

### 5.5 Zero terms and slices; the theta functional as a sum of slices

*Origin:* particular to this proof: the zero term and the slices of a vector of the space of data along a Witt
decomposition, which stand in for the partial Fourier transform of the Schrödinger model (the mixed model), with the
expansion of the theta functional over rational slices.

*Method of the formal proof:* the zero term exists as a bounded map by 1.2 (b), since the mean along the compact
quotient `𝔸^p/E^p` of the translates of the vacuum is a bounded family; the mixed law is a computation with `β_s` in the
frames; Wiener's bound 1.4 (b) bounds the sum of slices over `E^p`; the expansion of `θ_V` comes from the uniqueness
3.6 (a) applied to the functional `f ↦ Σ_ξ θ_{V₀}(f[ξ])`; for adapted `g` the slices of `ω(g)vac` are computed through the
Gaussian and the lattice vacuum in the adapted frame.

Let `D` be a splitting of `V` over `V₀` along `p` (5.1).

- (a) There is a unique bounded linear map `ev_D : 𝒮(V) → 𝒮(V₀)` with `(ev_D f)(y)` equal to the mean of
  `f(ιy + kb)` over `b ∈ 𝔸^p/E^p` (theta values, adelic frames, Haar probability measure); `ev_D ≠ 0`. The *slices*
  `f[x] := ev_D(ϱ(lx)f)`, `x ∈ 𝔸^p`, have the mixed law of 5.1.
- (b) For a splitting `D′` of `V₀` over `V₁`, the zero term of the composite splitting is `ev_{D′} ∘ ev_D`. If `D′`
  is another splitting of `V` over `V₀` with the same `ι` and `k*Jk′ = 0`, then `ev_{D′} = ev_D`.
- (c) There is `C` with `Σ_{ξ∈E^p} ‖f[ξ]‖ ≤ C·‖f‖`; more generally there are a compact `B ⊂ 𝔸^p` and `C` with
  `Σ_i ‖f[φ(i)]‖ ≤ #φ⁻¹(B)·C·‖f‖` for every homomorphism `φ` from an additive group to `𝔸^p`. And
  `θ_V(f) = Σ_{ξ∈E^p} θ_{V₀}(f[ξ])`.
- (d) Let `g ∈ G_s` be adapted to `t` and `T` a family with the mixed law. Then there is `c` with
  `T_x(ω(g)vac) = c·|vac(t*x)|²·vac₀` for all `x`, and `c ≠ 0` for the slices themselves. For a set `S` of places and
  `y ∈ 𝔸^p`, `T_{t^{−*}y}(ω(g)P^S f) = 1_{B_{S∪S̄}}(α⁻¹y_f)·P^S_{V₀}T_{t^{−*}(y − finVec(e_{S∪S̄}α⁻¹y_f))}(ω(g)P^S f)`.
  If `S` is conjugation-free and `Ψ` Schwartz–Bruhat above `S`, then for `x ∈ 𝔸_f^p`
  `T_{t^{−*}finVec(x)}(ω(g)(Ψ·f)) = Ψ_x·T_{t^{−*}finVec(e_{(S∪S̄)^c}x)}(ω(g)P^S f)`, where
  `Ψ_x(y) = ∫ ψ₀(x*e_Sb)·Ψ(z(x, y, b)) dλ(b)` over `b ∈ 𝔸_f^p` integral outside `S`, and `z(x, y, b)` is the finite
  part of `g⁻¹(lt^{−*}x + ktb + ιy)`.
- (e) For `g` adapted to `t` there is `c ≠ 0` with
  `(ω(g)f)[x] = c·∫ ⟨ϱ(y)vac, f⟩·β₁(2x + a_y, b_y)·|vac(t*(x + a_y))|²·ϱ₀(w_y)vac₀ dμ(y)`, where `gy = la_y + ιw_y + kb_y`
  and `β₁(u, v) = ψ(½ȷv*u)` on `𝔸^p`.

*Needs:* 1.2, 1.4, 3.5–3.7, 5.1, 5.4.

[ShortProof], `Lib/Weil/MixedModel/ZeroTerm` (`New.Space.Splitting.exists_zeroTerm`, `New.Space.Splitting.zeroTerm`,
`New.Space.Splitting.zeroTerm_apply`, `New.Space.Splitting.slice`, `New.Space.Splitting.isMixedLaw_slice`,
`New.Space.Splitting.zeroTerm_comp`, `New.Space.Splitting.zeroTerm_congr`, `New.Space.Splitting.zeroTerm_ne_zero`,
`New.Space.Splitting.exists_tsum_slice_le`, `New.Space.Splitting.tsum_enorm_slice_le`,
`New.Space.Splitting.hasSum_theta_slice`, `New.Space.Splitting.IsAdapted.exists_omega_vacElem_of_isMixedLaw`,
`New.Space.Splitting.IsAdapted.slice_omega_vacElem`, `New.Space.Splitting.IsAdapted.omega_projOn_adelic_of_isMixedLaw`,
`New.Space.Splitting.sliceDatum`, `New.Space.Splitting.IsAdapted.omega_schrodingerOp_of_isMixedLaw`,
`New.Space.Splitting.IsAdapted.slice_omega_eq_integral`)

### 5.6 Parabolic laws, invariance of the theta functional and its normalisation

*Origin:* adapted from Kudla (1994), Theorem 3.1, and Gan and Ichino (2014), §7.4, the Levi and unipotent formulas on a
Siegel parabolic subgroup (ThetaKernelsForUnitaryDualPairs §3.3b), and from Kudla (1994) and Harris, Kudla and Sweet
(1996), the invariance of the theta functional under rational points (ThetaKernelsForUnitaryDualPairs §4.4a): here on
the space of data, for the zero term and the slices along a Witt decomposition with any `p` and any core, proved rather
than taken as a definition, and the invariance of `θ_V` under `U(J)(E)` for one unitary group.

*Method of the formal proof:* the zero term of `ω(g)f`, for `g` preserving the span of `k`, is a bounded map
intertwining the Heisenberg operators of the core, hence a multiple of `ω₀(g₀)ev_D` by Schur's lemma; the scalar is read
off at an adapted point by 5.5 (d). For a split space (`V₀ = 0`) the theta functional is invariant under both rational
Siegel parabolics by 5.5 (c) and the parabolic laws, which generate `U(J)(E)` by 5.1 (e); a general space is reduced to
the split space `V ⊕ V⁻` by the diagonal splitting and the product of 3.8 (a). Landherr's theorem provides the element
`g` of (d); independence of `g` follows from (c).

Let `D` be a splitting of `V` over `V₀` along `p`.

- (a) `x ↦ f[x]` is continuous and Bochner integrable on `𝔸^p`, and there is `C` with
  `∫ ⟨f[x], f′[x]⟩ dx = C·⟨f, f′⟩` for all `f, f′`.
- (b) If `g ∈ G_s` maps the adelic frame `k` to `k·a` with `det a = d ∈ 𝔸^×` and has core block `g₀`, then
  `ev_D(ω_V(g)f) = χ_𝔸(d)⁻¹·ω_{V₀}(g₀)ev_D(f)`. For Levi elements,
  `(ω_V(m(a, g₀))f)[x] = χ_𝔸(det a)⁻¹·ω_{V₀}(g₀)(f[a*x])`; for `z` hermitian, `(ω_V(n(0, z))f)[x] = ψ(−½x*zx)·f[x]`.
- (c) `θ_V(ω_V(γ)f) = θ_V(f)` for every `γ ∈ Γ_V` and every theta functional `θ_V`; hence `(ω_V(γ)f)(y) = f(γ⁻¹y)`.
- (d) *Normalisation.* For hermitian spaces `V`, `W` of signature `s` there is `g ∈ G_s` with `gΛ_V ⊂ Λ_W`. Fix theta
  functionals `θ_{±1}` of the two rank-one spaces; the theta functional `θ_V` of 3.6 (c) is the one with
  `θ_V(ω_V(g)ϱ(x)vac) = ∏_i θ_{s_i}(x_i)` for one, equivalently every, `g` with `gΛ_{Σ_s} ⊂ Λ_V` (3.6 (a)). With this
  normalisation: `θ_W(f) = θ_V(ω(g)f)` whenever `gΛ_W ⊂ Λ_V`; for the space `V·γ = (J, xγ)` moved by `γ ∈ G_s`,
  `θ_{V·γ}(f) = θ_V(ω(γ)f)`; `vac(y) = ∏_i θ_{s_i}(y_i)` when `V` and `Σ_s` have the same map `γ ↦ x⁻¹γ` on `E^n`;
  `θ_V(f₁ ⊠ f₂) = θ_{V₁}(f₁)θ_{V₂}(f₂)` for
  the product 3.8 (a) when the frame of `V` is block diagonal with blocks the frames of `V₁`, `V₂`; and for a change of
  coordinates `D_φ` (3.8 (b)) and `g` with `gx ∈ Λ_V` whenever `φ(x) ∈ Λ_{V₁}`, there is `c` with `|c| = 1` and
  `θ_{V₁}(f) = c·σ(θ_V(ω(g)D_φ f))`.

ThetaKernelsForUnitaryDualPairs §3.3b states the Levi and unipotent formulas locally, for a split space of the acting
group and Schwartz functions; the route needs them adelically, with a core and any `p`, on the space of data.

*Needs:* 3.6, 3.8, 5.1, 5.5; AdelicUnitaryGroupsAndAlgebraicModularForms §3.3 (a) (Landherr's theorem).

[ShortProof], `Lib/Weil/MixedModel/ThetaInvariance` (`New.Space.Splitting.continuous_slice`,
`New.Space.Splitting.integrable_slice`, `New.Space.Splitting.integral_dataInner_slice`,
`New.Space.Splitting.exists_zeroTerm_omega_eq_smul`, `New.Space.Splitting.zeroTerm_omega_levi`,
`New.Space.Splitting.slice_omega_levi`, `New.Space.Splitting.zeroTerm_omega`,
`New.Space.Splitting.slice_omega_radicalElement_zero`, `New.Space.thetaStabilizer`,
`New.Space.theta_omega_ratEmbed_of_splitting`, `New.Space.diagonalSplitting`, `New.Space.theta_omega_ratEmbed`,
`New.Space.omega_ratEmbed_apply`), `Lib/Weil/Construction/CanonicalTheta` (`New.CoordChange.exists_theta_omega_map`,
`New.Space.exists_mapsTo_ratVectors`, `New.Space.theta_omega_eq_of_mapsTo_ratVectors`,
`New.Space.theta_omega_rho_vacElem_eq_prod_lineTheta`, `New.Space.theta_eq_theta_omega`, `New.Space.theta_move`,
`New.Space.vacElem_apply_eq_prod_lineTheta`, `New.Space.theta_boxProd`)

### 5.7 Mixed models at the real places and sections with prescribed slices

*Origin:* particular to this proof: a mixed Schrödinger–Fock model of the real Fock spaces given by its defining laws, the decay of
its slices in moments, Fock vectors of finite moments with prescribed slices, and the real part of the adelic mixed law.

*Method of the formal proof:* moments of slices are bounded through the vacuum law and 2.3 (a); prescribed slices are
built by Fourier inversion in `x` and a non-stationary phase bound on the resulting oscillatory integrals; the adelic
statements reduce the mixed law at a point adapted at the infinite places to the Gaussian.

- (a) A *real mixed model* from signs `ε′` on `ι′` to signs `ε` on `ι` along `p` consists of matrices
  `L, K ∈ M_{ι′×p}(ℂ)`, `I ∈ M_{ι′×ι}(ℂ)` such that every `y ∈ ℂ^{ι′}` is uniquely `L(Ay) + I(Wy) + K(By)` for linear
  `A, W, B`, and bounded maps `slice_a : 𝓕(ε′) → 𝓕(ε)` (`a ∈ ℂ^p`) with
  `slice_a(ϱ(La′ + Iw + Kb)v) = β₁(2a + a′, b)·ϱ(w)slice_{a+a′}(v)` (`β₁(u, v) = exp(i Im v*u)`) and
  `slice_a(e) = exp(−|a|²)·e`. For each `N, M` there is `C` with `(1 + ‖a‖)^M·M_N(slice_a v) ≤ C·M_{N+M}(v)`; slices of
  vectors of finite moments have finite moments.
- (b) *Prescribed slices.* Let `τ` be a smooth compactly supported function on `ℂ^p`, `u : ℂ^p → U(ε)` smooth, and `ξ`
  of finite moments. There is `Φ ∈ 𝓕(ε′)` of finite moments with `slice_x(Φ) = τ(x)·ω_ε(u(x))ξ` for every `x`.
- (c) *Real part of the adelic mixed law.* Let `D` be a splitting, `g` adapted to `t` and `T` a family with the mixed
  law. For `a ∈ ℂ^{Φ×p}`, `T_{t^{−*}realVec(a)}(ω(g)pr_∞ f) = exp(−|a|²)·pr_∞(T_0(ω(g)pr_∞ f))`; and there is a
  bounded map `L` between the real Fock spaces with `L(e) = e` and `T_0(ω(g)(v ⊗ f)) = (Lv) ⊗ T_0(ω(g)pr_∞ f)`.

*Needs:* 2.1, 2.3, 3.4, 3.7, 4.1, 5.1, 5.5.

[ShortProof], `Lib/Weil/MixedModel/FockSections` (`New.Fock.MixedModel`, `New.Fock.MixedModel.exists_fockMoment_slice_le`,
`New.Fock.MixedModel.isSchwartzVector_slice`, `New.Fock.MixedModel.exists_isSchwartzVector_slice_eq`),
`Lib/Weil/MixedModel/RealTheta` (`New.Space.Splitting.IsAdapted.omega_projReal_of_isMixedLaw`,
`New.Space.Splitting.IsAdapted.exists_apply_zero_omega_integrated_eq`,
`New.Space.Splitting.IsAdapted.exists_map_vacVector_apply_zero_omega_eq`)

## Layer 6: The Weil representation of a unitary pair and theta kernels

A pair of hermitian spaces `S`, `T` acts on the space `Hom(S, T)` of maps by `x ↦ hxg⁻¹`; twisted by two automorphic
characters of `U(1)`, the Weil representation of `Hom(S, T)` (3.5) becomes a representation of `U(S)(𝔸) × U(T)(𝔸)`,
and the theta functional gives the theta kernel. This layer states the laws of these kernels: growth and convergence of
lifts in the abstract setting of a Banach space, rapid decay under support conditions, the formal laws of kernels with
data modulo an ideal, the flip, the mixed models of a pair, theta integrals, the Galois law, holomorphy, and the gluing
of two edges.

### 6.1 The space of maps, the Weil representation of a pair and data modulo an ideal

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; `x ↦ hxg⁻¹` is the Kronecker product `h ⊗ (g⁻¹)ᵀ` on `n′ × n` matrices,
which preserves the form of `Hom(S, T)`.

Let `S = (J_S, x_S)` and `T = (J_T, x_T)` be hermitian spaces of signatures `s` on `n` and `s′` on `n′`, and `a`, `b`
automorphic characters of `U(1)`.

- `Hom(S, T)` is the hermitian space on `n′ × n` (vectors are `n′ × n` matrices) with Gram matrix `J_T ⊗ (J_S⁻¹)ᵀ`,
  frame `x_T ⊗ (x_S⁻¹)ᵀ` and signs `(i, j) ↦ s′_i s_j`. The map `(g, h) ↦ [x ↦ hxg⁻¹]` is a homomorphism
  `G_s × G_{s′} → G_{Hom}`.
- The *Weil representation of the pair* on `𝒮(Hom(S, T))` is `ω_{a,b}(g, h) = a(det h)·b(det g)⁻¹·ω_{Hom(S,T)}(x ↦ hxg⁻¹)`,
  and its *theta kernel* is `θ_{a,b}(f; g, h) = θ_{Hom(S,T)}(ω_{a,b}(g, h)f)`. For an automorphic character `a` of
  `U(1)` and `k ∈ ℕ`, `a_k(x) = a(x/x̄)·υ(x)^{−k}` is a Hecke character of `E`; `υ_U` is the restriction of `υ` to
  `U(1)(𝔸)`, so `υ_U(x/x̄) = υ(x)²` (`υ(x̄) = υ(x)⁻¹`).
- A *modulus* `𝔪` is a nonzero ideal of `𝒪_E` such that no prime dividing `𝔪` has its conjugate dividing `𝔪`. Its
  places form a conjugation-free set; `R_𝔪 = 𝒪_E/𝔪`; a reduction `Ô → R_𝔪` extending `𝒪_E → R_𝔪` is fixed, with
  kernel `tÔ` for a finite idele `t` (integral, `1` outside `𝔪`, of order `ord_w(𝔪)` at `w | 𝔪`). For `Ψ` on
  `M_{n′×n}(R_𝔪)`, its lift `Ψ̃(x) = Ψ(e_𝔪x mod 𝔪)` if `e_𝔪x` is integral and `0` otherwise, with `e_𝔪` the
  idempotent of the places of `𝔪`. The *datum modulo `𝔪`* of `Ψ` and a Fock vector `v` is `v ⊗ (Ψ̃·vac)` (5.4), and the
  *kernel modulo `𝔪`* is `θ^{S,T}_{a,b}[Ψ, P](g, h) = θ_{a,b}(v_P ⊗ (Ψ̃·vac); g, h)` for a polynomial `P` in the
  variables `Φ × n′ × n`.

*Needs:* 2.1, 3.4, 3.6, 5.4; IdelicReciprocityCountsAndCyclotomicClassGroups §7.1 (characters of `U(1)`, weights, tame
parts).

[ShortProof], `Lib/Weil/DualPair/Kronecker` (`New.kroneckerGL`, `New.U.kroneckerHom`), `Lib/Weil/DualPair/Defs`
(`New.homSigns`, `New.G.onHom`, `New.G.det`, `New.Space.hom`, `New.WeilData.upsilonU1`, `New.AutChar.spaceChar`,
`New.pairChar`, `New.pairWeil`, `New.pairTheta`, `New.Modulus`, `New.Modulus.liftFn`, `New.Modulus.generator`,
`New.modDatum`, `New.modKernel`, `New.stdKernel`)

### 6.2 Laws of the Weil action of a pair

*Origin:* particular to this proof: the laws of the pair representation of 6.1 that the theta kernels use: rational
points act by substitution, translation and continuity of kernels, the real action on Fock vectors at the real places,
levels of finite data, and data modulo an ideal.

*Method of the formal proof:* rational points by 5.6 (c) for `Hom(S, T)` and the triviality of automorphic characters on
rational points; real points by 3.7 (e) and 2.1 (d) with the weights of the characters; the action on polynomial
vectors at block-diagonal real points by the coefficient formula of 2.4 (a); levels from 3.7 (d); the facts modulo `𝔪`
by finite Fourier analysis on `M(R_𝔪)`.

Let `S`, `T`, `a`, `b` be as in 6.1.

- (a) `ω_{a,b}` is a jointly continuous representation of `G_s × G_{s′}` preserving `⟨·,·⟩`. For `g ∈ Γ_S`, `h ∈ Γ_T`
  and `x ∈ M_{n′×n}(𝔸)`, `(ω_{a,b}(g, h)f)(x) = f(h⁻¹xg)`. `θ_{a,b}(f; pq) = θ_{a,b}(ω_{a,b}(q)f; p)`, and
  `(g, h) ↦ θ_{a,b}(f; g, h)` is continuous. So `(ω_{a,b}, θ_{Hom(S,T)})` is a theta kernel in the sense of 6.4. In
  rational coordinates (an adelic matrix `x ∈ M_{n′×n}(𝔸)` standing for the vector `x_T⁻¹·x·x_S` of `Hom(S, T)`), the
  Heisenberg datum of `Hom(S, T)` is `β(x, y) = ψ(½ȷ·tr(y†x))`, `y† = J_S⁻¹y*J_T`.
- (b) *Real points.* On the Fock space of `Φ × n′ × n`, `ω_∞(x, y) = ∏_w det(y_w)^{γ_w}det(x_w)^{−γ′_w}·ω(z ↦ y_w z x_w⁻¹)`
  defines a representation of `G_{s,∞} × G_{s′,∞}` (2.4 (b)). If `a` has weight `γ` and `b` weight `γ′` (any tame
  parts), then `ω_{a,b}((x, k), (y, k′))(v ⊗ f) = (ω_∞(x, y)v) ⊗ ω_{a,b}(k, k′)f`. If each `x_w`, `y_w` is block diagonal
  for the signs, then `ω_∞(x, y)v_P = c(x, y)·v_{P′}`, where `c(x, y)` is the product over `w` and `σ = ±1` of
  `det(y_w|_σ)^{γ_w − #{i : s_i = −σ}}·det(x_w|_σ)^{#{i : s′_i = −σ} − γ′_w}` (`|_σ` the block of sign `σ`) and `P′` is
  the linear substitution `X_{w,a,b} ↦ Σ_{i,j} m_{w,a,b,i,j}X_{w,i,j}` with
  `m = (y_w)_{ia}((x_w)⁻¹)_{bj}` if `s′_a = s_b` and `m = ((y_w)⁻¹)_{ai}(x_w)_{jb}` otherwise.
- (c) *Levels.* For `f ∈ 𝒮_f(Hom(S, T))` there are open subgroups `K ⊂ G_{f,n}`, `K′ ⊂ G_{f,n′}` with
  `ω_{a,b}(k, k′)f = f` for `k ∈ K`, `k′ ∈ K′`.
- (d) *Modulo `𝔪`.* `Ψ̃` is Schwartz–Bruhat above the places of `𝔪`, and
  `⟨Ψ̃, Ψ̃′⟩ = #(R_𝔪^{n})⁻¹·Σ conj(Ψ)Ψ′` (functions on `R_𝔪^n`). There is a primitive additive character `ψ_𝔪` of `R_𝔪`
  with `ψ_𝔪(x mod 𝔪) = ψ₀(t⁻¹x)` for `x ∈ Ô`. The named datum of the point mass at `a ∈ R_𝔪^n` is
  `Σ_b #(R_𝔪^n)⁻¹·ψ_𝔪(−a·b)·ϱ_f(ȳ_b)P^{𝔪}f`, where `y_b` is the part at the places of `𝔪` of `t⁻¹u_b` for an integral
  lift `u_b` of `b`.

*Needs:* 2.4, 3.5–3.7, 5.4, 5.6, 6.1.

[ShortProof], `Lib/Weil/DualPair/WeilAction` (`New.pairWeil_of_mem_Gamma`, `New.pairTheta_mul`, `New.continuous_pairTheta`,
`New.dataInner_pairWeil`, `New.pairThetaKer`, `New.pairHomInf`, `New.realPairWeil`, `New.realPairWeil_polyVector`,
`New.realPairWeil_vacVector`, `New.pairWeil_integrated`, `New.pairWeil_integrated_fin`, `New.pairWeil_integrated_right`,
`New.pairWeil_integrated_all`, `New.exists_level_pairWeil`, `New.Space.homBicharacter_eq`), `Lib/Weil/DualPair/Defs`
(`New.Modulus.isSchwartzBruhat_liftFn`, `New.Modulus.localInner_liftFn`, `New.Modulus.exists_isPrimitive_addChar`,
`New.Modulus.primAddChar`, `New.Modulus.schrodingerOp_single_eq_mean_translate_projOn`)

### 6.3 Finite action, sums, negation and moved points

*Origin:* adapted from Harris, Kudla and Sweet (1996), Appendix, Corollary A.3, the compatibility of the splittings with
orthogonal sums (ThetaKernelsForUnitaryDualPairs §3.3b, *Orthogonal sums*): here for the pair representation of 6.1 on
the space of data: the action of finite points on named data, the factorisation over orthogonal sums, negation of the
source space and the change of frames.

*Method of the formal proof:* finite points supported at `A ∪ Ā` by 5.4 (b) and 3.2 (c); orthogonal sums by 3.8 (a)
and 5.6 (d); negation by a change of coordinates `x ↦ (1, u⁻¹)x` with `ūu = −1` (3.8 (b)), whose multiplier is the
conjugate twisted by `υ(det)`.

Let `A` be conjugation-free and `Ψ` Schwartz–Bruhat above `A` on `M_{n′×n}(𝔸_f)`.

- (a) For `g ∈ G_{f,n}`, `h ∈ G_{f,n′}` equal to `1` outside `A ∪ Ā`:
  `ω_{a,b}(g, h)(Ψ·f) = a_n(det_A h)·b_{n′}(det_A g)⁻¹·|det_A g|^{n′/2}·|det_A h|^{−n/2}·(x ↦ Ψ(h⁻¹xg))·f`. For `g, h`
  integral at the finite places: `ω_{a,b}(g, h)(Ψ·f) = (x ↦ Ψ(h_f⁻¹xg_f))·ω_{a,b}(g, h)f`. If `P^A f = f` and
  `g ∈ K₀`, `h ∈ K₀` are `1` outside `A ∪ Ā`, then `ω_{a,b}(g, h)f = a(det h)·b(det g)⁻¹·f`.
- (b) *Sums.* For `T = T₁ ⊕ T₂` with block-diagonal frame, `θ_{Hom(S,T)}(f₁ ⊠ f₂) = θ_{Hom(S,T₁)}(f₁)·θ_{Hom(S,T₂)}(f₂)`,
  and likewise for `S = S₁ ⊕ S₂`; and
  `ω_{bb′,a}((g₁, g₂), h)(f ⊠ f′) = ω_{b,a}(g₁, h)f ⊠ ω_{b′,a}(g₂, h)f′` on `Hom(S₁ ⊕ S₂, T)`, with the analogous law on
  `Hom(T, V₁ ⊕ V₂)` for block-diagonal `g`.
- (c) *Negation.* Let `S⁻` be `S` with form `−J_S` (and frame adjusted by an idele `u` with `ūu = −1`), and `D` the
  corresponding change of coordinates `𝒮(Hom(S, T)) → 𝒮(Hom(S⁻, T))`. Then
  `ω_{a⁻¹υ_U^{|n|}, b⁻¹υ_U^{|n′|}}(g⁻, h)D(f) = D(ω_{a,b}(g, h)f)` and there is `c` with `|c| = 1` and
  `θ_{Hom(S⁻,T)}(c·D(f)) = conj θ_{Hom(S,T)}(f)`.
- (d) *Moved frames.* `θ_{a,b}^{S·γ, T·γ′}(f; g, h) = b(det γ)·a(det γ′)⁻¹·θ_{a,b}^{S,T}(f; γg, γ′h)`.

*Needs:* 3.8, 5.4, 5.6, 6.1, 6.2.

[ShortProof], `Lib/Weil/DualPair/FiniteAction` (`New.pairWeil_schrodingerOp_of_mem_supportedOn`,
`New.pairWeil_schrodingerOp_of_mem`, `New.pairWeil_eq_smul_of_projOn_eq`, `New.theta_boxProd_target`,
`New.theta_boxProd_source`, `New.pairWeil_boxProd_source`, `New.pairWeil_boxProd_target`, `New.negSource`,
`New.conj_weilMultiplier_of_eq_neg`, `New.pairWeil_negSource`, `New.exists_theta_negSource`, `New.Space.pairTheta_move`)

### 6.4 Growth of theta kernels and convergence of theta lifts

*Origin:* adapted from Rallis (1984), *Injectivity properties of liftings associated to Weil representations*, §1, the
adjoint of a theta lift (ThetaLiftsForDefiniteUnitaryGroups §1.4): here for an abstract theta kernel on a Banach space,
on unitary groups of any signature: moderate growth of the kernel in a complete norm, convergence, continuity and
moderate growth of lifts of rapidly decreasing functions, transposition and adjointness.

*Method of the formal proof:* the Banach–Steinhaus theorem bounds `ω` on compact sets; reduction theory writes
`g = γ·c·r` with `γ` rational, `c` in a compact set and real factors of norm at most `ht(g)`, so
`‖ω(g₀, γg)‖ ≤ (2ht(g))^a` for a suitable rational `γ`; with the invariance of `θ` this gives the bound (a). Rapid decay
of `y` against moderate growth makes the integrals absolutely convergent, and Fubini gives (c) and (d).

Let `S`, `T` be hermitian spaces of any signatures `s`, `t`. A *theta kernel* is a Banach space `X` with a homomorphism
`ω` from `G_s × G_t` to the bounded operators on `X`, jointly continuous, and a continuous linear form `θ` with
`θ(ω(γg, γ′h)φ) = θ(ω(g, h)φ)` for `γ ∈ Γ_S`, `γ′ ∈ Γ_T`. The *lift* of a function `y` on `G_s` is
`L_φy(h) = ∫_{[S]} θ(ω(g, h)φ)·y(g) dg` (quotient measure); `L^t_φ` is the lift for the kernel with the two groups
exchanged.

- (a) There are `C`, `A` with `|θ(ω(g, h)φ)| ≤ C·‖φ‖·(ht(g)·ht(h))^A` for all `g`, `h`, `φ`. For fixed `g₀ ∈ G_s` and
  all large `a`, every `h ∈ G_t` has `γ ∈ Γ_T` with `‖ω(g₀, γh)‖ ≤ 2^a·ht(h)^a`.
- (b) Let `y` be automorphic and rapidly decreasing on `G_s`. Then `g ↦ θ(ω(g, h)φ)y(g)` is integrable on `[S]`; there
  are continuous linear forms `L_h` with `L_φy(h) = L_h(φ)`; `L_φy` is continuous, left invariant under `Γ_T`, of
  moderate growth, and `L_{ω(k, k′)φ}(g ↦ y(gk))(h) = (L_φy)(hk′)` for all `k ∈ G_s`, `k′ ∈ G_t`, `h ∈ G_t`.
- (c) For `y`, `y′` automorphic and rapidly decreasing on `G_s`, `G_t`:
  `∫_{[T]} y′·L_φy = ∫_{[S]} y·L^t_φy′`, and `⟨y′, L_φy⟩_T = ⟨conj L^t_φ(conj y′), y⟩_S` (Petersson products): the
  adjoint of the lift is the *descent* `y′ ↦ conj L^t_φ(conj y′)`.
- (d) For a third space `U`, a continuous moderate `w` on `G_u`, a continuous map `c : G_u → G_t` with
  `ht(c(z)) ≤ C·ht(z)`, and `F` automorphic and rapidly decreasing on `G_u`, the function
  `(z, g) ↦ w(z)F(z)·θ(ω(g, c(z))φ)·y(g)` is integrable on `[U] × [S]`.

*Needs:* 6.2; AdelicUnitaryGroupsAndAlgebraicModularForms §§1.1, 4.2, 4.4 (a), 5.1 (heights, Mahler's criterion,
automorphic functions).

[ShortProof], `Lib/Weil/DualPair/ThetaLiftConvergence` (`New.Space.exists_reduction_norm_le_height`,
`New.ThetaKernel.eventually_exists_norm_omega_le_mul_height_pow`, `New.exists_norm_pairWeil_mul_real_le`,
`New.Space.lift`, `New.Space.ModerateWeight`, `New.ThetaKernel.swap`, `New.ThetaKernel.moderate_growth`,
`New.ThetaKernel.lift_equivariant`, `New.ThetaKernel.integrable_theta_mul`, `New.ThetaKernel.liftBilin`,
`New.ThetaKernel.exists_clm_lift`, `New.ThetaKernel.continuous_lift`, `New.ThetaKernel.isModerate_lift`,
`New.ThetaKernel.integrable_prod_weightFn`, `New.ThetaKernel.integral_mul_lift_eq_integral_mul_lift_swap`,
`New.ThetaKernel.petersson_lift_eq_petersson_descent`)

### 6.5 Short isotropic vectors and means over isotropic subspaces

*Origin:* particular to this proof: short isotropic lattice vectors at points of large height, the vanishing of
invariant functionals on named data whose support is not orthogonal to the invariance, and the approximation of an
invariant functional by its mean over an isotropic subspace spanned by short vectors.

*Method of the formal proof:* a point of large height has a short lattice vector, and short vectors of a hermitian
lattice can be made isotropic; an invariant functional on named data is a mean of characters, which vanishes when the
support meets no orthogonal vector; the difference between `Λ` and its mean is controlled by translations of size `δ` in
the real coordinates, to which 2.3 (c) applies.

- (a) If `ht(g) > 2` for `g ∈ G_s`, the lattice of `S` moved by `g` has a nonzero isotropic vector of archimedean norm
  at most `2/ht(g)`.
- (b) Let `P` be conjugation-free, `Ψ` Schwartz–Bruhat above `P`, `I` an `𝔸`-submodule of `𝔸^n` and `A` a bounded map
  with `A(ϱ(z)f) = A(f)` for `z ∈ I`. If every `y` with `Ψ(y) ≠ 0` has some `z ∈ I` with `z_f*y ≠ 0`, then
  `A(Ψ·f) = 0`. On `Hom(S, T)`: if `ℓ` is invariant under the Heisenberg operators of the maps `X·z·Y*ε_s` and
  `X_f*·y·Y_f ≠ 0` whenever `Ψ(y) ≠ 0`, then `ℓ(Ψ·f) = 0`.
- (c) For a subspace `Z ⊂ E^n`, `Z(𝔸)/Z(E)` is compact; for `Z` isotropic and `Λ` invariant under `ϱ(x⁻¹γ)`, `γ ∈ Z`,
  the mean `Λ₀(f)` of `Λ(ϱ(z)f)` over `z ∈ Z(𝔸)/Z(E)` is a continuous linear form.
- (d) For `f₀ ∈ 𝒮_f(V)`, `l ∈ ℕ` and a finite set `ι` there is `C ≥ 0` such that, for all `g ∈ G_s`, `δ ≥ 0`, vectors
  `z_i` (`i ∈ ι`) of the lattice of `V` moved by `g` of archimedean norm at most `δ` spanning an isotropic `Z`, `Λ`
  invariant under `Z` with mean `Λ₀`, and `v` with `M_l(v) < ∞`:
  `|(Λ − Λ₀)(ω(g)(v ⊗ f₀))| ≤ C·‖Λ ∘ ω(g)‖·δ^l·M_l(v)`.

*Needs:* 2.3, 3.5, 3.7, 5.3, 5.4; AdelicUnitaryGroupsAndAlgebraicModularForms §§3.1, 4.2 (lattices, first minima,
heights).

[ShortProof], `Lib/Weil/DualPair/ShortIsotropicVectors` (`New.Space.coordMatrix`, `New.Space.exists_short_isotropic`,
`New.Space.map_eq_zero_of_support_not_orthogonal`, `New.shiftMatrix`, `New.map_schrodingerOp_eq_zero_of_invariant`,
`New.Space.adelicPoints`, `New.Space.ratPoints`, `New.Space.compactSpace_adelicPoints_quotient`, `New.Space.subspaceMean`,
`New.Space.exists_eq_subspaceMean`, `New.Space.exists_rho_eq_realHeisenbergOp`, `New.Space.exists_norm_sub_subspaceMean_le`)

### 6.6 Rapid decay of theta kernels under support conditions

*Origin:* adapted from the regularisation of theta integrals of Kudla and Rallis (1994) and Ichino (2004)
(ThetaKernelsForUnitaryDualPairs §5.7b (i)): here on the space of data, for data `v ⊗ Ψ ⊗ vac` with `Ψ` supported on
maps of full rank after a ring homomorphism from `𝔸_f`, with real data of finite moments, by short pairs of rational
vectors instead of Siegel sets.

*Method of the formal proof:* at a point of large height there is a short isotropic vector (6.5 (a)); with a short
vector on the other side it gives a *short pair*, along which the kernel functional either kills the datum (6.5 (b),
using the support condition) or is close to its mean (6.5 (d)); the gain `δ^l` against the polynomial growth of 6.4 (a)
gives decay of every order.

Let `S`, `T` be hermitian spaces of signatures `s` on `n` and `s′` on `n′`.

- (a) *Abstract estimate.* A *short pair* at `(g, h)` for a functional `ℓ` and a function `Ψ`, of size `(x, y, t)`, is a
  pair of rational matrices `d ∈ M_{n′×p}(E)`, `c ∈ M_{n×q}(E)` whose columns lie in the lattices of `T·h` and `S·g` with
  archimedean norms at most `x` and `y`, with `xy ≤ t`, `d` or `c` isotropic, `ℓ` invariant under the Heisenberg
  operators of the maps `z·c*J_S`, and either `d′*·u·c′ ≠ 0` (finite parts of the coordinates at `h`, `g`) whenever
  `Ψ(u) ≠ 0`, or the mean of `ℓ ∘ ϱ` over the span of the maps `d_i⟨c_j, ·⟩` vanishing. For `P` conjugation-free, `Ψ`
  Schwartz–Bruhat above `P`, `f₀ ∈ 𝒮_f(Hom(S, T))`, `N, A ∈ ℕ` and `Y, Z ∈ ℝ` there is `C` such that: if `ρ ≥ 1`,
  `H > 0`, `M_{N+A}(v) < ∞`, `|ℓ(ω_{a,b}(g, h)f)| ≤ Y‖f‖(ρH)^A` for all `f`, and for `H > 2` a short pair of size
  `(x, y, Zρ(2/H))` exists, then `|ℓ(ω_{a,b}(g, h)(v ⊗ Ψ·f₀))|·H^N ≤ C·M_{N+A}(v)·ρ^{N+2A}`.
- (b) Let `φ : 𝔸_f → R` be a ring homomorphism to a nonzero commutative ring, `P` conjugation-free and `Ψ`
  Schwartz–Bruhat above `P`.
  If for every `y` with `Ψ(y) ≠ 0` the matrix `φ(y)ᵀ` has a left inverse (`y` onto), then for every `N` there are `B`,
  `M`, `C` with `|θ_{a,b}(v ⊗ Ψ·vac; g, k)|·ht(k)^N ≤ C·M_M(v)·ht(g)^B` for all `v` with `M_M(v) < ∞` and all `g`, `k`. If
  instead `φ(y)` has a left inverse (`y` injective), the same holds with the roles of `g` and `k` exchanged:
  `|θ_{a,b}(v ⊗ Ψ·vac; g, k)|·ht(g)^N ≤ C·M_M(v)·ht(k)^B`.
- (c) *Modulo `𝔪`.* Let `𝔪 ≠ 𝒪_E` be a modulus and `Ψ` a function on `M_{n′×n}(R_𝔪)` supported on matrices with a left
  inverse. For every `M` there are `B`, `N`, `C` with `|θ_{a,b}(v ⊗ Ψ̃·vac; g, h)|·ht(g)^M ≤ C·M_N(v)·ht(h)^B`; if `Ψ` is
  supported on matrices whose transpose has a left inverse, the same holds with `g`, `h` exchanged.

ThetaKernelsForUnitaryDualPairs §5.7b (i) states rapid decay on Siegel sets for Schwartz data supported on matrices of
full rank at a split place; the route needs the statement for its data of finite moments, which are not Schwartz
functions.

*Needs:* 2.3, 5.3, 5.4, 6.1, 6.2, 6.4, 6.5.

[ShortProof], `Lib/Weil/DualPair/KernelDecay` (`New.Space.rankOneMaps`, `New.IsShortPair`,
`New.exists_norm_pairWeil_schrodingerOp_mul_pow_le`, `New.pairTheta_decay_of_onto`, `New.pairTheta_decay_of_injective`,
`New.pairTheta_modDatum_decay`, `New.pairTheta_modDatum_decay_of_rightInv`)

### 6.7 Theta kernels modulo an ideal: formal laws

*Origin:* adapted from Harris, Kudla and Sweet (1996), Appendix, Corollary A.3, the compatibility of the splittings with
orthogonal sums (ThetaKernelsForUnitaryDualPairs §3.3b, *Orthogonal sums*): here for the kernels modulo `𝔪` of 6.1, with
the laws of twisting, translation by the lattice stabiliser, products over orthogonal sums, conjugation and change of
modulus.

*Method of the formal proof:* the laws on data (6.3, 5.4 (b), (c)) read through the theta functional; conjugation by
6.3 (c).

Let `S`, `T`, `a`, `b`, `𝔪` be as in 6.1; `Ψ` on `M_{n′×n}(R_𝔪)` and `P` a polynomial.

- (a) `θ^{S,T}_{a,b}[Ψ, P]` is bilinear in `(Ψ, P)`; `θ^{S,T}_{aμ,bμ′}[Ψ, P](g, h) = μ(det h)·μ′(det g)⁻¹·θ^{S,T}_{a,b}[Ψ, P](g, h)`
  for automorphic characters `μ, μ′`.
- (b) For `k ∈ K₀` of `S`: `θ^{S,T}_{a,b}[Ψ, P](g·k, h) = θ^{S,T}_{a,b}[b(det k)⁻¹·Ψ(· k̄), P](g, h)`, where `k̄` is the
  reduction of `k` modulo `𝔪`; for `k ∈ K₀` of `T`, `θ^{S,T}_{a,b}[Ψ, P](g, h·k) = θ^{S,T}_{a,b}[a(det k)·Ψ(k̄⁻¹·), P](g, h)`.
- (c) *Sums.* `θ^{S,T⊕V}_{a,bb′}[Ψ ⊗ Ψ′, P ⊗ P′](g, (h, h′)) = θ^{S,T}_{a,b}[Ψ, P](g, h)·θ^{S,V}_{a,b′}[Ψ′, P′](g, h′)` (rows
  split), likewise `θ^{S⊕V,T}_{aa′,b}[Ψ ⊗ Ψ′, P ⊗ P′]((g, g′), h) = θ^{S,T}_{a,b}[Ψ, P](g, h)·θ^{V,T}_{a′,b}[Ψ′, P′](g′, h)`
  (columns split), and more generally at block-diagonal points of `T` along any splitting of its frame.
- (d) *Conjugation.* There is `c` with `|c| = 1` such that for all `a, b, 𝔪, Ψ, P, g, h`:
  `conj θ^{S,T}_{a,b}[Ψ, P](g, h) = c·θ^{S⁻,T}_{a⁻¹υ_U^{|n|}, b⁻¹υ_U^{|n′|}}[Ψ′, P̄](g⁻, h)`, with
  `Ψ′(x) = conj Ψ(u⁻¹x)` (`ūu = −1`) and `P̄` the conjugate polynomial.
- (e) *Change of modulus.* If `𝔪′ ⊂ 𝔪`, then `θ^{S,T}_{a,b}[Ψ ∘ (mod 𝔪), P]` computed modulo `𝔪′` equals
  `θ^{S,T}_{a,b}[Ψ, P]`; relabelling rows and columns changes `Ψ` and `P` accordingly.

*Needs:* 5.4, 6.1–6.3.

[ShortProof], `Lib/Weil/DualPair/KernelLaws` (`New.Modulus.reductionGL`, `New.modKernelBilin`, `New.modKernel_twist`,
`New.pairWeil_modDatum_stdLevel`, `New.modKernel_mul_stdLevel_left`, `New.modKernel_mul_stdLevel_right`,
`New.modKernel_block_right`, `New.modKernel_sum_right`, `New.modKernel_sum_left`, `New.stdKernel_sum_right`,
`New.stdKernel_sum_left`, `New.exists_conj_modKernel_eq_mul_modKernel_neg`, `New.exists_stdKernel_neg_left`,
`New.modDatum_factor`, `New.modKernel_factor`, `New.modKernel_reindex`, `New.Rows.modKernelStdSpace_block`)

### 6.8 Flipping a dual pair

*Origin:* particular to this proof: the identification, by taking adjoints, of the pair `(V, W)` acting on `Hom(V, W)`
with the pair `(W, V⁻)` acting on `Hom(W, V⁻)`, with its effect on the Weil action, the theta functional, named data and
kernels modulo `𝔪` (where it acts by a finite Fourier transform).

*Method of the formal proof:* `x ↦ (1, cα/ᾱ)·ε_s x*ε_t` (`c ∈ Ô^×`, `c̄c = −1`) is a change of coordinates in the sense
of 3.8 (b); 5.6 (d) gives the theta functional up to a unit; named data transform by 5.4 (c); for kernels modulo `𝔪`, a
datum at the conjugate places is rewritten at the places of `𝔪` by finite Fourier inversion (6.2 (d)).

Let `V` (signature `t` on `a`), `W` (signature `s` on `n`) be hermitian spaces, `c ∈ Ô^×` with `c̄c = −1`, and `V′` of
signature `−t` with frame `x_{V′} = (1, cα/ᾱ)*·x_V`; let `D` be the flip `𝒮(Hom(V, W)) → 𝒮(Hom(W, V′))`.

- (a) `D(ω_{a′,b}(g, h)f) = ω_{b⁻¹υ_U^{|n|}, a′⁻¹υ_U^{|a|}}(h, g⁻)D(f)`; there is `z` with `|z| = 1` and
  `θ_{Hom(W,V′)}(D f) = z·θ_{Hom(V,W)}(f)`; for `A` conjugation-free and `Ψ` Schwartz–Bruhat above `A`,
  `D(Ψ·vac) = (y ↦ Ψ(c·y*))·vac` with the places `Ā`; real data: the flip maps `v_P` to `v_{P^♭}` with `P^♭` obtained by
  `X_{τ,i,j} ↦ s_it_jX_{τ,j,i}` (that is `−s_it′_j`, with `t′ = −t` the signs of `V′`).
- (b) *Kernels.* Given `l ∈ G_{−t}` with `x_{V′}·l = (1, cα/ᾱ)*·x_V` and `b`, there is `z`, `|z| = 1`, such that for all
  `a′, f, g, h, g′` with `g′ = l·g` (matrices): `θ_{b⁻¹υ_U^{|n|}, a′⁻¹υ_U^{|a|}}(D f; h, g′) = z·θ_{a′,b}(f; g, h)`.
- (c) *Modulo `𝔪`.* Let `S` (signature `s` on `n`) and `T` (signature `t` on `m`) be hermitian spaces, `𝔪` a modulus and
  `V` of signature `−t` on `m` with frame `(1, c)·x_T`. There is `C` with `|C|²·#R_𝔪^{|m||n|} = 1` such that for all
  `D_𝔪` on `M_{n×m}(R_𝔪)`, `P`, `g ∈ G_t`, `h ∈ G_s`:
  `θ^{V,S}_{a,b}[D_𝔪, P](g⁻, h) = C·θ^{S,T}_{b⁻¹υ_U^{|n|}, a⁻¹υ_U^{|m|}}[D̂_𝔪, P^♭](h, g·φ_𝔪)`, where `D̂_𝔪` is the finite
  Fourier transform of `D_𝔪` for the character `ψ_𝔪(−c̄·)`, `φ_𝔪` is a fixed scalar element of `G_{f,m}`, and `P^♭` is
  `P` with `X_{τ,i,j} ↦ −s_it_jX_{τ,j,i}`. Likewise there is `C′` with `|C′|²·#R_𝔪^{|n||m|} = 1` and
  `conj θ^{S,T}_{a,b}[D_𝔪, P](g, h) = C′·θ^{T,S}_{b,a}[F, P̄^♭](h, g·φ_𝔪)`, `F` the Fourier transform of `conj D_𝔪` for
  `ψ_𝔪`. For lines: let `L`, `L′` be the standard lines of signs `−ε` and `ε` (`ε = ±1`; the rank-one spaces of
  3.6 (a)), `b`, `a′` automorphic characters of `U(1)` and `k ∈ G_{f,1}`. There are an additive character `ψ` of `R_𝔪`
  and `c ≠ 0` with `|c|²·#R_𝔪^{|n|} = 1`, both depending on `k`, `a′` and `b`, such that
  `θ^{L,S}_{1,b}[D_𝔪, P]((1, k), h) = c·θ^{S,L′}_{a′,υ_U}[D̂_𝔪, P^♭](h, (1, k·φ_𝔪))` for all `D_𝔪` on `M_{n×1}(R_𝔪)`,
  all `P` and all `h ∈ G_s`; here `(1, k)` is the point with real part `1` and finite part `k`, `D̂_𝔪` is the finite
  Fourier transform of `D_𝔪` for `ψ`, `φ_𝔪` the scalar element of rank one, and `P^♭` is `P` with
  `X_{τ,i,1} ↦ −s_iεX_{τ,1,i}`.

*Needs:* 3.8, 5.4, 5.6, 6.1–6.3, 6.7.

[ShortProof], `Lib/Weil/DualPair/Flip` (`New.flipIdele`, `New.flipCoords`, `New.flipCoords_map_pairWeil`,
`New.exists_theta_flipCoords_map_eq_mul`, `New.flipCoords_map_schrodingerOp`, `New.Seesaw.flipSpace`,
`New.exists_pairTheta_flip`, `New.flipPoly`, `New.realMap_flipCoords_polyVector`, `New.Modulus.flipScalar`,
`New.Modulus.exists_modKernel_flip`, `New.Exchange.exists_conj_modKernel_eq_swap`, `New.exists_modKernel_flip_line`)

### 6.9 Mixed models of a pair with one split space

*Origin:* particular to this proof: the zero terms and slices of 5.5 for the spaces `Hom(V, T)` and `Hom(T, V)` induced
by a splitting of `V`, with their laws under the pair representation: the Levi and unipotent laws of the slices, the
zero term under the stabiliser of the frame on either side, and the expansion of the theta functional over rational
matrices.

*Method of the formal proof:* a splitting `D` of `V` induces splittings of `Hom(V, T)` and `Hom(T, V)` with frames
`J_T⁻¹ ⊗ (k*J)ᵀ`, `1 ⊗ (l*J)ᵀ` and `k ⊗ J_Tᵀ`, `l ⊗ 1`; the laws of 5.5 and 5.6 for these splittings give the laws of
the pair; the characters are those of 6.1, read through `det g = (det m/det m̄)·det g₀`.

Let `D` be a splitting of `V` (signature `s` on `n`) over `V₀` along `p`, and `T` of signature `s′` on `n′`. For
`x ∈ M_{n′×p}(𝔸)` the *matrix slice* of `f ∈ 𝒮(Hom(V, T))` is `f[x]`, the slice of the induced splitting at `x` read
through the frame of `T`.

- (a) `θ_{Hom(V,T)}(f) = Σ_{x∈M_{n′×p}(E)} θ_{Hom(V₀,T)}(f[x_T⁻¹x])`; the zero term of the induced splitting with `k` and
  `l` exchanged is `∫ f[x] dx`; and `(ϱ(y)f)[x] = ψ(½ȷ·tr((yl)*ε′(2x + yk)))·ϱ(yι)f[x + yk]`.
- (b) If `g` maps the frame `k` to `k·m` (`m ∈ GL_p(𝔸)`) with core block `g₀`, then
  `ev(ω_{aυ_U^{|p|},b}(g, h)f) = b_{|n′|}(det m)⁻¹·|det m|^{|n′|/2}·ω_{a,b}(g₀, h)ev(f)` on `Hom(V, T)` and
  `ev(ω_{a,bυ_U^{|p|}}(h, g)f) = a_{|n′|}(det m)·|det m|^{|n′|/2}·ω_{a,b}(h, g₀)ev(f)` on `Hom(T, V)`.
- (c) `(ω_{aυ_U^{|p|},b}(m(m, g₀), h)f)[x] = b_{|n′|}(det m)⁻¹·|det m|^{|n′|/2}·ω_{a,b}(g₀, h)(f[h⁻¹xm])`, and
  `(ω_{a,b}(n(c, z), 1)f)[x] = ψ(½tr(z·x*ε_{s′}x))·ϱ(xc*ε_{s₀})f[x]`.
- (d) If `D` is base-adapted (5.2), the induced splitting of `Hom(V, T)` is adapted at the point `1` to
  `t = (x_T⁻¹)* ⊗ 1`, and the matrix slice is the slice of 5.5 at `t^{−*}·x`.

*Needs:* 5.2, 5.5, 5.6, 6.1, 6.2.

[ShortProof], `Lib/Weil/DualPair/MixedModel` (`New.Space.dualFrame`, `New.Space.Splitting.homSource`,
`New.Space.Splitting.homTarget`, `New.Space.Splitting.zeroTerm_homSource_congr`,
`New.Space.Splitting.zeroTerm_homSource_comp`, `New.Space.Splitting.homSlice`, `New.Space.Splitting.hasSum_theta_homSlice`,
`New.Space.Splitting.symm_homSource_zeroTerm_eq_integral`, `New.Space.Splitting.homSlice_rho`,
`New.Space.Splitting.det_eq_divStar_mul`, `New.Space.Splitting.homSource_zeroTerm_pairWeil`,
`New.Space.Splitting.homTarget_zeroTerm_pairWeil`, `New.Space.Splitting.homSlice_levi`,
`New.Space.Splitting.homSlice_radicalElement`), `Lib/Weil/MixedModel/AdaptedSplitting` (`New.Exchange.adaptedHomBasis`,
`New.Exchange.homSlice_eq_adapted_slice`, `New.Exchange.isAdapted_homSource`)

### 6.10 Slices of an adapted splitting: real, named and finite parts

*Origin:* particular to this proof: for a splitting adapted at the point `1`, the separation of the slices into a real
mixed model at the infinite places and a finite part, and the slices of data named through a semilocal field, in
particular of the standard data of an integral frame.

*Method of the formal proof:* the adapted frame at the infinite places is a real mixed model (5.7 (a)); its slices of
real insertions factor by 1.4 (a); named data read through `π` factor in the adapted frame, and the integral over the
frame variable is evaluated by orthogonality of characters on `O`.

Let `D` be adapted at the point `1` to `t`; let `c_D ≠ 0` be the constant of 5.5 (d) at `g = 1`, and `μ_D` the real
mixed model of the adapted frame at the infinite places. Let `F` be a semilocal field (3.9), `A` a conjugation-free set
of places and `π : 𝔸_f → F` a ring homomorphism *reading `A`*: `π(x) ∈ O` if and only if `e_Ax ∈ Ô`, and `π` is continuous
with a continuous additive section `σ` with `σ(π(x)) = e_Ax`. For a Fock vector `v` and a Schwartz–Bruhat function `Φ`
on matrices over `F`, the *local datum* is `v ⊗ ((Φ ∘ π)·vac)`. An *integral frame* over `F` consists of matrices
`K, I, L` and `K^∨, I^∨, L^∨` with `P = (K | I | L)` and `Q = (K^∨; I^∨; L^∨)` integral and `PQ = QP = 1`; its *standard
datum* of a function `G` is `x ↦ G(x(K | I))` on integral `x` and `0` elsewhere.

- (a) `ev_D(v ⊗ f) = (μ_D-slice of v at 0) ⊗ ev_D(pr_∞ f)` and
  `(v ⊗ f)[t^{−*}x] = (μ_D-slice of v at the real coordinates (κ_w⁻¹x_{i,w}) of x) ⊗ (pr_∞ f)[t^{−*}(0, x_f)]` for
  `x ∈ 𝔸^p` (`κ_w` as in 3.1; the real coordinates are the `y` with `realVec(y) = (x_∞, 0)`).
- (b) If `Φ` factors in the adapted frame as `(Π_i 1_O(z_i)f_i(z_i))·Ψ(y)`, then the slice of the local datum at
  `t^{−*}κx` (`κ` the scaling idele of 3.1) is `c·Π_i ∫_O ψ_F(π(x̄_{i,f})z)·f_i(z) dz` times the local datum of the
  `μ_D`-slice of the Fock vector at `x_∞` and of `Ψ`, where `c = c_D` if `x_f` is integral at every place outside
  `A ∪ Ā` and `c = 0` otherwise, and `ψ_F = ψ₀ ∘ σ`.
- (c) If `D` is base-adapted and `Φ` agrees with the standard datum of `G` for the integral frame of `D` on the matrices
  `w` with `w·K = π(x_f)`, then the matrix slice (6.9) of the local datum at `κx` is `c·` (the local datum of the real
  slice and of `z ↦ G(π(x_f) | z)` on integral `z`), with `c = c_D` if `x_f` is integral and `0` otherwise.

*Needs:* 3.9, 5.2, 5.4, 5.5, 5.7, 6.9.

[ShortProof], `Lib/Weil/MixedModel/Slices` (`New.Exchange.vacuumFactor`, `New.Space.Splitting.IsAdapted.mixedModel`,
`New.Exchange.zeroTerm_integrated`, `New.Exchange.slice_integrated`, `New.Exchange.lineTermReal`, `New.Exchange.realSlice`,
`New.Exchange.ReadsAt.lift`, `New.Exchange.ReadsAt.ψ`, `New.Exchange.slice_localDatum`, `New.Exchange.adaptedFrame`,
`New.Exchange.ReadsAt.homSlice_localDatum`), `Lib/Weil/TameGaussSum` (`New.Exchange.IntegralFrame`,
`New.Exchange.IntegralFrame.blockRelations`, `New.Exchange.IntegralFrame.stdDatum`)

### 6.11 Zero terms at the real places along an isotropic line

*Origin:* particular to this proof: for a base-adapted splitting of a target space along a line, the zero term of the
real mixed model of the induced splitting of `Hom(T, W)`, its relation to the slices of a source splitting, its
surjectivity onto Fock vectors of finite moments, and its law under real points that act on the line by scalars.

*Method of the formal proof:* the induced splitting is adapted at `1` in an explicit basis (6.9 (d) in the other
variable); surjectivity from 5.7 (b); the law under real points from 6.2 (b) and 6.9 (b) at the infinite places.

Let `X` be a base-adapted splitting of `V′ = V ⊕ (plane)` over `V` with isotropic line `B`, and `W` a hermitian space of
signature `s` on `n`; let `Z_∞` be the zero term at `0` of the real mixed model of the induced splitting of `Hom(W, V′)`
(adapted at `1`). For `γ ∈ ℤ^Φ` write `ω^γ_∞` for the real pair action of 6.2 (b) with weights `γ` on the second group
and `0` on the first.

- (a) For every Fock vector `v` of finite moments on `Hom(W, V)` there is `v′` of finite moments on `Hom(W, V′)` with
  `Z_∞(v′) = v`.
- (b) Let `A` be a base-adapted splitting of `W′ = W ⊕ (plane)` over `W`. The *real line term* `λ^ℝ_+(a)` of `A` and `X`
  at `a ∈ ℂ^Φ` is the slice, at the point with coordinate `a` on the line and `0` elsewhere, of the real mixed model
  (6.10) of the splitting of `Hom(W′, V′)` over `Hom(W, V)`, adapted at `1`, whose slices are the line terms `λ_+` of
  SiegelWeilAndRallisFormulasOnUnitaryGroups §6.1 (a). Then `λ^ℝ_+(a)` is `Z_∞` of the real slice of `A` at `a·x⁻¹k`
  (`x⁻¹k` the adelic frame of `B`). Real slices of `A` transform under real points `h` of `U(V′)`: for every `γ`, the
  real slice of `ω^{γ+1}_∞(1, h)v` at `y` (for `Hom(W′, V′)`) is `ω^γ_∞(1, h)` (for `Hom(W, V′)`) of the real slice of
  `v` at `h⁻¹y`.
- (c) If the rank `|n|` of `W` is even and `g` is a real point of `U(V′)` multiplying the vector of the line `B` at
  each place `w` by a scalar `a_w ≠ 0`, then for every `μ ∈ ℤ^Φ` there is a real point `h` of `U(V)` with
  `Z_∞(ω^γ_∞(1, g)v) = (Π_w (a_w/|a_w|)^{−2μ_w}·|a|^{|n|/2})·ω^γ_∞(1, h)Z_∞(v)` for all `v`, where `γ_w = |n|/2 − μ_w`
  and `|a| = Π_w |a_w|²`.

*Needs:* 5.2, 5.7, 6.2, 6.9, 6.10; SiegelWeilAndRallisFormulasOnUnitaryGroups §6.1 (line terms).

[ShortProof], `Lib/Weil/MixedModel/TargetZeroTerm` (`New.Exchange.adaptedTargetBasis`, `New.Exchange.isAdapted_homTarget`,
`New.Exchange.realTargetZeroTerm`, `New.Exchange.homSlice_integrated_of_real`,
`New.Exchange.lineTermReal_true_eq_realTargetZeroTerm`, `New.Exchange.exists_realTargetZeroTerm_eq`,
`New.Exchange.realSlice_realPairWeil`, `New.Exchange.lineVector`, `New.Exchange.exists_realTargetZeroTerm_realPairWeil`)

### 6.12 Terms of theta kernels at rational matrices and theta integrals

*Origin:* particular to this proof: the expansion of a theta kernel of a pair with a split source into terms indexed
by rational matrices, their bounds and integrability, and the basic laws of theta integrals over the target group.

*Method of the formal proof:* the terms come from 6.9 (a); their sum is bounded by Wiener's bound (5.5 (c)) and the
growth of 6.4 (a); under a support condition the decay argument of 6.6 bounds the sum uniformly; the theta integral is a
change of variables in the quotient measure.

Let `D` be a splitting of `S` (signature `s` on `n`) over `S₀` along `p`, `T` of signature `s′` on `n′`. The *term* of
`x ∈ M_{n′×p}(E)` is `θ_x(f; g, h) = θ_{Hom(S₀,T)}((ω_{a,b}(g, h)f)[x_T⁻¹x])`, and `f` has *integrable terms* at `g`
against `y` if `∫_{[T]} Σ_x |θ_x(f; g, h)·y(h)| dh < ∞`. The *theta integral* is `I(f)(g) = ∫_{[T]} θ_{a,b}(f; g, h) dh`.

- (a) `θ_{γx}(f; g, γh) = θ_x(f; g, h)` for `γ ∈ U(J_T)(E)`; for each `g ∈ G_s` there are `C`, `B` (depending on `g`)
  with `Σ_x |θ_x(f; g, h)| ≤ |C|·‖f‖·ht(h)^B` for all `f` and `h`.
- (b) If `v` has finite moments, `P` is conjugation-free, `Ψ` is Schwartz–Bruhat above `P`, and for some ring
  homomorphism `φ : 𝔸_f → R` to a nonzero commutative ring and every `y` with `Ψ(y) ≠ 0` the matrix
  `φ(y·(coordinates of (k | ι) at g)_f)ᵀ` has a left inverse, then `Σ_x |θ_x(v ⊗ Ψ·vac; g, h)|` is bounded in `h` and `v ⊗ Ψ·vac` has integrable terms at `g`.
- (c) `I(ω_{a,b}(p)f)(g) = I(f)(g·p₁)`. Call `f` *target-bounded* if there are `B`, `C` with
  `|θ_{α,β}(f; g, h)| ≤ C·ht(g)^B` for all characters `α`, `β` and all `g`, `h`. Then `I(f)` is continuous and left
  invariant under `Γ_S`, and there is a linear map agreeing with `I` on target-bounded data. For a local datum (6.10)
  with `v` of finite moments and `Φ` supported on matrices whose transpose has a left inverse, the datum is
  target-bounded; finite integral points act on local data by substitution and the characters.

*Needs:* 5.5, 6.2, 6.4–6.6, 6.9, 6.10.

[ShortProof], `Lib/Weil/DualPair/ThetaIntegrals` (`New.Space.Splitting.thetaTerm`, `New.Space.Splitting.HasIntegrableTerms`,
`New.Space.Splitting.thetaTerm_ratEmbed_mul`, `New.Space.Splitting.exists_tsum_thetaTerm_le`,
`New.Space.Splitting.exists_tsum_thetaTerm_schrodingerOp_le`,
`New.Space.Splitting.hasIntegrableTerms_integrated_schrodingerOp`, `New.Exchange.IsTargetBounded`,
`New.Exchange.exists_linear_thetaIntegral`, `New.Exchange.ReadsAt.pairWeil_localDatum_of_mem_stdLevel`,
`New.Exchange.thetaIntegral_pairWeil`, `New.Exchange.IsTargetBounded.isAutFunction_thetaIntegral`,
`New.Exchange.ReadsAt.isTargetBounded`)

### 6.13 The Galois law of the finite Weil representation

*Origin:* particular to this proof: a semilinear map of the space of data that preserves the finite part and scales
the finite Heisenberg translations intertwines the action of finite points on the finite part up to the factor
`σ(Δ_f)/Δ_f`, and acts on vacua and named data by a unitary scalar element and conjugation of the function.

*Method of the formal proof:* the scaling of translations and of `ψ₀` forces `b` to be a unit, written `b = u·a` with
`u` unitary and `a` integral and `1` at a given conjugation-free set; on the finite part, `ω(1, g)` is determined by the
lattice `Ô^n ∩ g⁻¹Ô^n` and its multiplier (3.7 (c)), on which `L` acts by `σ`; named data are combinations of
translates of the box (5.3 (c)).

Let `V` be a hermitian space on `n`, `σ` a ring endomorphism of `ℂ`, `b ∈ 𝔸_f`, and `L` a `σ`-semilinear map on `𝒮(V)`
such that `σ(ψ₀(z)) = ψ₀(bb̄z)` for all `z ∈ 𝔸_f`, `L` maps `𝒮_f(V)` into itself, and `L(ϱ(finVec(x))f) = ϱ(finVec(bx))L(f)`
for `f ∈ 𝒮_f(V)` and `x ∈ 𝔸_f^n`. Put `r_σ(g) = σ(Δ_f(g))/Δ_f(g)`.

- (a) `b` is a unit, and for `g ∈ G_f` and `f ∈ 𝒮_f(V)`: `L(ω_V(1, g)f) = r_σ(g)·ω_V(1, g)L(f)`. Moreover
  `r_σ(g)² = υ(det g)/σ(υ(det g))`.
- (b) For every conjugation-free `R` there are `c ∈ ℂ` and a unitary `u ∈ 𝔸_f` with `L(vac) = c·ω_V(1, u)vac` and
  `L(Ψ·vac) = c·ω_V(1, u)((σ ∘ Ψ)·vac)` for every `Ψ` Schwartz–Bruhat above `R` (`u` acting as a scalar matrix).

*Needs:* 3.2, 3.7, 5.3, 5.4.

[ShortProof], `Lib/Weil/DualPair/GaloisLaw` (`New.multiplierRatio`, `New.multiplierRatio_sq`, `New.exists_unitary_mul_unit`,
`New.Space.ScalesTranslations`, `New.Space.ScalesTranslations.isUnit`, `New.Space.ScalesTranslations.map_omega`,
`New.Space.ScalesTranslations.exists_map_schrodingerOp`)

### 6.14 Holomorphic data and theta kernels as level multipliers

*Origin:* adapted from Kashiwara and Vergne (1978), the harmonic polynomials of the oscillator representation
(ThetaKernelsForUnitaryDualPairs §3.46): here only that joint highest vectors killed by each mixed second derivative
have holomorphic matrix coefficients of an explicit weight when the second group is definite, and that their theta
kernels are holomorphic in the archimedean variable; with multiplication by kernels modulo `𝔪` preserving rapid decay
and a principal level.

*Method of the formal proof:* a vector killed by the raising operators of `𝔭` in one order has coefficients that extend
holomorphically to `U(p, q)·B` with the character of the weight on `B` (HolomorphicDiscreteSeriesOfUnitaryGroups
§4.4 (b)); the
products of joint highest polynomials are such vectors by 2.4 (b); propagation along an intertwining map is
equivariance; the kernel inherits holomorphy by 6.2 (b); the level from 6.7 (b) and the triviality of the tame part of
`b` off `𝔪`.

A Fock vector `v` on `Φ × n′ × n` is *holomorphic of weight `u`* (for an order `o` of the indices of `s` and integers
`γ`, `e` at the infinite places) if, for the real pair action `ω_∞` of 6.2 (b) with the weights `γ` and `e`, every
coefficient `x ↦ ℓ(ω_∞(x, 1)v)` (`ℓ` continuous linear) is holomorphic of weight `u` on `G_{s,∞}` in the sense of
HolomorphicDiscreteSeriesOfUnitaryGroups §4.1 (f) (extends holomorphically to `U(s)·B`, `B` the invertible triangular
matrices for `o` with positive indices first, transforming by `Π b_ii^{u_i}`).

- (a) Let the second space be definite (`s′ = 1`), `o` put the positive indices first, and at each infinite place `w`
  let `l′_w` (on `n′`) and `l_w` (on `n`) be parameters with `l_{w,a} < l_{w,b}` whenever `s_a = s_b` and `o_a < o_b`,
  and `P_w` jointly highest of weights `(ν_w, u_w)` for the pair data `(1, s, γ_w, −e_w)` and the parameters `l′_w`
  (rows) and `−l_w` (columns) (nonzero, highest for rows and columns, termwise harmonic on both sides). Then
  `Q = Π_w P_w ≠ 0` and `v_Q` is holomorphic of weight `u` (for `o`, `γ`, `e`).
- (b) If `f` is a linear map from a Weyl module of `U(n′)` to Fock vectors intertwining the dual representation with
  `ω_∞(1, ·)`, and `f` of the highest vector for parameters `l_w` that are injective at every `w` is holomorphic of
  weight `u`, then every `f(ξ)` is.
- (c) If `v` is holomorphic of weight `u` and `a`, `b` have weights `γ`, `e`, then every left translate of
  `g ↦ θ_{a,b}(v ⊗ f; g, k)` is holomorphic of weight `u` on `G_{s,∞}`.
- (d) Let `𝔪 = (N)`, `b` of weight `e` with tame part trivial off `𝔪`, and `F` automorphic, rapidly decreasing and
  invariant under the principal congruence subgroup of level `N`. Then `F·θ^{S,T}_{a,b}[Ψ, Q](·, h)` is again so, for
  every `Ψ`, `Q`, `h`; without the level, rapid decay is kept.

HolomorphicDiscreteSeriesOfUnitaryGroups and ThetaKernelsForUnitaryDualPairs §3.46 describe the Fock module of a compact
pair through Howe duality and the Kashiwara–Vergne list; the route uses neither, only (a)–(d).

*Needs:* 2.4, 6.2, 6.7; HolomorphicDiscreteSeriesOfUnitaryGroups §§4.1 (f), 4.2 (b), 4.4 (b), 8.1 (holomorphy of a
weight, highest vectors); AdelicUnitaryGroupsAndAlgebraicModularForms §§3.9 (b), 4.2, 5.1 (principal levels, rapid
decay); IntegralRepresentationsOfGeneralLinearGroups §§1.1, 2.4 (Weyl modules, highest vectors).

[ShortProof], `Lib/Weil/DualPair/HolomorphicData` (`New.Rows.holomorphicData`, `New.Rows.IsAdelicHol`,
`New.Rows.rapidOfLevel`, `New.Rows.prod_mem_holomorphicData`, `New.Rows.mem_holomorphicData_of_highestVector`,
`New.Rows.isAdelicHol_pairTheta`, `New.Rows.mul_modKernel_mem_rapidFunctions`, `New.Rows.mul_modKernel_mem_rapidOfLevel`)

### 6.15 Two edges joined into one datum

*Origin:* particular to this proof: data of two pairs `V → V′ → V″` joined, through the flip of the first and the product
of 3.8 (a), into one datum of the pair `(V′, V⁻ ⊕ V″)`, with the theta functional, the Heisenberg operators and the pair
actions.

*Method of the formal proof:* the flip (6.8) and the product (3.8 (a)) with 5.6 (d) and 6.3 (b); the finite part is
spanned by products of finite parts by 3.7 (d).

Let `V`, `V′`, `V″` be hermitian spaces, `V⁻` the flipped space of `V` (6.8), and
`f ⊛ f′ = D(f) ⊠ f′ ∈ 𝒮(Hom(V′, V⁻ ⊕ V″))` for `f ∈ 𝒮(Hom(V, V′))`, `f′ ∈ 𝒮(Hom(V′, V″))`.

- (a) There is `z ≠ 0` with `θ(f ⊛ f′) = z·θ(f)·θ(f′)` for all `f`, `f′`.
- (b) Heisenberg operators: `ϱ(w†, w′)(f ⊛ f′) = ϱ(w)f ⊛ ϱ(w′)f′` (with `w†` the adjoint of `w`), and the finite
  Heisenberg operators act through the two blocks with an explicit semicharacter factor.
- (c) For automorphic characters `a`, `b` put `a_V = a·υ_U^{⌊rk V/2⌋}` and likewise for the other spaces and for `b`.
  There is a representation `ω₃` of `G_V × G_{V′} × G_{V″}` on `𝒮(Hom(V′, V⁻ ⊕ V″))` (the Weil representation of
  `x ↦ g′x(g⁻, g″)⁻¹` times explicit characters of the three determinants) with
  `ω₃(g, g′, g″)(f ⊛ f′) = (ω_{a_V, a_{V′}}(g, g′)f) ⊛ (ω_{b_{V′}, b_{V″}}(g′, g″)f′)`; the function
  `(g, g′, g″) ↦ θ(ω₃(g, g′, g″)F)` is invariant under the rational points of the first two groups.
- (d) On finite parts, `⊛` induces an injective map from the tensor product of the finite parts onto the finite part of
  `𝒮(Hom(V′, V⁻ ⊕ V″))`, intertwining the finite actions.

*Needs:* 3.7, 3.8, 5.6, 6.1–6.3, 6.8.

[ShortProof], `Lib/Weil/DualPair/TwoEdges` (`New.Seesaw.flipSum`, `New.Seesaw.arrowProduct`, `New.Seesaw.tripleWeil`,
`New.Seesaw.arrowTensor`, `New.Seesaw.liftWeilFin`, `New.Seesaw.theta_arrowProduct`,
`New.Seesaw.homHeisenbergOp_arrowProduct`, `New.Seesaw.finHeisenbergOp_arrowProduct`,
`New.Seesaw.arrowProduct_twistedPairWeil`, `New.Seesaw.injective_arrowTensor`, `New.Seesaw.leftInverse_arrowTensor`,
`New.Seesaw.range_arrowTensor`, `New.Seesaw.arrowTensor_map_liftWeilFin`, `New.Seesaw.theta_tripleWeil_rat_mul`)

## Layer 7: Theta lifts between forms

A *form of type `e`* on `G_s` is a bounded automorphic function `y` with `y ∗ e = y` for real convolution by a kernel
`e` on `G_{s,∞}` (AdelicUnitaryGroupsAndAlgebraicModularForms §5.1); the types used are the projector kernels
`e_λ = Π_w d(λ_w)·conj c_{λ_w}` of discrete series of `U(p, q)` with large gaps (HolomorphicDiscreteSeriesOfUnitaryGroups
§§4.1 (d), 6.1 (a)).
This layer proves that a product of joint harmonics is an *edge*: with every finite datum it lifts forms of one type
to forms of the other, in both directions; the Petersson products of lifts by other polynomial vectors are multiples
of those by the edge; lifts and descents are adjoint; proportionality of periods passes through a seesaw; and between
definite groups the lift is a class sum whose kernel is the matrix of jets of a theta function.

### 7.1 Products of minors are jointly highest vectors

*Origin:* adapted from Howe (1989), joint harmonics of compact dual pairs, and Kashiwara and Vergne (1978), the lowest
`K`-types (ThetaKernelsForUnitaryDualPairs §3.46): here an explicit product of powers of nested minors that is a joint
highest vector of the Fock dual pair of a definite and an indefinite unitary group, with its two weights.

*Method of the formal proof:* each minor is killed by the raising operators of both actions and is termwise harmonic
because its columns of one sign are taken in one block; powers and products keep these properties, and the weights add.

Let the rows `n` carry the sign `+1` and the columns `r` the signs `s`; let `l` on `r` and `l′` on `n` be injective, and
`o(c)` the position of the column `c` among the columns of its sign in the decreasing order of `s_c·l_c`. For `η = ±1`
and `p < |n|` let `M_{η,p}` be the `p × p` minor of the variable matrix `X` on the first `p` rows in the decreasing order
of `η·l′` and the columns `c` of sign `η` with `o(c) < p`. Let `k(η, p) ∈ ℕ` vanish when `η` has fewer than `p` columns,
and let `k(1, i) = 0` or `k(−1, j) = 0` whenever `i + j > |n|`. Then `P = Π_{η,p} M_{η,p}^{k(η,p)}` is nonzero,
termwise harmonic for rows and for columns, and highest for the row action of the Fock dual pair `(1, s, γ, γ′)` in the
order of `l′`, of weight `ν(a) = ν₀ + Σ_η η·Σ_{q_η(a) < j < |n|} k(η, j)` (`ν₀` the weight of the vacuum, `q_η(a)` the
position of `a` in the decreasing order of `η·l′`), and for the column action in the order of `−l`, of weight `ν′(c) = ν′₀(c) − s_c·Σ_{o(c) < j < |n|} k(s_c, j)`.

*Needs:* 2.4; HolomorphicDiscreteSeriesOfUnitaryGroups §§4.2 (b), 8.1 (Fock data, highest and harmonic polynomials).

[ShortProof], `Lib/Weil/Lift` (`New.staircaseWeight`, `New.staircaseBlock`, `New.isJointHighest_prod_det_pow_staircaseWeight`)

### 7.2 Joint harmonics are edges

*Origin:* adapted from Li (1990), the theta lift of a discrete series of `U(p, q)` with large parameter
(ThetaKernelsForUnitaryDualPairs §3.46a): here, for forms fixed by the projector kernels of discrete series with large
gaps and for unitary groups of any signature and either order of the ranks, the statement that the product of joint
harmonics lifts forms of one type to forms of the other in both directions, with the lifts by other polynomial vectors
real convolutions of it, without uniqueness, multiplicity one or Howe duality.

*Method of the formal proof:* the real pair action of 6.2 (b) on the Fock space of matrices is an oscillator pair
(2.4 (b)); for an oscillator pair and a joint harmonic, the local theta correspondence of
HolomorphicDiscreteSeriesOfUnitaryGroups §8.6 gives that `∫ ⟨Φ, ω(x, 1)Φ⟩·conj e_λ(x) dx` is positive (2.4 (c)) and that
the vector `∫ e_λ(x)ω(x, 1)Φ dx` (a Bochner integral in the space of data, which exists by the growth of 2.4 (b) and the
moment of `e_λ`) is a multiple of `Φ` modulo the kernel of the lift; the lift moves through this integral by 6.4 (b),
which gives the type `e_{λ′}` on the other side and the convolution (4).

Let `S`, `T` be hermitian spaces of signatures `s` on `n`, `t` on `n′` (`n`, `n′` nonempty), `γ`, `γ′` integers at the
infinite places, `ω_∞` the real pair action of 6.2 (b) with these weights, and `e`, `e′` integrable kernels on
`G_{s,∞}`, `G_{t,∞}`. A Fock vector `Φ` on `Φ × n′ × n` is a *half-edge* from `e` to `e′` if:

1. `e` is a cusp kernel of order `0` (AdelicUnitaryGroupsAndAlgebraicModularForms §5.1);
2. `∫_{G_{s,∞}} ⟨Φ, ω_∞(x, 1)Φ⟩·conj e(x)/e(1) dx ≠ 0`;
3. for every hermitian space `V`, every theta kernel (6.4) on `𝒮(V)` whose real points act on real insertions through
   `ω_∞`, every `f ∈ 𝒮(V)` and every form `y` of type `e` on `G_s`: if `L_{Φ⊗f}y` is right invariant under an open
   subgroup, it is a form of type `e′`;
4. for every polynomial vector `v` there is a continuous compactly supported `α` on `G_{t,∞}`, the same for all such
   kernels, `f` and `y`, with `L_{v⊗f}y = (L_{Φ⊗f}y) ∗ α` (real convolution on the right).

`Φ` is an *edge* if it is a half-edge from `e` to `e′` and, for the action with the groups exchanged, from `conj e′` to
`conj e`.

- (a) Let `l`, `l′` be doubled Harish-Chandra parameters for the signs `s`, `t` in the block relation for the weights
  `γ_w`, `γ′_w` at every infinite place `w` (the block rule, HolomorphicDiscreteSeriesOfUnitaryGroups §8.2). Then at
  every infinite place there is a joint harmonic `Φ_w` of the local Fock dual pair `(t, s, γ_w, −γ′_w)` for the
  parameters `l′_w`, `−l_w`, and for every such choice `Π_w Φ_w` is an edge from `e_l = typeKernel(l, s)` to `e_{l′} = typeKernel(l′, t)`; any two such
  products are proportional. The same conclusion holds for any family of local joint harmonics, without assuming the
  block relation separately.
- (b) More generally, let at each infinite place `w` an oscillator pair `(π_w, π′_w)` (2.4 (b)) of a Fock dual pair
  `T_w` be given, with a joint harmonic `Φ_w` of `T_w` for the parameters `l_w`, `l′_w`, and let `Ω` be a real action of
  `G_{s,∞} × G_{t,∞}` on the Fock space that acts on pure tensors place by place through them:
  `Ω(x, 1)(⊗_w v_w) = ⊗_w π_w(x_w)v_w` and `Ω(1, y)(⊗_w v_w) = ⊗_w π′_w(y_w)v_w`. Then `⊗_w v_{Φ_w}` is a half-edge
  (with `Ω` in place of `ω_∞`) from `typeKernel(−l, s)` to `typeKernel(l′, t)`.

ThetaKernelsForUnitaryDualPairs §§3.46a and 5.6a state the theta correspondence of these discrete series through
equivariant maps of `(𝔤, K)`-modules, with uniqueness and multiplicity one, and the cuspidality of theta integrals of
cusp forms through the tower property; the route needs neither and uses the statement above.

*Needs:* 2.4, 3.7, 6.2, 6.4, 7.1; HolomorphicDiscreteSeriesOfUnitaryGroups §§4.1 (d), 8.1, 8.2, 8.5 (a), 8.6 (block
rule, joint harmonics, local correspondence); AdelicUnitaryGroupsAndAlgebraicModularForms §5.1 (types, `typeKernel`, cusp
kernels).

[ShortProof], `Lib/Weil/Lift` (`New.negIf`, `New.ParamsCorrespond`, `New.jointHarmonicAt`, `New.jointHarmonic`,
`New.ParamsCorrespond.prod_eq_smul_jointHarmonic`, `New.ThetaKernel.HasRealPart`, `New.IsHalfEdge`, `New.IsEdge`,
`New.IsHalfEdge.lift_isForm_and_eq_realConv`, `New.isHalfEdge_of_oscillatorPair`, `New.isEdge_of_isJointHarmonic`,
`New.ParamsCorrespond.isEdge_jointHarmonic`)

### 7.3 Arrows: lifts of forms, transposition and adjointness

*Origin:* adapted from Li (1990) (ThetaKernelsForUnitaryDualPairs §3.46a) and from Rallis (1984), *Injectivity
properties of liftings associated to Weil representations*, §1, the adjoint of a theta lift
(ThetaLiftsForDefiniteUnitaryGroups §1.4): here the global consequences of 7.2 for the pair representation of 6.1:
lifts of forms of a type, their equivariance, the Petersson products of lifts by polynomial vectors, transposition and
adjointness, for groups of any signature.

*Method of the formal proof:* a finite datum in the finite part has a level (6.2 (c)), which supplies the hypothesis of
7.2 (3); forms of a cusp type are rapidly decreasing (AdelicUnitaryGroupsAndAlgebraicModularForms §5.4 (d));
transposition and adjointness are 6.4 (c); the constant `κ(P)` is the convolution of 7.2 (4) paired with forms, which is a scalar on forms
of a type.

For a theta kernel `K` (6.4), a datum `φ` is an *arrow* from `e` to `e′` if every form `y` of type `e` is rapidly
decreasing and `L_φy` is a form of type `e′`.

- (a) Let `Φ` be an edge from `e` to `e′` for the weights `γ`, `γ′`, let `a`, `b` have weights `γ`, `γ′` (any tame parts)
  and `f ∈ 𝒮_f(Hom(S, T))`. Then `Φ ⊗ f` is an arrow from `e` to `e′` for `(ω_{a,b}, θ)` and from `conj e′` to `conj e`
  for the kernel with the groups exchanged; and for every form `y′` of type `e′`, `conj L^t_{Φ⊗f}(conj y′)` is a form of
  type `e`.
- (b) There is a linear form `κ` on polynomials, depending only on the edge, such that for all `S`, `T` of signatures
  `s`, `t`, all `a`, `b` of weights `γ`, `γ′`, all `f ∈ 𝒮_f(Hom(S, T))`, all `P` and all forms `y`, `y′` of types `e`, `e′`:
  `⟨y′, L_{v_P⊗f}y⟩ = κ(P)·⟨y′, L_{Φ⊗f}y⟩` and `⟨conj y, L^t_{v_P⊗f}(conj y′)⟩ = κ(P)·⟨conj y, L^t_{Φ⊗f}(conj y′)⟩`.
- (c) For any theta kernel `K` and arrow `φ` from `e` to `e′`: right translation of `L_φy` by a finite point `k′` is
  `L_{ω(k,k′)φ}` of the right translate of `y` by `k`. If `φ` is also an arrow from `ε′` to `ε` for the exchanged kernel,
  then `∫_{[T]} z·L_φy = ∫_{[S]} y·L^t_φz` for forms `y`, `z` of types `e`, `ε′`; and if `ε′ = conj e′` and
  `e = conj ε`, then `⟨L_φy, x⟩ = ⟨y, conj L^t_φ(conj x)⟩` for forms `x` of type `e′`.

*Needs:* 6.2, 6.4, 7.2; AdelicUnitaryGroupsAndAlgebraicModularForms §§5.1, 5.4 (d) (forms of a type, rapid decay).

[ShortProof], `Lib/Weil/Lift` (`New.formLift`, `New.IsArrow`, `New.conjForm`, `New.IsEdge.isArrow`,
`New.IsEdge.isForm_star_lift_swap`, `New.IsEdge.exists_petersson_lift_eq_mul`, `New.IsArrow.eq_formLift_of_coe_eq`,
`New.IsArrow.coe_formLift`, `New.IsArrow.formRep_formLift`, `New.IsArrow.formRep_formLift_of_eq_smul`,
`New.IsArrow.integral_mul_formLift_swap`, `New.IsArrow.inner_formLift_adjoint`)

### 7.4 Edge families and the seesaw for periods

*Origin:* adapted from Kudla (1984), the seesaw identity of global theta lifts (SeesawForThetaChains §6.3): here the
transfer of proportionality of weighted sums of periods from lifts to transposed lifts, for families of characters with
common weights over an edge and data modulo ideals, when the theta kernels of the two pairs agree up to moderate weights
on a spanning set of polynomials.

*Method of the formal proof:* by Fubini (6.4 (d)) a period of a transposed lift is a period of a lift against the
other kernel; the hypothesis replaces that kernel by the first one for matched polynomials, the real convolution of
7.2 (4) and density of polynomial vectors (2.2 (d)) extend from the spanning set to the edge, and linearity gives the
proportionality.

An *edge family* is a family `(a_i)` of automorphic characters of `U(1)`, one for each rank, with weights `γ` (rank of
the source) and `γ′` (rank of the target) not depending on `i` and the same tame part at both ranks, together with two
pairs of cusp kernels of order `0` with `k(¬d) = conj k(d)`, `k′(¬d) = conj k′(d)`, and a polynomial `Φ` with `v_Φ` an
edge from `k(d)` to `k′(d)` for the weights `γ`, `γ′`. Write `L_{i,Ψ}` for the lift of forms of type `k(d)` by the datum
`v_Φ ⊗ Ψ̃·vac` modulo `𝔪` for the characters of `a_i`, and `L^t_{i,Ψ}` for the transposed lift. A *moderate weight* from
`S` to `T` is a pair `(w, c)` as in 6.4 (d); its *period pairing* at a real point `r` of `T` is
`(f, y) ↦ ∫_{[S]} w(z)·f(z)·y(c(z)·r) dz`.

- (a) If `l`, `l′` are in the block relation (7.2 (a)) and the `a_i` have common weights, then the joint harmonic gives
  an edge family for the kernels `typeKernel(±l, s)`, `typeKernel(±l′, t)`.
- (b) For every polynomial `Q` there is `α`, independent of `i`, `S`, `T`, `𝔪`, `Ψ` and `y`, with
  `L(v_Q ⊗ Ψ̃·vac)y = (L_{i,Ψ}y) ∗ α`; and there is `κ` with
  `⟨z, conj L(v_Q ⊗ Ψ̃·vac)(conj y)⟩ = κ·⟨L^t_{i,Ψ}z, y⟩` for forms `y`, `z` of types `k(¬d)`, `k′(¬d)`.
- (c) *Seesaw.* Let `S`, `T`, `S′`, `T′` be hermitian spaces, edge families for `S → T` (polynomial `Φ`) and for
  `T′ → S′` (polynomial `Φ′`), and for `o` in a set `J` and `i` in finite sets `W_o`: forms `y_{o,i}` of type `k(d)` on
  `S`, forms `f_{o,i}` of type `k′(¬d′)` on `S′`, moderate weights `N_{o,i}` from `S` to `T′`, functions `Ψ′_{o,i}` modulo
  `𝔪_o`, numbers `u_{o,i}`, `c_o`, and a real point `r` of `T′`. Suppose that the polynomials `p` that are *matched*
  span all polynomials, where `p` is matched if there are `Q`, `Ψ_{o,i}` and moderate weights `M_{o,i}` from `S′` to `T`
  such that (i) for every real point `r_T` of `T` the sums `Σ_i u_{o,i}·⟨f_{o,i}, L_{S→T}(Ψ_{o,i})y_{o,i}⟩_{M_{o,i}, r_T}`
  are `β(r_T)·c_o` for one `β(r_T)`, and (ii) `N(g)·θ^{T′,S′}[Ψ′_{o,i}, p](N(g), x) = M(x)·θ^{S,T}[Ψ_{o,i}, Q](g, M(x))`
  (weights and maps of `N_{o,i}`, `M_{o,i}`). Then there is `β` with
  `Σ_{i∈W_o} u_{o,i}·⟨y_{o,i}, L^t_{T′→S′}(Ψ′_{o,i})f_{o,i}⟩_{N_{o,i}, r} = β·c_o` for every `o`.

*Needs:* 2.2, 6.1, 6.4, 6.7, 7.2, 7.3.

[ShortProof], `Lib/Weil/Seesaw` (`New.Exchange.kernelPair`, `New.Exchange.modLift`, `New.Exchange.modTransposedLift`,
`New.Exchange.IsConjKernelPair`, `New.Exchange.IsEdgeFamily`, `New.Exchange.isEdgeFamily_of_paramsCorrespond`,
`New.Exchange.IsPairEdge`, `New.Exchange.IsEdgeFamily.isArrow_modDatum`, `New.Exchange.IsEdgeFamily.exists_lift_eq_realConv`,
`New.Exchange.IsEdgeFamily.petersson_lift_eq_mul_inner_modTransposedLift`, `New.Space.periodPairing`,
`New.Exchange.integral_kernel_mul_forms_eq_integral_periodPairing`, `New.Exchange.IsSeesawMatched`,
`New.Exchange.seesaw_periods`)

### 7.5 The jet kernel of a definite pair

*Origin:* adapted from Gross (1999), algebraic modular forms on a group compact at infinity and kernels between them
(ThetaLiftsForDefiniteUnitaryGroups §1.2), with Bargmann (1961, 1967), the Fock pairing of a polynomial as a Taylor
coefficient (ThetaLiftsForDefiniteUnitaryGroups §1.7): here the kernel between algebraic forms on `U(I_n)` and
`U(I_{n′})` written as the matrix of jets, along the entries of a Schur matrix, of the theta function of a finite datum.

*Method of the formal proof:* the real pair action transforms the Schur coefficient polynomials `A*S_κ(z)ξ` by the
Weyl representations (6.2 (b)); with 4.2 (a) the theta value of such a polynomial vector is a matrix coefficient of the
jet matrix; equivariance under rational points is 6.2 (a) and open stabilisers are 6.2 (c).

Let `|n| < |n′|`, `κ` a family of shapes at the infinite places with `κ_w(h) = 0` for `|n| < h < |n′|` (a *weight that goes
up*), `e_b`, `e` with `e = e_b + κ(|n|)` placewise, and `a`, `b` automorphic characters of weights `e_a`, `e_b`. For `c ∈ ℂ`
and `f ∈ 𝒮_f(Hom(I_n, I_{n′}))` let `𝒥_c(f)` be the Schur jet matrix (4.2) of `J_c(f)`.

- (a) For a level `K` the *lift* of a kernel `k` (a representation of `G_{f,n} × G_{f,n′}` on a space of data with a
  linear map to matrices, equivariant under rational points and with open stabilisers) on algebraic forms of weight
  `(κ, e)` is `(k.lift(Φ)φ)(h) = classIntegral_g(k(ω(g, h)Φ)·φ(g))`; it is equivariant:
  `k.lift(ω(a′, b′)Φ)(a′·φ) = b′·k.lift(Φ)(φ)`.
- (b) `f ↦ 𝒥_c(f)` with the finite pair action `ω_{a,b}` is such a kernel from algebraic forms of weight `(κ, e)` on
  `U(I_n)` to forms of weight `(κ, e_a)` on `U(I_{n′})`.
- (c) For real points `x`, `y` and vectors `A`, `ξ` of the Weyl modules, the real pair action maps the polynomial
  `A*S_κ(z)ξ` to the polynomial of `(A·ρ_{e_a}(y⁻¹), ρ_e(x)ξ)`, and
  `c^{|κ|}·θ(ω_{a,b}((x, g), (y, h))(v_{A*S_κξ} ⊗ f)) = A·ρ_{e_a}(y⁻¹)·𝒥_c(ω_{a,b}((1, g), (1, h))f)·ρ_e(x)ξ`, with `ρ`
  the conjugate Weyl representations and `|κ|` the number of boxes in the columns of height less than `|n′|` (summed
  over the infinite places).

*Needs:* 4.2, 6.2; AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 6.1 (algebraic forms, weights, class integrals);
IntegralRepresentationsOfGeneralLinearGroups §§1.1, 1.3, 2.4 (Weyl modules, Schur matrices, highest vectors).

[ShortProof], `Lib/Weil/CompactLift/ThetaKernelDefs` (`New.IsLiftWeight`, `New.schurCoeffPoly`, `New.pairWeilFinite`,
`New.Kernel`, `New.Kernel.lift`, `New.Kernel.lift_equivariant`, `New.realPairWeil_schurCoeffPoly`,
`New.theta_pairWeil_schurCoeffPoly`, `New.thetaKernel`)

### 7.6 Definite theta lifts as algebraic lifts by jets

*Origin:* adapted from Gross (1999), the class-set formula and the lift of algebraic modular forms
(ThetaLiftsForDefiniteUnitaryGroups §1.2): here for `U(I_n) → U(I_{n′})`, `|n| < |n′|`, weights that go up and the joint
harmonic of 7.2, with the lift by the jet kernel of 7.5 and a constant that is not determined.

*Method of the formal proof:* the block relation for definite signs is matched with the Harish-Chandra parameters of the
weights; the joint harmonic is a multiple of the Schur coefficient polynomial of the two highest vectors; the theta
integral over the compact quotient is the class integral (AdelicUnitaryGroupsAndAlgebraicModularForms §4.4 (d)), and
7.5 (c) turns it into the algebraic lift.

With the notation of 7.5, let `l` be the doubled Harish-Chandra parameter of `(κ, e)` in rank `|n|`.

- (a) For all signs `+1`, the block relation holds at every place for `(e_a, e_b, l, l′)` if and only if `l′` is the doubled
  Harish-Chandra parameter of `(κ, e_a)` in rank `|n′|`.
- (b) In that case, for every `c ≠ 0` there is one `β ∈ ℂ` (possibly `0`, depending on `c`) such that for all `a`, `b`
  of weights `e_a`, `e_b`, every level `K`, every `f ∈ 𝒮_f(Hom(I_n, I_{n′}))` and every algebraic form `φ` of weight
  `(κ, e)`: `L_{Φ⊗f}(F_φ) = (β/[K₀ : K])·F′_{k.lift(f)φ}`, where `Φ` is the joint harmonic of 7.2, `k` the jet kernel of
  7.5 at the scale `c` and the level `K`, and `F_φ(g) = ⟨v⁺, ρ(g_∞⁻¹)φ(g_f)⟩` with `v⁺` the highest vector (the
function `φ♮` of AdelicUnitaryGroupsAndAlgebraicModularForms §6.1).
- (c) Let `n` be nonempty, `c ≠ 0`, `K` a level and `k` the jet kernel of 7.5 at the scale `c` and the level `K`. For
  every polynomial `P` and linear form `t` there is a linear form `t′` such that for every family of characters,
  every finite datum `Φ`, algebraic form `φ` and `h`: the theta integral over `[U(I_n)]` of the `t`-coefficient of `φ`
  against `θ(ω((g, h))(v_P ⊗ Φ))` is the `t′`-coefficient at `h` of `k.lift(Φ)φ`.

ThetaLiftsForDefiniteUnitaryGroups §1.2 states the class-set formula for a general definite pair with an explicit
constant on the Schwartz model; the route needs the case above on the space of data, without the value of `β`.

*Needs:* 6.4, 7.2, 7.5; AdelicUnitaryGroupsAndAlgebraicModularForms §§4.4 (d), 6.1 (Harish-Chandra parameters, class
integrals); HolomorphicDiscreteSeriesOfUnitaryGroups §8.2 (the block rule).

[ShortProof], `Lib/Weil/CompactLift/DefiniteThetaLift` (`New.IsHCParam.paramsCorrespond_iff`,
`New.exists_smul_schurCoeffPoly_eq_jointHarmonic`, `New.exists_lift_ofAlgForm_eq_smul`, `New.isThetaLift_thetaKernel`),
`Lib/Weil/DualPair/WeilAction` (`New.Space.twistedPairWeil`, `New.Space.IsThetaLift`)

## Layer 8: Graded spaces, periods and constant terms

The seesaw of the upper bound unfolds periods over Bessel and Fourier–Jacobi groups. A *graded space* is a hermitian
space `X ⊕ (string)` with `X` orthonormal and a string of `s` vectors with antidiagonal Gram matrix; its Bessel group is
the semidirect product of the unipotent group of the flag of grades with `U(X)`. This layer gives the lattices of
finite points of graded spaces, the integrals over the Bessel group, the constant terms of data along maps of positive
degree, one step of the unfolding of a period of a theta integral, and the Fourier coefficients of theta lifts along
the centre of a unipotent radical with their consequence for periods.

### 8.1 Graded spaces, Bessel groups and the string map

*Origin:* particular to this proof: the presentation of a hermitian space as `X ⊕ (string)` with its grading, the
unipotent group of the flag of grades, the Bessel group as `U ⋊ U(X)`, the string map `T` to a space with a shorter
string and the shift `𝔢`, the string as the powers of `𝔢`, and the splitting of the Bessel group into real and finite
points.

*Method of the formal proof:* block computations in rational coordinates; the projection to `U(X)` is the `X`-block;
the measure statement is Fubini over `R_∞ × R_f` with the indicator of a coset of a level.

Matrices of `G_s` are read in rational coordinates `g ↦ xgx⁻¹`. Let `X` be a finite set, `s ∈ ℕ`, `N ∈ E^×` with `N̄ = N`.
A *grading* `Y` of `V` (rank `|X| + s`) by `(X, s, N)` is an identification of its index set with `X ⊔ {0, …, s − 1}`
such that `J` is the identity on `X`, `X ⊥ string`, and on the string `⟨e_a, e_b⟩ = 1` if `a + b = s − 1` and `a ≠ b`,
`= −N` if `a = b = (s − 1)/2`, and `0` otherwise; it carries a constant `c ∈ E^×` with `c̄ = c`. The *grade* is `0` on `X`
and `s − 1 − 2a` on `e_a`. A matrix `A` from a grading by `w` to one by `w′` *has degree `≥ d`* if `A_{ba} = 0` whenever
`w′(b) < w(a) + d`.

- `U` is the group of `g` with `g − 1` of degree `≥ 1`; `U(X)` embeds as the `X`-block; the *Bessel group* `R` is the
  group of `g` that agree with `1` at the entries `(i, k)` with `k` on the string, `grade(k) ≥ 0` and
  `grade(i) ≤ grade(k)`; `R(E) = Γ_V ∩ R`; `R_∞`, `R_f` are its real and finite points.
- For a grading `Y′` of `V′` by `(X′, s − 1, N)`, the *string map* `T : V → V′` is zero on `X` and maps `e_a` to a
  multiple of `e′_a`: by `1` or `c` according to the grade (`c` for positive grade and `1` for negative grade when `s` is
  even; `1`, `−Nc` or `c` for positive, zero or negative grade when `s` is odd); `e_{s−1}` has no image. The *shift* `𝔢`
  maps `e_b` to a multiple of `e_{b+1}` (factors `−Nc` at grade `0`, `−Nc²` at grade `1`, `c` otherwise) and kills `X` and
  `e_{s−1}`. `T† = J⁻¹T*J′`.

Statements:

- (a) There is a continuous homomorphism `p : R → U(X)` with `r·p(r)⁻¹ ∈ U`, `p = id` on `U(X)`, kernel `U`, and
  `p(R(E)) ⊂ U(X)(E)`; every element of `R` is `u·a` with `u ∈ U`, `a ∈ U(X)(𝔸)`.
- (b) `T` has degree `≥ −1`; for `g ∈ R_Y`, `δ ∈ R_{Y′}`, `δTg − T` has degree `≥ 0`; `T†T = 𝔢_V`, and `TT† = 𝔢_{V′}` if
  the constants of `Y` and `Y′` agree.
- (c) There are vectors `𝔢^i ∈ E^n` (`i < s`, multiples of `e_i`) with `𝔢·𝔢^i = 𝔢^{i+1}` (`0` for `i = s − 1`),
  `⟨𝔢^i, 𝔢^l⟩ = −N` if `i + l + 1 = s` and `0` otherwise, `⟨𝔢^{(s−1)/2}, 𝔢^{(s−1)/2}⟩ = −N` for odd `s`, and
  `T𝔢^i = 𝔢′^i` when the constants agree; every vector of `X^⊥ ⊗ 𝔸_f` is `Σ_i t_i𝔢^i` with `t_i ∈ 𝔸_f`, and, when the
  constants agree, `T(Σ t_i𝔢^i) = Σ t_i𝔢′^i`.
- (d) `R(𝔸) = R_∞ × R_f` as topological groups, both factors unimodular; for every open `K ⊂ K₀` there is `c ≠ 0` such
  that for `t₀ ∈ R_f` and `f` integrable on `R(𝔸)` with `f(s, t₀t) = a(s)·1_K(t)`, `a` is integrable and
  `∫_R f = c·∫_{R_∞} a`.

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 (spaces with adelic frames, Haar measures).

[ShortProof], `Lib/Weil/Periods/Grading` (`New.gradedGram`, `New.Grading`, `New.Grading.gradeOf`, `New.Grading.unipotent`,
`New.Grading.inclX`, `New.Grading.besselGroup`, `New.Grading.ratBessel`, `New.Grading.stringMap`,
`New.Grading.AgreesWithStringMap`, `New.Grading.nonnegMaps`, `New.Grading.shift`, `New.Space.formAdjoint`,
`New.Grading.besselProj`, `New.Grading.besselFin`, `New.Grading.inclXFin`, `New.Grading.exists_besselGroup_proj`,
`New.Grading.exists_unipotent_mul_inclX`, `New.Grading.hasDegreeGe_neg_one_stringMap`,
`New.Grading.hasDegreeGe_zero_mul_stringMap_mul_sub`, `New.Grading.formAdjoint_stringMap`,
`New.Grading.formAdjoint_stringMap_mul_stringMap`), `Lib/Weil/Periods/StringPowers` (`New.Grading.stringPower`,
`New.Grading.shift_mulVec_stringPower`, `New.Grading.form_stringPower`, `New.Grading.form_middlePower`,
`New.Grading.stringMap_mulVec_stringPower`, `New.Grading.stringSum`, `New.Grading.exists_stringSum_eq`,
`New.Grading.stringMapFin_stringSum`), `Lib/Weil/Periods/RealAndFinitePoints` (`New.Grading.besselProdEquiv`,
`New.Grading.isMulRightInvariant_haar_besselReal_besselFin`, `New.Grading.exists_integral_eq_mul_integral_besselReal`)

### 8.2 The lattice of a finite point of a graded space

*Origin:* adapted from O'Meara (1963), §82, double duality of lattices over a Dedekind domain (HermitianFormsAndLattices
§4.0a): here for the self-dual `Ô`-lattices of finite points, all finite places at once, with the duality of
intersection and projection for the complement of `X` and the conjugacy under `U(X)` of lattices with the same
intersection.

*Method of the formal proof:* `Λ_x` has an orthonormal `Ô`-basis, the columns of the frame times `x`, which gives
self-duality and the criterion for equality; the duality of intersection and projection is the definition of the dual
for the pair of adjoint maps (inclusion, projection); conjugacy by Witt's theorem over `Ô` for unimodular hermitian
lattices, which needs `E/E⁺` unramified at the finite places.

Let `V` be a hermitian space on `n` and `x ∈ G_f`. Its *lattice* is `Λ_x = {y ∈ 𝔸_f^n : (x_{V,f}x)⁻¹y ∈ Ô^n}`, with the
form `⟨y, z⟩ = y*Jz`. For a grading of `V` let `Λ⁻_x = Λ_x ∩ X^⊥` and `Λ⁺_x` the projection of `Λ_x` to `X^⊥`.

- (a) `z ∈ Λ_x` if and only if `⟨y, z⟩ ∈ Ô` for every `y ∈ Λ_x`.
- (b) `Λ_{x′} ⊂ Λ_x` if and only if `x⁻¹x′ ∈ K₀`; in particular `Λ_x = Λ_{x′}` if and only if `x⁻¹x′ ∈ K₀`.
- (c) For `z ∈ X^⊥`: `z ∈ Λ⁻_x` if and only if `⟨y, z⟩ ∈ Ô` for all `y ∈ Λ⁺_x`, and `z ∈ Λ⁺_x` if and only if `⟨y, z⟩ ∈ Ô` for
  all `y ∈ Λ⁻_x`.
- (d) If `E` contains a primitive `5040`-th root of unity and `Λ⁻_x = Λ⁻_{x′}`, there is `a ∈ U(X)(𝔸_f)` with
  `Λ_{a·x} = Λ_{x′}`.

HermitianFormsAndLattices §4.0a (b) gives the duality (c) place by place over a Dedekind domain; (d) is not stated there.
The library has the duality of projection and intersection for `ℤ`-lattices in Euclidean space
(`ZLattice.dual_map_orthogonalProjectionOnto`) and Witt extension for quadratic forms over a field
(`QuadraticMap.IsometryEquiv.exists_extension`); missing are both statements for hermitian `Ô`-lattices.

*Needs:* 8.1; AdelicUnitaryGroupsAndAlgebraicModularForms §3.4 (c) (Witt's theorem over `Ô`).

[ShortProof], `Lib/Weil/Periods/PointLattice` (`New.Space.lattice`, `New.Space.formFin`, `New.Space.mem_lattice_iff_formFin`,
`New.Space.lattice_le_iff`, `New.Space.lattice_eq_iff`, `New.Grading.gradeProj`, `New.Grading.stringProj`,
`New.Grading.IsGraded`, `New.Grading.latticeMinus`, `New.Grading.latticePlus`, `New.Grading.HasLatticeBounds`,
`New.Grading.HasBoundedOrbit`, `New.Grading.stringMapFin`, `New.Grading.mem_latticeMinus_iff_formFin`,
`New.Grading.mem_latticePlus_iff_formFin`, `New.Grading.exists_inclXFin_eq_of_mulVec_eq`,
`New.Grading.exists_lattice_inclXFin_mul_eq`)

### 8.3 Iwasawa decomposition for the flag of the grades

*Origin:* adapted from the published theory of the Iwasawa decomposition of unramified unitary groups: here for the
parabolic subgroup of the flag of the grades of a graded space, at all finite places at once, in the form that every
lattice of a finite point is moved to a graded lattice by an element of `U`.

*Method of the formal proof:* a Hermite normal form over `Ô` gives a basis of the lattice that does not lower grades;
Witt's theorem over `Ô` corrects it by an integral unipotent matrix so that its Gram matrix is that of its degree-zero
part; the correcting element then lies in `U`.

Let `Y` be a grading of `V` and `E` contain a primitive `5040`-th root of unity (except in (a)).

- (a) For every `Z ∈ GL_n(𝔸_f)` there is `b` with `Z⁻¹b ∈ GL_n(Ô)` such that `b` and `b⁻¹` have degree `≥ 0`.
- (b) If `b` is a basis of `Λ_x` (`(x_{V,f}x)⁻¹b ∈ GL_n(Ô)`) with `b`, `b⁻¹` of degree `≥ 0`, there is `m ∈ GL_n(Ô)` with
  `m − 1` of degree `≥ 1` and `(bm)*J(bm) = b₀*Jb₀`, where `b₀` keeps the entries of `b` between equal grades.
- (c) For every `x ∈ G_f` there is `u` with `(1, u) ∈ U` such that `Λ_{ux}` is graded: it contains the component in each
  grade of each of its vectors.

ReductiveGroupsPartII RG2.4.4 states the Iwasawa decomposition for the special points of the building of a reductive
group, by Bruhat–Tits theory; the route needs only (c).

*Needs:* 8.1, 8.2; AdelicUnitaryGroupsAndAlgebraicModularForms §3.4 (b), (c) (orthonormal frames, Witt over `Ô`).

[ShortProof], `Lib/Weil/Periods/GradedLattice` (`New.degreeZeroPart`, `New.Grading.exists_basis_hasDegreeGe`,
`New.Grading.exists_gram_mul_eq_gram_degreeZeroPart`, `New.Grading.exists_isGraded`)

### 8.4 Finitely many lattices under the bounds

*Origin:* particular to this proof: finiteness of the intersections `Λ⁻_x` that lie between two multiples of `Λ⁻_1`, their
independence of the components of `x` away from the places of the bound, and finitely many representatives of the
double cosets `R_f\·/K₀` of points with a bounded orbit.

*Method of the formal proof:* the `Λ⁻` between `q̄^kΛ⁻_1` and `q^{−k}Λ⁻_1` are submodules of a finite quotient; membership
splits into the parts at a set of places and off it; 8.2 (d) and 8.2 (b) turn equality of `Λ⁻` into a double coset.

Let `Y` be a grading of `V`, `q ∈ 𝔸_f^×`, `k ∈ ℕ`, and say `x` *satisfies the bounds* if `q̄^kΛ⁻_1 ⊂ Λ⁻_x` and
`q^kΛ⁻_x ⊂ Λ⁻_1`.

- (a) For every set `T` of places, `y ∈ Λ_x` if and only if `e_Ty ∈ Λ_x` and `e_{T^c}y ∈ Λ_x`.
- (b) The `Λ⁻_x` of the points `x` satisfying the bounds form a finite set.
- (c) If `x` satisfies the bounds and `|q_w| = 1` for `w ∉ Q`, then `Λ⁻` of the point equal to `x` at `Q ∪ Q̄` and `1`
  elsewhere is `Λ⁻_x`.
- (d) If `E` contains a primitive `5040`-th root of unity and `Q` is as in (c), there is a finite set of points equal to `1`
  outside `Q ∪ Q̄` such that for every `x` having some `r ∈ R_f` with `Λ_{rx}` graded and `rx` satisfying the bounds,
  some `r′ ∈ R_f` has `r′x` in that finite set times `K₀`.

The library has that a lattice over a Dedekind domain is determined by its completions
(`TauCeti.eq_iff_forall_baseChange_adicCompletionIntegers_eq`); the finiteness statements are missing.

*Needs:* 8.1, 8.2.

[ShortProof], `Lib/Weil/Periods/LatticeBounds` (`New.Space.mem_lattice_iff_idem_smul`, `New.Grading.finite_image_latticeMinus`,
`New.Grading.HasLatticeBounds.latticeMinus_componentOn`, `New.Grading.exists_finite_representatives`)

### 8.5 Integrals over the Bessel group and the maps that survive unipotent twists

*Origin:* particular to this proof: cocompactness of the rational Bessel group, the reduction of integrals over `[R]` of
functions of a row to integrals over `[U(X)]`, and the classification of the rational maps between graded spaces whose
terms survive the unipotent twists.

*Method of the formal proof:* `U` is filtered by the grades with abelian quotients of adelic points modulo rational
points, which are compact; Eichler-type elements of `U` realise every row; the mean over a compact quotient of a
periodic function is its constant term; for maps, a map that survives all twists of degree `≥ 2` has, by an induction
on the grades, the entries of `T` at positive grades up to the action of rational points of `R_{Y′}`.

Let `Y` grade `V` by `(X, s, N)` and `Y′` grade `V′` by `(X′, s − 1, N)`; `β(w, w′) = ψ(½ȷ·tr(w′†w))` for adelic maps
`w, w′ : V → V′`. A map `w` with weights `D` on the indices of `V′` *survives* if `β(Tu, T) = β(wu, w)` for every `u ∈ U`
with `u − 1` of degree `≥ 2` and `w(u − 1)` of degree `≥ 1` (from the grades of `V` to `D`); `w` *agrees with `T`* if
`w_{ba} = T_{ba}` whenever `grade(a) > 0` and `grade′(b) < grade(a)`.

- (a) `R(E)` is cocompact in `R(𝔸)`; `R(𝔸)` is unimodular; the quotient measure of `[R]` is finite.
- (b) For vectors `x`, `y` supported respectively in grades `> max(0, k)` and in grade `−k`, some `u ∈ U` has the Eichler
  matrix `E(x, y, ½y*Jy)` in rational coordinates.
- (c) Let `q` index at most one string vector of grade `1` and `row(n)` the entries `c·(n − 1)_{q,X}`. There is `κ ∈ ℂ`
  such that for all continuous `φ` on `R` left invariant under `R(E)`, all `f_a` (`a ∈ U(X)(𝔸)`) and `M` with
  `φ(u·a) = f_a(row(u))`, `f_a` continuous and periodic modulo rational vectors with mean `M(a)`, and `M` continuous and
  left invariant under `U(X)(E)`: `∫_{[R]} φ = κ·∫_{[U(X)]} M`.
- (d) If a rational `w` survives with weights `0`, some `δ ∈ U(V′)(E)` makes `δw` agree with `T`. If `w` agrees with `T`
  and `γ ∈ R_Y`, then `δwγ` agrees with `T` if and only if `δ ∈ R_{Y′}`. If `w` agrees with `T` and survives with the
  weights of `Y′`, then `w − T` has degree `≥ 0`. If `w` survives with weights `D`, then `(T†T·v)_k = (w†w·v)_k` for
  every index `k` and adelic vector `v` such that `v_p = 0` whenever `grade(p) < max(1, grade(k) + 2)`, `(wv)_p = 0`
  whenever `D(p) ≤ max(grade(k), −1)`, and, for all `p`, `q` with `D(p) + grade(q) ≤ 0`, `w_{p,rev(k)} = 0` or `v_q = 0`
  (`rev` the reversal of the string, fixing `X` and exchanging `e_i` and `e_{s−1−i}`; `w† = J⁻¹w*J′`).

*Needs:* 8.1; AdelicUnitaryGroupsAndAlgebraicModularForms §1.1 (quotient integrals, cocompact subgroups).

[ShortProof], `Lib/Weil/Periods/BesselIntegral` (`New.Grading.isCocompact_ratBessel`, `New.Grading.besselMeasure`,
`New.Grading.isFiniteMeasure_besselMeasure`, `New.Grading.isMulRightInvariant_haar_besselGroup`,
`New.Grading.exists_ratCoordMatrix_eq_eichlerMap`, `New.Grading.integral_besselMeasure_eq_of_mean`, `New.Grading.Survives`,
`New.Grading.formAdjoint_mul_self_mulVec_apply_eq_of_survives`, `New.Grading.agreesWithStringMap_mul_iff`,
`New.Grading.hasDegreeGe_of_survives`, `New.Grading.exists_agreesWithStringMap`)

### 8.6 The unipotent character and equivariant functions on the Bessel group

*Origin:* particular to this proof: the character `ψ_U` of the unipotent group of a graded space, functions on the
Bessel group that transform by it, and the equivariant function `𝒲_φ` of an algebraic form on `U(X)`, unique for odd `s`.

*Method of the formal proof:* `ψ_U` is `ψ` of a trace against the shift, additive on elements of degree `≥ 2` because
`𝔢` has degree `2`; invariance under `U(X)` because `𝔢` commutes with it; uniqueness from 8.1 (a).

Let `Y` be a grading. Put `ψ_U(u) = ψ(½ȷ·tr(𝔢·u))` for `u ∈ G` (rational coordinates). A function `W` on `R` is
*equivariant* if it is continuous, left invariant under `R(E)`, and `W(ur) = ψ_U(u)W(r)` for `u ∈ R` with `u − 1` of degree
`≥ 2`. For an algebraic form `φ` on `U(X)` (AdelicUnitaryGroupsAndAlgebraicModularForms §6.1) and a linear form `t` on
its values, `𝒲_φ(r) = ψ_U(r·p(r)⁻¹)·t(ρ(p(r)_∞)⁻¹φ(p(r)_f))` (`p` of 8.1 (a)).

- (a) `ψ_U(uu′) = ψ_U(u)ψ_U(u′)` for `u − 1`, `u′ − 1` of degree `≥ 2`; `ψ_U = 1` on rational points; `ψ_U(aua⁻¹) = ψ_U(u)` for
  `a ∈ U(X)(𝔸)`; `𝒲_φ(u·a) = ψ_U(u)·t(ρ(a_∞)⁻¹φ(a_f))` for `u ∈ U`.
- (b) If `s` is odd, `𝒲_φ` is equivariant, and every equivariant `W` with `W(a) = t(ρ(a_∞)⁻¹φ(a_f))` for `a ∈ U(X)(𝔸)` equals
  `𝒲_φ`.

*Needs:* 8.1; AdelicUnitaryGroupsAndAlgebraicModularForms §6.1 (algebraic modular forms, coefficients).

[ShortProof], `Lib/Weil/Periods/Equivariant` (`New.Grading.leviPart`, `New.Grading.unipotentChar`,
`New.Grading.unipotentChar_mul`, `New.Grading.unipotentChar_of_mem_Gamma`, `New.Grading.unipotentChar_conj`,
`New.Grading.IsEquivariant`, `New.Grading.sourceFn`, `New.Grading.sourceFn_mul`, `New.Grading.isEquivariant_sourceFn`,
`New.Grading.IsEquivariant.eq_sourceFn`, `New.Grading.besselReal`)

### 8.7 Constant terms along maps of positive degree

*Origin:* particular to this proof: the constant term of a datum on `Hom(V, V′)` along the maps of positive degree, as
a theta value of a zero term in a mixed model, with its Fourier expansion, its substitution and phase laws, and the
function `unfoldStep` of one unfolding step.

*Method of the formal proof:* the maps of positive degree span an isotropic subspace of `Hom(V, V′)` (by the reversal of
the string), so the constant term is the zero term of a splitting (5.1, 5.5), and 5.5 (c) gives the expansion; the
substitution laws are 5.6 (b) for elements preserving the flag, in the form of the zero term under elements whose
matrix agrees with an explicit matrix on the columns of positive weight.

- (a) On `Hom(U, V₀)`, `ω_{a,b}(g, g₀)` maps the Heisenberg operator of a map `w` to that of `g₀wg⁻¹` (rational
  coordinates). Let `D` be a splitting of `U` whose frame `k` is the coordinate inclusion of the indices of positive
  weight `wt`; if a matrix `C` agrees with `g` on the columns of positive weight (`g − C` of degree `≥ 0` from `wt` to `0`),
  `C − 1` has degree `≥ 1` from `min(0, wt)` to `wt`, `det C = u ∈ U(1)(𝔸)`, and `g` induces `g₀` on the core modulo the
  span of `k` (degree condition), then `ev_D(ω(g)f) = υ_U(u)⁻¹·ω(g₀)ev_D(f)`.
- (b) Let `Y`, `Y′` grade `V`, `V′` (any lengths), `d` weights on the indices of `V′` with `d(rev b) = −d(b)` for the
  reversal of the string. The *constant term* of `f ∈ 𝒮(Hom(V, V′))` at an adelic map `w` is the mean over adelic maps
  `v` modulo rational ones of the theta function of `ϱ(w)f` at the truncation of `v` to the entries of positive degree
  `d(b) − grade(a)`. It is `θ_{U₀}` of the zero term of a splitting of `Hom(V, V′)` along the entries of positive degree;
  for rational `w` it depends only on `w` modulo rational maps of degree `≥ 0`; if `w − w′` has degree `≥ 1`, the constant
  terms at `w′` and `w` differ by `β(w, w′)`; `θ(f) = Σ_{w} constTerm(f, w)` over rational classes, with
  `Σ_w |constTerm(f, w)| ≤ M‖f‖`; and the sum over the classes that agree with `T` is an explicit mean that does not
  depend on `d` (when `d ≤ max(grade′, 0)`).
- (c) For `(γ, δ)` with `γ ∈ R(E)` and `δ` a rational point not lowering `d`, or `γ ∈ U` and `δ − 1` of degree `≥ 1` for
  `d`: `constTerm(ω(γg, δh)f, w) = constTerm(ω(g, h)f, δ⁻¹wγ)`; and for equivariant `W` (8.6) and `u` as in 8.5, the
  products `W(ur)·constTerm(ω(ur, h)f, w)` and `W(r)·constTerm(ω(r, h)f, w)` differ by `β(Tu, T)/β(wu, w)`.
- (d) Let `Y′` have length `s − 1` and `unfoldStep(h) = ∫_{[R_Y]} W(r)·constTerm_{grade′}(ω(r, h)Φ, T) dr` for equivariant
  `W`. Then `unfoldStep` is continuous and left invariant under `R_{Y′}(E)`, and if the constants agree,
  `γ ↦ unfoldStep(γh)` is equivariant on `R_{Y′}`.

*Needs:* 5.1, 5.5, 5.6, 6.1, 6.9, 8.1, 8.5, 8.6.

[ShortProof], `Lib/Weil/Periods/ConstantTerm` (`New.Seesaw.pairWeil_homHeisenbergOp`, `New.Seesaw.zeroTerm_omega_of_inclMatrix`,
`New.Space.ratParabolic`, `New.Grading.constTerm`, `New.Grading.constTermAtStringMap`, `New.Grading.unfoldStep`,
`New.Grading.exists_splitting_constTerm`, `New.Grading.constTerm_congr_rat`, `New.Grading.constTerm_eq_homBicharacter_mul`,
`New.Grading.hasSum_constTerm`, `New.Grading.agreeingClasses`, `New.Grading.tsum_constTerm_agreesWithStringMap`,
`New.Grading.constTerm_mul`, `New.Grading.IsEquivariant.unipotent_mul_constTerm`, `New.Grading.constTermAtStringMap_rat_mul`,
`New.Grading.continuous_unfoldStep`, `New.Grading.unfoldStep_rat_mul`, `New.Grading.isEquivariant_unfoldStep`)

### 8.8 One step of the seesaw unfolding

*Origin:* adapted from Wang (2025), Theorem 4.5, and Furusawa and Morimoto (2025), Proposition 3.1, the unfolding of a
unipotent period of a global theta lift (SeesawForThetaChains §6.2a): here one step for unitary pairs and strings of
lengths `s` and `s − 1` with a definite complement, Bessel and Fourier–Jacobi cases together, against any equivariant
function on the whole Bessel group, with absolute convergence.

*Method of the formal proof:* expand the theta functional over rational classes by 8.7 (b); the classes stable under
`R(E)` whose representatives do not survive integrate to zero against `W` (a twist by an element of `U` multiplies the
term by a constant `≠ 1`); the surviving classes are the rational translates of the classes that agree with `T`
(8.5 (d)), each contributing one value of `unfoldStep`; 6.4 (a), (d) give absolute convergence.

Let `Y` grade `V` by `(X, s, N)`, `Y′` grade `V′` by `(X′, s − 1, N)`, `Φ ∈ 𝒮(Hom(V, V′))`, characters for the pair as in
6.1 (depending on the ranks), and `W` equivariant on `R_Y`.

- (a) For every `h`, `Σ_{q ∈ R_{Y′}(E)\U(V′)(E)} unfoldStep(q⁻¹h) = ∫_{[R_Y]} W(r)·θ(ω(r, h)Φ) dr`, the sum converging
  unconditionally.
- (b) For every automorphic rapidly decreasing `y` on `G_{V′}`, `unfoldStep·y` is integrable on
  `R_{Y′}(E)\G_{V′}` and `∫_{[R_Y]} W(r)·∫_{[U(V′)]} θ(ω(r, h)Φ)y(h) dh dr = ∫_{R_{Y′}(E)\G_{V′}} unfoldStep(h)·y(h) dh`.

SeesawForThetaChains §6.2a states an unfolding along the unipotent radical of a full isotropic flag against functions
with two transformation conditions; the route needs the form above.

*Needs:* 6.4, 8.1, 8.5–8.7; AdelicUnitaryGroupsAndAlgebraicModularForms §1.1 (quotient integrals).

[ShortProof], `Lib/Weil/Periods/Unfolding` (`New.Grading.ratSubst`, `New.Grading.classTerm`,
`New.Grading.integral_tsum_classTerm_eq_zero`, `New.Grading.tsum_integral_eq_of_not_survives`,
`New.Grading.agreeingTranslates`, `New.Grading.tsum_agreeingTranslates`, `New.Grading.exists_equiv_agreeingTranslates`,
`New.Grading.hasSum_unfoldStep`, `New.Grading.integral_besselGroup_unfold`)

### 8.9 Fourier coefficients of theta lifts along the centre of a unipotent radical

*Origin:* adapted from Wang (2025), Theorem 4.5, and Furusawa and Morimoto (2025), Proposition 3.1, the Fourier
coefficient of a theta lift along the open orbit (SeesawForThetaChains §6.2a): here the coefficient along the centre of
the unipotent radical of the stabiliser of an isotropic subspace of any dimension, over a core, at any hermitian
matrix, as a sum over rational frames, and, for an invertible matrix, as one integral over the quotient by the rational
stabiliser of a frame.

*Method of the formal proof:* expand the kernel over rational matrices (6.12); the term of `x` transforms under the
centre by the character of the Gram matrix of `x` (6.9 (c)), so the coefficient keeps the terms with Gram matrix `β`;
for invertible `β` they form one orbit of `U(V)(E)` by Witt's theorem, and the sum over the orbit unfolds.

Let `D` be a splitting of `W` over `W₀` along `p`, `V` a hermitian space, and for `M ∈ M_p(𝔸)` let `z(M) = n(0, −2ȷM)` (an
element of the centre of the unipotent radical). The *Fourier coefficient* at `T ∈ M_p(E)` of a function `F` on `G_W` is
`F_T(g) =` the mean over `M_p(𝔸)/M_p(E)` of `ψ(tr(TM))·F(z(M)g)`. Let `y` be continuous on `G_V` and let `f` have integrable
terms at `g` against `y` (6.12).

- (a) For every `β ∈ M_p(E)`, the coefficient at `ȷβ` of `g ↦ ∫_{[V]} θ_{a,b}(f; g, h)y(h) dh` is
  `Σ_{x ∈ M_{m×p}(E), x*J_Vx = β} ∫_{[V]} θ_x(f; g, h)y(h) dh`.
- (b) If moreover `y` is left invariant under `Γ_V` and `x*J_Vx` is invertible, then `h ↦ θ_x(f; g, h)y(h)` is integrable
  on `Stab(x)(E)\G_V` and the coefficient at `ȷ·x*J_Vx` equals `∫_{Stab(x)(E)\G_V} θ_x(f; g, h)y(h) dh`.

*Needs:* 5.1, 6.9, 6.12; HermitianFormsAndLattices §1.1 (b) (Witt extension); AdelicUnitaryGroupsAndAlgebraicModularForms
§1.1 (quotient integrals).

[ShortProof], `Lib/Weil/Periods/DescentVanishing` (`New.Space.ratStabilizer`, `New.Space.Splitting.centreCoeff_integral_eq_tsum`,
`New.Space.Splitting.centreCoeff_eq_integral_ratStabilizer`, `New.Space.Splitting.centreCoeff_eq_integral_stabilizer`)

### 8.10 Vanishing descents force vanishing periods

*Origin:* particular to this proof: a function on the definite unitary group whose theta descents to a split space
vanish has zero periods over the complementary unitary groups of an orthogonal decomposition.

*Method of the formal proof:* the Fourier coefficients of the descents (8.9) at invertible matrices are integrals of
`Y` against characters of frames over stabilisers; their vanishing for all data that are vacua at `T` gives, through
Stone–Weierstrass on the characters of frames, the vanishing of the periods over `U(n₂)`.

Let `W`, `V` be hermitian spaces, `a` an automorphic character of `U(1)` and `S` a set of finite places. A function `Y` on
`G_V` has *vanishing descents above `S`* if `∫_{[V]} θ_{a,1}(f; g, h)Y(h) dh = 0` for all `g ∈ G_W` and all
`f ∈ 𝒮(Hom(W, V))` with `P^S f = f`.

- (a) If `Y` is automorphic with vanishing descents above `S` and `h₀` is integral at the places of `S`, then `Y(·h₀)` has
  vanishing descents above `S`. If `V` is definite, `A` is conjugation-free, `Y` is automorphic, and the descents of `Y`
  vanish for all data `v_P ⊗ (Ψ·vac)` (`P` a polynomial, `Ψ` Schwartz–Bruhat above `A`), then `Y` has vanishing descents
  above the complement of `A ∪ Ā`.
- (b) Let `n = n₁ ⊔ n₂`, `T` a set of finite places, and `Y` continuous on `G_{1,n}` (the definite standard space),
  left invariant under `Γ`, right invariant under the elements of `K₀` that are `1` outside `T ∪ T̄`. If `Y` has vanishing
  descents above `T` to the hyperbolic space `H_{n₁}` for the character `υ_U^{|n₁|}`, then
  `∫_{[U(n₂)]} Y(diag(h₁, h₂)) dh₂ = 0` for every `h₁ ∈ G_{1,n₁}`.

*Needs:* 3.7, 5.4, 6.4, 6.12, 8.9.

[ShortProof], `Lib/Weil/Periods/DescentVanishing` (`New.SiegelWeil.DescentsVanish`, `New.SiegelWeil.DescentsVanish.comp_mul_right`,
`New.SiegelWeil.DescentsVanish.of_schrodingerOp`, `New.SiegelWeil.blockPeriod`,
`New.SiegelWeil.DescentsVanish.integral_frameChar_mul_blockPeriod_eq_zero`,
`New.SiegelWeil.exists_continuousMap_eq_conj_blockPeriod`, `New.SiegelWeil.integral_continuousMap_frameChar_eq_zero`,
`New.SiegelWeil.integral_blockEmb_eq_zero_of_descentsVanish`)

## Layer 9: Hecke polynomial operators at split places

At a place `w` of `E` split over `E⁺` the finite unitary group contains `GL_n(E_w)`. This layer gives the decomposition
of the basic double cosets of `GL_n` into single cosets, the Hecke operators `T_{w,j}` and the Hecke polynomial
`P_w(X) = Σ_i (−X)^i q_w^{i(i−1)/2}T_{w,i}` on any representation of the finite unitary group, and the transfer of Hecke
polynomials through the Weil representation of a pair and through theta lifts.

### 9.1 The basic double cosets of `GL_n` at a finite place

*Origin:* adapted from the published theory of the spherical Hecke algebra of `GL_n` over a local field: here the
decomposition of the double coset of `diag(ϖ1_j, 1)` into single cosets indexed by the subspaces of dimension `j` of the
residue space, as identities of operators on the vectors fixed by `GL_n(O_w)` in any representation, with the operator
of the inverse coset, and local criteria for principal level.

*Method of the formal proof:* for `g` integral with `ϖg⁻¹` integral, the coset `Kg` is determined by the kernel of the
reduction of `g`, and every subspace occurs (an explicit diagonal representative times a permutation); the operator of
the inverse coset is computed through the same representatives, and duality `i ↔ n − i` multiplies by the scalar `ϖ`.

Let `E` be a number field, `w` a finite place with ring of integers `O_w`, residue field `k_w` and a uniformiser `ϖ`,
`K = GL_n(O_w)`, and `D_j = {g ∈ GL_n(E_w) : g and ϖg⁻¹ integral, ord_w det g = j}`. For integral `g` let `ker ḡ ⊂ k_w^n` be
the kernel of its reduction.

- (a) `D_j` contains the diagonal matrix with `j` entries `ϖ` and the others `1` when `j ≤ n`, and is empty for `j > n`;
  `D_j = KgK` for every
  `g ∈ D_j`. For `g ∈ D_j` and `g′ ∈ D_i`: `gg′⁻¹ ∈ K` if and only if `ker ḡ = ker ḡ′`; `dim ker ḡ = j`; and every subspace
  `U` of dimension `j` is `ker γ̄_U` for some `γ_U ∈ D_j`.
- (b) Let `π` be a representation of `GL_n(E_w)` on a module over a commutative ring, and `x` fixed by `K`. Then
  `T_j x := Σ_{gK ⊂ D_j} π(g)x = Σ_{dim U = j} π(γ_Uᵀ)x`; the operator of the inverse coset is
  `Σ_{gK : g⁻¹ ∈ D_j} π(g)x = Σ_{dim U = j} π(γ_U⁻¹)x`; for `n = i + j`, `π(ϖ·1)` applied to the operator of the inverse
  coset of `D_i` gives `T_j x`; and `T_0 x = x`.
- (c) Let `E` be a CM field. For `g ∈ K₀` (any rank) the entry `(g − 1)_{ij}` lies in `aÔ` if and only if it does at every
  place dividing `a`; if no place of `S ∪ S̄` divides `a ∈ 𝒪_E`, the elements of `K₀` equal to `1` outside `S ∪ S̄` lie in
  the principal congruence subgroup of level `a`.

The library has the classification of the double cosets of `SL_n(ℤ)` in integral matrices of `GL_n(ℚ)` and families of
single-coset representatives (`HeckeRing.GLn.diagCoset_bijective`, `HeckeRing.GLn.eq_of_upperTriGL_mul_inv_mem_SLnZ`);
missing are the decomposition over a completion `E_w`, its indexing by subspaces and the operator identities.

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 3.9 (b) (Hecke operators, principal levels).

[ShortProof], `Lib/Weil/Unramified/HeckeGL` (`New.diagGL_mem_basicDoubleCoset`, `New.le_card_of_mem_basicDoubleCoset`,
`New.residueKer`, `New.mul_inv_mem_localIntGL_iff`, `New.basicCosetRep`, `New.basicCosetRep_mem_and_residueKer_eq`,
`New.finrank_residueKer`, `New.basicDoubleCoset_eq`, `New.heckeFun_basicDoubleCoset_inv`, `New.heckeGL_eq_sum`,
`New.heckeGL_dual`, `New.heckeGL_zero`, `New.sub_one_mem_span_iff_atPlace`, `New.inf_supportedOn_le_principalLevel`)

### 9.2 Hecke operators and Hecke polynomials at split places

*Origin:* adapted from the published theory of the spherical Hecke operators of `GL_n` over a local field: here on any
representation of the finite unitary group of a CM field, at places split over `E⁺`, with duality between `w` and `w̄`,
adjointness for invariant pairings, commutation on vectors spherical at two places, joint eigenvectors in unitary
representations, and Hecke polynomials.

*Method of the formal proof:* at a split place `G_f` contains `GL_n(E_w)` through `w`, and 9.1 applies; the operator at `w̄`
is that of the inverse coset at `w`; adjointness by the change of variables `g ↦ g⁻¹`; commutation on vectors spherical
at both places by the commutativity of the spherical operators of `GL_n` (Gelfand's trick with the transpose) when
`u ∈ {w, w̄}`, and because the supports are disjoint otherwise; joint eigenvectors because the operators commute and are
normal for the invariant form.

Let `E` be a CM field, `w` a finite place with `w̄ ≠ w`, `ι_w : GL_n(E_w) → G_f` the embedding of
AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 (`g` at `w`, `(g*)⁻¹` at `w̄`, `1` elsewhere), and `K_w` the elements of
`K₀` equal to `1` outside `{w, w̄}`. For a representation `π` of `G_f`, a vector is *spherical at `w`* if `K_w` fixes it; `T_{w,j}` is `T_j` of 9.1 for `π ∘ ι_w`; the *Hecke polynomial*
is `P_w(X) = Σ_{i=0}^{n} (−X)^i q_w^{i(i−1)/2}T_{w,i}`; and `v` *has Hecke polynomial `p` at `w`* if it is spherical at `w`
and `P_w(X)v = p(X)v` for all `X`.

- (a) For `v` spherical at `w`: `T_{w̄,j}v` is the operator of the inverse coset of 9.1 (b) at `w`;
  `π(ι_w(ϖ·1))T_{w̄,i}v = T_{w,n−i}v`; `T_{w,j}` commutes on `v` with every `g ∈ G_f` with `g_w ∈ GL_n(O_w)`; for a
  `G_f`-invariant `σ`-sesquilinear pairing `B`, `B(T_{w,j}v, v′) = B(v, T_{w̄,j}v′)` for `v′` spherical; `T_{w,j}` preserves
  the vectors on which a subgroup `K ⊂ K₀` acts by a character; and for split `w`, `u` and `v` spherical at both,
  `T_{w,i}T_{u,j}v = T_{u,j}T_{w,i}v`.
- (b) For a representation with a positive definite invariant hermitian form, a conjugation-stable set `S` of split
  places and a finite-dimensional subspace spherical at every `w ∈ S` and stable under every `T_{w,j}`, `w ∈ S`, the
  subspace is spanned by joint eigenvectors of all these operators.
- (c) If `y` is spherical at `w` and `T_{w,i}y = t_iy` for all `i`, then `y` has Hecke polynomial
  `Σ_i (−X)^iq_w^{i(i−1)/2}t_i`. For a `G_f`-invariant pairing `B` as in (a) and `y`, `z` spherical at `w`,
  `B(P_w(X)y, z) = B(y, P_{w̄}(σX)z)`. Every `T_{w,i}` lies in each subspace of operators that contains all
  `P_w(X)`; for each function `p` there are `t_i` with `T_{w,i}y = t_iy` for every `y` with Hecke polynomial `p`; and a
  `σ`-semilinear map equivariant for the elements supported at `{w, w̄}` carries `P_w(X)` to `P_w(σX)`.

The library has an abstract commutativity criterion for Hecke rings (`HeckeCosetModule.mul_comm_of_antiInvolution`) with
its instance for `GL_n(ℤ) ⊂ GL_n(ℚ)`, and the formal Hecke polynomial of `GL_n` (`TauCeti.glnHeckePolynomial`); missing
are the local operators on representations of `G_f` and their laws.

*Needs:* 9.1; AuxiliaryAlgebraAndAnalysisForThetaLifts §2.2 (c) (commutation of spherical Hecke operators);
AdelicUnitaryGroupsAndAlgebraicModularForms §§3.1, 3.2 (b) (`G_f`, `K₀`, `ι_w`, supports).

[ShortProof], `Lib/Weil/Unramified/SplitHecke` (`New.maxCompactAt`, `New.heckeSplit`, `New.sphericalAt`, `New.heckeSplit_star`,
`New.heckeSplit_dual`, `New.heckeSplit_comm_of_atPlace_mem`, `New.heckeSplit_adjoint`, `New.heckeSplit_mem_levelSpace`,
`New.heckeSplit_comm`, `New.IsUnitary.le_span_joint_eigenvectors`, `New.IsUnitary.le_span_hecke_eigenvectors`,
`New.heckePolyEval`, `New.heckePolyOp`, `New.HasHeckePolynomial`, `New.hasHeckePolynomial_of_heckeSplit`,
`New.heckePolyOp_adjoint`, `New.heckeSplit_mem_of_heckePolyOp`, `New.exists_heckeSplit_eq_smul`, `New.map_heckePolyOp`)

### 9.3 Hecke polynomials pass through theta lifts

*Origin:* adapted from Rallis (1982) and Mínguez (2008), Théorème 1, the split case of the unramified theta
correspondence (ThetaKernelsForUnitaryDualPairs §3.21a): here as an identity of Hecke polynomial operators of the two
groups at a split place on a datum of the space of data that is the vacuum at that place, for spaces of any signature,
transported to equivariant pairings, theta lifts and transposed lifts.

*Method of the formal proof:* on a datum fixed by `P^{w}`, both Hecke polynomials are sums over the subspaces of the
residue spaces (9.1 (b)) of operators that act on named data by substitution (6.3 (a)); the two sums are compared by the
`q`-binomial theorem over subspaces of a vector space over `k_w`; equivariance carries the identity to pairings, and
7.3 to lifts.

Let `w` be split of norm `q`, `S`, `T` hermitian spaces of ranks `n` and `m = n + k` (any signatures), `a`, `b` automorphic
characters of `U(1)` with `x ↦ a(x/x̄)` and `x ↦ b(x/x̄)` unramified at `w`, `α = a_n(ϖ_w)q^{n/2}`, `β = b_m(ϖ_w)q^{m/2}`
(6.1), `(X; q)_k = Π_{l<k}(1 − q^lX)`, and `f ∈ 𝒮(Hom(S, T))` with `P^{w}f = f`.

- (a) `f` is spherical at `w` for `g ↦ ω_{a,b}((1, g), 1)` and for `h ↦ ω_{a,b}(1, (1, h))`, and
  `P^T_w(X/α)f = (X; q)_k·P^S_{w̄}(q^kX/β)f` for all `X`.
- (b) Let `π`, `ρ` be representations of `G_{f,n}`, `G_{f,m}` on `W`, `Z`, `M` a subspace of data containing `f` and its
  finite translates, and `B : M × W → Z` bilinear with `ρ(h)B(f, v) = B(ω_{a,b}((1, g), (1, h))f, π(g)v)`. For `v` spherical
  at `w`, `B(f, v)` is spherical and `P^ρ_w(X)B(f, v) = (αX; q)_k·B(f, P^π_w(q^kαβ⁻¹X)v)`; so if `v` has Hecke polynomial `p`,
  `B(f, v)` has `(αX; q)_k·p(q^kαβ⁻¹X)`.
- (c) If `f` is an arrow from `e` to `e′` (7.3) and `y` is a form of type `e` with Hecke polynomial `p` at `w`, the lift of
  `y` by `f` has Hecke polynomial `(αX; q)_k·p(q^kαβ⁻¹X)` at `w`.
- (d) If instead `a`, `b` are unramified at `w̄` and `P^{w̄}f = f`, then for `y` automorphic, rapidly decreasing and
  spherical at `w` on `G_T`, the transposed lift `L^t_f y` is spherical at `w` and
  `L^t_f(P_w(X)y) = (α̃X; q)_k·P_w(q^kα̃β̃⁻¹X)L^t_f y`, with `α̃`, `β̃` as `α`, `β` at `w̄`.
- (e) If `π(g)v = ρ(det g)v` for all `g` and an automorphic character `ρ` with `x ↦ ρ(x/x̄)` unramified at `w`, then `v` has
  Hecke polynomial `(ρ̃(ϖ_w)X; q)_n` with `ρ̃(x) = ρ(x/x̄)` on ideles; a vector fixed by `G_f` has Hecke polynomial
  `(X; q)_n`.

ThetaKernelsForUnitaryDualPairs §3.21a (ii)–(iii), split case, gives the relation of Satake parameters for the
Schwartz model through Howe's theorem on spherical vectors; the route needs only the operator identity above, on the
space of data. The library has the formal Hecke polynomial of `GL_n` (`TauCeti.glnHeckePolynomial`) and no statement on
theta correspondences.

*Needs:* 3.7, 5.4, 6.1–6.4, 7.3, 9.1, 9.2; ArithmeticStatisticsPartIV §3.2 (subspace count, `q`-binomial theorem).

[ShortProof], `Lib/Weil/Unramified/HeckeTransfer` (`New.AutChar.frobValue`, `New.heckePolyOp_eq_sum`,
`New.SiegelWeil.pairWeilSource`, `New.SiegelWeil.pairWeilTarget`, `New.SiegelWeil.heckePolyOp_pairWeilTarget`,
`New.SiegelWeil.hecke_transfer_of_equivariant`, `New.SiegelWeil.hecke_transfer_of_pairing`,
`New.SiegelWeil.lift_swap_heckePolyOp`, `New.SiegelWeil.hasHeckePolynomial_of_pairing`,
`New.SiegelWeil.hasHeckePolynomial_formLift`, `New.SiegelWeil.hasHeckePolynomial_of_apply_eq_smul_det`,
`New.SiegelWeil.hasHeckePolynomial_qPochhammer`)

## What the library already provides

Nothing in this roadmap is in Tau Ceti or in Mathlib in a form that replaces a section: there is no Weil representation,
Heisenberg representation on functions, theta functional, theta kernel or theta lift in either. The partial neighbours
that a contributor should start from are named in the sections that use them: scalar Gauss sums (3.9), theta sections on
a one-dimensional torus (4.3, 4.4), duality of `ℤ`-lattices and Witt extension over a field (8.2), local determination of
lattices over a Dedekind domain (8.4), Hecke rings of `GL_n` over `ℤ` and the formal Hecke polynomial (9.1–9.3).

## Results taken from other roadmaps

- Witt's extension theorem for hermitian spaces over a field: HermitianFormsAndLattices §1.1 (b) (used in 8.9).
- The identity `Σ_{U≤W} (−X)^{dim U}q^{dim U(dim U−1)/2} = ∏_{l<dim W}(1 − q^lX)` over the subspaces of a finite vector
  space, from the count of subspaces and Cauchy's `q`-binomial theorem: ArithmeticStatisticsPartIV §3.2 (used in 9.3).
- From the other background roadmaps of this family, cited in the sections that use them:
  AdelicUnitaryGroupsAndAlgebraicModularForms §§1.1, 1.4, 2.1, 3.1–3.5, 3.9, 4.2, 4.4, 5.1, 5.4, 6.1 (adeles, hermitian
  spaces and their groups, heights and reduction, automorphic and algebraic forms);
  IdelicReciprocityCountsAndCyclotomicClassGroups §§7.1, 7.2 (characters of `U(1)`, splitting characters);
  HolomorphicDiscreteSeriesOfUnitaryGroups §§4.1, 4.2, 4.4, 6.1, 8.1, 8.2, 8.5, 8.6 (holomorphy of a weight,
  discrete-series kernels, Fock data, block rule, joint harmonics, local correspondence);
  AbelianSchemesWithThetaStructuresAndTheirCohomology §1.2 (c) (Frobenius' dimension formula);
  IntegralRepresentationsOfGeneralLinearGroups §§1.1, 1.3, 2.4 (Weyl modules, Schur matrices, highest vectors);
  AuxiliaryAlgebraAndAnalysisForThetaLifts §2.2 (c) (commutation of spherical operators);
  DivisibilityOfThetaDerivatives §4.4 (b) (jet series along lines); SiegelWeilAndRallisFormulasOnUnitaryGroups §6.1 (a)
  (line terms, used in 6.11).
