# Roadmap: Galois representations of unitary eigenforms

**Summary.** The Riemann hypothesis for Dirichlet `L`-functions follows from a one-sided bound for a sum over primes,
which gives a zero-free half-plane. That bound comes from comparing an upper and a lower bound for the covolume of a
lattice of theta lifts. The lower bound needs, prime by prime, twists for which the theta lifts have few congruences
with other forms, and these congruences are controlled by Selmer groups of the `ℓ`-adic Galois representations of the
eigenforms involved, through Ribet's method at Taylor–Wiles places. This background roadmap constructs those Galois
representations, for eigenforms on the unitary group of the standard definite hermitian space over a CM field, in the
weak form that the argument uses, together with the base change, the local information at split places and the
Taylor–Wiles operators that the argument draws on.

"Attached" is weak here: a continuous semisimple representation whose characteristic polynomials are `ℓ`-adically
close to the Hecke polynomials at most Frobenius elements, in the sense of a filter on Frobenius data (1.2, 1.5).
At a place, what is recorded is a polynomial that annihilates the image of a Frobenius or inertia element (on the
periods, above `ℓ`), not its characteristic polynomial; Weil–Deligne representations do not appear. The construction
does not pass through base change to `GL_n`: odd rank comes from the cohomology of PEL models
(AbelianSchemesWithThetaStructuresAndTheirCohomology §9.8), cut down to the right rank by a criterion on free
Hodge–Tate weights, then reaches all weights by `ℓ`-adic limits, all stably unramified CM fields by quadratic base
change between definite unitary groups, and every rank by theta lifts to odd rank followed by the cancellation of
strings of characters.

The headline statements are these.

(1) *Every rank* (7.3). Let `E` be a CM field with Weil data, `ℓ` a prime, `ι : ℂ ≃ ℚ̄_ℓ` and `n ≥ 1`. To every
eigenform on `U(n)` over `E`, whatever its weight, some `ℓ`-adic representation of rank `n` is attached; at every
finite place where the form is spherical, every attached representation is unramified, or crystalline above `ℓ`, with
the Hodge–Tate jumps of the weight, and at a split such place the Hecke polynomial kills geometric Frobenius.

(2) *Local–global compatibility at split places* (8.2, 8.4). At a split place where the form is a pro-`p` Iwahori
eigenvector, or has a depth-zero type given by a label, every attached representation is of finite type, has the
jumps of the weight, and explicit polynomials built from the eigencharacter, or from the tame characters named by the
label, kill the corresponding Weil elements, above `ℓ` included.

(3) *Base change of prime degree between definite unitary groups* (5.9). For a step `E′/E` (5.1: a Galois extension of
CM fields of prime degree, with `ζ_5040 ∈ E`, an integer of `E′` of trace `1` to `E`, and a character `μ` of the finite
ideles of `E` cutting out the norms from `E′`), with `E′` stably unramified, a nonzero form over `E` has a weak base
change eigenform over `E′`, and, for matching local data under a nonzero trace condition, one (off the places of the
data) with prescribed eigenvalues of the matching local operators; Iwahori eigencharacters and labels pass to the base change at places with one place above (5.10, 5.11).

(4) *Taylor–Wiles places* (9.1). At auxiliary places of norm `≡ 1` modulo a power of `ℓ`, off the level, every finite
subgroup `Δ` of the product of the residual general linear groups has an integral operator `Ψ` on the forms of
principal level with `Σ_{g∈Δ} g⁻¹Ψg = c`, `c` a common multiple of the stabiliser orders.

The roadmap rests on AdelicUnitaryGroupsAndAlgebraicModularForms for algebraic modular forms and Hecke operators; on
CrystallineRepresentationsAndKisinModules for crystalline representations, Hodge–Tate jumps, killing polynomials on
periods and the limit theorem for crystalline representations; on AbelianSchemesWithThetaStructuresAndTheirCohomology
for cuspidal types, the trace formula on definite forms and the Galois representations cut out of the cohomology of
PEL models; on IdelicReciprocityCountsAndCyclotomicClassGroups for places of a fixed algebraic closure, local Artin maps,
Hecke characters and their `ℓ`-adic avatars; on IntegralRepresentationsOfGeneralLinearGroups for Schur matrices, Green's
characters, Shintani lifting and Iwahori-level Hecke operators; on WeilRepresentationsOnBanachSpacesOfData for Weil data,
the Hecke operators at split places and theta lifts; and, for the theta lift of 7.1, also on
SiegelWeilAndRallisFormulasOnUnitaryGroups and HolomorphicDiscreteSeriesOfUnitaryGroups. Its results are used by
CongruencesOfTwistedThetaLifts and SelmerBoundsForAnticyclotomicTwists; its Hilbert 90 statements (5.2, 5.3) are used
across the background.

Layer 1 fixes the forms, the filter of most Frobenii, the local conditions and the notion of attached representation.
Layer 2 is the algebra of semisimple representations, lattices, pseudocharacters and limits of traces. Layer 3 gives
the congruences that change the weight. Layer 4 gives the criterion on free weights, the Hodge–Tate cocharacter,
cuspidal types and multiplicity-free sums. Layer 5 is base change of prime degree between definite unitary groups.
Layer 6 constructs the representations in odd rank, Layer 7 in every rank. Layer 8 is local–global compatibility at
split places. Layer 9 holds the Taylor–Wiles operators and the Selmer modules of cocycles.

## Conventions and notation

Adeles, CM types and the `5040` condition are those of AdelicUnitaryGroupsAndAlgebraicModularForms §2.1; algebraic
modular forms, their weights, the finite adelic unitary groups and levels are those of
AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 3.1, 6.1; Hecke operators at split places and sphericity are those of
WeilRepresentationsOnBanachSpacesOfData §9.2; crystalline and potentially crystalline representations, Hodge–Tate jumps,
Weil pairs and the linearised Frobenius on periods are those of CrystallineRepresentationsAndKisinModules §3.1; places of
`Ω`, decomposition and inertia groups, local Artin maps at places of `Ω`, algebraic Hecke characters, characters of
`U(1)` and `ℓ`-adic avatars are those of IdelicReciprocityCountsAndCyclotomicClassGroups §§1.1, 2.1, 7.1, 7.5, 9.1.

| Symbol | Meaning |
|---|---|
| `E`, `E⁺`, `x ↦ x̄` | a CM field, its maximal totally real subfield, complex conjugation |
| `Φ` | a CM type of `E`: one embedding `Φ_v : E → ℂ` for each infinite place `v` |
| stably unramified | `E` contains a primitive `5040`-th root of unity; then `E/E⁺` is unramified at every finite place |
| `Ω`, `G_E` | a fixed algebraic closure of `ℚ` containing `E`; `G_E = Gal(Ω/E)` with its profinite topology |
| `w`, `w̄`, `q_w` | a finite place of `E`, its conjugate, the order of its residue field `k_w`; `w` is *split* if `w̄ ≠ w` |
| `E_w`, `𝒪_w`, `ϖ_w` | completion, its integers, a chosen uniformiser |
| `A`, `D_A`, `I_A` | a place of `Ω` (a valuation subring of `Ω`) over `w`; its decomposition and inertia groups in `G_E` |
| arithmetic Frobenius | `σ ∈ D_A` acting on the residue field of `A` by `x ↦ x^q`; `s` is a *geometric Frobenius* of norm `q` if `s⁻¹` is an arithmetic one |
| Frobenius datum | a triple `(w, A, s)`: `q_w` prime, `A` over `w`, `s` a geometric Frobenius at `A` of norm `q_w` |
| `ℓ`, `ℚ̄_ℓ`, `ℂ_ℓ`, `ι` | a prime, an algebraic closure of `ℚ_ℓ`, its completion, a fixed field isomorphism `ι : ℂ ≃ ℚ̄_ℓ` |
| `ℓ`-adic representation | a homomorphism `r : G_E → GL_n(ℚ̄_ℓ)`; continuity is stated separately |
| semisimple | over a field `k`, `r : G → GL_n(k)` is semisimple if every `x` in the `k`-span of `r(G)` with `tr(x·r(g)) = 0` for all `g` is `0` (non-degeneracy of the trace form) |
| `𝔸_f`, `Ô` | the finite adeles and the completed integers of `E` |
| `G_f(n)`, `K₀`, `U(n)(E)` | as in AdelicUnitaryGroupsAndAlgebraicModularForms §3.1: the finite adelic points `{g ∈ GL_n(𝔸_f) : ḡᵀg = 1}` of the unitary group of the standard definite hermitian form `x₁x̄₁ + ⋯ + xₙx̄ₙ`; `K₀ = G_f(n) ∩ GL_n(Ô)`; the rational points |
| `ι_w`, `K_w` | for split `w`, the embedding `GL_n(E_w) → G_f(n)` of AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 (component `g` at `w`, the component forced by unitarity at `w̄`, `1` elsewhere); for any finite `w`, split or not, `K_w` the elements of `K₀` supported at `w` and `w̄`, and `f` is *spherical at `w`* if `K_w` fixes it, as in WeilRepresentationsOnBanachSpacesOfData §9.2 |
| `T_{w,j}` | for split `w` and `j ≥ 0`, the Hecke operator of WeilRepresentationsOnBanachSpacesOfData §9.2: that of the double coset of `diag(ϖ_w, …, ϖ_w, 1, …, 1)` (`j` entries `ϖ_w`) under `GL_n(𝒪_w)`, acting through `ι_w` by right translation |
| weight `κ` | a dominant weight `λ_v = (λ_{v,1} ≥ ⋯ ≥ λ_{v,n}) ∈ ℤⁿ` at each infinite place `v`; forms of weight `κ` are functions `f : G_f(n) → V_κ` with open right stabiliser and `f(γg) = ρ_κ(γ)f(g)` for `γ ∈ U(n)(E)` (AdelicUnitaryGroupsAndAlgebraicModularForms §6.1) |
| free | integers `e_1, …, e_N` are *free* if two vectors `α, β ∈ ℕ^N` with `Σα_i = Σβ_i ≤ (N + 1)²` and `Σα_ie_i = Σβ_ie_i` are equal; a dominant weight `λ ∈ ℤ^N` is free if the integers `λ_i + N − i` are |
| `J_κ(σ)` | the *jumps* of `κ` in rank `N` at `σ : E → ℂ` lying over `v`: the multiset `{i − 1 − λ_{v,i} : 1 ≤ i ≤ N}` if `σ = Φ_v`, and `{λ_{v,i} + N − i : 1 ≤ i ≤ N}` otherwise (1.1) |
| `K = ℚ(√−d)` | in 6.1 and 6.2, an imaginary quadratic field with `d ≡ 3 mod 4`, contained in `E` where stated; elsewhere `K` is a field or a subgroup introduced in the section |
| Weil data | on a stably unramified `E`, a triple `(ȷ, α, υ)` as in WeilRepresentationsOnBanachSpacesOfData §3.1, with `υ` its splitting character (a unitary Hecke character of `E` with `υ(x̄) = υ(x)⁻¹`) |
| `μ`, `θ_{k,j}(μ)` | a character of `U(1)` with trivial tame part and weight `c`, as in IdelicReciprocityCountsAndCyclotomicClassGroups §7.1; `θ_{k,j}(μ)` the algebraic Hecke character `x ↦ μ(x/x̄)υ(x)^{−k}|x|^{j−k/2}` of IdelicReciprocityCountsAndCyclotomicClassGroups §8.5 (c) |
| `χ(ϖ_w)` | for a character `χ` of the finite ideles, its value at the idele equal to `ϖ_w` at `w` and `1` elsewhere |
| `[ShortProof]` | the shorter formal proof; paths are under its `src/` |

## Layer 1: Forms, Frobenius data, local conditions and attached representations

This layer fixes the notions in which the Galois representations of this roadmap are stated. The filter of most
Frobenii replaces sets of places of density one; the local conditions are stated place by place on `Ω`, with a clause
for places above `ℓ` along embeddings into `ℚ̄_ℓ`.

### 1.1 Hecke polynomials, eigenforms, labels and jumps

*Origin:* definitions and conventions.

*Method of the formal proof:* the notions are read off the Hecke operators at split places and the action of the
residual general linear group; monicity of the Hecke polynomial holds because `T_{w,0}` is the identity on spherical
vectors.

Let `f : G_f(n) → M` be any function with values in a complex vector space, acted on by right translation.

- For `q, n ∈ ℕ` and a sequence `t = (t_j)` in a commutative ring, the *Hecke polynomial* is
  `H_{q,n}(t) = Σ_{j=0}^{n} (−1)^j q^{j(j−1)/2} t_j X^{n−j}`.
- `f` *has Hecke polynomial* `P` at a split `w` if `f` is spherical at `w`, `T_{w,j}f = t_jf` for all `j ≥ 0`, and
  `P = H_{q_w,n}(t)`. If `f ≠ 0`, such a `P` is unique and monic of degree `n`.
- `f` is an *eigenform* for a system `P = (P_w)` of complex polynomials if `f ≠ 0` and, for all but finitely many `w`,
  if `q_w` is prime then `w` is split and `f` has Hecke polynomial `P_w` at `w`.
- `f` is *spherical off* a finite set `S` with polynomials `P` if `f ≠ 0`, `f` is fixed by the elements of `K₀` with
  component `1` at the places of `S`, and `f` has Hecke polynomial `P_w` at every split `w` with `w, w̄ ∉ S`.
- For split `w` and `Ξ : GL_n(k_w) → ℂ`, `f` *has the label* `Ξ` at `w` if the kernel of reduction
  `GL_n(𝒪_w) → GL_n(k_w)` fixes `f` through `ι_w`, and `Σ_{x ∈ GL_n(k_w)} conj(Ξ(x))·(ι_w(x̃)f) ≠ 0`, `x̃` a lift of `x`.
- The jumps `J_κ(σ)` of a weight `κ` in rank `N` are as in the Conventions; at each `σ` they are pairwise distinct.

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 3.1, 6.1 (level spaces, `G_f(n)`, `ι_w`, forms);
WeilRepresentationsOnBanachSpacesOfData §§9.1, 9.2 (Hecke operators at split places).

[ShortProof], `Lib/GaloisRep/Main/Defs` (`New.Weight`, `New.heckePoly`, `New.HasHeckePolyAt`, `New.IsEigenform`, `New.IsSphericalOff`, `New.HasLabel`, `New.jumps`, `New.HasHeckePolyAt.isMonicOfDegree`, `New.Weight.nodup_jumps`), with `Lib/GaloisRep/Main/OddRank` (`New.HasHeckePolyAt.unique`)

### 1.2 The filter of most Frobenii

*Origin:* particular to this proof: a filter on Frobenius data that takes the place of "a set of places of density
one", with the density of its members from Chebotarev's theorem.

*Method of the formal proof:* the filter properties by shrinking open sets twice; density by applying Chebotarev's theorem
in existence form inside the open set that a member provides.

Let `E` be a number field inside `Ω`. Say that a set `X` of Frobenius data *contains most Frobenii* if every nonempty
open `V ⊆ G_E` contains a nonempty open `O` such that, for all but finitely many `w`, `X` contains every Frobenius
datum `(w, A, s)` with `s ∈ O`. Then:
(a) these sets form a filter on Frobenius data, the filter of *most Frobenii*; for `g ∈ G_E`, *most Frobenii at `g`*
is its meet with the condition `s → g`;
(b) if all but finitely many finite places of `E` have a property, then so does the place `w` of most Frobenius data
`(w, A, s)`;
(c) if `φ : G_E → G_F` is an open embedding, `π` a map from finite places of `E` to those of `F`, and `X` contains most
Frobenii over `E`, then for most Frobenius data `y` over `F`, every datum `x` over `E` whose place and Frobenius
element are carried by `π` and `φ` to those of `y` lies in `X`;
(d) if a property of `s` holds for most Frobenius data `(w, A, s)`, it holds on a dense subset of `G_E`; in particular
most Frobenii at `g` is a proper filter.

*Needs:* `ArithmeticGaloisRepresentations §5.1` (Chebotarev's density theorem); Tau Ceti
`NumberField.Chebotarev.infinite_frobeniusPrimeSet_inter_setOf_inertiaDeg_eq_one` (existence form);
IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 (places of `Ω`, Frobenius elements).

[ShortProof], `Lib/GaloisRep/Main/Defs` (`New.FrobeniusDatum`, `New.mostFrobenii`, `New.mostFrobeniiAt`, `New.eventually_mostFrobenii`, `New.eventually_mostFrobenii_of_isOpenEmbedding`, `New.dense_of_mostFrobenii`)

### 1.3 Local conditions at a place of `Ω`

*Origin:* definitions and conventions.

*Method of the formal proof:* every condition is stated at a place `A` of `Ω`; above `ℓ` it is imposed along every
embedding of `Ω` into `ℚ̄_ℓ` inducing `A`, with the decomposition group read in `Gal(ℚ̄_ℓ/ℚ_ℓ)`. Of the Weil–Deligne
representation only the polynomials that kill Weil elements are recorded.

Let `r` be an `ℓ`-adic representation of `G_E` of rank `n` and `A` a place of `Ω`.
- A *local datum* at `A` is an embedding `e : Ω → ℚ̄_ℓ` under which the valuation ring of `ℚ̄_ℓ` pulls back to `A`,
  with an open embedding `j : D_A → Gal(ℚ̄_ℓ/ℚ_ℓ)` such that `j(g)(e(x)) = e(g(x))`, with image the automorphisms
  fixing `e(E)` pointwise, as in IdelicReciprocityCountsAndCyclotomicClassGroups §1.3 (a), (b); it exists only if `A`
  lies above `ℓ`. Along it `r|_{D_A}` is a representation of an open subgroup of `Gal(ℚ̄_ℓ/ℚ_ℓ)`.
- `r` is *good* at `A` if `r` is trivial on `I_A` when `A` does not lie above `ℓ`, and `r|_{D_A}` is crystalline along
  every local datum.
- `r` is *of finite type* at `A` if `r` is trivial on the elements of `I_A` near `1` when `A` does not lie above `ℓ`,
  and `r|_{D_A}` is potentially crystalline along every local datum.
- A polynomial `P ∈ ℚ̄_ℓ[X]` *kills* `s ∈ G_E` at `A` if `P(r(s)) = 0` when `A` does not lie above `ℓ`, and, for every
  local datum `(e, j)`, if `s ∈ D_A` then for every `k` such that `(j(s), k)` is a Weil pair, `r|_{D_A}` is potentially
  crystalline and `P` kills the linearised Frobenius of `(s, k)` on the periods.
- For multisets `J(σ)` of integers, one for each `σ : E → ℂ`, `r` *has the jumps* `J` at `A` if for every local datum
  `(e, j)` and every `g ∈ Gal(ℚ̄_ℓ/ℚ_ℓ)` the multiplicity of each `u` as a Hodge–Tate jump of `r|_{D_A}` at the
  embedding given by `g` equals its multiplicity in `J(ι⁻¹ ∘ g⁻¹ ∘ e|_E)`; *every member of `J` occurs* if each `u` with
  nonzero multiplicity in that `J(·)` is a jump. Both hold vacuously when `A` does not lie above `ℓ`.
- `r` is *spherical above* `w` with polynomial `P` and jumps `J` (exactly, or with every member occurring) if at every
  place `A` over `w`: `r` is good at `A`, has the jumps `J` (or every member occurs), and `P` kills every geometric
  Frobenius at `A` of norm `q_w`.

*Needs:* CrystallineRepresentationsAndKisinModules §3.1 (crystalline representations, jumps, linear Frobenius);
IdelicReciprocityCountsAndCyclotomicClassGroups §§1.1, 1.3 (places of `Ω`; embeddings into `ℚ̄_ℓ`).

[ShortProof], `Lib/GaloisRep/Main/LocalConditions` (`New.GaloisRep.PadicPlaceEmbedding`, `New.GaloisRep.IsGoodAt`, `New.GaloisRep.IsFiniteTypeAt`, `New.GaloisRep.PolyKillsAt`, `New.GaloisRep.JumpsRelAt`, `New.GaloisRep.HasJumpsAt`, `New.GaloisRep.OccursIn`, `New.GaloisRep.IsSphericalAbove`)

### 1.4 Local conditions pass to retracts

*Origin:* particular to this proof: the local conditions of 1.3 are inherited by a representation that is, on a
neighbourhood of `1` and up to an automorphism of `Ω`, a retract of another one; subrepresentations, restrictions to
open subgroups and conjugate fields are special cases.

*Method of the formal proof:* away from `ℓ` by the intertwining matrix and its left inverse; above `ℓ` by carrying each
local datum along the automorphism and using that potential crystallinity, killing polynomials and Hodge–Tate jumps
are compatible with injective equivariant maps.

Let `c` be an automorphism of `Ω`, `E′ ⊆ Ω` a number field and `φ : Gal(Ω/E′) → G_E` with `φ(g)(c(x)) = c(g(x))`. Let
`r` be an `ℓ`-adic representation of `G_E` of rank `n`, `r′` one of `Gal(Ω/E′)` of rank `n′`, `S` a neighbourhood of `1`,
and `P`, `P′` matrices with `P′P = 1` and `r′(g)P = Pr(φ(g))` for `g ∈ S`. Let `A` be a place of `Ω`. Then:
(a) if `φ` is an open embedding and `r′` is of finite type at `c⁻¹(A)`, then `r` is of finite type at `A`;
(b) if also `PP′ = 1`, `i : E → E′` satisfies `c(i(x)) = x` on `E`, and the jumps of `r′` at `c⁻¹(A)` are `J ∘ (· ∘ i)`
(exactly, or with every member occurring), then the jumps of `r` at `A` are `J` in the same sense;
(c) for `s ∈ S`, a polynomial that kills `s` for `r′` at `c⁻¹(A)` kills `φ(s)` for `r` at `A`.

*Needs:* 1.3; CrystallineRepresentationsAndKisinModules §§3.2, 3.4, 3.6, 3.7 (restriction, jumps, subobjects, killing
polynomials).

[ShortProof], `Lib/GaloisRep/Main/LocalConditions` (`New.GaloisRep.isFiniteTypeAt_of_retract`, `New.GaloisRep.jumpsRelAt_of_retract`, `New.GaloisRep.polyKillsAt_of_retract`, `New.GaloisRep.local_clauses_of_retract`)

### 1.5 Attached representations and spherical compatibility

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions are those of the formal proof; a representation on an open subgroup is
allowed through an open map, so that representations of open subgroups can be glued (6.4).

Let `P = (P_w)` be a system of complex polynomials indexed by the finite places of `E`.
- A representation `r : H → GL_n(ℚ̄_ℓ)` of a topological group `H`, with a map `j : H → G_E` (by default `H = G_E`,
  `j = id`), is *attached* to `P` if `r` is continuous and semisimple, `j` is open, and for every `η > 0`, for most
  Frobenius data `(w, A, s)` and every `x ∈ H` with `j(x) = s`, every coefficient of `det(X − r(x)) − ι(P_w)` has absolute
  value at most `η`.
- For a form `f` of weight `κ` on `U(n)`, `N ∈ ℕ`, a finite place `w` and a place `A` of `Ω`, `r` is *compatible with
  `f` at `A`* in rank `N` if `r` is good at `A`, has the jumps `J_κ` in rank `N` at `A`, and, when `w` is split and `f`
  has Hecke polynomial `Q` at `w`, `ι(Q)` kills every geometric Frobenius at `A` of norm `q_w`.
- `SphCompat(E, n, N, w)` is the statement: for every weight `κ`, every form `f` of weight `κ` on `U(n)` that is an
  eigenform for a system `P` (i) has an attached `r : G_E → GL_n(ℚ̄_ℓ)`; and (ii) if `f` is spherical at `w`, every `r`
  attached to `P` is compatible with `f` in rank `N` at every place of `Ω` over `w`. When `N = n` it is written
  `SphCompat(E, n, w)`.

*Needs:* 1.1, 1.2, 1.3.

[ShortProof], `Lib/GaloisRep/Main/AttachedRepresentations` (`New.GaloisRep.Attached`, `New.GaloisRep.IsCompatibleAt`, `New.GaloisRep.SphericalCompat`)

### 1.6 Characteristic polynomials of attached representations, and rank one

*Origin:* particular to this proof: an attached representation in the sense of 1.5 has its characteristic polynomials,
hence its traces, determined by the system; in rank one it is the avatar of an algebraic Hecke character read off the
form.

*Method of the formal proof:* the coefficients of the characteristic polynomial are continuous functions of the matrix,
`j` is open, and most Frobenii at a point form a proper filter (1.2 (d)); in rank one, the scalars `x/x̄` act on the
form through a character of the finite ideles, which is an algebraic Hecke character, and its avatar agrees with
`det r` at most Frobenius elements.

Let `r : H → GL_n(ℚ̄_ℓ)`, through `j`, be attached to `P`.
(a) For `x ∈ H` and every `i`, `ι(coeff_i P_w)` tends to `coeff_i det(X − r(x))` along most Frobenii at `j(x)`.
(b) If `σ : H′ → GL_n(ℚ̄_ℓ)`, through `j′`, is also attached to `P`, then `tr r(x) = tr σ(y)` whenever `j(x) = j′(y)`;
indeed `det(X − r(x)) = det(X − σ(y))` there, since by (a) the coefficients of both are limits of those of `ι(P_w)`
along most Frobenii at `j(x)`, a proper filter (1.2 (d)).
(c) Let `n = 1`, let `f` be a form on `U(1)` whose weight is the integer `κ_v` (a power of the determinant) at each
infinite place `v`, an eigenform for `P`, and `r : G_E → GL_1(ℚ̄_ℓ)` attached to `P`. Then there is an algebraic Hecke
character `θ` of `E` whose infinity type is `κ_v` at `Φ_v` and `−κ_v` at the other embedding over `v` (infinity types as in
IdelicReciprocityCountsAndCyclotomicClassGroups §7.5: `θ(x) = Π_σ σ(x)^{−m(σ)}` for `x ∈ E^×` read as a finite idele, `m`
the infinity type), with
`θ(x) = c` for `x ∈ E_w^×` at a split `w` whenever right translation by `ι_w` of the scalar `x` multiplies `f` by `c`, and
`θ(ϖ) = −P_w(0)` for uniformisers `ϖ` at split `w` where `f` has Hecke polynomial `P_w`; and `det r` is the `ℓ`-adic
avatar of `θ`.

*Needs:* 1.2, 1.5; IdelicReciprocityCountsAndCyclotomicClassGroups §§7.5, 9.1 (algebraic Hecke characters; `ℓ`-adic
avatars).

[ShortProof], `Lib/GaloisRep/Main/AttachedRepresentations` (`New.GaloisRep.Attached.tendsto_charpoly_coeff`, `New.GaloisRep.Attached.trace_eq`, `New.IsRankOneCharacter`, `New.HasHeckePolyAt.rightRegular_ofSplitPlace_scalar`, `New.GaloisRep.Attached.exists_det_eq_avatar`)

## Layer 2: Semisimple representations, lattices, pseudocharacters and limits of traces

Semisimplicity is non-degeneracy of the trace form on the span of the image, over an algebraically closed field of
characteristic `0`. This layer gives the conjugacy, continuity and cancellation statements, lattices, a weak form of the
pseudocharacter theorem, and the passage of traces to the limit that the weight congruences of Layer 3 require.

### 2.1 Semisimple representations: conjugacy, continuity, twists and cancellation

*Origin:* adapted from the published theory of semisimple representations in characteristic zero (Wedderburn–Artin,
Clifford, Brauer–Nesbitt): here semisimplicity is non-degeneracy of the trace form, and the cancellation of two
families of characters with no common member is added.

*Method of the formal proof:* the Wedderburn–Artin theorem for maps whose span is semiprime writes the representation
through a product of matrix algebras; Clifford's theorem handles a normal subgroup; an intertwiner is built from the
matrix units; continuity follows because the entries of `r(g)` are linear functionals of the traces of `r(gh)`; for
cancellation, the virtual character takes natural values on the primitive idempotents of a common Wedderburn
decomposition, so it is a character.

Let `k` be an algebraically closed field of characteristic `0`, `G` a group, and `r : G → GL_n(k)` semisimple.
(a) For a homomorphism `f : H → G` with normal image, `r ∘ f` is semisimple.
(b) Let `ρ : G → B^×` take values in a finite-dimensional `k`-algebra, with semiprime span (no `x ≠ 0` in the span of
`ρ(G)` has `xρ(g)x = 0` for all `g`), and `φ : B → M_n(k)` an algebra map with `tr r(g) = tr φ(ρ(g))` for all `g`. Then
some `Q ∈ GL_n(k)` has `r(g)Q = Qφ(ρ(g))` for all `g`. A semisimple representation has semiprime span, so two semisimple
representations with equal traces are conjugate.
(c) If `k` carries a ring topology, `G` is a topological group and `g ↦ tr r(g)` is continuous, then `r` is continuous.
(d) For a character `ψ : G → k^×`, `ψ ⊗ r` is semisimple.
(e) Let `r_0, r_1 : G → GL_{n+t}(k)` be semisimple and `ψ_{i,1}, …, ψ_{i,t} : G → k^×` characters (`i = 0, 1`) with
`ψ_{0,l} ≠ ψ_{1,l′}` for all `l, l′`. If `tr r_i − Σ_l ψ_{i,l}` is the same function `T` for `i = 0, 1`, then `T = tr s`
for a semisimple `s : G → GL_n(k)`.

The library has the uniqueness half of (b) for semisimple representations in Mathlib's sense, over any field of
characteristic `0`: `Representation.nonempty_equiv_of_character_eq_of_isSemisimpleRepresentation`; using it needs the
equivalence of semisimplicity with the non-degeneracy of the trace form.

*Needs:* none.

[ShortProof], `Lib/GaloisRep/Pseudocharacter/SemisimpleRepresentations` (`New.HasSemiprimeSpan`, `New.exists_wedderburn`, `New.IsTraceNondeg.comp`, `New.IsTraceNondeg.hasSemiprimeSpan`, `New.IsTraceNondeg.exists_conj_of_trace_eq`, `New.IsTraceNondeg.continuous_of_trace`, `New.IsTraceNondeg.twist`, `New.IsTraceNondeg.exists_cancel_chars`)

### 2.2 Stable lattices and spanning families

*Origin:* adapted from the published theory of lattices in `ℓ`-adic representations of compact groups (for this section
and 2.3 together, `[ShortProof]` names Taylor, *Galois representations associated to Siegel modular forms of low
weight* (1991), Rouquier, *Caractérisation des caractères et pseudo-caractères* (1996), and K. Conrad's note *Compact
subgroups of GL_n(Q̄_p)*): here with a descent to every large enough ring of coefficients, and with uniqueness up to
scalars under the hypothesis that the lattice spans the matrix algebra.

*Method of the formal proof:* (a) Auerbach's lemma conjugates `r` to a bounded representation; by Baire's theorem its
entries lie in one finite extension on a nonempty open set, and finitely many translates cover `G`. (b) matrix units.
(c) the products `(a⁻¹)_{ij}·a_{kl}` are all integral, so scaling `a` by the inverse of an entry of maximal absolute
value lands in `GL_n(O)`. (d) modulo
the maximal ideal `R(γ)` has the eigenvectors `φ^j v` with distinct eigenvalues; a Vandermonde argument and Nakayama's
lemma.

Coefficient rings are the rings of integers `O` of finite Galois extensions of `ℚ_ℓ` inside `ℚ̄_ℓ`, directed by
inclusion; an `O`-valued `u : G → M_n(O)` is a *lattice in* `R : G → GL_n(ℚ̄_ℓ)` if `Q⁻¹R(g)Q = u(g)` for one
`Q ∈ GL_n(ℚ̄_ℓ)` and all `g`.
(a) If `G` is a compact group and `R` is continuous, then for every coefficient ring containing a suitable fixed one,
`R` has a lattice with values in it.
(b) If matrices `T(g) ∈ M_n(O)` over a commutative ring `O` span `M_n(O)`, then for every ring map `f : O → k` to a
field the only subspaces of `kⁿ` stable under every `f(T(g))` are `0` and `kⁿ`.
(c) If `T(g), T′(g) ∈ M_n(O)`, `O` a coefficient ring, the `T(g)` span `M_n(O)`, and `a ∈ GL_n(ℚ̄_ℓ)` has
`a⁻¹T(g)a = T′(g)` for all `g`, then `a = α·k` with `α ∈ ℚ̄_ℓ^×` and `k ∈ GL_n(O)`.
(d) Let `u` be a lattice in `R` over `O`, `γ, φ ∈ G` and `q ∈ ℕ` with `R(γ)^q = R(φ⁻¹γφ)` and `R(γ^{q^n}) = R(γ)`, and let
`ζ ∈ O` be a root of the characteristic polynomial of `R(γ)` with `|ζ^{q^i} − ζ^{q^j}| = 1` for `0 ≤ i ≠ j < n`. Then the
`u(g)` span `M_n(O)` and `u(φ^{−n})` is a scalar matrix.

The library has stable lattices for a continuous representation of a compact group over one valued field,
`Representation.exists_stable_lattice`, without the descent of the coefficients in (a).

*Needs:* none.

[ShortProof], `Lib/GaloisRep/Pseudocharacter/SemisimpleRepresentations` (`New.Selmer.IsLatticeIn`, `New.Selmer.IsLatticeIn.charpoly_eq_map`, `New.eventually_exists_isLatticeIn`), with `Lib/GaloisRep/Pseudocharacter/Pseudorepresentations` (`New.Selmer.eq_bot_or_eq_top_of_span_eq_top`, `New.Selmer.exists_eq_smul_of_conj_eq`, `New.Selmer.IsLatticeIn.span_range_eq_top_of_map_pow_eq_map_conj`)

### 2.3 A function obeying every trace identity is a trace

*Origin:* adapted from the theory of pseudocharacters (Taylor, *Galois representations associated to Siegel modular
forms of low weight* (1991), Theorem 1; Rouquier, *Caractérisation des caractères et pseudo-caractères* (1996)): the
hypothesis here is the whole set of polynomial relations satisfied by the traces of `n`-dimensional representations,
which is stronger than the pseudocharacter relations and lets the reconstruction proceed without invariant theory.

*Method of the formal proof:* extend `T` linearly to the group algebra `k[G]` and divide by the kernel of the pairing
`(x, y) ↦ T(xy)`; trace identities show that the quotient is finite-dimensional and semiprime and that `T` takes
natural values at most `n` on its idempotents (a Newton polynomial of degree `n + 1` vanishes on traces); the
Wedderburn decomposition then gives the representation (2.1).

Let `k` be an algebraically closed field of characteristic `0`, `G` a group and `n ≥ 0`. Let `T : G → k` be such that
every polynomial `B` in variables indexed by `G` that vanishes at `(tr x(g))_{g∈G}` for every homomorphism
`x : G → GL_n(k)` also vanishes at `(T(g))_{g∈G}`. Then `T = tr r` for a semisimple `r : G → GL_n(k)`.

The hypothesis implies the pseudocharacter identities of dimension `n`, so the semisimple reconstruction of
`IntegralHeckeAndGaloisDeterminants §1.2`, with the identification of determinants and pseudocharacters over
`ℚ`-algebras of its §0.5, also gives the statement.

*Needs:* 2.1.

[ShortProof], `Lib/GaloisRep/Pseudocharacter/Pseudorepresentations` (`New.exists_rep_of_trace_identities`, `New.newtonPoly`, `New.eval_newtonPoly`), with `Lib/GaloisRep/Pseudocharacter/SemisimpleRepresentations` (`New.exists_rep_of_trace`)

### 2.4 Limits of traces

*Origin:* particular to this proof: the uniform approximation of one Hecke eigensystem by linear combinations of
others, encoded as a closed monoid of pairs of eigenvalues, and the statement that a limit of traces of continuous
representations in this sense is the trace of a continuous semisimple representation.

*Method of the formal proof:* (a) normalise `f` at a point where it is nonzero and take, for each `η`, a combination of
members of `S` within `η` of it; the pairs of eigenvalues of operators that do not increase the sup norm then form a
monoid on which the combinations converge uniformly. (b) along each `F_g` the first components are Cauchy; their limit
`T` is continuous and obeys every trace identity, because the uniform approximation passes to polynomial expressions;
2.3 and 2.1 (c) conclude.

Let `K` be a normed field. For `s : (0, ∞) → ℕ` write `I = {(η, i) : η > 0, i < s(η)}`. A submonoid `N` of `K × K^I`
(componentwise product) is *approximating* for coefficients `c_{η,i} ∈ K` if it is closed and
`Σ_{i<s(η)} c_{η,i}φ(η, i) → t` as `η → 0`, uniformly over `(t, φ) ∈ N`.
(a) Let `S` be a set of functions `X → K` and `f ≠ 0` in the closure, for uniform convergence, of the span of `S`. There
are `s`, coefficients `c`, an approximating `N` and `y : I → S` such that: whenever a `K`-linear operator `T` on functions
`X → K` that does not increase the sup norm has `Tf = tf` and `Ty(η, i) = φ(η, i)y(η, i)` for all `(η, i)`, then
`(t, φ) ∈ N`. Moreover the approximation passes to polynomials: for a polynomial `B` and elements `f_p(x)` of `N`,
`Σ_i c_{η,i}B((f_p(x))_{(η,i)})` tends to `B((first components of f_p(x)))`, uniformly in `p`.
(b) Let `K` be algebraically closed of characteristic `0`, `G` a topological group, `N` approximating, and continuous
`r_x : G → GL_n(K)` for `x ∈ I`. Suppose that for every `g ∈ G` a proper filter `F_g` on `N` has the first component
eventually in a complete set `L ⊆ K`, and the component `x` tending to `tr r_x(g)` for every `x`. Then there is a
continuous semisimple `R : G → GL_n(K)` with `(tr R(g), (tr r_x(g))_x) ∈ N` for every `g`.

*Needs:* 2.1, 2.3.

[ShortProof], `Lib/GaloisRep/Pseudocharacter/Pseudorepresentations` (`New.uniformClosure`, `New.IsApproximatingMonoid`, `New.exists_isApproximatingMonoid_of_mem_uniformClosure`, `New.IsApproximatingMonoid.tendstoUniformly_eval`, `New.GaloisRep.exists_continuous_isTraceNondeg_of_tendsto_trace`)

## Layer 3: Congruences that change the weight

The `ℓ`-adic model of a form is approximated uniformly by combinations of models of forms that have a prescribed
character on a level and free weights at chosen infinite places (3.3). This is a density statement, obtained from an
ultrametric Stone–Weierstrass theorem (3.1) applied to matrix coefficients of free weights (3.2); it is not derived from
congruences modulo powers of `ℓ` or from completed cohomology.

### 3.1 The ultrametric Stone–Weierstrass theorem for modules

*Origin:* adapted from the non-archimedean Stone–Weierstrass theorem (Dieudonné (1944); Kaplansky, *The Weierstrass
theorem in fields with valuations* (1950)), in its form for modules (Prolla, *Approximation of Vector Valued Functions*
(1977), and *Topics in Functional Analysis over Valued Division Rings* (1982)): here for a module of continuous
functions and its ring of multipliers, over an ultrametric field that need not be complete.

*Method of the formal proof:* if `φ` stays at distance more than `ε` from `N`, a maximal ideal of the ring of bounded
multipliers cuts out a set on which all multipliers are constant; some `d ∈ N` agrees with `φ` there, and a multiplier
outside that ideal makes `φ − d` small everywhere.

Let `X` be a nonempty compact space, `k` a field with an ultrametric absolute value, `N` a `k`-submodule of `C(X, k)` and
`φ ∈ C(X, k)`. Let `M = {u ∈ C(X, k) : uN ⊆ N}` be the multipliers of `N`. If for every `a ∈ X` some `d ∈ N` agrees with
`φ` at every `x` with `u(x) = u(a)` for all `u ∈ M`, then for every `ε > 0` some `g ∈ N` has `sup_X |φ − g| ≤ ε`.

Mathlib's Stone–Weierstrass theorem is for real and `RCLike` scalars and subalgebras only; the library's density of
locally constant functions is a special consequence.

*Needs:* none.

[ShortProof], `Lib/GaloisRep/WeightCongruence` (`New.stoneWeierstrass_ultrametric`)

### 3.2 Matrix coefficients of free weights are dense

*Origin:* particular to this proof: among continuous `ℓ`-adic functions that factor through a family of general linear
groups over one finite extension of `ℚ_ℓ`, the matrix coefficients of polynomial representations of free weight are
uniformly dense.

*Method of the formal proof:* semi-invariant polynomials evaluated at `z(γ)y`, for a fixed triangular `y` with entries
linearly independent over the finite extension, span a module of matrix coefficients of free weights; the first-column
entries are multipliers of it and determine `z(γ)`, so 3.1 applies. Free weights exist in abundance (lacunary and
rapidly decreasing sequences are free).

Let `k ⊇ ℚ_ℓ` be an algebraically closed field with an ultrametric absolute value extending that of `ℚ_ℓ`, `X` a compact
space, `Φ` a finite set and `z : X → Π_{τ∈Φ} GL_N(k)` continuous with all entries in one finite extension `L ⊆ k` of `ℚ_ℓ`.
Then every continuous `φ : X → k` that factors through `z` is a uniform limit of finite sums of functions
`γ ↦ βᵀρ(z(γ))ξ`, where `ρ = ⊗_{τ∈Φ} ρ_τ`, each `ρ_τ` the irreducible polynomial representation of `GL_N` of some free
dominant weight times a power of the determinant, and `β, ξ` are vectors.

*Needs:* 3.1; IntegralRepresentationsOfGeneralLinearGroups §§1.1, 1.2, 1.3 (polynomial model, minor bases, Schur
matrices).

[ShortProof], `Lib/GaloisRep/WeightCongruence` (`New.mem_uniformClosure_weylRep_coeff`, `New.hasNoSmallRelations_of_lacunary`, `New.hasNoSmallRelations_of_rapid_decrease`)

### 3.3 `ℓ`-adic models of forms: a Hecke contraction, and density of free weights of a given type

*Origin:* adapted from the density of algebraic vectors and congruences between algebraic automorphic forms of
different weights (Emerton and Paškūnas, *On the density of supercuspidal points of fixed regular weight* (2020);
Fintzen and Shin, *Congruences of algebraic automorphic forms and supercuspidal representations* (2021)): here on
definite unitary groups of any rank, with a character on a fixed level kept throughout, and with only weights that are
free at a chosen set `T` of infinite places used in the approximation.

*Method of the formal proof:* (a) the coset representatives of `T_{w,j}` act on the model through matrices whose
entries are bounded; dividing by the entry of largest norm gives a norm-contracting operator. (b) on each double coset
the model of `f` is a fixed matrix times a vector depending only on the components over `T`; summing over rational
elements expresses the model by bounded operators applied to such vectors, which are limits of matrix coefficients of
free weights (3.2), and the operators carry these to models of forms of type `θ`.

For each infinite place `v` let `z_v : G_f(N) → GL_N(ℚ̄_ℓ)` be the component at the place above `ℓ` induced by the
embedding `x ↦ ι(Φ_v(x̄))`, read in `ℚ̄_ℓ`. For weights `κ, κ′` and a matrix `M`, the *`ℓ`-adic model* of a form `f` of
weight `κ′` is `F(g) = M ρ_{κ′}(z(g))⁻¹ ι(f(g))`, a function on `G_f(N)` with values in the coordinates of `V_κ`.
(a) For every split `w` and `j ≥ 0` there are `a ∈ ℚ̄_ℓ^×`, with `a = −1` if `w` does not lie above `ℓ`, and a linear
operator on `ℚ̄_ℓ`-valued functions that does not increase the sup norm and multiplies the model `F` (for any `κ′`, `M`
intertwining `ρ_κ ∘ z` and `ρ_{κ′} ∘ z` on `ι_w(GL_N(E_w))`) of every `f` having Hecke polynomial `P` at `w` by
`a·ι(coeff_j P)`.
(b) Let `K ≤ K₀` be open, `θ` a character of `K` trivial near `1`, `T` a set of infinite places, and `f` a form of weight
`κ` fixed by every `d ∈ K` with `z_v(d) = 1` for `v ∈ T`, with `θ(d) = 1` for these `d`. Let `D` be a set of
`ℚ̄_ℓ`-valued functions whose span contains the model (for `M` intertwining `ρ_ν ∘ z` and `ρ_κ ∘ z` on the elements with
`z_v = 1` for `v ∈ T`) of every form `φ` of weight `ν` with `φ(gk) = θ(k)φ(g)` for `k ∈ K`, for every weight `ν` equal to
`κ` off `T` and free at every `v ∈ T`. Then the model of `f` (with `κ′ = κ`, `M = 1`) lies in the uniform closure of the
span of `D`.

*Needs:* 1.1, 3.1, 3.2; AdelicUnitaryGroupsAndAlgebraicModularForms §§6.1, 6.6 (forms of a level; `ℓ`-adic gauges).

[ShortProof], `Lib/GaloisRep/WeightCongruence` (`New.padicComponents`, `New.padicModel`, `New.comp_weightRep_eq_weylRep_mulVec`, `New.GaloisRep.exists_padicModel_hecke_contraction`, `New.padicModel_mem_uniformClosure`, `New.InducesPlacePair`)

## Layer 4: Rank, types and the Hodge–Tate cocharacter

The representations that the cohomology of PEL models provides have unknown rank. They are cut down to rank `n` by a
criterion that uses `n` free Hodge–Tate weights at one place above `ℓ` and the Hodge–Tate cocharacter, after the
representations for the several complex embeddings have been combined into one multiplicity-free representation.

### 4.1 Free weights force the rank and identify the characteristic polynomials

*Origin:* adapted from the published results that read the characteristic polynomials of a Galois representation off
polynomial relations satisfied by its Frobenius elements (Boston, Lenstra and Ribet (1991); Nekovář, *Eichler–Shimura
relations and semisimplicity* (2018); Fayad and Nekovář (2019); Harris and Taylor, *The geometry and cohomology of some
simple Shimura varieties* (2001), VII.1.8): here a representation of any rank, killed at most Frobenius elements by
monic polynomials of degree `n`, whose image spans the diagonal matrices and whose Zariski closure near `1` contains a
torus with `n` free exponents, has rank `n`, and the polynomials are its characteristic polynomials.

*Method of the formal proof:* linear dependence of the first powers of a matrix is a Zariski-closed condition on its
entries (vanishing of minors). It passes from the Frobenius elements, which are dense (1.2 (d)), to a neighbourhood of
`1`, and by the torus hypothesis to the torus; there, comparing the coefficients of the powers of `T`, the freeness of
the `e_i`, with the hypothesis on diagonal matrices (which excludes a repeated exponent), gives `N = n`. Since no
factor of the characteristic polynomial of degree below `n` kills `r(s)` at most Frobenius data, the monic `P_v` of
degree `n` is the characteristic polynomial.

Let `E` be a number field inside `Ω`, `K ⊆ k` normed fields, and `r : G_E → GL_N(K)` continuous with every diagonal matrix
in the `K`-span of `r(G_E)`. Suppose that for most Frobenius data `v` a monic `P_v ∈ K[X]` of degree `n ≥ 1` has
`P_v(r(s_v)) = 0`. Suppose that for some `Q ∈ GL_N(k)` and integers `κ_1, …, κ_N`, every polynomial in the matrix entries
that vanishes at `Q·r(g)` for all `g` near `1` vanishes at `diag(T^{κ_1}, …, T^{κ_N})·Q` over `k[T, T⁻¹]`, and that `n` free
integers `e_1, …, e_n` occur among the `κ_j`. Then `N = n`, and `P_v` is the characteristic polynomial of `r(s_v)` for most
Frobenius data `v`.

*Needs:* 1.2.

[ShortProof], `Lib/GaloisRep/KillingPolynomials` (`New.powMinor`, `New.exists_factor_charpoly`, `New.HasNoSmallRelations.inv_scalar_on_blocks`, `New.card_eq_and_charpoly_eq`)

### 4.2 The Hodge–Tate cocharacter in coordinates

*Origin:* adapted from the theorem that the Hodge–Tate cocharacter lies in the algebraic monodromy group (Serre,
*Groupes algébriques associés aux modules de Hodge–Tate* (1979), §1; Sen (1973)): here for finitely many coordinates
`x_i ∈ ℂ_p`, as the statement that a polynomial relation satisfied by `(χ(g)^{−κ_i}·g(x_i))_i` for all `g` near `1` is
also satisfied by `(T^{κ_i}x_i)_i`, `T` an indeterminate.

*Method of the formal proof:* the coefficient vectors of polynomials that vanish at the twisted translates form a space
stable under the twisted Galois action; by the Hodge–Tate decomposition of such stable spaces it suffices to treat
vectors of pure weight, for which the torus acts by a single power of `T`.

Let `p` be a prime, `χ` the `p`-adic cyclotomic character of `Gal(ℚ̄_p/ℚ_p)`, `x_i ∈ ℂ_p` and `κ_i ∈ ℤ` for `i` in a finite
set, and `F` a polynomial over `ℂ_p` in variables indexed by `i`. If `F((χ(g)^{−κ_i}·g(x_i))_i) = 0` for every
`g ∈ Gal(ℚ̄_p/ℚ_p)` near `1`, then `F((T^{κ_i}x_i)_i) = 0` in `ℂ_p[T, T⁻¹]`.

`PadicHodgeTheory §4.4` uses Sen's theorem relating the Sen operator of a representation to the Lie algebra of the image
of inertia (the operator lies in the `ℂ_p`-span of that Lie algebra, which is the least subspace with this property);
that is the corresponding statement for representations, and the passage from it to arbitrary points of `ℂ_p^n` is not
part of that section.

*Needs:* CrystallineRepresentationsAndKisinModules §1.6 (b) (Hodge–Tate elimination).

[ShortProof], `Lib/GaloisRep/Main/CuspidalTypes` (`New.Period.aeval_cocharacter_eq_zero`)

### 4.3 Cuspidal types and principal levels

*Origin:* particular to this proof: a character of the first congruence subgroup that is nontrivial on every unipotent
radical, and principal congruence levels inside a given open subgroup with prescribed prime divisors.

*Method of the formal proof:* (a) is explicit: `θ(k) = exp(2πi·u(tr(b(k − 1))))`, where the reduction of the integral
matrix `b` modulo `w` has irreducible characteristic polynomial and `u` is an additive character of `E_w/ϖ_w²𝒪_w` with
`u(ϖ_w) ≠ 0`; (b) follows from the compactness of the image of `K₀ ∖ H` in the product of the components at the places
of `B`.

Let `w` be a finite place, `N ≥ 1`, and `K¹ = 1 + ϖ_wM_N(𝒪_w)`. A character `θ` of `K¹` is a *cuspidal type*, as in
AbelianSchemesWithThetaStructuresAndTheirCohomology §9.2, if for every idempotent matrix `ε ≠ 0, 1` it is nontrivial on
`K¹ ∩ (1 + εM_N(E_w)(1 − ε))`.
(a) Some cuspidal type of `K¹` is trivial on `1 + ϖ_w²M_N(𝒪_w)`.
(b) Let `H ≤ G_f(n)` be open, containing the elements of `K₀` with component `1` at every place of a finite set `S`, and
let `B` be a finite set of places containing `w` or `w̄` for every `w ∈ S`. For every `N₀ ∈ 𝒪_E` there is `𝔑 ∈ 𝒪_E` with
`N₀ | 𝔑`, lying in exactly the primes that contain `N₀` or belong to `B`, such that `u ∈ H` whenever `(uᵀ)⁻¹` is a
similitude in `GL_n(Ô)` congruent to `1` modulo `𝔑` (an element of the principal level `K(𝔑)` of
AbelianSchemesWithThetaStructuresAndTheirCohomology §3.1).

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 (`K₀` and levels);
AbelianSchemesWithThetaStructuresAndTheirCohomology §§3.1, 9.2 (principal levels `K(𝔑)`; cuspidal types).

[ShortProof], `Lib/GaloisRep/Main/CuspidalTypes` (`New.Variety.exists_isCuspidalType`, `New.Variety.exists_levelGU_invTransposeGL_le`), with the definition of a cuspidal type in `Lib/Shimura/HeckeTower/HeckeData` (`New.Variety.IsCuspidalType`)

### 4.4 Multiplicity-free sums with prescribed jumps

*Origin:* particular to this proof: representations, one for each complex embedding, each with prescribed Hodge–Tate
jumps at its own embedding, combine into one representation whose image spans the diagonal matrices and which has all
the prescribed jumps.

*Method of the formal proof:* 2.4 (b), applied to a constant family, gives a semisimple representation whose trace is
that of the direct sum of the `ρ_τ`, and CrystallineRepresentationsAndKisinModules §6.4 gives it the local conditions;
keeping one copy of each isomorphism class of irreducible summand gives a retract of it (1.4) that keeps all the
prescribed jumps.

Let `F` be a filter on the finite places of `E`, `J(τ)` a multiset of integers for each `τ : E → ℂ`, and `P_w ∈ ℚ̄_ℓ[X]`.
Suppose that for each `τ` some continuous `ℓ`-adic representation `ρ_τ`, of any rank, is at `F`-almost all `w` spherical
above `w` with polynomial `P_w`, every member of `J(τ)` occurring among its jumps at `τ` and no condition at the other
embeddings. Then for some `b` there is a continuous `r : G_E → GL_b(ℚ̄_ℓ)` such that (a) every diagonal matrix lies in
the span of `r(G_E)`, and (b) at `F`-almost all `w`, `r` is spherical above `w` with polynomial `P_w`, every member of
`J(σ)` occurring among its jumps at every `σ`.

*Needs:* 1.3, 1.4, 2.1, 2.4; CrystallineRepresentationsAndKisinModules §6.4 (local clauses at trace limits).

[ShortProof], `Lib/GaloisRep/Main/CuspidalTypes` (`New.GaloisRep.exists_continuous_isTraceNondeg_trace_eq_sum`, `New.GaloisRep.jump_eq_zero_of_jump_eq_zero_of_trace_eq_one`, `New.GaloisRep.exists_rep_span_diagonal`)

### 4.5 One representation of rank `a` from one for each embedding

*Origin:* particular to this proof: if the Hecke polynomials kill Frobenius on representations, one for each complex
embedding, with the jumps of the weight occurring at that embedding, and the jumps at one embedding inducing a place
above `ℓ` are free, then one representation of rank `a` has these polynomials as characteristic polynomials.

*Method of the formal proof:* combine by 4.4; at the place of the free embedding the representation is crystalline, and
a Hodge–Tate frame puts the cocharacter with the free weights into the Zariski closure of the image near `1` (4.2);
4.1 then gives the rank and the characteristic polynomials, and the jumps become exact.

Let `κ` be a weight in rank `a ≥ 1` and `P_w ∈ ℚ̄_ℓ[X]` such that, for most Frobenius data `(w, A, s)`, `w` does not lie
above `ℓ` and `P_w` is monic of degree `a`. Let `ε : Ω → ℚ̄_ℓ` be an embedding, `v` the place of `E` it induces, and suppose
the jumps `J_κ(ι⁻¹ ∘ ε|_E)` are free. Let `F` be a filter on the finite places such that `v` belongs to every member of `F`.
Suppose that for every `τ : E → ℂ` some continuous `ℓ`-adic representation is, at the places of most Frobenius data and at
`F`-almost all places, spherical above the place with polynomial `P_w`, every member of `J_κ(τ)` occurring among its jumps
at `τ`. Then
some continuous `r : G_E → GL_a(ℚ̄_ℓ)` has `det(X − r(s)) = P_w` for most Frobenius data `(w, A, s)` and is, at `F`-almost
all `w`, spherical above `w` with polynomial `P_w` and exactly the jumps `J_κ`.

*Needs:* 1.2, 1.3, 4.1, 4.2, 4.4; CrystallineRepresentationsAndKisinModules §3.3 (Hodge–Tate frames).

[ShortProof], `Lib/GaloisRep/Main/SeedRepresentation` (`New.GaloisRep.exists_galRep_charpoly_eq_of_forall_embedding`, with the step `card_eq_and_eventually_charpoly_eq_of_hasNoSmallRelations`)

## Layer 5: Base change of prime degree between definite unitary groups

Base change goes from the definite unitary group over `E` to the definite unitary group over a cyclic extension `E′`
of prime degree, not to `GL_n`. It rests on a twisted trace identity for the two definite groups, in which matching of
test functions is checked directly through roots of norms inside the algebra generated by an element, without
stabilisation. Hilbert 90 in several forms supplies the local and global descent.

### 5.1 Steps, twisted norms, tame actions, matching pairs and weak base change

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions avoid orbital integrals and stabilisation: an element of twisted norm
`γ` is produced as `z(γ)z(γ)^{*−1}`, inside the algebra generated by `γ`, from a polynomial `z` attached to the
characteristic polynomial of `γ`, and matching compares `f` at `γ` with `φ` at such elements; an idempotent finite
adele `u` records the places at which this is required.

- A *step* `E′/E` with character `μ`: `E` is a CM field containing a primitive `5040`-th root of unity, `E′` is a CM field
  Galois over `E` of prime degree `p`, some integer of `E′` has trace `1` to `E`, and `μ` is a character of the finite
  ideles of `E` with open kernel, trivial on `E^×`, such that `μ(zz̄) = 1` exactly when `z ∈ E^×·N_{E′/E}(𝔸_{E′,f}^×)`.
  `E′` carries a CM type restricting to that of `E`, and a weight `κ` of `E` gives the weight `κ_{E′}` of `E′` with, at
  each infinite place, the data of `κ` at the place below.
- A finite place `w` of `E` is *matched* if `μ` is trivial on `E_w^×` and every place `u | w` of `E′` has `q_u = q_w` and is
  moved by every `σ ≠ 1` in `Gal(E′/E)`; it is *step-unramified* if every `u | w` has inertia group in `Gal(E′/E)` not the
  whole group and `μ ∘ N` trivial on the units of `E′_u`.
- `bc : G_f(n)_E → G_f(n)_{E′}` is the map induced by the inclusion of finite adeles; `Gal(E′/E)` acts on `G_f(n)_{E′}`
  entrywise.
- For a map `τ` of a monoid, the *twisted norm* of length `p` is `N_τ(δ) = δ·τ(δ)⋯τ^{p−1}(δ)`.
- A ring endomorphism `σ` of a commutative ring `R` is *tame at level* `m ∈ R`, with exponent `p`, if `σ(m) = m`, some `e`
  has `Σ_{i<p} σ^i(e) ≡ 1 mod m`, `σ^p = 1` with `p > 0`, and for `0 < i < p` every prime ideal modulo which `σ^i` is the
  identity contains `m`.
- `R` is *profinite* (in the sense of the formal proof) if every sequence `(x_N)` in `R` has exactly one `L` such that for
  every `M ≠ 0` in `ℕ`, `M` divides `x_N − L` for all `N` in a set of a fixed non-principal ultrafilter on `ℕ`. The ring
  `Ô` is profinite. This stands in for "`R` is the inverse limit of the `R/MR`", which is not used.
- Let `R` be a commutative ring with involution `*`, `σ` an endomorphism commuting with `*`, `u ∈ R` (in use the
  idempotent of a set of places), `D ≤ R^×` and `P ∈ R[X]`. A polynomial `z ∈ R[X]` is a *norm root* for `P` (with `u`, `D`)
  if `(1 − u)z = (1 − u)`, and for every unitary `γ` with characteristic polynomial `P`: `det z(A) ∈ D` for every square
  matrix `A` with `P(A) = 0`, and `(1 + u(γ − 1))·(N z)(γ)ᴴ = (N z)(γ)` with `N z` the twisted norm of `z` under `σ` on
  coefficients. A matrix `a` is a *root quotient* of `z` at `γ` if `a·z(γ)ᴴ = z(γ)`.
- For `j : A → U(n)(R)`, a subgroup `K` and functions `f` on `A`, `φ` on `U(n)(R)`: `(f, φ)` is a *matching pair* if `φ` is
  invariant under `δ ↦ k⁻¹δσ(k)` for `k ∈ K`, and every `σ`-fixed characteristic polynomial `P` of some `j(g)` with
  `f(g) ≠ 0`, or of some `N_σ(δ)` with `φ(δ) ≠ 0`, has a norm root `z` such that for all unitary `γ` with characteristic
  polynomial `P` and every unitary root quotient `a` of `uz` at `γ`: `f(g) = φ(a)` whenever `j(g) = γ = N_σ(a)`, and
  `a⁻¹δ ∈ K` whenever `N_σ(δ) = γ` and `φ(δ) ≠ 0`. *Matching above* a set `Z` of places of `E` means: with `R = 𝔸_{E′,f}`,
  `u` the idempotent of the places of `E′` above `Z ∪ Z̄`, `D` the ideles `y` with `μ(N(y)) = 1`, and `j = bc`.
- *The cocycles of `K` split above `Z`* if every `s ∈ K` with `N_σ(s) = 1` has `t ∈ K`, equal to `1` off the places above
  `Z ∪ Z̄`, with `s = t·σ(t)⁻¹` at those places.
- For a representation `π` of a group `G`, a subgroup `L` and `F : G → ℂ` right `L`-invariant and supported on finitely many
  cosets, the *operator of* `F` is `Σ_{g∈G/L} F(g)π(g)` on the `L`-fixed vectors.
- `f′` on `G_f(n)_{E′}` is a *weak base change* of `f` on `G_f(n)_E` off a finite set `Z` if for every `w ∉ Z ∪ Z̄` and every
  `u | w`: if `w` is step-unramified and `f` spherical at `w` then `f′` is spherical at `u`; and if `w` is matched and split
  and `f` has Hecke polynomial `P` at `w`, then `u` is split and `f′` has Hecke polynomial `P` at `u`.
- A group `A` with `a : A → G_f(n)` and `r : G_f(n) → A` is a *retract at* a set `S` of places if `a(A)` lies in the
  elements supported on `S ∪ S̄`, `r ∘ a = id`, and the kernel of `r` is the elements with component `1` at `S`.
  *Matching local data* above a finite `Z` are retracts `(A, a, r)` at `Z` and `(A′, a′, r′)` at the places above `Z`,
  subgroups `L ≤ A`, `L′ ≤ A′` and functions `F_j` on `A`, `F′_j` on `A′` bi-invariant under them, with some `σ ≠ 1`
  stabilising `r′⁻¹(L′)`, `r′⁻¹(L′)` open with preimage under `bc` equal to `r⁻¹(L)`, and a level `K` between `r′⁻¹(L′)` and the
  integral elements above `Z` whose cocycles split above `Z`, such that `(F_j ∘ r, F′_j ∘ r′)` match above `Z` at level `K`
  for the indices `j` in a given set.

*Needs:* AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 3.1 (operators of functions; `G_f(n)`, levels).

[ShortProof], `Lib/GaloisRep/BaseChange/Defs` (`New.twistedNorm`, `New.IsTameAtLevel`, `New.IsProfiniteRing`, `New.IsRootQuotient`, `New.IsNormRoot`, `New.IsMatchingPair`, `New.CocyclesSplit`, `New.baseChangeGf`, `New.galoisGf`), with `Lib/GaloisRep/BaseChange/CommutingHeckeFamilies` (`New.IsStep`, `New.CMTypeOver`, `New.IsMatched`, `New.IsMatchingPairAbove`, `New.IsLocalRetraction`), `Lib/GaloisRep/BaseChange/CongruenceLevelMatching` (`New.IsStepUnramifiedAt`), `Lib/GaloisRep/BaseChange/PrimeDegreeTransfer` (`New.IsWeakBaseChange`, `New.IsLocalMatching`) and `Lib/GaloisRep/BaseChange/TwistedTraceIdentity` (`New.Weight.baseChange`)

### 5.2 Hilbert 90 for `GL_n` and for units under tame actions

*Origin:* adapted from Hilbert's theorem 90 and the surjectivity of norms on units, as in Speiser (1919), Serre,
*Corps locaux* (1962), Ch. X §1, Prop. 3 and Ch. V §2, and Chase, Harrison and Rosenberg, *Galois theory and Galois
cohomology of commutative rings* (1965), with norms on `O[γ]` after Scholze, *The Langlands–Kottwitz approach for some
simple Shimura varieties* (2013), Lemma 2.2: here the group is generated by one ring endomorphism of finite order that
is only tame at a level `m` (5.1), the commutative ring is Artinian, finite or profinite, and every element involved is
congruent to `1` modulo `m`.

*Method of the formal proof:* a profinite ring is reduced to the finite rings `R/N!R`, which are Artinian, by limits
along the ultrafilter of 5.1. For Artinian `R`, `k` in (a) is an invertible matrix among the fixed points of the
`σ`-semilinear map `v ↦ c·σ(v)` that are congruent to `1` modulo `m`, found by an extremal choice: of these, one whose
determinant lies in the fewest maximal ideals lies in none, as a correction at one of them would give a better choice.
For finite `R`, (c) is a count, with (b) describing the kernel of the norm on the units `≡ 1 mod m`.

Let `R` be a commutative ring and `σ` a ring endomorphism tame at level `m` with exponent `p`.
(a) If `R` is Artinian or profinite and `c ∈ GL_n(R)` has `c ≡ 1 mod m` and `N_σ(c) = 1` (`σ` on entries), then
`c·σ(k) = k` for some `k ∈ GL_n(R)` with `k ≡ 1 mod m`.
(b) If `R` is Artinian or profinite and a unit `x ≡ 1 mod m` has `Π_{i<p} σ^i(x) = 1`, then `x·σ(g) = g` for a unit
`g ≡ 1 mod m`.
(c) If `R` is finite or profinite and a unit `x ≡ 1 mod m` is fixed by `σ`, then `x = Π_{i<p} σ^i(z)` for a unit `z` with
`z ≡ 1` and `z⁻¹ ≡ 1 mod m`.
(d) An automorphism of a field `L` over `K`, with `Gal(L/K)` finite, is tame at level `1` with exponent its order. If
`σ² = 1`, `x − σ(x)` is a unit for some `x` and `σ(m) = m`, then `σ` is tame at level `m` with exponent `2`.

The library has Hilbert 90 for the units of a finite Galois extension of fields, in Noether's and in cyclic form
(`groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`, `TauCeti.exists_smul_div_eq_of_norm_eq_one`),
Galois descent of modules along a free action of a finite group on a commutative ring
(`TauCeti.MulSemiringAction.baseChangeInvariantsEquiv`), and surjectivity of the norm on units of finite fields
(`FiniteField.unitsMap_norm_surjective`); none has a level or `GL_n` over a ring. On Tau Ceti's main branch, later than
the revision pinned here: the cyclic form as an equivalence, `TauCeti.exists_smul_div_eq_iff_norm_eq_one`.

*Needs:* 5.1.

[ShortProof], `Lib/GaloisRep/Hilbert90/TameActions` (`New.isTameAtLevel_gal`, `New.IsTameAtLevel.of_sq_eq_one_of_isUnit_sub`, `New.isProfiniteRing_intAdeles`, `New.IsTameAtLevel.exists_algHom_semiconj_quotientNatMap`, `New.IsTameAtLevel.hilbert90_gl`, `New.IsTameAtLevel.hilbert90_unit`, `New.IsTameAtLevel.exists_prod_range_pow_apply_eq`)

### 5.3 Hilbert 90 for unitary groups over profinite rings, and for finite ideles

*Origin:* adapted from Hilbert's theorem 90, with the sources of 5.2, for unitary groups and for ideles: here for a
profinite ring with involution and a tame endomorphism, with a congruence modulo `m`, and for the finite ideles of a
number field and one automorphism.

*Method of the formal proof:* (a) and (b): the hermitian matrix has a `τ`-fixed twisted square root that is a polynomial
in it, obtained from `τ`-fixed units of `O[X]/Q` supplied by 5.2. (c): the solutions of `x = u·σ(x)` in the finite
adeles are closed under the place-by-place choice of the coordinate of larger absolute value, which divides both; as
Galois descent, from `Π σ^i(u) = 1`, writes `1` as an `L`-linear combination of finitely many solutions, a solution
dividing all of these divides `1` and is the finite idele `c`.

Let `O` be a profinite commutative ring with an involution `*`, and `τ` an endomorphism commuting with `*`, tame at
level `0` with exponent `p`, fixing some `c` with `c − c*` a unit.
(a) An invertible hermitian matrix `h` over `O` with `τ(h) = h` has `gᴴhg = 1` and `τ(g) = g` for some `g = 1 + W(h − 1)`.
(b) If moreover `τ` is tame at level `m` with `m* = m`, and `s` is unitary (`sᴴs = 1`) with `s = 1 + mY` and `N_τ(s) = 1`,
then `s·τ(g) = g` for a unitary `g = 1 + mW`.
(c) Let `L` be a number field, `σ` an automorphism of `L` of order `d` over a subfield, and `u` a finite adele of `L` with
`Π_{i<d} σ^i(u) = 1`. Then `u·σ(c) = c` for some finite idele `c`.

The library has `H¹(Gal(L/K), I_L) = 0` for the full idele group of a finite Galois extension of number fields,
`TauCeti.ClassFieldTheory.subsingleton_groupCohomology_one_idelesRep`; (c) is the explicit form for the finite adeles and
one automorphism.

*Needs:* 5.1, 5.2.

[ShortProof], `Lib/GaloisRep/Hilbert90/UnitaryGroups` (`New.IsTwistedRoot`, `New.exists_isTwistedRoot_of_charpoly_eq`, `New.exists_fixed_orthonormal_frame`, `New.unitary_hilbert90_at_level`, `New.hilbert90_finite_idele`)

### 5.4 Commuting families of local and spherical Hecke operators

*Origin:* particular to this proof: on the vectors fixed by a level that is a product of a local level at a finite set
of places and a level elsewhere, the operators of local functions and the spherical Hecke operators commute, and their
products are operators of explicit functions.

*Method of the formal proof:* fixed vectors split into those fixed at the local places and those fixed elsewhere;
operators of functions compose by convolution, computed coset by coset; spherical operators at places off the local
set commute with every element supported on it.

Let `S` be a set of finite places of `E`, `(A, a, r)` a retract at `S`, `π` a representation of `G_f(n)`, `L₀ ≤ A`, and
`B, C ≤ G_f(n)` with `a(A) ⊆ B ∩ C`, such that `L = r⁻¹(L₀) ∩ B ∩ C ≤ K₀`. Let `F_j` (`j ∈ J`) be functions on `A`,
bi-invariant under `L₀` and supported on finitely many cosets, whose operators on the `L₀`-fixed vectors of `π ∘ a`
commute, and let `u_x` (`x ∈ X`) be split places off `S ∪ S̄` with `K_{u_x} ⊆ L`. Then:
(a) the operators of the `F_j` (through `a`) and the `T_{u_x,i}` preserve the `L`-fixed vectors and commute there;
(b) there is a relation `R` between indices `k`, operators `t` and functions `φ` on `G_f(n)` such that `R(k, t, φ)` implies
that `t` is the operator on `L`-fixed vectors of `(F_k ∘ r)·φ·1_C`; `R(k, op(F_k), 1_B)` holds; `R(k, t, φ)` gives
`R(j, op(F_i)t, φ)` whenever `op(F_i)op(F_k) = op(F_j)`, and `R(k, T_{u_x,i}t, T_{u_x,i}φ)` (left translation on `φ`) when
every element of `G_f(n)` supported at `u_x` and `ū_x` (component `1` at every other place) lies in `C`;
(c) if `w` is split and `u` is the only place of `E′` above it, also split, then `ι_w(GL_n(E_w))` with the component at `w`
is a retract at `{w}`, `ι_u(GL_n(E′_u))` one at the places above `w, w̄`, and an element is integral at the places above
`w, w̄` exactly when its component at `u` is integral.

*Needs:* 5.1; AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 3.1 (operators of functions on `G_f(n)`).

[ShortProof], `Lib/GaloisRep/BaseChange/CommutingHeckeFamilies` (`New.IsOperatorOf`, `New.HeckeCommute`, `New.IsHeckeProduct`, `New.IsCommutingHeckeFamily`, `New.IsHeckeFunctionRelation`, `New.isCommutingHeckeFamily_of_isLocalRetraction`, `New.exists_isHeckeFunctionRelation`, `New.isLocalRetraction_ofSplitPlace`)

### 5.5 Norm roots on one side, and Hecke-stable matching pairs at split matched places

*Origin:* particular to this proof: at split matched places, polynomials that are `1` on one place of each conjugate
pair are norm roots, and functions bi-invariant at one place of each pair give a set of matching pairs that is stable
under the Hecke operators at those places.

*Method of the formal proof:* (a) is checked place by place. (b) fix one place of `E′` above each pair `{w, w̄}`; since
`Gal(E′/E)` acts freely on the places above a matched place, the polynomial equal to `X` at the fixed places and to `1`
elsewhere satisfies the hypotheses of (a). Take the functions `F` bi-invariant at the fixed places, pair `F ∘ bc` with
`1_K·F`, and use that pulling `T_{u,j}` back along `bc` gives `T_{w,j}`.

Let `E′/E` be a step with character `μ`, `σ ≠ 1` in `Gal(E′/E)` and `p = [E′ : E]`.
(a) Let `T` be a set of places of `E` at which `μ` is trivial on `E_w^×`, containing no place together with its
conjugate, `B` the places of `E′` above `T ∪ T̄`, and `z, P ∈ 𝔸_{E′,f}[X]` with `z = 1` at every place not above `T` and
`N_σ(z) ≡ X mod P` at every place above `T`. Then `z` is a norm root for `P` with the idempotent of `B` and the ideles
`y` with `μ(N(y)) = 1`, and every root quotient `a` of `1_B·z` at a unitary `γ` has component `z_u(γ_u)` at each `u` above `T`.
(b) Let `S` be a set of split matched places and `K` the elements of `G_f(n)_{E′}` integral at the places above
`S ∪ S̄`. There is a set of pairs `(f, φ)`, each matching above `S` at level `K`, that contains `(1_K ∘ bc, 1_K)` and, for
each `w ∈ S` and some `u | w`, is stable under `(f, φ) ↦ (T_{w,j}f, T_{u,j}φ)` for all `j` (left translation).

*Needs:* 5.1, 5.4.

[ShortProof], `Lib/GaloisRep/BaseChange/StepMatchingPairs` (`New.IsStep.isNormRoot_of_one_side`, `New.heckeSplit_comp_baseChangeGf`, `New.IsHeckeStableAt`, `New.IsHeckeStableMatching`, `New.isMatchingPairAbove_of_mem_biInvariantPairs`, `New.exists_isHeckeStableMatching`)

### 5.6 The Hasse principle for ideles of a CM field, and global norm roots

*Origin:* particular to this proof: a norm root with coefficients in the finite adeles can be replaced, up to a
coboundary, by one with rational coefficients; the input is the Hasse principle of (a) and (b) for the ideles of one CM
field.

*Method of the formal proof:* (a) take `y = (z + xz̄)^*` for `z` with `z + xz̄` invertible; (b) the norm of `u` to the
fixed field of `g` is, by class field theory and Hasse's norm theorem, a norm up to elements of the fixed field, and
Hilbert 90 for ideles (5.3 (c)) gives `c`; (c) `σ` permutes the prime factors of `P`; for each orbit, (b) is applied in
the CM field `E′[X]/(q)` of one of its factors `q`, and the results are assembled into `w` and `c`.

Let `E′/E` be a step with character `μ`.
(a) Let `L` be a CM field and `w` a finite adele of `L` with `w = x·w̄` for some `x ∈ L`. Then `y·w` is self-adjoint for some
`y ∈ L^×`.
(b) Let `L = E′[x]` be a CM field, `g ∈ Gal(L/E)` fixing `x`, of order `d`, and `u` a finite idele of `L` with
`μ(N_{L/E}(u)) = 1` whose norm `N = Π_{i<d} g^i(u)` satisfies `N = x·N̄`. Then `c̄·z·u·g(c)` is self-adjoint for some
`z ∈ L^×` and some finite idele `c`.
(c) Let `σ ≠ 1` with `σ^p = 1`, `p` prime, `P ∈ E′[X]` the characteristic polynomial of a unitary matrix over `E′` with
`σ(P) = P`, and `z` a norm root for `P` (with `u = 1` and the ideles `y` with `μ(N(y)) = 1`). Then there are `w ∈ E′[X]`
and `c ∈ 𝔸_{E′,f}[X]` such that, with `x = w·z·σ(c)`, at every `γ ∈ G_f(n)_{E′}` killed by the radical of `P`, `x(γ)` is
invertible and every root quotient of `x` at `γ` is a root quotient of `c` at `γ`.
(d) If `z(γ)` is invertible, `z` has exactly one unitary root quotient at `γ`, and root quotients multiply. If moreover
`a` is a root quotient of `z` at `γ`, `γ` is a root quotient of `N_σ(z)` at `γ`, and `c` satisfies `γc = cσ(γ)`, then
`N_σ(c) = γ·N_σ(a⁻¹c)`.

*Needs:* 5.1, 5.3; `ClassFieldTheory §11.1` (global reciprocity and the Artin map); `ClassFieldTheory §13.1` (the cyclic
Hasse norm theorem); IdelicReciprocityCountsAndCyclotomicClassGroups §§2.2, 2.3 (norms under Artin maps; Hasse).

[ShortProof], `Lib/GaloisRep/BaseChange/GlobalRoot` (`New.exists_isSelfAdjoint_principalIdele_mul`, `New.IsStep.exists_isSelfAdjoint_of_mem_kerCompNorm`, `New.U.existsUnique_isRootQuotient`, `New.IsRootQuotient.mul`, `New.IsRootQuotient.twistedNorm_eq_mul`, `New.exists_global_root`)

### 5.7 Matching at principal congruence levels and at unramified places

*Origin:* adapted from the local matching for cyclic base change after Scholze, *The Langlands–Kottwitz approach for
some simple Shimura varieties* (2013), Proposition 2.1 (norms inverted inside `O[γ]`), and Labesse, *Fonctions
élémentaires et lemme fondamental pour le changement de base stable* (1990): here, for unit elements, the indicator
functions of principal congruence levels of unitary groups over a profinite ring with a tame action, and levels of base
change below any open subgroup that are maximal at the step-unramified places.

*Method of the formal proof:* a norm root congruent to `1` modulo the level is built inside `O[γ]` from 5.2 (c); Hilbert
90 at the level (5.3 (b)) splits the cocycles; at the places that are not totally ramified the action is tame at every
fixed level, and the totally ramified ones dividing a fixed integer are absorbed into the level.

Let `E′/E` be a step with character `μ` and `σ ≠ 1`.
(a) Let `O` be profinite with involution and integrally closed in `R`, `τ` an endomorphism of `O` with `τ^p = 1`, tame at
the levels `0` and `m = uM` (`m* = m`), commuting with `*` and fixing some `c` with `c − c*` a unit, and `σ` its extension
to `R`. Let `L` be the `σ`-stable group of unitary `g` over `R` such that the entries of `v(g − 1)` lie in `O`, where
`mv = u` and `uv = v`. Then the cocycles of `L` split on the support of `u`, and for every `j : A → U(n)(R)` the indicator of `L` and
its pull-back along `j` form a matching pair for every `D` containing the units `1 + M·y`.
(b) There is an integer `C ≠ 0` such that `σ` is tame on `Ô_{E′}` at every `σ`-fixed level `m` whose reduction vanishes at
the places of `E′` dividing `C` with inertia group all of `Gal(E′/E)`.
(c) Below every open subgroup `H` of `G_f(n)_E` there are local levels `K_u ≤ GL_n(𝒪_{E′,u})`, one at each finite place
`u` of `E′`, such that: above every set `S` of places the group they cut out is open, `σ`-stable, has split cocycles
above `S`, and its indicator matches its pull-back to `E` above `S`; the elements of `G_f(n)_E` whose base change lies in
every `K_u` lie in `H`; and `K_u = GL_n(𝒪_{E′,u})` above every step-unramified `w` with `K_w ⊆ H`.

*Needs:* 5.1, 5.2, 5.3; AdelicUnitaryGroupsAndAlgebraicModularForms §§3.1, 6.3 (levels inside open subgroups).

[ShortProof], `Lib/GaloisRep/BaseChange/CongruenceLevelMatching` (`New.cocyclesSplit_and_isMatchingPair_of_congruence`, `New.IsStepUnramifiedPlace`, `New.IsMatchingLevel`, `New.IsBaseChangeLevel`, `New.exists_isTameAtLevel_intAdeleMap`, `New.exists_isBaseChangeLevel`)

### 5.8 The twisted trace identity

*Origin:* adapted from the comparison of the twisted trace formula with the trace formula for cyclic base change
(Arthur and Clozel, *Simple algebras, base change, and the advanced theory of the trace formula* (1989); Labesse,
*Cohomologie, stabilisation et changement de base* (1999), and *Changement de base CM et séries discrètes* (2011)):
here for the definite unitary groups over `E` and `E′`, where both traces are finite sums, and matching is the matching
of 5.1, with no stabilisation.

*Method of the formal proof:* each trace is a finite weighted sum indexed by pairs of a coset of the level and a
rational element; through the global norm roots of 5.6, rational twisted classes over `E′` correspond to rational
classes over `E`, the twisted character of `κ_{E′}` is the character of `κ` at the norm, and a bijection between the
two index sets that respects the summands and their multiplicities gives the identity.

Let `E′/E` be a step with character `μ` and `σ ≠ 1`, `κ` a weight of `E`, and `L ≤ K ≤ K₀(E′)` with `L` open and
`σ`-stable, such that every `s ∈ K` with `N_σ(s) = 1` is `t·σ(t)⁻¹` with `t ∈ K`. Then there are `c ≠ 0` and an operator `t`
on the forms of weight `κ_{E′}` on `U(n)` over `E′` such that (a) `t` carries right translation by `g` to right translation
by `σ(g)`, (b) `t` preserves the `L`-fixed forms, and (c) for every matching pair `(f, φ)` at level `K` (with `u = 1`) and
the operators `T` of `f` on the `bc⁻¹(L)`-fixed forms of weight `κ` over `E` and `T′` of `φ` on the `L`-fixed forms over `E′`,
`tr(T′·t) = c·tr(T)`.
In addition: the twisted character of `κ_{E′}` at `δ` equals the character of `κ` at `γ` whenever `N_σ(δ)` is the image of
a rational `γ`, through an intertwiner `s` with `s·ρ(δ) = ρ(σ(δ))·s`.

*Needs:* 5.1, 5.6; AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 1.5, 3.3 (class sums; unitary Hasse principle);
AbelianSchemesWithThetaStructuresAndTheirCohomology §9.3 (b) (weighted trace formula).

[ShortProof], `Lib/GaloisRep/BaseChange/TwistedTraceIdentity` (`New.IsSampleTotal`, `New.IsSampleTotal.mul_eq_mul_of_bijOn`, `New.Space.isSampleTotal_twisted_trace`, `New.exists_trace_mul_weightRep_eq_of_twistedNorm_eq`, `New.exists_isRootQuotient_of_isNormRoot`, `New.twisted_trace_identity`)

### 5.9 A weak base change eigenform

*Origin:* adapted from cyclic base change of prime degree for unitary groups (Labesse, *Changement de base CM et séries
discrètes* (2011), Corollary 5.3; Labesse, *Cohomologie, stabilisation et changement de base* (1999); Arthur and
Clozel, *Simple algebras, base change, and the advanced theory of the trace formula* (1989)): here the target is the
definite unitary group over `E′` rather than `GL_n`, only the existence of an eigenform is asserted, Hecke polynomials
are compared at split matched places, and eigenvalues of matching local operators can be prescribed.

*Method of the formal proof:* a level is chosen at which the base change levels of 5.7, the Hecke-stable matching pairs
of 5.5 and the given local data combine; the commuting families of 5.4 act on the fixed forms on both sides; the
twisted trace identity (5.8) on generalised eigenspaces, with the nonzero trace hypothesis, produces a common eigenvector
over `E′` with the same eigenvalues, which is then a weak base change.

Let `E′/E` be a step with character `μ`, `E′` stably unramified, `κ` a weight of `E` and `f` a form of weight `κ` on `U(n)`
over `E`. Let `(A, a, r, L, F)` and `(A′, a′, r′, L′, F′)` be matching local data above a finite `Z`, for indices `j` in a
set `P`; let `o : I → J`, `θ : I → ℂ` and `j₀ ∈ P`. Suppose: the operators of the `F_j` commute, and so do those of the
`F′_j`; for `i ∈ I` and `j ∈ P` there is `k ∈ P` with `op(F_{o(i)})op(F_j) = op(F_k)` and `op(F′_{o(i)})op(F′_j) = op(F′_k)`;
and for every subrepresentation `W ∋ f` (under `A` through `a`) such that `Y ∩ W` is finite-dimensional and stable, where
`Y` is the space of `L`-fixed generalised eigenvectors of every `op(F_{o(i)})` with eigenvalue `θ_i`, the operator of
`F_{j₀}` has nonzero trace on `Y ∩ W`. Then there are a form `g` of weight `κ_{E′}` over `E′` and a system `H` such that `g` is
an eigenform for `H`, a weak base change of `f` off `Z`, fixed by `L′` with `op(F′_{o(i)})g = θ_ig`, and in the image under
`op(F′_{j₀})` of the `L′`-fixed forms. In particular (`Z = ∅`) every nonzero form over `E` has a weak base change eigenform
off `∅`.

*Needs:* 5.1, 5.4, 5.5, 5.7, 5.8; 1.1.

[ShortProof], `Lib/GaloisRep/BaseChange/PrimeDegreeTransfer` (`New.isLocalMatching_empty`, `New.HasNonzeroTraceAround`, `New.IsHeckeEigenvector`, `New.localFormTranslation`, `New.isWeakBaseChange_of_forall_heckeSplit_eq_smul`, `New.exists_isWeakBaseChange_of_matching`), with the case `Z = ∅` in `Lib/GaloisRep/Main/OddRank` (`New.GaloisRep.exists_weak_baseChange`)

### 5.10 Pro-`p` Iwahori level: Hilbert 90, matching, and base change of eigencharacters

*Origin:* particular to this proof: at a place with one place above, the indicators of pro-`p` Iwahori double cosets of
a strictly dominant diagonal element and of its norm are matching local data, so base change keeps a pro-`p` Iwahori
eigencharacter, composed with the local norm.

*Method of the formal proof:* Hilbert 90 for the pro-`p` Iwahori group by the weighted sum of partial twisted norms with
an element of trace `1`; for a strictly dominant diagonal element the twisted conjugacy classes in its double coset are
read off its norm, and a polynomial `z` with `N(z) ≡ X` modulo the characteristic polynomial matches the two double
cosets; then 5.9.

Let `F` be a valued field with compact ring of integers, `σ` an endomorphism of `F` preserving the valuation with
`σ^p = 1`, and `I₁ ≤ GL_N(F)` the pro-`p` Iwahori subgroup of IntegralRepresentationsOfGeneralLinearGroups §6.1 (a)
(integral matrices upper unitriangular modulo the maximal ideal).
(a) If some integer `c` of `F` has `Σ_{i<p} σ^i(c) = 1` and `s ∈ I₁` has `N_σ(s) = 1`, then `s·σ(t) = t` for some `t ∈ I₁`.
(b) Let `σ` be continuous, `p > 0`, and `ι : F′ → F` a map whose image contains the `σ`-fixed points, along which the
valuation restricts to one equivalent to that of `F′`, and such that every `x` with `|ι(x) − 1| < 1` has
`ι(x) = Π_{i<p} σ^i(y)` for a unit `y` with `|y − 1| < 1`. Let `t` over `F` and `s` over `F′` be diagonal with `|t_i|`
and `|s_i|` strictly increasing in `i` and
`ι(s) = N_σ(t)`. For every characteristic polynomial `P` of `ι(x)` with `x ∈ I′₁sI′₁`, or of `N_σ(δ)` with `δ ∈ I₁tI₁`, there
is `z ∈ F[X]` with `N_σ(z) ≡ X mod P` such that, for `γ` of characteristic polynomial `P` and `a = z(γ)`: if `γ = ι(x)` is
`N_σ(a)`, then `x ∈ I′₁sI′₁` exactly when `a ∈ I₁tI₁`; and every `δ ∈ I₁tI₁` with `N_σ(δ) = γ` lies in `aI₁`.
(c) Let `E′/E` be a step with character `μ`, `E′` stably unramified, `u` the only place of `E′` above `w`, both split, and `μ`
trivial on `E_w^×`. The indicators of `I₁N(t)I₁` at `w` and of `I′₁tI′₁` at `u`, `N` the local norm, for dominant diagonal `t`
with `|t_i|` strictly increasing in `i`, are matching local data above `{w}`. If a form `f` over `E` is a pro-`p` Iwahori
eigenvector at `w` with the torus character of `(θ_i)`, there is an eigenform `f′` over `E′`, a weak base change of `f` off
`{w}`, that is a pro-`p` Iwahori eigenvector at `u` with the torus character of `(θ_i ∘ N)`.

*Needs:* 5.1, 5.9; 5.4 (c); IntegralRepresentationsOfGeneralLinearGroups §§6.1, 6.2, 6.3, 6.4, 6.5 (pro-`p` Iwahori
level, twisted conjugacy, degrees).

[ShortProof], `Lib/GaloisRep/BaseChange/IwahoriEigenforms` (`New.exists_coboundary_proIwahori`, `New.IsIwahoriMatchingPolynomial`, `New.proIwahori_doubleCoset_match`, `New.exists_local_norm_eq`, `New.isLocalMatching_proIwahori`, `New.exists_baseChange_isIwahoriEigen`)

### 5.11 Inert places: base change carries a label to its Shintani lift

*Origin:* adapted from the local matching for cyclic base change after Scholze, *The Langlands–Kottwitz approach for
some simple Shimura varieties* (2013), Proposition 2.1, and Labesse, *Fonctions élémentaires et lemme fondamental pour
le changement de base stable* (1990): here every function inflated from a class function on `GL_n(k_w)` (the constant
function giving the unit element), with its Shintani lift (IntegralRepresentationsOfGeneralLinearGroups §5.1) on the
twisted side, at a split place of `E` that is inert in a step.

*Method of the formal proof:* on forms of principal level at `w`, respectively `u`, an inflated class function acts
through the group algebra of `GL_n(k_w)`, respectively `GL_n(k_u)`. The norm matches twisted conjugacy classes of
`GL_n(k_u)` with conjugacy classes of `GL_n(k_w)`, so the inflation of `Ξ` and that of a function descending to it are
matching local data (a). In (b) the label supplies the nonzero trace required by 5.9, and the form that 5.9 produces
lies in the image of the operator of the lift `Ξ′`.

Let `E′/E` be a step with character `μ`, `E′` stably unramified, `w` split with `μ` trivial on `E_w^×`, and `u` the only
place of `E′` above `w`, split, with `[k_u : k_w] = [E′ : E]`.
(a) If `S` is a class function on `GL_n(k_u) ⋊ Gal(k_u/k_w)` that descends to a class function `Ξ` on `GL_n(k_w)` (`S(a, φ) = Ξ(b)`
whenever `φ ≠ 1` and `(a, φ)^{ord φ}` is `b` read in `GL_n(k_u)`), then for some `φ` the inflations to `GL_n(𝒪_w)` and
`GL_n(𝒪_u)` (extended by `0`) of `conj(Ξ)` and of `conj(S(·, φ))`, at the level of the first congruence subgroups, are
matching local data above `{w}`.
(b) If `Ξ` is a character and `Ξ′` a Shintani lift of `Ξ` (`Lift_ℕ(Ξ, Ξ′)`, IntegralRepresentationsOfGeneralLinearGroups
§5.1 (a)) and `f` has the
label `Ξ` at `w`, then some eigenform `f′` of weight `κ_{E′}` over `E′` is a weak base change of `f` off `{w}` with label `Ξ′`
at `u`.

`RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups §10.33c` is the local
matching for `GL_n` over an unramified extension of local fields of the inflation of a class function with the inflation
of its Shintani lift, as an equality of twisted orbital integrals and orbital integrals at regular semisimple norms. Its
§10.33d gives the label of the base change, along an unramified extension of prime degree, of an irreducible depth-zero
representation of `GL_n` of a local field, and in its global form (b) the label at an inert unramified place of the
cuspidal base change of a unitary cuspidal representation of `GL_n` over a number field. Here matching is the pointwise
matching of 5.1 on the definite unitary groups, and the label is that of 1.1 on a form.

*Needs:* 1.1, 5.1, 5.9; 5.4 (c); IntegralRepresentationsOfGeneralLinearGroups §§4.1, 5.1 (class functions; semidirect
product, descent, lifts).

[ShortProof], `Lib/GaloisRep/BaseChange/ShintaniLift` (`New.inflateConj`, `New.exists_representation_heckeFun_inflateConj`, `New.exists_mk_reduceGL_pow_eq_mk_reduceGL_twistedNorm`, `New.isLocalMatching_shintani`, `New.exists_baseChange_hasLabel`)

## Layer 6: Attached representations in odd rank

In odd rank the representations come from PEL models for forms with a cuspidal type at an auxiliary split place and
free weights (6.2). Weight congruences and limits of traces reach every form (6.3), when the CM field contains an
imaginary quadratic field in which the relevant places split; quadratic steps and gluing on open subgroups remove this
condition (6.4).

### 6.1 Split places over `ℚ(√−d)` and quadratic steps

*Origin:* particular to this proof: places above split primes of an imaginary quadratic field, chosen apart from given
places, and quadratic CM extensions with prescribed splitting and ramification over a given integer.

*Method of the formal proof:* if only two places and their conjugates lay above a split prime, the fields of `80`-th and
`63`-rd roots of unity would have too few primes above it; the step is `E(b)` with `b² = αt`, `αᾱ = D`, `t` totally real,
the congruence on `D` and the choice of `t` controlling the places over `n`, and ramification of `√−D` at a place prime to
`n` giving the generation by inertia (Grunwald-type existence).

Let `d ≡ 3 mod 4` and `K = ℚ(√−d)`. A place `u` of `K` is *split prime to the discriminant* if it contains
`(1 + √−d)/2 − b` for an integer `b` with this element coprime to its conjugate (the condition on the place below a safe
place in AbelianSchemesWithThetaStructuresAndTheirCohomology §8.1); a place of `E ⊇ K` over such a `u` is split.
(a) If `E ⊇ K` is stably unramified and `u` is split prime to the discriminant, then for any places `a, b` of `E` some
place `v` above `u` has `v, v̄ ∉ {a, b}`.
(b) Let `E` be a stably unramified CM field and `n ≠ 0`. There are a continuous character `χ : G_E → ℚ/ℤ` and `D ≡ 3 mod 4`
such that, with `E′` the fixed field of the kernel of `g ↦ χ(g) + χ(cgc)` (`c` complex conjugation), `U` that kernel and
`N = U ∩ ker χ`: (i) `E′ ⊇ ℚ(√−D)` and `E′/E`, with the idele character of `χ`, is a step; (ii) for some `m`, every subgroup
containing the inertia groups at the places prime to `n` of norm at most `m` meets every coset of `N`; (iii) the places of
`E′` over `n` lie over places of `ℚ(√−D)` split prime to the discriminant; (iv) at a place `A` of `Ω` over `w | n`,
`D_A ⊆ U` and `I_A ⊆ N`, and `D_A ⊆ N` if `w` is split.

*Needs:* 5.1; IdelicReciprocityCountsAndCyclotomicClassGroups §§1.1, 6.2 (places of `Ω`; steps `E_χ/E`);
AbelianSchemesWithThetaStructuresAndTheirCohomology §8.1 (`K₀ = ℚ(√−d₀)`, safe places).

[ShortProof], `Lib/GaloisRep/Main/QuadraticStep` (`New.GaloisRep.IsSplitPrimeToDisc.isSplit_of_below`, `New.GaloisRep.IsSplitPrimeToDisc.exists_place_above_ne`, `New.GaloisRep.IsQuadraticStep`, `New.GaloisRep.exists_isQuadraticStep`, `New.GaloisRep.exists_isStep_hasQuadSubfield`)

### 6.2 Seed representations

*Origin:* particular to this proof: in odd rank, a form with a cuspidal type at a split place and free weights at one
embedding has a continuous representation with its Hecke polynomials as characteristic polynomials at most Frobenius
elements, spherical with exactly the jumps of the weight at a further split place.

*Method of the formal proof:* the route passes to the general linear group: `f` gives a definite form on `GL_a(𝔸_f)`
with a central character (AbelianSchemesWithThetaStructuresAndTheirCohomology §9.3), whose eigensystem occurs, for each
complex embedding, in the weights that AbelianSchemesWithThetaStructuresAndTheirCohomology §9.6 provides; §9.8 there
gives a representation killed by the Hecke polynomials in which the jumps at that embedding occur. After a twist by an
algebraic Hecke character that removes the central character (IdelicReciprocityCountsAndCyclotomicClassGroups §9.2),
4.5 merges the representations for the various embeddings into one of rank `a`.

Let `E` be a CM field containing `K = ℚ(√−d)` (`d ≡ 3 mod 4`) and a primitive `5040`-th root of unity, `a` odd, and `f` a
form of weight `κ` on `U(a)`, spherical off a finite set `S` with polynomials `P`. Let `w₀ ∈ S` lie over a place of `K` split
prime to the discriminant, and let `f(g·ι_{w₀}(j)) = θ(j)f(g)` for `j ∈ 1 + ϖ_{w₀}M_a(𝒪_{w₀})`, `θ` a cuspidal type. Let `v`, with
`v, v̄ ∉ S`, lie over the same place of `K` as `w₀`, let `ε : Ω → ℚ̄_ℓ` induce `v` on `E`, and let the jumps
`J_κ(ι⁻¹ ∘ ε|_E)` be free. Let `w′` lie over a place of `K` split prime to the discriminant, over the same place as `w₀` if
`w′` lies above `ℓ`. Then there is a continuous `r : G_E → GL_a(ℚ̄_ℓ)` with (a) `det(X − r(s)) = ι(P_w)` for most Frobenius
data `(w, A, s)`, and (b) if `w′, w̄′ ∉ S`, `r` spherical above `w′` with polynomial `ι(P_{w′})` and exactly the jumps `J_κ`.

*Needs:* 1.1, 1.3, 4.3, 4.5, 6.1; AbelianSchemesWithThetaStructuresAndTheirCohomology §§3.7, 8.1, 8.4, 9.2, 9.3, 9.6, 9.8
(PEL models, definite forms, eigensystem representations); IdelicReciprocityCountsAndCyclotomicClassGroups §§7.5, 9.1, 9.2
(algebraic Hecke characters, avatars, twists).

[ShortProof], `Lib/GaloisRep/Main/SeedRepresentation` (`New.GaloisRep.exists_frame_extension`, `New.GaloisRep.exists_central_eigenform`, `New.GaloisRep.isSplitPrimeToDisc_below_of_prime_norm`, `New.GaloisRep.centralChar_mem_algHeckeChars_and_charUnramifiedAt`, `New.GaloisRep.exists_rep_of_cuspidal_type`)

### 6.3 The split case

*Origin:* particular to this proof: (c), the case of `SphCompat` in odd rank in which `E` contains `ℚ(√−D)` and
`ζ_5040` and the places of `ℚ(√−D)` below `u` and below every place of `E` above `ℓ` are split prime to the discriminant;
by (a) and (b), the representation is obtained from seed representations (6.2) by the limit of traces of 2.4.

*Method of the formal proof:* choose auxiliary split places `v`, `x` apart from `u` and from each other, a cuspidal type
at `v` (4.3) and a level of that type inside the stabiliser of `f` away from `v, x`; by 3.3 (b) the `ℓ`-adic model of `f`
is a limit of models of forms of that type with weights free at the infinite places not inducing `u`, each of which has a
seed representation (6.2); the Hecke contractions of 3.3 (a) give an approximating monoid (2.4 (a)); the limit is taken by
(a) and the local clauses pass to it by (b).

Let `a ≥ 1`, `N` an approximating monoid (2.4) for `K = ℚ̄_ℓ`, `r_i` (`i ∈ I`) continuous `ℓ`-adic representations of rank
`a` and `Q_{i,w}` complex polynomials with `det(X − r_i(s)) = ι(Q_{i,w})` for most Frobenius data.
(a) Let `P = (P_w)` be a system of complex polynomials indexed by the finite places, `L ⊆ ℚ̄_ℓ` complete, and suppose
that for most Frobenius data `P_w` is monic of degree `a`, `−ι(coeff_{a−1} P_w) ∈ L`, and
`(−ι(coeff_j P_w), (−ι(coeff_j Q_{i,w}))_i) ∈ N` for every `j`. Then some `R` is attached to `P`, with
`(tr R(g), (tr r_i(g))_i) ∈ N` for all `g`.
(b) Let `f ≠ 0` be a form of weight `κ`, `u` a place, each `r_i` spherical above `u` with polynomial `ι(Q_i)` and the jumps
`J_κ`, with `deg Q_i = a` if `u` is split, and suppose that for each Hecke polynomial `X` of `f` at `u` and each `j` some `c ≠ 0`
has `(c·ι(coeff_j X), (c·ι(coeff_j Q_i))_i) ∈ N`. If `ρ` is continuous and semisimple with `(tr ρ(g), (tr r_i(g))_i) ∈ N` for
all `g`, then `ρ` is compatible with `f` in rank `a` at every place over `u`.
(c) Let `E` be a CM field containing `ℚ(√−D)` (`D ≡ 3 mod 4`) and a primitive `5040`-th root of unity, `a` odd, and `u` a finite
place such that `u` and every place above `ℓ` lie over places of `ℚ(√−D)` split prime to the discriminant. Then
`SphCompat(E, a, u)` holds.

*Needs:* 1.5, 2.4, 3.3, 4.3, 6.1, 6.2; CrystallineRepresentationsAndKisinModules §6.4 (local clauses at trace limits).

[ShortProof], `Lib/GaloisRep/Main/SplitCase` (`New.GaloisRep.IsPlaceApart`, `New.GaloisRep.exists_place_apart`, `New.HasHeckePolyAt.coeff_pred_mem`, `New.GaloisRep.exists_attached_of_isApproximatingMonoid`, `New.GaloisRep.exists_isLevel_of_localCongruence_hom`, `New.GaloisRep.isCompatibleAt_of_isApproximatingMonoid`, `New.GaloisRep.sphericalCompat_of_split`)

### 6.4 Odd rank: descent along a step and gluing

*Origin:* adapted from Chenevier and Harris, *Construction of automorphic Galois representations II* (2013), Theorem
3.2.3, with Labesse, *Changement de base CM et séries discrètes* (2011), Corollary 5.3, and Barnet-Lamb, Gee, Geraghty
and Taylor, *Potential automorphy and change of weight* (2014), Theorem 2.1.1: here in odd rank over a CM field
containing a primitive `5040`-th root of unity, with attachment in the sense of 1.5 and compatibility at every place
where the form is spherical; the representations come from quadratic steps between definite unitary groups and are
glued on open subgroups, with no base change to `GL_n`.

*Method of the formal proof:* for `T ∈ ℕ` a quadratic step (6.1 (b)) over `n_T = ℓ·(T + q_w + max_{v∈S} q_v)!` puts the places
over `n_T` above split primes of an imaginary quadratic field; the base change of `f` (5.9) has a representation by the
split case (6.3); its restriction to the open subgroup `N_T` is attached to the polynomials of `f` (a); these restrictions
are glued by (c), and (b), applied to a single step, gives the compatibility at `w`.

(a) Let `χ : G_E → ℚ/ℤ` be continuous, `E′` the fixed field of `g ↦ χ(g) + χ(cgc)`, with `E′/E` a step for the idele character
of `χ`, and `N = Gal(Ω/E′) ∩ ker χ`. Let `f, f′` be eigenforms for `P, P′` over `E`, `E′`, with `f′` a weak base change of `f`
off `S`, and `r′` attached to `P′`. Then `r′|_N` is attached to `P` along `N ⊆ G_E`; and for `r` attached to `P` and every place
`A` of `Ω`: finite type at `A` passes from `r′` to `r`, the jumps of `κ_{E′}` for `r′` give the jumps of `κ` for `r`, and a
polynomial killing `s ∈ N` for `r′` kills it for `r`.
(b) In (a), let `A` lie over `w ∉ S ∪ S̄`, `u | w` in `E′`, and let `χ` and `g ↦ χ(g) + χ(cgc)` vanish on `I_A`, and on `D_A` if `w`
is split. If `r′` is compatible with `f′` at `A` (for `u`), then `r` is compatible with `f` at `A` (for `w`).
(c) Let `ρ₀` on a normal `N₀ ≤ G_E` and `ρ_T` on open normal `N_T` (`T ∈ ℕ`) be attached to `P` along the inclusions. Let
`I ⊆ G_E` be such that every subgroup containing `I` meets every coset of `N₀`, and every conjugate of an element of `I`
lies in every `N_T` and is killed by `ρ_T`. If every arithmetic Frobenius at a place over a place of prime norm lies in
some `N_T`, then some representation of `G_E` is attached to `P`.
(d) Let `E` be a stably unramified CM field, `a` odd and `w` any finite place. Then `SphCompat(E, a, w)` holds.

`RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1` states the Galois
representations of automorphic representations of definite unitary groups through weak base change to `GL_n`, with
exact characteristic polynomials at every place away from `ℓ` at which the base change is unramified; 7.3 says how the
statements here are related to it.

*Needs:* 1.4, 1.5, 1.6, 2.1, 5.1, 5.9, 6.1, 6.3; 1.2.

[ShortProof], `Lib/GaloisRep/Main/OddRank` (`New.GaloisRep.DescendsAt`, `New.IsWeakBaseChange.attached_comp_stepKerInclusion`, `New.IsWeakBaseChange.descendsAt`, `New.IsWeakBaseChange.isCompatibleAt_of_attached`, `New.GaloisRep.isStepUnramifiedAt_of_decompGroup_le`, `New.GaloisRep.exists_attached_of_open_subgroups`, `New.GaloisRep.sphericalCompat_of_odd`)

## Layer 7: Every rank

A form of rank `n` is lifted to rank `2n + 1` by theta lifts along two characters of `U(1)`; the representations of the two
lifts, twisted, have the Hecke polynomials of the form times two disjoint strings of linear factors, which are cancelled.

### 7.1 Theta lift to a larger definite unitary group

*Origin:* adapted from the passage to odd rank by endoscopic transfer (Blasius and Rogawski, *Motives for Hilbert
modular forms* (1993); Shin (2011)), done here by a theta lift along a varying character as in Harris, Soudry and Taylor
(1993): here for the standard definite spaces of ranks `n` and `n + s` with `s > n`, with explicit weights, sphericity
at every finite place where the form is spherical, and the Hecke polynomials at split places. That the lift is nonzero
is an input, stated in SiegelWeilAndRallisFormulasOnUnitaryGroups §4.5: the inner product formula for sharp data and
the injectivity of the theta lift when the target rank is more than twice the source rank, after Rallis, *Injectivity
properties of liftings associated to Weil representations* (1984), and Li, *Non-vanishing theorems for the cohomology
of certain arithmetic quotients* (1992).

*Method of the formal proof:* the lift is the theta lift by a datum made of joint harmonics at the real places and a
sharp finite datum at a level fixing `f`; the Rallis inner product formula shows that it is nonzero, and the unramified
correspondence for Hecke polynomial operators transfers the Hecke eigenvalues.

Let `E` be a CM field with Weil data, `f ≠ 0` a form of rank `n ≥ 1` and weight `λ` (`λ_v ∈ ℤⁿ`), `μ` a character of `U(1)` with
trivial tame part and weight `c` with `c(v) ≤ λ_{v,n}` for all `v`, and `s > n`. There is a form `F ≠ 0` of rank `n + s` and weight
`λ′_v = (λ_{v,1} − c(v), …, λ_{v,n} − c(v), 0, …, 0)` such that `F` is spherical at every finite place where `f` is, and at a split
such `w`, if `f` has Hecke polynomial `P` then `F` has a Hecke polynomial `Q` with
`θ₀^{n+s}·Q(X/θ₀) = P(X)·Π_{0≤l<s}(X − θ_l)`, where `θ₀ = θ_{s,s}(μ)(ϖ_w)` and `θ_l = θ_{n+s,s−l}(μ)(ϖ_w)`. Also the monic and the
reciprocal normalisations of the Hecke polynomial agree: `H_{q,n}(t)(x) = xⁿ·Σ_j (−x⁻¹)^j q^{j(j−1)/2}t_j` for `x ≠ 0`.

`RiemannHypothesisForDirichletLFunctions/ThetaLiftsForDefiniteUnitaryGroups §4.3` is the existence theorem for general
definite pairs, with prescribed archimedean weights and the Satake parameters of its §2.2 at split places.

*Needs:* 1.1; WeilRepresentationsOnBanachSpacesOfData §§7.2, 7.3, 7.6, 9.2, 9.3 (edges, lifts, Hecke polynomial
transfer); SiegelWeilAndRallisFormulasOnUnitaryGroups §§4.1, 4.4, 4.5 (sharp data, Rallis inner product formula);
HolomorphicDiscreteSeriesOfUnitaryGroups §§8.1, 8.2 (joint harmonics; block rule).

[ShortProof], `Lib/GaloisRep/Main/ThetaLift` (`New.eval_heckePoly`, `New.exists_isSharp_of_two_mul_card_le`, `New.exists_theta_lift_heckePoly`)

### 7.2 Cancelling strings of characters

*Origin:* particular to this proof: two representations attached to the polynomials of a form times two disjoint strings
of linear factors give, after cancelling the strings, a representation attached to the polynomials of the form, with the
local clauses.

*Method of the formal proof:* the two strings are separated at split places by a difference of weights at one infinite
place, a multiple of the number of roots of unity; the traces less the strings agree as limits of a coefficient of
`P_w` (1.6 (a)), so 2.1 (e) cancels them; the local clauses are a trace limit of a constant family.

Let `E` be a CM field with Weil data.
(a) For every `e : {infinite places} → ℤ` there are characters `μ_0, μ_1` of `U(1)` with trivial tame part and weights
`c_i ≤ e` such that for all integers `k, j, j′` and every split `w`, `θ_{k,j}(μ_0)(ϖ_w) ≠ θ_{k,j′}(μ_1)(ϖ_w)`.
(b) If `σ` is attached to `Q` and `ν` is a continuous character of `G_E` with, at most Frobenius data, `ν(s) = ι(z_w)`, `Q_w`
monic of degree `m` and `z_w^m Q_w(X/z_w) = P_w`, then `ν ⊗ σ` is attached to `P`.
(c) Let `n ≥ 1` and let `ρ_0, ρ_1` of rank `n + t` be attached to `P_w·Π_l (X − c_{i,l,w})`, with `P_w` monic of degree `n` and
`ι(c_{i,l,w}) = ψ_{i,l}(s)` at most Frobenius data, for continuous characters with `ψ_{0,l} ≠ ψ_{1,l′}`. Then some rank `n`
representation is attached to `P`, and every `r` attached to `P` has `tr r = tr ρ_i − Σ_l ψ_{i,l}` for both `i`.
(d) If `r` is continuous and semisimple with `tr r = tr ρ − Σ_l tr χ_l`, and `ρ` and the characters `χ_l` are continuous and good
at `A` with jumps `J + Σ_l j_l` and `j_l`, then `r` is good at `A` with jumps `J`, and a polynomial killing `s` for `ρ` and every
`χ_l` kills it for `r`. If `P·a` and `P·b` kill `s` and `a, b` are coprime, `P` kills `s`.

*Needs:* 1.3, 1.5, 1.6, 2.1; CrystallineRepresentationsAndKisinModules §6.4 (local clauses at trace limits);
IdelicReciprocityCountsAndCyclotomicClassGroups §§7.1, 7.5, 8.5 (characters of `U(1)`; `θ_{k,j}(μ)`).

[ShortProof], `Lib/GaloisRep/Main/AllRanks` (`New.AutChar.exists_pair_heckeCoeff_ne`, `New.GaloisRep.isGoodAt_hasJumpsAt_of_trace_eq_sub`, `New.GaloisRep.PolyKillsAt.of_mul_of_isCoprime`, `New.GaloisRep.Attached.tendsto_trace_sub`, `New.GaloisRep.Attached.of_trace_sub`, `New.GaloisRep.Attached.exists_attached_of_mul_prod`, `New.GaloisRep.Attached.twistByChar_of_scaleRoots_eq`)

### 7.3 Attached representations in every positive rank

*Origin:* adapted from Chenevier and Harris, *Construction of automorphic Galois representations II* (2013), Theorem
3.2.3, with Labesse, *Changement de base CM et séries discrètes* (2011), Corollary 5.3, and Barnet-Lamb, Gee, Geraghty
and Taylor, *Potential automorphy and change of weight* (2014), Theorem 2.1.1: here in every rank `n ≥ 1`, over a CM
field with Weil data and for every `ℓ`, with attachment in the sense of 1.5; at every place where the form is spherical,
split or not, every attached representation is compatible with the form in the sense of 1.5, above `ℓ` included.

*Method of the formal proof:* with `t = n + 1`, lift `f` to rank `2n + 1` along `μ_0` and `μ_1` of 7.2 (a) (7.1); each lift has
a representation by 6.4 (d), twisted by the avatar of `θ_{t,t}(μ_i)` (7.2 (b)); it is attached to `P_w` times the string of
the `t` characters `θ_{n+t,t−l}(μ_i)`; cancel the two strings (7.2 (c)); the local clauses pass by 7.2 (d), and the two killing
polynomials `P_w·R_{i,w}`, with coprime strings `R_{0,w}`, `R_{1,w}`, give that `P_w` kills.

Let `E` be a CM field with Weil data, `n ≥ 1` and `w` any finite place. Then `SphCompat(E, n, w)` holds: every eigenform `f`
of any weight `κ` on `U(n)`, for a system `P`, has an attached `r : G_E → GL_n(ℚ̄_ℓ)`; and if `f` is spherical at `w`, every `r`
attached to `P` is, at every place `A` over `w`, unramified (crystalline if `A` lies above `ℓ`), has the jumps `J_κ` in rank `n`,
and, if `w` is split with Hecke polynomial `Q`, `ι(Q)` kills every geometric Frobenius at `A`.

`RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1` is the form through
weak base change to `GL_n`: for an automorphic representation `Π` of a definite unitary group with algebraic archimedean
component, over a CM field with `[E⁺:ℚ] ≥ 2`, it gives a continuous semisimple `r_{ℓ,ι}(Π)`, unramified with the exact
characteristic polynomial `P_w(BC(Π)_w; X)` of Frobenius at every `w ∤ ℓ` at which `BC(Π)_w` is unramified, split or not,
de Rham with labelled weights `{i − 1 − λ_{τ,i}}` at every `w ∣ ℓ`, and crystalline at each `w ∣ ℓ` at which `BC(Π)_w` is
unramified. (Its `ι` is an isomorphism `ℚ̄_ℓ ≅ ℂ`, the inverse of the `ι` of this roadmap.) Here `[E⁺:ℚ] ≥ 2` holds, since
`E` contains `ℚ(ζ_5040)`. The route does not use §16.1, and the statement above is the target; it is nevertheless a
consequence of §16.1, as follows, up to the two comparisons named in (iv).

(i) *From `f` to `Π`.* By `AutomorphicFormsOnReductiveGroups §7.5` (automorphic realisation of the forms with
`F(γg) = ρ(γ)F(g)`; `π_∞ ≅ V_ℂ^∨` for irreducible coefficients), an eigenform `f` has a nonzero component in an automorphic
representation `Π` of the unitary group, and the projection commutes with right translation, so `Π` has a vector fixed by
`K_w` wherever `f` is spherical at `w`, with the eigenvalues of `f` under the `T_{w,j}` at split such `w`. The coefficient
representation `ρ_κ` lets a component act through its entrywise conjugate (AdelicUnitaryGroupsAndAlgebraicModularForms
§6.1), so it is the dual of the representation of highest weight `λ_v` read through `Φ_v`, and `Π_v` has highest weight
`λ_v` at `τ = Φ_v` and `−w₀λ_v` at the other embedding over `v`.
(ii) *Existence.* `BC(Π)_w` is unramified wherever `Π` is, and at a split `w` it is the component of `Π` read on `GL_n(E_w)`
(§16.1, with the local matching at unramified and split finite places of
`EndoscopicTransferAndUnitaryTraceComparison §6.29`). At a split `w ∤ ℓ` where `f` has Hecke polynomial `Q`, the Satake
parameters `α_i` of `Π_w` have `q_w^{j(n−j)/2}e_j(α)` as eigenvalue of `T_{w,j}`, so
`P_w(BC(Π)_w; X) = Π_i (X − q_w^{(n−1)/2}α_i) = H_{q_w,n}(t) = Q`. Hence the characteristic polynomial of `r_{ℓ,ι}(Π)` at
every geometric Frobenius over `w` is `ι(P_w)`, for all but finitely many `w` of prime norm, and `r_{ℓ,ι}(Π)` is attached
to `P` in the sense of 1.5, with `O = V` in 1.2 and equality in place of the bound by `η`.
(iii) *Every attached representation.* Two representations attached to `P` have the same traces (1.6 (b)), so they are
conjugate (2.1 (b)), and the local conditions of 1.3 are unchanged by conjugation. So it is enough to treat
`r_{ℓ,ι}(Π)`.
(iv) *Local conditions at a place where `f` is spherical.* For `w ∤ ℓ`: `r_{ℓ,ι}(Π)` is unramified over `w` by §16.1, and
at a split `w` the polynomial `ι(Q)` is the characteristic polynomial of geometric Frobenius, so it kills it. For `w ∣ ℓ`:
§16.1 gives a crystalline representation with labelled weights `{i − 1 − λ_{v,i}}` at `Φ_v` and, since
`λ_{τ∘c} = −w₀λ_τ`, `{λ_{v,i} + n − i}` at the other embedding, which are the jumps `J_κ` in rank `n`. Reading this in the
terms of 1.3 needs the agreement of "crystalline" and of the Hodge–Tate jumps of
CrystallineRepresentationsAndKisinModules §3.1, defined through `B_max`, with the notions of PadicHodgeTheory §§3.3–3.5;
that agreement is a published theorem which no roadmap states. The signs agree as they stand: in §16.1 and in 3.1 of
that roadmap the cyclotomic character has weight, respectively jump, `−1` (in PadicHodgeTheory it has weight `+1`, so
a jump `u` is a weight `−u` there). The last clause at a split `w ∣ ℓ` (that `ι(Q)` kills the
linearised Frobenius on the periods) is not in §16.1: it follows from §15.1 of that roadmap applied to each block
`π_i ⊗ |det|^{s_{ij}}`, whose parameter at `w` is a sum of unramified characters with `N = 0`, which gives
`WD(D_pst)^{F-ss} ≅ ι⁻¹rec^T` on all of `W_{E_w}`; reading it in the terms of 1.3 needs the comparison of the linearised
Frobenius of CrystallineRepresentationsAndKisinModules §3.1 with the Frobenius of `WD(D_pst)`, again stated in no roadmap.

*Needs:* 6.4, 7.1, 7.2; 1.6; IdelicReciprocityCountsAndCyclotomicClassGroups §§8.5, 9.1 (unramified `θ_{k,j}(μ)`;
`ℓ`-adic avatars).

[ShortProof], `Lib/GaloisRep/Main/AllRanks` (`New.GaloisRep.sphericalCompat_std`)

### 7.4 Isotypic spaces and their Galois representations

*Origin:* particular to this proof: the forms of a weight decompose, up to a direct sum, into isotypic spaces cut out by
Hecke eigenvalues at almost all places, each kept by the operators supported at one place and carrying a chosen
attached representation.

*Method of the formal proof:* independence by eigenvalues at a common place where the systems differ; stability because
translations supported at `v` commute with the spherical operators at the other places; existence of the representation
from 7.3.

For a system `t = (t_w)` of sequences, the *isotypic space* is the space of forms of weight `κ` on `U(n)` (`n ≥ 1`) that, at all
but finitely many `w`, are spherical with `T_{w,j}f = t_{w,j}f` when `w` is split.
(a) Every family of distinct isotypic spaces is independent, so their sum is direct; every isotypic space is kept by
the algebra generated by the translations supported at any one place `v` and `v̄`.
(b) If `E` is stably unramified, a nonzero form in an isotypic space is an eigenform for the Hecke polynomials of its
system; a nonzero form spherical off `S` with polynomials `P` lies in some isotypic space.
(c) If `E` has Weil data and the space contains a nonzero form, a chosen representation attached to the Hecke polynomials
of the system exists.

*Needs:* 1.1, 1.5, 7.3.

[ShortProof], `Lib/GaloisRep/Main/AllRanks` (`New.Patching.localGroupAlgebra`, `New.Patching.eigenformsAt`, `New.Patching.Isotypic`, `New.Patching.Isotypic.map_mem`, `New.Patching.Isotypic.isEigenform`, `New.Patching.exists_isotypic_of_isSphericalOff`, `New.Patching.Isotypic.iSupIndep_val`, `New.Patching.Isotypic.galRep`, `New.Patching.Isotypic.exists_attached`, `New.Patching.Isotypic.attached_galRep`)

## Layer 8: Local–global compatibility at split places

At a split place, level information on the form gives polynomials that kill Frobenius and inertia elements on every
attached representation. Pro-`p` Iwahori eigencharacters are treated by base change to the spherical case; depth-zero types
given by labels by base changes in which the place is inert, until the label splits into linear factors.

### 8.1 The local action at a split place, parahoric types and labels

*Origin:* particular to this proof: the action of `GL_n(E_w)` on forms at a split place, the Hecke polynomial read in it, and
depth-zero types given by a parahoric subgroup or by a label, a parahoric type giving a label.

*Method of the formal proof:* the forms are a smooth unitary representation of `GL_n(E_w)` through `ι_w`; Frobenius
reciprocity turns the sum over `GL_n(k_w)` against the induced class function into a sum over the parabolic subgroup, where
the characters of the other blocks cancel.

Let `w` be split. The forms of weight `κ` on `U(n)` form a smooth representation of `GL_n(E_w)` through `ι_w`, unitary for the
invariant pairing, with finite-dimensional pro-`p` Iwahori invariants in the span of the translates of one form.
- `f` has Hecke polynomial `P` at `w` exactly when `GL_n(𝒪_w)` fixes `f` in this representation, `T_{w,j}f = t_jf`, and
  `P = H_{q_w,n}(t)`.
- Let `ρ ⊆ {1..n}` (through an injection `e`) and `b` cut the indices into blocks `0, …, s`, block `0` the image of `e`. `f` has a
  *parahoric type* `(ψ, χ, F)` if every integral `k` whose reduction is block upper triangular with block `0` equal to `x` sends
  `f` to `Π_l χ_l(det k_{l+1})·ψ(det x)·F(x)`.
- Fix a faithful character `T` of the multiplicative group of an algebraic closure of `k_w`; it names each character `χ` of
  `k_w^×` by a unit `x_χ` (IntegralRepresentationsOfGeneralLinearGroups §4.4 (d)). A *label* of degree `d` is a monic
  squarefree `c ∈ k_w[X]` of degree `d` with `c(0) ≠ 0`, as in IntegralRepresentationsOfGeneralLinearGroups §5.3. `f` has the
  *product label* `(d, c, χ, t)` if `c` is a label of degree `d`, `c·Π_l (X − x_{χ_l})` is separable, `d + Σ_l t_l = n`, and `f`
  has the label (1.1) given by the parabolic induction of Green's class function of `c` and the characters `χ_l ∘ det` on
  `GL_{t_l}`.
Statement: if `f` has a parahoric type `(ψ, χ, x ↦ L(σ(x)y))`, for a representation `σ` of `GL_ρ(k_w)`, `L` injective and `y` not
killed by the idempotent of a label `c` of degree `|ρ|`, with the `χ_l` distinct, and no `x_{χ_l}` is a root of `a = c` with
its roots scaled by `x_ψ`, then `f` has the product label `(|ρ|, a, χ, (|b⁻¹(l + 1)|)_l)`.

*Needs:* 1.1; AdelicUnitaryGroupsAndAlgebraicModularForms §6.3 (invariant positive definite form);
IntegralRepresentationsOfGeneralLinearGroups §§4.1, 4.2, 4.4, 5.3, 5.4 (parabolic induction, Green's characters, labels).

[ShortProof], `Lib/GaloisRep/LocalGlobal/LocalFormTypes` (`New.Patching.localFormRep`, `New.isUnitary_localFormRep`, `New.hasHeckePolyAt_iff_localFormRep`, `New.HasParahoricType`, `New.HasProductLabel`, `New.HasParahoricType.hasProductLabel`)

### 8.2 Iwahori eigencharacters

*Origin:* adapted from local–global compatibility away from `ℓ` (Harris and Taylor, *The geometry and cohomology of
some simple Shimura varieties* (2001); Taylor and Yoshida (2007)) and at `ℓ` (Barnet-Lamb, Gee, Geraghty and Taylor,
*Local-global compatibility for l = p, II* (2014), Theorem 1.1): here at a split place for a pro-`p` Iwahori
eigencharacter of a form on a definite unitary group, as polynomials that kill Weil elements, away from `ℓ` and above
`ℓ` in one statement.

*Method of the formal proof:* by induction on the index of a subgroup on which the characters are trivial: a step of prime
degree in which `w` has one place above and the characters factor through the norm reduces the index (5.10, with 6.4
(a)); when all `ξ_i` are unramified the form generates a spherical vector with Hecke polynomial `Π(X − ξ_i(ϖ_w))`, and 7.3
applies; Weil elements of degree `0` are reached by multiplying by powers of the symbol of the uniformiser.

Let `E` be a CM field with Weil data, `n ≥ 1`, `f` a form of weight `κ` on `U(n)` that is an eigenform for `P`, and `w` split.
Suppose `f` is a pro-`p` Iwahori eigenvector at `w` (through `ι_w`) for the torus character `t ↦ Π_i ξ_i(t_i)|t_i|^{n−1−i}`
(`0 ≤ i < n`) of IntegralRepresentationsOfGeneralLinearGroups §6.1 (c), with `|ξ_i(ϖ_w)|` non-increasing in `i`. Let `r`
be attached to `P`, `A` a place over `w`, `s ∈ D_A` with `s⁻¹` acting on the residue field of `A` as `x ↦ x^{q_w^k}`, and
`x ∈ E_w^×` of valuation `k` whose local Artin symbol at `A` is `s`. Then
(a) `r` is of finite type at `A`, (b) `r` has the jumps `J_κ` at `A`, and (c) `Π_i (X − ι(ξ_i(x)))` kills `s` at `A`.

For regular algebraic polarized cuspidal representations of `GL_n` over a CM field,
`RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.1` is the comparison of
Weil–Deligne representations at every `w ∤ ℓ`, monodromy included, its §14.2 the form on inertia at a place `w ∤ ℓ` of
depth zero up to twist with pairwise unlinked supercuspidal support, and its §15.1 the comparison at `w ∣ ℓ` for
parameters with `N = 0` whose irreducible constituents are induced from characters of unramified extensions.

*Needs:* 1.3, 1.5, 5.10, 6.4, 7.3; IdelicReciprocityCountsAndCyclotomicClassGroups §2.1 (local Artin map at a place);
IntegralRepresentationsOfGeneralLinearGroups §§6.1, 6.5, 6.6, 6.7 (exponents, Satake, sorting, spherical vectors).

[ShortProof], `Lib/GaloisRep/LocalGlobal/IwahoriCompatibility` (`New.IsIwahoriEigen.apply_eq_one_of_principal_unit`, `New.IsIwahoriEigen.exists_hasHeckePolyAt`, `New.GaloisRep.PolyKillsAt.of_mul_frob_pow`, `New.GaloisRep.Attached.local_global_of_eigencharacter_of_unramified`, `New.GaloisRep.Attached.local_global_of_eigencharacter_of_pos`, `New.GaloisRep.Attached.local_global_of_eigencharacter`)

### 8.3 Frobenius and inertia matrices on parahoric eigenspaces

*Origin:* particular to this proof: for a form fixed by the pro-`p` Iwahori group on which a parahoric subgroup acts by
scalars, the matrices of Frobenius and inertia under the representation of its isotypic space satisfy explicit
polynomial relations, and on the image of `T − 1`, for an inertia matrix `T`, Frobenius and the Hecke operator of
`diag(ϖ, 1, …, 1)` satisfy a common trace identity.

*Method of the formal proof:* the eigencharacters of the Iwahori Hecke operators on the span of the form are tamely
ramified characters read off the scalars; 8.2 applied to the products `s·τ^b` gives the relations; the identity of traces
comes from comparing the two sides on the image of `T − 1` for all polynomials `G`.

Let `E` have Weil data, `x` an isotypic space of forms of weight `κ` on `U(n)` with its chosen representation `r_x` (7.4), `w`
split not above `ℓ`, `A` over `w`, `ϖ` a uniformiser and `u` a unit of `E_w` whose local Artin symbols are `s` (with `s⁻¹` an
arithmetic Frobenius) and `τ ∈ I_A`, and `y ≠ 0` in `x` fixed by the pro-`p` Iwahori group at `w`.
(a) If a parahoric subgroup with blocks `b` acts on `y` by scalars, `d_i` is the scalar of the diagonal matrix with `u` in slot
`i`, and slots with equal `d_i` lie in one block, then `F = r_x(s)` and `T = r_x(τ)` commute, `T` is killed by every polynomial
vanishing at all `ι(d_i)`, and there are characters `θ_i` of `E_w^×`, with an exponent of the torus character of `(θ_i)` not
zero on `y`, such that `Π_i (X − ι(θ_i(ϖ)d_i^b))` kills `F·T^b` for every `b ≥ 0`.
(b) If the stabiliser in `GL_n(𝒪_w)` of the first coordinate line modulo `w` acts on `y` by `χ` of the top left entry, with
`χ(u) ≠ 0` and `χ(u)^{n!} ≠ 1`, and `U` is the Hecke operator of the pro-`p` Iwahori double coset of
`diag(ϖ, 1, …, 1)`, then
`tr((T − 1)M)·G(U)y = tr(G(F)(T − 1)M)·y` (through `ι`) for every complex polynomial `G` and every matrix `M`.

*Needs:* 7.4, 8.2; IdelicReciprocityCountsAndCyclotomicClassGroups §2.1 (local Artin map at a place);
IntegralRepresentationsOfGeneralLinearGroups §§6.1, 6.7 (parahoric subgroups, exponents, eigenspaces).

[ShortProof], `Lib/GaloisRep/LocalGlobal/IwahoriCompatibility` (`New.Patching.IsParahoricCompatible`, `New.Patching.isParahoricCompatible_galRep`, `New.Patching.hecke_eq_frob_on_parahoricEigenspace`)

### 8.4 Labelled forms

*Origin:* adapted from local–global compatibility at tame level, away from `ℓ` (Harris and Taylor, *The geometry and
cohomology of some simple Shimura varieties* (2001); Taylor and Yoshida (2007)) and at `ℓ` (Barnet-Lamb, Gee, Geraghty
and Taylor, *Local-global compatibility for l = p, II* (2014), Theorem 1.1): here at a split place, for a
form whose type there is the depth-zero type of a product label (8.1), and for the action of inertia only; the
conclusion is that polynomials built from the roots of the label annihilate inertia elements, which requires no
description of local parameters.

*Method of the formal proof:* by induction over steps of prime degree in which `w` is inert: each step replaces the
label by its Shintani lift over a larger residue field (5.11), and after finitely many steps the polynomial of the label
is a product of linear factors. Then the form is an Iwahori eigenvector whose characters are tamely ramified, and 8.2,
applied to units of `E_w`, yields the killing polynomial; the passage from local Artin symbols of units to tame
exponents (IdelicReciprocityCountsAndCyclotomicClassGroups §§1.4, 2.1) puts it in the stated form.

For a place `A` of `Ω` over `w`, `h ≥ 1` and a faithful character `T` of the multiplicative group of an algebraically closed
extension of `k_w` (as in 8.1), `s ∈ G_E` has *tame exponent* `a` at level `h` if `s ∈ I_A` and, for a uniformiser `π ∈ E` at
`w` and `z ∈ Ω` with `z^{q_w^h − 1} = π`, the unit `s(z)/z` reduces to an element on which `T` takes the value
`exp(2πi/(q_w^h − 1))^a`, the reduction being by a homomorphism from the integers of `Ω` that kills the maximal ideal of `A` and
extends `𝒪_E → k_w`. At every level `h!`, every element of `I_A` has a tame exponent, and some element has tame exponent `1`.
Let `E` be a CM field with Weil data, `f` a form of weight `κ` on `U(n)` (`n ≥ 1`) that is an eigenform for `P`, `r` attached to `P`,
`w` split, and suppose `f` has the product label `(d, c, χ, t)` at `w`. Let `A` lie over `w`. Then (a) `r` is of finite type at
`A`, (b) `r` has the jumps `J_κ` at `A`, and (c) for every `s` of tame exponent `a` at level `d!`, the polynomial
`Π_x (X − ι(T^a(x)))`, over the roots `x` (with multiplicity) of `c·Π_l (X − x_{χ_l})^{t_l}` in the algebraic closure of `k_w`,
kills `s` at `A`.

`RiemannHypothesisForDirichletLFunctions/BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.2` is the depth-zero
comparison away from `ℓ` for regular algebraic polarized cuspidal representations of `GL_n` over a CM field, at a place
of depth zero up to twist where the supercuspidal support is pairwise unlinked, with `N = 0` and the isomorphism class
on inertia; the case above `ℓ` is its §15.1.

*Needs:* 5.11, 8.1, 8.2; 5.1; IdelicReciprocityCountsAndCyclotomicClassGroups §§1.4, 2.1 (tame inertia; local Artin map);
IntegralRepresentationsOfGeneralLinearGroups §§4.4, 5.3, 5.4 (names of characters, labels, Shintani lifts).

[ShortProof], `Lib/GaloisRep/LocalGlobal/LabelCompatibility` (`New.GaloisRep.IsTameExponent`, `New.GaloisRep.IsLabelledAt`, `New.GaloisRep.IsTameExponent.pow_apply_charName`, `New.GaloisRep.exists_isTameExponent`, `New.GaloisRep.Attached.isLabelledAt_one`, `New.GaloisRep.exists_isStepOfLocalChar_inert`, `New.GaloisRep.Attached.isLabelledAt`)

## Layer 9: Taylor–Wiles data and Selmer modules

The lower bound of the argument applies Ribet's method at Taylor–Wiles places to the forms of this roadmap; it needs
integral operators at auxiliary places, and it counts cocycles rather than cohomology classes.

### 9.1 Taylor–Wiles places, the integral Hecke algebra and Higman operators

*Origin:* adapted from the freeness at auxiliary primes in the Taylor–Wiles method (Taylor and Wiles (1995); Clozel,
Harris and Taylor (2008), §3): here the forms are complex forms on the standard definite unitary group with an
integrality condition through `ι`, the auxiliary places carry principal level, the acting group is an arbitrary finite
subgroup `Δ` of `Π_j GL_n(k_{w_j})`, and freeness over `Δ` is weakened to the existence of one operator `Ψ` whose sum of
conjugates under `Δ` is a fixed integer `c`.

*Method of the formal proof:* the forms of principal level at the auxiliary places are functions on a finite set of
double cosets; a weight on the orbits of `Δ`, equal to `c` divided by the order of a stabiliser, defines `Ψ`, and its
conjugates under `Δ` add up to `c`; the Hecke algebra is closed because integrality is a closed condition.

Let `E` be a CM field, `V` the standard definite space of rank `n`, `κ` a weight and `m ∈ ℕ` (in use `m = ℓ^ν`).
*Taylor–Wiles places* are Frobenius data at places `w_j` (`j ∈ J` finite), no two equal or conjugate, with `m | q_{w_j} − 1`. *Base data* are a finite set `S₀` of
places, a space of forms of weight `κ` of a fixed type at `S₀` (kept by every operator commuting with the maximal level at
`S₀ ∪ S̄₀`, and acted on by an open subgroup through a character of its components there), and an integer `c` divisible by
`|U(n)(E) ∩ gK₀g⁻¹|` for all `g`. The forms of *base level* are those of the space fixed by `K₀` acting through its
components away from `S₀ ∪ S̄₀`. For the auxiliary places, off the level (not in `S₀ ∪ S̄₀`, not above `ℓ`, and in each
eigensystem occurring at base level the forms of base level have its eigenvalues there), let `M` be the forms of the type
of principal level at the `w_j`, with the lattice of forms `f` such that, at every `g` whose components at the places
above `ℓ` are integral, the coordinates of `ι(f(g))` are `ℓ`-adic integers.
(a) The functions on the set of eigensystems occurring in `M` whose action keeps the integral forms form a closed
`ℤ̄_ℓ`-algebra; the operators coming from translations at one `w_j` keep the integral forms and commute with it; the action of
`Π_j GL_n(k_{w_j})` keeps the integral forms, consists of such operators, and its fixed forms are those of base level; if an
operator at `w_j` has values fixed by the pro-`p` Iwahori group, every polynomial in a pro-`p` Iwahori Hecke operator composed
with it is again an operator at `w_j`.
(b) For every finite group `Δ` with an injective homomorphism into `Π_j GL_n(k_{w_j})` there is an operator `Ψ` on `M` keeping
the integral forms with `Σ_{g∈Δ} g⁻¹Ψg = c`.

The library has the converse direction of Higman's criterion (identity a norm and `V` projective over `k` gives `V`
projective over `k[G]`), `Rep.projective_of_id_mem_range_norm_linHom`, which is how such an operator is consumed when `c` is
invertible.

`PotentialAutomorphyInfrastructurePartII §§3.2, 3.3` have the forms with values in a lattice over the integers of a
finite extension of `ℚ_ℓ`, on a definite unitary group with the places above `ℓ` split, and the Hecke algebra generated
by the operators `T_w^j` on them; its §3.4 gives freeness over the group ring of an abelian `ℓ`-group when no stabiliser
has an element of order `ℓ`, and its §4.1 Taylor–Wiles data for a residual representation with a chosen eigenspace of
Frobenius. The objects here are different: the forms are complex with an integrality condition through `ι`, the Hecke
algebra consists of the functions on eigensystems whose action keeps the integral forms, the places carry no residual
condition, and (b) holds with no hypothesis on the stabilisers.

*Needs:* 1.2, 7.4, 8.1; AdelicUnitaryGroupsAndAlgebraicModularForms §§1.4, 3.9 (class sums, stabilisers; congruence
levels); IntegralRepresentationsOfGeneralLinearGroups §6.1 (pro-`p` Iwahori operators `U_t`).

[ShortProof], `Lib/GaloisRep/TaylorWiles` (`New.Patching.TaylorWilesPlaces`, `New.Patching.BaseLevel`, `New.Patching.BaseLevel.ellIntegralForms`, `New.Patching.BaseLevel.formsOfLevel`, `New.Patching.BaseLevel.IsOffLevel`, `New.Patching.BaseLevel.heckeAlgebra`, `New.Patching.BaseLevel.isClosed_heckeAlgebra`, `New.Patching.BaseLevel.localOperators`, `New.Patching.BaseLevel.residueRep`, `New.Patching.BaseLevel.mem_formsOfLevel_empty_iff_residueRep_fixed`, `New.Patching.BaseLevel.localOperators.commute_heckeAction`, `New.Patching.BaseLevel.residueRep_mem_localOperators`, `New.Patching.BaseLevel.exists_localOperators_aeval_hecke`, `New.Patching.BaseLevel.exists_higman_operator`)

### 9.2 Selmer modules of cocycles

*Origin:* definitions and conventions.

*Method of the formal proof:* Selmer conditions are linear relations on functions on the Galois group; the modules are
modules of cocycles, not of classes. They stand in for Selmer groups of classes in Galois cohomology with local
conditions; no comparison is used.

Let `O` be a commutative ring, `ρ : G_E → M_n(O)`, `B` an `O`-module, `S` a set of finite places and `L` a set of relations
(finitely supported functions `G_E → M_n(O)`; a function `c : G_E → Bⁿ` *obeys* `R` if `Σ_g R(g)c(g) = 0`).
- The *Selmer module* is the module of locally constant `c : G_E → Bⁿ` with `c(gh) = c(g) + ρ(g)c(h)`, `c = 0` on the inertia
  groups at the places of `Ω` over places not in `S`, and obeying every relation of `L`.
- For `ℓ`, a `ℤ_ℓ`-algebra `Λ` and `e ≥ 0`, the Tate twist `Λ(−e)` is the character `cyc^{−e}`. The *odd module*
  `Ш⁻(E, Λ/ℓ^ν, e)` is the module of `z` in the Selmer module of `Λ(−e)` with coefficients `Λ/ℓ^ν`, unramified outside the
  places over `ℓ`, vanishing on the inertia groups above `ℓ` if `e = 0` and on the elements of the decomposition groups above
  `ℓ` with trivial cyclotomic character if `e ≠ 0`, and odd under `g ↦ cgc` (`c` a fixed complex conjugation) if `e ≠ 0`.
- Over `ℚ`, for `Υ = cyc^e·ψ` with `ψ` a Dirichlet character modulo `N`, the *component* of `Υ` is the module of locally
  constant cocycles for `Υ⁻¹` on `Gal(Ω/ℚ)` with values in `O/l^ν` vanishing at `c` and at every element of
  `Gal(Ω/ℚ(μ_N))` that belongs to the inertia group of some place not above `l`, or that belongs to the decomposition
  group of some place above `l` and has trivial `l`-adic cyclotomic character.
- A Galois character `χ` *comes from* `U(1)` (for sets `S`, `I` of places) if it is locally constant and `χ(Art x) = η(x/x̄)`
  for a character `η` of the finite ideles, trivial on `E^×` and on the ideles that are units off `S ∪ S̄` and congruent to `1`
  at the places of `I` off `S ∪ S̄`.

*Needs:* IdelicReciprocityCountsAndCyclotomicClassGroups §§1.1, 2.2 (places, inertia, cyclotomic character; Artin map).

[ShortProof], `Lib/GaloisRep/Main/SelmerModules` (`New.CMFieldWithRoot5040`, `New.IsFromU1`, `New.twistRep`, `New.selmerModule`, `New.Selmer.tateTwist`, `New.Selmer.shaLocalSet`, `New.Selmer.shaOdd`, `New.cyclotomicPowDirichlet`, `New.OddPart.component`)

### 9.3 Torsion and divisible coefficients

*Origin:* adapted from the published theory of Selmer groups in Galois cohomology, which compares the Selmer group with
coefficients `O/a` with the `a`-torsion of the one with coefficients `Frac(O)/O`: here for the Selmer modules of
cocycles of 9.2, where the module with coefficients `O/a` is the `a`-torsion of the one with coefficients `Frac(O)/O`,
so its length is bounded by the length with divisible coefficients.

*Method of the formal proof:* the conditions of 9.2 (the cocycle relation, local constancy, vanishing on inertia, the
relations of `L`) are conditions on the functions themselves, preserved and reflected by an injective map of
coefficients; so composition with `O/a → Frac(O)/O` identifies the module with coefficients `O/a` with the `a`-torsion
of the one with coefficients `Frac(O)/O`.

Let `O` be a discrete valuation ring, `ρ : G_E → M_n(O)`, `S` a set of places, `L` a set of relations and `a ≠ 0`. For an
injective `f : O/a → B` onto the `a`-torsion of `B`, composition with `f` maps the Selmer module with coefficients `O/a` onto the
`a`-torsion of the Selmer module with coefficients `B`. In particular the Selmer module with coefficients `O/a` has the length
of the `a`-torsion of the Selmer module with coefficients `Frac(O)/O`, and so at most its length, the *divisible Selmer
length*.

*Needs:* 9.2.

[ShortProof], `Lib/GaloisRep/Main/DivisibleSelmerModules` (`New.Selmer.range_selmerModuleMapOfInjective`, `New.Selmer.length_torsionBy_selmerModule_divisibleQuot`, `New.Selmer.length_selmerModule_le_divisibleQuot`, `New.Selmer.divisibleSelmerLength`, `New.Selmer.length_le_divisibleSelmerLength`)

## What the library already provides

- Chebotarev's density theorem, `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, and its consequence that
  every conjugacy class of a finite Galois extension of number fields is the Frobenius class of infinitely many
  unramified primes, `NumberField.Chebotarev.infinite_frobeniusPrimeSet`. The existence form used in 1.2 asks in
  addition for residue degree one over `ℚ`; the passage to open subsets of `G_E` and to places of `Ω` is small.

On Tau Ceti's main branch, later than the revision pinned here:

- the existence form used in 1.2 (every conjugacy class of a finite Galois extension of number fields is the Frobenius
  class of infinitely many unramified primes of residue degree one over `ℚ`):
  `NumberField.Chebotarev.infinite_frobeniusPrimeSet_inter_setOf_inertiaDeg_eq_one`;
- the Hecke polynomial of `GL_n` of 1.1, as a polynomial in the Hecke eigenvalues: `TauCeti.glnHeckePolynomial`.

## Results taken from other roadmaps

- Chebotarev's density theorem (1.2): `ArithmeticGaloisRepresentations §5.1`.
- Local class field theory at a finite place, with the Artin map normalised by Frobenius, its compatibility with norms
  and the image of the units in inertia (8.2, 8.3, 8.4): `ClassFieldTheory §6.1`, `ClassFieldTheory §7.1`, read at
  places of `Ω` through IdelicReciprocityCountsAndCyclotomicClassGroups §2.1.
- Global reciprocity and the cyclic Hasse norm theorem (5.6): `ClassFieldTheory §11.1`, `ClassFieldTheory §13.1`.

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/Lib/GaloisRep`.
- J. Arthur, L. Clozel, *Simple algebras, base change, and the advanced theory of the trace formula*, Ann. of Math.
  Studies 120 (1989).
- T. Barnet-Lamb, T. Gee, D. Geraghty, R. Taylor, *Local-global compatibility for l = p, II* (2014).
- T. Barnet-Lamb, T. Gee, D. Geraghty, R. Taylor, *Potential automorphy and change of weight* (2014).
- D. Blasius, J. Rogawski, *Motives for Hilbert modular forms*, Invent. Math. 114 (1993).
- Boston, Lenstra, Ribet (1991), cited without title.
- S. Chase, D. Harrison, A. Rosenberg, *Galois theory and Galois cohomology of commutative rings*, Mem. AMS 52 (1965).
- G. Chenevier, M. Harris, *Construction of automorphic Galois representations II*, Camb. J. Math. 1 (2013).
- L. Clozel, M. Harris, R. Taylor, Publ. IHES 108 (2008).
- K. Conrad, *Compact subgroups of GL_n(Q̄_p)* (note).
- J. Dieudonné (1944), cited without title.
- M. Emerton, V. Paškūnas, *On the density of supercuspidal points of fixed regular weight*, J. Éc. polytech. Math. 7
  (2020).
- Fayad, Nekovář (2019), cited without title.
- J. Fintzen, S. W. Shin, *Congruences of algebraic automorphic forms and supercuspidal representations*, Camb. J. Math.
  9 (2021).
- M. Harris, D. Soudry, R. Taylor, Invent. Math. 112 (1993).
- M. Harris, R. Taylor, *The geometry and cohomology of some simple Shimura varieties* (2001).
- I. Kaplansky, *The Weierstrass theorem in fields with valuations* (1950).
- J.-P. Labesse, *Fonctions élémentaires et lemme fondamental pour le changement de base stable*, Duke Math. J. 61
  (1990).
- J.-P. Labesse, *Cohomologie, stabilisation et changement de base*, Astérisque 257 (1999).
- J.-P. Labesse, *Changement de base CM et séries discrètes*, in *On the stabilization of the trace formula* (2011).
- J.-S. Li, *Non-vanishing theorems for the cohomology of certain arithmetic quotients*, J. reine angew. Math. 428
  (1992).
- Nekovář, *Eichler–Shimura relations and semisimplicity* (2018).
- J. B. Prolla, *Approximation of Vector Valued Functions* (1977).
- J. B. Prolla, *Topics in Functional Analysis over Valued Division Rings* (1982).
- S. Rallis, *Injectivity properties of liftings associated to Weil representations*, Compositio Math. 52 (1984).
- R. Rouquier, *Caractérisation des caractères et pseudo-caractères*, J. Algebra 180 (1996).
- P. Scholze, *The Langlands–Kottwitz approach for some simple Shimura varieties* (2013).
- Sen, Ann. of Math. 97 (1973).
- J.-P. Serre, *Corps locaux* (1962).
- J.-P. Serre, *Groupes algébriques associés aux modules de Hodge–Tate*, Astérisque 65 (1979).
- S. W. Shin, Ann. of Math. 173 (2011).
- A. Speiser (1919), cited without title.
- R. Taylor, *Galois representations associated to Siegel modular forms of low weight*, Duke Math. J. 63 (1991).
- R. Taylor, A. Wiles, Ann. of Math. 141 (1995).
- Taylor, Yoshida, J. Amer. Math. Soc. 20 (2007).
