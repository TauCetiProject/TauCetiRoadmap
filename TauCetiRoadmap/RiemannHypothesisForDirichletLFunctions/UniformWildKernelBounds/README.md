# Roadmap: uniform wild kernel bounds

**Summary.** For a number field `F`, a prime `ℓ` and an integer `e ≥ 1`, let `Ш¹(F, ℓ, e)` be the group
of classes in `H¹(𝒪_F[1/ℓ], ℚ_ℓ/ℤ_ℓ(−e))`, the Galois cohomology of the maximal extension of `F`
unramified outside `ℓ` and the infinite places, whose restrictions to every place above `ℓ` vanish.
It is finite. For `ℓ` odd, or `F` totally imaginary, it is the Pontryagin dual of the étale wild
kernel `WK^ét_{2e}(F){ℓ} ⊂ H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))`, which for odd `ℓ` is the `ℓ`-primary part of the
wild kernel in `K_{2e}(𝒪_F)`. Over `ℚ`, for every odd `ℓ` and every `e ≥ 1`, `Ш¹(ℚ, ℓ, e)` is dual to all
of `K_{2e}(ℤ){ℓ}`. Over `ℚ(μ_ℓ)`, the dual of `Ш¹(ℚ(μ_ℓ), ℓ, e)` surjects onto `(A/ℓA)(e)`, `A` the
`ℓ`-class group, whose part fixed by `Gal(ℚ(μ_ℓ)/ℚ)` is the `ω^{−e}`-eigenspace of `A/ℓA`; for even `e`
these are the eigenspaces that Vandiver's conjecture predicts to vanish. The roadmap bounds the
logarithmic total

`V(F, t) = Σ_ℓ log ℓ · Σ_{1 ≤ e < t} length_{ℤ_ℓ} Ш¹(F, ℓ, e) = log ∏_ℓ ∏_{1≤e<t} #Ш¹(F, ℓ, e)`,

a sum over **all** primes `ℓ`, including `2`, for abelian fields in the cyclotomic `ℤ₂`-tower,
uniformly in the layer, the prime and the twist. The fields are the *dyadic host fields*
`E_n(M, Q) = ℚ(μ_{2^{n+2}})⁺ · M · ∏_{q∈Q} ℚ(√−q)`, for an abelian field `M`, a layer `n ≥ 0` and a finite
set `Q` of auxiliary primes `q ≡ 3 mod 4`; `E_n(χ, Q)` is the host field of `M = ℚ(χ)`, the field cut out by
a primitive Dirichlet character `χ`, and for `n ≥ 1` its conductor is `N = lcm(2^{n+2}, f_χ) · ∏_{q∈Q} q`.
The first two headline theorems below are for two auxiliary primes, one `≡ 3 mod 8` and one `≡ 7 mod 16`.
Nothing is asserted to vanish, but the total size is controlled: an unconditional substitute for
Vandiver-type vanishing.

The headline theorems are these. `B(χ)` is a finite set of odd primes and `P(χ)` a number, both explicit in
terms of `χ` (0.3).

- *Polynomial bound away from a finite set of primes.* For every primitive `χ` there is `C` such that for
  every layer `n ≥ 2`, every pair `Q = {q, q′}` of primes with `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`, prime to `f_χ`,
  and every `t ≥ 2` with
  `min Q > max(2t + 1, P(χ))`: `Σ_{ℓ odd, ℓ ∉ B(χ)} log ℓ · Σ_{1≤e<t} length Ш¹(E_n(χ, Q), ℓ, e) ≤ (N t)^C`.
  At the primes of `B(χ)` the same total is at most `(N t)^C + C · B`, where `B` bounds the twist sums
  of `Ш¹` over finitely many fixed cyclotomic fields `ℚ(μ_{ℓ^j f_χ})`, `ℓ ∈ B(χ)`.
- *The window theorem.* Fix `χ` and reals `α, κ ≥ 1`, `0 < δ ≤ 1`. There are `J`, `C` and `X₀` such
  that for every `X ≥ X₀` and every pair `Q = {q, q′}` of primes with `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`, `q, q′ ∤ f_χ`,
  `q, q′ > 2X^κ + 1 + P(χ)` and `log q + log q′ ≤ X^{δ/J}`, there is `Y ∈ [X^{1/J}, X^{1/2}]` such that for every
  scale `x ∈ [Y, Y²]`, every layer `n ≥ 2` with `2^n ≤ x^α` and every `2 ≤ t ≤ x^κ`, all the groups
  `Ш¹(E_n(χ, Q), ℓ, e)`, `1 ≤ e < t`, are finite and `V(E_n(χ, Q), t) ≤ (N t)^C + exp(x^δ)`.
- *Tower form.* For every `χ` and `κ, δ > 0` there is `J` such that for every large `k₀` some
  `k ∈ [k₀, J k₀]` has `V(E_n(χ, ∅), ⌊2^{κ n}⌋) ≤ exp(2^{δ n})` for every layer `n ∈ [k, 2k − 2]`.
  This form is the roadmap's own corollary of the window theorem (7.5).

The window is unavoidable in this method: the `2`-part and the parts at the primes of `B(χ)` are
controlled through Iwasawa theory, where each cyclotomic tower has finitely many *exceptional
twists*, near the `ℓ`-adic logarithms of the eigenvalues of a lift of a generator acting on an
Iwasawa module; the window is a range of scales in which every exceptional twist up to `x^κ` is small
enough for the explicit torsion bound of Soulé type. The plus part at the other primes is bounded
by congruences between Eisenstein-type Galois representations and automorphic ones, on unitary
groups in three variables and on the symplectic group of degree four: a Selmer group of a character
is a cotangent module of weight `−1` of a torus-graded deformation ring (in rank four, of its ring of
invariants under one factor of the rank-two torus, graded by the other), bounded by the graded cotangent bound of ReducibilityIdealsAndUltrafilterPatching by the valuations of trace differences at the
two-signed points, which residually reducible automorphy lifting (Layers 3 and 4) makes automorphic and
hence finitely many and polynomially counted.

Some theorems are stated precisely without their route being given here (see the Conventions): the Selmer counts of the patching argument (3.15(c)), the seeds and three clauses of the Hecke ideals of the symplectic problem, with the clause (w2) at the twisted seeds (3.20(d), (e)), the model of the Eisenstein problem relative to the Gaussian field (4.5 (model), with (i) and (ii) of 4.3 for that problem), the rank-three seeds (3.22(d)), the clauses (w1), (w2) of the automorphy statements 3.22(c), 4.2(b), (c) and 4.5(b) and their passage to twists and restrictions (4.7(iv)), two statements of commutative algebra used by the route to the space of symplectic residual lattices (ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, through 3.19(a)), and the automorphic patching data and the adjoint vanishing at regular elements of HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d). The routes of the three headline theorems use them through the plus part in Cases I, II, III and V large; the routes for the `2`-part, the minus part and Cases Z, IV and V small do not.

The roadmap builds on [FrobeniusRestrictedRieszSums](../FrobeniusRestrictedRieszSums/README.md), whose §0.4 defines the dyadic host fields; on [BernoulliBoundsForClassGroupEigenspaces](../BernoulliBoundsForClassGroupEigenspaces/README.md), which, extending [ArithmeticKTheory](../../ArithmeticKTheory/README.md) and [EulerSystemsCyclotomicMainConjecture](../../EulerSystemsCyclotomicMainConjecture/README.md), carries the groups `Ш¹(F, ℓ, e)`, their duality with étale wild kernels, the total `V`, its decomposition into plus, minus and character components, the explicit torsion bound of Soulé type and the minus part of abelian fields by generalized Bernoulli numbers; on [IntegralIwasawaTheory](../../IntegralIwasawaTheory/README.md) for the Ferrero–Washington theorem and ranks of Iwasawa modules in cyclotomic towers; on [ReducibilityIdealsAndUltrafilterPatching](../ReducibilityIdealsAndUltrafilterPatching/README.md), extending [DeformationAndDerivedPatchingAlgebra](../../DeformationAndDerivedPatchingAlgebra/README.md), for the graded cotangent bound and the patching algebra; and on PotentialAutomorphyInfrastructurePartII, with its extension [HeckeIdealsAndTaylorWilesRelations](../HeckeIdealsAndTaylorWilesRelations/README.md), for ordinary Hida theory on definite unitary groups, also at Eisenstein maximal ideals, soluble descent and the vanishing of adjoint Selmer groups. The other suppliers (Galois representations and local–global compatibility, local
deformation rings, Kato's Euler system, among others) are listed in the supplier contracts. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), its window theorem, in the budget form 7.6, bounds the Ш-term in the congruence modules of theta lifts of [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md) and enters the host supply of [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md).

Layer 0 recalls the host fields and defines the components of a Dirichlet character, the bad primes and the
case split. Layer 1 makes Iwasawa theory at one prime explicit: twisted control, growth by at most
the rank per layer, centres and exceptional twists. Layer 2 proves the window theorem for the `2`-part
and the bad primes: a pigeonhole on scales and its application to host fields over any abelian base.
Layer 3 builds the tools of the plus part: counting automorphic representations, global congruence
integers, the graded cotangent bound for deformation models, Selmer groups as tangent vectors,
Bernoulli units for characters of large `2`-power conductor, and the machinery of residually
reducible automorphy lifting without Steinberg places (graded presentations and the passage to normalized
graded models, patching at dimension-one primes, ordinary deformation spaces of sums of characters exchanged by a polarization, frames on the cyclotomic
`ℤ_ℓ`-tower and relative to the Gaussian field, ordinarity, and in rank four the spaces of symplectic residual
lattices over totally real fields with their towers, chains, seeds and Hecke ideals, cusp forms congruent to
Eisenstein series with an auxiliary character of order `ℓ` and the rank-two seeds built from them, and the
conjugate-norm twist of an imaginary quadratic field); its commutative algebra (determinantal sections, propagation along components, patched modules) is that of ReducibilityIdealsAndUltrafilterPatching, extending DeformationAndDerivedPatchingAlgebra. Layer 4
studies three residually reducible deformation problems (unitary of rank three relative to an imaginary
quadratic field and relative to `ℚ(i)`, symplectic of rank four): finiteness, automorphy, the shape of
their points, rigidity and levels. Layer 5 treats the good primes (Cases Z, I, II, III), Layer 6 the bad primes
(Cases IV, V large and V small, and the minus part at the odd primes dividing the degree), and Layer 7 assembles the headline
theorems and the form in which they are consumed.

## Conventions

- `ℓ` is any prime; the tower prime is `2`. Layers 1–2 hold for every prime, and Layer 2 for host fields over
  every abelian field; the case analysis of Layers 5–7 is specific to the cyclotomic `ℤ₂`-tower over
  `ℚ(χ)`, and this is used: the parity of orders of characters separates Cases II and IV, and Case V uses
  characters of large `2`-power conductor.
- In Layers 5–7 a *host field* is `E = E_n(χ, Q)` with `n ≥ 2` and `Q = {q, q′}` a pair of primes with `q ≡ 3 mod 8`,
  `q′ ≡ 7 mod 16`, neither dividing `f_χ`, and `Q` `t`-large (0.3) for the twist range `1 ≤ e < t` under consideration; it is a CM
  field (0.1(v)), with conductor `N = N_n(χ, Q)`. The two residue classes enter through 2.3 only (two, respectively four,
  places above `q`, `q′` in `ℚ(μ_{2^∞})`).
- `Ш¹(F, ℓ, e)` is the group of BernoulliBoundsForClassGroupEigenspaces §6.17: the classes in
  `H¹(G_{F,S}, ℚ_ℓ/ℤ_ℓ(−e))`, `S` the places above `ℓ` and the infinite places, whose restrictions to the
  decomposition groups at the places above `ℓ` vanish; there is no condition at the real places. These
  are the classes unramified outside `ℓ` and trivial at every place above `ℓ` ([FormalProof],
  `Formalism/GaloisCohomology/Statement.lean` (`Formalism.GaloisCohomology.Sha`)). Lengths are
  `Module.length` over `ℤ_ℓ`, valued in `ℕ∞`. For a coefficient ring `O` (the ring of integers of a
  finite extension `Φ` of `ℚ_ℓ`, ramification index `e_O`) an `O`-length is divided by `e_O`.
- `V(F, t)` is the total of BernoulliBoundsForClassGroupEigenspaces §6.17. For fixed `e` only finitely many `ℓ`
  contribute, so `V(F, t)` is a nonnegative real number.
- For a CM field `F` and odd `ℓ`, `Ш⁺(F, ℓ, e)` is the `(−1)^e`-eigenspace of complex conjugation (the
  *plus*, or Vandiver, part) and `Ш⁻(F, ℓ, e)` the `(−1)^{e+1}`-eigenspace (the *minus* part).
- Dirichlet characters are characters of `G_ℚ` through arithmetic Frobenius, `Frob_p ↦ ψ(p)`, with values
  in `ℚ̄_ℓ` through a fixed embedding `ℚ̄ → ℚ̄_ℓ`. `χ_ℓ` is the `ℓ`-adic cyclotomic character and `ω` its
  Teichmüller part. For a Dirichlet character `ψ`, `e ≥ 1` and a finite set `S` of primes containing `ℓ`,
  `V_ℓ(ψ, e; S)` is the normalized length of BernoulliBoundsForClassGroupEigenspaces §6.18's component group `Ш_{ψ,e}(S)`:
  classes in `H¹(G_ℚ, (Φ/O)(ψ⁻¹ χ_ℓ^{−e}))` unramified at every prime and zero on the decomposition groups
  at the primes of `S`. Write `V_ℓ(ψ, e)` for `S = {ℓ} ∪ {p : p | f_ψ}` ([FormalProof],
  `Development/AutomorphicArithmetic/AutomorphicVarieties/CharacterLevelBounds/ShaFamMono.lean` (`UpperTheory.V.Chr.V'`),
  `Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean`
  (`UpperTheory.V.HV.Vlen`)).
- `f_ψ` is the conductor and `o_ψ` the order of `ψ`; `v_ℓ` the `ℓ`-adic valuation, extended to `ℚ̄_ℓ`
  with `v_ℓ(ℓ) = 1`; `log` the natural logarithm. `C`, `c`, `A`, `J` denote constants whose dependence is
  stated in each target. The explicit quantities `B(χ)`, `P(χ)`, `R₁(ℓ, χ)` of 0.3 are fixed choices that serve every
  target below.
- Hodge–Tate weights are those of AutomorphicGaloisRepresentationsPartII: the cyclotomic character has weight `−1`,
  and a regular algebraic `π` of `GL_n` of weight `a` has labelled weights `a_{τ,i} + n − i` ([FormalProof],
  `Development/AutomorphicArithmetic/ThetaCorrespondence/ThetaPairLifts/ThirdPlaceSeries/GaloisRepDefiniteUnitary.lean`
  (`GlobalTheory.GalAut.galoisRep_definiteUnitary_tyz`), `Development/AbelianVarietyTheory/Proofs/DivisorProofs/HasString.lean`
  (`GlobalTheory.GalDef.jumpsOf`)). A character of a local
  Galois group that agrees with `χ_ℓ^m` on an open subgroup of inertia has *cyclotomic exponent* `m` (and Hodge–Tate
  weight `−m`); the exponents of an ordinary representation are those of its graded characters. Statements about
  ordinary characters are made in cyclotomic exponents.
- *Gradings.* For `Ψ = χ_ℓ^e ψ`, the residual representations of Layer 4 are diagonal and are graded by the
  characters of the diagonal torus (modulo the centre) acting by conjugation; the matrix entry `(i, j)` has
  weight `w_i − w_j`. *Unitary case:* basis with `r₀ = diag(Ψ, 1, Ψ⁻¹)`, torus of rank one with cocharacter
  `t ↦ diag(t, 1, t⁻¹)`, `w = (1, 0, −1)`: the entries of weight `−1` are `(2, 1)` and `(3, 2)` and carry the
  character `Ψ⁻¹` (lower triangular), the entry `(3, 1)` of weight `−2` carries `Ψ⁻²`, and the positive
  weights are upper triangular; a point is negative-zero exactly when the representation it carries is upper
  triangular. *Symplectic case:* basis with `r₀ = diag(θ, Ψ, α, 1)` (4.4) and the symplectic form
  `⟨x, y⟩ = x₁y₄ + x₂y₃ − x₃y₂ − x₄y₁`; `GSp₄` and `𝔰𝔭₄` are taken for this form (so `E₃₁ + E₄₂ ∈ 𝔰𝔭₄`, `E_{ij}` the matrix
  units). The diagonal torus modulo the centre has rank two; fix
  the cocharacters `λ(s) = diag(s, 1, s, 1)` and `μ(t) = diag(t, t, 1, 1)`. The entry `(i, j)` has weight
  `(a, b) ∈ ℤ²` if `λ(s)μ(t)` acts on it by `s^a t^b`; it then carries the character `α^aΨ^b`. The roots are
  `±(1, 0)` (`α`: entries `(1, 2)`, `(3, 4)`), `±(−1, 1)` (`β`: entry `(2, 3)`), `±(1, 1)` (`θ`: entry `(1, 4)`) and
  `±(0, 1)` (`Ψ`: entries `(1, 3)`, `(2, 4)`), the negatives on the transposed entries. The graded cotangent bound
  is applied to the graded subalgebra `A = ⊕_n R_{(0,n)}` of `λ`-weight zero (3.3, 4.4), graded by the `μ`-weight `n`, on which
  the `Ψ⁻¹`-entries `(3, 1)`, `(4, 2)` have weight `−1`; there, negative-zero, positive-zero and two-signed refer to
  that grading, and what they mean for representations is 4.6(c). A *point* of a graded model is an `Ē`-point,
  `Ē` an algebraic closure of the fraction field of `O`, and *negative-zero*, *positive-zero* and *two-signed*
  are as in ReducibilityIdealsAndUltrafilterPatching §4.8.
- *Routes not given here.* A target or clause whose route this roadmap does not give is stated precisely and says that its route is not given here, with what the statement is: a theorem of [FormalProof], or a named theorem of the literature; an outline of the mechanism may follow. Every statement is unconditional. A target whose route uses a theorem of the first kind says so in a sentence "The route uses …, whose routes are not given in full (see there)", which names those statements, directly or through the targets indicated; theorems of the literature are cited like suppliers.

**Statements of the formal proof.** Where a target names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof]. [FormalProof] is cited by declaration and file at the commit the References name; `AV/` abbreviates its directory
`src/Development/AutomorphicArithmetic/AutomorphicVarieties/` and `DTC/` the directory
`AV/ModularityArgument/ThresholdArguments/DenseThresholdCases/`.

## Layer 0: host fields, characters and the case split

### 0.1 Dyadic host fields

The dyadic host fields are those of FrobeniusRestrictedRieszSums §0.4 (*dyadic host fields*, its definition and its
API (a)–(f)); this roadmap uses them as defined there, in the following notation. For a finite abelian extension `M` of
`ℚ` with conductor `f_M`, a finite set `Q` of primes with `q ≡ 3 mod 4` and `q ∤ 2f_M`, and `n ≥ 0`, the integer
`N = N_n(M, Q) = lcm(2^{n+2}, f_M)·∏_{q∈Q} q`, the subgroup `H_n(M, Q) ⊂ (ℤ/N)^×` and the field `E_n(M, Q) ⊂ ℚ(μ_N)` are those of
that definition (`μ_N` here is the group generated by its `ζ_N`). For a primitive Dirichlet character `χ`, `E_n(χ, Q)` and
`N_n(χ, Q)` are its `E_n(ψ, Q)` and `N_n(ψ, Q)` for `ψ = χ` (the primitive character called `ψ` there is called `χ` here;
`f_{ℚ(χ)} = f_χ` and `[ℚ(χ) : ℚ] = o_χ`), and its `ℚ_n` is `ℚ(μ_{2^{n+2}})⁺`, the `n`-th layer of the cyclotomic `ℤ₂`-extension.
The clauses of its API are cited here as 0.1(i)–(vi): (i) is its (a), `E_n(M, Q) = ℚ(μ_{2^{n+2}})⁺·M·∏_{q∈Q} ℚ(√−q)`; (ii) its
(b), `Gal(E_n(M, Q)/ℚ) ≅ (ℤ/N)^×/H_n(M, Q)` with the Frobenius at `p ∤ N` the class of `p`; (iii) its (c), the conductor of
`E_n(M, Q)` divides `N_n(M, Q)`, with equality for `n ≥ 1`, and `[E_n(M, Q) : ℚ]` divides `2^{n+|Q|}[M : ℚ]`; (iv) its (d),
`E_n(M, Q) ⊂ E_{n+1}(M, Q)`, `E_n(M, Q) ⊂ E_n(M, Q′)` for `Q ⊂ Q′`, and `E_n(M, Q) = E_0(M, Q)·ℚ(μ_{2^{n+2}})⁺`; (v) its (e), if
`Q ≠ ∅` or `M` is imaginary, `E_n(M, Q)` is a CM field with complex conjugation `σ_{−1}`; (vi) its (f), the characters of
`Gal(E_n(M, Q)/ℚ)` are the Dirichlet characters modulo `N` trivial on `H_n(M, Q)`.
The host fields of Layers 5–7 (Conventions) are these fields with `n ≥ 2` and `Q = {q, q′}`, `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`.

*Definition.* For `E = E_n(M, Q)` and `e ∈ ℤ`, `X(E, e)` is the set of the characters of (vi) with `ψ(−1) = (−1)^e`. *Needs:* FrobeniusRestrictedRieszSums §0.4.

### 0.2 Components of a Dirichlet character

For a Dirichlet character `ψ` modulo `N` with values in a field of characteristic `0` and a prime `r`,
`comp_r ψ` is the restriction of `ψ` to the factor `(ℤ/r^{v_r(N)})^×` of `(ℤ/N)^×` (Chinese remainder
theorem), so `ψ = ∏_r comp_r ψ` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean`
(`UpperTheory.V.HV.comp`)). For a prime `ℓ`, `ψ = ψ_{[ℓ]} ψ^{[ℓ′]}` uniquely with `ψ_{[ℓ]}` of `ℓ`-power order
and `ψ^{[ℓ′]}` of order prime to `ℓ`. The *tame part away from `ℓ`* is `χ_P(ℓ, ψ) = ψ^{[ℓ′]} (comp_ℓ ψ^{[ℓ′]})⁻¹`,
and `c₂(ψ) = v₂(f_{comp₂ ψ})`. Prove uniqueness of these decompositions, multiplicativity in `ψ`,
`f_{comp_r ψ} = r^{v_r(f_ψ)}`, `o_ψ = lcm_r o_{comp_r ψ}`, compatibility with Galois conjugation of the
values, and that `χ_P(ℓ, ψ)` has conductor and order prime to `ℓ`.

*Route.* The Chinese remainder theorem for `(ℤ/N)^×` and the primary decomposition of a finite cyclic
group; the conductor clause by ClassicalArithmeticCompletion §1.6 (a product of primitive characters of coprime levels is
primitive), applied to the components of the primitive character of `ψ`. *Needs:* ClassicalArithmeticCompletion §1.6; Mathlib
`DirichletCharacter`, `ZMod.chineseRemainder`, `orderOf`.

**Checks.**

- `ψ = ε₃ λ₅` modulo `15`, `ε₃` quadratic modulo `3`, `λ₅` of order `4` modulo `5`: at `ℓ = 3`, `ψ^{[3′]} = ψ` and
  `χ_P(3, ψ) = λ₅`.
- `χ_P(ℓ, ψ)` is not `ψ^{[ℓ′]}`: for `ℓ = 5`, `ψ = λ₅`, `ψ^{[5′]} = λ₅` but `χ_P(5, λ₅) = 1`.

### 0.3 The bad primes of a character

For a primitive `χ` let `p_K = p_K(χ)` be the least prime with `p_K ≡ 3 mod 4`, `p_K ≥ 7`, `p_K ∤ f_χ`;
`K_χ = ℚ(√−p_K)` and `h_χ` its class number; `p₁ = p₁(χ)` the least prime `≡ 1` modulo the odd part of `o_χ`
with `p₁ ∤ 2 f_χ p_K`. Put `B(χ) = {3} ∪ {odd primes dividing o_χ f_χ p_K h_χ p₁}` and
`P(χ) = max(f_χ, o_χ, p_K, h_χ, p₁)`. A set `Q` as in 0.1 is *`t`-large for `χ`* if `q > max(2t + 1, P(χ))` for
every `q ∈ Q`. For an odd prime `ℓ` let `d_ℓ` be the order of `ℓ` modulo `4 o′_χ`, `o′_χ` the prime-to-`ℓ` part of
`o_χ`, and `R₁(ℓ, χ) = 16 o_χ (ℓ f_χ)² 4^{v₂(ℓ^{d_ℓ} − 1)}`.

Prove, for every odd `ℓ ∉ B(χ)`, every field `E = E_n(χ, Q)` with `Q` `t`-large, and every `ψ ∈ X(E, e)`:
(a) `ℓ ≥ 5`, `ℓ ∤ o_χ f_χ h_χ` and `ℓ ∉ {p_K, p₁}`; (b) `ℓ ∤ [E : ℚ]`; (c) `ℓ ∤ o_ψ` and `(comp_ℓ ψ)² = 1`; (d) if
`(ℓ − 1) | 2e` for some `1 ≤ e < t`, then `e ≥ 2`, `ℓ ≤ 2t + 1`, `ℓ ∤ N` and `χ_P(ℓ, ψ) = ψ` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/BchiFacts.lean` (`UpperTheory.V.HV.bchiFacts`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/StmtFields.lean` (`UpperTheory.V.pK`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean`
(`UpperTheory.V.HV.Host.Big`)).

*Route.* (b) The odd part of `[E : ℚ]` divides `o_χ` (0.1(iii)). (c) `o_ψ` divides `2^k o_χ`; for `ℓ | N`, either
`ℓ ∈ Q`, where the `ℓ`-component is quadratic, or `ℓ | f_χ`, excluded. (d) `ℓ − 1 ≥ 4` divides `2e`, so `e ≥ 2`
and `ℓ ≤ 2e + 1 < 2t + 1`; then `ℓ < min Q` and `ℓ ∤ f_χ` give `ℓ ∤ N`, hence `comp_ℓ ψ = 1` and
`χ_P(ℓ, ψ) = ψ`. *Needs:* 0.1, 0.2.

**Checks.**

- `χ = 1`: `p_K = 7`, `h_χ = 1`, `p₁ = 3`, so `B(1) = {3, 7}` and `P(1) = 7`.
- `3 ∈ B(χ)` always: for `ℓ = 3`, `(ℓ − 1) | 2e` for every `e`, including `e = 1`.

### 0.4 The case split

For a host field `E = E_n(χ, Q)`, an odd prime `ℓ`, `e ≥ 1` and `ψ ∈ X(E, e)`, the triple `(ℓ, e, ψ)` is in
*Case I* if `ℓ ∉ B(χ)` and `(ℓ − 1) ∤ 2e`; *Case Z* if `ℓ ∉ B(χ)`, `(ℓ − 1) | 2e` and `ψ = 1`; *Case II* if
`e ≥ 2`, the order of `χ_P(ℓ, ψ)` is even, and `ℓ ∈ B(χ)` or `(ℓ − 1) | 2e`; *Case III* if `ℓ ∉ B(χ)`,
`(ℓ − 1) | 2e`, `o_ψ` is odd and `ψ ≠ 1`; *Case IV* if `ℓ ∈ B(χ)`, `e ≥ 2` and the order of `χ_P(ℓ, ψ)` is odd;
*Case V* if `ℓ ∈ B(χ)` and `e = 1`, *large* if `R₁(ℓ, χ) ≤ 2^{c₂(ψ)}` and *small* otherwise. Prove the
coverage theorem: if `Q` is `t`-large and `e < t`, every `(ℓ, e, ψ)` with `ℓ ∉ B(χ)` is in Case I, Z, II or
III, and every one with `ℓ ∈ B(χ)` in Case II, IV or V ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Cases.lean` (`UpperTheory.V.HV.cases`)).

*Route.* For `ℓ ∉ B(χ)` with `(ℓ − 1) | 2e`, 0.3(d) gives `e ≥ 2` and `χ_P(ℓ, ψ) = ψ`; `ψ = 1`, `o_ψ` odd and
`ψ ≠ 1`, `o_ψ` even give Z, III, II. For `ℓ ∈ B(χ)`, `e = 1` is V and otherwise the parity of the order of
`χ_P(ℓ, ψ)` gives II or IV. *Needs:* 0.2, 0.3.

**Checks.**

- `χ = 1`, `Q = {q, q′}`, `ℓ = 5`, `e = 2`: `ψ = 1` is Case Z; the quadratic character of `ℚ(√−q)` is odd, so it
  lies in `X(E, 1)`, not in `X(E, 2)`.
- Without `t`-largeness a good prime `ℓ = q ∈ Q` with `(q − 1) | 2e` would divide `N` and 0.3(d) would fail.

### Examples

- For `χ = 1`: `p_K = 7`, `h_χ = 1`, `p₁ = 3`, so `B(1) = {3, 7}` and `P(1) = 7`; and `3 ∈ B(χ)` for every `χ` (0.3).
- `ψ = ε₃λ₅` modulo `15`, with `ε₃` quadratic modulo `3` and `λ₅` of order `4` modulo `5`: `χ_P(3, ψ) = λ₅`; and `χ_P(5, λ₅) = 1` although `λ₅^{[5′]} = λ₅` (0.2).
- For `χ = 1`, `ℓ = 5` and `e = 2` the trivial character is in Case Z, and the odd quadratic character of `ℚ(√−q)` lies in `X(E, 1)`, not in `X(E, 2)` (0.4).

### Dependencies

From this family: FrobeniusRestrictedRieszSums. Other roadmaps: ClassicalArithmeticCompletion. Mathlib.

## Layer 1: Iwasawa theory at one prime, explicitly

In this layer `ℓ` is a prime, `L` a number field containing `μ_ℓ` (and `μ₄` if `ℓ = 2`), hence totally
complex, `L_∞ = L(μ_{ℓ^∞})`, `Γ = Gal(L_∞/L) ≅ ℤ_ℓ` with a topological generator `γ`, `L_m` the layer with
`[L_m : L] = ℓ^m` and `Γ_m = Γ^{ℓ^m}`. Let `c = c(L)` be maximal with `μ_{ℓ^c} ⊂ L` and `u = χ_ℓ(γ)`, so that
`v_ℓ(u − 1) = c`. Let `X′_∞ = X′_∞(L)` be the Galois group of the maximal unramified abelian pro-`ℓ`
extension of `L_∞` in which every place above `ℓ` splits completely, with `Γ` acting by conjugation
(IntegralIwasawaTheory §3.5, `X′ = X/D_∞`). When `X′_∞(L)` is finitely generated over `ℤ_ℓ`, `R(L)` denotes any
integer `R ≥ 1` such that `X′_∞(L)` is generated by `R` elements.

### 1.1 Twisted control

For every `e ≠ 0` and `m ≥ 0` prove `length Ш¹(L_m, ℓ, e) = length coker(u^{eℓ^m} γ^{ℓ^m} − 1 | X′_∞)`, an equality in `ℕ∞`.
The infinite-level analogue with Greenberg's local condition over `ℚ(μ_{ℓ^∞})^+` is SelmerIwasawaCohomology §4.20.

*Route.* The route constructs an isomorphism `Ш¹(L_m, ℓ, e)^∨ ≅ (X′_∞ ⊗ ℤ_ℓ(e))_{Γ_m}`, of which the statement is the equality of
lengths. IntegralIwasawaTheory §10.5 (`twistedRamified_coinvariants`, with `E = L_m ⊇ μ_{2ℓ}`, `n = −e` and `S` the places
above `ℓ` and the infinite places) identifies `H¹(𝒪_{L_m,S}, ℚ_ℓ/ℤ_ℓ(−e))` with the dual of `𝔛_S(L_∞)(e)_{Γ_m}`. A class is trivial
at `v | ℓ` exactly when its restriction over `L_∞` is, because the decomposition groups of `Γ_m` at the places above `ℓ` are
open and the `H¹` of an open subgroup of `Γ_m` with these coefficients vanishes (its generator acts through the nonzero
scalar `u^{−eℓ^{m′}} − 1`). So the classes trivial above `ℓ` are those whose homomorphism kills the decomposition groups above
`ℓ`, that is, factors through `X′_∞ = 𝔛_S(L_∞)/⟨D_v⟩` (IntegralIwasawaTheory §3.5), and `Ш¹(L_m, ℓ, e)^∨ ≅ (X′_∞ ⊗ ℤ_ℓ(e))_{Γ_m}`.
*Needs:* BernoulliBoundsForClassGroupEigenspaces §6.17; IntegralIwasawaTheory §§0.1–0.3, 3.5, 10.5; ProfiniteCohomology §5.4 and Layer 11.

**Checks.**

- For a regular odd prime `ℓ` and `L = ℚ(μ_ℓ)`, `X′_∞ = 0`, so `Ш¹(ℚ(μ_{ℓ^{m+1}}), ℓ, e) = 0` for all `e ≠ 0`, `m`, in
  agreement with ArithmeticKTheory §7.4 (`K_{2i}(ℤ[ζ_ℓ]){ℓ} = 0` for regular `ℓ`).
- The twist enters as `u^{eℓ^m}`: with `u^{e}` in its place the formula is right at `m = 0` only.

### 1.2 Growth by at most the rank per layer

Let `X` be a `ℤ_ℓ`-module generated by `R ≥ 1` elements and `g` an automorphism of `X` with
`(g − 1)^M X ⊂ ℓX` for some `M`. Put `j₀ = ⌊log_ℓ R⌋ + 3`. Prove that for every `m ≥ j₀`,
`length coker(g^{ℓ^m} − 1) ≤ length coker(g^{ℓ^{j₀}} − 1) + R (m − j₀)` in `ℕ∞` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/AdditiveValuationNorms/Growth.lean` (`UpperTheory.V.PropA.growth`)). For
`X = Λ/(F)` free over `ℤ_ℓ` this is the
inequality form of the cyclotomic growth step of PadicMeasuresIwasawaAlgebras §4.7 (there the growth per layer is exactly
`deg F ≤ R` beyond a cutoff of the same size); 1.2 allows torsion and infinite cokernels.

*Route.* `g` is unipotent on `X/ℓX`, of dimension at most `R`, so `(g − 1)^R X ⊂ ℓX`, and with `ℓ^k ≥ R`,
`(g^{ℓ^{k+1}} − 1)X ⊂ ℓ²X`. For `h` with `(h − 1)X ⊂ ℓ²X` put `N_h = 1 + h + ⋯ + h^{ℓ−1}`: then
`N_h x ∈ ℓx + ℓ²X`, so `ℓX ⊂ N_h X + ℓ(ℓX)` and Nakayama on the finitely generated `ℓX` gives `N_h X = ℓX`, whence
`length coker N_h ≤ length X/ℓX ≤ R`; and `coker(h^ℓ − 1)` has length at most `length coker(h − 1) + length coker N_h`.
Induct on `m`. The argument is pointwise: `X` may have torsion. *Needs:* Mathlib `Module.length`, Nakayama
(`Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`).

**Checks.**

- `X = ℤ_ℓ`, `ℓ` odd, `g = 1 + ℓ`: `coker(g^{ℓ^m} − 1)` has length `m + 1`, growing by exactly `R = 1` per layer.
- `g = 1` gives cokernels of infinite length; the inequality holds in `ℕ∞` and says nothing.

### 1.3 Centres

Let `X` be a `ℤ_ℓ`-module generated by `R ≥ 1` elements, `g` an endomorphism of `X`, `c ≥ 1` (`c ≥ 2` if `ℓ = 2`) and `u ∈ ℤ_ℓ`
with `v_ℓ(u − 1) = c`. Prove that for every
`j ≥ 0` there are `s_1, …, s_R ∈ ℤ_ℓ` (the *centres at level `j`*) such that for every integer `e ≥ 0`,
`length coker(u^{eℓ^j} g^{ℓ^j} − 1) ≤ Σ_{i=1}^R (j + c + v_ℓ(e − s_i))`, with `v_ℓ(0) = ∞` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/AdditiveValuationNorms/ExistsCentresLevel.lean`
(`UpperTheory.V.PropA.exists_centres_level`)).

*Route.* Present `X` as a quotient of `ℤ_ℓ^R` and lift `g` to any matrix `S ∈ M_R(ℤ_ℓ)`; the cokernel of
`w g^{ℓ^j} − 1` is a quotient of that of `w S^{ℓ^j} − 1`, of length `v_ℓ det(w S^{ℓ^j} − 1) = Σ_i v_ℓ(w z_i^{ℓ^j} − 1)`,
`z_i ∈ ℚ̄_ℓ` the eigenvalues of `S`. For `w = u^{ℓ^j}`, `|w^a − w^b| = ℓ^{−(j+c)}|a − b|`, so
`r(e) = ℓ^{j+c}|w^e z_i^{ℓ^j} − 1|` satisfies `|a − b| ≤ max(r(a), r(b))`; the closed balls of `ℤ_ℓ` around the
integers `e` of radius `r(e)` meet pairwise, and an ultrametric Helly lemma (balls of `ℤ_ℓ` meeting pairwise
have a common point, by compactness) gives `s_i` with `r(e) ≥ |s_i − e|` for all `e`. (If `|z_i| = 1` one may take `s_i`
minimising `|w^s − z_i^{−ℓ^j}|` on `ℤ_ℓ`; if `|z_i| ≠ 1`, in particular if `z_i = 0`, every `s_i` works: the ball argument needs
no logarithm.) The bound is for an arbitrary lift: the
determinant can vanish at an integer `e` where the cokernel is finite, which is why exceptional twists are
needed. *Needs:* Mathlib `Matrix.det`, `PadicInt`, compactness of `ℤ_ℓ`.

**Checks.**

- `X = ℤ_ℓ`, `ℓ` odd, `g = α ∈ 1 + ℓℤ_ℓ`, `u = 1 + ℓ`: the length is `j + 1 + v_ℓ(e − s)` with `s = −log α/log u`
  (the `ℓ`-adic logarithm on its disc, IntegralIwasawaTheory §4.1a), so the bound is an equality.
- `X = ℤ_ℓ` presented by two generators with the identity lifted to `diag(1, 0)`: the eigenvalue `0` contributes
  `v_ℓ(−1) = 0` and any centre.

### 1.4 Exceptional twists

In 1.3, fix `j` and its centres; for `Z ≥ 1` let `Exc(Z)` be the set of `e ∈ [1, Z]` with `v_ℓ(e − s_i) > ⌊log_ℓ Z⌋` for
some `i`. Prove `#Exc(Z) ≤ R`, and that every `e ∈ [1, Z] ∖ Exc(Z)` has
`length coker(u^{eℓ^j} g^{ℓ^j} − 1) ≤ R (j + c + log_ℓ Z)` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/Exc.lean` (`UpperTheory.V.Win.exc`)).

*Route.* Two integers of `[1, Z]` congruent to the same `s_i` modulo `ℓ^{⌊log_ℓ Z⌋+1} > Z` are equal; off `Exc(Z)`
use 1.3. *Needs:* 1.3.

### 1.5 Twist bounds over one cyclotomic tower

Assume `X′_∞(L)` is finitely generated over `ℤ_ℓ`, let `R = R(L)` and `j₀ = ⌊log_ℓ R⌋ + 3`. Prove that there are
`s_1, …, s_R ∈ ℤ_ℓ` such that for every `e ≥ 1` and `m ≥ 0`:
(a) `length Ш¹(L_m, ℓ, e) ≤ Σ_i (max(m, j₀) + c + v_ℓ(e − s_i))`;
(b) `length Ш¹(L_m, ℓ, e) ≤ length H²(𝒪_{L_{j₀}}[1/ℓ], ℤ_ℓ(e + 1)) + R · max(0, m − j₀)` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/AdditiveValuationNorms/ExistsCentresLevel.lean`
(`UpperTheory.V.PropA.exists_centres`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/SecondBound.lean` (`UpperTheory.V.Win.ABound`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/NumberFieldTowers/XTwApplyApply.lean` (`UpperTheory.V.Tower.IsTower`)).

*Route.* `γ` acts on the finite group `X′_∞/ℓ` through a pro-`ℓ` group, hence unipotently. Take the centres of 1.3
at level `j₀` for `g = γ` on `X′_∞`; for `m ≥ j₀` add `R(m − j₀)` by 1.2, and transport by 1.1. So the centres, and
the exceptional sets of 1.4, are those of the single layer `j₀`. For (b), 1.2 from the layer `j₀` and
`length Ш¹ ≤ length H²` at `L_{j₀}` (BernoulliBoundsForClassGroupEigenspaces §6.17(c)). *Needs:* 1.1–1.3; BernoulliBoundsForClassGroupEigenspaces §6.17.

### 1.6 Exceptional twists and the explicit torsion bound

Let `C_K` be the absolute constant of BernoulliBoundsForClassGroupEigenspaces §9.7. In 1.5, for `Z ≥ 1`, every `1 ≤ e ≤ Z` and `m ≥ 0`:
`length Ш¹(L_m, ℓ, e) ≤ R (max(m, j₀) + c + log_ℓ Z)` if `e ∉ Exc(Z)`, and
`length Ш¹(L_m, ℓ, e) ≤ 2 exp((2e [L_{j₀} : ℚ])^{C_K} log(2|d_{L_{j₀}}|)) + R m` if `e ∈ Exc(Z)` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/Klen.lean` (`UpperTheory.V.Win.klen`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/GeneratorCountTuples/LemmaK.lean` (`UpperTheory.V.LemmaK`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/ImportsAlt.lean` (`UpperTheory.V.Win.point`)).

*Route.* 1.4 off `Exc(Z)`; on `Exc(Z)`, 1.5(b) and BernoulliBoundsForClassGroupEigenspaces §9.7 at the totally complex `L_{j₀} ⊇ μ_ℓ`, with
`length ≤ 2 log #` for a finite `ℓ`-group. Only the shape `log log #H² ≤ P(e, [L:ℚ])·log(2|d_L|)`, `P`
polynomial, is used. *Needs:* 1.4, 1.5; BernoulliBoundsForClassGroupEigenspaces §9.7.

### Examples

- For a regular odd prime `ℓ` and `L = ℚ(μ_ℓ)`, `X′_∞ = 0`, so `Ш¹(ℚ(μ_{ℓ^{m+1}}), ℓ, e) = 0` for all `e ≠ 0` and `m ≥ 0` (1.1).
- `X = ℤ_ℓ`, `ℓ` odd, `g = 1 + ℓ`: `coker(g^{ℓ^m} − 1)` has length `m + 1`, growing by exactly `R = 1` per layer (1.2).
- `X = ℤ_ℓ`, `ℓ` odd, `g = α ∈ 1 + ℓℤ_ℓ`, `u = 1 + ℓ`: the length of `coker(u^{eℓ^j} g^{ℓ^j} − 1)` is `j + 1 + v_ℓ(e − s)` with `s = −log α/log u`, so the bound of 1.3 is an equality (1.3).

### Dependencies

From this family: BernoulliBoundsForClassGroupEigenspaces. Other roadmaps: IntegralIwasawaTheory, ProfiniteCohomology. Mathlib.

## Layer 2: windows

### 2.1 A pigeonhole on scales

Let `R ∈ ℕ`, `B ≥ 1`, `U > 0` and `T ⊂ ℝ` finite with `#T ≤ R`. Prove that there is `y ∈ [U/(2^{R+2} B^R), U/2]` such
that every `a ∈ T` satisfies `a > 2y` or `B a ≤ y` (for `B > 1` this follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/Window1.lean` (`UpperTheory.V.Win.window1`)).

*Route.* Each `a ∈ T` forbids the `y` with `a/2 ≤ y < Ba`, an interval of logarithmic length `log 2B`; `R` of them
have total logarithmic length `R log 2B`, less than the logarithmic length `(R + 1) log 2 + R log B` of the
admissible range. *Needs:* Mathlib real analysis (`Real.log`), or a direct induction on `R`.

**Checks.**

- `R = 0`: `y = U/2` works.
- `R = 1`, `B = 1`: the range `[U/8, U/2]` has ratio `4` and cannot lie in a forbidden interval of ratio `2`.

### 2.2 Window selection for finitely many towers

Let `C_K` be as in 1.6, enlarged if necessary so that `C_K ≥ 1` (the bound of 1.6 is monotone in `C_K`), `κ ≥ 1`, `0 < δ ≤ 1`,
`R, d ∈ ℕ`, and `J = 2^{R+2}(2 C_K κ/δ)^R`. Let `𝓛` be a finite set of pairs `(ℓ, L)` as in Layer 1 with `X′_∞(L)` finitely
generated, `Σ_{(ℓ,L)∈𝓛} R(L) ≤ R` and `[L_{j₀(L)} : ℚ] ≤ d`. Prove
that for every `X ≥ 2` there is `Y ∈ [X^{1/J}, X^{1/2}]` such that for every `x ∈ [Y, Y²]`, every `(ℓ, L) ∈ 𝓛`, every
`m ≥ 0` and every `1 ≤ e ≤ x^κ`:
`length Ш¹(L_m, ℓ, e) ≤ R(L)(m + j₀(L) + c(L) + κ log_ℓ X) + 2 exp((2d)^{C_K} x^{δ/2} log(2|d_{L_{j₀(L)}}|))` (follows from
[FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/Window.lean`
(`UpperTheory.V.Win.window`), `Development/AutomorphicArithmetic/AutomorphicVarieties/PrimeSetBoundDataOfPrimitiveChar.lean`
(`UpperTheory.V.BConst.J`), `Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/ImportsAlt.lean`
(`UpperTheory.V.Win.point`)).

*Route.* With `Z = ⌊X^κ⌋` the exceptional sets of 1.4 over `𝓛` have at most `R` elements in all. Apply 2.1 to
`U = log X`, `B = 2C_Kκ/δ` and `T = {log e/κ : e exceptional}`: for `log x ∈ [log Y, 2 log Y]` every exceptional
`e` has `e > x^κ` or `e ≤ x^{δ/(2C_K)}`. Non-exceptional `e` by 1.6; exceptional `e ≤ x^{δ/(2C_K)}` by 1.6 with
`(2ed)^{C_K} ≤ (2d)^{C_K} x^{δ/2}`. The exceptional sets depend on `X` and `𝓛` only, so `Y` serves every layer
and every twist range below `x^κ`. *Needs:* 1.4, 1.6, 2.1.

### 2.3 The dyadic base fields and their ranks

Let `M` be a finite abelian extension of `ℚ` with conductor `f_M`, and `Q = {q, q′}` a pair of primes with `q ≡ 3 mod 8`,
`q′ ≡ 7 mod 16`, `q, q′ ∤ f_M`; let `L₀(M, Q) = M(i, √−q, √−q′)`. Prove: (a) `X′_∞(L₀(M, Q))` is finitely generated over `ℤ₂`
and generated by `R₀(M)` elements, a number independent of `Q`: if the Galois group of the maximal unramified abelian
pro-`2` extension of `M(i)(μ_{2^∞})` is generated by `g` elements over `ℤ₂`, then `R₀(M) = 4(g + 6[M : ℚ])` serves; (b)
`[L₀(M, Q) : ℚ] ≤ 8[M : ℚ]` and `L₀(M, Q) ⊂ ℚ(μ_{4f_Mqq′})`, so that `log|d_{L₀(M,Q)}| ≤ [L₀(M, Q) : ℚ] log(4 f_M qq′)`; (c) for
every `n ≥ 2` the host field `E_n(M, Q)` lies in a layer `L_{m′}` of the cyclotomic `ℤ₂`-tower of `L₀(M, Q)` with `m′ ≤ n + 2`
and `[L_{m′} : E_n(M, Q)] ≤ 2`, so that `length Ш¹(E_n(M, Q), 2, e) ≤ 1 + length Ш¹(L_{m′}, 2, e)` for every `e ≥ 1`.

*Route.* (a) Ferrero–Washington for the abelian field `M(i)` makes its Iwasawa module finitely generated
(IntegralIwasawaTheory §§3.4, 5.6). Each quadratic step `√−q` is a cyclic extension of degree `2` of fields
containing the cyclotomic `ℤ₂`-extension, ramified only at the places above `q`. The decomposition group of
`q` in `Gal(ℚ(μ_{2^∞})/ℚ) ≅ ℤ₂^×` is the closed subgroup generated by `q`, of index `2^{v₂(q+1)−1}`, so `q` has
two places in `ℚ(μ_{2^∞})` and `q′` four, hence `q` at most `2[M : ℚ]` places in `M(i)(μ_{2^∞})` and `q′` at most `8[M : ℚ]` in
`M(i, √−q)(μ_{2^∞})`. BernoulliBoundsForClassGroupEigenspaces §11.1 at `p = 2`, iterated over the two quadratic steps from
`A_0 = M(i)(μ_{2^∞})` (totally imaginary, with `rank₂ X(A_0) ≤ g`), bounds the rank by
`4 rank₂ X(A_0) + 4·2[M : ℚ] + 2·8[M : ℚ] = 4(rank₂ X(A_0) + 6[M : ℚ]) ≤ 4(g + 6[M : ℚ])`, and `X′` is a quotient of `X`.
(c) `L_{m′} = E_n(M, Q)(i)`; the kernel of restriction along a quadratic extension has length at most one
(BernoulliBoundsForClassGroupEigenspaces §6.17(d)).
*Needs:* 0.1; IntegralIwasawaTheory §§3.4, 3.5, 5.6 and BernoulliBoundsForClassGroupEigenspaces §11.1;
BernoulliBoundsForClassGroupEigenspaces §6.17.

**Checks.**

- `q ≡ 3 mod 8` has `v₂(q + 1) = 2` and two places above it in `ℚ(μ_{2^∞})`; `q ≡ 7 mod 16` has `v₂(q + 1) = 3` and
  four. Without a bound on `v₂(q + 1)` the number of places, and the rank, are unbounded in `Q`.
- The index `2^{v₂(q+1)−1}` is in `ℤ₂^×`; in `ℤ₂^×/{±1}` the image of `q` has index `2^{v₂(q+1)−2}`.

### 2.4 Window bounds for host families over an abelian base

Let `M` be a finite abelian extension of `ℚ` with conductor `f_M`, `𝔅` a finite set of pairs `(ℓ, L(ℓ))` with `ℓ` an
odd prime and `L(ℓ)` an abelian field containing `μ_ℓ`, and let `α, κ ≥ 1` and `0 < δ ≤ 1`. There are
`J` and `X₀` such that for every `X ≥ X₀` and every `Q` as in 2.3 with `Σ_{q∈Q} log q ≤ X^{δ/J}` there is
`Y ∈ [X^{1/J}, X^{1/2}]` such that for every `x ∈ [Y, Y²]`, every `2 ≤ t ≤ x^κ` and every `n ≥ 2` with `2^n ≤ x^α`:
(a) `Σ_{1≤e<t} length Ш¹(E_n(M, Q), 2, e) ≤ exp(x^δ)`; (b) for every `(ℓ, L(ℓ)) ∈ 𝔅`, with `L′` the layer of height
`j₀(L(ℓ))` of the cyclotomic `ℤ_ℓ`-tower of `L(ℓ)`: `Σ_{1≤e<t} length Ш¹(L′, ℓ, e) ≤ exp(x^δ)`.

*Route.* Apply 2.2 to `𝓛 = {(2, L₀(M, Q))} ∪ 𝔅` with `R = R₀(M) + Σ_{(ℓ,L)∈𝔅} R(L)` (2.3(a); IntegralIwasawaTheory
§§3.4, 5.6 for the fields `L(ℓ)`) and a degree bound depending on `M, 𝔅`, and let `J_*` be the exponent of 2.2 for
these data; put `J = 4J_*`. The window of 2.2 lies in `[X^{1/J_*}, X^{1/2}] ⊂ [X^{1/J}, X^{1/2}]`, and on it `x ≥ X^{1/J_*}`, so the
discriminant of the `j₀`-layer of `L₀(M, Q)` satisfies `log(2|d|) ≪ X^{δ/J} = X^{δ/(4J_*)} ≤ x^{δ/4}`; with 2.3(c), `m′ ≤ α log₂ x + 2` and summation
over `e < t ≤ x^κ` the totals are at most `x^κ(C log x + exp(C x^{3δ/4})) ≤ exp(x^δ)` for `x ≥ X₀^{1/J}`. *Needs:* 2.2,
2.3; IntegralIwasawaTheory §§3.4, 5.6.

**Checks.**

- For `M = ℚ(χ)` and `𝔅 = {(ℓ, ℚ(μ_{ℓ f_χ})) : ℓ ∈ B(χ)}`, the layers `L′` are the fields `ℚ(μ_{ℓ^{j+1} f_χ})` for
  suitable `j = j(ℓ)`: this is the form 7.4 uses.

### Examples

- `R = 0`: `y = U/2` works; `R = 1`, `B = 1`: the range `[U/8, U/2]` has ratio `4` and is not contained in a forbidden interval of ratio `2` (2.1).
- `q ≡ 3 mod 8` has `v₂(q + 1) = 2` and two places above it in `ℚ(μ_{2^∞})`, and `q ≡ 7 mod 16` has `v₂(q + 1) = 3` and four (2.3).
- For `M = ℚ(χ)` and `𝔅 = {(ℓ, ℚ(μ_{ℓ f_χ})) : ℓ ∈ B(χ)}` the layers `L′` of 2.4(b) are the fields `ℚ(μ_{ℓ^{j+1} f_χ})`, the form used in 7.4 (2.4).

### Dependencies

Layers 0 and 1 above. From this family: BernoulliBoundsForClassGroupEigenspaces. Other roadmaps: IntegralIwasawaTheory. Mathlib.

## Layer 3: counting, congruence integers, the graded cotangent bound, Bernoulli units and residually reducible deformation theory

### 3.1 Counting regular algebraic cuspidal representations

Let `K` be a totally real or CM number field and `n ≥ 1`. Prove that there are `c, A > 0` such that for all `M ≥ 1`,
`H ≥ 0`, the number of isomorphism classes of cuspidal automorphic representations `π` of `GL_n(𝔸_K)` with `π_∞`
regular algebraic of weight `λ` in the sense of AutomorphicGaloisRepresentationsPartII AG2.0 (Clozel's normalization,
the one to which Galois representations are attached), `|λ_{τ,i}| ≤ H` for all `τ, i`, and `π^{K(M)} ≠ 0` for the
principal congruence subgroup `K(M)` of `GL_n(𝒪̂_K)`, is at most `c (M(H + 1))^A`. A bound of the same shape holds
for regular `L`-algebraic `π`: they are the twists by `|det|^{(1−n)/2}` of the former, a bijection that preserves the
level and moves the weights by `(n − 1)/2`; the two notions differ only for even `n`. The statement for totally real `K`, for
representations that are not conjugate self-dual and for `n = 1` is the roadmap's own extension, by the route below. It is the
polynomial form, for `GL_n` over totally real and CM fields, of the finiteness ArithmeticLocallySymmetricSpaces ALS.F.6(i).

*The form of the formal proof.* Let `K` be a CM field and `n ≥ 2`. Prove that there are `c, A > 0` such that for all `M ≥ 1`,
`H ≥ 0` and every strictly decreasing `m ∈ ℤⁿ` with `|m_i| ≤ H`, and the infinitesimal character `{m_i + (n − 1)/2}` at every
embedding (the one of the representations whose Galois representations have cyclotomic exponents `m`, 4.8), the number of
isomorphism classes of conjugate self-dual cuspidal automorphic representations `π` of `GL_n(𝔸_K)` with that infinitesimal
character and `π^{K(M)} ≠ 0` is at most `c (M(H + 1))^A` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/IsoOfFrob.lean` (`UpperTheory.V.Af.CardK`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/IsoOfFrob.lean` (`UpperTheory.V.Af.SigK`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/IsoOfFrob.lean` (`UpperTheory.V.Af.infOf`)).

*Route.* `π^{K(M)} ≠ 0` gives `π^{K(3M)} ≠ 0`, and `K(3M)` lies in the neat normal subgroup `K(3)` of `GL_n(𝒪̂_K)`. By
ArithmeticLocallySymmetricSpaces ALS.5b.6 (for `K` totally real or CM), applied to the regular `L`-algebraic twist
`π|det|^{(1−n)/2}`, the twist `π|det|` contributes to the cuspidal cohomology of the connected-compact locally symmetric space of level `K(3M)` with the coefficient system
`ξ` determined by `λ`, which injects into its Betti cohomology (ALS.5b.5); by strong multiplicity one, distinct `π`
give distinct Hecke eigensystems, so the number of `π` is at most the total dimension of that cohomology. ALS.2.4
gives a finite triangulation at the neat level `K(3)` whose cells lift with free action of `K(3)/K(3M)`, so the level
`K(3M)` has `[K(3) : K(3M)] ≤ (3M)^{n²[K:ℚ]}` times as many cells, and the cohomology has dimension at most the number
of cells times `dim ξ`. Weyl's dimension formula makes `dim ξ` polynomial in `H + 1`. This bounds the count for one
weight; sum over the at most `(2H + 1)^{n[K:ℚ]}` weights `λ` with `|λ_{τ,i}| ≤ H`. *Needs:* ArithmeticLocallySymmetricSpaces ALS.1.5, ALS.2.4, ALS.5b.5, ALS.5b.6; AutomorphicFormsOnReductiveGroups §§5.2, 5.5; RepresentationTheory/LieHighestWeight Layer 6
(Weyl's dimension formula), or ClassicalGroups Layer 5 for `GL_n`.

**Checks.**

- `K = ℚ`, `n = 1`: the characters `|·|^w ψ` with `f_ψ | M` and `|w| ≤ H` number at most `φ(M)(2H + 1)`.
- The level-one group `GL_n(𝒪̂_K)` is not neat, and its cells do not lift freely: the count is made at the neat
  level `K(3)`.

### 3.2 Global congruence integers

Let `q > 1` be a power of a prime `p` and `h ≥ 0`. Let `I` and `J` be finite sets on which `Aut(ℂ)` acts, and `s : I → ℚ̄`,
`t : J → ℚ̄` families with `s_{τi} = τ(s_i)` and `t_{τj} = τ(t_j)` for every `τ ∈ Aut(ℂ)`, such that `q^h s_i` and `q^h t_j` are
algebraic integers and `s_i ≠ t_j` for all `i ∈ I`, `j ∈ J`; let `S₀, T₀` bound the absolute values of all `s_i`, `t_j` (by
`Aut(ℂ)`-equivariance these are all their conjugates). Prove:

(a) `NN := ∏_{(i,j)∈I×J} q^h (s_i − t_j)` is a nonzero integer with `log|NN| ≤ #I · #J · (h log q + log(S₀ + T₀))`; for every
prime `ℓ ≠ p` and every embedding `ℚ̄ → ℚ̄_ℓ`, `Σ_{(i,j)∈I×J} v_ℓ(s_i − t_j) = v_ℓ(NN)`, all terms being nonnegative; in
particular `Σ_{j∈J} Σ_{i∈X_j} v_ℓ(s_i − t_j) ≤ v_ℓ(NN)` for any subsets `X_j ⊂ I`. (This abstract form is the roadmap's own;
[FormalProof] states only instances of it. 5.4, 5.7 and 6.4 use it for one family of Frobenius traces and one family of
Eisenstein traces, in the form of the last inequality.)

(b) (*rank three*) A *family of normalized eigenvalue triples at `q`* is a finite set `I` with, for every `τ ∈ Aut(ℂ)`, a
permutation `i ↦ τi` of `I` (for instance an action of `Aut(ℂ)`), and multisets `β(i)` of three algebraic numbers with
`β(τi) = τ(β(i))`, such that **for every `i ∈ I`** the three numbers of `β(i)` have absolute values in `(q^{−1/2}, q^{1/2})` and
product of absolute value `1`. The traces `s_i` of such a family satisfy `|s_i| < √q + 1 + 1/√q` for every `i`, hence so do all
their conjugates (`τ(s_i) = s_{τi}`), while an *Eisenstein trace* `q^{−e}z + 1 + q^e z⁻¹` (`e ≥ 1`, `z` a root of unity) has,
when `q^e ≥ 4`, all conjugates of absolute value `≥ q^e + q^{−e} − 1`; for `q ≥ 5` the two never coincide. The separation
from `q = 5`, with the lower bound for all `q^e ≥ 4`, is the roadmap's own sharpening, by the route below.

(b′) *The form of the formal proof.* For `q` a power of a prime `p ≥ 7`, a number of absolute value at most `√q + 2` is not an
Eisenstein trace. The routes of 5.4 and 6.4 use only this form.

(c) (*rank four*) A *family of eigenvalue quadruples of weight `e + 1` at `q`* is a finite set `I` with permutations `i ↦ τi` as in
(b) and multisets `β(i)` of four algebraic numbers with `β(τi) = τ(β(i))`, such that for every `i ∈ I` the four numbers of
`β(i)` have absolute values in `(q^{e/2}, q^{e/2+1})` and product of absolute value `q^{2(e+1)}`. Its traces satisfy
`|s_i| < 2(q^{e/2+1} + q^{e/2})` for every `i`, while the trace `θ + Ψ + α + 1` of an Eisenstein datum with `|θ| = q^{e+1}`,
`|Ψ| = q^e`, `|α| = q` has absolute value `≥ q^{e+1} − q^e − q − 1`; for `q ≥ 5` and `e ≥ 2` the two never coincide. When
`θ = q^{e+1}z₁`, `Ψ = q^e z₂`, `α = qz₃` with `z_i^k = 1`, the conjugates of the Eisenstein trace number at most `φ(k)` (follows
from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AfStmt.lean`
(`UpperTheory.V.Af.NumberSp4Alt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/CongruenceNumberRankThree.lean`
(`UpperTheory.V.Af.eis4`)).

*Route.* (a) The product over the `Aut(ℂ)`-set `I × J` is fixed by `Aut(ℂ)`, hence rational, and an algebraic integer, hence
an integer; each factor is nonzero; the size bound is termwise; `q` is an `ℓ`-unit, so each `v_ℓ(s_i − t_j)` is
nonnegative and the valuation of the product is the sum. (b) For one member, with `x_j = log_q|β_j| ∈ (−½, ½)` and `Σ_j x_j = 0`,
`|β₁| + |β₂| + |β₃|` is a convex function of the `x_j`, bounded on the closed polytope by its values at the vertices, the
permutations of `(½, 0, −½)`, and strictly inside it: `< √q + 1 + 1/√q`; a conjugate `τ(s_i)` is the trace `s_{τi}` of another
member. `|q^{−e}z + 1 + q^e z⁻¹|²` is `4c² + 2(q^e + q^{−e})c + 1 + (q^e − q^{−e})²` at `c = Re z`, minimal at `c = −1` when
`q^e + q^{−e} ≥ 4`, with value `(q^e + q^{−e} − 1)²`; and `q + q⁻¹ − 1 > √q + 1 + 1/√q` for `q ≥ 5`. (c) For one member, with
`x_j = log_q|β_j| − (e + 1)/2 ∈ (−½, ½)` and `Σ_j x_j = 0`, the sum of the absolute values is a convex function of the `x_j` on a
polytope whose vertices have two coordinates at each end, so `Σ_j |β_j| < q^{(e+1)/2}(2q^{1/2} + 2q^{−1/2}) = 2(q^{e/2+1} + q^{e/2})`; no
pairing of the four numbers is used. At `q = 5`, `e = 2` the two bounds are `60 < 94`, and the gap grows with `q` and `e`. No
purity of Frobenius eigenvalues is used: the absolute values come from the Jacquet–Shalika bound for unitary generic local
components (AL.3.3.8) and the products from unitary central characters, applied in 5.4, 5.7 and 6.4. *Needs:* Mathlib
`Algebra.norm`, `padicValInt`, `IsIntegral`.

**Checks.**

- At `q = 4`, `e = 1`, `z = −1` the Eisenstein trace has absolute value `3.25`, below `√4 + 1 + 1/√4 = 3.5`: the bounds of
  (b) do not separate below `q = 5`; at `q = 5` they are `4.2 > 3.68`.
- The weaker bound `√q + 2` (from `1 + 1/√q ≤ 2`) separates only from `q = 7`: at `q = 5`, `√5 + 2 = 4.24 > 4.2`; at `q = 7`,
  `√7 + 2 = 4.65 < 6.14`. The bound of (b) separates from `q = 5`. In its weaker form (`q ≥ 7`: a number `t` with
  `|t| ≤ √q + 2` is different from every Eisenstein trace) the separation suffices for 5.4 and 6.4, which take `q ≥ 7`.
- The lower bound for Eisenstein traces needs `q^e ≥ 4`: for `q = 2`, `e = 1`, `z = e^{2πi/3}`, `|z/2 + 1 + 2z⁻¹|² = 7/4 < 9/4`; the
  minimum of `|q^{−e}z + 1 + q^e z⁻¹|` over the unit circle is at `z = −1` only when `q^e + q^{−e} ≥ 4`.
- The product condition is needed at every member, not only at one: at `q = 5` let `u` be a root of `X⁴ − X³ − X² − X + 1` on the
  unit circle; its conjugates are `u, ū`, the Salem number `s = 1.7220838…` and `1/s`, all in `(5^{−1/2}, 5^{1/2})`, and
  `(u, u, u)` has product of absolute value `1`, but the conjugate trace `3s = 5.166…` exceeds `√5 + 1 + 1/√5 = 3.683…`. In a
  family the member `(s, s, s)` would have to be present, and its product `s³ ≠ 1` excludes it.
- Indexing by sets instead of families loses the bound used in 5.4: two automorphic representations with the same trace
  at the one Frobenius, or two characters with the same Eisenstein trace, are one element of a set but two factors of
  the inequality of 5.3 summed over the orbit.
- Without the product condition in (c) the bound from the window alone is `4q^{e/2+1}`, which is `100` at `q = 5`, `e = 2`, and
  does not separate from `94`.

### 3.3 The graded cotangent bound for deformation models

Let `O` be a complete discrete valuation ring of characteristic zero with normalized valuation `v`, `Γ` a profinite
group, and `r₀ = diag(χ₁, …, χ_n) : Γ → GL_n(O)` a diagonal representation. Let `T` be a split torus over `O` with character
group `X(T)`, acting on `n × n` matrices through a homomorphism to the diagonal torus, so that the entry `(i, j)` has
weight `w_i − w_j` for a map `w : {1, …, n} → X(T)`, and let `T₁ ⊂ T` be a subtorus of corank one (`T₁ = 1` when `T` has
rank one). An *`X(T)`-weighted presentation* of a complete local noetherian `O`-algebra `R` is a surjection
`O[[t₁, …, t_m]] → R`, each variable `t_i` given a weight in `X(T)`, whose kernel contains the homogeneous components of
each of its elements (the component of weight `χ` of a series is the sum of its monomials of weight `χ`); `R_χ` is the
image of the series all of whose monomials have weight `χ`, and the *graded subalgebra* `R^{gr} = ⊕_χ R_χ ⊂ R` is a direct
sum because the kernel is homogeneous. A *graded deformation model* `(R, x, r, T₁, I)` of `r₀` consists of a complete
local noetherian `O`-algebra `R` with an `X(T)`-weighted presentation; the `O`-point `x : R → O` killing every `t_i` (so
every `R_χ`, `χ ≠ 0`); an ideal `I ⊂ R^{gr}` generated by homogeneous elements whose weights are trivial on `T₁`, with
`x(I) = 0`; and a continuous homomorphism `r : Γ → GL_n(R^{gr}/I)` with `r(g)_{ij} ∈ (R^{gr}/I)_{w_i − w_j}` and `x ∘ r = r₀`;
such that the subalgebra `A = ⊕_{χ|_{T₁} = 1} R_χ` of `T₁`-weight zero, graded through a fixed identification of the
characters trivial on `T₁` with `ℤ`, is with `x|_A` a graded local algebra with a torus-fixed point
(ReducibilityIdealsAndUltrafilterPatching §4.8), generated over `A₀ = R₀` in weights `±1, ±2`. The generators of `I` lie in `A`,
and `I_A := I ∩ A` is the ideal of `A` they generate (take `T₁`-weight-zero components). For `σ ∈ Γ` the trace
`tr r(σ)` lies in `(R^{gr}/I)₀ = A₀/(I_A ∩ A₀)`; let `a_σ ∈ A₀` be any lift of `tr r(σ) − tr r₀(σ)`. Then `x(a_σ) = 0`, and the
values of `a_σ` at the points of `A/I_A` do not depend on the lift. Let `I_A` be generated by homogeneous
`F₀, …, F_r, G, E, E′, Z` as in ReducibilityIdealsAndUltrafilterPatching §4.9. Prove: if `(A, x, I_A)` satisfies (M1)–(M4) of
§4.9 and `ξ(a_σ) ≠ 0` at every two-signed `Ē`-point `ξ` of `A/I_A`, then the two-signed points form finitely many
`𝔾_m`-orbits, `ξ(a_σ)` is constant on orbits, and for every set `𝒯` of orbit representatives

`cotLen_{−1}(F) ≤ 2 · Σ_{ξ∈𝒯} v(ξ(a_σ))`.

When `T₁ = 1` (so `A = R^{gr}`), every `Ē`-point `ξ` of `A/I_A` carries `ρ_ξ := ξ ∘ r`, `ξ(a_σ) = tr ρ_ξ(σ) − tr r₀(σ)`, and
`ρ_{u·ξ} = w(u)ρ_ξ w(u)⁻¹` for the cocharacter `w` identifying `T` with `𝔾_m`. The bound follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/OrbitVanishingLocal.lean` (`UpperTheory.V.Alg.LemmaM`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ModelUpper.lean` (`UpperTheory.V.U3.model_upper`).

*Route.* The diagonal entries of `r` have weight `0`, so the trace lies in the weight-zero part, and `x(a_σ) = 0` because
`x(I) = 0`; (M5) of §4.9 is the hypothesis on `a_σ`, and §4.9(1) gives the finiteness of orbits and the bound; an element of
`A₀` is constant on orbits (§4.8(2)). When `T₁ = 1`, `(u·ξ)(r(g)_{ij}) = u^{w_i − w_j} ξ(r(g)_{ij})`, which is conjugation by
`w(u)`. (M1) requires `r ≥ 1`: when the chart at `x` has no coordinate of weight `−1`, `cot_{−1}(x) = 0` and every
`cotLen_{−1}` vanishes without any hypothesis. The representation lives on `R^{gr}/I`, not on `R`: a homomorphism into
`GL_n(R)` would say that the problem is unobstructed along `R → R^{gr}/I`. *Needs:* ReducibilityIdealsAndUltrafilterPatching
§§4.8, 4.9(1).

**Checks.**

- With `r₀ = diag(χ, 1)`, `T` of rank one and `w = (1, 0)` there is no entry of weight `±2`, so (M1) of §4.9, which needs
  a coordinate of weight `2`, cannot hold: the bound needs rank three, where the entry `(1, 3)` carries `Ψ²`.
- An off-diagonal entry `r(σ)_{12}` has weight `w₁ − w₂ ≠ 0`: replacing the trace by it leaves `A₀`, and (M5) has no
  meaning.
- The subtorus matters in rank four. Grading the symplectic problem of 4.4 by the single cocharacter
  `diag(t, 1, 1, t⁻¹)` puts the `β`-entry `(2, 3)` in weight `0`; a nonzero class `c` for `β` with the local conditions of 4.4
  gives the line of points `diag(θ, [[Ψ, s·cα], [0, α]], 1)`, `s ∈ Ē`; for this cocharacter the `β`-entry has weight `0`, so
  the line lies in the spectrum of the weight-zero ring, which is then not finite over `O`. In the subalgebra `A` of
  `λ`-weight zero of 4.4 the `β`-coordinate enters only through its products with the `α`- and `θ`-coordinates, which
  vanish on this line, so the line maps to the base point of `A`.

### 3.4 Selmer groups as tangent vectors of weight −1

Let `Γ`, `r₀` and a graded deformation model `(R, x, r, T₁, I)` be as in 3.3, with the residue field of `O` finite, and `𝒟` a
deformation problem of `r₀` (lifts
with local conditions, normalized at marked elements so that the infinitesimal conjugations preserving the
normalization are those of `T`). The model is a *model of `𝒟`* if `r` is a lift of type `𝒟` over `R^{gr}/I` whose entries
generate `R^{gr}/I`, and the grading of `R` is the action of `T` by conjugation. Let `φ : Γ → O^×` be a character and `X` a
root vector in the Lie algebra of the group of `𝒟`, of a weight `χ_X` trivial on `T₁` and of degree `−1` in `A`, with
`r₀(g) X r₀(g)⁻¹ = φ(g) X`, and let `g₁` be a marked element with `φ(g₁) − 1 ∈ O^×`. A cocycle `c` for `φ` (with values in any
`O`-module) is *normalized* if `c(g₁) = 0`; as `φ(g₁) − 1` is a unit, every class has exactly one normalized representative
(cohomologous cocycles differ by `g ↦ (φ(g) − 1)y`). Let `𝒮 ⊂ H¹(Γ, (Φ/O)(φ))` be a finite `O`-submodule and `b ∈ O ∖ {0}`
with `b𝒮 = 0`. Since `H⁰(Γ, (Φ/O)(φ)) = 0`, every `s ∈ 𝒮` comes from a unique class with values in
`(b⁻¹O/O)(φ) ≅ (O/b)(φ)`; let `c_s` be its normalized cocycle, so that `s ↦ c_s` is `O`-linear. Assume: for every `s ∈ 𝒮` there
is an `O`-valued point derivation `δ_s` of `R` at `x`, of weight `χ_X`, with `δ_s(I) ⊂ bO` and `δ_s(r(g)) ≡ c_s(g)X r₀(g)` modulo `b`
for all `g ∈ Γ` (entrywise). Prove: the map `D : 𝒮 → Hom_O(A, O/b)`, `s ↦ (δ_s|_A mod b)`, is well defined, `O`-linear and
injective, and `length_O 𝒮 ≤ cotLen_{−1}(F)` for the weight `−1` equations `F` of `A`.

*Route.* `δ_s mod b` kills `I`, so it is an `O/b`-valued point derivation of `R^{gr}/I` at `x`, determined by its values on
the entries of `r`, which generate `R^{gr}/I`; those values are `c_s(g)Xr₀(g)`. So `δ_s mod b` depends only on `c_s`, that is
on `s` (two choices of `δ_s` have the same reduction), `s ↦ δ_s mod b` is `O`-linear because `s ↦ c_s` is, and it is injective
because the coefficient of `X` records `c_s`. The entries of `r` at the position of `X` have weight `χ_X`, trivial on `T₁`, so
they lie in `A`, and injectivity survives the restriction to `A`, where the derivations have weight `−1`. So `D` is an
`O`-linear injective map `𝒮 → Hom_O(A, O/b)` whose values kill `F` and are reductions modulo `b` of the `O`-valued point
derivations `δ_s|_A` of weight `−1`: ReducibilityIdealsAndUltrafilterPatching §4.8(3), in the form of the formal proof
([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/OrbitVanishingLocal.lean`
(`UpperTheory.V.Alg.LemmaM'`): finite
residue field, `D` additive, `x` killing `A_{−1}`), with `c = b` and `M = 𝒮` applies. When
`R^{gr}/I` represents `𝒟`, `δ_s mod b` is the point of `R^{gr}/I` with values in `O[ε]/(bε, ε²)` given by the first-order lift
`(1 + εc_s(g)X)r₀(g)`, and the hypothesis says that this point lifts to an `O`-valued derivation of `R`. *Needs:* 3.3;
ReducibilityIdealsAndUltrafilterPatching §4.8(3); ArithmeticGaloisDuality D7.7 (local conditions with torsion coefficients).

**Checks.**

- In the unitary case the cocycle for `Ψ⁻¹` sits below the diagonal: the upper triangular entry `(1, 2)` has weight `+1`
  and carries `Ψ`, whose classes are not bounded by `cot_{−1}`.
- The lifting hypothesis is not automatic: an `O/b`-valued derivation need not lift when the cotangent module has torsion, which
  is why §4.8(3) is stated for reductions of `O`-valued derivations; with `D` only additive the bound fails for an
  infinite residue field.

### 3.5 Bernoulli units for characters of large dyadic conductor

Let `ℓ` be an odd prime and `d ≥ 1` with `4 | ℓ^d − 1`; put `q = ℓ^d` and `k = v₂(q − 1) ≥ 2`. Let `φ` be a primitive Dirichlet
character of odd conductor `f` with `φ^{q−1} = 1`, and `ξ` a primitive character of conductor `2^m` with `f·4^k ≤ 2^m`, such that
`φ(−1)ξ(−1) = −1`. Put `F = f·2^m` and `B = Σ_{a=1}^{F} φ(a)ξ(a)(a/F − ½)`. Let `𝔽` be the
residue field of the ring of integers `O` of a finite extension of `ℚ_ℓ` containing the values of `φξ`. Prove: (a) `B` is a
unit at every place above `ℓ`; (b) for `φ` primitive of conductor `f` and `γ = (φξ)^{±1}`, viewed residually with values in
`𝔽`: `B_{1,γ⁻¹}` kills the `γ`-coinvariants `(Cl(ℚ(μ_{f·2^m})) ⊗ O)_γ` (the quotient by the `σ − γ(σ)`, which differs from the
`γ`-eigenspace when `ℓ` divides `[ℚ(μ_{f·2^m}) : ℚ]`), and every everywhere unramified class in `H¹(G_ℚ, 𝔽(γ))` is zero (this last
clause: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/LevelCohomology/UnramifiedCocycleIsCoboundaryOfBernoulliUnit.lean`
(`UpperTheory.V.X.CorX`)).

*Route.* (a) Put `N = 2^m`, `s = f·2^k`, `M = 2^{m−k}`; the hypothesis is `s ≤ M`, and gives `M ≥ 2^k ≥ 4`. Let `𝔅` be the ring of
`ℓ`-integral elements with residue in `𝔽_q`; it contains the values of `φ` and `1/N`. *Folding.* For `u ∈ ℤ/N` let
`G(u) = F⁻¹Σ φ(a)a` over `0 ≤ a < F`, `a ≡ u mod N`, and `g(u) = G(u) − G(0)`. The sum `S = Σ φ(a)` over the same range does not
depend on `u` (`a` runs once through the classes modulo `f`), and shifting the summation by `ft` gives
`G(u) − G(u − ft) = t·c − Σ_{0≤a<ft, a≡u} φ(a)`, `c = S/N`; for `ft ≤ N` the last sum is `[ū < ft]·φ(ū)`, `ū ∈ [0, N)` the
representative of `u`. As `g(0) = 0` and every class is a multiple of `f`, all `g(u)` lie in `𝔅`: only `N` is inverted, also when
`ℓ | f`. Since `φξ` is odd, `Σ_u ξ(u) = 0` and `Σ_a φ(a)ξ(a) = 0`, so `B = F⁻¹Σ_{0≤a<F} φ(a)ξ(a)a = Σ_u ξ(u)g(u)`, an `ℓ`-integral
element. *Reduction.* Suppose `B` is not a unit and reduce modulo a prime above `ℓ`: `Σ_u ξ̄(u)ḡ(u) = 0`, with `ḡ(u) ∈ 𝔽_q`, `ξ̄`
multiplicative, zero on even classes, and `ξ̄(1 + N/2) = −1`. *Averaging.* For a unit `y`, `Σ_u ξ̄(u)ḡ(uy) = 0`; the `q^j`-th power
map is additive and fixes `ḡ`, so `Σ_u ξ̄(u)^{q^j}ḡ(uy) = 0`. As `q = 1 + 2^k·(odd)` and `k ≥ 2`, the `q^j` run through the classes
`≡ 1 mod 2^k` modulo `N`; summing `Σ_u ξ̄(u)^{1+2^ki}ḡ(uy) = 0` over `0 ≤ i < N` and dividing by `N` leaves
`Σ_{x∈H} ξ̄(x)ḡ(xy) = 0`, `H = {x : ξ̄(x)^{2^k} = 1}`. *The group `H`.* For `x ∈ H`, `ξ̄(x^{2^k}) = 1`; if `x^{2^k} ≢ 1 mod N`, a power
of it is `≡ 1 + N/2`, where `ξ̄ = −1`; so `x^{2^k} ≡ 1 mod N`, that is `x ≡ ε(x) mod M` with `ε(x) = ±1`. *Two evaluations.* As
`2^k | s`, `1 − s` is a unit and `x(1 − s) ≡ x − ε(x)s mod N` on `H`. By the shift relation with `t = 2^k`, `c′ = 2^kc`: if
`ε(x) = 1`, `ḡ(x) − ḡ(x − s) = c̄′ − [x̄ < s]φ̄(x̄)`, and `x̄ < s ≤ M` forces `x = 1`; if `ε(x) = −1`, `ḡ(x) − ḡ(x + s) = −c̄′ + [ȳ < s]φ̄(ȳ)`
with `y = x + s ≡ s − 1 mod M`, and `ȳ < s ≤ M` forces `ȳ = s − 1`, that is `x = −1`, with `φ(s − 1) = φ(−1)`. Subtracting the
averaged identities at `y = 1` and `y = 1 − s`: `0 = c̄′·Σ_{x∈H} ε(x)ξ̄(x) − φ̄(1)ξ̄(1) + φ̄(−1)ξ̄(−1) = c̄′·Σ_{x∈H} ε(x)ξ̄(x) − 2`. The last
sum is zero: `x ↦ x(1 + N/2)` preserves `H` and `ε` and changes the sign of `ξ̄`. So `2 = 0` in characteristic `ℓ`: absurd.
(b) The conductor of `γ` is `f·2^m`; the integral Stickelberger ideal at that conductor
annihilates the class group (CyclotomicClassGroupsAndStickelberger §§2.3, 2.5), and its smoothed element `(b − [b])θ` acts
on the `γ`-coinvariants through `(b − γ(b))B_{1,γ⁻¹}` (§3.1, character evaluation at conductor `f·2^m`), with `b` prime to
`f·2^m` chosen so that `b − γ(b)` is a unit at `ℓ` (if `ℓ ∤ f`, take `b ≡ 1 mod f·2^m`, `b ≡ 2 mod ℓ`; if `ℓ | f` and no such `b`
existed, `γ` would be residually the character `b ↦ b mod ℓ`, which has no `2`-component, while `ξ` is residually
nontrivial). By (a), applied to `φξ` or to its inverse (a Galois conjugate), with `B = B_{1,φξ}` for primitive `φ`, `B_{1,γ⁻¹}` is a unit, so the coinvariants
vanish. An unramified class in `H¹(G_ℚ, 𝔽(γ))` restricts to a `γ`-equivariant homomorphism from that class group, which
factors through the coinvariants, hence to zero; restriction to `G_{ℚ(μ_{f·2^m})}` is injective because
`H¹(Gal(ℚ(μ_{f·2^m})/ℚ), 𝔽(γ)) = 0` for `γ ≠ 1` (it is killed by `γ(g) − 1` for any `g`). *Needs:*
CyclotomicClassGroupsAndStickelberger §§0.1, 2.3, 2.5, 3.1; DirichletPadicLFunctions §0.4 (generalized Bernoulli numbers);
ClassFieldTheory §13.1.

**Checks.**

- CyclotomicClassGroupsAndStickelberger §3.2 is stated for the `p`-class group of `ℚ(ζ_p)` and the characters `ω^i`; the
  characters here have composite conductor `f·2^m` and are not powers of `ω`.
- When `ℓ | f` the sum `Σ_a φ(a)ξ(a)a`, which is `F·B_{1,φξ}`, is `≡ 0` modulo every prime above `ℓ` for the trivial reason
  `ℓ | F`: the unit property is read from `B = Σ_u ξ(u)g(u)`, in which only `2^m` is inverted.
- `ℓ = 5`, `d = 2` (`k = 3`), `φ` of conductor `455` with components of orders `2, 3, 3` at `5, 7, 13`, `m = 15`:
  `f·4^k = 29120 ≤ 2^{15} < 2f·4^k`, `ℓ | f`, and `B_{1,φξ} = −½Σ_{0<a<F/2} φ(a)ξ(a)` is a unit above `5` for every odd primitive `ξ`
  modulo `2^{15}`.
- The threshold cannot be dropped: `ℓ = 17`, `d = 1` (`k = 4`), `f = 1`, `m = 6`, `ξ` odd with `ξ(5) ≡ 11` modulo a prime above `17`:
  `Σ_{0<a<32, a odd} ξ(a) ≡ 0`, so `B_{1,ξ}` is not a unit; here `f·4^k = 4·2^m`. It is not necessary either: for `m = 7` every
  `B_{1,ξ}` is a unit above `17`.

### 3.6 Framed graded presentations of deformation rings

This is the torus-equivariant form of the presentation of a framed global deformation ring over its local rings,
GlobalGaloisDeformations §3.7 (with §8.4 for polarized problems), for residual representations that are not Schur.

Let `ℓ` be odd, `O` a complete noetherian local ring with finite residue field `k` of characteristic `ℓ`, `X` a free abelian
group of finite rank and `T` the split torus with character group `X`. A *form datum* consists of an invertible matrix `J`,
symmetric or alternating, a partition of `{1, …, n}` into *blocks* with an involution such that `J` pairs each block with its
image, and weights `w : {1, …, n} → X` with `w_a + w_b` constant on the support of `J`; its group `H` consists of the matrices `≡ 1`
(modulo the maximal ideal) that preserve `J` and every block, `𝔥` is its Lie algebra and `ad_χ ⊂ 𝔥 ⊗ k` the part of weight `χ ∈ X`.
Let `Γ` be a profinite group with Mazur's `ℓ`-finiteness condition and `r̄ : Γ → GL_n(k)` with a lift `r₀` over `O`, both
similitudes of `J`, permuting the blocks and commuting with the torus (`r(g)_{ab} = 0` unless `w_a = w_b`); `T` acts on matrices by
conjugation with weight `w_a − w_b` on the entry `(a, b)`. (The problems of Layer 4 are of this kind: the unitary problems through
the group `𝒢_n` of ArithmeticGaloisRepresentations §7.4, a complex conjugation permuting the blocks, and the symplectic problem
with fixed multiplier.) A *frame* consists of finitely many framed places `v` with maps `G_v → Γ`, one of them distinguished
(`v₀`), and finitely many condition places `q` with maps `G_q → Γ`, subgroups `N_q` on which `r̄` is trivial, and local conditions
`L_q` satisfied by `r₀|_{G_q}`: subfunctors of the lifts of `r̄|_{G_q}` cut out by an ideal on every lift, stable under conjugation by `H` and by `T`, such
that every lift in `L_q` over a small quotient lifts to one in `L_q`, and two lifts over `C` with the same image in a small
quotient, one of them in `L_q`, are both in `L_q` exactly when they agree on `N_q`; assume the obstruction spaces below are
finite. Let `B` be the completed tensor product over `O` of the framed lifting rings of the `r̄|_{G_v}` at the framed
places (LocalGaloisDeformationRings §F.2.3), or of `T`-stable quotients of them, with universal lifts `ρ_v`; `T` acts on `B`
by conjugation of the `ρ_v`. An *`X`-weighted presentation relative to `B`* of a complete local `B`-algebra is a surjection
from `B[[t₁, …, t_m]]`, each `t_i` of a weight in `X`, whose kernel is `T`-stable and contains the homogeneous components of
each of its elements. Prove that the functor of framed lifts (lifts `r` of `r̄` with `r(g)r₀(g)⁻¹ ∈ H(C)` for all `g`, satisfying the
`L_q`, with frames `α_v ∈ H(C)`, `α_{v₀} = 1`, such that `α_v⁻¹ r|_{G_v} α_v` is a specialization of `ρ_v`) is represented by a complete
local `B`-algebra `R^□` with an `X`-weighted presentation relative to `B` having, in each weight `χ ∈ X`, `dim_k H¹_c(ad_χ)` variables,
each an entry of `r(s) − r₀(s)` for some `s ∈ Γ` or of some `α_v − 1`, and `dim_k Ob(ad_χ)` relations (at most that many are needed;
the list is padded with zeros), where `H¹_c` is the space of pairs (a cocycle of `Γ` with values in `ad_χ` vanishing on the `N_q`,
vectors `y_v` at the framed places with the cocycle equal on `G_v` to the coboundary of `y_v`, `y_{v₀} = 0`), cocycles and not classes,
and `Ob` the framed two-cocycles modulo framed two-coboundaries ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/FramedTwoCoboundaries.lean`
(`UpperTheory.V.Alg.LemmaP`)).

*Route.* GlobalGaloisDeformations §3.7 (with §8.4 for the polarized case) gives the presentation `B[[x₁, …, x_g]] ↠ R^□` with `g` the
dimension of the relative tangent space, the cone `H¹`, and a kernel generated by at most `dim Ob` elements, the obstruction
classes of lifts to small extensions; the Schur hypothesis there serves only to identify `Ob` with a dual Selmer group, and
representability needs none, because framed lifts with `α_{v₀} = 1` have no infinitesimal automorphisms. The torus acts on
the functor (on lifts and frames by conjugation, on `B` through the `ρ_v`) and is diagonalizable (GlobalGaloisDeformations
§4.5), so its action on the tangent and obstruction spaces is semisimple, the variables and relations of a minimal
presentation can be chosen homogeneous, and the counts hold weight by weight (LocalGaloisDeformationRings §F.0.2 for the
minimal relative presentation). *Needs:* GlobalGaloisDeformations §§3.7, 4.5, 8.4; LocalGaloisDeformationRings §§F.0.2,
F.2.3, F.2.6, F.3.1, 1.4; ArithmeticGaloisRepresentations §7.4; Mathlib `MvPowerSeries`.

**Checks.**

- With `X = 0` the statement is the usual presentation of a framed deformation ring by `dim H¹_c` generators and
  `dim Ob` relations (GlobalGaloisDeformations §3.7).
- Without the frames, for `r̄ = Ψ̄ ⊕ 1 ⊕ Ψ̄⁻¹` the groupoid of lifts has the automorphisms `1 + ε·diag(a, 0, −a)` over `k[ε]`, so
  the usual criterion for representability of the deformation functor does not apply; the frames (and in Layer 4 the
  marked elements) remove these automorphisms. Automorphisms alone do not make a functor nonrepresentable: for a finite
  cyclic group of order prime to `ℓ` and a sum of distinct Teichmüller characters the same automorphisms exist, but every
  lift is conjugate to the Teichmüller lift and the functor of deformation classes is represented by `O`.

### 3.11 Ordinary deformation spaces of sums of characters exchanged by a polarization

*Setting.* `L` is a CM field with maximal totally real subfield `L⁺`, `d = [L⁺ : ℚ]` and `η_{L/L⁺}` the character of `L/L⁺`; `ℓ`
is an odd prime such that every place `v` of `L⁺` above `ℓ` splits in `L` and `μ_ℓ ⊄ L⁺_v` (local degrees `d_v`, `Σ_v d_v = d`).
`k` is a finite field of characteristic `ℓ`, `O` a complete discrete valuation ring with residue field `k`, and
`Ψ̄ : G_{L⁺} → k^×` a character trivial at the complex conjugations. `Γ` is the quotient of `G_{L⁺}` by the closed normal
subgroup generated by the elements `g` of inertia groups at places not above `ℓ` with `Ψ̄(g) = 1` and `η_{L/L⁺}(g) = 1` (so
(tame) below holds for every representation of `Γ`, and `Γ` is ramified, outside `ℓ`, only where `Ψ̄` or `η_{L/L⁺}` is, through a
group of order prime to `ℓ`); `Ψ̄` factors through `Γ`. All cohomology groups of `Γ` and of `G₀` below are those of this
group: their classes vanish on those inertia elements. `G₀ ⊂ Γ` is the image of `G_L` (of index two), `c ∈ Γ` a complex
conjugation and `g* := cg⁻¹c⁻¹` for `g ∈ G₀`; for `v | ℓ`, `G_v ⊂ G₀` is a decomposition group at a place of `L` above `v`, `I_v`
its inertia group and `N_v := I_v ∩ ker χ_ℓ`; `g₀ ∈ G₀` is an element with `Ψ̄(g₀)² ≠ 1`, and `n ∈ {2, 3}` with weights `w = (1, −1)`, resp. `(1, 0, −1)`. The *frame conditions* are: (F1) `ω|_{G_L}` is not a power of
`Ψ̄|_{G_L}` (in particular `ω`, `ωΨ̄^{±1}`, `ωΨ̄^{±2}` are nontrivial on `G_L`); (F2) `Ψ̄² ≠ 1` on every `G_v`, `v | ℓ`; (F3) `Ψ̄` is
trivial on every `N_v`. The *strict* `H¹` of a character `γ` of `Γ` (or of `G₀`) is the group of classes in `H¹(Γ, k(γ))` (or
`H¹(G₀, k(γ))`) whose restrictions to the decomposition groups above `ℓ` vanish; `C₀` is an integer bounding the
`k`-dimensions of the strict `H¹` of `Ψ̄⁻²η_{L/L⁺}` over `Γ` and of `Ψ̄⁻¹` over `G₀`, and of `Hom(Γ, k)`. The *class conditions* are:
the strict `H¹` over `Γ` of `Ψ̄⁻²η_{L/L⁺}` and that of `Ψ̄⁻¹η_{L/L⁺}` are both nonzero. A *lift* over a complete
local `O`-algebra `C` with residue field `k` is a pair `(r, (ψ_{v,i}))` of a continuous homomorphism `r : G₀ → GL_n(C)` and
continuous characters `ψ_{v,i} : G_v → C^×` (`v | ℓ`, `0 ≤ i < n`) such that (pol) `r(g*) = J ᵗr(g) J` for `g ∈ G₀`, `J` the
antidiagonal matrix with entries `1`; (diag) `r(g₀) − r(g₀*)` is diagonal; (ord) `(r(g₁) − ψ_{v,0}(g₁))⋯(r(g_n) − ψ_{v,n−1}(g_n)) = 0`
for every `v | ℓ` and all `g₁, …, g_n ∈ G_v`; (tame) `r(g) = 1` for every `g ∈ G₀` in an inertia group at a place not above `ℓ`
with `Ψ̄(g) = 1`; and `r ≡ diag(Ψ̄^{w_i})`, `ψ_{v,i} ≡ Ψ̄^{w_i}|_{G_v}` modulo the maximal ideal. The
*weight algebra* `Λ` is the completed tensor product over `O` of the universal rings of the characters `ψ_{v,i}|_{I_v}` lifting
`Ψ̄^{w_i}|_{I_v}` (LocalGaloisDeformationRings §1.3), a power series ring in `nd` variables over `O`.

Prove that there are absolute constants `a₁, a₂, a₃` (independent of `L`, `ℓ`, `Ψ̄`, `n` and `C₀`) such that, calling the frame
*big* when `d > a₁C₀ + a₂` and `d_v ≥ a₃` for every `v | ℓ` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/ContinuousCoboundaries2.lean`
(`UpperTheory.V.Fr.Frame.Big`)):

(a) (*the space*) under (F1)–(F3) and the class conditions, the functor of lifts is represented by a complete local noetherian
`O`-algebra `R`; the closure `B ⊂ R` of the
algebra generated by the monomials of weight zero in the entries and by the values of the `ψ_{v,i}` is complete local, with
`Λ → B` given by the `ψ_{v,i}|_{I_v}`, and `A = B[r(g)_{ij}]` is a `ℤ`-graded `B`-algebra of finite type, the entry `(i, j)` of
weight `w_i − w_j`, with homogeneous minimal primes and `Spec A → Spec B` the quotient by the torus. (Representability alone
needs neither (F1)–(F3) nor the class conditions; in [FormalProof] the existence of the space, the completeness of `B` and the
homogeneity of the minimal primes are stated under them, and that is the form used below.) In `Spec A`: the *upper*
(*lower*) *triangular locus* is cut out by the entries below (above) the diagonal; a prime is *off-triangular* if it lies on
neither; for `n = 3` the *block locus* is cut out by the entries of odd weight; a prime is *irreducible* if it is
off-triangular and, for `n = 3`, off the block locus, and *of block type* if it is off-triangular and on the block locus;
the *coincidence locus* at `v` for `i ≠ j` is cut out by the `ψ_{v,i}(g) − ψ_{v,j}(g)`, `g ∈ N_v`. The *core* is the set of
primes of `A` over the closed point of `B` that are not on the upper triangular locus; its points over a field are the
nonsplit lower triangular residual lattices with semisimplification `⊕Ψ̄^{w_i}`. For a closed point `x` of `A` over the
closed point of `B`, `R_x` is the complete local ring of `A` at `x` (over an unramified extension `O′` of `O`).

(b) (*presentations*) under (F1)–(F3) and the class conditions, at every closed point `x` over the closed point of `B`,
`R_x ≅ O′[[x₁, …, x_N]]/(f₁, …, f_{N′})` with
`N − N′ ≥ nd + 1`; and at a point `x` on the block locus (`n = 3`), `R_x` has a `ℤ/2`-graded presentation, by the parity of the
weight, with at least `3d + 1` more even variables than even relations and, after adding zero relations, as many odd
relations as odd variables, the odd variables generating the ideal of the block locus ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/HasObs.lean` (`UpperTheory.V.Fr.pres`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/Integral.lean` (`UpperTheory.V.Fr.Space.Loc.Pres`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/Integral.lean`
(`UpperTheory.V.Fr.Space.Loc.EPres`)).

(c) (*small loci*) under (F1)–(F3) and the class conditions, at every closed point `x` of the core the upper triangular locus
does not pass through
`x`, the lower triangular locus of `R_x` has dimension `≤ (n − 1)d + a₁C₀ + a₂`, and the fibre of `R_x` over the closed point of
`B` has dimension `≤ 2C₀`; and at every closed point `x` over the closed point of `B`, if `P` is an off-triangular prime of `R_x`
containing the image of an ideal `M ⊂ B` with `B/M` finite over `Λ`, a coincidence at `v` modulo `P` gives
`dim R_x/P + d_v ≤ nd + a₃`, and `dim R_x/P + d_v ≤ nd + a₃ − 1` if moreover `ϖ ∈ P` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/CharpolyCoeffsInSubalgebra.lean`
(`UpperTheory.V.Fr.l51`)).

(d) (*nice primes*) at a closed point `x` of the core, a prime `p` of `R_x` is *nice* if `dim R_x/p = 1`, `ℓ ∈ p`, `p` is
off-triangular, and no two `ψ_{v,i}` are congruent modulo `p` on `N_v`; if (F1)–(F3) and the class conditions hold and the frame
is big, `M ⊂ B` has `B/M` finite over `Λ`
and an ideal `I ⊃ M R_x` has `dim R_x/I ≥ nd + 1`, then `I` lies in a nice prime ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/PropagationTheoremGL2.lean`
(`UpperTheory.V.Pr.Nice`)).

*Route.* (a) The normalization (diag) leaves the one-dimensional torus `diag(a, a⁻¹)`, resp. `diag(a, 1, a⁻¹)`; the weight-zero
monomials generate the invariants because `r(g₀) − r(g₀*)` is diagonal with pairwise distinct residual entries, so the matrix
units are polynomials in it. (b) `R_x` is the universal ring of lifts of the residual lattice `ρ̄_x` at `x`. By (F2) there is
`s ∈ G_v` at which the residual characters `Ψ̄^{w_i}` are pairwise distinct; for a lift, (ord) at `s` gives a unique full flag of
`r|_{G_v}` with graded characters `ψ_{v,i}`, so the functor of lifts is the functor of representations with a flag at each
`v | ℓ`, and the characters are determined by the representation. Extend `ρ̄_x` to a
`𝒢_n`-valued representation of `Γ` and choose at each `v | ℓ` an element `g_v` with `g_vρ̄_x|_{G_v}g_v⁻¹` upper triangular; the
tangent space is the cone `H¹` of `ad ρ̄_x` with the local subspaces `b_v = g_v⁻¹𝔟g_v` (`𝔟` the upper triangular matrices) plus
one direction of the torus, the obstructions lie in the cone `H²`, and a ring with tangent space `t` and obstruction space
`o` is a quotient of a power series ring in `dim t` variables by `dim o` relations (GlobalGaloisDeformations §§8.3–8.4). The
Greenberg–Wiles formula (ArithmeticGaloisDuality R02.5.1) gives
`h¹_c − h²_c ≥ Σ_v d_v dim b_v − Σ_{w real} dim(ad)^{c_w = 1} = d·n(n+1)/2 − d·n(n−1)/2 = nd` as soon as `Hom_Γ(ad ρ̄_x, ω) = 0`, which (F1) gives (the characters of `ad ρ̄_x` are the
`Ψ̄^{w_i − w_j}`); the cohomology of `Γ` is that of the Galois group of `L⁺` unramified outside `ℓ`, the infinite places and the
places where `Ψ̄` or `η_{L/L⁺}` ramifies, with the condition "zero on the inertia elements killed in `Γ`" at the places not
above `ℓ`, which is balanced (the image of `I_v` in `Γ` has order prime to `ℓ`) and contributes nothing. At a block point the involution `diag(1, −1, 1)` splits tangent and obstruction spaces by parity: the even
part has `dim(b_v ∩ ad₀) ≥ 4`, `dim ad₀^{c = 1} ≤ 1`, excess `≥ 3d`, the odd part `dim(b_v ∩ ad₁) ≥ 2`, `dim ad₁^{c = 1} ≤ 2`,
excess `≥ 0`. (c) At a point of the core the upper triangular entries are not all nilpotent. On the lower triangular locus
the diagonal characters `χ₀` and `χ_{n−1} = (χ₀^c)⁻¹` are exchanged by the polarization, so together they move in the family
of all characters of `G_L` of `ℓ`-power order with the given ramification, of dimension `d + 1` plus the residual ranks
(the ideal is generated, up to radical, by `ϖ`, the `χ₀(s) − 1` for `1 + C₀ + d` generators `s` of the relevant pro-`ℓ` abelian
quotient, and, for `n = 3`, the values of the middle character at `d` inertial generators: a conjugate self-dual character is
determined by its restriction to inertia up to characters unramified everywhere, which have bounded exponent), not in two
families of conjugate self-dual characters; the fibre over the closed point of `B` has dimension
bounded by `2C₀` (extension classes counted by the strict `H¹`). On a coincidence locus two universal characters agree on
`N_v`, whose image in the pro-`ℓ` completion of `G_v^{ab}` has rank `d_v − 1` (local class field theory, `μ_ℓ ⊄ L⁺_v`), `B/M` is
finite over `Λ`, and off-triangular primes have
fibres of dimension at most one over `B` (the torus orbit). (d) Prime avoidance in a noetherian local ring: finitely many
ideals of dimension `≤ nd` (the lower triangular locus and the coincidence loci modulo `(M, ϖ)`, by (c) and bigness) and one
of dimension `≥ nd + 1`. *Needs:* IntegralHeckeAndGaloisDeterminants §§1.1, 1.4; GlobalGaloisDeformations §§8.3–8.4;
ArithmeticGaloisDuality R02.5.1 (the Greenberg–Wiles formula); LocalGaloisDeformationRings §§1.3, 1.7, 1.9; ArithmeticGaloisRepresentations
§7.4; ClassFieldTheory Layer 7 (the local Artin map on units).

**Checks.**

- (F2) is needed in (b): take `L⁺ = ℚ`, `L = ℚ(i)`, `ℓ = 137`, `Ψ̄` an even character of order `4` and conductor `17`, `n = 2`. (F1)
  holds (`ω` is ramified at `137`, `Ψ̄` is not), but `137 ≡ 1 mod 17`, so `Ψ̄` is trivial on the decomposition group at `137` and
  (F2) fails. With `r` the split Teichmüller representation, `ψ_{v,0} = 1` and `ψ_{v,1} = 1 + εz` for a nonzero homomorphism
  `z : G_v → k`, the relation (ord) holds over `k[ε]` (its first factor vanishes), while `ψ_{v,1}` is the graded character of no
  flag of `r|_{G_v}`: the functor has first-order lifts that the cone `H¹` with a Borel subspace does not count.

### 3.12 The block locus in rank three

In 3.11 with `n = 3`, assume (F1)–(F3), the class conditions, and that the frame is big, and let `x` be a closed point of the
core. Let
`A₂ ⊃ B₂ ⊃ Λ₂` be the space of 3.11 with `n = 2` for the same `Ψ̄` (the space of the *corner*, the coordinates `{1, 3}`), and
consider the hypothesis (H₂): there is an ideal `I₂ ⊂ B₂` with `B₂/I₂` finite over `Λ₂` contained in the contraction to `B₂` of
every off-triangular prime of `A₂`. Prove: (a) (*sharp ideal*) if `x` is not on the block locus, every minimal prime of `R_x` is
irreducible and `(0)` is chained in dimension `3d + 1`; if `x` is on the block locus, write the odd relations of 3.11(b) as
`M·Y` for a `g × g` matrix `M` over the maximal ideal and put `𝔰 = (det M)`: every prime off the block locus contains `𝔰`, `𝔰` is
chained in dimension `3d + 1` (ReducibilityIdealsAndUltrafilterPatching §6.10(2)), and every minimal prime of `𝔰` is irreducible or *thick*: of block type, and over its
residue domain there is a nonsplit ordinary extension of the middle character `μ` by the corner `W` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/ChainedOfComap.lean` (`UpperTheory.V.Fr.sharp3`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/Integral.lean`
(`UpperTheory.V.Fr.Space.Loc.Sharp`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/Integral.lean` (`UpperTheory.V.Fr.Chained`)). (b)
(*thick components*) under (H₂), the block components of `R_x` have dimension exactly `3d + 2`, and a thick minimal prime of `𝔰` is a
whole block component. (c) (*finiteness of the block locus*) under (H₂) there is an ideal `I₃ ⊂ B` with `B/I₃` finite over `Λ`
contained in the contraction to `B` of every prime of `A` of block type ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/QuotientHomNonvanishingBound.lean`
(`UpperTheory.V.Fr.l53`)).

*Route.* (a) An odd power series in the kernel without unit linear coefficients is `Σ_j M_jY_j`; Cramer gives
`adj(M)·(M·Y) = det M · Y`, so `det M · Y_j = 0` and every prime not containing all `Y_j` contains `det M`; ReducibilityIdealsAndUltrafilterPatching §6.10(2) with
`D = 3d + 1` gives the chain; minimal primes have dimension `≥ 3d + 2`, so they are off-triangular by 3.11(c) (the lower
triangular locus is smaller, the upper one misses `x`). A block-type prime `P ∋ det M` gives a nonzero vector in the kernel
of `M` modulo `P`, hence a derivation `D : R_x → R_x/P` killing the even elements and nonzero on some `Y_j`; the even
entries of the representation modulo `P` plus `D` applied to the odd entries in the column of the middle coordinate form
an ordinary representation, nonsplit because `D ≠ 0` there and `r(g₀)` has distinct diagonal entries. (b) The block locus
parametrizes `W ⊕ μ` with `W` a rank-two lift, a family of dimension at most `2d + 2` by (H₂) (`Λ₂` has dimension `2d + 1`,
plus the torus direction), and `μ` a conjugate self-dual character, a family of relative dimension `d`; `Chained(𝔰, 3d + 1)`
forces minimal primes of dimension `≥ 3d + 2`, so a thick minimal prime fills a block component. (c) Over the block locus the
corner with the characters `ψ_{v,0}, ψ_{v,2}` is a rank-two lift, giving a map from `B₂` to the invariants of the block locus;
take `I₃` the preimage of the image of `I₂` (the corner of a prime of block type is off-triangular); the middle character,
trivial on inertia at `ℓ` modulo `I₃` and the weight ideal, has finite exponent. *Needs:* 3.11; ReducibilityIdealsAndUltrafilterPatching §6.10.

### 3.13 The space of residual lattices

In 3.11, assume (F1)–(F3) and the class conditions (for `n = 2` the route uses only the class for `Ψ̄⁻²η_{L/L⁺}`).
(The entry `a` of weight `−2` carries `Ψ̄⁻²` on `G₀`, and the polarization `a(g*) = a(g)` makes it a cocycle of `Γ` for
`Ψ̄⁻²η_{L/L⁺}` when the entries of weight `−1` vanish. In rank three the entry `y` at `(2, 1)` is a cocycle for `Ψ̄⁻¹` on `G₀`, the
entry `(3, 2)` is `g ↦ y(g*)`, and `a(gh) = Ψ̄(h)a(g) + y(g*)y(h) + Ψ̄(g)⁻¹a(h)`; the polarization puts no eigenspace condition on
`y`, but for `y` in the `η_{L/L⁺}`-eigenspace an entry `a` exists, by an explicit quadratic formula (`ℓ` odd). A class for `Ψ̄⁻¹`
alone does not make the core nonempty in rank two; a class for `Ψ̄⁻²` alone leaves the core inside the block locus in rank
three.) Prove: the
core (3.11(a)) is nonempty and preconnected (for `n = 2`, preconnectedness: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/PreconnectedRankTwo.lean`
(`UpperTheory.V.Fr.preconnected_rank_two`)); closed points are dense in every
locally closed subset of it; for `n = 3` the core lies in the closure of its part off the block locus; every homogeneous
prime of `A` off the upper triangular locus lies in a closed point of the core; and for a prime `Z` of `B` and an
irreducible prime `ξ` of `A` over a prime containing `Z` there are a closed point `x` of the core and an irreducible prime
`P` of `R_x` over `Z` with `dim R_x/P = dim B/Z + 1` (*seeds are local components*).

*Route.* In rank two a point of the core over a field `K` is `[[Ψ̄, 0], [a, Ψ̄⁻¹]]` with `a ≠ 0` in the space of cocycles
satisfying the polarization and the ordinary conditions; a base point `b` exists by the hypothesis, and the prime `η` of `A`
that is the kernel of the `K[X]`-valued point with lower entry `(1 − X)a + Xb` lies in the prime of `a` (`X = 0`) and in that of
`b` (`X = 1`); `η` is in the core because it lies in a point of the core; so every point of the core is joined to the base
point inside the closure of one point of the core (only the generic point of the line is used: for `a = −b` the member at
`X = ½` is split and is not in the core). Rank three: a point of the core over a field is a pair (a cocycle `y` for the entries of weight `−1`, a cochain `a` for
the entry of weight `−2`, with the relation above); the class for `Ψ̄⁻²η_{L/L⁺}` gives a block point `(0, b)`; the set of points is
stable under `(y, a) ↦ (ty, t²a + b′)` for `b′` a polarized cocycle of the corner; every point `(y, a)` is joined to `(0, b)` by the
curve `X ↦ (Xy, X²a + (1 − X)b)`, and the class for `Ψ̄⁻¹η_{L/L⁺}` gives a point `(y₀, a₀)`, `y₀ ≠ 0`, such that
`X ↦ (Xy₀, X²a₀ + a)` is a point off the block locus specializing to the block point `(0, a)`. If `η` is homogeneous and the entries below the diagonal are nilpotent
modulo `η + 𝔪_B A`, high powers of them lie in `η + 𝔪_B A_j`, and graded Nakayama puts them in `η`: the torus contracts every
component to the closed fibre. Seeds: a homogeneous irreducible prime of transcendence degree one over `Z`, then the
contraction. *Needs:* 3.11, 3.12.

### 3.14 Frames on the cyclotomic `ℤ_ℓ`-tower

*General position.* A datum `(K, Ψ, M, H)` is in *general position* if: `K` is an imaginary quadratic field with character `η_K`
unramified at `ℓ`, `ℓ` odd; `M` is an integer divisible by `2ℓ`; `Ψ : G_ℚ → O^×` is a continuous character with reduction `Ψ̄`;
`η_K` and `Ψ̄` are trivial on `G_{ℚ(μ_{M^a})}` for some `a`; `Ψ̄(c) = 1`; `Ψ̄` is a power of `ω` on the inertia at `ℓ`; `K` is not
contained in the field cut out by `ω` and `Ψ̄`; there is `s` in a decomposition group at `ℓ` with `η_K(s) = 1` and `Ψ̄(s)² ≠ 1`; and
`H/ℚ` is an abelian extension of `ℓ`-power degree, unramified at `ℓ`, such that an inertia element at a prime `p ≠ ℓ` that fixes `H`
and at which `Ψ̄ = 1` also has `Ψ = 1`.

For a datum in general position, prove that there are a prime `w ∤ M`, `w ≡ 1 mod ℓ`, completely split in the field cut out by
`(η_K, Ψ̄, ω)`, a real quadratic field `k₁` that agrees with `K` locally at the primes of `M` and is ramified at a prime not
dividing `M`, and an integer `C₀`, such that for every `m ≥ 0`, with `L_m⁺` the compositum of `k₁`, `H`, the subfield of degree `ℓ`
of `ℚ(μ_w)` and the `m`-th layer of the cyclotomic `ℤ_ℓ`-extension of `ℚ`, and `L_m = L_m⁺K`: `L_m` is abelian over `ℚ` and CM,
`L_m/L_m⁺` is unramified at all finite places and split above `M`, `μ_ℓ ⊄ L⁺_{m,v}` for `v | ℓ`, and `Ψ̄|_{G_{L_m⁺}}`, with
`Γ_m` the group of 3.11 for `L_m⁺` and `Ψ̄|_{G_{L_m⁺}}`, a complex conjugation and the marked element `g₀ = s^{ℓ^a}` (a power of `s` lying in `G_{L_m}`; since
`η_{k₁} = η_K` locally at `ℓ`, `s` fixes `k₁K` locally, the other parts of `L_m` have `ℓ`-power degree, and `Ψ̄(s)` has order prime to
`ℓ`, so `Ψ̄(g₀)² ≠ 1`), satisfies (F1)–(F3) of 3.11 with the constant `C₀` and the class conditions of 3.11; and
`L_m` is big (3.11) for all `m` large. The order of choice is: `k₁` and `w`, then `C₀`, then the layer.

*Route.* `L_m⁺` is cut out by an open subgroup `H₀ ∩ H_w ∩ H_H ∩ H_m` of `Gal(ℚ^{ab}/ℚ)`: `H₀` of index two defining `k₁` (it agrees
with the field of `η_K` at every prime dividing `M` and is ramified at a prime not dividing `M`, so that `L/L⁺` is unramified at
the finite places), `H_w` fixing the degree-`ℓ` subfield of `ℚ(μ_w)`, `H_H` fixing `H` (it absorbs the `ℓ`-power ramification of
`Ψ` away from `ℓ`), `H_m` fixing the `m`-th layer. (F3) holds because `Ψ̄` is a power of `ω` on the inertia at `ℓ`. Ferrero–Washington, in the form "the `ℓ`-rank of the
class group of `E(μ_{ℓ^{m+1}})` is bounded in `m`" for the abelian field `E ∋ μ_ℓ` cut out by `H₀ ∩ H_w ∩ H_H ∩ ker η_K ∩ ker Ψ̄ ∩ ker ω`
(IntegralIwasawaTheory §5.6 with §3.4), bounds the strict `H¹` groups and `Hom(Γ_m, k)` uniformly in `m`: this is `C₀`. The
element `s` stays in the decomposition groups above `ℓ` of `L_m` up to `ℓ`-power index, which does not change `Ψ̄(s)² ≠ 1`,
whence (F2); (F1) holds because `K` is not in the field of `(ω, Ψ̄)` and the layers are linearly disjoint from it. The degree
`d = [L_m⁺ : ℚ]` and the local degrees above `ℓ` grow like `ℓ^m` with a bounded number of places above `ℓ`; take `m` after `C₀`.
*The two classes.* Let `κ = Ψ̄^{−a}η_K`, `a ∈ {1, 2}`, and `S` the set of primes above `ℓ`, primes where `κ` is ramified, and `w`.
`κ` is odd, `κ ≠ ω`, `κ` is nontrivial on the decomposition groups of `S ∖ {w}` (above `ℓ` by the element `s` of general
position), and `κ = ω = 1` on the decomposition group at `w`. Apply the Greenberg–Wiles formula (ArithmeticGaloisDuality
R02.5.1) to the classes of `H¹(G_ℚ, k(κ))` that are unramified outside `S`, zero at the places of `S ∖ {w}`, and unrestricted
at `w`: the global terms, the archimedean term and the terms at `S ∖ {w}` are trivial, and at `w` the term is
`#H¹(G_{ℚ_w}, k)/#H⁰(G_{ℚ_w}, k) = |k|` (`w ≡ 1 mod ℓ`). So this Selmer group is larger than its dual and contains a nonzero
class; it is zero at `ℓ`. On inertia at `w` it is a homomorphism to `k`; such a homomorphism factors through the quotient of
order `ℓ` of the inertia group, which is the inertia group of the subfield of degree `ℓ` of `ℚ(μ_w)`, a subfield of `L_m⁺`; so
it vanishes on the inertia at `w` inside `G_{L_m⁺}`. Elsewhere it vanishes on the inertia elements killed by `κ`. So its
restriction is a class of `Γ_m`, zero at the places above `ℓ`. The restriction is nonzero: `L_m⁺/ℚ` is abelian and `κ` is
nontrivial on `G_{L_m⁺}`, so the kernel of restriction, `H¹(Gal(L_m⁺/ℚ), k(κ)^{G_{L_m⁺}})`, is zero. The class need not be
ramified at `w`, and no condition on `w` beyond those stated is used. This is not the device of a cyclotomic `ℤ_q`-tower with
`q ≠ ℓ` and Washington's theorem. *Needs:* 3.11, 3.13; IntegralIwasawaTheory §§3.4, 5.6; ArithmeticGaloisDuality R02.5.1;
ClassFieldTheory Layers 7, 13; Chebotarev Layer 10.

**Checks.**

- Relaxing the condition at `w` changes (Selmer) − (dual Selmer) from `0` to `1`; either a new class ramified at `w` appears
  or the dual Selmer group shrinks, in which case a class unramified at `w` already existed; both cases give the class.

### 3.15 Patching at dimension-one primes

*Setting.* `L` is a CM field with `L/L⁺` unramified at every finite place and `μ_ℓ ⊄ L` (no hypothesis is made on `μ_ℓ` in the
completions `L_v`), `ℓ` odd, `n ≥ 1`, `d = [L⁺ : ℚ]`, every
place of `L⁺` above `ℓ` split in `L`. Residual data: `n` pairwise distinct characters `χ̄_i` of `G_L` with polarized sum,
residual ordinary characters `ψ̄_{v,i}` at the places `v | ℓ`, a finite set `S` of places of `L⁺` split in `L`, containing those
above `ℓ`, and one auxiliary place `v₀ ∉ S`, split over `L⁺`, of prime norm `p ∉ {2, ℓ}` with `p` unramified in `L`,
with `Nv₀ ≢ 1 mod ℓ`, at which the `χ̄_i` agree and are unramified; the residual pair `(det ⊕χ̄_i, (ψ̄_{v,i}))` is an ordinary
determinant (so that the ring below exists). `B` is the *universal ordinary determinant ring* of these data and `Λ → B` its
weight algebra (HeckeIdealsAndTaylorWilesRelations §3.13a(1)): `B` carries the universal polarized determinant `D` of
`G_L` lifting `det(⊕χ̄_i)` and characters `ψ_{v,i}` satisfying the ordinary relations (the `ψ_{v,i}` have prescribed restrictions to
the `ℓ`-power torsion of `G_v^{ab}`, as in §3.13a(1)). `J ⊂ B` is an ideal with *automorphic
patching data* in the sense of HeckeIdealsAndTaylorWilesRelations §4.2a (for every Taylor–Wiles datum, that is elements `σ_j`
of `G_{L(μ_{ℓ^∞})}` and, for each `N`, places above pairwise distinct places of `L⁺` outside `S`, split in `L`, of norm
`≡ 1 mod ℓ^N`, whose Frobenius elements agree with the `σ_j` on every `χ̄_i` and converge to them, as `N` grows, in a quotient of
`G_{L⁺,S}`: a base module with support `V(J)`, finite free over `Λ`, lifts of the residual eigenvalues and an exponent `e`, given
per datum; for each `N`, an algebra `R_N` carrying an ordinary determinant for the enlarged ramification set (not necessarily
the universal ring), patching modules free of finite rank (which may depend on `N`) over the group rings of the diamond
operators, comparison maps whose two
composites are multiplication by the product `f` of the differences of the ordered Frobenius eigenvalues, and the Taylor–Wiles
relations in the form "`(f·t)^e` kills the patching module" for their trace functions `t`).

*Points.* A *point* is an `O`-algebra map `x : B → K[[T]]`, `K` a finite extension of the residue field `k`, such that `x ∘ D` is the
determinant of a continuous `ρ : G_L → GL_n(K[[T]])` with a symmetric invariant form realizing the polarization, whose
determinant reduces modulo `T` to `det ⊕χ̄_i`, trivial on the tame inertia that `⊕χ̄_i` kills, with a full flag of `ρ|_{G_v}` over `K((T))` with successive characters
`x ∘ ψ_{v,i}` at every `v | ℓ`. Put `G′ = G_{L(μ_{ℓ^∞})}`. The point has (N1) if at every `v | ℓ` the `ψ_{v,i}` are pairwise distinct and
`ψ_{v,i} ≠ ψ_{v,j}χ_ℓ` for `i < j`; (N3) if every nonempty open subset of `G′` contains `σ` with `ρ(σ)` of separable
characteristic polynomial; (N4) if no nonzero `X ∈ M_n(K((T)))` has `χ_ℓ(g)ρ(g)X = Xρ(g)` for all `g` in the decomposition group
at `v₀`. It is of *type I* if `ρ` is absolutely irreducible on `G′`, of *type E* if over `K((T))`, `ρ ≅ r₁ ⊕ r₂` with `r₁, r₂`
polarized, absolutely irreducible on `G′` and `Hom_{G′}(r₁, r₂) = 0`. A prime `q` of `B` is *stable* if some determinant
`det(tr D(g_ih_j))_{1≤i,j≤n²}` (`g_i, h_j ∈ G_L`) is not in `q` (then `D mod q` is the determinant of an absolutely irreducible
representation over an algebraic closure of `κ(q)`), *thick* if it is not stable and
the Cayley–Hamilton quotient of `B[G_L]` by `D`, the ordinary relations and the tame inertia (IntegralHeckeAndGaloisDeterminants
§1.1) is not semisimple at `q` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/UniversalOrdinaryDeterminantRing.lean`
(`UpperTheory.V.W.Point`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/UniversalOrdinaryDeterminantRing.lean`
(`UpperTheory.V.W.UniversalOrdinaryDeterminantRing.IsStable`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/UniversalOrdinaryDeterminantRing.lean`
(`UpperTheory.V.W.UniversalOrdinaryDeterminantRing.IsThick`)).

*Normalized points and Selmer groups.* A point of type I or E is *normalized* if `ρ` is orthogonal for the standard form, block
diagonal of block sizes `(a, n − a)` (`a = n` in type I) with flags adapted to the blocks, and the `K[[T]]`-span of `ρ(G′)`
contains `T^s` times the block-diagonal matrices for some `s`. For a group `Γ_N` (the quotient of `G_L` with ramification allowed at
a Taylor–Wiles set of `q` places `w_j`, of norm `≡ 1 mod ℓ^N`, split over `L⁺`) and a `K[[T]]`-module `X`: `SelZ` is the group of
continuous cocycles `z` of `Γ_N` with values in `M_n(X)` for `ad ρ`, with `z(g^c) = −ᵗz(g)`, zero on the tame inertia outside the
`w_j`, and such that at each `v | ℓ` there is a matrix `Y_v` for which, in the flag, `z(g) − (ρ(g)Y_vρ(g)⁻¹ − Y_v)` is upper
triangular for every `g ∈ G_v` and has zero diagonal for every `g ∈ G_v` whose image in `G_v^{ab}` has `ℓ`-power order; `SelP`, `SelM` are the cocycles with
block-diagonal, resp. block-off-diagonal, values; `κ₁, …, κ_g` is a basis of `SelM` over `K[[T]]` (at level `0`) modulo torsion and
coboundaries. The *paired dual numbers* over `X` are `DD(X, g) = X ⊕ ⊕_j Xε_j ⊕ ⊕_j Xε′_j ⊕ Xη` with `ε_iε′_j = δ_{ij}η` and all other
products of the `ε`, `ε′` zero; `ρ¹ = (1 + Σ_j ε_jκ_j)ρ`. `Sel1` (resp. `Sel2`) is the group of Selmer cocycles for `ad ρ¹` whose
diagonal blocks lie in `X` (resp. `⊕_j Xε′_j`) and off-diagonal blocks in `⊕_j Xε_j` (resp. `Xη`); `TwZ` is the group of cocycles for
`ad ρ¹ ⊗ χ_ℓ` with diagonal blocks in `Xη` and off-diagonal blocks in `⊕_j Xε′_j` (the Tate dual of the coefficients of `Sel1`). A
finite set `Σ ⊂ G′` *detects* at the point if every `z ∈ TwZ` over `K[[T]]` at level `0` whose trace functional
`σ ↦ (η-component of tr(z(σ)ρ¹(σ)))` vanishes on `Σ` is a coboundary up to a power of `T`.

*Taylor–Wiles systems of groups.* A *system of local groups* is given by finite sets `V_ℓ`, `S_t` and profinite groups with a
subgroup, `D_v ⊇ I_v` (`v ∈ V_ℓ`) and `D_u ⊇ J_u` (`u ∈ S_t`). A *frame* over it is a profinite group `Γ` with a character
`η : Γ → {±1}` of open kernel `Γ⁰`, an element `c` with `c² = 1` and `η(c) = −1`, a continuous character `ε : Γ → ℤ_ℓ^×`, and
continuous homomorphisms `D_v → Γ⁰`, `D_u → Γ⁰`; put `G′ = Γ⁰ ∩ ker ε`. Normalized points, (N1), (N4), `SelZ`, `SelP`, `SelM`, the
`κ_j`, `Sel1`, `Bd1`, `Sel2`, `TwZ` and detection are defined for a frame as above for `G_L`, with `Γ⁰`, `D_v`, `I_v` and the images
of the `J_u` in place of `G_L`, of the decomposition and inertia groups above `ℓ`, and of the tame inertia killed by `⊕χ̄_i`; (N4)
is taken for a given subgroup `Δ` of `Γ⁰` in place of the decomposition group at `v₀`. For a subgroup `H` of a profinite group
`Γ`, `P_ℓ(H)` is the intersection of the open normal subgroups of `Γ` modulo which every element of `H` has `ℓ`-power order. A
*Taylor–Wiles system* over a frame `Γ₀` consists of: an integer `q ≥ 0`; an open normal subgroup `H` of `Γ₀`, contained in `Γ₀⁰`,
on which `ε ≡ 1 mod ℓ`; for every `N` a frame `Γ_N` over the same local groups and a continuous surjection `h_N : Γ_N → Γ₀`
compatible with `η`, `c`, `ε` and the local homomorphisms, with `H_N := h_N⁻¹(H)`; elements `σ_1, …, σ_q ∈ G′`; integers
`q_{N,j} ≡ 1 mod ℓ^N`; and elements `φ_{N,j}, τ_{N,j} ∈ Γ_N⁰` (`1 ≤ j ≤ q`), such that: `h_N(φ_{N,j})σ_j⁻¹ ∈ H`, and for every open
normal subgroup `V ⊇ P_ℓ(H)` of `Γ₀` it lies in `V` for all large `N`; `h_N(τ_{N,j}) = 1`;
`τ_{N,j}^{−q_{N,j}}·φ_{N,j}⁻¹τ_{N,j}φ_{N,j} ∈ P_ℓ(H_N)`; `ker h_N` lies in the closure of the subgroup generated by the conjugates
of the `τ_{N,j}` and by `P_ℓ(H_N)`; `H` has finitely many continuous homomorphisms to `ℤ/ℓ`, and so has every `H_N`, their number
being bounded independently of `N`; and every open subgroup of each `D_v` and `D_u` has finitely many continuous homomorphisms to
`ℤ/ℓ`. *At level `N` modulo `T^m`* refers to the frame `Γ_N`, the point `ρ ∘ h_N` and the coefficients `K[[T]]/T^m`.

Prove: (a) (*type I*) if `x` is of type I with (N1), (N3), (N4) and `J ⊂ ker x`, then `J ⊂ q` for every prime `q ⊂ ker x`;
(b) (*chains of type E*) if `x₀, …, x_h` are of type E with (N1), (N3), (N4), `e_i ⊂ ker x_i ∩ ker x_{i+1}` are thick primes,
and some stable `q₁` has `J ⊂ q₁ ⊂ ker x₀`, then `J ⊂ q` for every stable or thick prime `q ⊂ ker x_h` ((a), (b): [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/TaylorWilesObstructionBound.lean` (`UpperTheory.V.Pa.PfromAut`));
(c₀) (*the first count for a Taylor–Wiles system of groups*) Let `ℓ` be odd, `Γ₀` a frame with a Taylor–Wiles system, `d ≥ 0`
and `Δ` a subgroup of `Γ₀⁰`. Let there be given, for every `N`: profinite groups `D_{N,0}, D_{N,1}, …, D_{N,q}` with continuous
homomorphisms to `Γ_N⁰`, the image of `D_{N,0}` in `Γ₀⁰` being `Δ` and the image of `D_{N,j}` containing `φ_{N,j}` and `τ_{N,j}`;
elements `c_{N,1}, …, c_{N,d} ∈ Γ_N` with `c_{N,i}² = 1` and `η(c_{N,i}) = ε(c_{N,i}) = −1`, with `ε(c) = −1` in `Γ_N`; and integers
`d_v ≥ 0` (`v ∈ V_ℓ`), the same for all `N`, with `Σ_v d_v = d`. Let `W = V_ℓ ⊔ S_t ⊔ {0, 1, …, q}` index the local groups `D_w`
of `Γ_N`. A *module* is a finite abelian group with a locally constant action by automorphisms; `Z¹` and `B¹` are its locally
constant cocycles and its coboundaries; a *dual pair* `(M, M′)` is a pair of modules with a biadditive pairing `M × M′ → ℤ/ℓ`,
nondegenerate on both sides, with `⟨gx, gy⟩ = ε(g)⟨x, y⟩`. Assume for every `N`:
(GW) for every dual pair `(M, M′)` of `Γ_N` and all subgroups `B¹(D_w, M) ⊆ 𝓛_w ⊆ Z¹(D_w, M)` (`w ∈ W`), the groups
`Z¹(Γ_N, M)`, `Z¹(Γ_N, M′)` are finite and
`#{z ∈ Z¹(Γ_N, M) : z|_{D_w} ∈ 𝓛_w for all w}·#B¹(Γ_N, M′)·(#M)^{#W}·∏_{i≤d} #M^{c_{N,i}}`
`≤ #M·#{y ∈ Z¹(Γ_N, M′) : y|_{D_w} ∈ B¹(D_w, M′) for every w with 𝓛_w = Z¹(D_w, M)}·∏_w #𝓛_w`;
(LC) for every `w ∈ W` and every dual pair `(M, M′)` of `D_w`: `#Z¹(D_w, M) = (#M)^{1+d_w}·#(M′)^{D_w}`, with `d_w = d_v` for
`w = v ∈ V_ℓ` and `d_w = 0` for every other `w`;
(UC) for every `u ∈ S_t` and every module `M` of `D_u` killed by `ℓ` on which `J_u` acts trivially: the cocycles in `Z¹(D_u, M)`
vanishing on `J_u` number `#M`.
Assume moreover: (split) there are integers `d′_v ≥ 0` with `Σ_v d′_v = d` and, for every `v ∈ V_ℓ`, a continuous surjection
`a_v : D_v → ℤ_ℓ^{d′_v} × ℤ_ℓ` with `a_v(I_v) = ℤ_ℓ^{d′_v} × {0}`, through which every homomorphism with open kernel from `D_v` to
a finite abelian `ℓ`-group that is trivial on `μ(D_v)` factors, and a homomorphism with open kernel `D_v → D_v^{ab}[ℓ^∞]` that is
the canonical map on `μ(D_v)`, where `D_v^{ab}` is the quotient of `D_v` by the closure of its commutators and `μ(D_v)` the set of
elements with image of `ℓ`-power order in it; (Φ) every open subgroup of `Γ₀` has finitely many continuous homomorphisms to
`ℤ/ℓ`. Let `ρ` be a normalized point of `Γ₀` with (N1), trivial on `P_ℓ(H) ∩ Γ₀⁰`, with (N4) for `Δ`, such that every `ρ(σ_j)` has
`n` distinct eigenvalues in `K[[T]]` and `{σ_1, …, σ_q}` detects. Then there is `C` such that for every `m`, for all large `N`, at
level `N` modulo `T^m`, `Sel1` is finite and `#Sel1 ≤ #Bd1·|K|^{m(nd + nq) + C}` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/EpsilonEtaMatrices/B1abs.lean` (`UpperTheory.V.Pa.b1abs`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/ThetaCoefficientMapEq.lean` (`UpperTheory.V.Pa.TWGrp`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/DegreeCountCohomology/IsDualPair.lean`
(`UpperTheory.V.Pa.ArSys`));
(c₀′) (*the obstruction bound for a Taylor–Wiles system of groups*) Let `ℓ` be odd, `Γ₀` a frame with a Taylor–Wiles system and
`d ≥ 0`. In this clause a module is a finite discrete module with continuous action, killed by `ℓ`, and `H^i` is continuous
cohomology. A frame `Γ` *has the cohomology of degree `d`* if there are integers `d_v ≥ 0` (`v ∈ V_ℓ`) with `Σ_v d_v = d` such
that: (1) `H¹` and `H²` of `Γ`, of every `D_v` and of every `D_u` are finite; (2) `H²(Γ, M) → H²(Γ, M′)` is onto for every
surjection of modules `M → M′`; (3) there are `c_1, …, c_d ∈ Γ` with `c_i² = 1`, `η(c_i) = −1` and
`#H⁰(Γ, M)·#H²(Γ, M)·(#M)^d = #H¹(Γ, M)·∏_i #M^{c_i}` for every module `M`; (4) `#H¹(D_v, M) = #H⁰(D_v, M)·#H²(D_v, M)·(#M)^{d_v}`
for `v ∈ V_ℓ`, and `#H¹(D_u, M) = #H⁰(D_u, M)·#H²(D_u, M)` for `u ∈ S_t`; (5) for `u ∈ S_t` and a module `M` of `D_u` on which
`J_u` acts trivially, `#H⁰(D_u, M) ≤ #H¹_{ur}(D_u, M)` (the classes of the cocycles vanishing on `J_u`), and for every surjection
of modules `M → M′` every cocycle of `D_u` in `M′` vanishing on `J_u` is the image of a cocycle in `M` vanishing on `J_u`; (6) for
every module `M` of `Γ` with quotient modules `M ↠ Q_w` of the `D_w` (`w ∈ V_ℓ ⊔ S_t`), the cokernel of
`H²(Γ, M) → ∏_w H²(D_w, Q_w)` has at most as many elements as the group of additive maps `f : M → ℤ/ℓ` with `f(gm) = ε(g)f(m)`.
If `Γ₀` and every `Γ_N` have the cohomology of degree `d`, then for every normalized point `ρ` of `Γ₀` with (N1), trivial on
`P_ℓ(H) ∩ Γ₀⁰`, such that every `ρ(σ_j)` has `n` distinct eigenvalues in `K[[T]]`, (K2′) holds ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/ArchimedeanH0Cards/ObstructionBoundFromDuality.lean`
(`UpperTheory.V.Pa.B2.ObstructionBoundFromDuality`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/ArchimedeanH0Cards/ObstructionBoundOfDuality.lean`
(`UpperTheory.V.Pa.B2.obstructionBound_of_duality`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/ArchimedeanH0Cards/PushforwardPreservesSelmerCocycles.lean`
(`UpperTheory.V.Pa.B2.CohAx`)) ((c₀), (c₀′): theorems of [FormalProof] whose route is not given here, outlined in the Route of
(c));
(c) (*the three Selmer counts*) (K1′) and (K2′) are (c₀) and (c₀′) for the Galois groups of the Taylor–Wiles levels; (K1)–(K3)
follow from them: at a normalized point with (N1), (N3), (N4) and Taylor–Wiles elements `σ₁, …, σ_q ∈ G′` at which `ρ` has `n` distinct
eigenvalues and which detect, with `D₀ := nd + nq`, there is `C` such that for all `m` and all large `N`, at level `N` and modulo
`T^m`: (K1′) `#Sel1 ≤ #Bd1·|K|^{mD₀ + C}`, `Bd1` its coboundaries; (K2′)
among any `g + 1` families `(z_{i,j})_j ∈ SelP^g` some combination with a unit coefficient is, up to `T^C`, the `ε′`-part of an
element of `Sel2` (the map `SelP^g → H²(off-diagonal)`, `(z_j) ↦ Σ_j κ_j ∪ z_j`, has rank `≤ g` up to `T^C`); and over the limit group
of ReducibilityIdealsAndUltrafilterPatching §6.13(1): (K1) `Sel1` modulo coboundaries has rank `≤ D₀`, (K2) among any `g + 1`
families in `SelP^g` over `K[[T]]`, some combination with coefficients in `K[[T]]`, not all zero, is the `ε′`-part of an element
of `Sel2`; (K3) every element of `SelM` is, after multiplication by a power of `T` and modulo coboundaries, a combination of
the `κ_j`; (d) (*detection*) let `F` be a field with `2 ≠ 0`, `G ⊃ G′ ⊃ [G, G]` groups, `χ` a nontrivial character of `G/G′`,
`1 ≤ a ≤ n`, `r : G → GL_a(F) × GL_{n−a}(F)` a representation whose image spans `M_a(F) × M_{n−a}(F)` on `G′`, `σ` an involutive
automorphism of `G` with `χ ∘ σ = χ` and `ᵗr(g)·r(σg)` scalar for all `g` (in the use, conjugation by `c`), `κ₁, …, κ_m`
block-off-diagonal cocycles of `ad r` with `κ_k(σg) = −ᵗκ_k(g)`, linearly independent modulo the coboundaries of
block-off-diagonal antisymmetric matrices, and `ρ¹ = (1 + Σ_k ε_kκ_k)r` over the paired dual numbers; then every cocycle `z` of
`ad ρ¹ ⊗ χ`, with diagonal part in the `η`-component and off-diagonal parts in the `ε′_k`-components, with `z(σg) = s·ᵗz(g)`
componentwise for a sign `s = ±1`, and such that `tr(z(g)ρ¹(g))_η = 0` for all `g ∈ G′`, is a coboundary of an element with the
same symmetry. Consequently, at a normalized point of type I or E, `G′` detects, and so does a finite subset of any dense
subset of `G′` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/PatchedSupportCompletions.lean`
(`UpperTheory.V.Pa.Detection`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/DeterminantPadicFree/FrameWith.lean`
(`UpperTheory.V.Pa.DetFr`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/PatchedSupportCompletions.lean`
(`UpperTheory.V.Pa.Choice`)).
The routes of (a) and (b) use (K1′) and (K2′) of (c), whose routes are not given in full (see there).
[FormalProof] states (K1′) and (K2′) as `UpperTheory.V.Pa.FirstOrderDualArithmeticBound` and
`UpperTheory.V.Pa.TaylorWilesObstructionBound` (`AV/PatchingModules/TaylorWilesObstructionBound.lean`), with the counts
`UpperTheory.V.Pa.TWGrp.B1`, `UpperTheory.V.Pa.TWGrp.B2` (`AV/PatchingModules/ThetaCoefficientMapEq.lean`) and `D₀ = n·[L⁺ : ℚ] + n·q`,
and proves them as `UpperTheory.V.Pa.b1Ar` (`AV/PatchingModules/AutomorphicDetection/BoundW1Arithmetic.lean`) and
`UpperTheory.V.Pa.b2Ar` (`AV/PatchingModules/AutomorphicDetection/TaylorWilesObstructionBound.lean`). Both are stated under its
bundle `CohP` of published theorems of Galois cohomology (finiteness, local Tate duality, Euler characteristics, Poitou–Tate
duality, the Greenberg–Wiles formula, tame local Galois groups), (K1′) also under `LocCFT`, the splitting of `G_v^{ab}` described in the Route of (c); (K2′) is stated
without (N4) and without detection.

*Route.* (c) *Outline of (K1′), (K2′), and of (c₀), (c₀′) read for a frame* (for (c₀) the outline uses (GW) for the coefficients
of `Sel1`, (LC) and (split) for the terms above `ℓ`, (UC), (N4) at `D_{N,0}`, distinct eigenvalues at the `D_{N,j}`, and detection
for the dual term). (K1′) is the Greenberg–Wiles formula in counting form for the coefficients of `Sel1` and
their Tate dual: local terms above `ℓ` of exponent `m(n + ν)(d_v + 1)` (`n` diagonal entries, each a homomorphism of `G_v` vanishing
on the elements of `ℓ`-power order of `G_v^{ab}`; by local class field theory the pro-`ℓ` completion of `G_v^{ab}` is the product of
its torsion subgroup and `ℤ_ℓ^{d_v} × ℤ_ℓ`, inertia mapping onto `ℤ_ℓ^{d_v}`, so each has `d_v + 1` parameters, whether or not
`μ_ℓ ⊂ L_v`; and the `ν = n(n − 1)/2` strictly upper triangular entries, the ordinary characters being distinct and not
in ratio `χ_ℓ` by (N1)), invariants at `v₀` bounded independently of `m` by (N4), at each
Taylor–Wiles place of exponent `mn` (the centralizer of `ρ¹(σ_j)`, eigenvalues distinct), and the dual Selmer set: a dual cocycle
that is a coboundary at the Taylor–Wiles places vanishes on their tame generators, descends to the base group, lies in `TwZ`
with trace functional vanishing at the `σ_j`, and is bounded by detection made uniform in `m`; after the Euler characteristic
terms cancel the exponent is `m(nd + nq) + C`. (K2′) The off-diagonal Euler characteristic is `0` (`d·a(n − a)` from the places
above `ℓ` against the same from the real places), Taylor–Wiles places add nothing off-diagonally, so the off-diagonal `H²`
modulo `T^e` has at most `|K|^{ge + C}` elements, and among `g + 1` elements of such a module some combination with a unit
coefficient is killed by `T^C`; a family comes from `Sel2` exactly when `Σ_j κ_j ∪ z_j` is a coboundary. (K1)–(K3) pass to the limit group by topological finite generation.
*(K1′), (K2′) from (c₀), (c₀′).* Take `Γ₀ = G_{L⁺,S}` and `Γ_N = G_{L⁺,S_N}`, with `η` the character of `L/L⁺`, `ε = χ_ℓ`, `c` a
complex conjugation, the decomposition and inertia groups at the places above `ℓ`, the decomposition groups at the other places of
`S` with `J_u` the inertia killed by the `χ̄_i`, and `H` the common kernel of the `χ̄_i` and of `ω` in `G_{L,S}`; a Taylor–Wiles
datum (HeckeIdealsAndTaylorWilesRelations §4.2a) gives a Taylor–Wiles system with `q_{N,j} = Nw_{N,j}`. For (c₀): `D_{N,0}` and the
`D_{N,j}` are the decomposition groups at `v₀` and at the `w_{N,j}`, `Δ` is the decomposition group at `v₀`, the `c_{N,i}` are the
`d = [L⁺:ℚ]` complex conjugations and `d_v = [L⁺_v:ℚ_ℓ]`; (GW) is the Greenberg–Wiles formula (ArithmeticGaloisDuality R02.5.1)
written for cocycles, with the finiteness of ArithmeticGaloisDuality R02.4.4; (LC) is local Tate duality with the local Euler
characteristic (ClassFieldTheory Layer 5, ArithmeticGaloisDuality R02.4.2); (UC) is the count of unramified classes
(ArithmeticGaloisDuality R02.4.2), the inertia acting through a quotient of order prime to `ℓ`; (split) is local class field
theory (ClassFieldTheory Layer 7); (Φ) follows from ArithmeticGaloisDuality R02.4.4 ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/AutomorphicDetection/ArPl.lean` (`UpperTheory.V.Pa.arPl`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/DegreeCountCohomology/ArSys.lean`
(`UpperTheory.V.Pa.arSys`)).
For (c₀′): (1)–(3) are finiteness, `cd_ℓ ≤ 2` and Tate's global Euler characteristic formula (ArithmeticGaloisDuality R02.4.4),
(4) and (5) the local statements just named, (6) the end of the Poitou–Tate sequence (ArithmeticGaloisDuality R02.4.3)
([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/AutomorphicDetection/TaylorWilesObstructionBound.lean`
(`UpperTheory.V.Pa.B2.cohAxAr`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PatchingModules/ArchimedeanH0Cards/CohAxIso.lean`
(`UpperTheory.V.Pa.B2.cohAxIso`)). That the points of *Points* are trivial on
`P_ℓ(H)`, as (c₀) and (c₀′) ask, is not given here.
(d) On `G′` the map `g ↦ (r, κ_kr, λ_kr, φr + Σ_kλ_kκ_kr)(g)`, `(φ, λ_k)` the components
of `z`, is multiplicative for the algebra of such quadruples; the trace hypothesis, applied to products of two relations of `r`
with matrix units, gives `Σ_k (κ_kr)(c)_{ij}(λ_kr)(c′)_{ji} + (λ_kr)(c)_{ij}(κ_kr)(c′)_{ji} = 0` for relations `c, c′` of `r` in the group
algebra; a combination of the `κ_k`, `λ_k` that kills the relations in an off-diagonal entry is a coboundary on `G′` (derivations
of a product of matrix algebras are inner) and then on `G` (the off-diagonal invariants of `G′` vanish and `χ ≠ 1`), corner by
corner; the polarization carries the statement from one off-diagonal corner to the other, which is where it is used (an odd
cocycle with the symmetry of `σ` one of whose corners is a coboundary is a coboundary of an odd element with the same symmetry),
and by independence its `κ`-coefficients vanish; so each `λ_k` kills relations and is a coboundary `d_χY_k`; subtracting
`χΣ_k[κ_k, rY_kr⁻¹]` leaves a block-diagonal cocycle with vanishing trace functional, a coboundary by the same argument. The trace
functional is continuous in `g`, so a dense subset detects, and finite generation leaves finitely many elements. At a normalized
point the span condition is the block-diagonal span of `ρ(G′)` (type I or E), with `F = K((T))`, `χ = χ_ℓ`, nontrivial on `G_L`
as `μ_ℓ ⊄ L`, and `σ` conjugation by `c`, under which the Selmer cocycles have the symmetry `z(g^c) = −ᵗz(g)` (orthogonal points);
when `m = 0` no polarization is needed. (a), (b) Normalize the points (block diagonal, orthogonal, after a finite extension of `K[[T]]`); replace the groups
by quotients in which an open normal subgroup killing the `χ̄_i` and `ω` is pro-`ℓ`; by (N3) and (d), choose finitely many
`σ_j ∈ G′` at which every `ρ_{x_i}` has `n` distinct eigenvalues and which detect; realize them by Taylor–Wiles places (Chebotarev); fix one nonprincipal
ultrafilter for the group and the module. *The free variable.* After the normalization all points have one residue
field `K`; replace `O` by a finite free local extension `O′` with residue field `K`. Adjoin one variable `s` to the weight algebra,
to `B` and to the patching data: `Λ′ := (O′ ⊗_O Λ)[[s]] = O′[[s, x₁, …, x_{nd}]]`, `B′ := (O′ ⊗_O B)[[s]]`, the base module, every `R_N`,
every patching module and the comparison maps base-changed along `Λ → Λ′` (the base module stays finite free over `Λ′`, with
support `V(JB′)`; the relations and the freeness over the diamond group rings are preserved). Each point `x_i` extends to
`x′_i : B′ → K[[T]]` with `s ↦ T`, the primes `q₁`, `e_i`, `q` lift to primes of `B′` with the same contractions, stable primes to
stable ones and thick primes to thick ones, and a conclusion `JB′ ⊆ Q′` gives `J ⊆ Q′ ∩ B`. Since `O′ → K` is onto and `s ↦ T`, the
map `Λ′ → K[[T]]` is onto; its kernel has height `1 + nd` and the completion of `Λ′` there is regular of dimension `1 + nd`. Let `Ph`
be the topologically finitely generated profinite group of ReducibilityIdealsAndUltrafilterPatching §6.13(1), which surjects onto
every `Γ_N` and onto the limit group `G_∞`, and `R` the universal ring over `Λ′` of: a determinant of the subgroup of `Ph` over `G_L`
lifting the residual determinant, characters of the `G_v` lifting the residual ordinary characters, elements lifting the
residual Frobenius eigenvalues at the Taylor–Wiles elements, and the diamond variables. `R` maps to every base-changed `R_N`, so
every `M_N` is an `R`-module. Let `𝔦 ⊂ R` be generated by the relations of the kernel of `Ph → G_∞`, the polarization, the ordinary
relations, the relations at tame inertia and the two Taylor–Wiles relations at each place: each holds on `M_N` up to `𝔪_R^j` for
almost all `N` (for the ultrafilter), the first because `ker(Ph → Γ_N)·V = ker(Ph → G_∞)·V` for almost all `N`, `V` open normal,
the last two in the form "`(f·t)^e` kills `M_N`" (HeckeIdealsAndTaylorWilesRelations §4.2a), as ReducibilityIdealsAndUltrafilterPatching §6.13(2) asks; `R/𝔦` is the
determinant ring of the limit group with the Taylor–Wiles relations. The modules are free over the group rings of the finite
diamond groups, of exponents `ℓ^{a_{N,j}}` with `a_{N,j} ≥ N`, hence free modulo `(𝔪_Λ^j, (σ)^k)` as soon as `N` is large for
`(j, k)`. *The ordered roots.* Let `B″` be the `B′`-algebra generated by elements `U_{j,i}` with `∏_i(X − U_{j,i})` the
characteristic polynomial of `σ_j` and `U_{j,i}` lifting the residual eigenvalues; it is complete local, finite and free over
`B′`. Choose primes `P_i` of `B″` over `ker x′_i` and primes `E_i` of `B″` over the thick primes `e_i` with `E_i ⊆ P_i` and
`E_i ⊆ P_{i+1}` (lying over and going down for the finite free extension), and extend each point to `B″` with kernel `P_i` (the
characteristic polynomials split over `K[[T]]`). The ring `R` maps onto `B″` modulo `𝔦`; the primes of the patching statement are
the inverse images `q_i` of the `P_i`, and the inverse images of the `E_i` lie in `q_i` and in `q_{i+1}` in `R`. Every prime of a
completion over the inverse image of `E_i` is thick for the relations of `R` (non-semisimplicity passes from `e_i` to its lifts).
Patch by §6.13(2), (3) over `Λ′`, with `δ = 1 + nd` (the dimension just computed) and the `nq` diamond variables: the supports
have dimension `1 + D₀`. At each point the completed determinant ring `B^h` (Henselian, residue
field `K((T))`) carries the generalized matrix algebra of its Cayley–Hamilton quotient; the polarization identifies the two
off-diagonal modules, which gives the `ℤ/2`-graded algebra `𝔸 = B^h ⊕ N` of ReducibilityIdealsAndUltrafilterPatching §6.11, with
`N = 0` at a point of type I (IntegralHeckeAndGaloisDeterminants §§1.3–1.4). Stability (*Points*) passes to smaller primes. At a point of type E a stable prime does not contain the ideal generated by `N·N`, and a thick prime contains `Ann N`.
At a point of type I every prime below the point is stable and ReducibilityIdealsAndUltrafilterPatching §6.11(2) is used: the Selmer statements of (c) give
`𝔪 ⊆ (X₁, …, X_{D₀}) + (ϖ) + 𝔪²`, so a prime `Z` with `dim B^h/Z ≥ 1 + D₀` is `0` and lies in every prime. In this use, the discrete valuation ring of §6.11 is a Cohen ring of the residue field `K((T))` of the completed
determinant ring. (c) puts `𝔸` in the form of §6.11(1) with `D₀ = nd + nq`: (K3) gives generators `m_j` of `N`, (K2) a `g × g` matrix of linear
forms for their relations, and (K1) the independence (`dim ker λ + g² ≤ D₀`). Then: the stable `q₁` lifts by ReducibilityIdealsAndUltrafilterPatching §6.13(3) (fib) to the support
at `x₀`; a minimal prime of the support below it is stable of dimension `≥ 1 + D₀`; by §6.11 (in type E: (1), for the primes of the
completion at `x₀` over the lifted thick prime, which are thick) it lies in every such prime; by §6.13(3) (move), whose hypothesis
is the inclusion of the lifted thick prime in `q₁` in `R`, it reappears at `x₁`; iterate; at `x_h`, (fib) gives `J ⊂ q`. *Needs:* ReducibilityIdealsAndUltrafilterPatching §§6.11, 6.13;
IntegralHeckeAndGaloisDeterminants §§1.1, 1.3, 1.4; ArithmeticGaloisDuality R02.4.2, R02.4.3, R02.4.4, R02.5.1, D7.7;
ClassFieldTheory Layers 5, 7; Chebotarev Layer 10; HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a.

**Checks.**

- The polarization in (d) cannot be dropped: without it only one corner of `Σ_k α_kκ_k` is known to be a coboundary and the
  independence of the `κ_k` cannot be applied. For `m = 1`, `κ` supported on the upper right corner and `z = ε′λ` with `λ` an upper
  right cocycle of `ad r ⊗ χ` that is not a coboundary, `λκ = 0` and `[κ, rλr⁻¹] = 0`, so `z` is a cocycle of `ad ρ¹ ⊗ χ` with
  vanishing trace functional that is not a coboundary; here `κ` and `z` lack the symmetry of `σ`, transposition exchanging the
  two corners.
- `J ⊂ B` is a hypothesis here: whether the ideal of HeckeIdealsAndTaylorWilesRelations §3.13a has automorphic patching
  data is §4.2a there.
- The torsion condition in `SelZ` is needed: for `ℓ = 3`, `L⁺ = ℚ(√429)`, `L = ℚ(√−39, √−11)`, `μ₃ ⊄ L` and `L⁺_v = ℚ₃(μ₃)` at the place
  above `3`; without the condition on torsion a diagonal cocycle on the local `μ₃` would contribute `|K|^m` modulo `T^m`.
- Over `k[[u, v]]` with a root `z(z − u) = 0` adjoined, the prime `(z)` over `(0)` lies below `(v, z)` and not below
  `(v − u, z − u)`: a common contraction downstairs gives no inclusion upstairs; this is why the thick primes are lifted together
  with the points.

### 3.16 The patching conditions at nice primes in ranks two and three

In 3.11, assume (F1)–(F3), the class conditions, that the frame is big and that `L/L⁺` is unramified at every finite place. Let
`M` be an integer
divisible by `ℓ` and by the primes below the ramification set of `Γ`, such that every place of `L⁺` above `M` splits in `L`. Let `κ`
be a continuous character of `G_L`, the `ℓ`-adic character of an algebraic Hecke character, with `κκ^c = χ_ℓ^{1−n}`, unramified
outside the places above `M`, and of order prime to `ℓ` on the inertia group at every place not above `ℓ` (in rank three
`χ_ℓ⁻¹|_{G_L}`; in rank two, when `L` contains an imaginary quadratic field whose discriminant is prime to `ℓ` and divides `M`, the
restriction to `G_L` of the character of 3.23 for that field). Let `S_t` be the set of places above `M` not above `ℓ`, `v₀` an auxiliary place as
in 3.15, of residue characteristic prime to `M` (so `κ` is unramified there), for the
residual characters `χ̄_i := Ψ̄^{w_i}κ̄` (it exists by (F1) and Chebotarev: the ratios of the `χ̄_i` generate the group of the powers
of `Ψ̄|_{G_L}`, which does not contain `ω|_{G_L}`), and `B_det` the universal ordinary determinant ring of 3.15 for the `χ̄_i`, the
residual ordinary characters `Ψ̄^{w_i}κ̄|_{G_v}` and `S = S_ℓ ∪ S_t ∪ {v₀}` (the residual pair is an ordinary determinant: the `i`-th
factor of the relation vanishes on the `i`-th line). Let `x` be a closed point of the core, `p` a nice prime
of `R_x` (3.11(d)), and `x_p : B_det → K[[T]]` the composite of the map `Φ` of (h) below with `R_x → R_x/p` and the inclusion of
`R_x/p` in its normalization `K[[T]]`; `ρ_p` is the lift modulo `p` twisted by `κ`. Prove, for `n ∈ {2, 3}`: (a) (*free ratios*)
every open subgroup of `N_v` contains `g` with `(ψ_{v,a}(g)/ψ_{v,b}(g))^m ≠ 1` modulo `p` for all `m > 0` and `a ≠ b`, and `x_p` has
(N1); (b) (*irreducibility over the cyclotomic tower*) if `p` is irreducible, `ρ_p` is absolutely irreducible on every open
subgroup of `G′ = G_{L(μ_{ℓ^∞})}`, so `x_p` is of type I; (c) (*regular elements*) if `ρ_p` is irreducible on every open subgroup of
`G′` and `ρ_p(u)` has eigenvalues with free ratios for some `u ∈ N_v` (as (a) provides), then for every open subgroup `U ⊂ G′` and
every `y ∈ GL_n(K((T)))` some `h ∈ U` makes `y·ρ_p(h)` have separable characteristic polynomial; in particular `x_p` has (N3); (d)
(N4) holds at every point, the residual characters being equal and unramified on the decomposition group at `v₀` with
`χ_ℓ ≢ 1` there; (e) thick primes of `R_x` map to thick primes of `B_det` and irreducible primes to stable ones; (f) (*block type*)
if `n = 3` and `p` is of block type, then over `K((T))`, `ρ_p ≅ W ⊕ μ` on the coordinates `{1, 3}`, `{2}`, both summands polarized,
`W` absolutely irreducible on every open subgroup of `G′`, and `Hom_{G′}(W, μ) = 0`: `x_p` is of type E; (g) (*regular elements at
block type*) for `σ` of rank two, irreducible on every subgroup of finite index, a character `ψ`, and `u` such that the
eigenvalues of `σ(u)` and `ψ(u)` have free ratios, for every `(y, z) ∈ GL₂ × 𝔾_m` there is `h` in any given open subgroup with
`charpoly(yσ(h))·(X − zψ(h))` separable; hence (N3) holds at `x_p` for `p` nice of block type; (h) (*comparison*) `(r, (ψ_{v,i})) ↦ (det(r ⊗ κ), (ψ_{v,i}κ|_{G_v}))`
defines a surjection `Φ : B_det → B` ((a)–(c), (e)–(g): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/NiceSep.lean` (`UpperTheory.V.Pr.niceSep`); (h),
with the setting: [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/PxIsCont.lean`
(`UpperTheory.V.Pr.phiEx`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/SecondThirdPrimeConditionTransferAlt.lean`
(`UpperTheory.V.Pr.Setup`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/SecondThirdPrimeConditionTransferAlt.lean`
(`UpperTheory.V.Pr.Setup.PhiEx`)).

*Route.* (a) At a nice prime the `ψ_{v,a}` are pairwise distinct on `N_v` modulo `p`, while their reductions agree there ((F3));
so each ratio maps `N_v` into the `1`-units of `K[[T]]`, a torsion-free group in characteristic `ℓ`; and `ψ_{v,i} ≠ ψ_{v,j}χ_ℓ`
because `χ_ℓ` is trivial on `N_v`. (b) As `n` is prime, for `U` open normal `ρ|_U` is irreducible, scalar, or a sum of `n` distinct
characters permuted transitively (a minimal `U`-stable subspace has dimension dividing `n`); scalar is excluded by (a), the
permuted case by a decomposition group above `ℓ`, whose elements fix each line (the lines are separated by `N_v ∩ U`): for `g`
permuting the lines cyclically and `s` in that group with `Ψ̄(s)² ≠ 1` ((F2)), every `gsᵏ` permutes them cyclically, so
`tr ρ_p(gsᵏ) = 0`, and modulo `T` this reads `Σ_i χ̄_i(g)χ̄_i(s)ᵏ = 0` for `k = 0, …, n − 1`, impossible for the pairwise distinct
`χ̄_i(s)` (a Vandermonde determinant) and the nonzero `χ̄_i(g)`. (c) (any field; `n ≤ 3`) Replace `u` by a power in `U` and diagonalise `ρ_p(u) = D`, with eigenvalues
`α_i` of free ratios. Irreducibility on the open subgroups of `U` gives `b ∈ U` with every entry of `ρ_p(b)` and of `ρ_p(b)⁻¹` nonzero
in that basis. The diagonal entries of `M = yD^mρ_p(b)` and of `M⁻¹` are sums `Σ_jc_jα_j^{±m}` with some `c_j ≠ 0`, and finitely many
such sums are simultaneously nonzero for some `m`. For `n ≤ 3` a matrix whose diagonal entries and those of its inverse are
nonzero has all principal minors nonzero. Finally choose an additive `v : K((T))^× → ℚ` with `v(α₁) > v(α₂) > v(α₃)`; the
discriminant of the characteristic polynomial of `MD^{m′}` is a combination of characters of `m′` whose term of highest weight is
`(M_{11}M_{12,12})²(α₁⁴α₂²)^{m′}`, with coefficient a product of principal minors and the integer `1`, so it is nonzero in every
characteristic, and by the independence of characters the discriminant is nonzero for some `m′`. Then `h = u^mbu^{m′}`. (d) Divide
`X` by a power of `T`; the constant term satisfies `(χ̄_ℓ(g) − 1)X₀ = 0`. (e) The nonsplit extension of a thick prime (3.12(a))
makes the Cayley–Hamilton quotient non-semisimple. (f) The odd entries vanish modulo `p`; the corner is absolutely irreducible:
the diagonal idempotents are in the `B`-span of the image (3.11(a)), so an invariant subspace of the corner is a coordinate line,
and off-triangularity gives nonzero entries `(3, 1)` and `(1, 3)`; by the ordinary relation the middle character is one of the
`ψ_{v,i}` and the other two are the ordinary characters of `W`; then the argument of (b) in rank two: the scalar case is excluded
by (a), and the case of two exchanged lines because the decomposition group fixes both lines (they are the eigenlines of an
element of `N_v ∩ U` with free ratios, and the ordinary flag is stable), so that `W` would be induced from an index-two subgroup
containing it, on which the two residual characters of `W` would agree, against (F2); `W ≇ μ` by dimension, and each block
carries the restriction of the form. (g) Replace `u` by a power so that the eigenvalues `α₀, α₁` of `σ(u)` and `ψ(u)` generate a
torsion-free group `Γ_u`; choose `g` in the given open subgroup with `(yσ(g))₁₁ ≠ 0` (possible: `σ(G)e₁` spans the plane) and put
`h = gu^m`. With `yσ(g) = [[a, b], [c, d]]`, the discriminant of `charpoly(yσ(h))` is `a²α₀^{2m} + d²α₁^{2m} + (4bc − 2ad)(α₀α₁)^m`,
and the value of that characteristic polynomial at `zψ(h)` is an exponential sum in `m` over `Γ_u` with the coefficient `−a·zψ(g)`
at `(α₀ψ(u))^m`; both are values at `m` of nonzero elements of the group algebra of `Γ_u` (the first because `det(yσ(g)) ≠ 0`,
the second because `a ≠ 0`, also when `ψ(u)² = α₀α₁`), which is a domain mapping injectively to functions of `m`; so some `m`
makes both nonzero. (h) By the universal property of `B_det`: the twisted determinant is polarized for `χ_ℓ^{1−n}` by the choice
of `κ`, satisfies the ordinary relations by (ord), and satisfies the relation at `S_t` of HeckeIdealsAndTaylorWilesRelations
§3.13a(1): let `g` be an inertia element at a place of `S_t` at which all `χ̄_i` are trivial. Then `(r ⊗ κ)(g)` reduces to the
identity, and it has finite order prime to `ℓ`: `r(g)` has, because the image in `Γ` of an inertia group at a place not above `ℓ`
has order prime to `ℓ` (3.11), and `κ(g)` has by hypothesis. A matrix over a local ring that is residually the identity and of
finite order invertible in the ring is the identity (if `γ^m = 1`, then `(γ − 1)(1 + γ + … + γ^{m−1}) = 0` and the second factor is
residually `m`). So `(r ⊗ κ)(g) = 1`, in both ranks. Surjective because `B` is generated by the weight-zero monomials and
the `ψ_{v,i}`, and the
weight-zero monomials are traces of `r(g)E_{ii}r(h)E_{jj}`, where the matrix units `E_{ii}` are polynomials in `r(g₀) − r(g₀*)`
whose coefficients lie in the image of `B_det` (`r(g₀) − r(g₀*) = ζ·diag(w_i)` with `ζ` a unit, `2ζ² = tr((r(g₀) − r(g₀*))²)`, and
`ζ` lies in the image by Hensel's lemma, `ℓ` being odd); the coefficients of the characteristic polynomials of `r ⊗ κ` differ
from those of `r` by the units `κ(g)^i` (`Λ_i((r ⊗ κ)(g)) = κ(g)^iΛ_i(r(g))`), and the ramification of `κ` does not enter.
*Needs:* 3.11, 3.12, 3.15; HeckeIdealsAndTaylorWilesRelations §3.13a(1).

**Checks.**

- The range is sharp for the method: the trichotomy of (b) needs `n` prime, and the coset argument of (c) needs `n ≤ 3`;
  in rank four the conditions at the points used are obtained separately (4.4).
- (a) uses (F3): if `Ψ̄` were nontrivial on `N_v`, two `ψ_{v,a}` could differ on `N_v` by a nontrivial character of finite order;
  the prime could then be nice while no element has ratios of infinite order.
- `κ` is needed in (h): the lifts of 3.11 satisfy `r(g*) = J ᵗr(g)J`, a polarization with trivial multiplier, while the
  determinants of 3.15 are polarized with multiplier `χ_ℓ^{1−n}`, the convention of the Galois representations of
  `ι`-ordinary forms. For `n = 3`, `κ = χ_ℓ⁻¹|_{G_L}` serves; for `n = 2` the character of 3.23, which is ramified at the primes
  of the discriminant of its imaginary quadratic field, with order prime to `ℓ` there. If `κ` were ramified with `ℓ`-power order at a place `u ∤ ℓ`, an
  inertia element `g` at `u` with `κ̄(g) = 1 ≠ κ(g)` would give `(r ⊗ κ)(g) = κ(g) ≠ 1`, against the relation at `S_t`.
- Without (tame) the map `Φ` does not exist. For representations of `G_L` itself (before the passage to the quotient `Γ`, which
  already kills the inertia elements in question): over `k[ε]`, `r = diag(Ψ̄(1 + εφ), 1, Ψ̄⁻¹(1 − εφ^c))` with the diagonal
  characters as `ψ_{v,i}` satisfies (pol), (diag), (ord) for every homomorphism `φ : G_L → k`, and for `φ` ramified at a place of
  `S_t` at an inertia element `g` with `Ψ̄(g) = 1`, `tr(r(h)(r(g) − 1)) ≠ 0` for some `h`.
- In (c), `b` cannot be omitted: for `y` a 3-cycle permutation matrix every `yD^r` has characteristic polynomial `X³ − det(D)^r`,
  inseparable in characteristic `3`; the principal minors of `y` vanish.

### 3.17 Ordinarity from Weil–Deligne data and from relations

(a) Let `F_w/ℚ_ℓ` be finite, `r : G_{F_w} → GL_n(ℚ̄_ℓ)` continuous, `h_0(τ) < ⋯ < h_{n−1}(τ)` integers for each embedding `τ`,
`ω_0, …, ω_{n−1}` smooth characters of `F_w^×` pairwise distinct on units, and `ψ_j` characters of `G_{F_w}`, locally algebraic with
smooth part `ω_j` and Hodge–Tate weights `h_j`. If `r` is de Rham with Hodge–Tate multiset `{h_j(τ)}` for every `τ` and its
Weil–Deligne representation has the characteristic polynomials of `⊕_j ω_j ∘ Art⁻¹`, then `r` has a full flag with
successive characters `ψ_0, …, ψ_{n−1}` (`ψ_0` the subrepresentation) and is potentially crystalline (the cyclotomic character
of Hodge–Tate weight `−1`). (b) Let `C` be a local ring with maximal ideal `𝔪_C`, `r : H → GL_n(C)` a homomorphism and
`ψ_0, …, ψ_{n−1}` characters of `H` with values in `C^×`, with `∏_i(r(g_i) − ψ_i(g_i)) = 0` for all `(g_i) ∈ Hⁿ`,
`charpoly r(t) = ∏(X − ψ_i(t))` for all `t`, and some `s` with the `ψ_i(s)` pairwise distinct modulo `𝔪_C`. Then `Cⁿ` has a full
flag of `H`-stable free direct summands with successive characters `ψ_0, …, ψ_{n−1}` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/FlagLoc.lean` (`UpperTheory.V.Fr.flag_loc`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/FrobeniusSmoothVectors/ZpowWNe.lean` (`UpperTheory.V.Fr.flag`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeilGroupCharacters/UniversalOrdinaryDeterminantRing.lean`
(`UpperTheory.V.W.HasFlag`)). (a) is a corollary of PadicHodgeTheory
§3.6; (b) applies over a field and over `Ē[ε]`.

*Route.* (a) De Rham implies potentially semistable (Berger: NoncommutativeAndEquivariantIwasawa §F.6). Inertia acts on the
Weil–Deligne representation (PadicHodgeTheory §5.3) through the `ω_j`, pairwise distinct on inertia, so the monodromy, nilpotent
and commuting with inertia, is `0`: `r` is potentially crystalline. Over a finite extension `F′/F_w` on whose units every `ω_j`
is trivial, `r|_{G_{F′}}` is crystalline of the Hodge type `{h_j}`, its crystalline Frobenius has the eigenvalues given by the
`ω_j` at a uniformizer, and these have the valuations of the crystalline characters `ψ_j|_{G_{F′}}` of weights `h_j` (weak
admissibility in rank one): the Newton polygon lies on the Hodge polygon, with the slope of weight `h_j` carried by `ω_j`.
PadicHodgeTheory §3.6 (ordinarity is equivalent to these valuations; a de Rham regular ordinary restriction to a finite
extension descends) gives the ordinary flag of `r` over `F_w`, whose `j`-th graded character is de Rham of weight `h_j` with
Weil–Deligne character `ω_j`, hence equal to `ψ_j`. (b) `r(s)` is regular semisimple with eigenvalues `ψ_i(s)`, whose differences
are units; its Lagrange idempotents `f_i` lie in the `C`-span of the powers of `r(s)`, and the relation extended to the group
algebra gives `f_i r(t) f_j = 0` for `j < i` and `f_i r(t) f_i = ψ_i(t)f_i`. *Needs:* PadicHodgeTheory §§3.6, 5.1, 5.3;
NoncommutativeAndEquivariantIwasawa §F.6 (`deRham_iff_potentiallySemistable`).

### 3.18 From framed presentations to normalized graded models

*Smooth points of weighted rings.* Let `E` be the fraction field of `O`. A complete local `O`-algebra `R` with an `X`-weighted
presentation (3.3, 3.6) is *smooth at its origin* `x` (an `O`-point killing the variables) with `ℓ_χ` coordinates of weight `χ` if
there is an `O`-algebra homomorphism `φ : R → E[[t_i]]` (no continuity is asked: `E[[t_i]]` carries no topology here; finitely many variables, `ℓ_χ` of them of weight `χ`, monomials weighted
additively) sending every homogeneous element of weight `χ` to a series all of whose monomials have weight `χ`, with constant
term `x`, such that every `t_i` is the linear part of some `φ(f)` and every element of `ker x` whose image has zero linear part
lies in the saturation of `(ker x)²` (the two chart conditions of ReducibilityIdealsAndUltrafilterPatching §4.8, for the grading
group `X`); `φ` is a *chart* ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/CommutativeAlgebra/OrbitVanishingLocal.lean`
(`UpperTheory.V.Alg.SmoothPt`)). For `X = ℤ` and a graded algebra this is §4.8's graded smooth point.

In 3.6, let the base `B` be smooth at its origin with `ℓ_χ` coordinates of weight `χ`, and let `𝔘 = R^□` be the framed ring, with
`a_χ = dim_k H¹_c(ad_χ)` new variables and `o_χ = dim_k Ob(ad_χ)` relations of weight `χ`. Let `t₁, …, t_p ∈ 𝔘` be homogeneous elements
vanishing at the origin with `O`-valued point derivations `δ_k` at the origin such that `δ_k(t_{k′}) ≠ 0` exactly for `k′ = k`, and
`s₁, …, s_m ∈ 𝔘` homogeneous elements vanishing at the origin. Prove:

(a) there are a complete local ring `R` with an `X`-weighted presentation, smooth at its origin with
`ℓ_χ + a_χ − #{k : wt t_k = χ}` coordinates of weight `χ`, homogeneous elements `q` of `R` vanishing at the origin,
`o_χ + #{k : wt s_k = χ}` of them of weight `χ`, and a surjection `𝔘/(t, s) → R/(q)` compatible with the gradings; `R` is a domain
when some `t_k` is present, and when none is, `R` may be taken to be the cover `B[[new variables]]` itself (not necessarily a
domain), and then `R/(q) = 𝔘/(s)`. Moreover, for every weight `χ` carrying no `t_k` and every `b ∈ O ∖ {0}`, an `O/b`-valued point
derivation of `𝔘` at the origin that restricts on `B` to the reduction of an `O`-valued derivation of weight `χ`, vanishes on the
new variables of the other weights and kills the `s_k`, is the reduction modulo `b` of an `O`-valued point derivation `δ` of `R`
of weight `χ`, and `δ(q) ⊂ bO` for every `q`;

(b) (*the counts*) assume that `ℓ` is odd; that `Γ = G_{F,Σ}` is the Galois group of the maximal extension of a number field
`F` unramified outside a finite set `Σ` of places containing the places above `ℓ`; that the framed and the condition places are
exactly the finite places of `Σ`, with their decomposition groups; that every place of `F` above `ℓ` is framed; and that at a
condition place `q`, `N_q ⊂ I_q` is normal in `G_q`, of index prime to `ℓ` in `I_q`, and acts trivially on `ad_χ`. Then
`o_χ − a_χ = Σ_{v | ∞} dim (ad_χ)^{G_v} + dim Hom_Γ(ad_χ, k(ω))`. The excess of coordinates over equations of `R/(q)` in weight `χ`
is `ℓ_χ − (o_χ − a_χ) − #{k : wt t_k = χ} − #{k : wt s_k = χ}`, whatever `a_χ` is; in particular, if `Hom_Γ(ad_χ, k(ω)) = 0`, it is
`ℓ_χ − Σ_{v | ∞} dim (ad_χ)^{G_v} − #{k : wt t_k = χ} − #{k : wt s_k = χ}`;

(c) (*chart criterion*) let `O` be finite over `ℤ_ℓ`, `R` a complete local noetherian `O`-algebra with the residue field of `O`,
`I ⊂ R` an ideal and `x` an `O`-point killing `I`. If every `O`-algebra map from `R` to a finite local `E`-algebra `C′` with
residue field `E` that kills `I` and reduces to `x` lifts, with these properties, along every surjection `C → C′` of such
algebras, then there are `n`, a prime `P ⊇ I` of `R` and an `O`-algebra homomorphism `φ : R → E[[t₁, …, t_n]]` with kernel `P` and
constant term `x` such that: for every `N` and every series `f`, some nonzero multiple `cf`, `c ∈ O`, is congruent to an element of
`φ(R)` modulo `(t)^N`; if `φ(a) ∈ (t)^N` then some nonzero multiple of `a` lies in `(ker x)^N + P`; some `y` with `x(y) ≠ 0` has
`yP ⊆ I`; `P` is the only minimal prime over `I` contained in `ker x`; and `dim R/P = n + 1`, `n` being the `E`-dimension of the
space of `E`-valued point derivations of `R/I` at `x`. In particular `φ` is a chart of `R/P` at `x` with `n` coordinates (the two
chart conditions are the density and injectivity clauses for `N = 2`) ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PadicHodgeTheory/SmoothCompl.lean` (`UpperTheory.V.Loc.smoothCompl`)).

In the applications the `t_k` are the frame coordinates and normalization conditions that are eliminated (their
differentials are independent), the `s_k` are the remaining normalization conditions, which become equations, and `R/(q)`
is a quotient, possibly proper, of the ring of normalized lifts, carrying the normalized lift with entries generating it; with
no elimination it is the ring of normalized lifts itself (4.1). The count never needs representability by `R/(q)`.

*Route.* (a) Take the smooth cover `P = B[[new variables]]` of `𝔘` and lift the `t_k` to homogeneous elements of `P`. If no `t_k` is
present, `R = P`: it is smooth at its origin with the chart of `B` extended by the new variables, the `q` are the relations of
`𝔘` over `B` and lifts of the `s_k`, and `R/(q) = 𝔘/(s)`. Otherwise the differentials of the `t_k` at the origin are independent, so
the quotient of `P` by them has a chart at the origin; `R` is its quotient by the kernel of that chart, a homogeneous prime killed by
every `O`-valued point derivation at the origin, smooth with the coordinates of `P` minus one for each `t_k`, and every `O`-valued
point derivation of `P` killing the `t_k` factors through `R` (a derivation of weight `χ` kills the homogeneous elements of other
weights, among them the `t_k` when `χ` carries none). The relations of `𝔘` and lifts of the `s_k` are the `q`; an `O/b`-valued
derivation of `𝔘` kills them, so its `O`-valued lift `δ` has `δ(q) ⊂ bO`. Homogeneity is preserved because the torus acts on
everything. (b) The long exact sequence of the cone complex defining `H¹_c` and `Ob` (its `H⁰` vanishes, a framed place
existing), Tate's local and global Euler characteristic formulas (`χ(·, M) = h⁰ − h¹ + h²`), and the end of the Poitou–Tate
sequence: in general `o_χ − a_χ = χ(Γ) − Σ_{framed} χ(G_v) − Σ_q (χ(G_q) + dim H¹(G_q/N_q) − h⁰(G_q)) + h³`, where
`h³ = dim coker(H²(Γ) → ⊕_{v ∈ Σ} H²(G_v))` is dual to `Hom_Γ(ad_χ, k(ω))` because the framed and condition places are exactly the
finite places of `Σ` (ArithmeticGaloisDuality R02.4.3, R02.5.1). A condition place lies away from `ℓ`, so `χ(G_q) = 0`, and
`dim H¹(G_q/N_q) = h⁰(G_q)` because `ℓ ∤ |I_q/N_q|` and `N_q` acts trivially; a framed place away from `ℓ` has `χ(G_v) = 0`; the framed
places above `ℓ` contribute `[F : ℚ] dim ad_χ`, which cancels the term `−[F : ℚ] dim ad_χ` of `χ(Γ) = Σ_{v | ∞} h⁰(G_v) − [F : ℚ] dim ad_χ`
(`ℓ` odd). (c) Lift the first-order map (dual to a basis of the point derivations of `R/I` at `x`) through the tower
`E[[t]]/(t)^N` by the lifting hypothesis; the limit `φ` kills `I`. If `φ(a) ∈ (t)^N`, then `ea ∈ (ker x)^N + I` for some `e ≠ 0` in `O`
(induction on `N` with homogeneous polynomials in parameters dual to the derivations); so the elements of `ker φ` die in the local
ring of `R/I` at `ker x` by Krull's intersection theorem, which gives `y`, and `P := ker φ` is the only minimal prime over `I` inside
`ker x`; `dim R/P = ht(ker x/P) + 1 = n + 1`. *Needs:* 3.6;
ReducibilityIdealsAndUltrafilterPatching §4.8; ArithmeticGaloisDuality R02.4.3, R02.5.1; Mathlib `Ideal.iInf_pow_eq_bot_of_isLocalRing`
(Krull's intersection theorem).

**Checks.**

- The term `dim Hom_Γ(ad_χ, k(ω))` of (b) is needed: for `Γ = G_{ℚ,{ℓ}}`, `r̄ = ω ⊕ 1`, frame `{ℓ}` and `χ` the weight of the entry
  `(1, 2)`, `ad_χ = k(ω)`; `H¹(Γ, ω) → H¹(G_ℓ, ω)` is injective (dimensions `1` and `2`), `H²(Γ, ω) = 0` and `H²(G_ℓ, ω) = k`, so
  `a_χ = 0` and `o_χ = 1`; on the other side `(ad_χ)^{c=1} = 0` (`ω` is odd) and `Hom_Γ(k(ω), k(ω)) = k`: `1 = 0 + 1`. Without the term
  the identity would read `1 = 0`.
- The `𝒢₃`-problem of 4.1 (frame `{ℓ}`, no elimination, eight normalization equations of weights `(0, 0, 1, −1, 2, −2, 1, −1)`, local
  chart `(1, 2, 3, 4, 2)` in weights `(−2, …, 2)`, `o_χ − a_χ = dim(ad_χ)^{c=1} = (0, 1, 1, 1, 0)` when `K` is not contained in the field
  cut out by `ω` and `Ψ̄`, which gives `Hom_Γ(ad_χ, ω) = 0` for all `χ`): excess `(0, −1, 0, +1, +1)`.
- The `GSp₄`-problem of 4.4 with fixed multiplier and frame `T = {ℓ} ∪ S_b`, `b = #S_b` (local chart `2 + b` on each positive root,
  `1 + b` on each negative root, `2 + 2b` in weight `0`; `o_χ − a_χ = 2, 1, 1, 0` for weight `0`, `Ψ`, `Ψ⁻¹`, the odd roots, the
  hypothesis `Hom_Γ(ad_χ, ω) = 0` holding because `ᾱ, β̄, θ̄` have conductor divisible by `2^m` and `Ψ̄` is even; eliminated
  `b + 1` coordinates on each odd root, from the frames at `S_b` and the block condition at the first marked element; `b + 1`
  equations added in each of the weights `Ψ`, `Ψ⁻¹` and `2b` in weight `0`): excess `+1` on `α, β, θ`, `0` on their inverses, on `Ψ` and
  in weight `0`, and `−1` on `Ψ⁻¹`.
- The `𝒢₃`-problem of 4.5 with frame `T_b`, `s = #S_b` (local charts `(1, 2, 3, 4, 2)` at `ℓ` and `(1, 2, 3, 2, 1)` at each place of
  `S_b`, in weights `(−2, …, 2)`; `o_χ − a_χ = (0, 1, 1, 1, 0)`, the hypothesis of (b) holding as `ℚ(i)` is not in the field cut out by `ω`
  and `Ψ̄`; no elimination: the eight normalization equations and the `s` frames at `S_b`, `(1, 2, 3, 2, 1)` each, as equations):
  excess `(0, −1, 0, +1, +1)`.
- The index condition at the condition places is needed: at `q ∤ ℓ` with `q ≡ 1 mod ℓ`, `N_q = 1` and `ad_χ = k`, the contribution
  `−(χ(G_q) + dim H¹(G_q/N_q) − h⁰(G_q))` is `−(0 + 2 − 1) = −1` (`H¹(G_q, k)` has the unramified and the tame line), not `0`.
- In (c), `R = O`, `I = 0`: `n = 0` and `φ` is the inclusion `O ⊂ E`, which is not continuous for the discrete topology of `E`;
  this is why no continuity is asked of a chart.

### 3.19 Spaces of symplectic residual lattices over totally real fields

*Setting.* `F` is a totally real field of degree `d`, `ℓ` an odd prime, `Γ = G_F`; for `v | ℓ`, `G_v ⊃ I_v` is a decomposition
group with its inertia group, `d_v = [F_v : ℚ_ℓ]`, `U_v = I_v ∩ ker χ_ℓ`. `ν : Γ → O^×` is a continuous character with `ν(c) = −1`
for every complex conjugation `c`; `χ̄₁, …, χ̄₄ : Γ → k^×` are characters with `χ̄_iχ̄_{5−i} = ν̄`, trivial on every `I_v`, and
`g₀ ∈ Γ` is an element at which the four take pairwise distinct values. `𝒩` is the set of elements of inertia groups at places
not above `ℓ` on which the four characters are trivial. Assume: no ratio `χ̄_i/χ̄_j`, `i ≠ j`, is equal to `ω` on `Γ`; `ν` is
trivial on `𝒩` and on every element of `G_v` (`v | ℓ`) a power of `ℓ` of which lies in the closure of the commutator subgroup of
`G_v` (the `ℓ`-power torsion of `G_v^{ab}`). Entries, roots and form are those of the Conventions, with `(χ̄₁, χ̄₂, χ̄₃, χ̄₄)` in place
of `(θ̄, Ψ̄, ᾱ, 1)`: `α, β, Ψ, θ` are the weights of the entries `(1, 2)`, `(2, 3)`, `(1, 3)`, `(1, 4)`, and the entry of weight `γ`
carries the ratio `γ̄` of the corresponding `χ̄_i`. As `ν(c) = −1`, `β̄` and `θ̄` are odd at every complex conjugation, and at each
complex conjugation exactly one of `ᾱ`, `Ψ̄` is; the statements below are of use when `Ψ̄` is even (as over the tower data of 3.20):
if `Ψ̄` is odd at every complex conjugation, the cocycles of `±Ψ` form a space of dimension at least `d` (Euler characteristic),
so the constant `C` below is at least `d` and the inequality of (c) cannot hold. The *weight algebra* `Λ` is the completed tensor
product over `O`, over the places `v | ℓ`, of the universal rings of pairs of characters of `I_v` lifting the trivial character and
trivial on the `ℓ`-power torsion of the image of `I_v` in `G_v^{ab}` (LocalGaloisDeformationRings §1.3): a power series ring in `2d`
variables over `O`. It maps to the rings below through `(ψ_{v,1}|_{I_v}, ψ_{v,2}|_{I_v})`; the other two inertial characters are
`ψ_{v,4} = νψ_{v,1}⁻¹` and `ψ_{v,3} = νψ_{v,2}⁻¹`.

A *lift* over a complete local `O`-algebra `C` is a pair `(r, (n_v)_{v | ℓ})`: `r : Γ → GSp₄(C)` a continuous homomorphism with
multiplier `ν`, with `r(g) = 1` for `g ∈ 𝒩` and `r(g₀)` diagonal; `n_v ∈ Sp₄(C)` lower unitriangular, with `n_v⁻¹r(s)n_v` upper
triangular for every `s ∈ G_v`, and with diagonal characters `ψ_{v,i} : G_v → C^×` (the diagonal entries of `n_v⁻¹rn_v`) trivial on
the `ℓ`-power torsion of `G_v^{ab}`. A *residual lattice* over `k′` or `k′[X]` (`k′ ⊃ k` finite) is such a pair `(r̄, (n̄_v))`, locally
constant, with `r̄(g)_{ii} = χ̄_i(g)`, `ψ̄_{v,i} = χ̄_i|_{G_v}`, and of one of two shapes: (*lower*) every off-diagonal entry of `r̄` not
identically zero has weight in `{−α, −β, −Ψ, −θ}`; (*reflected*) every such entry has weight in `{β, −α, −Ψ, −θ}` and every
off-diagonal entry of every `n̄_v` has weight in `{−α, −Ψ, −θ}`. Two residual lattices over `k′` are *linked* if they are the fibres
at `X = 0` and `X = 1` of a residual lattice over `k′[X]`. A root *occurs* in a residual lattice if some entry of `r̄` of that weight
is not identically zero.

*Good residual lattices.* A residual lattice is *good* if one of: (i) `−Ψ` occurs, and `β` or `−α` occurs; (ii) `−α` and `−β`
occur; (iii) the off-diagonal entries of `r̄` have weights in `{β, −α, −θ}`, every `n̄_v` has off-diagonal weights in `{−α, −Ψ, −θ}`
and nonzero entry `(3, 1)`, and `−α` occurs; (iv) the same conditions on `r̄` and the `n̄_v`, `β` and `−θ` occur, and `χ̄₁/χ̄₂` is
nontrivial on every `G_v`; (v) the
off-diagonal entries of `r̄` have weights in `{−β, −Ψ, −θ}`, every `n̄_v` has nonzero entry `(2, 1)`, and `−Ψ` occurs; (vi) the same
conditions, and `−β` and `−θ` occur. (In (iii), (iv) necessarily `χ̄₁ = χ̄₃` on every `G_v`; in (v), (vi), `χ̄₁ = χ̄₂` on every `G_v`.
The split lattice is not good.)

*The constant.* `C ≥ 1` is an integer such that: `F` has at most `C` places above `ℓ`; for each of the eight roots `γ`, the space
of locally constant cocycles of `Γ` in `k(γ̄)` that vanish on `𝒩` and at `g₀` and are coboundaries on every `G_v` has dimension
`≤ C`; the space of such cocycles without the last condition has dimension `≤ C` for `γ = ±Ψ`, and `≤ d + C` for the six roots
`±α, ±β, ±θ`; and `Hom(Γ/⟨𝒩⟩, k)` has dimension `≤ C`; and for each of the six roots `±α, ±β, ±θ`, the sum over `v | ℓ` of the
dimensions of the spaces of locally constant cocycles of `G_v` in `k(γ̄)` is `≤ d + C`.

*Prove:* (a) (*the space*) for every finite extension
`k′` of `k`, with `O′` the unramified extension of `O` with residue field `k′`, there are a complete local noetherian `O′`-algebra `B`
with residue field `k′`, a `B`-algebra `A` of finite type with `B → A` injective, and a pair `(r, (n_v)_{v | ℓ})` over `A` satisfying the
conditions of a lift (multiplier `ν`; `r = 1` on `𝒩`; `r(g₀)` diagonal; `n_v` symplectic and lower unitriangular; `n_v⁻¹r(s)n_v` upper
triangular for `s ∈ G_v`; diagonal characters trivial on the `ℓ`-power torsion of `G_v^{ab}`), the entries of `r` being continuous for
the `𝔪_BA`-adic topology, such that: (gen) `A` is generated over `B` by the entries of `r` and of the `n_v`; (inv) the coefficients of
the characteristic polynomials of the `r(g)` and the values `ψ_{v,i}(s)`, `s ∈ G_v`, lie in `B`, are continuous in `g`, `s` for the
`𝔪_B`-adic topology, and reduce modulo `𝔪_B` to those of `⊕χ̄_i`; (genB) two `O′`-algebra homomorphisms from `B` to a complete local
noetherian `O′`-algebra with residue field `k′` that agree on these elements are equal; (univ) every lift of a residual lattice over
`k′`, over a complete local noetherian `O′`-algebra `C` with residue field `k′`, is the image of the pair under a unique `O′`-algebra
homomorphism `A → C`; (line) every residual lattice over `k′[X]` is the image of the pair under an `O′`-algebra homomorphism
`A → k′[X]` that kills `𝔪_B`. The weight algebra `Λ → B` is the map given by the characters `ψ_{v,i}|_{I_v}`. For a `k′`-point `x` of `A`
whose pair is a residual lattice, the completion `R_x` of `A` at `x` is flat over `A` and, with the image of the pair, is the universal
ring of lifts of `x`. No grading of `A` and no action of the rank-two torus on `Spec A` is asserted, and `B` is not asserted to be a
ring of invariants ([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/RedIdeal.lean`
(`UpperTheory.V.Ws.Space`));

(b) (*presentation*) at **every** residual lattice `x`: `R_x ≅ O′[[x₁, …, x_N]]/(f₁, …, f_{N′})` (`O′` the unramified extension of `O`
with residue field `k′`) with `N − N′ ≥ 2d + 2 − 2·#{v | ℓ}`; hence any two minimal primes of `R_x` are joined by a chain of minimal
primes in which consecutive members `P, Q` satisfy `dim R_x/(P + Q) ≥ 2d + 2 − 2·#{v | ℓ}` (stated in [FormalProof] for the
layers of the tower data of 3.20);

(b′) (*reducible loci*) the representation over the fraction field of `R_x/𝔭`, `𝔭` a prime, is not absolutely irreducible if and
only if its off-diagonal support lies in one of nine sets of roots: the eight sets `{γ, −γ} ∪ U` (`γ ∈ {α, β, Ψ, θ}`, `U` the roots
of the unipotent radical of one of the two parabolic subgroups containing the torus with Levi roots `±γ`), and `{±β, ±θ}`. At a
good residual lattice, for each of the eight sets `S` the locus of `R_x` where the support lies in `S` has dimension
`≤ d + 20C + 1`; in cases (i)–(iv) so has the locus of `{±β, ±θ}`; in cases (v), (vi), at every prime of the locus of `{±β, ±θ}` and
for every `v | ℓ`, either `ψ_{v,1} = ψ_{v,2}` on `G_v` or `ψ_{v,2} = ψ_{v,4}` on `G_v` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/CuspidalTwists/PromodularityCaseThree.lean`
(`UpperTheory.V.Cu.RedA`), `Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/RedIdeal.lean`
(`UpperTheory.V.Ws.Fr.Good`));

(b″) (*fibres and coincidences*) for a prime `𝔮` of `R_x` at which the representation is absolutely irreducible, or has support in
`{±β, ±θ}` with these four roots occurring: `dim R_x/𝔮 ≤ dim B/(𝔮 ∩ B) + 2 + 4·#{v | ℓ}`. For an ideal `M ⊂ B` with `B/M` finite
over `Λ`, a prime `𝔮 ⊃ (M, ϖ)` of `B` containing `ψ_{v,i}(s) − ψ_{v,j}(s)` for all `s ∈ U_v`, for some `v | ℓ` and `i ≠ j`, has
`dim B/𝔮 ≤ 2d + 1 − d_v` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/CuspidalTwists/PromodularityCaseThree.lean`
(`UpperTheory.V.Cu.FibY`));

(c) (*propagation at a good lattice*) assume `d > 20C + 2·#{v | ℓ}` and `d_v > 2 + 6·#{v | ℓ}` for every `v | ℓ`, and let `J ⊂ B` be an
ideal with `B/J` finite over `Λ` satisfying (P1₄): whenever a prime of dimension one and characteristic `ℓ` of some `R_x`, at which
the representation is absolutely irreducible with pairwise distinct ordinary characters on every `U_v`, contains `J`, every prime
below it contains `J`. Then at every good residual lattice, if one irreducible component of `Spec R_x` lies in `V(J)`, all do.
In [FormalProof] this statement is made for the layers of the tower data of 3.20 on which `ψ` has order prime to `ℓ`, for
ideals `J` with all the clauses of 3.20(e), and under the single inequality `30(C + 1)² ≤ d`, which for an abelian field (equal
local degrees above `ℓ`) gives the two inequalities above. The form above is what its route uses;

(d) (*lines*) if `x, x′` are linked and **every** irreducible component of `Spec A` through `x′` lies in `V(J)`, then some
irreducible component through `x` does ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/CompactIntegralFields/AlgHomResUnique.lean`
(`UpperTheory.V.Ws.conn`)).

The route of (a) uses ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, whose routes are not given in full (see there), and through (a) so do the routes of (b″), (c) and (d) (the rings `B ⊂ A` and the identification of `R_x`); in (b) and (b′), `R_x` may be read as the universal ring of lifts of `x`, which exists without (a).

*Route.* (a) *The universal ring.* Call a *datum* over a complete local noetherian `O′`-algebra with residue field `k′` a
continuous `r` (multiplier `ν`, trivial on `𝒩`, `r(g₀)` diagonal, diagonal entries reducing to the `χ̄_i`) together with four
continuous characters of each `G_v` lifting the `χ̄_i`, unrelated to `r`; it is *near for a cocharacter `τ : ℤ² → ℤ`* if its
off-diagonal entries of `τ`-weight `≤ 0` lie in the maximal ideal. The data near for `τ = 0` have a universal ring `R`, the
completed tensor product of the universal ring of such `r` and of the universal rings of the characters. *The weighted
presentation.* The entries minus their residual constants and the character values minus theirs lie in the maximal ideal,
separate homomorphisms from `R`, and are multiplied by the characters of their weights under conjugation by the diagonal torus;
by ReducibilityIdealsAndUltrafilterPatching §6.14, `R` is a quotient of a power series ring in finitely many of them by a homogeneous
ideal, and each entry lies in the image `R_w` of the power series of its weight. *The core.* `A₀ := ⊕_{w∈ℤ²} R_w ⊂ R` and
`B₀ := R_0`: by ReducibilityIdealsAndUltrafilterPatching §6.15, `B₀` is complete local noetherian with residue field `k′`, `A₀` is of
finite type over `B₀`, generated by the entries, and the characteristic polynomials of the `r(g)` and the character values have
their coefficients in `B₀`. *Generation of the weight-zero part.* `𝔪_{B₀}` is generated by `𝔪_{O′}` and weight-zero monomials in
the coordinates, each a polynomial in the character values and in weight-zero products of entries of `r`. Such a product lies in
the ring `E` generated by the traces `tr r(g)`, the multipliers, the diagonal entries `d_i` of `r(g₀)` and the inverses of the
`d_i − d_j`: the `E`-algebra spanned by `r(Γ)` contains the diagonal idempotents (interpolation in `r(g₀)`), has its traces in `E`
and is stable under the symplectic adjoint (`adj r(g) = ν(g)r(g⁻¹)`); a product of entries along cycles is a trace of a product
cut by idempotents, and a weight-zero product becomes a product of cycles after replacing some entries `(i, j)` by the entries
`(5 − j, 5 − i)` of the adjoints. Each `d_i` is the root of the characteristic polynomial of `r(g₀)` in its residue class. This
gives (genB) for `B₀`. *Near data are points.* For every `τ` and every datum `Q` near for `τ` over an artinian `C`: the datum with
entries `T^{τ(w)}Q_w` is near for `0` over the ring of ReducibilityIdealsAndUltrafilterPatching §6.16, so it is classified by
`F : R → C((T))`; `F` maps `R_w` into `T^{τ(w)}C`, and `F` followed by `T ↦ 1` is a homomorphism `A₀ → C` carrying the universal
datum to `Q`. For general `C`, pass to the limit over `C/𝔪^N`: a homomorphism from `A₀` is determined by the coordinates.
*Flags.* `A` is the quotient of the polynomial algebra over `A₀` on the entries of the `n_v` by the flag equations (`n_v`
symplectic and lower unitriangular; `n_v⁻¹r(s)n_v` upper triangular for `s ∈ G_v` with diagonal entries the characters of the
datum; these trivial on the torsion). A lift of a residual lattice, with the diagonal characters of the `n_v⁻¹rn_v`, is near for
`τ(w) = −2w₁ − w₂` (reflected shape) or `τ(w) = −w₁ − 2w₂` (lower shape): these are positive exactly on `{β, −α, −Ψ, −θ}`, resp.
`{−α, −β, −Ψ, −θ}`. This gives (univ). `B` is the image of `B₀` in `A`, and `A ≠ 0` because the split lattice is a point.
Uniqueness in (univ) follows from (gen) and (genB): two homomorphisms giving the same pair agree on the entries, and on `B`
because the characteristic polynomials and the `ψ_{v,i}` are determined by the pair. The completion of the noetherian algebra
`A` at `x` is flat and universal among homomorphisms to complete local rings over `x`. Of the Setting, (a) uses only: `Γ`
profinite, the `G_v` closed, `χ̄_iχ̄_{5−i} = ν̄`, the `χ̄_i` trivial on `𝒩` and on the torsion sets and pairwise distinct at `g₀`,
and the finiteness of `Hom_cont(H, ℤ/ℓ)` for the open subgroups `H` of `Γ/⟨𝒩⟩` and of the `G_v`; not `ν(c) = −1`, the condition
on `ω`, the triviality of the `χ̄_i` on the `I_v`, that `Γ` is a Galois group, or that `ℓ` is odd. *Route of (line).* A residual lattice over `k′[X]` is a lift over `k′[[X]]` of its fibre at `X = 0`;
(univ) gives a homomorphism `A → k′[[X]]`, which on `B` is the constant map by (genB) (the characteristic polynomials and the
ordinary characters of a residual lattice are those of `⊕χ̄_i`); the generators of `A` go to polynomials, so the map lands in
`k′[X]` and kills `𝔪_B`. (b) `R_x` is the universal ring of lifts of `x`. Let
`ad = 𝔰𝔭₄(x)` (dimension `10`) and `b_v ⊂ ad` the Borel subalgebra of the flag `n̄_v` (dimension `6`). The lifts without the torsion
condition are governed by the cone of `C(Γ′, ad) → ⊕_{v | ℓ} C(G_v, ad/b_v)`, `Γ′` the quotient of `Γ` by the closed normal
subgroup generated by `𝒩` (a balanced condition: `r̄(I_u)` has order prime to `ℓ`): the first-order lifts with `r(g₀)` diagonal form
a space of dimension `h¹_c − h⁰_c + 2` (the cocycles of the cone have dimension `h¹_c + 10 − h⁰_c`, and the normalization removes
exactly the `8` coboundaries of off-diagonal elements, `r̄(g₀)` being regular), and the obstructions lie in `H²_c`, so `R_x` has a
presentation with `h¹_c − h⁰_c + 2` variables and `h²_c` relations (GlobalGaloisDeformations §§8.3–8.4). Tate's global and local
Euler characteristic formulas give `h⁰_c − h¹_c + h²_c − h³_c = Σ_{v | ∞} dim ad^{c_v} − 10d + Σ_{v | ℓ} 4d_v = −2d`: at a complex
conjugation `ν = −1`, so `r̄(c)` has eigenvalues `1, 1, −1, −1` on two Lagrangian planes, its centralizer in `𝔰𝔭₄` is `𝔤𝔩₂` and
`dim ad^c = 4`. `h³_c` is a quotient of the dual of `Hom_{Γ′}(ad, k(ω))` (the end of the Poitou–Tate sequence); the constituents
of `ad` are `1` and the ratios `χ̄_i/χ̄_j`, none equal to `ω` on `Γ` (`ω ≠ 1` on `G_F`, `F` being real and `ℓ` odd), so this vanishes
for every residual lattice, whatever its extension classes. Hence `h¹_c − h⁰_c − h²_c = 2d` and the excess is `≥ 2d + 2`. The
torsion condition is two equations at each place above `ℓ` (`ψ_{v,1}(ζ_v) = ψ_{v,2}(ζ_v) = 1` for a generator `ζ_v` of the `ℓ`-power
torsion of `G_v^{ab}`; the other two follow from `ψ_{v,i}ψ_{v,5−i} = ν` because `ν(ζ_v) = 1`): `N − N′ ≥ 2d + 2 − 2·#{v | ℓ}`. Then
`c(O′[[x₁, …, x_N]]) = N + 1`, and the connectedness bound by arithmetic rank (DeformationAndDerivedPatchingAlgebra §6.6, after
Grothendieck) gives `c(R_x) ≥ N − N′`, which is the chain statement (the zero ideal is chained in that dimension, ReducibilityIdealsAndUltrafilterPatching §6.10). (b′) The span of the image contains the diagonal idempotents
(`r(g₀)` is regular), so it is spanned by the matrix units `E_{ij}` of a transitive relation on `{1, …, 4}`; it is not `M₄` if and
only if some coordinate subspace `⟨e_i : i ∈ I⟩`, `I` proper and nonempty, is stable, and with it its orthogonal: `#I = 1` or `3`
gives the four lines (Levi roots `±β` or `±θ`), `#I = 2` isotropic the four Lagrangian planes (Levi roots `±α` or `±Ψ`), and
`#I = 2` nondegenerate `⟨e₁, e₄⟩ ⊕ ⟨e₂, e₃⟩`. A locus of type `S` through `x` forces every root occurring in `x` into `S`, and its
dimension is at most one more than that of the space of first-order lifts of `x` of type `S`. That space does not grow when `x` is
degenerated along a cocharacter `m` with `m_i + m_{5−i}` constant for which every entry of `r̄` and of the `n̄_v` has degree `≥ 0`:
the equations of the tangent space are linear with coefficients of degree `≥ 0`, whose degree-zero parts are the equations at
the limit, and a filtered space has the dimension of its graded space. The cocharacters `(0, 2, 1, 3)` (reflected shape) and
`(0, 1, 2, 3)` (lower shape) give the split lattice with flags `1`, for (i), (ii); `(0, 1, 0, 1)` gives flags `1 + b_v(E₃₁ + E₄₂)`,
`b_v = (n̄_v)₃₁ ≠ 0`, which exist as `χ̄₁ = χ̄₃` on `G_v`, for (iii), (iv); `(0, 0, 1, 1)` gives flags `1 + b_v(E₂₁ − E₄₃)`,
`b_v = (n̄_v)₂₁ ≠ 0`, for (v), (vi). At the limit the flag condition on a tangent vector `Z` (a cocycle equal on `G_v` to a coboundary
modulo the flag) is explicit: for flags `1`, every entry of `Z` below the diagonal vanishes; for `1 + b(E₃₁ + E₄₂)`,
`Z₂₁ = −bZ₂₃`, `Z₄₁ = −b²Z₂₃`, `Z₃₂ = 2bZ₁₂ + b²Z₁₄`; for `1 + b(E₂₁ − E₄₃)`, `Z₃₂ = Z₄₁ = Z₃₁ = Z₄₂ = 0` and
`Z₂₁ = b²Z₁₂ + b(Z₁₁ − Z₂₂)`. A finite check over the types containing the roots that occur shows that, on the subspace where one
odd root entry and the diagonal vanish, every odd root entry of a tangent vector is a coboundary on every `G_v` (for instance at
(iii) and the type of the line `e₂`, `−β, α` do not occur in the type, so the last relation makes `b²` times the `θ`-entry a
coboundary, and `β` is the root removed); the only exception is the type `{±β, ±θ}` at (vi), where `β` and `θ` are both free. The
count is then `d + C` for the removed root, `2C` for the diagonal, `10C` for the ten entries (strict cocycles on the odd roots,
cocycles on `0, ±Ψ`) and `6C` for the frames: `d + 19C ≤ d + 20C`. On `{±β, ±θ}`: if `r` preserves `⟨e₁, e₄⟩ ⊕ ⟨e₂, e₃⟩` and `(n_v)₂₁` is
invertible, both components of the first flag vector are eigenvectors of `G_v` with character `ψ_{v,1}`; each block has
determinant `ν = ψ_{v,1}ψ_{v,4}`, so `ψ_{v,2}(s) ∈ {ψ_{v,1}(s), ψ_{v,4}(s)}` for every `s ∈ G_v`, and a group is not the union of two
proper subgroups. (b″) An absolutely irreducible representation with `r(g₀)` diagonal is determined by its traces up to the
rank-two torus, and a flag at `v` by four parameters; the same holds on `{±β, ±θ}` when the four roots occur. For the coincidence
bound: `Λ/(ϖ)` has dimension `2d` (at each place `u` two inertial characters are free, each with `d_u` parameters by local class field
theory, the other two being fixed by `ν`), `B/M` is finite over `Λ`, and a coincidence on `U_v` fixes `d_v − 1` of these parameters (the
image of `U_v` in the pro-`ℓ` completion of `G_v^{ab}` has `ℤ_ℓ`-rank `d_v − 1`, the cyclotomic character having infinite image on
`I_v`): `dim B/𝔮 ≤ 2d − (d_v − 1)`. (c) Put
`n = 2d + 1 − 2·#{v | ℓ}`. Adjacent components `P ∋ J`, `Q` meet in dimension `≥ n + 1` by (b), so `R_x/(P + Q + (ϖ))` has dimension
`≥ n`; the loci of (b′) have dimension `< n` by the first inequality; a prime containing `(J, ϖ)` and a coincidence ideal and on
none of those loci has dimension `≤ (2d + 1 − d_v) + 2 + 4·#{v | ℓ} < n` by (b″) (with `M = J`) and the second inequality. By prime
avoidance there is a prime `𝔭 ⊃ P + Q + (ϖ)` of dimension one on none of them, and in cases (v), (vi) it avoids `{±β, ±θ}` by the last
clause of (b′); there the representation is absolutely irreducible with pairwise distinct ordinary characters on every `U_v`,
and (P1₄) at `𝔭` gives `J ⊂ Q`. Induct along the chain of (b). (d) By (line) a residual lattice over `k′[X]` is a `k′[X]`-point of `A`; its
kernel is a prime contained in both closed points, and a minimal prime below it is an irreducible component through both. It
lies in `V(J)` because every component through `x′` does, and it passes through `x`. *Needs:* 3.6, 3.11;
DeformationAndDerivedPatchingAlgebra §6.6 and ReducibilityIdealsAndUltrafilterPatching §§6.10, 6.14–6.16; GlobalGaloisDeformations §§8.3–8.4; ArithmeticGaloisDuality R02.4.3, R02.5.1;
ClassFieldTheory Layer 7.

**Checks.**

- The split lattice `x = ⊕χ̄_i` (flags `1`) must be excluded from goodness, and is (no root occurs): for cocycles `c_α`, `c_θ` of
  the odd root characters of `α` and `θ` with values in the maximal ideal and `N_α = E₁₂ − E₃₄`, `N_θ = E₁₄` the root vectors, the
  lifts `x·(1 + c_αN_α + c_θN_θ)` are representations (`N_αN_θ = N_θN_α = 0`), are upper triangular, hence lifts with flags `1`, and
  form a reducible locus of dimension `≥ 2d − O(C)` (each odd character has at least `d` independent cocycles, its Euler
  characteristic over `F` being `−d`), above the bound `d + 20C + 1` of (b′) for large `d`.
- The smallest cases of (b): for `F = ℚ` the excess without the torsion condition is `2d + 2 = 4`, the two free inertial weights
  of an ordinary family with fixed multiplier and the rank-two torus. The same computation for `GL₂` with fixed determinant gives
  `Σ_{v | ∞} dim(ad⁰)^{c_v} − 3d + Σ_{v | ℓ} d_v(3 − 2) = d − 3d + d = −d`, hence excess `d + 1` after the normalization (of the `3`
  coboundary directions it removes the `2` off-diagonal ones and keeps the torus), which for `F = ℚ` is `2`: the relative dimension `1` of a Hida
  family plus the torus.
- `ν(c) = −1` is needed in (b): with `ν(c) = 1` the eigenvalues of `r̄(c)` are `(ε₁, ε₂, ε₂, ε₁)`, so `r̄(c)` is `±1` or conjugate to
  `diag(1, −1, −1, 1)`, `dim ad^c ∈ {10, 6}`, and the count gives an excess of at most `2`, not `2d + 2`.
- (d) cannot be strengthened to "some component through `x′` gives some through `x`": in the union of the lines `Y = 0` and `X = 0`
  of the plane over `k′`, with `J = (Y)`, the line `X = 0` joins `x′ = (0, 0)` to `x = (0, 1)`; a component through `x′` lies in
  `V(J)` while the only component through `x` does not. So in a chain every lattice must be good, the first included: at a good
  lattice (c) turns "some" into "all" before the next link.
- `B` is not the ring of torus invariants of `A`: take `F = ℚ`, `ℓ = 3`, `k = 𝔽₈₁`, `η` the sign character of the splitting field of
  `X³ − X + 3` (group `S₃`, discriminant `−239`, three distinct roots modulo `3`), `τ` a character of order five and conductor `11`,
  `(χ̄₁, …, χ̄₄) = (τ, η, 1, ητ⁻¹)`, `ν = η`, and `r = τ ⊕ (the affine representation of S₃ on ⟨e₂, e₃⟩) ⊕ ητ⁻¹`, upper triangular with
  one nonzero entry, of weight `β`: with flag `1` a residual lattice of the reflected shape. The decomposition group at `3` acts on
  `⟨e₂, e₃⟩` by scalars, so with `r` kept constant, `n₃ = 1 + tE₃₂` over `k[[t]]` is a lift of it; all characteristic polynomials
  and all `ψ_{v,i}` are constant, while the element `r₂₃(g)(n₃)₃₂` of `A`, of weight zero for the whole torus, takes the value `t` at
  a translation `g` with `r₂₃(g) = 1`. By (genB) the classifying map of this lift and that of the constant lift agree on `B`; they
  differ on `A`.
- The core `A₀` of the route of (a) is graded by `ℤ²` with weight-zero part `B₀` and graded pieces finite over `B₀`. With the
  entries of the `n_v` given the weights of their positions the flag equations are homogeneous, so `A` is graded over `A₀`; its
  weight-zero part is larger than `B` (the previous Check).

### 3.20 Towers, chains of lattices, seeds and Hecke ideals for the symplectic problem

The data are those of the setting of 4.4 (which uses only Layer 0): the host field `E`, `ℓ`, `2 ≤ e < t`, `ψ ∈ X(E, e)` in Case II or
Case III, `ξ`, `α, β, θ`, `r̄₀ = diag(θ̄, Ψ̄, ᾱ, 1)`, `S`, `S_b`, `T`, the conditions (G1), (G2), and *tower fields* as defined there.

*Tower data.* A *tower datum* is `T = (K, F_T, g_T)`: `K` an imaginary quadratic field in which the primes of `S` split, `F_T` a
totally real abelian field of even degree, `g_T ∈ G_{F_T}`, such that `L_T = F_T·K` is a tower field (4.4) and the four residual
characters are pairwise distinct at `g_T`. It is *tame at `ℓ`* if the inertia groups at `ℓ` act on `F_T` through quotients of
order prime to `ℓ`. An *`ℓ`-extension* of it is a triple `(K, F′, g_T^{ℓ^j})` with `F′ ⊃ F_T` totally real abelian and
`g^{ℓ^j} ∈ G_{F′}` for all `g ∈ G_{F_T}` (so `F′/F_T` has `ℓ`-power degree); the `m`-th layer `F_{T,m}` of the cyclotomic
`ℤ_ℓ`-extension of `F_T`, with `g_T^{ℓ^m}`, gives one. An *ordering* of the residual characters is `(θ̄, Ψ̄, ᾱ, 1)` or, only if `Ψ̄` is
trivial on the decomposition group at `ℓ`, `(ᾱ, 1, θ̄, Ψ̄)` (the basis in the order `e₃, e₄, e₁, e₂`, for which the form changes by a
sign). *3.19 over `T`* (for an ordering) is 3.19 with `F = F_T`, `ν = θ|_{G_{F_T}}`, `(χ̄₁, χ̄₂, χ̄₃, χ̄₄)` the four residual characters in
that ordering, restricted to `G_{F_T}`, and the marked element `g_T`. Its
hypotheses hold by the definition of tower fields, for either ordering (`χ̄₁χ̄₄ = χ̄₂χ̄₃ = θ̄` in both): `ν(c) = −1` as `θ` is odd; the four characters are trivial on the inertia
groups above `ℓ`, and no ratio of two of them is `ω` on `G_{F_T}`; `ν` is trivial on `𝒩`, since an inertia element away from `ℓ`
killed by `r̄₀` is killed by `ψ`, by `χ_ℓ` and `ω`, and by `ξ` (of order prime to `ℓ`, with `ξ̄ = ᾱ` there); and `ν(g) = 1` for an
element `g` of a decomposition group `G_v`, `v | ℓ`, whose image in `G_v^{ab}` has `ℓ`-power order, since then `χ_ℓ(g) = 1`, so that
`g ∈ G_{F_T(μ_{ℓ^∞})}`, on which `ψ` has order prime to `ℓ`, as have `ξ` and `ω`, while `ν(g)` has `ℓ`-power order.

Prove:

(a) (*data*) there is a tower datum `T₀ = (K, F₀, g₀)` tame at `ℓ` such that: in Case III (where `ℓ ≥ 5`, `S_b = ∅` and `ℓ ∤ o_ψ`,
by 0.3), `ᾱ|_{G_{F₀}}` is the character of `F₀K′/F₀` for an imaginary quadratic field `K′` in which `ℓ` and the primes of `S`
split, with `K′ ⊄ L_{T₀}` (in the route, `K′ = ℚ(√−q)` for a prime `q ∉ S` that splits in `K`), that is, `ᾱ` is nontrivial on
`G_{L_{T₀}}`, as the definition of a tower field requires; in Case II, `Ψ̄|_{G_{F₀}}` is the character of `F₀k₀/F₀` for a real
quadratic field `k₀` in which `2` and `ℓ` split, it is unramified everywhere and trivial on the decomposition groups above `ℓ`, and
`ᾱ⁴ ≠ 1` at some element of every decomposition group of `F₀` above `ℓ` and of every inertia group of `F₀` above `2` (follows from
[FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/NearSplit.lean`
(`UpperTheory.V.Ws.Tower.Ok`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/CuspidalTwists/PromodularityCaseThree.lean`
(`UpperTheory.V.Cu.Four`));

(a′) (*stability*) every `ℓ`-extension of a tower datum is a tower datum; an `ℓ`-extension of `T₀` of (a) has the properties listed
in (a), tameness at `ℓ` apart, with the same `K` (and the same `k₀`, resp. `K′`) (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/CompactIntegralFields/PowOneInj.lean`
(`UpperTheory.V.Ws.leFit`), `Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/NearSplit.lean`
(`UpperTheory.V.Ws.Tower.Le`));

(b) (*uniform constant*) for a tower datum `T₁` tame at `ℓ` there is an integer `C ≥ 1` that is a constant of 3.19 (the conditions
under *The constant*) over every layer `F_{T₁,m}` of the cyclotomic `ℤ_ℓ`-extension of `F_{T₁}`; `ψ` has order prime to `ℓ` on
`G_{F_{T₁,m}}` for all large `m`; and as `[F_{T₁,m} : ℚ]` and the local degrees above `ℓ` grow like `ℓ^m` while the number of places above
`ℓ` stays bounded, the inequalities of 3.19(c) hold over `F_{T₁,m}` for all large `m` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/CompactIntegralFields/X2.lean` (`UpperTheory.V.Ws.x2`));

(c) (*chains*) for a tower datum `T₀` of (a) and every lift `ρ` of type `𝒟_sp` to a complete discrete valuation ring of
characteristic `0` or `ℓ` that is absolutely irreducible, or a nonsplit block triangular extension in which `⟨e₂, e₄⟩` is stable
(the entries of positive `λ`-weight vanish) and absolutely irreducible, there are: a lattice of `ρ` over `ℚ`, for the ordering that
the flag of `ρ` requires (after relabelling by the second ordering when no lattice of `ρ` has lower unitriangular flags in the
first; this can happen only if `Ψ̄` is trivial on the decomposition group at `ℓ`, where `θ̄ = ᾱ`), whose reduction `c` is of the
reflected shape with flag supported on `{−α, −Ψ, −θ}`, in which `β` occurs, and in which either `−Ψ` occurs, or the support lies in
`{β, −α, −θ}`, the flag has nonzero entry `(3, 1)`, `Ψ̄` is trivial on the decomposition group at `ℓ` and the `β`-entry is not a
coboundary there; a finite set `W` of primes `w ∉ S`, `w ≡ 1 mod ℓ`, completely split in `F₀` and in the fields cut out by `r̄₀` and
`ω`; and the `ℓ`-extension `T₁` of `T₀` by the subfields of degree `ℓ` of the `ℚ(μ_w)`, `w ∈ W`, tame at `ℓ`; such that over every
`ℓ`-extension `T` of `T₁` on which `ψ` has order prime to `ℓ` there is a seed (d), and `c|_{G_{F_T}}` (with the flags induced by that
of `ρ`) is joined to the residual lattice of the seed by a finite chain of links through good residual lattices of 3.19 over
`T`, the two ends included (Case II: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/Chain2.lean`
(`UpperTheory.V.Ws.deep_tower_residue_chain_exists`); Case III: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PromodularityCaseThree.lean`
(`UpperTheory.V.Cu.RankFourChainReductionDense`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/CuspidalTwists/PromodularityCaseThree.lean`
(`UpperTheory.V.Cu.Chain4`));

(d) (*seeds*) the two existence statements below are theorems of [FormalProof] whose route is not given here (their two constructions are outlined after the routes). A *seed* over a tower datum `T` is a lift of 3.19 over `T` with values in the ring of integers of a
finite extension of `Φ`, absolutely irreducible on `G_{L_T(μ_{ℓ^∞})}`, whose ordinary characters satisfy `ψ_{v,i}² = χ_ℓ^{h_i}` on an
open subgroup of each `I_v` for integers `h₁ > h₂ > h₃ > h₄` of one parity with `h_i − h_{i+1} ≥ 4`, and such that for a continuous
character `κ′` of `G_{L_T}` with `κ′² = χ_ℓ^a` up to finite order on the inertia groups above `ℓ`, `a ≡ h₁ mod 2`, the representation
`(r|_{G_{L_T}}) ⊗ κ′` is attached to a regular algebraic cuspidal representation `Π` of `GL₄(𝔸_{L_T})` satisfying the *window
clause*: for some real `t`, at every finite place `w` of `L_T`, `Π_w` has cuspidal support made of characters `ξ` of `L_{T,w}^×` with
`(Nw)^{t−1/2} < |ξ(ϖ_w)| < (Nw)^{t+1/2}`. For `T₀` of (a) there are `W` and
`T₁` as in (c) such that over every `ℓ`-extension of `T₁` on which `ψ` has order prime to `ℓ` there is a seed whose residual lattice
is good: by (vi) in Case III, by (iii) or (iv) in Case II (in (iv) the clause on `χ̄₁/χ̄₂ = ᾱ` holds by the clause of (a) on `ᾱ⁴` at the
decomposition groups above `ℓ`). In Case III the reduction of the seed is supported on `{−β, −Ψ, −θ}`, with every flag entry `(2, 1)`
nonzero and `−β`, `−θ` occurring, and it is the restriction of one lower lattice of `T₀` ramified at most at one prime `w`, for
every `ℓ`-extension in which `w` dies; in Case II it is supported on `{β, −α, −θ}`, with flags in `{−α, −Ψ, −θ}`, nonzero flag
entries `(3, 1)`, and `−α` occurring or `β` and `−θ` occurring;

(d₂) (*the induced factor, Case III*) Let `ℓ` be odd, `K′` an imaginary quadratic field of discriminant prime to `ℓ` in which `ℓ`
splits, and `g₀ ∈ G_ℚ ∖ G_{K′}`. A *`τ`-datum of exponent `m ≥ 1` for a continuous character `κ₁` of `G_{K′}`* over the integers
`O₁` of a finite extension of `ℚ_ℓ` is a continuous `τ : G_ℚ → GL₂(O₁)`, orthogonal for the form `diag(1, −1)`, with
`τ(g₀) = diag(1, −1)`, congruent to `1 ⊕ η_{K′}` modulo the maximal ideal, whose restriction to `G_{K′}` is the sum of `κ₁` and its
conjugate, where `κ₁` is unramified outside `ℓ`, is the `ℓ`-adic character of an algebraic Hecke character of `K′` of infinity
type `(−m, m)`, and is `χ_ℓ^m` on the inertia group at one place above `ℓ` and `χ_ℓ^{−m}` at the other. There are `m ≥ 1`, `O₁` and
`κ₁` such that for every `j ≥ 1` and every larger coefficient ring there is a `τ`-datum of exponent `mj` for `κ₁^j` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/CuDefsA.lean`
(`UpperTheory.V.Cu.TauExAlt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/CuFinal.lean`
(`UpperTheory.V.Cu.tauEx'`), `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/CuspidalTwists/TnOne.lean`
(`UpperTheory.V.Cu.TauDat`));

(d₃) (*automorphy of the tensor product, Case III*) Let `ℓ` and `K′` be as in (d₂), `ρ : G_ℚ → GL₂(ℚ̄_ℓ)` continuous,
irreducible on every open subgroup and attached to a plain (3.22(b′)) regular algebraic cuspidal automorphic representation of
`GL₂(𝔸_ℚ)`, `g₀ ∈ G_ℚ ∖ G_{K′}`, and `(m, O₁, κ₁)` such that a `τ`-datum of exponent `m` for `κ₁` over `O₁` exists. There is
`j ∈ {1, …, 9}` such that, for every lattice `ρ₁` of `ρ` over `O₁`, every `τ`-datum `τ` of exponent `mj` for `κ₁^j` over `O₁`, and
every totally complex field `L`, abelian over `ℚ`, with `K′ ⊄ L`, such that every prime `p` either splits in `K′` or is different
from `ℓ` with `K′L/L` and `ρ|_{G_L}` unramified at the places above `p`, and such that `(ρ₁ ⊗ τ)|_{G_L}` is irreducible:
`(ρ₁ ⊗ τ)|_{G_L}` is attached to a regular algebraic cuspidal automorphic representation of `GL₄(𝔸_L)`, and every regular
algebraic cuspidal automorphic representation of `GL₄(𝔸_L)` to which it is attached satisfies the window clause of (d) at every
finite place ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/AutomorphyLifting/PrimeIndexConstruction/RankFourAutomorphyOfTensor.lean`
(`UpperTheory.V.Z.Win.Birth.RankFourAutomorphyOfTensor`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AutomorphicLiftGsp4OfInputs.lean`
(`UpperTheory.V.Cu.rank_four_automorphy_of_tensor_of_base_change_of_induction`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/AutomorphyLifting/PrimeIndexConstruction/RankFourAutomorphyOfTensor.lean`
(`UpperTheory.V.Z.Win.Birth.OffW`));

(d₄) (*the mixed-weight form, Case II*) Let `F` be a totally real field of even degree in which the odd prime `ℓ` splits
completely, `ξ₁` a character of `G_F` of finite order with `ξ₁(c) = −1` for every complex conjugation `c`, unramified above `ℓ`,
ramified at some place of norm `2`, with `ξ₁² ≢ 1` at some element and `ξ₁ ≢ 1` at some element of every decomposition group
above `ℓ` (congruences modulo the maximal ideal), and `P` a set of places of `F` containing one place above `ℓ` and missing
another. There are integers `k, t ≥ 2` divisible by `ℓ − 1`, a cuspidal automorphic representation `π` of `GL₂(𝔸_F)` and a
continuous `r : G_F → GL₂(ℚ̄_ℓ)`, irreducible on every open subgroup, attached to `π` and to a plain regular algebraic cuspidal
representation, with `det r = χ_ℓ^kξ₁`, characteristic polynomials congruent to those of `1 ⊕ ξ₁`, diagonalisable with characters
`1, ξ₁` on the inertia groups away from `ℓ`, and such that at a place `w | ℓ`: if `w ∈ P`, `r` is ordinary at `w` with inertial
exponents `(k + t, −t)` and characters of the decomposition group congruent to `(ξ₁, 1)`, and `π` has infinitesimal character
`{k + t + ½, ½ − t}` at the real place attached to `w`; if `w ∉ P`, the same with `(k, 0)`, `(1, ξ₁)` and `{k + ½, ½}`
([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/AutomorphyLifting/PrimeIndexConstruction/MixSeedPAlt.lean`
(`UpperTheory.V.Z.Win.Birth.MixSeedP`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/MixSeedOf.lean`
(`UpperTheory.Esk.mixSeed_of_alt`)) ((d₂), (d₃), (d₄): theorems of [FormalProof] whose route is not given here, outlined after the
routes);

(e) (*the Hecke ideal of a layer*) the ideal `J` is the sum `J₁ + J₂` of the extensions to `B` of the Hecke ideals for the two
auxiliary places, taken for the same `κ`, and the clauses are proved from the summands: (fin) and (pur) for `J₁`, whence for `J`;
(P1₄) and (seed) for each summand, whence for `J`; (aut) from (e₀)–(e₂) below. The existence of the maps with their classifying
property, (P1₄) and (pur) for one summand, (e₀), (e₁), the second sentence of (e₂) and the clause (w2) of (wit) are theorems of
[FormalProof] whose route is not given here; the clauses (fin), (inv) and (seed) and the clause (w1) of (wit) have routes below,
that of (seed) using (wit). For `T₁` as in (c),
every large `m`, the layer `T = (K, F_{T₁,m}, g_{T₁}^{ℓ^m})`, `B ⊂ A` the rings of 3.19(a) over `T` and `L = L_T`, there are a character `κ`
of `G_L` with `κκ^c = θ⁻¹χ_ℓ⁻³|_{G_L}`, unramified outside the places above `S`, of order prime to `ℓ` on the inertia groups at the
places not above `ℓ` and locally algebraic at the places above `ℓ`, two auxiliary places `v₀, v₀′` of `L` of prime norms with
different residue characteristics as in HeckeIdealsAndTaylorWilesRelations §3.13a, and maps from the universal ordinary
determinant rings of §3.13a(1) over `L`
for the residual characters `(θ̄, Ψ̄, ᾱ, 1)·κ̄|_{G_L}` and the auxiliary place `v₀`, resp. `v₀′`, to `B`, classifying
`(det(r|_{G_L} ⊗ κ), (ψ_{v,i}κ))`; and the ideal `J ⊂ B`, the sum of the extensions to `B` of the two
Hecke ideals of §3.13a, satisfies: (fin) a power of the maximal ideal of `B` lies in `J + (ϖ) + (ψ_{v,i}(s) − 1 : s ∈ I_v, v | ℓ)`, so
`B/J` is finite over `Λ`; (P1₄) of 3.19(c) holds for `J`; (inv) `J` does not change when `κ` is replaced by `κβ^n`, `n ≥ 0`, for an
anticyclotomic character `β ≡ 1` of `G_K`, unramified outside `ℓ` and factoring through a quotient `ℤ_ℓ`; (seed) every prime of `B`
contained in the kernel of a seed (d) over `T` contains `J`; (pur) every point of `A` over `V(J)` that is the restriction of an
`Ē`-point `ρ` of `𝒟_sp` is weakly pure: on an open subgroup, at almost all Frobenius elements `σ`, of norm `Q`, any two
eigenvalues `y, z` of `ρ(σ)` satisfy `|y| < Q|z|` under one fixed isomorphism `ι : ℚ̄_ℓ ≅ ℂ` (that of
HeckeIdealsAndTaylorWilesRelations §3.13a(d)); (aut) for such a `ρ`, continuous with multiplier `θ` and with `ρ|_{G_L}` irreducible:
for every imaginary quadratic field `K′` with `ρ|_{G_{K′}}` irreducible, `ρ|_{G_{K′}}` is attached to a regular algebraic cuspidal
representation of `GL₄(𝔸_{K′})` and satisfies the clauses (w1), (w2) of HeckeIdealsAndTaylorWilesRelations §3.13a(f); (wit) for every
seed (d) over `T`, with `κ′` and `a` as there, every `β` as in (inv) with `β² = χ_ℓ^b` up to finite order on the inertia group at a
place above `ℓ`, `b` odd, and every integer `n ≥ 0` with `n ≡ a mod 2`, the representation `(seed)|_{G_L} ⊗ κβ^n` satisfies the
clauses (w1), (w2) of
HeckeIdealsAndTaylorWilesRelations §3.13a(f);

(e₀) (*the window at principal series components*) Let `M` be a totally complex number field, `n ≥ 1` and `Π` a cuspidal
automorphic representation of `GL_n(𝔸_M)`. There is a real `t` such that at every finite place `w` at which `Π_w` has cuspidal
support made of characters, no two of them with an unramified ratio of value `Nw` at a uniformiser, every character `ξ` of the
support satisfies `(Nw)^{t−1/2} < |ξ(ϖ_w)| < (Nw)^{t+1/2}`. Conversely, these inequalities at `w`, for any `t`, exclude such a
ratio ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/LeviSmoothLocalization/WinUpDown.lean`
(`UpperTheory.V.Z.ImaginaryQuadraticEtaCharacter.WinOf`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/LeviSmoothLocalization/PrincipalSeriesMatching/NormAbsPowUnif.lean`
(`UpperTheory.V.Z.ImaginaryQuadraticEtaCharacter.winOf`); for the converse,
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/LeviSmoothLocalization/WinUpDown.lean`
(`UpperTheory.V.Z.ImaginaryQuadraticEtaCharacter.WinUnl`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/LeviSmoothLocalization/PrincipalSeriesMatching/WinUnl.lean`
(`UpperTheory.V.Z.ImaginaryQuadraticEtaCharacter.winUnl`));

(e₁) (*automorphy off one auxiliary place*) For each of the two summands `J_i`, with auxiliary place `v_i` of `L⁺`, and `ρ` as in
(aut) whose point lies over `V(J_i)`: `ρ|_{G_L} ⊗ κ` is attached to a regular algebraic conjugate self-dual cuspidal
representation of `GL₄(𝔸_L)` and satisfies (w1), and (w2) at the places of `L` not above `v_i` ([FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/PlainTorsionPairs/IrrArithPointsAutomorphicAway.lean`
(`UpperTheory.Gal.projectedFormsSystemPart.AutOffN`), the conclusion of `UpperTheory.Gal.projectedFormsSystemPart.pmAutO_alt`,
named below);

(e₂) (*gluing and descent*) A continuous representation of `G_L` attached to a regular algebraic conjugate self-dual cuspidal
representation, with (w1) and with (w2) at the places not above `u`, and also at the places not above `u′`, for two different
places `u ≠ u′` of `L⁺`, satisfies (w2) ([FormalProof],
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/PlainTorsionPairs/IrrArithPointsAutomorphicAway.lean`
(`UpperTheory.Gal.projectedFormsSystemPart.glueN`),
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/PlainTorsionPairs/IrrArithPointsAutomorphicAway.lean`
(`UpperTheory.Gal.projectedFormsSystemPart.witA_of`)). For `ρ` as in (aut), if `ρ|_{G_L} ⊗ κ` is attached to such a
representation with (w1), (w2), then (aut) holds for `ρ` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/DnPmDown.lean`
(`UpperTheory.V.Z.Win.Dn.pmDown_alt`));

(f) (*free ratios and regular elements*) let `L` be a tower field and `ρ : G_L → GL₄(ℚ̄_ℓ)` a continuous representation automorphic
in the sense of HeckeIdealsAndTaylorWilesRelations §3.13a(f) (attached to a regular algebraic conjugate self-dual cuspidal
representation of `GL₄(𝔸_L)`, with the clauses (w1), (w2)), irreducible on `G_{L(μ_{ℓ^∞})}`, with at each place
`v | ℓ` a stable flag whose characters have integral cyclotomic exponents `m_{v,1} > ⋯ > m_{v,4}` with `m_{v,i} − m_{v,i+1} ≥ 2` (they
may depend on `v`), and whose residual characters satisfy the two conditions of a tower field (no quadratic character through `ω`
permutes them; some ratio has order `> 4`); then at each `v | ℓ` some element of the decomposition group in the kernel of `χ_ℓ` has
eigenvalues under `ρ` with no ratio of finite order, and every nonempty open subset of `G_{L(μ_{ℓ^∞})}` contains an element at which
`ρ` has separable characteristic polynomial.

The order of choice is: `T₀` (a); the lift `ρ` and its lattice; `W` and `T₁`, with seeds and chains over every `ℓ`-extension (c), (d);
`C` for the cyclotomic tower of `F_{T₁}` (b); the layer, over which the ideal (e) is taken. The route of (c) uses (d) (the seeds, and the lower lattice of which their reductions are restrictions); the route of the clause (seed) of (e) uses HeckeIdealsAndTaylorWilesRelations §9.9(d), through §9.9(d′); the route of (e) uses ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, through 3.19(a). The routes of these statements are not given in full (see there).

[FormalProof] states the seeds of (d) as `UpperTheory.V.Ws.Tower.IsSeedAlt` and the two existence statements as
`UpperTheory.V.Cu.SeedIVAlt` (Case III, `DTC/PromodularityCaseThree.lean`) and `UpperTheory.V.Ws.SeedIIAlt` (Case II,
`DTC/PotentialModularityTower.lean`), proved as `UpperTheory.V.Z.Win.Birth.fourth_initial_of_prints_h` (`DTC/BirthTop.lean`) and
`UpperTheory.V.Z.Bc.seedIIs_alt` (`DTC/BcIndCs.lean`); in Case II it gives a seed over every tower datum satisfying its depth
condition and the clauses of Case II, not only over the `ℓ`-extensions of `T₁`. It states (e) as `UpperTheory.V.Ws.PMExAlt`, whose
ideal satisfies the clauses `fin`, `p1`, `seed`, `pur`, `aut` of `UpperTheory.V.Ws.Tower.PotentialModularityTower` (both in
`DTC/PotentialModularityTower.lean`), over every tower datum satisfying its depth conditions and after enlarging the
coefficients; these are (fin), (P1₄), (seed), (pur) and (aut), the last two for the points `ρ` with the cyclotomic exponents of
`𝒟_sp`. The maps are `UpperTheory.V.Ws.exists_phi_universal_ordinary_det_ring_of_link` (`DTC/TPhiEx.lean`); (P1₄), (pur) and
(aut) are proved from the two summands of `J` with `UpperTheory.V.Ws.modular_deformation_quotient_regular_at_point_alt`
(`DTC/ModularDeformationQuotientRegularAtPoint.lean`), `UpperTheory.V.Ws.pmPur_w_alt` (`DTC/VWinPm.lean`) and
`UpperTheory.Gal.projectedFormsSystemPart.pmAutO_alt` (`DTC/PmAutO.lean`), and (seed) with
`UpperTheory.V.Th.local_zero_of_modular_p` (`DTC/BirthPm.lean`), assembled in
`UpperTheory.Gal.projectedFormsSystemPart.promodular_existence_of_local_zero` (`DTC/PmTwo.lean`); the declaration that states
(wit) is named in the route of (seed). (inv) is not a clause of its statement.

*Route.* (a) Case III: an odd quadratic character of a new prime conductor `q` in which the primes of `S` split defines `K′`; let
`H ⊂ G_ℚ` be the open subgroup on which `ξ̄` agrees with it and `Ψ̄ = ψ̄`; take two further odd quadratic characters `η₁, η₂` of new
prime conductors in which `S ∪ {q}` splits, `K` the field of `η₁` and `F₀` the fixed field of `H ∩ ker(η₁η₂)`, totally real abelian of
even degree with `L/F₀` unramified at the finite places; `g₀` is a product of an inertia element at `2`, one at `q` and a square, at
which the four characters take the values `1, −1, z, −z`, `z` of odd order `≠ 1`; the condition on `ω` in the definition of tower
fields is witnessed by the square of an inertia element at `ℓ`. (The seeds of (d) are reducible on `G_{K′}`, which is why `K′ ⊄ L`
is needed.) Case II: let `κ₂` be the `ℓ`-power part of `ψ` with its component at `ℓ` removed, a character of `ℓ`-power order,
unramified at `ℓ` and outside `S`; on inertia away from `ℓ`, `Ψ̄(g) = 1 = κ₂(g)` implies `ψ(g) = 1`, and `ψ` has order prime to `ℓ`
on `ker χ_ℓ ∩ ker κ₂`. Choose an even quadratic character `φ` and two odd quadratic characters `η, η′` of new prime conductors,
each split at the primes of `S` and at the earlier new primes; `F₀` is the fixed field of
`H = {g : Ψ̄(g) = φ(g), η(g) = η′(g), κ₂(g) = 1}`, `K` the field of `η`, `k₀` the field of `φ`. `H` is open, contains the commutators and the complex conjugations (`Ψ` and
`φ` even, `η`, `η′` odd), has even index, and is tame at `ℓ` (an inertia element at `ℓ` raised to the order of `Ψ̄` lies in `H`).
Write `ψ^{2^a·o} = 1` with `o` odd and `a = c₂(ψ) + 1 + v₂(o_χ)`. The elements `Frob_ℓ^{2^a·o·ℓ^j}` of a decomposition group above
`ℓ`, and the `2^{c₂(ψ)}ℓ^j`-th power `u` of an inertia element at `2` mapping to `3` modulo `2^m`, lie in `G_{F₀}`, have `Ψ̄ = 1`, and have
`ξ̄⁴ ≠ 1` because `2^m ≥ ℓ²·2^{a+2}` and `2^m ≥ 2^{c₂(ψ)+6}` (the exponent `m` of 4.4; a primitive character modulo `2^m` is faithful on
the subgroup generated by `5`, and `v₂(v^{2^b} − 1) = v₂(v² − 1) + b − 1` for `b ≥ 1`): this gives the clause on `ᾱ⁴`. Two more
elements: `a₀ = c·i·i′`, with `i, i′` inertia elements at the conductors of `η, η′`, lies in `H ∩ G_K` with `ξ̄(a₀) = −1`, `Ψ̄(a₀) = 1`,
`ω(a₀) = −1`; and, the order of `χ_P(ℓ, ψ)` being even, an inertia element away from `ℓ` at which it is `−1`, raised to a power of
`ℓ`, gives `t₁` with `ω = κ₂ = 1` and `Ψ̄ = −1`; the marked element `t` is `t₁` or `t₁u`, whichever has `ξ̄(t)² ≠ 1`, corrected by an
inertia element at the conductor of `φ`, so that `t ∈ G_{F₀} ∩ G_K` and the four characters take the values `−z, −1, z, 1` there,
`z² ≠ 1`. These give the clauses of a tower field: the four characters are pairwise distinct at `t` and on `G_L` (`u`, `t`); `ω` is
not a product of powers of `ᾱ` and `Ψ̄` (`a₀` for an even exponent of `ᾱ`, `u` for an odd one); `ᾱ(u)` gives a ratio of order `> 4`;
a quadratic character trivial on `ker ω` permuting the four would be one of `θ̄, Ψ̄, ᾱ` (`u` excludes two, `t` the third); at each
place above `ℓ` the element `Frob_ℓ^{2^a·o·ℓ^j}` has `ω = 1`, `Ψ̄ = 1`, `ᾱ ≠ 1`; `L/F₀` is unramified (`η = η′` on `H`, and `η′` is
unramified at the conductor of `η`); `r̄₀` is trivial on inertia above `ℓ`, tame inertia killed by `r̄₀` is killed by `ψ`, and `ψ` has
order prime to `ℓ` on `G_{F₀(μ_{ℓ^∞})}` (the properties of `κ₂`). And the clauses of Case II: on `G_{F₀}`, `Ψ̄ = φ` is quadratic,
unramified everywhere (at the conductor of `φ` the character `Ψ̄` is unramified, so `φ = Ψ̄ = 1` on the inertia in `H`) and trivial
on the decomposition groups above `ℓ`; `k₀` is real quadratic with `2` and `ℓ` split. (a′) The conditions defining tower fields and tower data concern characters of order prime to `ℓ`, the quadratic
extension `L/F` and the values at the marked element; they are tested at elements `g`, and `g^{ℓ^j}` tests them over `F′`, a
character of order prime to `ℓ` taking the same nontriviality at `g` and at `g^{ℓ^j}`. (b) Ferrero–Washington for the abelian field cut
out by the residual characters over `F_{T₁}(μ_ℓ)` (IntegralIwasawaTheory §§3.4, 5.6) bounds the class-group ranks uniformly in `m`,
which bounds the strict cocycle spaces, `Hom(Γ/⟨𝒩⟩, k)` and, through the Euler characteristic (`−[F_{T₁,m} : ℚ]` for an odd character,
`0` for an even one, ArithmeticGaloisDuality R02.5.1), the spaces of cocycles vanishing on `𝒩`; the local cocycle spaces have
dimension `d_v + 1` or `d_v + 2`, and the number of places above the
primes of `S` is bounded in the tower; the `ℓ`-part of `ψ`, trivial on `G_{F_{T₁}(μ_{ℓ^∞})}`, factors through the cyclotomic
`ℤ_ℓ`-extension and dies on a layer. The routes of (a), (a′), (b), (c), (f), of the clauses (fin), (inv) and (seed) of (e)
(for (seed), from (wit)), of the clause (w1) of (wit), of the first sentence of (e₂) and of the character `κ₀` in the
construction of `κ` are given; for the rest of (d) and (e), (e₀) apart, the mechanism is outlined.

*Route of (c).* (1) Conjugate `ρ` so that the marked element is diagonal and the flag lower unitriangular; as the image of `ρ`
spans `M₄` (absolute irreducibility), or, in the block case, that of `⟨e₂, e₄⟩` spans `M₂`, the entries of weights `±Ψ` occur, and one
of `β, −α, −θ` occurs (otherwise the conjugate would be block diagonal, against nonsplitness). (2) Among the conjugates by torus
elements with integral entries, maximize first the exponent of `Ψ`, then that of `α`; the two blocked unit moves in `A` and in
`B` give `A + B` even, so each of the four moves `α, Ψ, β, θ` is blocked by a unit entry; maximality in the four directions and
the sign conditions leave six patterns of unit entries. (3) By (G1), an entry of odd-root weight of the reduction that is a
cocycle and a coboundary at `ℓ` vanishes; this excludes five patterns and gives the shape. (4) *New classes:* for a finite
`𝔽_ℓ[G_F]`-module `M`, unramified outside `S₀`, an infinite set of places where `M` and `μ_ℓ` are trivial, and `m₀ ≠ 0`, there is a
cocycle unramified outside `S₀` and finitely many of these places, locally trivial at `S₀`, whose value at some inertia element is
a nonzero multiple of `m₀` (Greenberg–Wiles: the product of the local conditions is at most the order of the Selmer group times
`#M^∨·#M^{[F:ℚ] + #S₀}`; a local condition at a new place has order `ℓ·#M`; if no class were ramified at a new place the Selmer
group would inject into the finite set of cocycles unramified outside `S₀`). (5) Applied to the extension of `k(w̄)` by copies of
`k((w + w′)‾)` defined by given cocycles `y_j` of `w̄′`: a nonzero cocycle `x` of `w̄`, locally trivial above `ℓ`, with all `y_j ∪ x`
coboundaries. (6) A cocycle of `−α`, one of `−Ψ`, and a trivialization of their cup product define a residual lattice supported
on `{−α, −Ψ, −θ}` (the Heisenberg group), of both shapes. (7) Two reflected lattices with equal `−Ψ`-entries, or two lower
lattices with equal `−α`-entries, are linked by the affine line between them (the difference lies in an abelian unipotent
radical). (8) Over `F₁ = F₀·∏_{w∈W}`(the subfield of degree `ℓ` of `ℚ(μ_w)`) the lattices become unramified at `W`: the image of
the inertia group at `w` is unipotent of exponent `ℓ` (`ℓ ≥ 5` in Case III; the Heisenberg group in Case II), and a homomorphism
of exponent `ℓ` from the inertia group at `w ≠ ℓ` factors through the character of order `ℓ` and conductor `w`, which exists
because `w ≡ 1 mod ℓ`. (9) Case III: from the lower lattice `s` of the seeds, `p₂` (same `−α` as `s`, `−Ψ` occurring), then `p₃`,
`p₄` (same `−Ψ` as `c`, resp. `p₂`; equal `−α`, occurring); the chain `c, p₃, p₄, p₂, s̄` has four links, reflected, lower,
reflected, lower, through lattices good by (i) or (iii), (i) or (iii), (i), (v), (vi). Case II: `c₃` (same `−Ψ` as `c`, `−α`
occurring), then its Levi part `c₄` with the `−Ψ`-entry of the flags moved to that of the seed: the flag of a lattice supported on
`{−α}` can be multiplied by the root group of `−Ψ` when `Ψ̄ = 1` on the decomposition groups above `ℓ`, the local representation
being then diagonal with `χ̄₁ = χ̄₃`, `χ̄₂ = χ̄₄`; the chain `c, c₃, c₄, s̄` has three links, reflected, lower, reflected, through
lattices good by (i) or (iii), (i) or (iii), (iii), and (iii) or (iv). (10) *Transport.* A root that occurs through an entry that is
a cocycle still occurs over `F_T`: a cocycle of `γ̄` over `ℚ` vanishing on `G_{F_T}` vanishes, `γ̄` being nontrivial at the marked
element; supports, equal entries and flags restrict.

*Outline of the mechanism of (d), (e).* (d) Case III: a cuspidal eigenform `g` over `ℚ` of weight `k = e + 1 + (ℓ − 1)n`, odd and
large, level `f_φ·w` and character `φθ_w`, `φ = ξψ` for the first ordering and `ξψ⁻¹` for the second, `θ_w` of order `ℓ` and conductor
`w`, congruent to the Eisenstein series (3.22(b)); its representation `ρ_g` is ordinary, residually `1 ⊕ χ̄_ℓ^{k−1}φ̄` (`θ̄ ⊕ 1` for
the first ordering), and has a lattice with nonsplit lower triangular reduction (Ribet's lemma); `τ = Ind_{K′}^ℚ κ₁^j` for an
algebraic Hecke character `κ₁ ≡ 1` of `K′` of infinity type `(−m, m)`, residually `1 ⊕ η_{K′}`, with `1 ≤ j ≤ 9` chosen so that the
tensor product is automorphic; the seed is `δ·(ρ_g ⊗ τ)` restricted to `G_{F_T}`, `δ²χ_ℓ^{k−1}φ = θ`; its exponents are half-integers,
with gaps `2mj`, `k − 1 − 2mj`, `2mj`; it is automorphic over `L_T` by base change to `K′`, the twist and automorphic induction
(PotentialAutomorphyInfrastructurePartII §§0.8, 0.9; EndoscopicTransferAndUnitaryTraceComparison §6.26) and soluble base change (PotentialAutomorphyInfrastructurePartII §0.9); it is reducible on `G_{K′}`, so it can be irreducible on `G_{L_T}` only because `K′ ⊄ L_T`; its residual extension may be
ramified at `w`, through `θ_w` only, and is unramified where `w` dies; its reduction is supported on `{−β, −Ψ, −θ}` with nonzero flag
entries `(2, 1)`. Case II: a holomorphic Hilbert cuspidal eigenform over `k₀` whose representation is residually `1 ⊕ ξ̄`, with
determinant `χ_ℓ^kξ`, ordinary of weights `(k + t, −t)` at one place above `ℓ` and `(k, 0)` at the other, `k, t ≥ 2` divisible by
`ℓ − 1`; induced to `ℚ` (EndoscopicTransferAndUnitaryTraceComparison §6.26), twisted by a square root of `θ/(χ_ℓ^kξφ₀)`, `φ₀` the
character of `k₀`, and restricted to `G_{F_T}`; its reduction is supported on `{β, −α, −θ}`. *Outline of (d₂)–(d₄).* (d₂): an
algebraic Hecke character of `K′` with trivial reduction (ClassFieldTheory Layer 11), and the induced representation in an
orthogonal basis. (d₃): base change of `ρ` to `K′` and to `K′L` (PotentialAutomorphyInfrastructurePartII §0.9), the twist by
`κ₁^j` (PotentialAutomorphyInfrastructurePartII §0.8), automorphic induction from `K′L` to `L`
(EndoscopicTransferAndUnitaryTraceComparison §6.26), `j` being chosen so that the four weights over each embedding are distinct;
the derivation of the window clause is not given here. (d₄): 3.22(e)–(h). [FormalProof] deduces the Case III statement from
(d₁)–(d₃) by ten verifications on `δ·(ρ₁ ⊗ τ)|_{G_{F_T}}`: the twist `δ` exists; the pair is a pair of 3.19; its reduction has the
stated support and residual form; continuity; the entries `−β`, `−θ` occur; restriction from `T₀`; when `δ² = χ_ℓ^a` on an open
subgroup, `h = (a + 2(k − 1 + m′), a + 2(k − 1 − m′), a + 2m′, a − 2m′)` with `m′ = mj`; an element of `G_{L_T(μ_{ℓ^∞})}` outside
`G_{K′}`; irreducibility on `G_{L_T(μ_{ℓ^∞})}`; automorphy by (d₃). It deduces the Case II statement from (d₄) and (d₅). These
verifications are theorems of [FormalProof] whose routes are not given here. (e) The twist is `κ = κ₀γ^{−(e+4)}β^{e mod 2}`:
`κ₀` a character of `G_K` of finite order prime to `ℓ`, unramified outside `S`, with `κ₀κ₀^c = η₀|_{G_K}`, where
`η₀ = (ω^{e+3}ξψ′)⁻¹` and `ψ′` is the prime-to-`ℓ` part of `ψ` (`η₀` is even, of order prime to `ℓ`, unramified outside `S`, and equals
`(ω^{e+3}ξψ)⁻¹` at every element at which `ψ` has order prime to `ℓ`); `γ ≡ 1` a character unramified outside `ℓ` with `γ² = χ_ℓω⁻¹`; and `β`
as in (inv) with `β² = χ_ℓ^b` up to finite order on inertia at a place above `ℓ`, `b` odd. With `θ = χ_ℓ^{e+1}ω⁻¹ξψ` this gives
`κκ^c = θ⁻¹χ_ℓ⁻³` on `G_L` for `L = L_T` over a layer `T` on which `ψ` has order prime to `ℓ`, which is the range of (e), and `κ` is
locally algebraic for every `e` (`γ^{−(e+4)}` has exponent `−(e + 4)/2`, `β` has exponents `±b/2`). *Route of `κ₀`.* A finite even
character `η₀` of `G_ℚ` of order prime to `ℓ`, each of whose ramified primes splits in `K`, with `2` split in `K`, is the conjugate norm
of a character of `G_K` of finite order prime to `ℓ`, unramified where `η₀` is unramified: at a ramified prime `p = 𝔴𝔴̄` of `K` put
`κ_𝔴 = η_{0,p}` on the units of `K_𝔴` and `κ_{𝔴̄} = 1`; the only global units are `±1` (`2` split excludes `ℚ(i)` and `ℚ(√−3)`), and
`∏_𝔴 κ_𝔴(−1) = 1` because `η₀` is even; extend over the class group with order prime to `ℓ` (extend on the prime-to-`ℓ` part). Then
`κ₀|_{𝔸_ℚ^×} = η₀`, because `𝔸_ℚ^×` lies in `K^×ℂ^×U`, `U` the finite unit ideles of `K`, so `κ₀(x)κ₀(x̄) = κ₀(N x) = η₀(N x)` for every
idele `x`. Here `η₀ = (ω^{e+3}ξψ′)⁻¹` is even, of order prime to `ℓ`, ramified only at primes of `S`, which split in `K` by the definition
of a tower datum (`2 ∈ S`). The maps classify the twisted determinant from the universal ordinary determinant rings over `L` (PotentialAutomorphyInfrastructurePartII §7.5 for the restriction from `G_{F_T}` to `G_L`, and the eigenvalues of the marked element as in 3.16(h)); the auxiliary places come from
the condition on `ω` in the definition of tower fields, by Chebotarev; the patching data are HeckeIdealsAndTaylorWilesRelations §4.2a. (P1₄) is 3.15(a) with `n = 4`, a prime below a point contracting to a prime below its image,
with (N1), (N3), (N4) and type I at such a prime obtained as in 3.16(a)–(d) from the conditions on tower fields (in rank four the
ratio of order `> 4` replaces the coset argument of 3.16(c)); (pur) is HeckeIdealsAndTaylorWilesRelations §3.13a(d), all multiplicities `m_i` being `1` because no two
residual characters differ by `ω` on `G_L` (a piece with `m_i ≥ 2` has two residual constituents differing by `ω̄`); (aut) is (e₁), HeckeIdealsAndTaylorWilesRelations §3.13a(e) (which gives the clause (w1), and the clause (w2) only at the places not above the auxiliary place, `v₀` resp. `v₀′`), glued by the first sentence of (e₂),
followed by the second sentence of (e₂): PotentialAutomorphyInfrastructurePartII §0.8 to remove `κ`, descent from `L` to `ℚ`
(`L/ℚ` abelian) and base change to `K′` (PotentialAutomorphyInfrastructurePartII §0.9), with the passage of (w1), (w2) through
the twist and the descent (4.7(iv)). *Route of the first sentence of (e₂).* Each partial statement gives its own `t`; by the
converse in (e₀) every place in question has a support with no excluded ratio, and (e₀) then gives the window there with the one
`t` of (e₀); every place of `L` is not above `u` or not above `u′`.
*Route of (fin).* A prime of `B` containing `J`, `ϖ` and the `ψ_{v,i}(s) − 1` is maximal:
modulo it the weight algebra is constant, the image of the determinant ring is integral over the residue field (HeckeIdealsAndTaylorWilesRelations §3.13a(b)), hence
so are the characteristic polynomials of `r(g²)`, `g ∈ G_{F_T}`, and of `r(g)`, and the `ψ_{v,i}` (the places above `ℓ` split in `K`);
integral elements of a complete local domain over its finite residue field are constants; conclude by (genB) of 3.19(a). *Route
of (inv).* For the character `β₀^n` of `G_{L,S}`, `β₀` the restriction of `β`, the twisting automorphism of the universal ordinary
determinant ring exists and is unique, preserves the Hecke ideal (HeckeIdealsAndTaylorWilesRelations §3.13a(g)), and the classifying map for `κβ^n` is the one for
`κ` composed with it. *Route of (seed).* For a seed over `T`, choose `β` as in (inv) with `β² = χ_ℓ^b` up to finite
order on inertia at a place above `ℓ`, `b` odd, and `n ≥ 0` with `n ≡ h₁ mod 2`. The seed restricted to `G_L` and twisted by `κβ^n` has integral
regular exponents (`ψ_{v,i}κβ^n` has exponent `h_i/2` plus an integer plus `±nb/2`), with gaps `(h_i − h_{i+1})/2 ≥ 2`, and is
automorphic (PotentialAutomorphyInfrastructurePartII §0.8, from the automorphy of its twist by `κ′` in (d), `κβ^n/κ′` being algebraic as `n ≡ a mod 2`); so it is a point of
the Hecke quotient at each auxiliary place (HeckeIdealsAndTaylorWilesRelations §3.13a(f), with `n = 4` in its range `2 ≤ n ≤ 4`). The hypotheses of HeckeIdealsAndTaylorWilesRelations §9.9(d), (d′) are verified for the point
`ρ := (seed)|_{G_L} ⊗ κβ^n`, not for the seed: `ρ` is attached to a regular algebraic conjugate self-dual cuspidal representation
(its exponents `h_i/2 + integer ± nb/2` are integers; the seed's own exponents are half-integers in Case III, so no statement
about automorphic representations applies to the seed or to an algebraic twist of it); it is irreducible on `G_{L(μ_{ℓ^∞})}`
because the seed is; the element with free ratios and the regular elements are (f) for `ρ`; the
exponents differ by at least `2` at each place and may depend on the place. HeckeIdealsAndTaylorWilesRelations §3.13a(f),
HeckeIdealsAndTaylorWilesRelations §9.9(d) and (f) above ask that `ρ` be automorphic in the sense of the first, with its
clauses (w1), (w2), which are (wit) for `ρ`. *Route of the clause (w1) of (wit).* At each place above `ℓ` the exponents of the
flag characters of `ρ` differ pairwise by `(h_i − h_j)/2`, at least `2` in absolute value, while `χ_ℓ` times a character of
finite order has exponent `1`; so no two flag characters of `ρ` are in ratio `χ_ℓ` up to a character of finite order.
[FormalProof] states (wit), with the automorphy of `ρ`, as `UpperTheory.V.Z.Win.Birth.ptAutR'_alt` (`DTC/BirthSeedB.lean`),
where (w2) comes from the window clause of the seed and (w1) is a hypothesis; its proof of the clause `seed` for one summand
of `J`, `UpperTheory.V.Th.local_zero_of_modular_p` (`DTC/BirthPm.lean`), supplies (w1) from the gaps of the exponents.
By HeckeIdealsAndTaylorWilesRelations §9.9(d′) at that point, every prime of the universal ordinary
determinant ring contained in its kernel contains the Hecke ideal; mapping to `B`, every prime of `B` in the kernel of the seed
contains the ideal built with `κβ^n`, which is `J` by (inv).

*Route of (f).* Let `π` be the cuspidal representation attached to `ρ` and `s` an element of the decomposition group at `v` with
`χ_ℓ(s) = 1` lifting a power of a Frobenius, of norm `Q`, a power of the residue cardinality of `v` (such `s` exist, as `χ_ℓ` has
open image on inertia). The comparison at `ℓ` (AutomorphicGaloisRepresentationsPartII AG2.6, *Polarized coefficient-prime
domination*, with ModularityAndLanglandsExtensions §2.43) makes the values at `s` of the flag characters the eigenvalues of `s` on the
semisimplified Weil representation of `rec(π_v|det|^{−3/2})` times the powers `Q^{m_{v,i}}`; the four characters of that Weil
representation may be ramified, as the flag characters agree with `χ_ℓ^{m_{v,i}}` only up to characters of finite order on inertia.
The values at `s` are `ℓ`-adic units, so the eigenvalues have valuations `−m_{v,i}·v_ℓ(Q)`, pairwise at least `2v_ℓ(Q)` apart: no two
of the four characters differ by `|·|^{±1}` (that would give two eigenvalues of ratio `Q^{±1}`), and the monodromy of `rec(π_v)`
vanishes. As `L` is CM, `π_v` is tempered (AutomorphicGaloisRepresentationsPartII AG2.5, *Temperedness of regular unitary-type
cuspidal forms*), so with vanishing monodromy the four characters are unitary up to one common twist and the four eigenvalues have
one complex absolute value under the coefficient isomorphism of the comparison. A ratio `ψ_{v,i}(s)/ψ_{v,j}(s)` of finite order
would then give `Q^{m_{v,i} − m_{v,j}}` absolute value `1`, against `m_{v,i} ≠ m_{v,j}`. An element with free ratios has separable
characteristic polynomial, and a coset argument in rank four, using the ratio of order `> 4`, moves it into every nonempty open
subset of `G_{L(μ_{ℓ^∞})}`.

*Needs:* 3.14, 3.15, 3.16, 3.19, 3.22; IntegralIwasawaTheory §§3.4,
5.6; ArithmeticGaloisDuality R02.5.1; ClassFieldTheory Layers 7, 11, 13; Chebotarev Layer 10;
EndoscopicTransferAndUnitaryTraceComparison §6.26; PotentialAutomorphyInfrastructurePartII §§0.8, 0.9, 7.5 and HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a, 9.9;
AutomorphicGaloisRepresentationsPartII AG2.5, AG2.6; ModularityAndLanglandsExtensions §2.43.

**Checks.**

- The identity `κκ^c = θ⁻¹χ_ℓ⁻³`: `κ₀κ₀^c = ω^{−(e+3)}ξ⁻¹ψ′⁻¹`, `(γ^{−(e+4)})(γ^{−(e+4)})^c = (χ_ℓω⁻¹)^{−(e+4)}`, `ββ^c = 1`; on `G_L`, where
  `ψ = ψ′`, the product is `ωξ⁻¹ψ⁻¹χ_ℓ^{−(e+4)} = (χ_ℓ^{e+1}ω⁻¹ξψ)⁻¹χ_ℓ⁻³`. `ω^{e+3}ξψ′` is even: `(−1)^{e+3}·(−1)·(−1)^e = 1` (`ξ` odd,
  `ψ′(−1) = ψ(−1) = (−1)^e`, the `ℓ`-power part of `ψ` having odd order). With the full `ψ` in place of `ψ′` the identity on `G_K` can
  have no solution: the conjugate norm of a character of order prime to `ℓ` has order prime to `ℓ`, while for `ℓ = 3` and `ψ` of
  order six and conductor `7` (allowed in Case II for odd `e ≥ 3`) the cubic part of `ψ` survives on every `G_K`, `K` quadratic.
- The exponent of `ξ′` must be the `m` of 4.4 and not any `m > c₂(ψ)`: for `χ = ψ = (·/5)`, `ℓ = 19`, `e = 18`, `n = 2`, `Q = {43, 71}` (Case
  II), `ξ′ = η₄` (`m = 2 > c₂(ψ) = 0`) satisfies (G2) (`ψ(19) = 1`, `η₄(19) = −1`) and (G1) (`ℚ(i, √5)` has class number `1`), but the
  four residual characters `ψη₄, ψ, η₄, 1` take values in `{±1}`: no ratio has order `> 4`, `ᾱ⁴ = 1`, and no tower field exists.
  Here `m(19, ψ) = 29` (`ℓN·4^{n₀} = 296995840`, `N = 244240`, `f₀ = 2`, `n₀ = 3`).
- In Case III no twist of the seed by a character with integral exponents has integral exponents; the twist `κβ^n` has
  half-integral exponents at the places above `ℓ` (`β² = χ_ℓ^b`, `b` odd).
- `K′ = K` is impossible in Case III: on `G_{K′}` the seed of (d) is `ρ_gκ₁^j ⊕ ρ_gκ₁^{jσ}`, reducible, so a tower field containing
  `K′` carries no seed irreducible on `G_{L_T}`.
- The seed of Case III has residual characters `(θ̄ ⊕ 1) ⊗ (1 ⊕ ᾱ) = {θ̄, Ψ̄, ᾱ, 1}` on `G_{F_T}` (`θ̄ᾱ = Ψ̄` as `ᾱ² = 1` there): the
  rank-two form is residually `θ̄ ⊕ 1`, and `ᾱ` comes from the induced factor. Its exponents are `(h_i/2)` with
  `h_i ∈ {k + e ± 2mj, e + 2 − k ± 2mj}`, all odd (`k` odd, `e` even in Case III, since `o_ψ` is odd): the twists `β^n` of (inv) are needed.

### 3.21 Frames relative to the Gaussian field

The data are those of the setting of 4.5 (which uses only Layer 0): `ℓ`, `e`, `N`, `ψ`, `O`, `η₄`, `S_b`, `T_b`, the host data (including
the Bernoulli threshold), `Ψ = χ_ℓ^eψ`, and the problem `𝒟_G`, with `ad = ⊕_j ad_j` the `𝒢₃`-adjoint of `r̄` graded by the unitary
weights. Prove that the host data imply: (a) (*separation*) for every `v ∈ T_b` there is `x_v` in the decomposition group at `v` with
`η₄(x_v) = 1`, `ω(x_v) = 1` and `Ψ(x_v)² − 1` a unit; and `Ψ` is trivial on `I_p ∩ ker η₄ ∩ ker Ψ̄` at the primes `p ∉ T_b`
([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/DyadicCharacterPowerNeOne.lean`
(`UpperTheory.V.UnitaryThreeInertia.exists_sigma`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/HostOk.lean`
(`UpperTheory.V.UnitaryThreeInertia.hostFrame_ok`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/AdjointDiagonalRepPreservesWeightPiece.lean`
(`UpperTheory.V.UnitaryThreeInertia.Frame.Ok`)); (b) (*local
vanishing*) `H²(G_{ℚ_v}, ad_j) = 0` for `v ∈ T_b`, `j ≠ 0`, and `H¹(G_{ℚ_v}, ad_j) = 0` for `v ∈ S_b`, `j ≠ 0` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/AdjointDiagonalRepPreservesWeightPiece.lean`
(`UpperTheory.V.UnitaryThreeInertia.Frame.LocVan`)); (c) (*the count*)
`dim H¹_𝓛(ad_j) − dim Ob(ad_j) = 0, −1, 0, +1, +1` for `j = −2, −1, 0, 1, 2`, where `H¹_𝓛` is the residual Selmer group with the
local conditions of `𝒟_G` (at `ℓ`: a coboundary in negative weight, unramified in weight `0`, free in positive weight; elsewhere
zero on `I_p ∩ G_{ℚ(i)} ∩ ker Ψ̄`) and `Ob(ad_j)` the dual Selmer group (classes of `ad_j^*(1)` with the orthogonal local conditions,
ArithmeticGaloisDuality D7.7); (d) (*weight −2*) `H¹_𝓛(ad_{−2}) = 0`; (e) (*class number*) a character of `G_{ℚ(i)}` trivial on all
inertia groups is trivial; (f) (*general position*) there is a field `H` such that `(ℚ(i), Ψ, ℓN, H)` is in general position
(3.14); the route takes for `H` the field cut out by the components `comp_p ψ_{[ℓ]}`, `p ≠ ℓ`, of the `ℓ`-power part of `ψ`,
and `s = x_ℓ`.

*Route.* (a) The `2`-part of `ψ` has order `2^{c₂(ψ)−2}` and `8o₁v² < 2^{c₂(ψ)}`: among the Frobenius-type elements of the
decomposition group at `v` (with `ω = η₄ = 1`, a condition of index dividing `4(v − 1)`), the values of `Ψ̄` are values of `ψ̄` on a
subgroup whose `2`-part is too large to be killed by squaring and by the odd components of order dividing `2o₁`; outside `T_b`
the `ℓ`-power part of `ψ` is unramified, so `Ψ` and `Ψ̄` have the same kernel on inertia. (b) The characters of `ad_j`, `j ≠ 0`, are
`Ψ̄^{±1}`, `Ψ̄^{±2}` (times powers of `η₄`): `γ(x_v) ≠ 1` and `γ⁻¹ω(x_v) = γ⁻¹(x_v) ≠ 1`, local Tate duality, and the local Euler
characteristic at `v ≠ ℓ`. (c) The Greenberg–Wiles formula (ArithmeticGaloisDuality R02.5.1) with the local conditions and (b),
weight by weight: the real place contributes `−dim (ad_j)^{c=1}`; the places other than `ℓ` contribute `0` (the conditions are
balanced, and at `S_b` the local `H¹` vanishes for `j ≠ 0`); `ℓ` contributes `dim ad_j` for `j > 0` (by (b)) and `0` otherwise; the
global term `h⁰(ad_j)` is `1` for `j = 0` and `0` otherwise; and `h⁰(ad_j^*(1)) = 0`, because `ℚ(i)` is not in the field cut out by `ω`
and `Ψ̄` (as in (f)). (d) The reduction of `Ψ⁻²η₄` is that of `φξ`, with `φ` the odd-conductor part, of conductor `f`, of the
prime-to-`ℓ` part of `ψ^{−2}ω^{−2e}`, and `ξ` the `2`-part of `ψ^{−2}η₄`, of conductor `2^{c₂(ψ)−1}` (`c₂(ψ) ≥ 4`); `φξ` is odd (`Ψ(c) = 1`,
`η₄(c) = −1`), and the Bernoulli threshold of the host data gives the hypothesis of 3.5 for `(φ, ξ)` with `m = c₂(ψ) − 1`,
`d = f₀`, `k = n₀`, so 3.5(b)
kills the everywhere unramified classes for `Ψ̄⁻²η₄`. A class of `H¹_𝓛(ad_{−2})` is unramified outside `T_b` (on inertia it factors through `r̄(I_p)`, of
order prime to `ℓ`), its restrictions at the places of `S_b` vanish by (b), and at `ℓ` it is a coboundary by the local condition in
negative weight; so it is unramified everywhere, hence zero. (e) `h(ℚ(i)) = 1`. (f) `s = x_ℓ` by (a); `ℚ(i)` is not in the field of
`(ω, Ψ̄)`, because no product `ω^aψ̄^b` is the character of `ℚ(i)` (the `2`-part of `ψ` has conductor `2^{c₂(ψ)}`, `c₂(ψ) ≥ 4`; its powers
of conductor dividing `4` have exponent divisible by `2^{c₂(ψ)−2}`, hence even, and are trivial); `Ψ̄` is a power of `ω` on the
inertia at `ℓ`, as for every Dirichlet character twisted by a power of `χ_ℓ` (the reduction of `comp_ℓψ` factors through
`(ℤ/ℓ)^×`); the condition on `H` is (a) outside `T_b`. *Needs:* 0.2, 0.3, 3.5, 3.14; ArithmeticGaloisDuality R02.5.1, D7.7.

### 3.22 Cusp forms congruent to Eisenstein series with an auxiliary character

Let `ℓ` be an odd prime, `M > 1` an integer prime to `ℓ`, `φ` a primitive Dirichlet character modulo `M`, `w ∤ M` a prime with
`w ≡ 1 mod ℓ` and `φ(w) = 1`, and `θ_w` a Dirichlet character of conductor `w` and order `ℓ`. Prove: (a) (*the Eisenstein series*) for a
primitive Dirichlet character `χ` modulo `N > 1` and `k ≥ 3` with `χ(−1) = (−1)^k`, the Eisenstein series of weight `k`, level `N` and
character `χ` with coefficients `Σ_{d | n} χ(d)d^{k−1}` has constant term `c₀` at `∞` given by `2G(χ̄)c₀ = Σ_{a mod N} χ̄(a)L_k(e^{2πia/N})`,
`G(χ̄)` the Gauss sum and `L_k(x) = Σ_{m≥1} m^{k−1}x^m` as a rational function, equal to `L(1 − k, χ)/2 = −B_{k,χ}/(2k)`, and vanishes at
every cusp of `X₁(N)` not lying over the cusp `∞` of `X₀(N)`; (b) there is `k₀` such that for
every `k ≥ k₀` with `φ(−1) = (−1)^k` there is a normalized cuspidal eigenform of weight `k`, level `Mw` and character `φθ_w` whose
eigenvalue at every prime `p` is congruent to `1 + φθ_w(p)p^{k−1}` modulo the maximal ideal of the ring of integers of `ℚ̄_ℓ`
(through the fixed embedding `ℚ̄ → ℚ̄_ℓ`); (b′) (*the representation of the eigenform*) In (b), there is `k₀` such that for
every `k ≥ k₀` with `φ(−1) = (−1)^k` there is a continuous irreducible `ρ : G_ℚ → GL₂(ℚ̄_ℓ)` attached to a plain regular
algebraic cuspidal automorphic representation of `GL₂(𝔸_ℚ)` (plain: each component at a finite prime is unramified or has
cuspidal support two characters neither of which is the other times `|·|`), with `det ρ = χ_ℓ^{k−1}φθ_w`, characteristic
polynomials congruent to those of `1 ⊕ χ_ℓ^{k−1}φ`, diagonalisable with characters `1, φθ_w` on every inertia group away from `ℓ`,
with on each decomposition group at `ℓ` a stable line whose character is congruent to `χ_ℓ^{k−1}φ` and equal to `χ_ℓ^{k−1}` on
inertia, the quotient character being congruent to `1` and trivial on inertia, and such that at every prime `p ≠ ℓ` at which
`ad⁰ρ` has finite image of inertia some element `s` acting on the residue field as the `p^i`-th power, `i ≥ 1`, has no two
eigenvalues `α, β` of `ad⁰ρ(s)` with `α/(p^iβ)` a root of unity;
(c) (*rank-two seeds*) let `N ≥ 1` be prime to `ℓ`, `w ∤ N` a prime with `w ≡ 1 mod ℓ`,
`θ_w` a character of order `ℓ` and conductor `w`, `K` an imaginary quadratic field with character `η_K` of conductor dividing `N`,
`L ⊇ K` a CM field abelian over `ℚ` on which `θ_w` is trivial, `χ′` a Dirichlet character modulo `N` and `j ≥ 0` with
`χ′(−1) = (−1)^j` and `χ′(w) = η_K(w) = 1`, and assume `(χ̄_ℓ^jχ̄′)² ≠ 1` on `G_L`; let `κ` be a character of `G_K` as in 3.23. Then
for every `B` there are `m ≥ B` with `m ≡ j mod ℓ − 1` and a continuous `σ : G_ℚ → GL₂(ℚ̄_ℓ)` with `det σ = η_Kθ_w`, residually
`χ̄_ℓ^jχ̄′η_K ⊕ (χ̄_ℓ^jχ̄′)⁻¹`, such that `σ|_{G_L}` is irreducible, preserves a symmetric form up to complex conjugation
(`ᵗσ(g)Pσ(cgc⁻¹) = P`), is diagonalisable with characters `χ′^{±1}` on every inertia group away from `ℓ`, has at every place above
`ℓ` a stable line on which inertia acts by `χ_ℓ^m`, with quotient `χ_ℓ^{−m}`, and `σ|_{G_L} ⊗ κ|_{G_L}` is automorphic in the sense of
HeckeIdealsAndTaylorWilesRelations §3.13a(f): attached to a regular algebraic conjugate self-dual cuspidal representation of
`GL₂(𝔸_L)`, with the clauses (w1), (w2) there; (d) (*rank-three seeds*) let `ℓ`, `N`, `w`, `θ_w`, `K`, `L`, `χ′` and `j` be as in (c),
with moreover `χ′ ≠ η_K`, and let `M′ ≠ 0` be an integer divisible by `2ℓ` such that `L/L⁺` is unramified at every finite place,
the places of `L` above `M′` are split over `L⁺`, and `χ′` is unramified at the places of `L` prime to `M′`. Then for every `B` there are
`m ≥ B` with `m ≡ j mod ℓ − 1` and a continuous `r : G_L → GL₃(ℚ̄_ℓ)`, irreducible on every open subgroup, preserving a symmetric
form up to complex conjugation (`ᵗr(g)Pr(cgc⁻¹) = P`), residually `χ̄_ℓ^jχ̄′ ⊕ 1 ⊕ (χ̄_ℓ^jχ̄′)⁻¹`, diagonalisable with characters
`χ′, 1, χ′⁻¹` on every inertia group away from `ℓ`, with at every place above `ℓ` a stable flag on whose graded pieces inertia acts
by `χ_ℓ^m, 1, χ_ℓ^{−m}`, and such that `r ⊗ χ_ℓ⁻¹` is automorphic in the sense of HeckeIdealsAndTaylorWilesRelations §3.13a(f),
with the clauses (w1), (w2) there; (d₁) (*the rank-two representation over `L`*) Let `ℓ`, `N`, `w`, `θ_w`, `K`, `L`, `χ′`, `j` be as
in (c), `L` a CM field with `L/L⁺` unramified at every finite place, `M′ ≠ 0` divisible by `ℓ` such that the places of `L` above
`M′` are split over `L⁺` and `χ′` is unramified at the places of `L` prime to `M′`, `m ≥ 2` with `(χ′η_K)(−1) = (−1)^{m+1}`, and `ρ`
as in (b′) for `φ = χ′η_K` and `k = m + 1`. There is a character `κ` of `G_L` such that `r₂ := ρ|_{G_L} ⊗ κ` has the properties
(R): continuous; attached to a regular algebraic conjugate self-dual cuspidal representation of `GL₂(𝔸_L)`, with (w1), (w2) of
HeckeIdealsAndTaylorWilesRelations §3.13a(f); `ad⁰r₂` satisfies the condition on Frobenius elements of (b′) at the places of `L`
prime to `ℓ`; for every complex conjugation `c` there is `P` with `ᵗr₂(g)·P·r₂(cgc⁻¹) = χ_ℓ(g)⁻¹P`; irreducible on every open
subgroup; unramified at the places prime to `M′`; diagonalisable by two continuous characters on every inertia group away from
`ℓ`; at every place above `ℓ` a stable line with inertial character `χ_ℓ^{b+m}` and quotient `χ_ℓ^b`, up to characters of finite
order, for an integer `b` depending on the place; (d₂) (*automorphy of the adjoint*) Let `L` be a CM field with `L/L⁺` unramified
at every finite place, `ℓ` odd, `M′ ≠ 0` divisible by `2ℓ` such that the places of `L` above `M′` are split over `L⁺`, `m ≥ 2`, and
`r₂ : G_L → GL₂(ℚ̄_ℓ)` with the properties (R). Then `ad⁰r₂ ⊗ χ_ℓ⁻¹` is attached to a regular algebraic conjugate self-dual
cuspidal representation of `GL₃(𝔸_L)`, and every regular algebraic cuspidal representation to which it is attached satisfies the
window clause of (w2) at every finite place. (a), apart from its value `L(1 − k, χ)/2 = −B_{k,χ}/(2k)`: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/ConstSmall.lean` (`UpperTheory.V.Sd.EisChi`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/ConstSmall.lean` (`UpperTheory.V.Sd.EisCoef`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/ConstSmall.lean` (`UpperTheory.V.Sd.EisVan`); (b) follows
from [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/ShapeFacts.lean`
(`UpperTheory.V.Sd.PropEG`). (b′): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/SymmetricPowerTransfer/WeilDeligneUnramified/UnitaryTwoForm.lean`
(`UpperTheory.V.Z.Sym.W.PropEGW`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TPropEGW.lean`
(`UpperTheory.V.Z.Sym.W.prop_eg_w_of_printed_hida`); (d₁): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/SymmetricPowerTransfer/WeilDeligneUnramified/UnitaryTwoForm.lean`
(`UpperTheory.V.Z.Sym.W.SeedInW`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/TSeedInW.lean`
(`UpperTheory.V.Z.Sym.W.seedInW_alt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/SymmetricPowerTransfer/WeilDeligneUnramified/UnitaryTwoForm.lean`
(`UpperTheory.V.Z.Sym.W.AdInW`); (d₂): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/SymmetricPowerTransfer/WeilDeligneUnramified/UnitaryTwoForm.lean`
(`UpperTheory.V.Z.Sym.W.AdAutW`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/UnitaryThreeInputsOfLiterature.lean`
(`UpperTheory.V.Z.Sym.W.adjoint_automorphy_w_of_printed_hida_window`). The clauses (w1), (w2) in (c), and (b′), (d₁), (d₂), are
theorems of [FormalProof] whose route is not given here. [FormalProof] deduces (d) from them, in
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AdjointLiftFromEisensteinSeedOfHyps.lean`
(`UpperTheory.V.Z.Sym.W.adjoint_lift_from_eisenstein_of_propagation`):
for `t` large and `m = j + (ℓ − 1)t`, with `ρ` as in (b′) for `φ = χ′η_K` and
`k = m + 1`, the seed is `r = ad⁰ρ|_{G_L} = ad⁰r₂`; its residual form, its type away from `ℓ` and its flag are those of `ad⁰ρ` on
`G_L`, where `η_K = θ_w = 1` and `χ̄_ℓ^m = χ̄_ℓ^j`; (d₂) gives the automorphy of `r ⊗ χ_ℓ⁻¹` with (w2), and (w1) holds because the
exponents `m, 0, −m` differ by at least `2`. The seed of (d) is not the adjoint of the seed of (c). The proof of (d₂) there
descends `r₂` to the definite unitary group in two variables (HeckeIdealsAndTaylorWilesRelations, contract for
PotentialAutomorphyInfrastructurePartII §3.5 (1)), applies an adjoint lift from the definite unitary group in two variables to
the one in three variables, and uses the Galois representations of the latter (BaseChangeAndGaloisRepresentationsForUnitaryGroups
§§14.1, 16.1) ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/UnitaryThreeInputsOfLiterature.lean`
(`UpperTheory.V.Z.Sym.W.weight_compatible_descent`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/MemOfUnder.lean`
(`UpperTheory.V.Z.Sym.W.adjoint_automorphy_w_of_pure_weight_adjoint_lift`)).
The outline in step (6) of the route of 4.2 is this roadmap's other route to (d).
[FormalProof] states (c) as `UpperTheory.V.Sd.Seed2Alt`
(`DTC/SdStmt.lean`), proved as `UpperTheory.V.Z.Bc.second_initial_of_prints` (`DTC/FinOrderOfKills.lean`), and (d) as
`UpperTheory.V.Z.Sym.UnitaryThreeAutomorphyDense` (`DTC/SymUse.lean`), proved as
`UpperTheory.V.Z.Sym.W.unitary_three_automorphy_dense_of_prints` (`DTC/UnitaryThreeInputsOfLiterature.lean`). In both, the seed
is `UpperTheory.V.Sd.IsSeedAlt` (`DTC/IsSeed.lean`), whose automorphy clause `UpperTheory.V.Z.Win.IsAutCsdA`
(`AV/ModularityArgument/AutomorphyLifting/IsAutCsdA.lean`) is attachment together with (w1), (w2), the clause
`UpperTheory.V.Z.Win.WitA` (`AV/ModularityArgument/AutomorphyLifting/WeakOfAtt.lean`).

*Route.* (a) The coefficients and the value `L(1 − k, χ)/2` of the constant term at `∞` are those of ModularForms Layer 0 with
DirichletPadicLFunctions §0.4. For a class `a` modulo `N` let `E_a` be the Eisenstein series of weight `k`, a constant times
`Σ(mτ + n)^{−k}` over the pairs `(m, n) ≡ (0, a)` modulo `N`; its constant term at `∞` is `L_k(e^{2πia/N})` up to that constant (Lipschitz's
formula), and `L_k(x⁻¹) = (−1)^kL_k(x)`. The series of (a) is `(2G(χ̄))⁻¹Σ_aχ̄(a)E_a`, which gives the formula for `c₀`. A matrix
`γ ∈ SL₂(ℤ)` with lower row `(c, d)` sends `E_a` to the series of the class `(ac, ad)`, which has no term with `m = 0` when `N ∤ c` and
`a` is a unit, hence vanishes at `i∞`.
(b) Put `χ = φθ_w`, of conductor `Mw`, with `χ(−1) = φ(−1) = (−1)^k` (`θ_w` has odd order). Let `E` be the Eisenstein series of (a) for
`N = Mw`: an eigenform for every Hecke operator, with eigenvalue `1 + χ(p)p^{k−1}` at every prime `p`, vanishing at the cusps not
above `∞`, with constant term `c₀` at `∞`. *The constant term lies in the maximal ideal.* By the distribution relation
`Σ_{j mod w}L_k(xζ_w^j) = w^kL_k(x^w)`, `Σ_{(a,w)=1}φ̄(a)L_k(ζ_{Mw}^a) = (w^k − φ̄(w))Σ_bφ̄(b)L_k(ζ_M^b)`, which lies in the maximal ideal as
`φ(w) = 1` and `w ≡ 1 mod ℓ`; with `θ_w ≡ 1` modulo the maximal ideal and `G(χ̄)` a unit, `c₀` lies in the maximal ideal; no
`ℓ`-adic `L`-function is used. *A form `G` of weight `k` and character `χ`, `ℓ`-integral, with unit constant term at `∞` and vanishing
at the cusps not above `∞`* (for all large `k`): for each unit `d ≠ ±1` modulo `N` there is a family `(h_a)` of `ℓ`-integral forms of
weight `4`, `6` or `8`, permuted by `Γ₀(N)`, with constant term zero at `a = d` and a unit at `a = 1`, a combination of `E^{(4)}_a`,
`(E^{(3)}_a)²` or `E^{(3)}_aE^{(5)}_a` (`E^{(j)}_a` the series of the class `(0, a)` in weight `j`) with a level-one form with constant
term `1`: the constant terms of the three at two different pairs `±a` cannot all be congruent, because with `x = e^{2πia/N}` and
`t = 1/(x + x⁻¹ − 2)`, `L₄ = t + 6t²`, `L₃² = t² + 4t³`, `L₃L₅ = t² + 16t³ + 48t⁴`, the values `t ≢ t′` at two such pairs are units
modulo a prime above `ℓ`, and three congruences force, with `s = t + t′`, `p = tt′`, `6s = −1`, `s + 4(s² − p) = 0` and
`s + 16(s² − p) + 48s(s² − 2p) = 0`, that is `1/18 ≡ 0` (for `ℓ = 3` the first already fails). The product over `d`, times `E^{(3)}_a`
(for even `k`, `(E^{(3)}_a)²`, whose constant term `L₃(ζ)²` is a unit) and level-one forms to reach the weight, vanishes at the cusps
not over `∞` and has unit constant term exactly at `a = ±1`; averaging against `χ̄` over `a` gives `G`. (Alternatively, for
`N = Mw ≥ 5` prime to `ℓ`: `H¹(X₁(N), ω^k(−cusps)) = 0` over the integers, so integral forms of weight `k` map onto the constant
terms at the cusps (AlgebraicModularFormsAndSerreWeights §§1.2, 2.15); take `F` with constant term `1` at `∞` and `0` at the other
cusps and `G = ½Σ_d χ(d)⁻¹⟨d⟩F`, `d ∈ (ℤ/N)^×` (§2.10), with constant term `1` at `∞` as only `d = ±1` fix `∞`; and the congruence for
`c₀` also follows from the tame measure of DirichletPadicLFunctions §§2.3–2.4, applied to `φθ_w` and to `φ` at level `Mw`:
`L(1 − k, φθ_w) ≡ (1 − φ(w)w^{k−1})L(1 − k, φ)` modulo the maximal ideal.) No division by `φ(N)` is used, which `ℓ` may divide. With `c₀` the constant term of `E`, `E − c₀G` is
a cusp form (both are eigenforms of the diamond operators with character `χ`, so their constant terms at the cusps above `∞` are
fixed by those at `∞`), `ℓ`-integral with first coefficient a unit, and congruent to `E`, hence an eigenvector modulo the maximal
ideal of every Hecke operator, with the eigenvalues of `E`. The Deligne–Serre lifting lemma (AlgebraicModularFormsAndSerreWeights
§5.10), applied to the Hecke operators on the lattice of `ℓ`-integral cusp forms of weight `k`, level `Mw` and character `χ`
(AlgebraicModularFormsAndSerreWeights Layer 2), gives an eigenform with these eigenvalues modulo the maximal ideal, normalized
because an eigenform of all the `T_n` with first coefficient `0` is `0`.
(c) `φ`, the primitive character attached to `χ′²η_K`, is odd and nontrivial, of conductor prime to `ℓw`, with `φ(w) = 1`; (b), with
the Galois representation of the eigenform and its ordinarity (PadicFamilies §§1.7, 1.8, 1.8a, 1.9), gives for `k = 2m + 1`,
`m = j + (ℓ − 1)t`, `t` large, an irreducible `ρ` with `det ρ = χ_ℓ^{2m}φθ_w`, residually `1 ⊕ χ̄_ℓ^{2m}φ̄`, ordinary with exponents
`(2m, 0)`. Put `σ := ρ ⊗ (χ_ℓ^mχ′)⁻¹`. The form is `P = Jσ(c)`, `J` the standard alternating matrix: `det σ(c) = −1` and `det σ = 1` on
`G_L`. `σ|_{G_L}` is irreducible because `ρ` is irreducible on open subgroups, `L/ℚ` is abelian and the two residual characters of `ρ`
differ on `G_L` (the hypothesis `(χ̄_ℓ^jχ̄′)² ≠ 1` there). Automorphy of the twist: base change to `K`, twist by `κ`, soluble base
change to `L` (PotentialAutomorphyInfrastructurePartII §0.9). *Needs:* 3.23; ModularForms Layer 0;
AlgebraicModularFormsAndSerreWeights §§1.2, 2.10, 2.15, Layer 2, §5.10; DirichletPadicLFunctions §§0.4, 2.3, 2.4; PadicFamilies §§1.7, 1.8, 1.8a, 1.9; PotentialAutomorphyInfrastructurePartII §0.9.

**Checks.**

- An instance: `ℓ = 3`, `φ` the character of `ℚ(i)` (`M = 4`; `φ` is odd, so `k` is odd), `w = 13` (`13 ≡ 1` modulo `3` and modulo `4`,
  so `φ(13) = 1`), `θ₁₃` one of the two characters of order `3` modulo `13`: the factor `w^k − φ̄(w) = 13^k − 1` of the distribution
  relation (and `1 − φ(13)·13^{k−1}` in the alternative) is divisible by `3` for every `k`, which is what puts the constant term of `E`
  in the maximal ideal. The route needs `φ(w) = 1`: for `w = 7`, `φ(7) = −1` and the factor is `7^k + 1 ≡ 2` modulo `3` (and
  `1 + 7^{k−1} ≡ 2`), a unit, so the congruence no longer makes the constant term small (this shows that the route fails, not that
  the conclusion does).
- CyclotomicClassGroupsAndStickelberger §4.2 is the case of prime level `p = ℓ`, weight `2` and character `ω^{k−2}`, where the
  smallness of the constant term comes from `ℓ | B_k` instead of from an auxiliary character.
- The Hilbert-modular, nearly ordinary analogue with auxiliary tame places is ClassicalSerreModularity
  `I.1/nearly-ordinary-hecke-algebras` (permissible maximal ideals).

### 3.23 The conjugate-norm twist of an imaginary quadratic field

Let `K` be an imaginary quadratic field with character `η_K` and discriminant `d_K`, and `ℓ` an odd prime with `ℓ ∤ d_K`. Prove that
there is a continuous character `κ` of `G_K`, the `ℓ`-adic character (AutomorphicGaloisRepresentationsPartII AG2.0) of an algebraic
Hecke character of `K` with exponents `−1` and `0` at the two embeddings, unramified outside `ℓd_K`, such that `κκ^c = χ_ℓ⁻¹`,
`κ ∘ Ver = η_Kχ_ℓ⁻¹` (`Ver : G_ℚ^{ab} → G_K^{ab}` the transfer; equivalently `κ(t²) = −χ_ℓ(t)⁻¹` for `t ∉ G_K`), and `κ` has order prime to
`ℓ` on every inertia group at a place not above `ℓ` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/IdeleGenerators/ShapeFacts.lean` (`UpperTheory.V.Sd.Twist`)).
Consequently, for a CM field `L ⊇ K`, `κ|_{G_L}` is a character as in 3.16 with
`n = 2`, for every `M` divisible by `ℓd_K` (in rank three `χ_ℓ⁻¹|_{G_L}` serves). It weakens the canonical conditions of
ComplexMultiplicationAndExplicitReciprocity §4.3 (Gross–Rohrlich characters, which exist only for `d_K ≠ −3` with `d_K` odd or
`8 | d_K`) so as to exist for every imaginary quadratic field.

*Route.* Let `U` be the group of finite unit ideles of `K`. A Hecke character `Y` of `K` is given on `K^×ℂ^×U` by an algebraic
character `Y_∞` of `ℂ^×` and characters `ε_v` of the local unit groups with `Y_∞(u)∏_v ε_v(u) = 1` for every global unit `u`, and it
extends to all ideles, the quotient by `K^×ℂ^×U` being the class group and the target divisible. Take `Y_∞` of the type of exponents
`(−1, 0)`, `ε_v = 1` for `v ∤ d_K`, and let the product of the `ε_v`, `v | d_K`, be a character `e` of `(𝒪_K/N𝒪_K)^×`, `N = |d_K|`, of order
prime to `ℓ`, with `e(u) = Y_∞(u)⁻¹` for every global unit `u` and `e(n) = η_K(n)` for integers `n` prime to `N`. Such `e` exists: the two
prescriptions agree where they overlap (a unit congruent to an integer modulo `N ≥ 3` is `±1`, and `Y_∞(−1) = −1 = η_K(−1)`), the
prescribed character of the subgroup they generate has order dividing `2·#μ(K)`, prime to `ℓ` because `ℓ ∤ 2d_K`, and a character of
a subgroup of a finite abelian group extends with order prime to `ℓ`. These make `Y|_{𝔸_ℚ^×}` equal to `η_K‖·‖^{±1}`, because
`𝔸_ℚ^× = ℚ^×ℝ_{>0}Ẑ^×` lies in `K^×ℂ^×U` and the condition is only `ε_v|_{ℤ_p^×} = η_{K,p}|_{ℤ_p^×}` at the ramified primes: the class group
imposes nothing; and the global units satisfy `Y_∞(u)∏_v ε_v(u) = 1` by the choice of `e`. For `K = ℚ(√−3)`, `e` is a character of
`(𝒪_K/3)^×`, a group of order `6`, with `e(ζ₃)` a primitive cube root of unity; it does not factor through the residue field, on which
`ζ₃` is `1`. Let `κ` be the `ℓ`-adic character of `Y` through the Artin map
(ClassFieldTheory Layer 11). The transfer corresponds to the inclusion `𝔸_ℚ^× ⊂ 𝔸_K^×` (ClassFieldTheory Layer 4), so `κ ∘ Ver` is the
character of `Y|_{𝔸_ℚ^×}`, that is `η_Kχ_ℓ⁻¹`; for `s ∈ G_K`, `Ver(s) = s·csc⁻¹`, so `κκ^c = (κ ∘ Ver)|_{G_K} = χ_ℓ⁻¹`. On inertia at a place
not above `ℓ`, `κ` is `ε_v`, of order prime to `ℓ`. *Needs:* ClassFieldTheory Layers 4, 7, 11; AutomorphicGaloisRepresentationsPartII
AG2.0.

**Checks.**

- `K = ℚ(i)`: the unit character at `1 + i` has order `4` (`ε(i)² = ε(−1) = η_{K,2}(−1) = −1`), prime to every odd `ℓ`; `K = ℚ(√−3)`:
  the unit character at the place above `3` has order divisible by `3`, which is why `ℓ ∤ d_K` (here `ℓ ≠ 3`) is assumed (for
  `ℓ = 3` it sits at the place above `ℓ`, where 3.16 asks nothing, so the hypothesis is sufficient, not sharp).
- For `K = ℚ(√−3)` the unit character cannot be taken through the residue field: `ζ₃ ≡ 1` modulo `√−3`, so a character of the
  residue field `𝔽₃` is trivial on `ζ₃`, while the unit relation asks for a primitive cube root of unity there; `(𝒪_K/3)^×` has order
  `6` and carries such a character.
- The ramification at the primes of `d_K` cannot be avoided: for `ℓ ∤ d_K`, no character `κ` of `G_K` with `κκ^c = χ_ℓ⁻¹` is
  unramified at the primes dividing `d_K`. Indeed `κ ∘ Ver` restricts to `χ_ℓ⁻¹` on `G_K` and takes the value `κ(c²) = 1` at complex
  conjugation, so it is `η_Kχ_ℓ⁻¹` (`χ_ℓ⁻¹` is odd), which is ramified at the primes of `d_K`, while `κ` unramified at `𝔭 | p` would make
  `κ ∘ Ver` unramified at `p`. This is why 3.16 asks only for order prime to `ℓ` on inertia away from `ℓ`.

### Examples

- `K = ℚ`, `n = 1`: the characters `|·|^w ψ` with `f_ψ | M` and `|w| ≤ H` number at most `φ(M)(2H + 1)` (3.1).
- At `q = 5` the bounds of 3.2(b) separate (`4.2 > 3.68`); at `q = 4`, `e = 1`, `z = −1` the Eisenstein trace has absolute value `3.25 < 3.5`, and they do not (3.2).
- `ℓ = 5`, `φ` of conductor `455` with components of orders `2, 3, 3` at `5, 7, 13`, `m = 15`: `B_{1,φξ}` is a unit above `5` for every odd primitive `ξ` modulo `2^{15}`; for `ℓ = 17` and `f = 1` some `B_{1,ξ}` is not a unit at `m = 6`, while every one is at `m = 7` (3.5).
- For a `3`-cycle permutation matrix `y` every `yD^r` has characteristic polynomial `X³ − det(D)^r`, inseparable in characteristic `3` (3.16(c)).
- `ℓ = 3`, `φ` the character of `ℚ(i)`, `w = 13`: the factor `13^k − 1` of the distribution relation is divisible by `3` for every `k`; for `w = 7` the factor `7^k + 1` is a unit at `3` (3.22).
- `K = ℚ(i)`: the unit character at `1 + i` has order `4`, prime to every odd `ℓ` (3.23).

### Dependencies

Layer 0 above, and the settings of 4.4 and 4.5 below (definitions only, using only Layer 0) in 3.20 and 3.21, and the cyclotomic exponents of 4.8 (a definition) in a remark of 3.1. From this family: ReducibilityIdealsAndUltrafilterPatching, HeckeIdealsAndTaylorWilesRelations. Other roadmaps: ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups, RepresentationTheory/LieHighestWeight, ArithmeticGaloisDuality, CyclotomicClassGroupsAndStickelberger, DirichletPadicLFunctions, ClassFieldTheory, GlobalGaloisDeformations, LocalGaloisDeformationRings, ArithmeticGaloisRepresentations, IntegralHeckeAndGaloisDeterminants, IntegralIwasawaTheory, Chebotarev, PadicHodgeTheory, NoncommutativeAndEquivariantIwasawa, DeformationAndDerivedPatchingAlgebra, EndoscopicTransferAndUnitaryTraceComparison, PotentialAutomorphyInfrastructurePartII, ModularForms, AlgebraicModularFormsAndSerreWeights, PadicFamilies, AutomorphicGaloisRepresentationsPartII, ModularityAndLanglandsExtensions, AutomorphicLFunctionsAndLocalFactors. Mathlib.

## Layer 4: residually reducible Eisenstein components

Three deformation problems with diagonal residual representation are studied: unitary of rank three relative to an
imaginary quadratic field (4.1–4.3), the same relative to `ℚ(i)` (4.5), and symplectic of rank four (4.4, 4.7). For each:
a graded model (3.3–3.4) built from the presentation 3.6 and the normalized presentation 3.18, finiteness of the weight-zero
ring, automorphy of points, the shape of the two-signed points (4.6), rigidity, and levels (4.8). The machinery of Layer 3
(3.6, 3.11–3.23, with ReducibilityIdealsAndUltrafilterPatching §§6.10–6.16) is used in the routes of 4.1, 4.2, 4.4 and 4.5; the Hecke side, the big ordinary Hecke algebra of a definite
unitary group at an Eisenstein maximal ideal with its patching data, is HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a,
which in rank four enters through the Hecke ideals of 3.20(e).

### 4.1 The unitary Eisenstein deformation problem

Let `K` be an imaginary quadratic field with character `η_K` and a fixed complex conjugation `c`, `ℓ` an odd prime with
`ℓ ∤ d_K`, `O` the ring of integers of a finite unramified extension `Φ` of `ℚ_ℓ` with residue field `k`, `ψ` a Dirichlet
character with values in `O`, `e ≥ 1` with `ψ(−1) = (−1)^e`, and `Ψ = χ_ℓ^e ψ`. Let `J` be the antidiagonal `3 × 3` matrix
with entries `1`. Define the deformation problem `𝒟 = 𝒟(ψ, e, K)` of lifts `r : G_K → GL₃(A)` of
`r̄ = diag(Ψ̄, 1, Ψ̄⁻¹)|_{G_K}` that are conjugate self-dual for `J`, `r(cgc⁻¹) = J ᵗr(g)⁻¹ J` (equivalently, `𝒢₃`-valued lifts
of `G_ℚ` with multiplier `η_K` and `r(c)` fixed, ArithmeticGaloisRepresentations §7.4), such that:

- (*away from `ℓ`*) at every prime `p ≠ ℓ`, `r(g) = 1` for every `g` in an inertia group at `p` with `r̄(g) = 1`;
- (*at `ℓ`*) the restriction to `G_{ℚ_ℓ}`, as a `𝒢₃`-valued lift, is a point of the ring `R_ℓ = 𝔘/P` of (local chart) below, the
  quotient of the universal lifting ring by the unique minimal prime `P` of the saturated ordinary ideal `I_sat` contained in the
  kernel of the diagonal lift `Ψ ⊕ 1 ⊕ Ψ⁻¹`;
- (*normalization*) `r(g₁) − J ᵗr(g₁) J` is diagonal, for a marked element `g₁ ∈ G_K` at which `r̄` has distinct eigenvalues.

Prove:

(local chart) let `H ⊆ G_{ℚ_ℓ}` be the open normal subgroup on which `η_K` and `ψ` are trivial, `𝔘` the universal ring of
`𝒢₃`-valued lifts of `r̄|_{G_{ℚ_ℓ}}` with multiplier `η_K`, `x` its point of the diagonal lift, `(ψ₀, ψ₁, ψ₂) = (Ψ, 1, Ψ⁻¹)`,
`s_* ∈ I_ℓ ∩ H` with `χ_ℓ(s_*)` of infinite order and `σ ∈ H` generating `H/(I_ℓ ∩ H)` topologically (a positive power of a Frobenius
element modulo inertia). Let `I_ord ⊆ 𝔘` be generated by the coefficients of `charpoly r(s) − ∏_a(X − ψ_a(s))` and the entries of
`(r(s₀) − ψ₀(s₀))(r(s₁) − ψ₁(s₁))(r(s₂) − ψ₂(s₂))`, for `s, s_a ∈ I_ℓ ∩ H`; put `c_a = ∏_{b≠a}(ψ_a(s_*) − ψ_b(s_*))`,
`t_a = tr(∏_{b≠a}(r(s_*) − ψ_b(s_*))·r(σ))`, `δ_a = c_{a+1}t_a − χ_ℓ(σ)c_at_{a+1}` (`a = 0, 1`), `δ = ℓδ₀δ₁`, and `I_sat = (I_ord : δ^∞)`. (At
an upper triangular point with diagonal characters `κ_a`, `δ_a = c_ac_{a+1}κ_{a+1}(σ)·((κ_a/κ_{a+1})(σ) − χ_ℓ(σ))`.) Then: (i) exactly
one minimal prime `P` of `I_sat` is contained in `ker x`; `ℓ ∉ P`; `yP ⊆ I_sat` for some `y` with `x(y) ≠ 0`; `R_ℓ := 𝔘/P` is a domain of
dimension `13`; (ii) every point of `R_ℓ` over a finite `ℚ_ℓ`-algebra is continuous and crystalline on `H` (so potentially
crystalline); for a finite extension `E′` of `Φ` and a finite local `E′`-algebra `B` with residue field `E′`, a lift over `B` with
multiplier `η_K` reducing to the diagonal lift is a point of `R_ℓ` if and only if it is continuous and crystalline on `H`; (iii) `R_ℓ`
is stable under conjugation by `1 + M₃(𝔪)`; (iv) `R_ℓ` is smooth at the diagonal lift in the sense of 3.18, with `1, 2, 3, 4, 2`
coordinates in weights `−2, …, 2`: there is a homomorphism `𝔘 → Φ[[t₁, …, t₁₂]]` over `x` with kernel `P`, sending every entry of
the universal lift to a series homogeneous of the weight of the entry, for weights of the `t_i` of which `1, 2, 3, 4, 2` are
`−2, …, 2`, and inducing an isomorphism from the cotangent space of `R_ℓ` at `x`, tensored with `Φ`, to `⊕Φt_i`. All this for `ℓ`
split or inert in `K`, for every `e ≥ 1`, also when `e = 1` and `Ψ = χ_ℓ` on the decomposition group, and for `O` the ring of integers
of any finite extension of `ℚ_ℓ` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/CrystallineOrdinaryIdeals/OrdinaryLocusIdealLeKerOfIsBasePoint.lean`
(`GlobalTheory.OrdLoc.saturatedOrdinaryIdeal_smooth_at_residualRep`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PadicHodgeTheory/RtChart.lean` (`UpperTheory.V.Loc.rtChart`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PadicHodgeTheory/RtPoints.lean` (`UpperTheory.V.Loc.rtPoints`)).
(*Remark.* `R_ℓ` is the component through the diagonal lift of the Zariski closure of the locus
of lifts that are ordinary at the places of `K` above `ℓ`, with diagonal characters equal on `I_ℓ ∩ ker η_K` to `χ_ℓ^e comp_ℓψ`, `1`,
`(χ_ℓ^e comp_ℓψ)⁻¹`, and whose consecutive diagonal characters are not in ratio `χ_ℓ` on the decomposition group: the relations
with the characters `Ψ, 1, Ψ⁻¹` on `I_ℓ ∩ ker η_K` hold on `R_ℓ`, at its points over finite local algebras, which separate it;
`δ ≠ 0` in the domain `R_ℓ`; and a point with `I_ord = 0`, `δ ≠ 0` is triangular with unlinked characters.)

(model) `𝒟` is represented by a complete local noetherian `O`-algebra `S` with an `X`-weighted presentation `S = R/IR`, where `R` is
the cover of 3.18 (power series in the new variables over `R_ℓ`), with its `X`-weighted presentation for the unitary grading of
the Conventions, smooth at the diagonal lift in the sense of 3.18 (it is a power series ring over `O` only when `R_ℓ` is), and
`I ⊂ R^{gr}` is generated by homogeneous elements; `(R, x, r, T₁ = 1, I)` is a model of `𝒟` in the sense of 3.4 (so `A = R^{gr}`), `r`
the universal normalized lift, `x` the diagonal lift; `x` is a graded smooth point of `A` with `n_j` coordinates and `I` has `m_j`
homogeneous equations of weight `j`, the counts `n_j`, `m_j` of 3.18(a) for this problem; if moreover `K` is not contained in the
field cut out by `ω` and `Ψ̄` (as in 4.2), they are square in weights `−2` and `0`, with one equation more than coordinates in
weight `−1` and one coordinate more than equations in weights `1` and `2`;

(points) every `Ē`-point `ξ` of `A/I` carries `ρ_ξ = ξ ∘ r`, ordinary at the places above `ℓ` with diagonal characters equal on
`I_ℓ ∩ ker η_K` to `Ψ, 1, Ψ⁻¹`; every point derivation of `A/I` at `ξ` is a first-order deformation of `ρ_ξ` with the
conditions of `𝒟`; two points whose representations have isomorphic restrictions to `G_K` lie in one `𝔾_m`-orbit;

(tangent) the hypothesis of 3.4 holds for `𝒮` the restriction to `G_K` of `Ш_{ψ,e}` (injective, as `[K : ℚ] = 2` is prime to
`ℓ`) and the root vector of weight `−1` carrying `Ψ⁻¹`. In [FormalProof] (model), (tangent) and the first two clauses of (points)
are stated for data in general position, that is under the hypotheses of 4.2, and the first two clauses of (points) moreover
under the finiteness of 4.2(a); for other data, and without 4.2(a), they are the roadmap's own, by the route below. Of (strong
irreducibility) [FormalProof] states two clauses, both for data in general position: a type I point with values in the ring of
integers of a finite extension of `Φ` is irreducible on every open subgroup of `G_K` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/MatIrrOpenGd.lean`
(`UpperTheory.V.Pr.matIrr_open_gd`)); and at a type II point `W` is irreducible on `G_{K(μ_{ℓ^∞})}` (on this group itself;
[FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ExistsUnitPowNe.lean`
(`UpperTheory.V.U3.typeII_irr_cyc`)), `W` being irreducible on `G_K` by the definition of type II. The other clauses are the
roadmap's own, by the route below: type I points on `G_{K(μ_{ℓ^∞})}` and on its open subgroups, `W` on the open subgroups of
`G_K` and of `G_{K(μ_{ℓ^∞})}`, and every clause for data that are not in general position;

(shape) every two-signed point is of *type I* (`ρ_ξ` irreducible) or of *type II*: `ρ_ξ ≅ W|_{G_K} ⊕ μ` on the coordinates
`{1, 3}` and `{2}`, for a character `μ` of `G_K` and a two-dimensional representation `W` of `G_ℚ` with `det W = η_K` and
`W|_{G_K}` irreducible, determined up to twist by `η_K` (with the last clause of (points): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/PtShape.lean` (`UpperTheory.V.U3.twoPt_shape`));

(strong irreducibility) if moreover `(ℓ − 1) ∤ 2e` and `(comp_ℓ ψ)² = 1`, every type I point is irreducible on every open
subgroup of `G_K` and of `G_{K(μ_{ℓ^∞})}`, and at every type II point `W` is irreducible on every open subgroup of `G_K` and of
`G_{K(μ_{ℓ^∞})}`.

*Route.* The residual representation has the nonscalar endomorphisms `diag(a, 1, a⁻¹)` compatible with the form, so the
groupoid of lifts has the automorphisms `1 + ε·diag(a, 0, −a)` and the usual criterion for representability of the deformation
functor does not apply; the normalization at the marked element `g₁` (with `r(c)` fixed) removes them and leaves exactly this
torus acting on the normalized lifts. (local chart) (L0) Local Tate duality and Euler characteristic; for de Rham `V` over a finite extension of `ℚ_ℓ`,
`dim H¹_f = dim H⁰ + dim D_dR/Fil⁰`, and `H¹_f(V)`, `H¹_f(V^*(1))` are exact annihilators. (L1) For a character `χ` of an open subgroup
`G` of `G_{ℚ_ℓ}` with values in a finite local `ℚ_ℓ`-algebra `B`, equal to `χ_ℓ^w` on inertia: if `w < 0` the Bloch–Kato cocycles are
the coboundaries; if `w = 0` the unramified cocycles; if `w ≥ 1`, every cocycle is the sum of a Bloch–Kato cocycle and a cocycle
with values in the annihilator of `χ(σ) − χ_ℓ(σ)` (`σ` a generator modulo inertia), which is `0` if `w ≥ 2`: both quotients
`Z¹/Z¹_f`, for `B(χ)` and for the annihilator, have the dimension of `H⁰(B(χ)^*(1))`, by L0. Bloch–Kato cocycles lift along
surjections of such modules, and are detected on open normal subgroups. (L2) The Bloch–Kato cocycles of the `𝒢₃`-adjoint of the
diagonal lift: `ad_j` is a sum of characters `Ψ^j`, `Ψ^jη_K`, so the dimensions are `1, 2, 3, 4, 2` (`2` on each entry of positive
weight, `1` on each other), total `12`; in negative weight they are coboundaries. So a first-order deformation crystalline on
`H` is conjugate by a lower unitriangular matrix `≡ 1` to an upper triangular one. (L3) Upper triangular deformations
crystalline on `H` lift along surjections of finite local algebras: the diagonal is an unramified twist (on `I_ℓ` it is
`Ψ, 1, Ψ⁻¹`); the pair of simple-root cocycles is Bloch–Kato and lifts (L1); for a Bloch–Kato pair a top entry exists (`H²` of the
top-root character vanishes) and can be chosen crystalline on `H` (on `H` by L1, then by averaging over `G_{ℚ_ℓ}/H`), and two
choices differ by a Bloch–Kato cocycle of the top-root character, which lifts. (L4) A deformation over `B` crystalline on `H` is
the conjugate by a lower unitriangular matrix `≡ 1` of an upper triangular one: induction on the length of `B` along `B → B/ε`,
`𝔪_Bε = 0`, by L3 and L2 applied to the pair (the lifted conjugate, the given deformation) over `B ×_E E[ε]`. (L5) Hence
deformations crystalline on `H` lift along surjections. (L6) They kill `I_sat`: `I_ord` vanishes by L4; for `δ^ka ∈ I_ord` glue the
deformation over `B ×_E E[t]/(t^N)` with the diagonal lift twisted by the unramified character `σ ↦ 1 + t`, at which `δ = t^j·`unit,
`j ≤ 2`; lift to `B[t]/(t^N)` by L5; there `δ^ka = 0`, and `δ^k`, congruent to `t^{jk}·`unit modulo nilpotents, can be cancelled at
`t = 0` for `N` large. (L7) A point of `V(I_sat)` over a finite local `B` lifts to a point over a finite local `B′ → B` in which the
annihilator of `δ` dies in `B` (`I_sat` is `δ`-saturated: localise at `ℓ`, Artin–Rees for the nonzerodivisor `δ`); over `B′`, `I_ord = 0`
gives an upper triangular form on `H` (diagonalise `r(s_*)`; the triple products; normality of `I_ℓ ∩ H`), with `δ_a` as displayed;
by L1 the simple-root cocycles are Bloch–Kato after pushing to `B`, and an upper triangular representation with such cocycles is
crystalline (the top root has weight `2e ≥ 2`). (L8) L5–L7 give the hypothesis of the chart criterion 3.18(c) for `𝔘`, `I_sat` and `x`:
exactly one minimal prime `P` of `√I_sat` lies in `ker x`, `yP ⊆ I_sat` with `x(y) ≠ 0`, and `dim 𝔘/P = n + 1` with `n` the dimension of the
tangent space of `𝔘/I_sat` at `x`, which is the space of L2, so `n = 12`. (ii) follows from L6, L7 and `y`; conjugation by the torus
grades the chart, with at most `dim Z¹_f(ad_j)` coordinates in weight `j`, hence exactly; (iii) by conjugating the universal lift
over `R_ℓ[[u]]`: `I_ord` and `δ` are invariant under conjugation and `δ` lies in no minimal prime of `√I_sat`. (model) 3.6 with the frame `{ℓ}` (through `G_{ℚ_ℓ}`, whether `ℓ` is split or inert in `K`), the other primes with the condition
away from `ℓ`, gives the universal lifting ring (lifts, not deformations) relative to `R_ℓ`, with matrix entries as new variables;
the normalization (at `c` and at `g₁`) is eight equations of weights `0, 0, 1, −1, 2, −2, 1, −1`; 3.18(a) with no elimination (so
that `R` is the cover and `R/(q) = 𝔘/(s)`) and (local chart)(iv) give the weighted presentation, and the resulting ring is the
universal normalized ring, so `𝒟` is representable. The counts are 3.18(b) (second Check of 3.18): its hypotheses hold, the
primes other than `ℓ` being condition places with balanced conditions (`I_p/N_p` has order prime to `ℓ`), and
`Hom_Γ(ad_j, ω) = 0` when `K` is not contained in the field cut out by `ω` and `Ψ̄`, since as `G_ℚ`-modules
`ad_{±1} ≅ Ψ̄^{±1} ⊕ Ψ̄^{±1}η_K`, `ad_{±2} ≅ Ψ̄^{±2}η_K`, `ad_0 ≅ 1 ⊕ η_K ⊕ η_K`, and `Ψ̄^j ≠ ω` (`Ψ̄` is even). The graded
subalgebra is the algebra of matrix entries over the invariants (traces and ordinary characters). (points) The diagonal characters at `ℓ` are read off from the ordinary relations by 3.17(b). A
derivation of `A/I` at `ξ` is a map to `Ē[ε]` over `ξ`, that is a first-order deformation with the conditions of `𝒟`. Two points
with isomorphic restrictions to `G_K` differ by an endomorphism of `r̄` compatible with the form and the normalization, that
is, by the torus. (tangent) A class of `Ш_{ψ,e}` restricted to `G_K` has a normalized cocycle `c` (3.4); it is unramified everywhere
and trivial at `ℓ`, so the first-order lift `(1 + εc(g)X)r₀(g)` satisfies the condition away from `ℓ` and is conjugate at `ℓ` to the
diagonal lift by an element `1 + εy`, hence lies on the component through it: it is a point of `S` over `O[ε]/(bε, ε²)`. At the
framed place `ℓ` this local lift is the diagonal lift up to the integral conjugation `1 + εy`, so the derivation it induces on the
local ring is the reduction of an `O`-valued one, it vanishes on the new variables of other weights, and it kills the
normalization equations; 3.18(a) makes it the reduction of an `O`-valued point derivation of `R` of weight `−1`. (shape) Linear algebra on block triangular matrices fixed by the form: `{1, 3}` is
the only proper nonempty set of coordinates other than a flag that the form preserves, and for type II the corner
extends to `G_ℚ` through `c`. (strong irreducibility) If `ρ|_U` is reducible for an open normal `U ⊂ G_K`, Clifford theory
makes it a sum of three characters permuted transitively: the isotypic case is excluded by an element `u ∈ I_ℓ ∩ U` with
`Ψ(u)² ≠ 1` (`Ψ` has infinite order on inertia, `e ≥ 1`), so the lines are the eigenlines of `ρ(u)` and are preserved by the
decomposition group at `ℓ`. Take `x ∈ I_ℓ ∩ G_K` with `Ψ̄(x)² ≠ 1` (from `(ℓ − 1) ∤ 2e`, `(comp_ℓψ)² = 1`, `ℓ ∤ d_K`) and `g ∈ G_K`
permuting the lines cyclically: `tr ρ(gxⁿ) = 0` for all `n`, so residually `Ψ̄(g)Ψ̄(x)ⁿ + 1 + (Ψ̄(g)Ψ̄(x)ⁿ)⁻¹ = 0` for
`n = 0, 1, 2`, which forces `Ψ̄(x) = 1`. Type II: the same with two lines and `tr W(gxⁿ) = Ψ̄(g)Ψ̄(x)ⁿ + (Ψ̄(g)Ψ̄(x)ⁿ)⁻¹`.
From open subgroups of `G_K` to those of `G_{K(μ_{ℓ^∞})}`: the identity component of the Zariski closure of the image acts
irreducibly, hence so does its derived group, which lies in the closure of the image of every open subgroup of
`G_{K(μ_{ℓ^∞})}`, the quotient being abelian. *Needs:* 0.2, 3.3, 3.4, 3.6, 3.17, 3.18; IntegralHeckeAndGaloisDeterminants §1.4
(determinants and reducibility ideals); PotentialAutomorphyInfrastructurePartII §2.1 (the group `𝒢_n`);
ArithmeticGaloisRepresentations §7.4; ArithmeticGaloisDuality R02.4.2 (local Tate duality and the local Euler characteristic),
R02.5.1; SelmerIwasawaCohomology §4.9 (the Bloch–Kato local condition, its dimension and its orthogonality);
LocalGaloisDeformationRings §§1.7, 1.9 (ordinary flags).

**Checks.**

- With `g₁` at which `r̄` has a repeated eigenvalue the normalization does not cut the endomorphisms down to the torus.
- A type II point has a corner on the coordinates `{1, 3}`, the two characters exchanged by the form; the coordinates
  `{1, 2}` are not stable under the form.
- The condition at `ℓ` is finer than ordinarity with the inertial characters: for `e = 1`, `comp_ℓψ = 1` and `Ψ̄ = ω` on a
  decomposition group, ordinary lifts with a linked pair of characters and nonzero monodromy exist, and they are not on
  the components through the diagonal lift of the closure of the unlinked locus that the condition keeps.

### 4.2 Finiteness and automorphy on the unitary Eisenstein component

In 4.1, assume: `N` even with `f_ψ | N`; `ℓ ∤ o_ψ`; `(comp_ℓ ψ)² = 1`; `(ℓ − 1) ∤ 2e`; `(d_K, N) = 1`; `ℓ ∤ h_K`; `K` is not contained
in the field cut out by `ω` and `χ_P(ℓ, ψ)`. (These give the general-position conditions: `Ψ̄²` is nontrivial on inertia at `ℓ`, so
`Ψ̄, 1, Ψ̄⁻¹` are pairwise distinct on the decomposition groups above `ℓ`; `η_K` is unramified at `ℓ`; `K` is not in the field
of `ω` and `Ψ̄`. `(ℓ − 1) ∤ 2e` excludes `ℓ = 3`.) Prove that there are a marked element `g₁` and an abelian CM field `L ⊇ K`,
both depending only on `(ψ, e, K)`, such that:

(a) every lift of `r̄` of type `𝒟` to a complete discrete valuation ring of characteristic `ℓ` has, on a subgroup of finite
index, the characteristic polynomials of `r̄`; consequently the image of `A₀` in `A/I` is finite over `O`;

(b) for every type I point `ρ` with values in the ring of integers of a finite extension of `Φ`, `ρ ⊗ χ_ℓ⁻¹` is automorphic in
the sense of HeckeIdealsAndTaylorWilesRelations §3.13a(f): it is attached to a regular algebraic conjugate self-dual
cuspidal representation `π` of `GL₃(𝔸_K)`, with the clauses (w1), (w2) there; `π` has weight `(e − 1, 0, 1 − e)` at both
embeddings in the sense of AutomorphicGaloisRepresentationsPartII AG2.0, that is labelled weights `(e + 1, 1, 1 − e)` (so that
`ρ` has cyclotomic exponents `(e, 0, −e)` and Hodge–Tate weights `{e, 0, −e}`);

(c) at every type II point `W ⊕ μ`, `W ⊗ χ_ℓ^{−e}` is attached to a newform of weight `2e + 1`, and for every imaginary
quadratic field `K′` with `W|_{G_{K′}}` irreducible, `W|_{G_{K′}}` satisfies the clauses (w1), (w2) of
HeckeIdealsAndTaylorWilesRelations §3.13a(f);

(d) every type I point as in (b) is *unlinked* at `ℓ`: at each place of `K` above `ℓ` no two of its ordinary characters are in
ratio `χ_ℓ` on the decomposition group ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AdmissibleTypeIEvenLevel.lean`
(`UpperTheory.V.Z.J.admissible_typeI_even_level_alt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/TheoremsMuLinked/AutP.lean` (`UpperTheory.V.Th.Unl`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/NumberU3US.lean`
(`UpperTheory.V.Z.J.AdmI_s`)).

The route uses HeckeIdealsAndTaylorWilesRelations §4.2a, in (a)–(c) through steps (3)–(5), 3.15(c) (K1′), (K2′), in (a)–(c) through step (4), and the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d), in (a)–(c) through step (6), all also in (d) through (b); their routes are not given in full (see there). The clauses (w1), (w2) in (b) and (c) are theorems of [FormalProof] whose routes are not given here. [FormalProof] states (a), (b) and (c) as `UpperTheory.V.Aut.AutomorphyUnramifiedCoefficientsAlt` (`DTC/AutomorphyUnramifiedCoefficients.lean`), under the hypotheses of 4.2 for coefficients unramified over `ℤ_ℓ`, with the automorphy of (b) in the form `UpperTheory.V.U3.Dat.IsAutIAlt` (`DTC/IsAutI.lean`): `ρ|_{G_K} ⊗ χ_ℓ⁻¹` attached, with the clauses (w1), (w2); the weight of `π` is not a clause of its statement.

*Route.* (1) *Frame:* the datum `(K, Ψ, 2ℓN|d_K|, ℚ)` is in general position (3.14): an inertia element `s` at `ℓ` with
`Ψ̄(s)² ≠ 1` has `η_K(s) = 1`, `η_K` being unramified at `ℓ`; `Ψ̄` is a power of `ω` on inertia at `ℓ`, as for every Dirichlet character
twisted by a power of `χ_ℓ`; the field
of `(ω, Ψ̄)` is that of `(ω, χ_P(ℓ, ψ))`; and `H = ℚ` serves because `ℓ ∤ o_ψ`, so that on inertia at `p ≠ ℓ`, `Ψ̄ = 1` forces `Ψ = 1`. So
3.14 gives `L = L⁺K`, a big frame on a deep layer of the cyclotomic `ℤ_ℓ`-tower, and the auxiliary prime `w`. (2) *Deformation spaces
over `L`* in ranks two and three: 3.11–3.13 for `Ψ̄|_{G_{L⁺}}`. (3) *Hida theory* at the Eisenstein maximal ideal: for the twist
`κ` and the auxiliary place `v₀` of 3.16 (one neat place, no Steinberg place), HeckeIdealsAndTaylorWilesRelations §3.13a
gives the universal ordinary determinant ring `B_det`, the surjection onto the localized big ordinary Hecke algebra of the
definite unitary group over `L`, which keeps the non-cuspidal constituents, with kernel `J`, `B_det/J` finite and torsion-free
over `Λ`, and §4.2a the automorphic patching data of `J`; through `Φ` of 3.16(h), `Φ(J)` is an ideal of the invariant ring with
finite quotient over `Λ` (the twist `κ`: `χ_ℓ⁻¹|_{G_L}` in rank three, the restriction to `G_L` of the character of 3.23 in rank two,
with `M = 2ℓN|d_K|`; it is ramified at the primes of `d_K`, with order prime to `ℓ`, which is what 3.16 asks). (4) *Patching* at nice primes: 3.16(a)–(d) give (N1), (N3), (N4) and type I at
nice primes of irreducible type, 3.16(a), (d), (f), (g) the same with type E at nice primes of block type, 3.16(e) matches the
irreducible and thick primes with stable and thick ones; with the detection of 3.15(d), 3.15(a), (b) then give (P1) and (P23) of
ReducibilityIdealsAndUltrafilterPatching §6.12(1). (5) *Propagation* (ReducibilityIdealsAndUltrafilterPatching §6.12, with `D₁ ≥ 0` a dimension bound),
first in rank two, then in rank three across the block locus (3.12(c) from the rank-two conclusion); finiteness of the
weight-zero ring over the weight algebra, together with the triviality of characters of finite exponent with values in
`1 + 𝔪`, gives (a). (6) *Seeds:* the rank-three seeds are those of 3.22(d) (outline: base change to `L` of the adjoint of a
newform Eisenstein-congruent after twisting the nebentypus by a character of order `ℓ` and conductor `w` (3.22(b)), by Hida
theory (PadicFamilies §§1.7, 1.8, 1.8a, 1.9, 4.1) and the Gelbart–Jacquet lift (GL2AutomorphicRepresentationsAndTransfer
R17.4.13)), with `M′ = 2ℓN|d_K|` (the frame field `L` of 3.14 is unramified over `L⁺` at the finite places and split above `M′`);
the rank-two seeds are those of 3.22(c); in both, `χ′` and `j` are such that `χ̄_ℓ^jχ̄′ = Ψ̄`, with `χ′ = ψ·(comp_ℓ ψ)⁻¹` of
conductor dividing `N` (so `χ′ ≠ η_K`, as `(d_K, N) = 1`), `w` is the auxiliary prime of 3.14 and
`L` the field of the frame (which contains the field of degree `ℓ` and conductor `w`); both kinds are points of `B_det/J`
(HeckeIdealsAndTaylorWilesRelations §3.13a(f), with `n = 3`, resp. `n = 2`, in its range `2 ≤ n ≤ 4`; the clauses (w1), (w2) of
its automorphy are those of 3.22(d), resp. 3.22(c)), and 3.13 makes them local components.
(7) The argument is run for two auxiliary neat places and glued. (8) *Descent:* a pro-modular type I point is an arithmetic
point of `B_det/J` with irreducible
representation, hence automorphic over `L` (§3.13a(e), which gives the clause (w1), and the clause (w2) only at the places
not above the auxiliary place); it descends to `K` by soluble base change and descent
(PotentialAutomorphyInfrastructurePartII §0.9), using that `ρ|_{G_L}` is irreducible, which 4.1 (strong irreducibility) gives; the
weights at both embeddings are read off from the inertial characters at the places above `ℓ`. (c) by descent of rank-two
automorphy from `L` to `ℚ` (`W|_{G_L}` is irreducible by 4.1) and the inertial flag `(χ_ℓ^e, χ_ℓ^{−e})`. (d) For `e ≥ 2` the ordinary
characters have cyclotomic exponents differing by `e` and `2e`, never by `1`. For `e = 1`: by 4.1 (local chart)(ii) the restriction of
a type I point to the decomposition group at a place `v` of `K` above `ℓ` is potentially crystalline; by (b), `ρ ⊗ χ_ℓ⁻¹` is attached
to `π`, and the full comparison at `ℓ` (AutomorphicGaloisRepresentationsPartII AG2.6, *Full polarized local–global compatibility
at `ℓ`*, whose hypothesis `ExtremelyRegularIrreducibility 3` is ModularityAndLanglandsExtensions §2.43) gives
`WD(ρ|_{G_{K_v}} ⊗ χ_ℓ⁻¹)^{F-ss} ≅ rec^T(π_v)` with monodromy; so `rec^T(π_v)` has `N = 0`, and `π_v`, generic, is an irreducible product of
characters, no two of which are in ratio `|·|` (SmoothRepresentationsOfLocalGroups SR.5.2). The Weil–Deligne characters of the
ordinary characters `κ_i` are these characters, and `κ_i = κ_jχ_ℓ` on the decomposition group would put two of them in ratio
`|·|`. No bound on `ℓ` relative to the rank is used. *Needs:* 3.11–3.16, 3.22, 3.23, 4.1; ReducibilityIdealsAndUltrafilterPatching §6.12; PotentialAutomorphyInfrastructurePartII §§0.9, 2.1–2.2 and
HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a; PadicFamilies §§1.7, 1.8, 1.8a, 1.9, 4.1; GL2AutomorphicRepresentationsAndTransfer R17.4.13;
AutomorphicGaloisRepresentationsPartII AG2.0, AG2.3, AG2.6; ModularityAndLanglandsExtensions §2.43;
SmoothRepresentationsOfLocalGroups SR.5.2.

### 4.3 Rigidity on the unitary Eisenstein component

For a point `ρ` of `𝒟`, `ad r` denotes `𝔤𝔩₃` with `G_ℚ` acting through the `𝒢₃`-valued extension of `ρ` (`G_K` by
conjugation, `c` by `X ↦ −X^*`, the adjoint for the form), and `H¹_f(ℚ, ad r)` its Bloch–Kato Selmer group
(PotentialAutomorphyInfrastructurePartII §9.3). Under the hypotheses of 4.2, prove: (i) (*diagonal points*) a point
of `𝒟` that is both upper and lower triangular is the diagonal point; (ii) (*rigidity at the diagonal point*)
`H¹_f(ℚ, Φ(Ψ⁻¹)) = H¹_f(ℚ, Φ(Ψ⁻²)) = 0` and the same for the `η_K`-twists, and the weight-zero deformations of the diagonal
characters are trivial; so the tangent vectors of weight `≤ 0` at the diagonal point vanish rationally ((i), (ii): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/Rigid0.lean` (`UpperTheory.V.U3.PtHyp`)); (iii)
(*rigidity at two-signed points*) `H¹_f(ℚ, ad r) = 0` at every two-signed point; (iv) at
every two-signed point `ξ`, any two `Ē`-valued point derivations of `A/I` at `ξ` are proportional ((iii), (iv) follow from [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/RigEnd3.lean` (`UpperTheory.V.Th.RigidityFirstCase`)). The route of (iii), (iv) uses, through 4.2(b)–(d), HeckeIdealsAndTaylorWilesRelations §4.2a, 3.15(c) (K1′), (K2′) and the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d), whose routes are not given in full (see there).

*Route.* (i) A point that is both upper and lower triangular is diagonal, `diag(Ψ′, μ, Ψ′⁻¹)`; `Ψ′Ψ⁻¹` and `μ` are characters
of `G_K` of `ℓ`-power order, trivial on inertia away from `ℓ` (the condition away from `ℓ`) and with the inertial characters
`Ψ, 1, Ψ⁻¹` in this order at `ℓ`: `Ψ̄² ≠ 1` on inertia at `ℓ` (4.2: `(ℓ − 1) ∤ 2e`, `(comp_ℓψ)² = 1`), so the three residual characters
are distinct there and the points of the component through the diagonal lift have their inertial characters on the coordinate
lines in that order; hence `Ψ′Ψ⁻¹` and `μ` are unramified everywhere and trivial because `ℓ ∤ h_K`. (ii) At `ℓ` the characters `Ψ⁻¹, Ψ⁻²` have
negative cyclotomic exponents `−e`, `−2e` (positive Hodge–Tate weights in the convention of the Conventions), so the local
Bloch–Kato condition is zero; the rational Selmer groups are the rational
versions of `Ш_{ψ,e}` and `Ш_{ψ²,2e}` and of their `η_K`-twists, which are finite (BernoulliBoundsForClassGroupEigenspaces §§6.17(b), 6.18(d)), hence
zero. (iii) Every two-signed point is of type I or II and strongly irreducible (4.1) and automorphic (4.2(b), (c); at type II
points through the clauses (w1), (w2) of 4.2(c)). At
type I points HeckeIdealsAndTaylorWilesRelations §9.9(a) with `n = 3`. At type II points `μ = 1` by the argument of (i),
and as a `G_ℚ`-module `ad r` is the `𝒢₂`-adjoint of `W` (`≅ ad⁰W ⊕ η_K`), plus the line of the middle character (`η_K`), plus
`W ⊕ W ⊗ η_K` from the off-diagonal blocks (`W^∨ ≅ W ⊗ η_K`): the first vanishes by §9.9(c), the lines `η_K` by finiteness of
the class group of `K`, and `W ≅ V_λ(f)(e)`, `W ⊗ η_K ≅ V_λ(f ⊗ η_K)(e)` by BernoulliBoundsForClassGroupEigenspaces §14.1, the pair `(f, λ)` being
admissible by BernoulliBoundsForClassGroupEigenspaces §13.1. Its hypotheses hold: `f` has no complex multiplication, because `W` is irreducible on every
open subgroup of `G_K` (4.1), while the representation of a form with complex multiplication is induced; and `V_λ(f)` is
reducible on the decomposition group `G_{ℚ_ℓ}`: the ordinary flag of the point gives a line of `W` stable under the decomposition
group of `K` at `ℓ` on which an open subgroup of inertia acts through `χ_ℓ^e`; the two cyclotomic exponents `e`, `−e` of `W` differ
and `χ_ℓ` is a character of `G_{ℚ_ℓ}`, so this line is the unique line of exponent `e` and is stable under the whole decomposition
group, also when `ℓ` is inert in `K`. [FormalProof] proves the instance of BernoulliBoundsForClassGroupEigenspaces §14.1 used
here under the hypotheses listed there, which these points satisfy as follows: `ℓ` is odd and `ℓ ∤ d_K` (4.1); `(ℓ − 1) ∤ 2e`
and `ℓ ∤ h_K` are hypotheses of 4.2; the line just found is stable under the whole decomposition group, and the inertial
characters on it and on the quotient are `Ψ` and `Ψ⁻¹`, that is `χ_ℓ^{e}comp_ℓψ` and `χ_ℓ^{−e}comp_ℓψ` (4.1 (points) and the
remark of 4.1 (local chart): `η_K` is unramified at `ℓ`, and `(comp_ℓψ)² = 1` by 4.2), with `comp_ℓψ` of conductor dividing `ℓ`
(a character of order at most `2`, `ℓ` odd); and `W`, hence `V_λ(f)`, is irreducible on `G_{K(μ_{ℓ^∞})}` (4.1 (strong
irreducibility)). The last hypothesis of that instance is not on the level of `f`. It asks for an integer `N ≥ 1`, even and
prime to `d_K`, such that `ψ` is a character modulo `N` and `W` has level `N|d_K|` with exponents `(e, −e)`: at every prime
`p ≠ ℓ` the inertia group acts on `W` through two characters that are trivial on `G_{ℚ(μ_{N|d_K|})}`, and at `ℓ` the two
characters of the flag are, on inertia, `χ_ℓ^{e}` and `χ_ℓ^{−e}` times characters trivial on `G_{ℚ(μ_{N|d_K|})}`, and either they
are not in ratio `χ_ℓ` on the decomposition group or `W` is potentially crystalline at `ℓ`. Here `N` is the integer of 4.2, even
and prime to `d_K` by hypothesis; so `d_K` is odd and `η_K` is trivial on `G_{ℚ(μ_{|d_K|})}`. Away from `ℓ`: by the condition
of `𝒟` there, the inertia group at `p` acts on `ρ` through a finite quotient of order prime to `ℓ`, hence on `I_p ∩ G_K` through
a conjugate of `diag(Ψ, 1, Ψ⁻¹)`, with `Ψ = ψ` there; `W` is the corner on the coordinates `{1, 3}` extended through `c`, so the
inertia group at `p` acts on it through two characters that are trivial wherever `ψ` and `η_K` both are. At `ℓ`: the characters
of the flag are `χ_ℓ^{e}ψ` and `χ_ℓ^{−e}ψ⁻¹` on inertia, and their ratio, of cyclotomic exponent `2e` up to a character of finite
order, is not `χ_ℓ` (the first alternative holds). The instance also asks that `det W = η_K`, that `tr W = Ψ + Ψ⁻¹` on inertia
at `ℓ`, and that `tr W ≡ η_KΨ + Ψ⁻¹` residually; these hold by 4.1 (shape) and (points). [FormalProof] establishes every
hypothesis of the instance at the type II points of data in general position, from the hypotheses of 4.2 and the conditions of
`𝒟` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/KatoUsedOf.lean`
(`UpperTheory.V.Z.Kato.used_of_alt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/KatoQuadraticCharacters/KatoTwoOfUseN.lean`
(`UpperTheory.V.Z.Kato.Used`)). (iv) By 4.1
(points) a point derivation at `ξ` is a first-order deformation of `ρ_ξ` of type `𝒟`; modulo the torus direction it is a class
in `H¹(G_ℚ, ad r)`. Away from `ℓ` it is a coboundary on inertia: the deformation is trivial on the inertia elements at which `r̄`
is trivial, and the quotient by them is finite of order prime to `ℓ` (as `ℓ ∤ o_ψ`). At `ℓ` the deformation is a point of `R_ℓ`
over `E′[ε]` for a finite extension `E′` of `Φ` (the image of a compact group is defined over a finite extension); by 4.1 (local
chart)(ii), the points of `R_ℓ` over finite `ℚ_ℓ`-algebras, nonreduced ones included, are crystalline on the open subgroup `H` on
which `η_K` and `ψ` are trivial; so the deformation is an extension of `ρ_ξ` by itself that is crystalline over a finite extension, and its class lies in
`H¹_f`, a condition detected over a finite extension. No genericity is used; the argument covers type II points with `e = 1` and
points that are linked. By (iii) the class vanishes, so the derivation is a multiple of the torus
direction. *Needs:* 4.1, 4.2; BernoulliBoundsForClassGroupEigenspaces §§6.17, 6.18; PotentialAutomorphyInfrastructurePartII §9.3 and HeckeIdealsAndTaylorWilesRelations
§9.9; BernoulliBoundsForClassGroupEigenspaces §§13.1, 14.1.

**Checks.**

- The hypotheses of 4.2 are needed in (i): for `K = ℚ(i)`, `ℓ = 29`, `e = 28`, `ψ` cubic of conductor `7`, `Ψ̄` is trivial on the
  decomposition group at `29` and `diag(Ψ′, 1, Ψ′⁻¹)`, `Ψ′ = ψχ_ℓ^{−28}`, is a second diagonal point of the problem of 4.1.

### 4.4 The symplectic Eisenstein component

*Setting.* Let `χ` be primitive, `E = E_n(χ, Q)` a host field, `ℓ` odd, `2 ≤ e < t`, and `ψ ∈ X(E, e)` in Case II or Case III
(0.4), so that `χ_P(ℓ, ψ) ≠ 1`. Let `O` be the ring of integers of a finite extension `Φ` of `ℚ_ℓ` containing the values of `ψ`
and the `2^m`-th roots of unity, with residue field `k`. Let `ξ = ξ₀ξ′`, `ξ′` an odd primitive character of conductor `2^m`, where
`m = m(ℓ, ψ)` is the least integer with `2^m ≥ max(ℓN·4^{n₀}, 2^{c₂(ψ)+6}·o_χ·ℓ³·f_χ²)` in Case II ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean`
(`UpperTheory.V.HV.Host.nII`)) and with
`2^m ≥ max(ℓ·f_χ·p₁(χ)·4^{n₀}, 8ℓ²)` in Case III; here `n₀ = v₂(ℓ^{f₀} − 1)`, `f₀` is the order of `ℓ` modulo `lcm(4, o₁)`, and `o₁` the
order of the prime-to-`ℓ` part of `ψ` with its component at `2` removed. `ξ₀ = 1` in Case II, and in Case III `ξ₀` is a character
modulo `p₁(χ)` of order exactly `o_ψ`. Put `Ψ = χ_ℓ^e ψ`,
`α = χ_ℓ ω⁻¹ ξ`, `β = Ψα⁻¹`, `θ = αΨ`, so that `{θ, Ψ, α, 1} = {Ψ, 1}·{α, 1}` and `α, β, θ` are odd. Let `r̄₀ = diag(θ̄, Ψ̄, ᾱ, 1)`,
symplectic with multiplier `θ̄` for the form of the Conventions, and `r₀ = diag(θ, Ψ, α, 1)`, of cyclotomic exponents
`(e + 1, e, 1, 0)`. Let `S` be the set of primes dividing `2ℓNp₁(χ)` (`p₁ = 1` in Case II), `S_b` the primes `p ≠ ℓ` of `S` with
`ℓ | #ψ(I_p)`, and `T = {ℓ} ∪ S_b`. Fix, as data of the problem, for each `v ∈ T` an element `Frob_v` of the decomposition group at
`v` lifting the Frobenius, with `χ_ℓ(Frob_ℓ) = 1` at `ℓ` (`ψ` may be ramified at the primes of `S_b`, and at `ℓ` when `ℓ | N`). Assume:

- (G1) for `γ ∈ {α^{±1}, β^{±1}, θ^{±1}}`, every class in `H¹(G_ℚ, k(γ̄))` that vanishes on every element of an inertia group
  outside `T` at which `r̄₀` is trivial, and on the decomposition groups at the primes of `T`, is zero;
- (G2) `ξ̄Ψ̄^i(Frob_v) ≠ 1` for all `i ∈ ℤ` and `v ∈ T`; in particular residual characters of `r̄₀` whose indices lie in different
  blocks `⟨e₁, e₃⟩`, `⟨e₂, e₄⟩` differ at `Frob_v`. (In Case III, `S_b = ∅`, as `ℓ ∤ o_ψ`.)

*The problem `𝒟_sp`:* `GSp₄`-valued lifts of `r̄₀` with multiplier `θ`; trivial on every element of an inertia group outside
`T` at which `r̄₀` is trivial; trivial on `I_p ∩ ker ψ` for `p ∈ S_b`; at `ℓ` ordinary, with a flag stable under the
decomposition group in the order `(θ, Ψ, α, 1)` and inertial characters exactly `θ, Ψ, α, 1` on `I_ℓ`; with the local lifts at
the primes of `T` on an irreducible component through `r₀`; normalized at two marked elements `g₁, g₂`: `r(g₁)` preserves
`⟨e₁, e₃⟩` and `⟨e₂, e₄⟩` (its entries of nonzero `λ`-weight vanish: six conditions, one on each odd root), and the matrix
`r(g₂) + θ(g₂)r(g₂)⁻¹` has zero entries `(1, 3)` and `(3, 1)` (one condition on each of `±Ψ`). Here `g₁ = lim_n Frob_ℓ^{ℓ^{n!}}`, an
element of the decomposition group at `ℓ` with `χ_ℓ(g₁) = 1` at which `r̄₀(g₁) = r̄₀(Frob_ℓ)`, so that residual characters of
different blocks differ at `g₁` by (G2), and `g₂` is an element with `ᾱ(g₂) ≠ 1` and `Ψ̄(g₂) ≠ 1`; the infinitesimal conjugations
preserving the normalization are exactly those of the rank-two torus of the Conventions. A *tower field* is a CM field
`L = F·K`, abelian over `ℚ`, with `F` totally real of even degree and `K` imaginary quadratic in which the primes of `S` split, `L/F`
unramified at every finite place, such that: `r̄₀` is trivial on the inertia groups of `F` above `ℓ`; an inertia element of `F` at a
place not above `ℓ` on which `r̄₀` is trivial is in the kernel of `ψ`; `ψ` has order prime to `ℓ` on `G_{F(μ_{ℓ^∞})}`; on `G_L` the four
residual characters are pairwise distinct; `ω|_{G_L}` is not a product of powers of `ᾱ|_{G_L}` and `Ψ̄|_{G_L}` (so `μ_ℓ ⊄ L`, and no
two of the four characters differ by `ω` on `G_L`); no nontrivial quadratic character of `G_L` trivial on `ker ω` permutes the four
by multiplication; some ratio of two of them has order `> 4` on `G_L`; and at each place of `F` above `ℓ`, either `ω` is ramified,
or some element of the decomposition group has `ω = 1`, `Ψ̄ = 1`, `ᾱ ≠ 1`. The condition on `ω` gives, by Chebotarev, auxiliary
places `v₀` of `L`, of prime norm, of residue characteristic outside any given finite set, split over `F`, at which the four
residual characters agree and are unramified and `Nv₀ ≢ 1 mod ℓ` (tower fields and the host: [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/NearSplit.lean` (`UpperTheory.V.Ws.Tower.Ok`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/NearSplit.lean` (`UpperTheory.V.Ws.Ctx2`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean`
(`UpperTheory.V.HV.Host`)).

*Prove:*

(local chart) the completed tensor product over `O` of the framed rings of the conditions of `𝒟_sp` at the places of `T` (the
component through `r₀` of the ordinary lifts with the fixed inertial characters at `ℓ`, and of the lifts trivial on `I_p ∩ ker ψ` at
`p ∈ S_b`) is smooth at `r₀` (in the sense of 3.18) with `2 + b` coordinates on each positive root, `1 + b` on each negative root and
`2 + 2b` in weight `0`, `b = #S_b` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/LocBase.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.locBase`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/ResidueCharMemLevelPrimes.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.LocBase`)): the ring at `ℓ` is regular at `r₀`, the component through `r₀` is
unique, and it has `2` coordinates on each positive root, `1` on each negative root and `2` in weight `0`; the ring at each `p ∈ S_b` has `1` on each root
and `2` in weight `0`;

(model) there are a complete local domain `R` with a `ℤ²`-weighted presentation, smooth at its origin `x` (3.18) with one
coordinate of each of the weights of `α`, `β`, `θ`, `r′` of weight `(0, 1)`, `r ≥ 1` of weight `(0, −1)`, `m` of weight `0`, and none of
the weights of `α⁻¹, β⁻¹, θ⁻¹`, homogeneous equations `F, E, Z` (`r + 1`, `r′`, `m` of them) of weights `(0, −1)`, `(0, 1)`, `0`, and a
lift `r : G_ℚ → GSp₄(R^{gr}/(F, E, Z))` of type `𝒟_sp` with homogeneous entries, which generate `R^{gr}/(F, E, Z)`, with value `r₀` at `x`:
a model `(R, x, r, λ(𝔾_m), (F, E, Z))` of `𝒟_sp` in the sense of 3.4. `S = R/(F, E, Z)` is a quotient of the ring of normalized lifts
whose restrictions at `T` are points of the local rings; it need not represent `𝒟_sp`. The
subalgebra `A = ⊕_n R_{(0,n)}` of `λ`-weight zero, graded by the `μ`-weight, is a graded local algebra with a torus-fixed point
(ReducibilityIdealsAndUltrafilterPatching §4.8), generated over `A₀` in weights `±1, ±2`, and `x` is a graded smooth point of `A`, for the
saturated square of `A`, with `0, r, m, r′ + 1, 1` coordinates of weights `−2, −1, 0, 1, 2`; `F, E, Z` are equations of `A` of weights
`−1, 1, 0`, and `F, Z` span `cot_{−1}(x)`, `cot_0(x)` of `A` over `Φ` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/ExModel.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.exModel`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/EntryMem.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.Model`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/ASmooth.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.aSmooth`));

(points) every `Ē`-point of `A/(F, E, Z)` lifts to an `Ē`-point of `R^{gr}/(F, E, Z)` (the quotient by `λ` is surjective on geometric
points), and such a point can be moved by the rank-two torus to an integral point congruent to `r₀`, that is to an `Ē`-point of
`𝒟_sp` (this uses (a)); two points of `A/(F, E, Z)` coming from points with conjugate representations, one of them irreducible,
lie in one `𝔾_m`-orbit.
Every `Ē`-point `ρ` of `𝒟_sp` is irreducible, or *triangular* for an ordering of the basis, or *block* triangular for
`⟨e₁, e₃⟩ ⊕ ⟨e₂, e₄⟩` (all entries of positive `λ`-weight vanish, or all of negative `λ`-weight) with both entries `(1, 3)` and
`(3, 1)` not identically zero; a triangular point has either all entries of negative `μ`-weight zero and inertial character
`θ` on the entry `(1, 1)` at `ℓ`, or all entries of positive `μ`-weight zero and inertial character `α` there ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/DiagCases.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.diagCases`)), the second
being possible only if `Ψ̄` is trivial on the decomposition group at `ℓ`;

(unlinked) every point is unlinked at `ℓ` on every open subgroup `U` of the decomposition group containing `Frob_ℓ`: its
ordinary characters `κ_i` satisfy `κ_i ≠ κ_jχ_ℓ` somewhere on `U` for all `i ≠ j` (in [FormalProof] the statement is on the
decomposition group itself; the form for its open subgroups containing `Frob_ℓ` is the roadmap's own: `χ_ℓ(Frob_ℓ) = 1`, and by
(G2) the residual characters of two ordinary characters whose exponents differ by one differ at `Frob_ℓ`);

(tangent) for every `b ≠ 0` in `O` and every class of `Ш_{ψ,e}(S)` killed by `b`, with normalized cocycle `c` (3.4, normalized at
the marked element `g₂`, at which `Ψ̄(g₂) ≠ 1`), there is an
`O`-valued point derivation of `R` at `x` of weight `(0, −1)`, killing `(F, E, Z)` modulo `b`, that agrees modulo `b` with the
first-order lift `(1 + εc(g)(E_{31} + E_{42}))r₀(g)`: the hypothesis of 3.4 holds ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/MPrime.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.mPrime`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/EntryMem.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.Model`));

(irreducibility) every irreducible point `ρ` is irreducible on `G_{K(μ_{ℓ^∞})}` for every abelian field `K` unramified at the
primes of `S` other than `ℓ`; it is irreducible on `G_L` and on `G_{L(μ_{ℓ^∞})}` for every tower field `L`; and if moreover some
element of a decomposition group of `L` above `ℓ`, in the kernel of `χ_ℓ`, has eigenvalues under `ρ` with no ratio of finite
order, every nonempty open subset of `G_{L(μ_{ℓ^∞})}` contains an element at which `ρ` has separable characteristic
polynomial. The same holds for points over `k[[t]]` whose ordinary characters are pairwise distinct on `I_ℓ ∩ ker χ_ℓ`, with
the element supplied automatically (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/CompactIntegralFields/H4.lean` (`UpperTheory.V.Ws.h4`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/WeakShimuraTheory/AutomorphicCharacters/IrrOfStab.lean`
(`UpperTheory.V.Ws.auIrr`)). At an irreducible point with values in `ℚ̄_ℓ` that is automorphic over a tower field `L`
and unlinked ((unlinked)), such an element exists (*free ratios at characteristic zero*). The same two conclusions for
representations of `G_L` automorphic in the sense of HeckeIdealsAndTaylorWilesRelations §3.13a(f), which need not be points of
`𝒟_sp`, are 3.20(f);

(∗) every lift of type `𝒟_sp` to a complete discrete valuation ring of characteristic `0` or `ℓ` that is absolutely irreducible, or a
nonsplit block triangular extension in which `⟨e₂, e₄⟩` is stable (the entries of positive `λ`-weight vanish) and absolutely
irreducible, is
*pro-modular*: for the tower datum `T₀` of 3.20(a) there are an `ℓ`-extension
`T₁` as in 3.20(c) and, for every large `m`, with `T` the `m`-th layer of the cyclotomic `ℤ_ℓ`-extension of `F_{T₁}`, a lattice whose
restriction to `G_{F_T}` is a point of `V(J)` for an ideal `J` as in 3.20(e) over `T`; consequently pro-modular
`Ē`-points are *weakly pure* (3.20(e)(pur)): on an open subgroup, at almost all Frobenius elements `σ`, of norm `Q`, any two
eigenvalues `y, z` of `ρ(σ)` satisfy `|y| < Q|z|` under the isomorphism `ι` of 3.20(e)(pur) (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PotentialModularityTower.lean`
(`UpperTheory.V.Ws.ProModAlt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/PromodularityCaseThree.lean`
(`UpperTheory.V.Cu.PromodularityCaseThreeDense`));

(a) for every lift of type `𝒟_sp` over a complete local `O`-algebra, the `O`-algebra generated by the monomials of weight `(0, 0)`
in its matrix entries is finite over `O`; equivalently, every lift to a complete discrete valuation ring of characteristic `ℓ`
has, on a subgroup of finite index, the weight-zero monomials of `r̄₀`; consequently the image of `A₀` in `A/(F, E, Z)` is finite
over `O`;

(a′) no point of `𝒟_sp` is of block type with irreducible block on `⟨e₁, e₃⟩` ((a), (a′): [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/IsAut4.lean`
(`UpperTheory.V.Aut.SymplecticFourImageDense`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/DecompSigmaOrd.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.Raw.Fin0`));

(b) every irreducible point `ρ` with values in `ℚ̄_ℓ` is automorphic over imaginary quadratic fields: there is an isomorphism
`ι : ℚ̄_ℓ ≅ ℂ` such that for every imaginary quadratic field `K` with `ρ|_{G_K}` irreducible, `ρ|_{G_K}` is attached to a regular
algebraic cuspidal automorphic representation of `GL₄(𝔸_K)` and satisfies the clauses (w1), (w2) of
HeckeIdealsAndTaylorWilesRelations §3.13a(f).

The routes of (∗), (a), (a′), (b) and (points) use 3.20(d), (e), ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16 through 3.19(a), and, through 3.20(e), HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d), whose routes are not given in full (see there).

*Route.* (local chart) By the chart criterion 3.18(c) a lifting ring is smooth at an `O`-point, with coordinates counted by the
first-order lifts, as soon as lifts over finite local `Φ`-algebras reducing to the point lift along nilpotent thickenings; the
torus, linearly reductive, makes the coordinates homogeneous. At `ℓ` the ordinary condition near `r₀` is a symplectic flag with the fixed inertial characters, and
a lift is the conjugate of a Borel-valued one: one lifts the conjugation, the two free unramified twists and the Borel-valued
representation, which is unobstructed because no positive root character is `χ_ℓ` on the decomposition group (at `Frob_ℓ`, where
`χ_ℓ = 1`, the residual characters `ᾱ = ξ̄`, `β̄ = Ψ̄ξ̄⁻¹`, `θ̄ = ξ̄Ψ̄` are `≠ 1` by (G2); and `Ψ = χ_ℓ^e ≠ χ_ℓ` on an inertia element in
`ker ψ ∩ ker ω` at which `χ_ℓ` has infinite order, as `e ≥ 2`), so the second cohomology of the positive root characters vanishes.
So the ring at `ℓ` is regular at `r₀`, the component through `r₀` is unique, and the first-order lifts are `2` on each positive root
(one class and one coboundary), `1` on each negative root (a coboundary) and `2` in weight `0` (the unramified homomorphisms of the
two free diagonal characters): `14 = 10 + 4`. At `p ∈ S_b` the lifts factor through an extension of `Ẑ` by a finite group, so in
characteristic zero the second cohomology vanishes and the first-order lifts are the cocycles: `1` on each root, `2` in weight `0`.
The completed tensor product has the product chart. (model) 3.6 for the weight lattice `ℤ²`, the form of the
Conventions with fixed multiplier and the frame "`T` framed, the other primes of `S` with the condition outside `T`" gives a
`ℤ²`-weighted presentation relative to the local rings at `T`, which are smooth at `r₀` by (local chart); 3.18, eliminating the frames at `S_b` and the block condition at the first marked element, with the other
normalization conditions as equations, gives `R`, the equations and the generating lift; with the Greenberg–Wiles formula and
(G1) the counts are, root by root, one coordinate and no equation for each of `α, β, θ`, nothing for their inverses, one
equation more than coordinates for `Ψ⁻¹`, and square counts for `Ψ` and for weight `0` (3.18(b), third Check of 3.18). The total excess on
`R` is `2`, the rank of the torus. The invariant ring: the
only chart coordinate of `λ`-weight `−1` is the one `b` of the root `β`, all others having `λ`-weight `0` or `1`; the exponent
vectors of `λ`-weight `0` form the free monoid on the coordinates `t_i` of `λ`-weight `0` and the products `t_ib` with the
coordinates of `λ`-weight `1` (those of `α` and `θ`), so a `λ`-invariant series is a unique series in these, of `μ`-weights
`1` (for `α·β`) and `2` (for `θ·β`); this is the chart of `A`, with the excess pattern `0, −1, 0, +1, +1`, total `1`. Generators: the
homogeneous elements whose linear parts are the coordinates, multiplied by the generator for `b` when of `λ`-weight `1`;
every element of `A` vanishing at `x` lies in the saturation of their span plus the square of the maximal ideal of `A`,
because a `λ`-invariant monomial of degree `≥ 3` is a product of two nonconstant `λ`-invariant monomials. The equations
have `λ`-weight `0`, so they lie in `A`. Spanning: an `O`-valued point derivation of weight `(0, −1)` or `0` killing `F`, resp.
`Z`, kills all equations, hence is a first-order deformation of `r₀` that is a point, whose entries are cocycles for `Ψ⁻¹`
unramified and trivial at `ℓ`, resp. unramified homomorphisms, so it vanishes (BernoulliBoundsForClassGroupEigenspaces §6.17(b)); the map from the
cotangent lattice of `A` of weight `−1` to that of `R` of weight `(0, −1)` is onto between torsion-free modules of rank `r`.
(points) A geometric point of `A/(F, E, Z)` is a closed `λ`-orbit of points of `R^{gr}/(F, E, Z)`, so it lifts; the lifted point has
values in a finitely generated `O`-algebra, and a torus element makes its entries integral and congruent to `r₀`, because the
weight-zero monomials are integral by (a). Two points with conjugate irreducible representations differ by a torus element
(the normalization), and on `A` only its `μ`-component acts. Trichotomy: the set of pairs `(i, j)` with nonzero entry is a preorder (the span of the image
is an algebra), stable under the form. If `i, j` of different `λ`-weights are linked in both directions and no third index
is, the entries with indices in `{i, j}` form a two-dimensional representation; the ordinary flag gives a stable line in it,
and a lattice whose reduction is nonsplit gives a residual class for `ps̄_i/ps̄_j ∈ {ᾱ, β̄, θ̄}^{±1}` that is unramified where
`r̄₀` is trivial on inertia, trivial on the decomposition groups at `T` (by (G2) at `ℓ`, and vanishing of the local classes at
`S_b`), and nonzero: Ribet's lemma, contradicting (G1). A combinatorial lemma on four indices concludes. In the
triangular case the diagonal characters are the flag characters in the order `(θ, Ψ, α, 1)` or `(α, 1, θ, Ψ)` (the order must
preserve the `λ`-weight, the flag characters reducing to those of `r₀` on the decomposition group); an entry against the
ordinary filtration would give a coboundary on every inertia group and at `ℓ`, hence a class in a rational Selmer group of
a character `ψ′χ_ℓ^{−e′}`, `e′ ≥ 1`, unramified and trivial at `ℓ`, which vanishes (BernoulliBoundsForClassGroupEigenspaces §6.17(b)). The second order
needs `θ̄ = ᾱχ̄_ℓ^e` on the decomposition group at `ℓ`, that is `Ψ̄` trivial there, because the character on each eigenline of
an inertia element is integral over the ring of the component through `r₀` and specializes to that of `r₀`. (unlinked) By
the same specialization the flag characters satisfy `|κ_i(g) − ps_i(g)| < 1` on the whole decomposition group, `ps_i` the
diagonal characters of `r₀`. If `κ_i = κ_jχ_ℓ` on `U`, evaluating on a power of an inertia element of infinite cyclotomic order
shows that the cyclotomic exponents of `i` and `j` differ by `1`, so `i, j` lie in different blocks; at `Frob_ℓ`, where `χ_ℓ = 1`,
this gives `ps̄_i(Frob_ℓ) = ps̄_j(Frob_ℓ)`, excluded by (G2). (tangent) `V_ℓ(ψ, e) = V_ℓ(ψ, e; S)` and a class of `Ш_{ψ,e}(S)` is
unramified everywhere and trivial at `T`, so its first-order lift satisfies the conditions of `𝒟_sp`, its local parts at `T` are
integral conjugates of `r₀|_{G_v}` and hence reductions of `O`-valued derivations of the local rings; the weight `(0, −1)` carries no
eliminated coordinate, and 3.18(a) makes the derivation the reduction of an `O`-valued point derivation of `R`. (irreducibility) For `K`: a self-twist `ρ ≅ ρ ⊗ φ`, `φ ≠ 1` trivial on `G_{K(μ_{ℓ^∞})}`, given by Clifford theory, is
unramified outside `S` (all four characters are), at the primes of `S` other than `ℓ` (their inertia lies in `G_{K(μ_{ℓ^∞})}`)
and at `ℓ` (for `s ∈ I_ℓ`, `det(φ(s)ρ(s) − 1) = det(ρ(s) − 1) = 0` because one ordinary character is trivial on inertia, and applied
to `s·s₀^{4n}` for an inertia element `s₀` of infinite cyclotomic order this forces `φ(s) = 1`); so `φ` is trivial. For `L`: if
`ρ|_H` is reducible with `G_ℚ/H` abelian, `ρ ≅ ρ ⊗ φ` with `φ ≠ 1` trivial on `H`, `φ⁴ = 1`; then `tr ρ(g₀h) = 0` for `h ∈ H` and `g₀`
with `φ(g₀) ≠ 1`, and linear independence of the four residual characters, distinct on `H`, gives a contradiction. Over
`L(μ_{ℓ^∞})` the self-twist `φ` factors through `χ_ℓ|_{G_L}`, so `φ²` is a quadratic self-twist through `ω`, trivial by the tower
condition, and then `φ` is one too, trivial likewise. Regular elements: the element with free ratios has separable
characteristic polynomial, and a coset argument in rank four, using the ratio of order `> 4`, moves it into every open
subset. Over `k[[t]]` the ratios of the ordinary characters on `I_ℓ ∩ ker χ_ℓ` are `1`-units of `k[[t]]`, a torsion-free group,
so the element exists. Free ratios at characteristic zero: the route of 3.20(f) applies to `ρ|_{G_L}` and the cuspidal
representation `π` of `GL₄(𝔸_L)` attached to it, with two changes. The cyclotomic exponents `m_i` of the ordinary characters `κ_i`
are distinct but need not differ by `2`, and unlinkedness excludes the monodromy instead. By the comparison with monodromy
(AutomorphicGaloisRepresentationsPartII AG2.6, *Full polarized local–global compatibility at `ℓ`*) the monodromy of `rec(π_v)` is
that of the Weil–Deligne representation of `ρ` at `ℓ`, which restriction to an open subgroup does not change. If it were nonzero,
two of the Weil–Deligne characters of the `κ_i` over `ℚ_ℓ` would differ by `|·|^{±1}`; the `ℓ`-adic valuations of their values at an
element of `ker χ_ℓ` lifting `Frob_ℓ` would make them those of `κ_i` and of `κ_jχ_ℓ^{±1}` with one cyclotomic exponent, so
`κ_i = κ_jχ_ℓ^{±1}` on the whole decomposition group (a character of given cyclotomic exponent is determined by its Weil–Deligne
character), which unlinkedness excludes. And `π` is polarized rather than conjugate self-dual: an
algebraic Hecke character twists it into a conjugate self-dual representation (AutomorphicGaloisRepresentationsPartII AG2.2,
*Twisting an essentially self-dual form into unitary type*), which multiplies the four eigenvalues at `s` by one number, before
AG2.5 gives temperedness. (∗) Over a totally real abelian field in which the residual
representation is trivial on inertia at `ℓ`, residual lattices of `GSp₄`-type form one space (3.19 over a tower datum). For the
given lift `ρ`, 3.20(c) gives, over the tower datum `T₀` of 3.20(a) (in Case II with the auxiliary real quadratic field `k₀`, using
that the order of `χ_P(ℓ, ψ)` is even; in Case III with the second imaginary quadratic field `K′ ≠ K`), the reduction `c` of a
lattice of `ρ` and the `ℓ`-extension `T₁`, and over every large layer `T` of the cyclotomic `ℤ_ℓ`-extension of `F_{T₁}` a seed (3.20(d))
and a finite chain of links through good residual lattices from `c|_{G_{F_T}}` to the residual lattice `t` of the seed, both ends
included (four links in Case III, three in Case II); by 3.20(b) the inequalities of 3.19(c) hold for large `m`. Over such a layer let `J` be an ideal as in 3.20(e): the sum of the
extensions to `B` of the Hecke ideals of HeckeIdealsAndTaylorWilesRelations §3.13a at two auxiliary places of different
residue characteristics, through the twist `κ`; `B/J` is finite over `Λ` by (fin), and (P1₄) holds. By (seed) the minimal primes of
`R_t` below the kernel of the seed, which are irreducible components of `Spec R_t` through it, lie in `V(J)`. As `t` is good, 3.19(c)
puts every component of `Spec R_t`, hence every component of `Spec A` through `t`, in `V(J)` ("some" gives "all"); then along the
chain, alternately, 3.19(d) gives some component through the next lattice in `V(J)` ("all" gives "some") and 3.19(c) at that lattice,
which is good, gives all of them. So every component through `c` lies in `V(J)`, and the restriction of `ρ` to `G_{F_T}`, a point of
`Spec A` through `c`, is a point of `V(J)`. No patching at block primes is used in rank four. Weak purity is 3.20(e)(pur). (a) (∗)
covers irreducible points and nonsplit block points in which `⟨e₂, e₄⟩` is stable; every other block point `ρ` with irreducible blocks,
split or not, is replaced by `(1 + z)ρ^{ss}`, `z` the cocycle of (a′) below (its count holds over any coefficient field), a nonsplit
block point of that orientation with the same characteristic polynomials and ordinary characters. So a point of block or irreducible type in the
weight-zero fibre in characteristic `ℓ` would give a pro-modular point, a point of `V(J)` killing the inertial characters, which
3.20(e)(fin) excludes for a positive-dimensional family; a point of triangular type there has constant diagonal. (a′) A block point
`ρ` with irreducible block on `⟨e₁, e₃⟩` is of the kind (∗) covers only when it is nonsplit with `⟨e₂, e₄⟩` stable; but in every case
`(1 + z)ρ^{ss}`, for a nonzero Selmer cocycle `z` of `ρ^{ss}` with values in the part of the unipotent radical of the block parabolic of
negative `λ`-weight, is a point of `𝒟_sp`, nonsplit block triangular with `⟨e₂, e₄⟩` stable and the same characteristic polynomials,
pro-modular by (∗) and so weakly pure. The
cocycle `z` exists by the Greenberg–Wiles formula: the radical carries the three characters `α⁻¹, β, θ⁻¹`, complex conjugation has
no invariants there, and the ordinary condition at `ℓ` admits the positive root `β`, so the Selmer group exceeds its dual by at
least one dimension ((G1) concerns classes trivial at `ℓ` and does not apply). The determinants of the two blocks are, on an
open subgroup, `χ_ℓ^{e+2}` and `χ_ℓ^e` (the inertial characters at `ℓ` and unramifiedness elsewhere), so at a Frobenius of norm `Q`
there `|det_{⟨e₁,e₃⟩}| = Q²|det_{⟨e₂,e₄⟩}|`, which weak purity excludes. (b) An irreducible point is pro-modular (∗) and irreducible on
`G_L` for the tower field `L = L_T` of its pro-modularity ((irreducibility)), so 3.20(e)(aut) gives (b), with the isomorphism `ι`
of 3.20(e)(pur). *Needs:* 0.4, 3.3, 3.4, 3.6, 3.17–3.20;
BernoulliBoundsForClassGroupEigenspaces §6.17; ArithmeticGaloisDuality R02.5.1; LocalGaloisDeformationRings §§1.7, 1.9;
AutomorphicGaloisRepresentationsPartII AG2.2, AG2.5, AG2.6; ModularityAndLanglandsExtensions §2.43.

**Checks.**

- The pattern on `R` has total excess `2`, so ReducibilityIdealsAndUltrafilterPatching §4.9 does not apply to `R` graded by one
  cocharacter (3.3, third Check); on `A` it has total excess `1`.
- The invariant ring is smooth because exactly one chart coordinate has `λ`-weight `−1`: with `λ`-weights `(1, 1, −1, −1)` the
  invariants of four coordinates form a quadric cone.
- No exception is made for quadratic `Ψ̄`: (irreducibility) places conditions on the tower field only, never on the point,
  so points induced from a quadratic field satisfy it.

### 4.5 The Eisenstein component relative to the Gaussian field

*Setting.* `ℓ` odd, `e ≥ 1`, `N` even, `ψ` a Dirichlet character modulo `N` with `ψ(−1) = (−1)^e`, `O` the ring of integers of any
finite extension `Φ` of `ℚ_ℓ` containing the values of `ψ` (lengths normalized by `e_O`), `η₄` the character of `ℚ(i)`;
`ψ = ψ^{[ℓ′]}ψ_{[ℓ]}` (0.2); `S_b` the primes `p ≠ ℓ` at which `ψ_{[ℓ]}` is ramified; `T_b = {ℓ} ∪ S_b`. Assume (*host data*): there
is `o₁ ≥ 1` such that every odd primary component of `ψ^{[ℓ′]}` has order dividing `2o₁`; `c₂(ψ) ≥ 4`; `8o₁v² < 2^{c₂(ψ)}` for every
`v ∈ T_b`; and (*Bernoulli threshold*) there is an integer `q₀ ≥ 1` divisible by the conductor of `ψ₁²`, `ψ₁` being the
prime-to-`ℓ` part of `ψ` with its component at `2` removed, such that `2ℓ·q₀·4^{n₀} ≤ 2^{c₂(ψ)}`, where `n₀ = v₂(ℓ^{f₀} − 1)` and `f₀`
is the order of `ℓ` modulo `lcm(4, o(ψ₁))`, `o(ψ₁)` the order of `ψ₁` (this gives the hypothesis of 3.5 for the reduction of
`Ψ⁻²η₄`, with `d = f₀`, `k = n₀` and `m = c₂(ψ) − 1`: the odd-conductor part of the prime-to-`ℓ` part of `ψ^{−2}ω^{−2e}` has order
dividing `ℓ^{f₀} − 1` and conductor dividing `ℓq₀`). In the host setting these hold for `ψ ∈ X(E, e)`, `e ≥ 1`, with
`R₁(ℓ, χ) ≤ 2^{c₂(ψ)}`, `o₁ = o_χ` and `q₀ = f_χ`: `2ℓf_χ·4^{n₀} ≤ R₁(ℓ, χ)`.

*The problem `𝒟_G = 𝒟_G(ψ, e)`:* `𝒢₃`-valued lifts of `Ψ̄ ⊕ 1 ⊕ Ψ̄⁻¹` (`Ψ = χ_ℓ^eψ`) with multiplier `η₄`, normalized at complex
conjugation and at a marked element `g₁` (`η₄(g₁) = 1`, `Ψ̄(g₁)² ≠ 1`); at `ℓ` ordinary (upper triangular after conjugation by an
element `≡ 1`) with inertial characters exactly `Ψ, 1, Ψ⁻¹` on `I_ℓ ∩ G_{ℚ(i)}`; at `p ∈ S_b` diagonal after such a conjugation,
with the same inertial characters; at every other prime trivial on `I_p ∩ G_{ℚ(i)} ∩ ker Ψ̄`.

*Prove:* (local chart) the framed ring of the condition of `𝒟_G` at `ℓ` is a power series ring over `O` in `1, 2, 3, 4, 2` variables
of weights `−2, …, 2`, and that at each `p ∈ S_b` is a power series ring over `O` in `1, 2, 3, 2, 1` variables of these weights; in
particular both are smooth at the diagonal lift (in the sense of 3.18); (model) (theorems of [FormalProof] whose route is not given
here) for `𝒟_G`, in six clauses, the host data giving 3.21(a)–(e): (m1) under 3.21(a), the group satisfying `Φ_ℓ`, the functor of
normalized lifts of type `𝒟_G` to complete local noetherian `O`-algebras with residue field `k` is represented by such an algebra
`S`, with universal lift `r^{univ}`; (m2) under 3.21(a), `S` has a weighted presentation `O[[z₁, …, z_M]] → S` in which every
`z_i` is a matrix entry of `r^{univ}(g) − r₀(g)` for some `g ∈ G_{ℚ(i)}`, of the weight of that entry, the image of the series
homogeneous of weight `j` is the weight-`j` part of `S`, and every element of the kernel has all its linear coefficients in the maximal ideal of
`O`; (m3) under 3.21(a), (b), (c), in every presentation as in (m2) the number of variables of weight `j` is at least
`dim H¹_𝓛(ad_j)`, for every `j`; (m4) under 3.21(a), (b), (c), the kernel of a presentation as in (m2) is generated by
`dim Ob(ad_j)` series homogeneous of weight `j`, `j ∈ ℤ`; (m5) for any homomorphism `u` from a group to `𝒢₃(R)`, `R` an
`O`-algebra, let `R^{gr} ⊆ R` be the `O`-subalgebra generated by the elements homogeneous for the torus action; it contains the
matrix entries of `u`, and for every `O`-algebra `K` and every `O`-algebra homomorphism `ξ : R^{gr} → K` there is a unique
homomorphism to `𝒢₃(K)` with the same image as `u` in the group of components `{±1}` of `𝒢₃` and matrix entries the images under
`ξ` of those of `u`; (m6) under 3.21(a), (b), (d), a `ℚ̄_ℓ`-valued representation that is conjugate by a torus element to a point
of `𝒟_G` over a discrete valuation ring finite over `O`, and is neither upper nor lower triangular, is of type I; here
`H¹_𝓛(ad_j)` is the group of cocycles with the local conditions of `𝒟_G` (3.21(c)) modulo coboundaries and `Ob(ad_j)` the second
cohomology of the Selmer complex of those conditions; by 3.21(c), `dim H¹_𝓛(ad_j) − dim Ob(ad_j) = 0, −1, 0, +1, +1` for
`j = −2, …, 2` and `0` for the other `j`; (i) and (ii) of 4.3 for `𝒟_G`, theorems of [FormalProof] whose route is not given here:
(i) under 3.21(a), (e): a point of `𝒟_G` with values in a noetherian local domain over `O` that is upper or lower triangular has
the diagonal entries of the diagonal point; (ii) a continuous cocycle of `ad r₀` over `O` of weight `j ≤ 0` that vanishes on
`I_p ∩ G_{ℚ(i)} ∩ ker Ψ̄` for `p ∉ T_b`, vanishes on inertia at `T_b` if `j = 0`, and is a coboundary of a matrix of weight `j` on
the decomposition group at `ℓ` inside `G_{ℚ(i)}` if `j < 0`, becomes a coboundary after multiplication by a nonzero element of
`O`; (strong irreducibility) every type I point is irreducible on every open subgroup of `G_{ℚ(i)}` and of
`G_{ℚ(i, μ_{ℓ^∞})}`; and, for a suitable `g₁`:

(a) every lift of type `𝒟_G` to a complete discrete valuation ring of characteristic `ℓ` has, on a subgroup of finite index,
the characteristic polynomials of `r̄`; consequently the image of `A₀` in `A/I` is finite over `O`;

(b) every point of `𝒟_G` with values in the integers of a finite extension of `Φ` that is irreducible on every open subgroup
of `G_{ℚ(i)}`, in particular every type I point, is automorphic in the sense of HeckeIdealsAndTaylorWilesRelations §3.13a(f):
`ρ|_{G_{ℚ(i)}} ⊗ χ_ℓ⁻¹` is attached to a regular algebraic conjugate self-dual cuspidal representation of `GL₃(𝔸_{ℚ(i)})`, with the
clauses (w1), (w2) there, and every type I point is unlinked at `ℓ` (so is every point, by the route; the statement of
[FormalProof] is for type I points);

(c) `H¹_f(ℚ, ad r) = 0` at every type I point, and at every two-signed point any two `Ē`-valued point derivations of `A/I`
are proportional (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/HostNumberS.lean`
(`UpperTheory.V.UnitaryThreeInertia.HostRigid_s`));

(d) `𝒟_G` has no two-signed point of type II.

The routes of (a), (b) and (c) use, through the route of 4.2, HeckeIdealsAndTaylorWilesRelations §4.2a, 3.15(c) (K1′), (K2′) and the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d), and the route of (c) also uses (model) and (i), (ii) of 4.3 for `𝒟_G`; the routes of these statements are not given in full (see there). The clauses (w1), (w2) in (b) are a theorem of [FormalProof] whose route is not given here.

[FormalProof] states (model) for an abstract rank-three frame, which the host data provide
(`UpperTheory.V.UnitaryThreeInertia.IsHostFrame`, `AV/UnitaryThreeDeformations/IsHostFrame.lean`): the universal ring (m1) as
`UpperTheory.V.UnitaryThreeInertia.exists_isUniv` (`AV/UnitaryThreeDeformations/ExistsIsUniv.lean`), the presentation ((m2)–(m4))
as `UpperTheory.V.UnitaryThreeInertia.exists_adapted` (`AV/UnitaryThreeDeformations/WPresEx.lean`), with
`UpperTheory.V.UnitaryThreeInertia.Frame.Adapted` and `UpperTheory.V.UnitaryThreeInertia.Frame.Minimal`
(`AV/UnitaryThreeDeformations/IsCharZeroPt.lean`),
`UpperTheory.V.UnitaryThreeInertia.exists_relations` (`AV/UnitaryThreeDeformations/ExistsRelations.lean`) and
`UpperTheory.V.UnitaryThreeInertia.finrank_H1L_le` (`AV/UnitaryThreeDeformations/CommAlgFunctorCoboundaryZeroMemCocyclesOne.lean`),
the points (m5) as `UpperTheory.V.UnitaryThreeInertia.existsUnique_isPtHom`
(`AV/UnitaryThreeDeformations/ExistsUniqueIsPtHom.lean`),
with the ring `UpperTheory.V.UnitaryThreeInertia.Sring` (`AV/UnitaryThreeDeformations/IsCharZeroPt.lean`), and the shape (m6) as
`UpperTheory.V.UnitaryThreeInertia.typeI_of_twoSigned` (`AV/UnitaryThreeDeformations/TypeIOfTwoSigned.lean`: a point in
characteristic `0` that is neither upper nor lower triangular is of type I); `UpperTheory.V.UnitaryThreeInertia.abstract_count`
(`AV/UnitaryThreeDeformations/AbstractCount.lean`), which takes 3.3 and 3.4 (`UpperTheory.V.Alg.LemmaM`, `UpperTheory.V.Alg.LemmaM'`)
as hypotheses, applies them to this presentation, and (tangent) is not a separate statement of it. It states (i) of 4.3
for `𝒟_G` as `UpperTheory.V.UnitaryThreeInertia.diag_eq_of_tri` (`AV/UnitaryThreeDeformations/DiagEq.lean`: a point that is upper or
lower triangular has the diagonal entries of the diagonal point), for a frame with its class-number clause, which the host frames
have (`UpperTheory.V.UnitaryThreeInertia.frame_class_one`, `AV/UnitaryThreeDeformations/FrameClassOne.lean`); and (ii) as
`UpperTheory.V.UnitaryThreeInertia.HostVanE` (`AV/UnitaryThreeDeformations/HostNumber.lean`), the condition
`UpperTheory.V.UnitaryThreeInertia.Frame.VanE` (`AV/UnitaryThreeDeformations/IsCharZeroPt.lean`) for the host frames, proved as
`UpperTheory.V.X.So.hostVanE` (`AV/LevelCohomology/SoHostVanE.lean`), in the form: a continuous cocycle of
weight `≤ 0` with the local conditions of `𝒟_G`, multiplied by a nonzero element of `O`, is a coboundary. It states (a) and (b)
as `UpperTheory.V.Aut.ThmS6_s` (`DTC/ThmS6CoreS.lean`), (b) for the type I points, with the automorphy
`UpperTheory.V.Af.AutOnAlt` (`DTC/AfBridge.lean`) of `ρ|_{G_{ℚ(i)}} ⊗ χ_ℓ⁻¹`: attachment with the clauses (w1), (w2).

*Route.* 3.21 turns the host data into the conditions used: the elements `x_v` of the decomposition groups of `T_b` with
`η₄(x_v) = ω(x_v) = 1` and `Ψ̄(x_v)² ≠ 1`, which replace "`Ψ̄²` nontrivial on inertia at `ℓ`" of 4.2 (the three characters are separated
on each decomposition group of `T_b` by Frobenius rather than on inertia); the local vanishing, the count, the vanishing in
weight `−2`, the class number of `ℚ(i)`, and general position. The diagonal point satisfies every local condition because `Ψ` is
trivial on `I_p ∩ ker Ψ̄` outside `T_b` (3.21(a)). (local chart) By 3.21(a) the flag of a lift at `v ∈ T_b` is unique (at `x_v` the
three characters stay distinct), so the conditions of `𝒟_G` there are closed conditions; by 3.21(b) (`H²(G_{ℚ_v}, ad_j) = 0` for `j ≠ 0`,
`v ∈ T_b`, and `H¹(G_{ℚ_v}, ad_j) = 0` at `S_b`) triangular lifts at `ℓ`, resp. diagonal lifts at `S_b`, with the fixed inertial
characters lift along every small extension over `O`, the weight-`0` part being unramified twists. So both rings are power series
rings over `O`, with coordinates counted by the first-order lifts: at `ℓ`, the `dim ad_j` coboundaries in weight `j < 0`, three
directions in weight `0` and the `2·dim ad_j` cocycles in weight `j > 0` (`1, 2, 3, 4, 2`); at `p ∈ S_b`, the coboundaries in weight
`j ≠ 0` and three directions in weight `0` (`1, 2, 3, 2, 1`, total `dim ad`). In weight `0`, `ad₀ ≅ 1 ⊕ η₄ ⊕ η₄` on the decomposition
group, and the three directions are the unramified cocycles: three unramified homomorphisms where `η₄` is trivial on it (the
prime splits in `ℚ(i)`), one unramified homomorphism and two coboundaries where it is not.
(model) *Outline.* The normalization and the local conditions are part of the functor, so its tangent space in weight `j` is
`H¹_𝓛(ad_j)` and its obstructions lie in `Ob(ad_j)`; a minimal presentation by matrix entries has at least `dim H¹_𝓛(ad_j)`
variables and exactly `dim Ob(ad_j)` relations of weight `j` (the local vanishing 3.21(b) makes the local conditions liftable), and
3.21(c) is the count. This is not the cover of 3.18: no normalization or frame equation is added. (In the framed bookkeeping of
3.18 the same numbers come out only after the eight normalization equations and the frame equations at `S_b` are counted,
fourth Check of 3.18.) (m1) representability of a functor cut out by closed conditions (3.6); (m2) generators among the
weighted matrix entries (3.18); (m5), (m6) as (points), (shape) of 4.1, (m6) with 3.21(d) as in the route of (d).
(i), (ii) of 4.3 for `𝒟_G` *Outline:* as in 4.3, with `x_ℓ` separating
the three characters at `ℓ` and the class number of `ℚ(i)` (3.21(e)). (strong irreducibility) as in
4.1, with `x_ℓ` in place of the inertia element `x`: the lines are preserved by the decomposition group at `ℓ`, and
`Ψ̄(g)Ψ̄(x_ℓ)ⁿ + 1 + (Ψ̄(g)Ψ̄(x_ℓ)ⁿ)⁻¹ = 0` for `n = 0, 1, 2` forces `Ψ̄(x_ℓ) = 1`, also for `ℓ = 3`, where `w² + w + 1 = (w − 1)²`. (a), (b)
The datum `(ℚ(i), Ψ, ℓN, H)` is in general position (3.21(f)); 3.14 gives the frame over an abelian CM field `L ⊇ ℚ(i)`, and the
route of 4.2, steps (2)–(7), applies without change, in both ranks: the rank-two run over `L`, with the twist of 3.23 for
`K = ℚ(i)` (which exists for every odd `ℓ`) and a rank-two seed (3.22(c), `K = ℚ(i)`), supplies (H₂) of 3.12 for the rank-three run; only the descent of
step (8) loses its rank-two clause, because the statement over `ℚ(i)` says nothing about type II points. The Hecke side is
HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a over `L`, and the descent from `L` to `ℚ(i)` uses the
irreducibility of `ρ|_{G_L}`, which holds at points irreducible on every open subgroup of `G_{ℚ(i)}`. Two ordinary characters in ratio
`χ_ℓ` on the decomposition group would agree residually at `x_ℓ`, so every point is unlinked. (c) HeckeIdealsAndTaylorWilesRelations
§9.9(a) with `F = ℚ(i)`, by (strong irreducibility) and (b); proportionality as in 4.3(iv). (d) A point that is neither upper nor
lower triangular on `G_{ℚ(i)}` and of type II has a corner `W` with `W̄^{ss} = Ψ̄ ⊕ Ψ̄⁻¹`; a lattice with nonsplit reduction gives a
nonzero class of `H¹_𝓛(ad_{−2})`, with the local conditions of `𝒟_G` by 3.21(b), which vanishes by 3.21(d); so every two-signed
point is of type I. *Needs:* 0.2, 3.6, 3.11–3.18, 3.21–3.23, 4.1–4.3; ReducibilityIdealsAndUltrafilterPatching §6.12;
PotentialAutomorphyInfrastructurePartII §0.9 and HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a, 9.9.

### 4.6 Shapes of the two-signed points

Prove: (a) in 4.2, every two-signed point of `𝒟(ψ, e, K)` is of type I, irreducible on every open subgroup of `G_K` and of
`G_{K(μ_{ℓ^∞})}`, or of type II with `W` irreducible on every open subgroup of `G_K` and of `G_{K(μ_{ℓ^∞})}`; (b) in 4.5, every
two-signed point of `𝒟_G` is of type I and irreducible on every open subgroup of `G_{ℚ(i)}` and of `G_{ℚ(i, μ_{ℓ^∞})}`; (c) in 4.4,
every two-signed point of `A/(F, E, Z)` comes from a point of `R^{gr}/(F, E, Z)` whose representation, after scaling by the torus, is
an irreducible point of `𝒟_sp` ([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/TwoIrr.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.twoIrr`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/IrrIff.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.irrIff`)); two-signed points whose representations are conjugate lie in one
`𝔾_m`-orbit (so the orbits of
two-signed points map injectively to the conjugacy classes of irreducible points of `𝒟_sp`; it is not asserted that every
irreducible point of `𝒟_sp` arises); and these representations are irreducible on `G_{K(μ_{ℓ^∞})}` for every abelian `K` unramified at the primes of `S` other than
`ℓ`; and for every point `x₁ ≠ x` of `A/(F, E, Z)` that is both negative-zero and positive-zero, the points of `A/(F, E, Z)` with
the same restriction to `A₀` are all negative-zero or all positive-zero, and they can be of both kinds over different
points of `Spec A₀` only if `Ψ̄` is trivial on the decomposition group at `ℓ`.
In [FormalProof] the irreducibility clauses of (a) and (b) are these: in (a), a type I point is irreducible on every open
subgroup of `G_K`, and at a type II point `W` is irreducible on `G_K` and on `G_{K(μ_{ℓ^∞})}` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/CurveDVRSpecialization/MatIrrOpenGd.lean`
(`UpperTheory.V.Pr.matIrr_open_gd`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ExistsUnitPowNe.lean`
(`UpperTheory.V.U3.typeII_irr_cyc`)); in (b), every two-signed point is of type I, irreducible on every open subgroup of
`G_{ℚ(i)}` and on `G_{ℚ(i, μ_{ℓ^∞})}` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/TypeIOfTwoSigned.lean`
(`UpperTheory.V.UnitaryThreeInertia.typeI_of_twoSigned`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/IrrOpen.lean`
(`UpperTheory.V.UnitaryThreeInertia.matIrr_open`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/IrrCyc.lean`
(`UpperTheory.V.UnitaryThreeInertia.matIrr_cyc`)). The clauses on the open subgroups of `G_{K(μ_{ℓ^∞})}` and of
`G_{ℚ(i, μ_{ℓ^∞})}`, on `G_{K(μ_{ℓ^∞})}` for the type I points of (a), and on the open subgroups of `G_K` for `W`, are the
roadmap's own, by the route of 4.1 (strong irreducibility).
The route of (c) uses, through 4.4(a′) and 4.4 (points), 3.20(d), (e), ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16 through 3.19(a), and HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d), whose routes are not given in full (see there).

*Route.* (a) 4.1 (shape) and (strong irreducibility). (b) 4.5(d) and (strong irreducibility). (c) Scale the point to a point
of `𝒟_sp` (4.4 (points)) and apply the trichotomy: a triangular point kills every element of `A` of negative degree or every
element of positive degree, these being combinations of monomials of total weight `(0, n)` in the entries, so it is not
two-signed; for a block point the limit under `λ` is a block point whose block on `⟨e₁, e₃⟩` has both off-diagonal entries
nonzero, hence is irreducible, excluded by 4.4(a′). Conjugate irreducible points give one orbit (4.4 (points)). Irreducibility over `K(μ_{ℓ^∞})` is 4.4 (irreducibility). Second clause: such an `x₁` comes from a point that is
not irreducible and has the entry `(1, 3)` zero, hence is triangular; all points with the same restriction to `A₀` have the
same diagonal entries and are triangular; by 4.4 (points) they are all negative-zero if the inertial character of the
entry `(1, 1)` at `ℓ` is `θ` and all positive-zero if it is `α`, `θ ≠ α` on inertia, and the second kind needs `Ψ̄` trivial on
the decomposition group at `ℓ`. *Needs:* 4.1, 4.4, 4.5.

**Checks.**

- The disjunction is needed: when `(ℓ − 1) | e`, `ψ` is unramified at `ℓ` and `ψ̄(Frob_ℓ) = 1`, the point `{ψ, χ_ℓ^e}·{α, 1}` is a second
  diagonal point with the same reduction, multiplier `θ` and inertial characters `(α, 1, θ, Ψ)` at `ℓ`, on the component through
  `r₀`; without `ψ̄(Frob_ℓ) = 1` it is not a point of `𝒟_sp`.

### 4.7 Rigidity on the symplectic component

In 4.4, prove: (i) `H¹_f(ℚ, 𝔰𝔭₄(ρ)) = 0` at every irreducible point `ρ` of `𝒟_sp` with values in `ℚ̄_ℓ`, `𝔰𝔭₄(ρ)` the adjoint
representation of `Sp₄` composed with `ρ`; (ii) every first-order deformation of `ρ` that is a point of `𝒟_sp` over `Ē[ε]` is
`ρ + ε(Xρ − ρX)` with `X ∈ 𝔰𝔭₄(Ē)`; (iii) at every two-signed point of `A/(F, E, Z)`, any two `Ē`-valued point derivations of `A`
killing `(F, E, Z)` are proportional ((ii), (iii) follow from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/RigEnd3.lean`
(`UpperTheory.V.Th.RigiditySymplecticFour`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/DecompSigmaOrd.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.Raw.RigidAt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/RigidDiag.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.rigidDiag`)); (iv) (*the clauses (w1), (w2) under twist and restriction*) let `K` be
a CM field and `r : G_K → GL_n(ℚ̄_ℓ)`, `n ≥ 1`, a continuous representation satisfying the clauses (w1), (w2) of HeckeIdealsAndTaylorWilesRelations
§3.13a(f); then `r ⊗ μ` satisfies them for every continuous character `μ` of `G_K` attached through `ι` to an algebraic Hecke
character; and if `r` is attached to a regular algebraic cuspidal representation of `GL_n(𝔸_K)`, is polarized
(`ᵗr(g)Pr(cgc⁻¹) = μ₀(g)P` for a complex conjugation `c`, an invertible matrix `P` and an algebraic character `μ₀` of `G_{F₀}`, `F₀ ⊂ K` totally
real, taking one value at all complex conjugations) and has a full flag at every place above `ℓ`, then `r|_{G_L}` satisfies them
for every CM field `L ⊃ K`, Galois over `K` with soluble group, such that `r|_{G_L}` is irreducible. (iv) is a theorem of
[FormalProof] whose route is not given here: `UpperTheory.V.Z.Win.Dn.twist'_alt` and
`UpperTheory.V.Z.Win.Dn.automorphy_up_base_change` (`DTC/EndsRankThreeOfLocal.lean`). The route of (i) uses HeckeIdealsAndTaylorWilesRelations §9.9(d) (4.4(b) gives the clauses (w1), (w2) of its hypothesis of automorphy over the imaginary quadratic field of the tower datum, and (iv) passes them to the twist over the tower field), and the routes of (i)–(iii) use, through 4.4(∗), (a), (b) and 4.6(c), 3.20(d), (e), ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16 (through 3.19(a)) and HeckeIdealsAndTaylorWilesRelations §4.2a; the routes of these statements and of (iv) are not given in full (see there).

*Route.* (i) `ρ` is automorphic over every imaginary quadratic field over which it stays irreducible (4.4(b)). If `ρ`
is irreducible on every open subgroup of `G_ℚ`, it is so on every open subgroup of `G_{ℚ(μ_{ℓ^∞})}` (the derived-group argument of
4.1), and HeckeIdealsAndTaylorWilesRelations §9.9(b) applies over an imaginary quadratic field unramified at the primes of
`S`. Otherwise apply §9.9(d) over the tower field `L = L_T` of the pro-modularity of `ρ` (4.4 (∗), 3.20(c)), with `n = 4`, to
`ρ|_{G_L} ⊗ κ` for the character `κ` of 3.20(e), with `κκ^c = θ⁻¹χ_ℓ⁻³|_{G_L}` (PotentialAutomorphyInfrastructurePartII §0.8; the twist
does not change `ad r`). Its hypotheses: `L` is CM, `L/L⁺` is unramified at the finite places, `μ_ℓ ⊄ L`, and the places above `ℓ`
and those of `S` split in `L` (definition of tower fields); `ρ` and `κ` are unramified outside `S`, and `ρ ⊗ κ` is trivial on the
inertia elements at the places of `S` prime to `ℓ` at which its residual characters are trivial (such an element is killed by `κ̄`
and by `r̄₀`, hence by `ρ`, by the conditions of `𝒟_sp`, `ψ` having order prime to `ℓ` on `G_{F_T}` by 3.20(b), and by `κ`, of order
prime to `ℓ` on inertia away from `ℓ`); the auxiliary place `v₀`, of prime norm, is given by the condition on `ω` in the
definition of tower fields; `ρ|_{G_L}` is attached to a regular algebraic cuspidal representation (4.4(b) over the imaginary
quadratic field `K` of the tower datum, on which `ρ` is irreducible, and soluble base change from `K` to `L`,
PotentialAutomorphyInfrastructurePartII §0.9; automorphy in the sense of HeckeIdealsAndTaylorWilesRelations §3.13a(f), which
HeckeIdealsAndTaylorWilesRelations §9.9(d) asks, includes the clauses (w1), (w2), which 4.4(b) gives for `ρ|_{G_K}`; by (iv) they
pass to `ρ|_{G_L}`, as `L/K` is abelian, `ρ|_{G_K}` is polarized by the multiplier `θ` with `P = Jρ(c)`, `J` the matrix of the
symplectic form, and is ordinary at the places above `ℓ`, and `ρ|_{G_L}` is irreducible, and then to `ρ|_{G_L} ⊗ κ`, `κ` being
locally algebraic at the places above `ℓ`, hence attached to an algebraic Hecke character), ordinary with the
distinct cyclotomic exponents `e + 1, e, 1, 0`, with residual representation a sum of four pairwise distinct characters,
absolutely irreducible on `G_{L(μ_{ℓ^∞})}`, with an element of free ratios in a decomposition group above `ℓ` (free ratios at
characteristic zero) and hence regular elements in every nonempty open subset of `G_{L(μ_{ℓ^∞})}` (4.4 (irreducibility)). So `H¹_f(L⁺, ad r) = 0` for the `𝒢₄`-adjoint representation `ad r` of `G_{L⁺}`. `𝔰𝔭₄(ρ)|_{G_{L⁺}}` is the direct summand of `ad r` on which complex conjugation acts through `ρ`, and
restriction from `ℚ` to `L⁺` is injective on `H¹_f` with coefficients in a field of characteristic zero; so `H¹_f(ℚ, 𝔰𝔭₄(ρ)) = 0`.
(ii) The cocycle `g ↦ ρ′(g)_ε ρ(g)⁻¹` of a first-order deformation `ρ′` that is a point has values in `𝔰𝔭₄`; it is a coboundary on every
inertia group away from `ℓ` (the deformation is trivial on an open subgroup of it, by the conditions of `𝒟_sp`, and one averages
over the finite quotient); at `ℓ` the deformation has a flag over `Ē[ε]` with characters equal to `χ_ℓ^{w_i}` on the inertia of an
open subgroup `U` (3.17(b) over the local ring `Ē[ε]`, the characters being distinct at an inertia element of infinite cyclotomic
order), `w` strictly decreasing, and with `κ_i ≠ κ_jχ_ℓ` somewhere on `U` (4.4 (unlinked)), so it is potentially crystalline and its
class lies in the local Bloch–Kato subspace (PotentialAutomorphyInfrastructurePartII §9.8, with §9.2 at the generic point
`ρ|_{G_{ℚ_ℓ}}`, generic because unlinked). So the class lies in `H¹_f(ℚ, 𝔰𝔭₄(ρ))`, which vanishes by (i). (iii) Let `δ` be a point
derivation of `A` at a two-signed point killing `(F, E, Z)`. The point comes from an irreducible point (4.6(c)), which has entries
`u`, `v` of weights `(1, 0)`, `(−1, 0)` with
`uv ≠ 0` at the point; `uv` is the image of an element of `A₀`, invertible at the point. On the slice `u = 1` the graded ring is
`A` with `u^{±1}` adjoined, so `x + εδ` extends uniquely to a dual-number point of the `ℤ²`-graded ring
(the stabilizer is trivial because the `λ`-weights are `±1`). After scaling by a torus element its underlying point is a point
of `𝒟_sp` congruent to `r₀`, and since the weight-zero ring of the fibre is finite over `O` (4.4(a)), the dual-number point
extends to the completion: a first-order deformation of the point that is again a point. By (ii) it is `ρ + ε(Xρ − ρX)`; the
normalization forces `X` into the Lie algebra of the torus (the block condition at one marked element kills the odd-root
directions, the normalized entries at the other kill the `±Ψ` directions), and on `A_n` only its `μ`-component acts:
`δ(f) = b·n·x(f)`. *Needs:* 3.17, 3.20, 4.1, 4.4, 4.6; PotentialAutomorphyInfrastructurePartII §§0.8, 0.9, 9.1–9.3, 9.8 and HeckeIdealsAndTaylorWilesRelations §9.9;
AutomorphicGaloisRepresentationsPartII AG2.2.

### 4.8 Levels of the automorphic points

For a number field `F`, a continuous `r : G_F → GL_n(ℚ̄_ℓ)`, integers `m_1 > ⋯ > m_n` and `M ≥ 1`, say that `r` has *Galois level `M`
and cyclotomic exponents `m`* if at every place `w ∤ ℓ` the restriction to inertia is conjugate to a sum of `n` characters of `G_F`
trivial on `G_{F(μ_M)}` (so `r(I_w)` is finite), and at every `w | ℓ` there is a full flag stable under the decomposition group with
characters `κ_i`, `κ_i|_{I_w} = χ_ℓ^{m_i}χ_i` with `χ_i` trivial on `G_{F(μ_M)}`; and that it is *unlinked at `ℓ`* if moreover
`κ_i ≠ κ_jχ_ℓ` on the decomposition group for all `i, j`. The *weight of `m`* is the weight `a` of AutomorphicGaloisRepresentationsPartII
AG2.0 with labelled weights `a_{τ,i} + n − i = −m_{n+1−i}` at every embedding `τ` (the Hodge–Tate weights `−m_i`); twisting `r` by `χ_ℓ^k`
replaces `m` by `m + k` and `a` by `a − k` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/LocIsotypic.lean` (`UpperTheory.V.Af.FlagAt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/AutomorphicForms/IsoOfFrob.lean` (`UpperTheory.V.Af.infOf`)). Prove:

(0) (*level theorem*) for `F` CM, `ℓ` odd and `r` attached to a regular algebraic polarized cuspidal `π` of `GL_n(𝔸_F)` (conjugate
self-dual up to a twist, as in AutomorphicGaloisRepresentationsPartII AG2.6): if `r` has Galois level `M` and cyclotomic exponents
`m`, and either `ℓ | M` or `r` is unlinked at `ℓ`, then `π^{K(M)} ≠ 0` for the principal congruence subgroup
`K(M) = ker(GL_n(𝒪̂_F) → GL_n(𝒪̂_F/M))`, and `π` has the weight of `m` (this follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevDefs.lean`
(`UpperTheory.V.Lev.FixedSsAlt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/LevFixed.lean`
(`UpperTheory.V.Lev.fixedSs_of_prints`), whose level statement is local at the
places above `ℓ`; the clause on the weight is not part of it: that clause is the roadmap's own, by the route below);

(a) in 4.2, every type I point has Galois level `N` and cyclotomic exponents `(e, 0, −e)` over `K` and is unlinked (4.2(d)), so
`π^{K(N)} ≠ 0`, with `N` independent of `ℓ` (`ℓ | N` is allowed); at every type II point `W` has Galois level `N|d_K|` and exponents
`(e, −e)` over `ℚ` and is unlinked, and the cuspidal representation of `GL₂(𝔸_ℚ)` attached to `W ⊗ χ_ℓ^{−e}` has a nonzero vector
fixed by the principal congruence subgroup of level `N|d_K|` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/NumberU3US.lean`
(`UpperTheory.V.Z.J.Adm3U_s`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AfStmt.lean`
(`UpperTheory.V.Af.Adm3Alt`), `Development/AutomorphicArithmetic/AutomorphicVarieties/TheoremsMuLinked/AutP.lean`
(`UpperTheory.V.Th.Unl`));

(b) in 4.5, every type I point has Galois level `N` over `ℚ(i)` and is unlinked, so `π^{K(N)} ≠ 0` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/LevelAt.lean`
(`UpperTheory.V.UnitaryThreeInertia.levelAt_of_pt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeDeformations/LevelAway.lean`
(`UpperTheory.V.UnitaryThreeInertia.levelAway_of_pt`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/EHostUnl.lean`
(`UpperTheory.V.Z.J.hostUnlE_alt`));

(c) in 4.4, every point has Galois level `M = ℓ·2^m·N·p₁(χ)` and cyclotomic exponents `(e + 1, e, 1, 0)`, and `ℓ | M`
([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/DirGPowOne.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.levOf`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/AfStmt.lean`
(`UpperTheory.V.Af.AdmRAlt`); the points
are also unlinked, 4.4 (unlinked)); so for every
imaginary quadratic `K` with `ρ|_{G_K}` irreducible, the representation of 4.4(b) over `K` (polarized: `ρ` is symplectic with
multiplier `θ`) has a nonzero `K(M)`-fixed vector.

The routes of (a) and (b) use, through 4.2(b), (d) and 4.5(b), HeckeIdealsAndTaylorWilesRelations §4.2a, 3.15(c) (K1′), (K2′) and the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d); the route of (c) uses, through 4.4(b), 3.20(d), (e), ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16 (through 3.19(a)) and HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d). The routes of these statements are not given in full (see there).

*Route.* (0) Away from `ℓ`: by local–global compatibility (AutomorphicGaloisRepresentationsPartII AG2.5, *Caraiani's full
away-prime compatibility*) the Weil–Deligne parameter of `π_w` is that of `r|_{G_{F_w}}`, with monodromy `0` because `r(I_w)` is
finite, a sum of characters of conductor dividing `M`; so `π_w` is an irreducible principal series of these characters
(SmoothRepresentationsOfLocalGroups SR.5.2, *modular-generic-segments*), and a principal series of characters trivial on
`1 + M𝒪_w` has a vector fixed by `K_w(M)` (the function supported on `B·K_w(M)`). Above `ℓ`: the semisimple Weil comparison
(AutomorphicGaloisRepresentationsPartII AG2.6, *Polarized coefficient-prime domination*, whose hypothesis
`ExtremelyRegularIrreducibility n` is proved for every `n ≥ 2` by ModularityAndLanglandsExtensions §2.43) gives the characteristic polynomials
of the Weil–Deligne representation of `π_w`: those of a sum of characters `ω_i` read off from the `κ_i`, trivial on the inertia
elements fixing `μ_M`, with `ω_i = ω_j|·|^{±1}` only if `κ_i = κ_jχ_ℓ` or `κ_j = κ_iχ_ℓ`. If `w | M`, the cuspidal support of `π_w` is a
character of the torus trivial on `T(𝒪_w) ∩ K_w(M)`, the Jacquet module along the Borel subgroup has a vector fixed by that
group, and the `K_w(M)`-fixed vectors of `π_w` map onto those of the Jacquet module (Jacquet's lemma for a subgroup with an
Iwahori factorization, Casselman): no unlinkedness is needed. If `w ∤ M`, the support is unramified, `π_w` has Iwahori-fixed
vectors, and when no two `ω_i` are in ratio `|·|` the principal series is irreducible (SR.5.2), so `π_w` is spherical. The weight
is read off from the Hodge–Tate weights (AG2.0, AG2.6), which are the `−m_i` because the graded characters of the flag have
cyclotomic exponents `m_i`. (a) Away from `ℓ`, inertia acts through `r̄(I_p)`, of order prime to
`ℓ` (as `ℓ ∤ o_ψ`), hence through the characters `ψ^{w_i}|_{I_p}`, of conductor dividing `N`; at `ℓ` the flag of 4.1 (points) has
inertial characters `χ_ℓ^{m_i}(comp_ℓψ)^{w_i}`, of level `N`; then (0) over `K`. For `W` the corner gives a sum of two characters of
level `N|d_K|` on each inertia group, and the same argument over `ℚ` uses the compatibility of the cuspidal representations of
`GL₂(𝔸_ℚ)` (GL2AutomorphicRepresentationsAndTransfer R17.6.4 away from `ℓ`; at `ℓ`, AutomorphicGaloisRepresentationsPartII AG2.6,
*Totally real polarized coefficient-prime descent*, with its hypothesis from ModularityAndLanglandsExtensions §2.43). (b) The
same, with 4.5(b). (c) Away from `T` inertia acts through `(ψ, ξ, ω)`, a finite abelian quotient of level `M`; at `p ∈ S_b` through
`ψ(I_p)`; at `ℓ` the flag of 4.4 has inertial characters `χ_ℓ^{e+1}ω⁻¹ξψ, χ_ℓ^eψ, χ_ℓω⁻¹ξ, 1`, whose finite parts involve `ω`, so
`ℓ | M`; then (0) over `K`, in its alternative `ℓ | M`. *Needs:* 4.1, 4.2, 4.4, 4.5; AutomorphicGaloisRepresentationsPartII AG2.0,
AG2.5, AG2.6; ModularityAndLanglandsExtensions §2.43; SmoothRepresentationsOfLocalGroups SR.1.4, SR.2.1–SR.2.3, SR.5.2;
GL2AutomorphicRepresentationsAndTransfer R17.6.4.

**Checks.**

- Without unlinkedness, and with `ℓ ∤ M`, the level fails: for `e = 1`, `comp_ℓψ = 1` and `Ψ̄ = ω` on a decomposition group, an
  ordinary lift with a linked pair and nonzero monodromy is attached to a `π_w` that is an unramified twist of a
  representation with Iwahori level, and `π^{K(M)} = 0` for `M` prime to `ℓ`.
- "Newform of level dividing `N|d_K|`" would be false: `W|_{I_p}` is a sum of two characters of conductor exponent up to
  `v_p(N)` each, so the conductor divides `N²|d_K|`; the principal congruence level `N|d_K|` is the statement.

### Examples

- `K = ℚ(i)`, `ℓ = 29`, `e = 28`, `ψ` cubic of conductor `7`: `Ψ̄` is trivial on the decomposition group at `29` and the problem of 4.1 has the second diagonal point `diag(Ψ′, 1, Ψ′⁻¹)`, `Ψ′ = ψχ_ℓ^{−28}`; the hypotheses of 4.2 are needed in 4.3(i) (4.3).
- On the ring `A` of 4.4 the pattern has total excess `1` (on `R` it has `2`), and `A` is smooth because exactly one chart coordinate has `λ`-weight `−1`; with `λ`-weights `(1, 1, −1, −1)` the invariants of four coordinates form a quadric cone (4.4).
- When `(ℓ − 1) | e`, `ψ` is unramified at `ℓ` and `ψ̄(Frob_ℓ) = 1`, the point `{ψ, χ_ℓ^e}·{α, 1}` is a second diagonal point with the same reduction (4.6).
- The level of 4.8 is the principal congruence level `N|d_K|`: the conductor of `W` divides `N²|d_K|`, so "newform of level dividing `N|d_K|`" would be false (4.8).

### Dependencies

Layers 0 and 3 above. From this family: ReducibilityIdealsAndUltrafilterPatching, HeckeIdealsAndTaylorWilesRelations, BernoulliBoundsForClassGroupEigenspaces. Other roadmaps: IntegralHeckeAndGaloisDeterminants, PotentialAutomorphyInfrastructurePartII, ArithmeticGaloisRepresentations, ArithmeticGaloisDuality, SelmerIwasawaCohomology, LocalGaloisDeformationRings, PadicFamilies, GL2AutomorphicRepresentationsAndTransfer, AutomorphicGaloisRepresentationsPartII, ModularityAndLanglandsExtensions, SmoothRepresentationsOfLocalGroups.

## Layer 5: good primes: Cases Z, I, II and III

### 5.1 Class numbers of quadratic fields

For every prime `ℓ ≡ 1 mod 4` prove `h(ℚ(√ℓ)) < ℓ`; in particular `ℓ ∤ h(ℚ(√ℓ))` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/LevelCohomology/HQuad.lean` (`UpperTheory.V.X.hQuad`),
`Development/AbelianVarietyTheory/Proofs/CovolumeBounds/ExistsIdealInClassOfNormLeSqrtDiscr.lean`
(`GlobalTheory.classNumber_le_sqrt_discr_mul_pow_pred`)). The general bound
`NumberField.classNumber_le_bound` of EffectiveBounds (`h ≤ |d|·4ⁿ`) is too weak for this.

*Route.* The discriminant of `ℚ(√ℓ)` is `ℓ`, and `b = √ℓ` is admissible (ExplicitNumberFields §0.3: it is at least the
Minkowski bound). The first form of ExplicitNumberFields §5.3 at `n = 2` gives `h(ℚ(√ℓ)) ≤ √ℓ(log √ℓ + γ + 1/√ℓ)`, `γ` Euler's
constant. For `ℓ = 5` this is `4.09… < 5`. For `ℓ ≥ 13`, `γ + 1/√ℓ < 1`, so the bound is less than `√ℓ(1 + log √ℓ)`, which is
less than `ℓ` because `1 + log y < y` for `y > 1`. *Needs:* ExplicitNumberFields §§0.3, 5.3.

**Checks.**

- `ℓ = 5`: `√5(log √5 + γ + 1/√5) = 2.236·(0.805 + 0.577 + 0.447) = 4.09 < 5`, and `h(ℚ(√5)) = 1`.

### 5.2 Case Z: the trivial character

Prove `Ш¹(ℚ, ℓ, e) = 0` for every prime `ℓ ≥ 5` and every even `e ≥ 2` with `(ℓ − 1) | 2e` ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean` (`UpperTheory.V.HV.PropZ`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/LevelCohomology/PropZ.lean` (`UpperTheory.V.X.propZ`)). Through the
duality of BernoulliBoundsForClassGroupEigenspaces §6.17 this extends the unconditional vanishing of the trivial component in
ArithmeticKTheory §7.5 (`K_{2e}(ℤ){ℓ} = 0` for `(ℓ − 1) | e`) to `(ℓ − 1) | 2e`; the new case is the quadratic component of `ℚ(√ℓ)`.

*Route.* `Ш¹(ℚ, ℓ, e)` is a finite `ℓ`-group (BernoulliBoundsForClassGroupEigenspaces §6.17(b)), so it suffices to show that it has no element of
order `ℓ`. Put `W = ℚ_ℓ/ℤ_ℓ(−e)`. If `(ℓ − 1) | e`, `G_ℚ` acts trivially on `W[ℓ]`; an element of order `ℓ` of `H¹(ℤ[1/ℓ], W)` is the
image of a homomorphism `G_ℚ → W[ℓ]` unramified outside `ℓ`, which factors through `Gal(ℚ(μ_{ℓ²})/ℚ)` (Kronecker–Weber with
ramification bound), so it is a multiple of the cyclotomic `ℤ/ℓ`-character; that character is the image under the connecting
map of a generator of `H⁰(ℚ, W)`, so its class in `H¹(ℤ[1/ℓ], W)` is zero. Hence `H¹(ℤ[1/ℓ], W) = 0`. Otherwise `ℓ ≡ 1 mod 4`
and `ω^{−e}` is the quadratic character of `F = ℚ(√ℓ)`; choosing `δ` in inertia at `ℓ` with `χ_ℓ(δ)^e ≢ 1 mod ℓ`, the restriction of
an `ℓ`-torsion class to `G_F` is an everywhere unramified homomorphism to `W[ℓ]`, hence factors through `Cl(F)`, of order prime
to `ℓ` by 5.1; so the class vanishes on `G_F`, hence on `G_ℚ`. *Needs:* 5.1; ClassFieldTheory §13.1 (`kroneckerWeber`,
`hilbertClassField`); BernoulliBoundsForClassGroupEigenspaces §6.17; ProfiniteCohomology §§9.5–9.6.

**Checks.**

- `ℓ = 5`, `e = 2`: `Ш¹(ℚ, 5, 2)` is dual to `K₄(ℤ){5} = 0` (ArithmeticKTheory §7.5).
- `ℓ = 3` is excluded: `(3 − 1) | 2e` for every `e`, and the second case needs `ℓ ≡ 1 mod 4`.

### 5.3 One character

Call `(ψ, e, ℓ, K)`, with `ψ` a character modulo an even `N`, *Case-I admissible* if the hypotheses of 4.2 hold and `ℓ ∤ h_K`.
Prove: if `(ψ, e, ℓ, K)` is Case-I admissible and `σ ∈ G_K` satisfies `tr ρ(σ) ≠ t := Ψ(σ) + 1 + Ψ(σ)⁻¹` for every two-signed point
`ρ` of `𝒟(ψ, e, K)`, then `V_ℓ(ψ, e)` is finite and `V_ℓ(ψ, e) ≤ 2 Σ_{ρ∈𝒳} v_ℓ(tr ρ(σ) − t)` for a finite set `𝒳` of two-signed
points with pairwise non-isomorphic restrictions to `G_K`, each of type I or of type II as in 4.6(a) (follows from [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/NumberU3US.lean` (`UpperTheory.V.Z.J.OneCharU_s`), `Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/ModelUpper.lean` (`UpperTheory.V.U3.model_upper`)). The route uses, through 4.2 and 4.3, HeckeIdealsAndTaylorWilesRelations §4.2a, 3.15(c) (K1′), (K2′) and the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d), whose routes are not given in full (see there).

*Route.* Reduce to unramified `O`. Apply 3.3 to the model of 4.1 (`T₁ = 1`). (M1): 4.1 (model) gives the counts (square in
weights `−2` and `0`, one equation more than coordinates in weight `−1`, one coordinate more than equations in weights `1`
and `2`), and the spanning clauses in weights `−2, −1, 0` follow from 4.3(ii); if the chart has no coordinate of weight
`−1`, then `cot_{−1}(x) = 0` and 3.4 gives `V_ℓ(ψ, e) = 0` directly. (M2) from 4.2(a). (M3) from 4.3(i), since then `x` is the only
point killing all nonzero weights. (M4) from 4.3(iv). (M5) from the hypothesis on `σ`, as `ξ(a_σ) = tr ρ_ξ(σ) − t`. Orbits of
two-signed points are the classes of their restrictions to `G_K` (4.1 (points)), and every two-signed point is as in
4.6(a). Then 3.4, with `𝒮` the restriction of `Ш_{ψ,e}` to `G_K` (4.1 (tangent)), bounds `V_ℓ(ψ, e)` by `cotLen_{−1}`. *Needs:* 3.3,
3.4, 4.1–4.3, 4.6.

### 5.4 One integer for a Galois orbit of characters

Let `K` be imaginary quadratic. Prove that there are `c_K, A_K > 0` such that for every even `N ≥ 2` with `(d_K, N) = 1`, every
`e ≥ 1`, every prime `p ≥ 7` with `p ∤ N d_K`, and every `Aut(ℂ)`-orbit `𝒪` of Dirichlet characters modulo `N` with
`ψ(−1) = (−1)^e`, there is `NN ∈ ℤ ∖ {0}` with `log|NN| ≤ c_K #𝒪 (N(e + 1))^{A_K} log p` and `Σ_{ψ∈𝒪} V_ℓ(ψ, e) ≤ 2 v_ℓ(NN)` for every
prime `ℓ ≠ p` at which every `ψ ∈ 𝒪` is Case-I admissible ([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/KatoUse.lean` (`UpperTheory.V.U3.PropGK`), `Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean` (`UpperTheory.V.HV.orb`)). The route uses, through 5.3, 4.2, 4.3 and 4.8, HeckeIdealsAndTaylorWilesRelations §4.2a, 3.15(c) (K1′), (K2′) and the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d), whose routes are not given in full (see there).

*Route.* Take `w | p` in `K`, `q = Nw ≥ 7`, `σ = Frob_w`; then `Ψ(σ) = q^eψ(q)` and `t_ψ := Ψ(σ) + 1 + Ψ(σ)⁻¹` is the Eisenstein
trace of 3.2(b) with `z = ψ(q)⁻¹`. Let `I = I₁ ⊔ I₂`, with `I₁` the set of isomorphism classes of regular algebraic conjugate
self-dual cuspidal representations of `GL₃(𝔸_K)` of weight `(e − 1, 0, 1 − e)` with a nonzero `K(N)`-fixed vector, and `I₂` the
set of cuspidal representations of `GL₂(𝔸_ℚ)` of weight `2e + 1` with a nonzero vector fixed by the principal congruence
subgroup of level `N|d_K|`. For `i ∈ I₁` let `s_i` be the trace at `σ` of the three-dimensional `ρ_i` with `ρ_i ⊗ χ_ℓ⁻¹` attached to
`π_i`, and for `i ∈ I₂` that of `W_i|_{G_K} ⊕ 1` with `W_i ⊗ χ_ℓ^{−e}` attached to `π_i`: an algebraic number independent of `ℓ`
(compatibility at `w`, AutomorphicGaloisRepresentationsPartII AG2.0, AG2.3). `Aut(ℂ)` acts on `I` compatibly with the multisets
`β(i)` of the eigenvalues at `σ` whose sums are the `s_i` (AG2.0). For **every** `i ∈ I` these eigenvalues have absolute values in
`(q^{−1/2}, q^{1/2})`, by the Jacquet–Shalika bound after the twist of `π_i` to a unitary representation (AutomorphicLFunctionsAndLocalFactors
AL.3.3.8), and product of absolute value `1`, the central character of that unitary twist being unitary (for `i ∈ I₂` the product
is `det W_i(σ)`, of absolute value `1`); so `(I, β)` is a family of normalized eigenvalue triples at `q` (3.2(b)), and `q^e s_i` is
integral. Take `J = 𝒪` with the family `t_ψ`. 3.1 gives `#I ≤ c(N(e + 1))^A` (for `I₂` over `ℚ` at level `N|d_K|`);
3.2(a), (b) with `h = e` give `NN`. For `ψ ∈ 𝒪` and `ℓ`, 5.3 gives a finite set `𝒳_ψ` of two-signed points; by 4.8(a) each is
represented by an element of `I` (type I in `I₁`; type II in `I₂`, with `μ = 1` by 4.3(i)), injectively (strong multiplicity one and
Chebotarev), with `s_i = tr ρ(σ)`; so `Σ_ψ V_ℓ(ψ, e) ≤ 2 Σ_ψ Σ_{i∈𝒳_ψ} v_ℓ(s_i − t_ψ) ≤ 2 v_ℓ(NN)` by 3.2(a). Two points with the same
trace at `σ`, or two characters with the same Eisenstein trace, are distinct indices. *Needs:* 3.1, 3.2, 4.2, 4.3, 4.8, 5.3;
AutomorphicGaloisRepresentationsPartII AG2.0, AG2.3; AutomorphicLFunctionsAndLocalFactors AL.3.3.8.

### 5.5 Case I

(a) *Character form.* For `K` and `c_K, A_K` as in 5.4, prove: for every even `N ≥ 2` with `(d_K, N) = 1`, every `e ≥ 1` and
every `Aut(ℂ)`-orbit `𝒪` of characters modulo `N` with `ψ(−1) = (−1)^e`,
`Σ_ℓ log ℓ · Σ_{ψ∈𝒪} V_ℓ(ψ, e) ≤ 4 c_K #𝒪 (N(e + 1))^{A_K} log(7N|d_K|)`, the sum over the primes `ℓ` at which every `ψ ∈ 𝒪` is
Case-I admissible (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/KatoUse.lean` (`UpperTheory.V.U3.CorGK`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/CorGSumLog.lean` (`UpperTheory.V.U3.corGK`)).
(b) *Host form.* For `χ` there is `C` such that for every host field `E = E_n(χ, Q)` (two auxiliary primes, one `≡ 3 mod 8`
and one `≡ 7 mod 16`, `n ≥ 2`, `Q` `t`-large) and every `1 ≤ e < t`: `Σ_{ℓ ∉ B(χ), (ℓ−1)∤2e} log ℓ · length Ш⁺(E, ℓ, e) ≤ (N t)^C`
(follows from [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean`
(`UpperTheory.V.HV.CountI`), `Development/AutomorphicArithmetic/AutomorphicVarieties/UnitaryThreeGroups/CountI.lean`
(`UpperTheory.V.U3.countI`)).
The route uses, through 5.4, HeckeIdealsAndTaylorWilesRelations §4.2a, 3.15(c) (K1′), (K2′) and the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d), whose routes are not given in full (see there).

*Route.* (a) Take the two least primes `p ≠ p′`, `p, p′ ≥ 7`, not dividing `N d_K`; every admissible `ℓ` differs from
one of them, so 5.4 gives `Σ_ψ V_ℓ(ψ, e) ≤ 2v_ℓ(NN_p) + 2v_ℓ(NN_{p′})`; sum over `ℓ` with `Σ_ℓ log ℓ v_ℓ(NN) ≤ log|NN|`.
(b) For `ℓ ∉ B(χ)`, `ℓ ∤ [E : ℚ]` and `length Ш⁺(E, ℓ, e) ≤ Σ_{ψ∈X(E,e)} V_ℓ(ψ, e)` (BernoulliBoundsForClassGroupEigenspaces §6.18(b), with
0.3(c) for the conditions at the primes dividing `N`). Apply (a) with `K = K_χ` to each orbit in `X(E, e)`:
admissibility follows from 0.3 and Case I, as `K_χ` is ramified at `p_K ∤ ℓN` and `ℓ ∤ h_χ`; `Σ_𝒪 #𝒪 ≤ N`. The constants
depend on `K_χ` and on `B(χ)`. *Needs:* 0.3, 0.4, 5.4; BernoulliBoundsForClassGroupEigenspaces §6.18.

**Checks.**

- `N = 2`, `𝒪 = {1}`, `K = ℚ(√−7)`, `e` even: the admissible primes are the odd `ℓ ≠ 7` with `(ℓ − 1) ∤ 2e`, and
  `V_ℓ(1, e) = length Ш¹(ℚ, ℓ, e) = v_ℓ(#K_{2e}(ℤ))`, so (a) reads
  `Σ_{ℓ ≥ 5, ℓ ≠ 7, (ℓ−1)∤2e} log ℓ · v_ℓ(#K_{2e}(ℤ)) ≤ C (e + 1)^A`: a polynomial bound for `log #K_{2e}(ℤ)` away from the primes
  `ℓ ≤ 2e + 1` with `(ℓ − 1) | 2e` and from `3, 7`.

### 5.6 Auxiliary symplectic data

In the host setting, let `ℓ` be odd, `e ≥ 2` and `ψ ∈ X(E, e)` in Case II or III, so that `χ_P(ℓ, ψ) ≠ 1`. Prove that there is
`ξ = ξ₀ξ′` as in 4.4, with the exponent `m = m(ℓ, ψ)` of 4.4, for which (G1) and (G2) of 4.4 hold ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/DataEx.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.dataEx`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/DecompSigmaOrd.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.Raw.Good`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/SymplecticGSp4/DecompSigmaOrd.lean`
(`UpperTheory.V.GradeZeroInterpolatingElement.Raw.XVan`)), and that `2^{m(ℓ,ψ)} ≤ (ℓN)^{c(χ)}` for
a constant `c(χ)` depending on `χ` only (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/DirichletPrimeToLPartMulLPowerPart.lean`
(`UpperTheory.V.HV.Host.nII`)).

*Route.* Only the reductions `γ̄` enter (G1), and the reduction of a character of `ℓ`-power order is trivial; so replace each
character by its prime-to-`ℓ` part. Put `d := f₀` and `k := n₀` (the integers of the Setting of 4.4: `f₀` the order of `ℓ` modulo
`lcm(4, o₁)`, `n₀ = v₂(ℓ^{f₀} − 1) ≥ 2`). The prime-to-`ℓ` odd-conductor parts `φ` of `γ ∈ {α^{±1}, β^{±1}, θ^{±1}}` are a power of `ω`
times a character of order dividing `o₁` (with `ξ₀`, of order `o_ψ = o₁` in Case III), so their order divides `ℓ^{f₀} − 1`, and their
conductor `f` divides `ℓ·f(ψ₁)·p₁`, `ψ₁` the odd-conductor part of the prime-to-`ℓ` part of `ψ` (`p₁ = 1` in Case II). As `m > c₂(ψ)`, the `2`-parts of `α, β, θ`
have conductor exactly `2^m`. In Case II, `f` divides `ℓ` times the odd part of `N`, so `f·4^{n₀} ≤ ℓN·4^{n₀} ≤ 2^m`: 3.5(b) applies. In Case III,
`f·4^{n₀} ≤ ℓ·f_χ·p₁·4^{n₀} ≤ 2^m`: 3.5(b) applies. Either
way the everywhere unramified classes of each `γ̄` vanish. A class as in (G1) is unramified at every prime outside `T` (on
inertia it vanishes on the elements at which `r̄₀` is trivial, so it factors through `r̄₀(I_p)`, of order prime to `ℓ`) and
trivial at `T`: so (G1) holds. (G2): at `v ∈ T`, `χ̄_ℓ(Frob_v) = 1` (at `ℓ` by the choice of `Frob_ℓ`; at the primes of `S_b` because
`ℓ | v − 1` there), so `Ψ̄(Frob_v) = ψ̄(Frob_v)`; write `ψ^{2^a·o} = 1` with `o` odd, `a = c₂(ψ) + 1 + v₂(o_χ)` in Case II and `a = 0` in
Case III (`o_ψ` odd). If `ξ̄Ψ̄^i(Frob_v) = 1` for some `i`, then, raising to the power `2^a·o` (which kills `ξ₀` in Case III), the primitive
character `ξ′` modulo `2^m` would be trivial on `v^{2^a·o}`, which forces `2^m < v²·2^a`: for `a ≥ 1`, `v^{2^a}` lies in the subgroup generated
by `5`, on which `ξ′` is faithful, and `v₂(v^{2^a} − 1) = v₂(v² − 1) + a − 1`; for `a = 0` the kernel of an odd primitive character modulo
`2^m` is `{1, 2^{m−1} − 1}`. As `v²·2^a ≤ 2^m` for `v ∈ T` by the choice of `m`, (G2) holds. The size: `4^{n₀} ≤ ℓ^{2f₀}`, `f₀ ≤ 4o_χ`,
`2^{c₂(ψ)} ≤ N`, `p₁ ≤ P(χ)`, so `2^m ≤ (ℓN)^{c(χ)}`. *Needs:* 0.2, 0.3, 3.5, 4.4.

**Checks.**

- The threshold in Case III: for `χ = ψ` cubic of conductor `7`, `ℓ = 5`, `e = 2` (`p_K = 11`, `p₁ = 13`, `B(χ) = {3, 7, 11, 13}`, Case
  III), `f₀ = 2`, `n₀ = 3` and `m = 15` (`2^m ≥ 5·7·13·4³ = 29120`); for `θ̄` the odd-conductor part `ω²ψξ₀` has conductor `f = 455` and
  order `6`, so `d = 2`, `k = 3`, and `f·4^k = 29120 ≤ 2^{15}`, while `2f·4^k = 58240 > 2^{15}`: the threshold of 3.5 holds with less
  than a factor `2` to spare.

### 5.7 Cases II and III

For `χ` there is `C` such that for every host field `E`, every odd `ℓ`, every `2 ≤ e < t` and every `ψ ∈ X(E, e)` in Case II or III:
`V_ℓ(ψ, e)` is finite and `V_ℓ(ψ, e) log ℓ ≤ (ℓNe)^C` ([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean` (`UpperTheory.V.HV.CountII`), `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/ConductorAtMapInjectiveCoeff.lean` (`UpperTheory.V.Th.sp4Main_alt`)). The route uses, through 4.4 and 4.6–4.8, 3.20(d), (e), ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16 (through 3.19(a)), 4.7(iv) and HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d), whose routes are not given in full (see there).

*Route.*

1. Choose the auxiliary data of 5.6 and enlarge `O` to contain the values of `ψ`, `ξ` and the `2^m`-th roots of unity; normalized
   lengths do not change.
2. `V_ℓ(ψ, e) = V_ℓ(ψ, e; S)` for `S` the primes dividing `2ℓNp₁` (BernoulliBoundsForClassGroupEigenspaces §6.18(a): `ψ` is unramified at the added
   primes), and by 4.4 (model), (tangent) and 3.4, `V_ℓ(ψ, e) ≤ cotLen_{−1}(F)/e_O` for the model `A` of 4.4.
3. Apply 3.3 to the model of 4.4, that is ReducibilityIdealsAndUltrafilterPatching §4.9 to the graded subalgebra
   `(A, x, (F, E, Z))` with the `μ`-grading and `a_σ ∈ A₀`. (M1): 4.4 (model), including its spanning clauses. (M2) from 4.4(a).
   (M3) from 4.6(c) (its disjunction is needed only when `Ψ̄` is trivial on the decomposition group at `ℓ`). (M4) from 4.7(iii). Fix
   the field `K_χ = ℚ(√−p_K)` of 0.3: it is unramified at `2`, at the primes of `f_χ`, at `p₁` and at the auxiliary primes
   (`q > P(χ) ≥ p_K`), so it is unramified at the primes of `S` other than `ℓ` (at `ℓ` it may ramify, which 4.4 (irreducibility)
   allows), and every irreducible point stays irreducible on `G_{K_χ}`. (M5) for `a_σ` a lift of `tr r(σ) − tr r₀(σ)`, `σ` a Frobenius
   at a place `w` of `K_χ` of degree one above the least prime `p₀ ≥ 5` that splits in `K_χ` and does not divide `ℓNp₁`: a two-signed
   point comes from an irreducible point `ρ` (4.6(c)), and `ρ|_{G_{K_χ}}` is attached to a cuspidal `π` of `GL₄(𝔸_{K_χ})` (4.4(b)); the
   eigenvalues of `ρ(σ)` have absolute values in `(p₀^{e/2}, p₀^{e/2+1})` by the Jacquet–Shalika bound for `π_w` (AL.3.3.8), and have
   product of absolute value `|θ(σ)|² = p₀^{2(e+1)}`; so 3.2(c) separates `tr ρ(σ)` from `tr r₀(σ) = θ + Ψ + α + 1`.
4. Every two-signed point carries an irreducible point of `𝒟_sp`, and two-signed points in different orbits carry
   non-conjugate representations (4.6(c)); so
   `V_ℓ(ψ, e) ≤ 2 Σ_{ρ∈𝒳} v_ℓ(tr ρ(σ) − tr r₀(σ))` for a finite set `𝒳` of pairwise non-isomorphic irreducible points.
5. For each `ρ ∈ 𝒳`, `ρ|_{G_{K_χ}}` is attached to a cuspidal representation of `GL₄(𝔸_{K_χ})` with `K(M)`-fixed vectors,
   `M = ℓ2^mNp₁` (4.8(c), with (0) in its alternative `ℓ | M`). Let `I_{K_χ}` be the set of regular algebraic cuspidal `π` of
   `GL₄(𝔸_{K_χ})` with the infinitesimal character of the exponents `(e + 1, e, 1, 0)` at both embeddings (weight
   `(−3, −3, −e − 1, −e − 1)`, 4.8), with `π^{K(M)} ≠ 0`, and polarizable (AutomorphicGaloisRepresentationsPartII AG2.0 (iv):
   `π^c ≅ π^∨ ⊗ (χ′ ∘ N_{K_χ/ℚ} ∘ det)` for some Hecke character `χ′` of `ℚ`; no weight or parity condition is put on `χ′`). Such `π`
   have Galois representations (AG2.0, AG2.2, AG2.3); the set is stable under `Aut(ℂ)` and contains the representation attached to
   `ρ|_{G_{K_χ}}` (`ρ` extends to `G_ℚ` and is self-dual up to the twist by `θ`). (The set `I_{K_χ}` is not a set of representations
   of `G_ℚ`: a polarizable `π` over `K_χ` need not come from one. What is used is only the map `ρ ↦` (the representation attached to
   `ρ|_{G_{K_χ}}`) from `𝒳` to `I_{K_χ}`, which is at most two-to-one. The same count can be stated on the Galois side: the irreducible
   continuous `r : G_ℚ → GL₄(ℚ̄_ℓ)` with inertia away from `ℓ` acting through characters of conductor dividing `M`, a flag at `ℓ` with
   inertial characters `χ_ℓ^{m_i}` times such characters, `ℓ | M`, `r` unlinked at `ℓ`, `r ≅ r^∨ ⊗ θ′` with `θ′` equal to `χ_ℓ^{e+1}` times
   a character of finite order, and attached over every imaginary quadratic field on which they stay irreducible to a regular
   algebraic cuspidal representation whose components satisfy the window below, are classified by a finite `Aut(ℂ)`-stable
   family of eigenvalue quadruples of size `≤ c(M(e + 1))^A`: there is a map from these `r` to the family, injective on isomorphism
   classes, giving the eigenvalues at `Frob_{p₀}`. The points of 4.4 are among these `r` by 4.4 (unlinked), 4.4(b) and 4.8(c).) 3.1 for `GL₄` over the one field `K_χ`, with weights bounded by `e + 1`, bounds `#I_{K_χ}` by `c_χ(M(e + 1))^{A_χ}`, constants
   depending on `χ` only. The map `ρ ↦ ρ|_{G_{K_χ}}` is at most two-to-one on `𝒳` (`ρ` and `ρ ⊗ η_{K_χ}` have the same restriction), so
   `𝒳` maps injectively to the index set `I = I_{K_χ} × {1, 2}`, with `s_{(π, i)}` the trace at `σ` of the Galois representation of `π`:
   an `Aut(ℂ)`-equivariant integral family (AutomorphicGaloisRepresentationsPartII AG2.0), and `tr ρ(σ) = s_i` for the image `i` of
   `ρ`, since `σ ∈ G_{K_χ}`. For **every** `π ∈ I_{K_χ}` the four eigenvalues at `σ = Frob_w` lie in `(p₀^{e/2}, p₀^{e/2+1})` and their
   product has absolute value `p₀^{2(e+1)}`, at every embedding: twist `π` by a power of the absolute value to a unitary
   representation; the Jacquet–Shalika bound (AL.3.3.8) gives the window and the unitary central character the product. So the
   eigenvalue multisets form a family of eigenvalue quadruples of weight `e + 1` at `p₀` (3.2(c)), and `s_i ≠ t_j` for every index. With `J` the
   conjugates of the Eisenstein trace, `#J ≤ φ(k)` for `k` the exponent of the group generated by the values of `ψ`, `ξ` and `ω`,
   3.2(a), (c) give `NN ≠ 0` with `log|NN|` polynomial in `ℓNe` and `Σ_{ρ∈𝒳} v_ℓ(tr ρ(σ) − tr r₀(σ)) ≤ v_ℓ(NN)`.
6. `V_ℓ(ψ, e) log ℓ ≤ 2 log|NN| ≤ (ℓNe)^C`, since `2^m`, `p₁` and `p₀` are polynomial in `ℓN`: `ℓNp₁` has at most `log₂(ℓNp₁)` prime
   factors, and the primes split in the fixed field `K_χ` have positive density in every range `(y, 2y]` with `y` large
   (AnalyticNumberTheoryPartI §0.32), so `p₀` is bounded by a polynomial in `log(ℓN)` with constants depending on `χ`.

The integer `NN` bounds the sum of the valuations over any finite set of pairwise non-isomorphic automorphic points; it is
not the order of a congruence module of a Hecke algebra. *Needs:* 0.3, 3.1–3.4, 4.4, 4.6–4.8, 5.6; BernoulliBoundsForClassGroupEigenspaces §§6.17,
6.18; AutomorphicGaloisRepresentationsPartII AG2.0; AutomorphicLFunctionsAndLocalFactors AL.3.3.8; AnalyticNumberTheoryPartI §0.32.

### Examples

- `ℓ = 5`: the bound of ExplicitNumberFields §5.3 used in 5.1 is `4.09 < 5`, and `h(ℚ(√5)) = 1` (5.1).
- `ℓ = 5`, `e = 2`: `Ш¹(ℚ, 5, 2)` is dual to `K₄(ℤ){5} = 0` (5.2).
- `N = 2`, `𝒪 = {1}`, `K = ℚ(√−7)`, `e` even: 5.5(a) reads `Σ_{ℓ ≥ 5, ℓ ≠ 7, (ℓ−1)∤2e} log ℓ · v_ℓ(#K_{2e}(ℤ)) ≤ C (e + 1)^A` (5.5).
- `χ = ψ` cubic of conductor `7`, `ℓ = 5`, `e = 2` (Case III): `m = 15`, with `2^m ≥ 5·7·13·4³ = 29120` (5.6).

### Dependencies

Layers 0, 3 and 4 above. From this family: BernoulliBoundsForClassGroupEigenspaces. Other roadmaps: ClassFieldTheory, ProfiniteCohomology, AutomorphicGaloisRepresentationsPartII, AutomorphicLFunctionsAndLocalFactors, AnalyticNumberTheoryPartI, ExplicitNumberFields. Mathlib.

## Layer 6: bad primes: Cases IV, V large and V small

### 6.1 Components of bounded order

Let `ψ` be a Dirichlet character of conductor `N`, `ℓ` an odd prime, `e ≥ 1`, and `L` the field cut out by `ψ` and `μ_ℓ`, of
conductor dividing `ℓN`. Prove `V_ℓ(ψ, e) ≤ 2 exp((2e [L:ℚ])^{C_K} [L:ℚ] log(2ℓN)) + 2[L:ℚ] ℓ N e` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/CharacterLevelBounds/LiftGens.lean` (`UpperTheory.V.Chr.upV`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/AdditiveValuationNorms/ShaLeV.lean` (`UpperTheory.V.PropA.shaLeV`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/LayeredIsomorphisms/Klen.lean` (`UpperTheory.V.Win.klen`)).

*Route.* Going up to `L` (BernoulliBoundsForClassGroupEigenspaces §6.18(d), with the conductor `ℓN` of `L` in the local term), `length Ш¹ ≤ length H²`
(§6.17(c)) and §9.7 at the totally complex `L ⊇ μ_ℓ`, with `log|d_L| ≤ [L:ℚ] log(ℓN)`. *Needs:* BernoulliBoundsForClassGroupEigenspaces §§6.17,
6.18, 9.7.

### 6.2 Case V small

For `χ` there is `C` such that for every host field `E`, every `ℓ ∈ B(χ)` and every `ψ ∈ X(E, 1)` with
`2^{c₂(ψ)} < R₁(ℓ, χ)`: `V_ℓ(ψ, 1) log ℓ ≤ (ℓN)^C` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean` (`UpperTheory.V.HV.CountVs`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean` (`UpperTheory.V.HV.CountV`)).

*Route.* The `2`-part of `ψ` has conductor below `R₁(ℓ, χ)` and its odd part divides `o_χ` times a quadratic part, so
`o_ψ` and the degree of `L` in 6.1 are bounded in terms of `χ`, `ℓ ≤ max B(χ)`. *Needs:* 0.3, 6.1.

### 6.3 Case IV

For `χ`, `ℓ ∈ B(χ)` and `j ≥ 0` there is `C`, depending on `χ`, `ℓ` and `j`, such that for every host field `E` and every `B ≥ 0` with
`Σ_{1≤e<t} length Ш¹(ℚ(μ_{ℓ^{j+1} f_χ}), ℓ, e) ≤ B`, every character `ψ` of `Gal(E/ℚ)` with `χ_P(ℓ, ψ)` of odd order satisfies
`Σ_e V_ℓ(ψ, e) ≤ B + (N t)^C`, the sum over the `e` with `2 ≤ e < t` and `ψ ∈ X(E, e)` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/LayerLe.lean` (`UpperTheory.V.HV.CountIV`)).

*Route.* The `2`-power and quadratic components of such `ψ` are trivial, so its conductor divides `f_χ` and it factors
through `ℚ(μ_{f_χ}) ⊂ ℚ(μ_{ℓ^{j+1} f_χ})`, for every `j`; going up (BernoulliBoundsForClassGroupEigenspaces §6.18(d), with the conductor `ℓ^{j+1} f_χ` in the
local term) and summation over `e`. *Needs:* 0.2, 0.3; BernoulliBoundsForClassGroupEigenspaces §6.18.

### 6.4 Case V large

For `χ` there is `C` such that for every host field `E`, every `ℓ ∈ B(χ)` and every `ψ ∈ X(E, 1)` with `R₁(ℓ, χ) ≤ 2^{c₂(ψ)}`:
`V_ℓ(ψ, 1) log ℓ ≤ (ℓN)^C` (follows from [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/Counts.lean` (`UpperTheory.V.HV.CountV`), `Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/CountVOf.lean` (`UpperTheory.V.UnitaryThreeInertia.countV_of_finiteness_duality_euler_host`)). The route uses, through 4.5 and 4.8(b), 4.5 (model) and (i), (ii) of 4.3 for `𝒟_G`, HeckeIdealsAndTaylorWilesRelations §4.2a, 3.15(c) (K1′), (K2′) and the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d), whose routes are not given in full (see there).

*Route.* As 5.3–5.4 relative to `ℚ(i)`, resting on 4.5 instead of 4.1–4.3. The host data of 4.5 hold (4.5, setting), so `𝒟_G(ψ, 1)`
is defined for an arbitrary coefficient ring `O`, lengths being divided by `e_O`. Apply 3.3 to its model (`T₁ = 1`): (M1) from
4.5 (model) with the spanning clauses from 4.3(ii) for `𝒟_G`; (M2) from 4.5(a); (M3) from 4.3(i) for `𝒟_G` (`h(ℚ(i)) = 1`); (M4) from
4.5(c), every two-signed point being of type I (4.6(b)) and automorphic (4.5(b)); (M5) for `σ = Frob_w`, `w | p` of norm `p ≥ 7`
split in `ℚ(i)` and prime to `ℓN`, by 3.2(b): for every member of the `Aut(ℂ)`-stable family of the representations of
`GL₃(𝔸_{ℚ(i)})` with a nonzero `K(N)`-fixed vector, the normalized eigenvalues at `σ` lie in the window by the Jacquet–Shalika bound
after the twist to a unitary representation, and their product has absolute value `1` by the unitary central character. Then 3.4
with 4.5 (tangent), injectivity of restriction from `ℚ` to `ℚ(i)` (`ℓ` odd), and 3.1 with 3.2(a) for that family (4.8(b)). Since `ℓ ≤ max B(χ)` and
the least such `p` is polynomial in `N`, `log|NN|/log ℓ` is polynomial in `N`. *Needs:* 3.1–3.4, 4.3, 4.5, 4.6, 4.8.

### 6.5 The minus part at the odd primes dividing the degree

Prove that there is an absolute constant `C` such that for every abelian CM field `E` of degree `n` contained in `ℚ(μ_N)`, every
odd prime `ℓ` and every `e ≥ 1`: `Ш⁻(E, ℓ, e)` has finite length and `log ℓ · length Ш⁻(E, ℓ, e) ≤ C·ℓ·n²·(e + 1)·log²(eℓN)`
([FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/OddResidueBounds/ZeroMemUnrHom.lean`
(`UpperTheory.V.Odd.StickBound`)).

*Route.* Put `M = Nℓ`, `k = e + 1`, `a = 2M + 1`, `Γ = Gal(E/ℚ)`, `X = H¹(G_{E,S}, ℚ_ℓ/ℤ_ℓ(−e))`. For `b` prime to `M` let `σ_b ∈ Γ` be the
restriction of `ζ_M ↦ ζ_M^b`; `c = σ_{−1}` is complex conjugation and `σ_a = 1`. `Γ` acts on `X` by `(σx)(g) = χ_ℓ(σ̃)^{−e}·x(σ̃⁻¹gσ̃)`,
`σ̃` a lift, and preserves `Ш¹(E, ℓ, e)`. Let `y = (1 − a^k)·θ_k` with `θ_k = −Σ_{b∈(ℤ/M)^×} (M^{k−1}/k)·B_k(b̃/M)·σ_b ∈ ℚ[Γ]`, `b̃ ∈ [0, M)`
the representative of `b`.
(1) *Congruence with weight one.* For a level `M′` prime to `a`, `b ∈ (ℤ/M′)^×` and `b′ = a⁻¹b`:
`(M′^{k−1}/k)(B_k(b̃/M′) − a^kB_k(b̃′/M′)) = b̃^{k−1}·ε_a(b) + (M′/d_k)·z`, with `ε_a(b) = (a − 1)/2 − (a·b̃′ − b̃)/M′ ∈ ℤ`,
`d_k = 2k·∏_{p≤k+1} p`, `z ∈ ℤ` (expand `B_k(x) = Σ_j binom(k, j)B_jx^{k−j}`; `∏_{p≤k+1} p·B_j ∈ ℤ` for `j ≤ k`; `a·b̃′ = b̃ + M′j`). For
`M′ = Mℓ^m` the element formed at level `M′` maps to `y` (`Σ_{c≡b mod M} M′^{k−1}B_k(c̃/M′) = M^{k−1}B_k(b̃/M)`, and every lift of a unit is
a unit because `ℓ | M`). Hence `y ∈ ℤ_ℓ[Γ]` and `y ≡ ỹ_{M′} := −Σ_{b∈(ℤ/M′)^×} b̃^e·ε_a(b)·σ_b` modulo `ℓ^r` for `m ≥ r + v_ℓ(d_k)`.
(2) *Annihilation.* `Σ_{b∈(ℤ/M′)^×} ε_a(b)σ_b⁻¹ = (1 − aσ_a⁻¹)θ + ((a − 1)/2)·Nm`, `θ = Σ_b (b̃/M′)σ_b⁻¹` and `Nm = (1 + c)θ` the norm
element of `K = ℚ(μ_{M′})`; as `a` is odd and prime to `M′` it lies in the integral Stickelberger ideal and kills the class group of
`K` (CyclotomicClassGroupsAndStickelberger §§2.1, 2.3, 2.5). Let `x ∈ Ш¹(E, ℓ, e)` with `ℓ^rx = 0`, represented by a cocycle with
values killed by `ℓ^r`. For `m` large its restriction to `G_K` is a homomorphism `h`, unramified everywhere (it is a homomorphism
on `G_{E(μ_{ℓ^m})}` for `m ≥ r`, unramified outside `ℓ`, and trivial on the decomposition groups above `ℓ` once `ℓ^m` kills the
elements whose coboundaries are the local classes), so `h = f ∘ (Artin map)` for a homomorphism `f` of the class group of `K`
(ClassFieldTheory Layer 13). For `u ∈ G_{ℚ(μ_{Mℓ^∞})}` and `σ̃_b` acting on `μ_{M′}` by `b`: `χ_ℓ(σ̃_b) ≡ b̃ mod ℓ^m`, so
`b̃^e·(σ_bx)(u) = h(σ̃_b⁻¹uσ̃_b)` and `(ỹ_{M′}x)(u) = −f((Σ_b ε_a(b)σ_b⁻¹)·[u]) = 0`. With (1), `yx` vanishes on `G_{ℚ(μ_{Mℓ^∞})}`. For
`u ∈ G_{E(μ_{ℓ^∞})}`, `u^{φ(M)}` fixes `μ_M`; and restriction to `G_{E(μ_{ℓ^∞})}` is injective on `X` (its kernel is `H¹` of the
procyclic group `Gal(E(μ_{ℓ^∞})/E)` in `ℚ_ℓ/ℤ_ℓ(−e)`, zero because `e ≠ 0`; ProfiniteCohomology Layer 5). So `φ(M)·y` kills
`Ш¹(E, ℓ, e)`.
(3) *Determinant.* Put `ε = (−1)^{e+1}`. On the `ε`-eigenspace of `c`, `ℤ_ℓ[Γ]` acts through `ℤ_ℓ[Γ]/(c − ε)`, free of rank `n/2`; let `Δ`
be the determinant of multiplication by `y` on it. By the adjugate `Δ ∈ (y, c − ε)`, so `Δ·φ(M)` kills `Ш⁻(E, ℓ, e)`.
`Δ = ∏_χ (1 − a^k)(−B_{k,χ}/k)` over the `n/2` characters with `χ(c) = (−1)^k`, where `χ` is read as `b ↦ χ(σ_b)` modulo `M` and
`B_{k,χ} = M^{k−1}Σ_{b=1}^{M} χ(b)B_k(b/M)`. `Δ ≠ 0`: `B_{k,χ}` is the Bernoulli number of the primitive character `χ₀` of `χ` times
`∏_{p|M}(1 − χ₀(p)p^{k−1})`, nonzero for `k ≥ 2` and this parity (DirichletPadicLFunctions §0.4; LFunctions Layer 4).
`(M·k·(k + 1)!)^{n/2}·Δ ∈ ℤ`, and `|(1 − a^k)B_{k,χ}/k| ≤ 2a^kM^k·k!` by `|B_k(x)| ≤ 4k!/(2π)^k` on `[0, 1]`. So `ℓ^r` kills
`Ш⁻(E, ℓ, e)` for `r = v_ℓ(Δ) + v_ℓ(φ(M))`, and `r·log ℓ ≤ 30n(e + 1)·log(eℓN)`.
(4) *Generators.* `X[ℓ]` is a quotient of `H¹(G_{E,S}, (ℤ/ℓ)(−e))`, which restricts injectively to `Hom(G_{F₁,S}, ℤ/ℓ)`, `F₁ = E(μ_ℓ)`
(`[F₁ : E]` is prime to `ℓ`). By Kummer theory (ProfiniteCohomology Layer 9) these homomorphisms embed in
`{α ∈ F₁^×/F₁^{×ℓ} : ℓ | v(α) for v ∤ ℓ}`, of order at most `ℓ^{2m₁}·h(F₁)`, `m₁ = [F₁ : ℚ] ≤ ℓn` (ArithmeticGaloisDuality R02.3.3, *The Kummer sequence for S-units*, with `m = ℓ` and `S` the places above
`ℓ∞`, and the `S`-unit rank of HeightsAndUnits §4.2). `h(F₁) ≤ √|d|·(1 + ½log|d|)^{m₁}` (ExplicitNumberFields §5.3, first form
at `b = √|d|`, admissible by its §0.3: for `|d| ≥ 6`, `γ + 1/√|d| ≤ 1`, `γ` Euler's constant, and the fields with `|d| ≤ 5`
have class number one; the weaker `h(F₁) ≤ |d|·4^{m₁}` of EffectiveBounds Layer 1 gives the same estimate below) and `|d| ≤ (ℓN)^{m₁}`
(`F₁ ⊂ ℚ(μ_{ℓN})`; the conductor–discriminant formula of ClassFieldTheory
Layer 13) give `log h(F₁) ≤ 3m₁·log(ℓN)`. So `length X[ℓ] ≤ 8ℓn·log(ℓN)`.
(5) If `ℓ^r` kills a submodule `P ⊂ X`, then `length P ≤ r·length X[ℓ]` (induction on `r` along `0 → X[ℓ] → X[ℓ^{r+1}] → X[ℓ^r]`).
With (3) and (4): finiteness and the bound with `C = 240`. The bound is used only at the odd primes `ℓ` dividing `n`, where the
bound of BernoulliBoundsForClassGroupEigenspaces §10.1 is not available. *Needs:* BernoulliBoundsForClassGroupEigenspaces §6.17;
CyclotomicClassGroupsAndStickelberger §§2.1, 2.3, 2.5; ClassFieldTheory §13.1; DirichletPadicLFunctions §0.4; LFunctions
Layer 4; ProfiniteCohomology §§5.4, 9.5–9.6; HeightsAndUnits §4.2; ArithmeticGaloisDuality R02.3.3; ExplicitNumberFields §5.3;
EffectiveBounds Layer 1.

**Checks.**

- `M′ = 5`, `a = 3`: `ε₃(b) = 0, −1, 1, 0` for `b = 1, 2, 3, 4`.
- `E = ℚ(μ₇)`, `ℓ = 3`, `e = 1` (`M = 21`, `a = 43`, `k = 2`): `v₃(Δ) = 3`, all of it from `1 − 43² = −2³·3·7·11` at the three even
  characters, and `v₃(φ(21)) = 1`: the route gives `3⁴·Ш⁻(ℚ(μ₇), 3, 1) = 0`.
- `φ(Nℓ)·y` kills the plus part as well, and says nothing there: for `χ(c) = (−1)^{k+1}` and `k ≥ 2`, `B_{k,χ} = 0`.

### Examples

- `E = ℚ(μ₇)`, `ℓ = 3`, `e = 1` (`M = 21`, `a = 43`, `k = 2`): `v₃(Δ) = 3` and `v₃(φ(21)) = 1`, so the route gives `3⁴·Ш⁻(ℚ(μ₇), 3, 1) = 0` (6.5).
- `M′ = 5`, `a = 3`: `ε₃(b) = 0, −1, 1, 0` for `b = 1, 2, 3, 4` (6.5).

### Dependencies

Layers 0, 3 and 4 above. From this family: BernoulliBoundsForClassGroupEigenspaces. Other roadmaps: CyclotomicClassGroupsAndStickelberger, ClassFieldTheory, DirichletPadicLFunctions, LFunctions, ProfiniteCohomology, HeightsAndUnits, ArithmeticGaloisDuality, ExplicitNumberFields, EffectiveBounds.

## Layer 7: assembly, headline and the consumed form

### 7.1 Good primes

For `χ` there is `C` such that for every host field `E = E_n(χ, Q)` (two auxiliary primes, one `≡ 3 mod 8` and one
`≡ 7 mod 16`, `n ≥ 2`, `Q` `t`-large):
`Σ_{ℓ odd, ℓ ∉ B(χ)} log ℓ · Σ_{1≤e<t} length Ш⁺(E, ℓ, e) ≤ (N t)^C` (follows from [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/LayerLe.lean` (`UpperTheory.V.HV.SumOut`)). The route uses, through 5.5 and 5.7, the following statements, whose routes are not given in full (see there): 3.15(c) (K1′), (K2′); ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, through 3.19(a); 3.20(d), (e) ((P1₄), (pur), (aut), the clause (w2) of (wit) and the maps of (e)); 4.7(iv); the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d); HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d).

*Route.* For each `e`, Case I primes by 5.5(b). Every other good prime has `(ℓ − 1) | 2e`, hence `ℓ ≤ 2t + 1` (0.3(d)); at
most `2t` such primes, at most `N` characters each, in Case Z (5.2), II or III (5.7), each at most `(ℓNe)^C ≤ (2Nt²)^C`.
Sum over `e < t`. *Needs:* 0.4, 5.2, 5.5, 5.7; BernoulliBoundsForClassGroupEigenspaces §6.18.

### 7.2 Bad primes and the plus part

For `χ` and `j : B(χ) → ℕ` there is `C`, depending on `χ` and `j`, such that for every host field `E` and every `B ≥ 0` bounding
`Σ_{1≤e<t} length Ш¹(ℚ(μ_{ℓ^{j(ℓ)+1} f_χ}), ℓ, e)` for every `ℓ ∈ B(χ)`:
`Σ_{ℓ odd} log ℓ · Σ_{1≤e<t} length Ш⁺(E, ℓ, e) ≤ (N t)^C + C B` (follows from [FormalProof], `Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/LayerLe.lean` (`UpperTheory.V.HV.PointHV`)). The route uses, through 5.7, 6.4 and 7.1, the following statements, whose routes are not given in full (see there): 3.15(c) (K1′), (K2′); ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, through 3.19(a); 3.20(d), (e) ((P1₄), (pur), (aut), the clause (w2) of (wit) and the maps of (e)); 4.7(iv); the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d); 4.5 (model) and (i), (ii) of 4.3 for `𝒟_G`; HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d).

*Route.* For `ℓ ∈ B(χ)`, BernoulliBoundsForClassGroupEigenspaces §6.18(c) bounds `length Ш⁺` by the component lengths plus a defect
polynomial in `Ne` per character; by 0.4 each component is in Case II (5.7), IV (6.3) or V (6.2, 6.4); the
characters in Case IV number at most `f_χ` up to their `ℓ`-parts. Add 7.1. *Needs:* 0.4, 5.7, 6.2–6.4, 7.1;
BernoulliBoundsForClassGroupEigenspaces §6.18.

### 7.3 Polynomial bound away from the bad primes

For `χ` there is `C` such that for every host field `E = E_n(χ, Q)` (two auxiliary primes, one `≡ 3 mod 8` and one
`≡ 7 mod 16`, `n ≥ 2`, `Q` `t`-large):
(a) `Σ_{ℓ odd} log ℓ Σ_{1≤e<t} length Ш⁻(E, ℓ, e) ≤ (N t)^C` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimeSetBoundDataOfPrimitiveChar.lean` (`UpperTheory.V.ThmBcFree`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/OddResidueBounds/ZeroMemUnrHom.lean` (`UpperTheory.V.Odd.PrimeBound`));
(b) `Σ_{ℓ odd, ℓ ∉ B(χ)} log ℓ Σ_{1≤e<t} length Ш¹(E, ℓ, e) ≤ (N t)^C` (follows from [FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/LengthEqAddEigen.lean` (`UpperTheory.V.shaLen_eq_add`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/HeightAndVanishing/LayerLe.lean` (`UpperTheory.V.HV.SumOut`),
`Development/AutomorphicArithmetic/AutomorphicVarieties/PrimeSetBoundDataOfPrimitiveChar.lean` (`UpperTheory.V.ThmBcFree`)).
The route of (b) uses, through 7.1, the following statements, whose routes are not given in full (see there): 3.15(c) (K1′), (K2′); ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, through 3.19(a); 3.20(d), (e) ((P1₄), (pur), (aut), the clause (w2) of (wit) and the maps of (e)); 4.7(iv); the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d); HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d).

*Route.* (a) `E` is an abelian CM field of conductor `N`, contained in `ℚ(μ_N)`, with `[E : ℚ] ≤ N`. For the odd `ℓ ∤ [E : ℚ]`:
BernoulliBoundsForClassGroupEigenspaces §10.1(b), summed over `e < t`, gives at most `t·N·log(16N^{t+1}t!)`. An odd `ℓ | [E : ℚ]` divides
`o_χ` (0.3(b): the odd part of `[E : ℚ]` divides `o_χ`), so there are at most `log₂ o_χ` of them, each at most `o_χ`; for these, 6.5
summed over `e < t` gives at most `C·o_χ·N²·t²·log²(t·o_χ·N)` each. Both are polynomial in `Nt`. (b) For `ℓ ∉ B(χ)`, `ℓ ∤ [E : ℚ]`
(0.3(b)), and `Ш = Ш⁺ ⊕ Ш⁻` for odd `ℓ` (BernoulliBoundsForClassGroupEigenspaces §6.17(f)): 7.1 for the plus part and (a) for the minus part.
*Needs:* 0.3, 6.5, 7.1; BernoulliBoundsForClassGroupEigenspaces §6.17; BernoulliBoundsForClassGroupEigenspaces §10.1.

### 7.4 The window theorem

Let `χ` be primitive, `α, κ ≥ 1` and `0 < δ ≤ 1`. Prove that there are `J ≥ 1`, `C > 0` and `X₀` such that for every `X ≥ X₀` and
every pair `Q = {q, q′}` of primes with `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`, `q, q′ ∤ f_χ`, `q, q′ > 2X^κ + 1 + P(χ)` and
`log q + log q′ ≤ X^{δ/J}`, there is `Y ∈ [X^{1/J}, X^{1/2}]` such that for every `x ∈ [Y, Y²]`, every `n ≥ 2` with `2^n ≤ x^α` and
every `2 ≤ t ≤ x^κ`: the groups `Ш¹(E_n(χ, Q), ℓ, e)`, `ℓ` prime, `1 ≤ e < t`, are finite, and
`V(E_n(χ, Q), t) ≤ (N t)^C + exp(x^δ)`, `N = N_n(χ, Q)`. The route uses, through 7.2 and 7.3, the following statements, whose routes are not given in full (see there): 3.15(c) (K1′), (K2′); ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, through 3.19(a); 3.20(d), (e) ((P1₄), (pur), (aut), the clause (w2) of (wit) and the maps of (e)); 4.7(iv); the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d); 4.5 (model) and (i), (ii) of 4.3 for `𝒟_G`; HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d).

*Route.* Take the window of 2.4 for `M = ℚ(χ)`, `𝔅 = {(ℓ, ℚ(μ_{ℓ f_χ})) : ℓ ∈ B(χ)}` and `δ/2` in place of `δ`, with exponent
`J_{2.4}`, and put `J = 2J_{2.4}`: then `Σ_{q∈Q} log q ≤ X^{δ/J} = X^{(δ/2)/J_{2.4}}` is the hypothesis of 2.4, and its window lies in
`[X^{1/J_{2.4}}, X^{1/2}] ⊂ [X^{1/J}, X^{1/2}]`. Let
`j(ℓ)` be such that `ℚ(μ_{ℓ^{j(ℓ)+1} f_χ})` is the layer of height `j₀(ℚ(μ_{ℓ f_χ}))`. On the window the `2`-part is at most
`exp(x^{δ/2}) log 2` (2.4(a)); the plus part at odd primes is at most `(N t)^C + C exp(x^{δ/2})` by 7.2 with `B = exp(x^{δ/2})`
from 2.4(b); the minus part at odd primes is at most `(N t)^C` by 7.3(a). Since `t ≤ x^κ ≤ X^κ`, `Q` is `t`-large. Finiteness is
BernoulliBoundsForClassGroupEigenspaces §6.17(b). *Needs:* 2.4, 7.2, 7.3; BernoulliBoundsForClassGroupEigenspaces §6.17.

### 7.5 The tower form

For every primitive `χ` and `κ, δ > 0` there are `J` and `k₁` such that for every `k₀ ≥ k₁` some `k ∈ [k₀, J k₀]` satisfies
`V(E_n(χ, ∅), ⌊2^{κn}⌋) ≤ exp(2^{δn})` for every `n ∈ [k, 2k − 2]`. *Status.* This form is the roadmap's own corollary of 7.4,
not on the path of [FormalProof]: the family's main theorems use the window theorem over host fields with two auxiliary primes
only. The route uses, through 7.4, the following statements, whose routes are not given in full (see there): 3.15(c) (K1′), (K2′); ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, through 3.19(a); 3.20(d), (e) ((P1₄), (pur), (aut), the clause (w2) of (wit) and the maps of (e)); 4.7(iv); the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d); 4.5 (model) and (i), (ii) of 4.3 for `𝒟_G`; HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d).

*Route.* Apply 7.4 with `α = 1`, `max(κ, 1)` and `min(δ, 1)/2` to `X = 2^{J k₀}` and `Q = {q, q′}`, `q ≡ 3 mod 8`,
`q′ ≡ 7 mod 16`, both in `(2X^{max(κ,1)} + 1 + P(χ), 4X^{max(κ,1)} + 4P(χ)]`; let `k = ⌈log₂ Y⌉`, so that `2^n ∈ [Y, Y²]` for
`n ∈ [k, 2k − 2]`, and take `x = 2^n`. Restriction from `E_n(χ, ∅)` to `E_n(χ, Q)` is injective on odd parts and loses at most
`2` in length at `ℓ = 2` per twist (BernoulliBoundsForClassGroupEigenspaces §6.17(d)), and `(N t)^C + 2t log 2 ≤ exp(2^{δn})/2` for large `n`.
*Needs:* 0.1(iv), 7.4; BernoulliBoundsForClassGroupEigenspaces §6.17; AnalyticNumberTheoryPartI §0.32 (Siegel–Walfisz, for primes in fixed
classes modulo `16` in ranges `(y, 2y]`).

### 7.6 The budget bound on windows (the consumed form)

Let `χ` be primitive, `0 < ε ≤ 2` and `κ, α ≥ 1`. Prove that there are `J ≥ 1` and `X₀` such that for every `X ≥ X₀` and every
pair of primes `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16` with `q, q′ ∤ f_χ`, `q, q′ > 2X^κ + 1 + P(χ)` and
`log q + log q′ ≤ Y₀^{ε/4}`, where `Y₀ = X^{1/J}`, there is `Y ∈ [Y₀, X^{1/2}]` such that for every `x ∈ [Y, Y²]` and every layer `n ≥ 2`
with `2^n ≤ x^α`, with `E = E_n(χ, {q, q′})` and `t = ⌊x^κ⌋`: every `Ш¹(E, ℓ, e)`, `ℓ` prime and `0 < e < t`, is finite, and
`Σ_ℓ log ℓ · Σ_{0<e<t} length Ш¹(E, ℓ, e) ≤ exp(x^ε)`. Here `Ш¹(E, ℓ, e)` is the group of classes of `H¹(𝒪_E[1/ℓ], ℚ_ℓ/ℤ_ℓ(−e))`
unramified outside `ℓ` and trivial at every place above `ℓ`. `J` depends on `χ, ε, κ, α` only; a layer function `n(x)` with
`n(x) ≥ 2` and `2^{n(x)} ≤ x^α` for all `x ≥ x₁` is an instance after enlarging `X₀` so that `X₀^{1/J} ≥ x₁` (every scale of the
window is `≥ Y₀ ≥ X₀^{1/J}`). The route uses, through 7.4, the following statements, whose routes are not given in full (see there): 3.15(c) (K1′), (K2′); ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16, through 3.19(a); 3.20(d), (e) ((P1₄), (pur), (aut), the clause (w2) of (wit) and the maps of (e)); 4.7(iv); the clauses (w1), (w2) of 3.22(c) and the rank-three seeds 3.22(d); 4.5 (model) and (i), (ii) of 4.3 for `𝒟_G`; HeckeIdealsAndTaylorWilesRelations §§4.2a, 9.9(d).

*The form of the formal proof.* For pairs of the two classes, 7.6 follows from the joint window statement of [FormalProof]
(`UpperTheory.V.JointWin`, `AV/PrimeSetBoundDataOfPrimitiveChar.lean`, with the minus part `UpperTheory.V.ThmBc` there), which is
stated for `0 < ε < 1/52`, with the term `exp(x^{4ε/5})` in place of the `exp(x^δ)` of 7.4, and allows every `κ ≥ 1` and every layer
`n ≥ 2` with `2^n ≤ x^α` at each scale of the window; the headline of [FormalProof] (`UpperTheory.Top.VWin`,
`src/Development/AutomorphicArithmetic/CharacterBoxes/ExistsPageN.lean`, deduced from the joint window statement in
`AV/CMFieldExponentialBounds/AdmissibleOfPageN.lean`) is the narrower case `0 < ε < 1/52`, `t = ⌊x^{401}⌋` and one layer per
scale, with the bound `exp(x^ε/2)`. [FormalProof] obtains this form from two statements that it also proves: the Galois
representations of regular algebraic polarized cuspidal representations over CM fields in the form of
BaseChangeAndGaloisRepresentationsForUnitaryGroups §14.1, the one hypothesis of its theorem for the window bound, and weak base
change from the standard definite unitary group in the form recorded at BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1,
which that theorem takes from the proof's own theorem ([FormalProof],
`Development/AutomorphicArithmetic/AutomorphicVarieties/ModularityArgument/ThresholdArguments/DenseThresholdCases/VwinOfRow.lean`
(`UpperTheory.One.vwin_of_row`),
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/IntegralStructures/RowSrc.lean`
(`UpperTheory.Gal.Int.galoisLocalGlobalStrong_recParameter`),
`Development/AutomorphicArithmetic/Foundations/BaseChangeIdentities/DefiniteNHolds.lean`
(`UpperTheory.BaseChangeIdentities.baseChangeN`)).

*Route.* 7.4 with `α`, `κ` and `δ = ε/2 ≤ 1`, and `J = J_{7.4}`: then `log q + log q′ ≤ X^{ε/(4J)} ≤ X^{δ/J}`, and the size of `q, q′`
makes `{q, q′}` `t`-large. On the window `x ≥ Y₀`, so `log N ≤ (n + 2) log 2 + log f_χ + log q + log q′ ≤ x^{ε/4} + (α + 1) log x + c`,
and `(N t)^C + exp(x^{ε/2}) ≤ exp(x^ε)` for large `X`. *Needs:* 7.4.

**Checks.**

- The sizes used downstream are an instance: the consumer's layer `n(x)`, with `c(ψ)·2^{n(x)} ∈ [x^{A_n}, 2x^{A_n}]` for a constant
  `c(ψ) > 0`, has `2^{n(x)} ≤ x^{A_n+1}` and `n(x) ≥ 2` for large `x` (so `α = A_n + 1`); `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16`,
  `log q ∈ (Y₀^{ε/5}/2, Y₀^{ε/5}]`, `log q′ ∈ (Y₀^{ε/5} log² Y₀/2, Y₀^{ε/5} log² Y₀]`: then `log q + log q′ ≤ Y₀^{ε/4}` and
  `q > 2X^κ + 1 + P(χ)` for large `X`.
- `J ≥ 1` is part of the statement: with `J = 0` the condition `log q + log q′ ≤ Y₀^{ε/4}` would read `log q + log q′ ≤ 1` under the
  convention `X^{1/0} = 1`, and no pair satisfies it.
- No function satisfies `n(x) ≥ 2` and `2^{n(x)} ≤ x^α` for all `x > 0` (`x^α < 4` for small `x`): the layers are quantified at each
  scale, as in 7.4. The bound `ε ≤ 2` is what `δ = ε/2 ≤ 1` in 7.4 requires; for larger `ε` the conclusion follows from `ε = 2` only
  under the stronger size condition `log q + log q′ ≤ Y₀^{1/2}`.

### Examples

- The sizes used by the consumers are an instance of 7.6: a layer `n(x)` with `c(ψ)·2^{n(x)} ∈ [x^{A_n}, 2x^{A_n}]` has `2^{n(x)} ≤ x^{A_n+1}` (so `α = A_n + 1`), and `q ≡ 3 mod 8`, `q′ ≡ 7 mod 16` are the classes of 7.6 (7.6).
- With `J = 0` the size condition of 7.6 would read `log q + log q′ ≤ 1` and no pair would satisfy it (7.6).

### Dependencies

Layers 0, 2, 5 and 6 above. From this family: BernoulliBoundsForClassGroupEigenspaces. Other roadmaps: AnalyticNumberTheoryPartI.

## Downstream consumers

CongruenceModulesOfThetaLifts and ThetaChainsAndFrobeniusPrimeSums consume 7.6, the budget form of the window theorem 7.4: the first in the insertion of the wild-kernel bound into the congruence bound (CongruenceModulesOfThetaLifts §7.11), the second in its host supply (ThetaChainsAndFrobeniusPrimeSums §10.7), with `κ = C_t`, `α = A_n + 1`, a small `ε ≤ 2` (so
`δ = ε/2` in 7.4), and the layer `n = n(x)` of its layer function at each scale `x` of the window, which satisfies `n(x) ≥ 2` and
`2^{n(x)} ≤ x^{A_n + 1}` for large `x`. At every scale of the window the total
`Σ_ℓ log ℓ Σ_{0<e<t} length Ш¹(E, ℓ, e)` is at most the budget `exp(x^ε)`, and the consumer's arithmetic accepts
`exp(x^ε) x^{O(ε)}`. The local condition at `ℓ` is the same on both sides: classes unramified outside `ℓ` and trivial at every
place above `ℓ`. The route of 7.6 uses every target of Layers 0–7 through 7.4, and the suppliers of their contracts, among them FrobeniusRestrictedRieszSums §0.4, BernoulliBoundsForClassGroupEigenspaces §§6.17,
6.18, 9.7, BernoulliBoundsForClassGroupEigenspaces §10.1, ReducibilityIdealsAndUltrafilterPatching §§4.8, 4.9, 6.10–6.16, BernoulliBoundsForClassGroupEigenspaces §11.1,
HeckeIdealsAndTaylorWilesRelations §10.1, PotentialAutomorphyInfrastructurePartII §§0.8, 0.9, 7.5 and HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a, 9.9 (with BaseChangeAndGaloisRepresentationsForUnitaryGroups §16.1, the Galois representations of definite unitary groups, behind HeckeIdealsAndTaylorWilesRelations §3.13a), ModularityAndLanglandsExtensions §2.43
and BernoulliBoundsForClassGroupEigenspaces §§13.1, 14.1. Among the statements its route uses, these are theorems of [FormalProof] whose routes are not given in full here: 3.15(c) (K1′), (K2′)
(the Selmer counts of the patching argument), ReducibilityIdealsAndUltrafilterPatching §§6.15, 6.16 (the weight-zero part of a
weighted presentation and the rescaling ring, through the space of symplectic residual lattices 3.19(a)), 3.20(d) and (e) (the
seeds, and the clauses (P1₄), (pur), (aut), the clause (w2) of (wit) and the maps of the Hecke ideals of rank four), the
clauses (w1), (w2) of 3.22(c) (automorphy of the rank-two seeds) and the rank-three seeds 3.22(d), 4.7(iv) (the clauses (w1),
(w2) under twist and restriction), 4.5 (model) and (i), (ii) of 4.3 for
`𝒟_G` (the Eisenstein problem relative to the Gaussian field), and HeckeIdealsAndTaylorWilesRelations §4.2a (automorphic
patching data at a reducible residual determinant) and §9.9(d) (adjoint vanishing at regular elements).

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns: the case split of the dyadic host fields (Layer 0); the twisted control
theorem 1.1 for cyclotomic towers, the explicit Iwasawa-theoretic twist bounds, the pigeonhole on scales and the window
selection (Layers 1–2); the polynomial count of regular algebraic cuspidal representations of `GL_n` over totally real
and CM fields by level and weight (3.1), global congruence integers for families and the separation of automorphic
traces from Eisenstein traces (3.2), the application of the graded cotangent bound to deformation models graded by a
torus modulo a corank-one subtorus (3.3), Selmer groups as tangent vectors (3.4), and the Bernoulli units of characters
of large `2`-power conductor (3.5); and the machinery of residually reducible automorphy lifting for sums of characters
exchanged by a polarization, without Steinberg places (3.6, 3.11–3.23), whose commutative algebra (determinantal sections,
`ℤ/2`-graded algebras with a determinantal presentation, propagation along components, limit groups and patching up to an
element, weighted presentations) is ReducibilityIdealsAndUltrafilterPatching §§6.10–6.16. By content the machinery falls into four parts. (i) Deformation theory: the torus-equivariant
form of the framed presentation of GlobalGaloisDeformations §3.7 without the Schur hypothesis (3.6) and the passage to
normalized graded models (3.18), which extend GlobalGaloisDeformations; ordinarity from Weil–Deligne data, a corollary of
PadicHodgeTheory §3.6, and from relations (3.17). (ii) Theorems about polarized sums of characters of CM fields and about
symplectic lattices over totally real fields: the ordinary deformation spaces in ranks two and three with their block loci
and residual lattices (3.11–3.13), frames on the cyclotomic `ℤ_ℓ`-tower and relative to the Gaussian field (3.14, 3.21),
patching at dimension-one primes and its conditions at nice primes (3.15–3.16), and the spaces of symplectic residual
lattices with their towers, chains, seeds and Hecke ideals (3.19–3.20); these are the residually reducible analogues, for constituents
exchanged by the polarization, of PotentialAutomorphyInfrastructurePartII Layers 7–8. (iii) Cusp forms congruent to Eisenstein
series with an auxiliary character of order `ℓ` (3.22), the producer of the seeds of Case III and of the rank-two seeds, which
generalizes the prime-level
congruence of CyclotomicClassGroupsAndStickelberger §4.2. (iv) The conjugate-norm twist of an imaginary quadratic field (3.23),
ramified at the primes of the discriminant, which the characters with prescribed conjugate norm of
PotentialAutomorphyInfrastructurePartII §0.11 do not provide (their prescribed places are unramified over the totally real
subfield). It owns the three residually reducible
Eisenstein deformation problems with their finiteness, automorphy, shapes, rigidity and levels (Layer 4), including the
level theorem 4.8(0); the inequality `h(ℚ(√ℓ)) < ℓ` used in Case Z (5.1); the counting cases of the plus part
(Layers 5–6); the minus part of abelian CM fields at the odd primes dividing the degree (6.5); and the assembly (Layer 7).

It does not own: the dyadic host fields (FrobeniusRestrictedRieszSums §0.4); the groups `Ш¹(F, ℓ, e)`, their duality with étale wild kernels, the total `V(F, t)`, the plus/minus
and character decompositions (BernoulliBoundsForClassGroupEigenspaces §§6.17, 6.18); the explicit torsion
bound of Soulé type (BernoulliBoundsForClassGroupEigenspaces Layer 9); Sha kernels with divisible coefficients and their duality
(HeckeIdealsAndTaylorWilesRelations §10.1); Ferrero–Washington, ranks in cyclotomic towers and their growth in extensions of degree
`ℓ`, and the twisted coinvariants of Iwasawa modules (IntegralIwasawaTheory §§3.4, 5.6, 10.5 and BernoulliBoundsForClassGroupEigenspaces §11.1); Koszul Euler characteristics, orders on modules
finite over the coefficient ring, graded algebras with a torus-fixed point, the graded cotangent bound, patching of rings
and modules and connectedness dimension, determinantal sections, `ℤ/2`-graded algebras with a determinantal presentation,
propagation along components, limit groups and patching up to an element, weighted presentations and their graded parts
(ReducibilityIdealsAndUltrafilterPatching §§3.16, 3.17, 4.8, 4.9, 6.10–6.16 and DeformationAndDerivedPatchingAlgebra §§5.3–5.6, 6.1, 6.4, 6.6);
local deformation problems (LocalGaloisDeformationRings); determinants, Cayley–Hamilton algebras and reducibility ideals
(IntegralHeckeAndGaloisDeterminants Layer 1); ordinary Hida theory on definite unitary groups, also at Eisenstein maximal
ideals in determinant form, with its patching data, soluble descent and adjoint Selmer vanishing
(PotentialAutomorphyInfrastructurePartII, with HeckeIdealsAndTaylorWilesRelations §§3.13a, 4.2a, 9.9; ModularityAndLanglandsExtensions §4.1); Kato's Euler
system (KatoEulerSystems §§4.1, 7.9 and BernoulliBoundsForClassGroupEigenspaces §§13.1, 14.1, the latter in the instance that
[FormalProof] proves under the hypotheses listed there, compared with the points in 4.3(iii)); Galois representations and
local–global compatibility (AutomorphicGaloisRepresentationsPartII), with the irreducibility input of its comparison at `ℓ`
(ModularityAndLanglandsExtensions §2.43); the Bloch–Kato local conditions, their dimension and their orthogonality
(SelmerIwasawaCohomology §4.9); the Jacquet–Shalika bound (AutomorphicLFunctionsAndLocalFactors AL.3.3.8); the classification of generic
representations by segments (SmoothRepresentationsOfLocalGroups SR.5.2); the minus part of abelian fields by Bernoulli
numbers (BernoulliBoundsForClassGroupEigenspaces §10.1); the class-number bounds of number fields through divisor sums (ExplicitNumberFields §§0.3, 5.3). Washington's theorem on the prime-to-`p` part of class numbers in a
cyclotomic `ℤ_p`-tower is not used. Towers at an odd tower prime are not treated. The routes use purity of Frobenius
eigenvalues only through the temperedness of the local components above `ℓ` of regular algebraic conjugate self-dual cuspidal
representations over CM fields (AutomorphicGaloisRepresentationsPartII AG2.5, *Temperedness of regular unitary-type cuspidal
forms*), in the free ratios of 3.20(f) and 4.4; elsewhere the Jacquet–Shalika bound replaces it, and the weak purity of
pro-modular points in 4.4 comes from the Hecke side. They consume local–global compatibility away from `ℓ` (AutomorphicGaloisRepresentationsPartII
AG2.5, *Caraiani's full away-prime compatibility*) in 4.8, and at the places above `ℓ` (AG2.6, *Polarized coefficient-prime
domination*, *Full polarized local–global compatibility at `ℓ`*, *Totally real polarized coefficient-prime descent*, whose
hypothesis `ExtremelyRegularIrreducibility n` ModularityAndLanglandsExtensions §2.43 proves for every `n ≥ 2`) in 3.20(f), 4.2(d),
4.4 and 4.8.

## Exact supplier contracts

### From FrobeniusRestrictedRieszSums, a sub-roadmap of this family

§0.4 (the dyadic host fields `E_n(M, Q)`, the integers `N_n(M, Q)` and the subgroups `H_n(M, Q)`, with its API (a)–(f)), in 0.1 and through it in every target that uses host fields.

### From Mathlib

`DirichletCharacter` with conductor, primitivity and products; `ZMod.chineseRemainder`; `IsCyclotomicExtension`, `IntermediateField.fixedField`, `NumberField.IsCMField`; `NumberField.classNumber`, `NumberField.exists_ideal_in_class_of_norm_le`; `Module.length`; `PadicInt`, `Padic`; `Matrix.det`; `Algebra.norm`; `GradedAlgebra`; `MvPowerSeries`; `PrimeSpectrum`, `irreducibleComponents`, `IsPreconnected`; `Ultrafilter`, `ProfiniteGrp`; Nakayama's lemma; `Ideal.iInf_pow_eq_bot_of_isLocalRing` (Krull's intersection theorem, in 3.18(c)).

### From BernoulliBoundsForClassGroupEigenspaces, a sub-roadmap of this family

Additions to ArithmeticKTheory: §6.17: the group `Ш¹(F, ℓ, e)` (classes unramified outside `ℓ`, trivial above `ℓ`), its finiteness and its duality with the cohomological wild kernel (equality of lengths) for `ℓ` odd or `F` totally imaginary; `length Ш¹ ≤ length H²(𝒪_F[1/ℓ], ℤ_ℓ(e+1))` under the same hypothesis (in general up to `r₁(F)`); restriction kernels (zero for Galois extensions of degree prime to `ℓ`, length at most one for a quadratic extension); the total `V(F, t)`; the plus/minus decomposition for CM fields and odd `ℓ`. §6.18: component groups `Ш_{ψ,e}(S)`; their independence of the primes added to `S` at which `ψ` is unramified on inertia up to order prime to `ℓ` (a); the bound `length Ш^±(F, ℓ, e) ≤ Σ_ψ V_ℓ(ψ, e)` for abelian CM `F`, `ℓ` odd and `ℓ ∤ [F:ℚ]`, the form used in 5.5(b) (equality is a remark there); the bound with defect for `ℓ | [F:ℚ]`; going up to an abelian overfield `L`, with the conductor of `L` in the local term. §9.7: for totally complex `L ⊇ μ_ℓ` (`μ₄` if `ℓ = 2`) and `e ≥ 1`, `log #H²(𝒪_L[1/ℓ], ℤ_ℓ(e+1)) ≤ exp((2e[L:ℚ])^{C_K} log(2|d_L|))`, `C_K` absolute.

§10.1, an addition to EulerSystemsCyclotomicMainConjecture: for an abelian CM field `E` of conductor `N` and degree `n` and `e ≥ 1`, (b) `Σ_{ℓ odd, ℓ ∤ n} log ℓ · length Ш⁻(E, ℓ, e) ≤ n log(16N^{e+2}(e + 1)!)`, from the per-character bound (a) by generalized Bernoulli numbers; in 7.3(a).

§11.1, an addition to IntegralIwasawaTheory: for a cyclic extension `A′/A` of degree `ℓ` of fields containing the cyclotomic `ℤ_ℓ`-extension, ramified only at a finite set `P` of places prime to `ℓ`, `rank_ℓ X(A′) ≤ ℓ (rank_ℓ X(A) + #P)`; used at `ℓ = 2` (the fields totally imaginary), iterated over the two quadratic steps of 2.3 from `A_0 = M(i)(μ_{2^∞})`, with the value `4(rank₂ X(A_0) + 6[M : ℚ])`.

§§13.1, 14.1, additions to KatoEulerSystems: §13.1: if `V_λ(f)` restricted to the decomposition group `G_{ℚ_p}` is reducible, the quaternion algebra of the inner twists splits at `λ₀` and `(f, λ)` is admissible over every abelian field; used for a non-CM `f` ordinary at `ℓ`. §14.1: for a newform `f` of weight `k ≥ 2`, `(f, λ)` admissible over an abelian field `K′`, and `1 ≤ r ≤ k − 1` with `r ≠ k/2`: `H¹_f(K′, V_λ(f)(r)) = 0`; used with `k = 2e + 1`, `r = e`, `K′ = K` and the twist by `η_K`, an instance that [FormalProof] proves under the hypotheses listed there, compared with the points in 4.3(iii).

### From TauCetiRoadmap.ArithmeticKTheory

§7.4 and §7.5 (`K₄(ℤ) = 0`) for Checks.

### From HeckeIdealsAndTaylorWilesRelations, a sub-roadmap of this family

§10.1, an addition to ArithmeticGaloisDuality: `Ш¹_{S;Σ}(F, W)` and `Ш²_S(F, T)` for a `ℤ_p`-lattice `T`, `W = V/T`, their lengths in `ℕ∞`, limits, and the duality of `Ш²_S(F, T)` with `Ш¹_S(F, T^D)`.

Additions to PotentialAutomorphyInfrastructurePartII: §3.13a (the universal ordinary determinant ring `B` of a residual sum of pairwise distinct characters, with an auxiliary place `v₀` of prime norm, which exists when the residual pair is an ordinary determinant, and the ideal `J`, kernel of the surjection from `B` onto the big ordinary Hecke algebra of the definite unitary group at the corresponding Eisenstein maximal ideal, with `B/J` finite, torsion-free and reduced over `Λ`, the ordinary relations, density of points with distinct inertial characters, the decomposition of arithmetic points into twisted pieces `ρ′_i ⊗ χ_ℓ^{−j}` with `ρ′_i` continuous, and weak purity at almost all places under the one fixed `ι : ℚ̄_ℓ ≅ ℂ` when all multiplicities are one, classicality of irreducible arithmetic points, (f) for `2 ≤ n ≤ 4` automorphic points as points of `V(J)`, automorphy including the clauses (w1), (w2) (seeds as points), and (g) the stability of `J` under twists by characters `γ ≡ 1` with `γ(cgc⁻¹)γ(g) = 1`, trivial on the inertia groups at `S_t` and at `v₀` and on the prescribed torsion), in 3.15, 3.16, 3.20 ((g) in (inv) of (e)), 3.22, 4.2, 4.4, 4.5; §4.2a (automorphic patching data of `J` at every Taylor–Wiles datum, the datum being elements `σ_j` and, at each level, places above pairwise distinct places of `L⁺` whose Frobenius elements agree with the `σ_j` on the residual characters and converge to them in a quotient of `G_{L⁺,S}`: a base module, lifts of the residual eigenvalues and an exponent `e` (one may take `e = n!`) given per datum, algebras `R_N` carrying an ordinary determinant (not necessarily the universal ones), patching modules free of finite rank, possibly depending on the level, over the group rings of the diamond operators, comparison maps with composites `f`, and `(f·tr_{D_N}(h·r))^e` killing the patching module for the two kinds of Taylor–Wiles elements `r`; the route of the existence of the level modules and of the two maps is not given there), in 3.15, 3.20, 4.2, 4.5; §9.9: (a) `H¹_f(F⁺, ad r) = 0` at automorphic points of rank two or three over imaginary CM fields irreducible on every open subgroup of `G_F`; (b) `H¹_f(ℚ, 𝔰𝔭₄(ρ)) = 0` for `ρ : G_ℚ → GSp₄` irreducible on every open subgroup of `G_ℚ` and automorphic over an imaginary quadratic field; (c) `H¹_f(ℚ, ad W) = 0` for a two-dimensional `W` of `G_ℚ` with `det W` the character of an imaginary quadratic field `F` and `W|_{G_F}` as in (a); (d) (its route is not given there): for `p` odd, `H¹_f(L⁺, ad ρ) = 0` for `L` a CM field with `L/L⁺` unramified at the finite places, `μ_p ⊄ L` and every place of `L⁺` above `p` split in `L`, `ρ` (rank `n` with `2 ≤ n ≤ 4`) attached to a regular algebraic conjugate self-dual cuspidal representation, automorphic in the sense of §3.13a(f) with its clauses (w1), (w2), unramified outside a finite set of places split in `L`, trivial on the inertia elements at those places prime to `p` at which the residual characters are trivial, unramified at an auxiliary place `v₀` of prime norm at which the residual characters agree, are unramified and `Nv₀ ≢ 1 mod p`, ordinary with distinct cyclotomic exponents at each place above `p` (which may depend on the place), residually a sum of pairwise distinct characters, with an element of free ratios in a decomposition group above `p` in the kernel of the cyclotomic character, absolutely irreducible on `G_{L(μ_{p^∞})}`, and with regular semisimple elements in every nonempty open subset of `G_{L(μ_{p^∞})}`, in 4.7(i); (d′) (a statement of that roadmap, resting on (d)) under the hypotheses of (d), if moreover the cyclotomic exponents differ by at least `2` at each place above `p`, every point derivation of the universal ordinary determinant ring at the point of `ρ` vanishing on the weight algebra is zero and every prime contained in the kernel of that point contains the Hecke ideal, in 3.20(e)(seed).

### From TauCetiRoadmap.ArithmeticGaloisDuality

R02.1.3 (lattices, rational and torsion coefficients). R02.3.3 (*The Kummer sequence for S-units*, in step (4) of 6.5). R02.4.3 (Poitou–Tate at finite level). D7.7 (dual local conditions with torsion coefficients). R02.4.2 (local Tate duality and the local Euler characteristic, in 4.1 (local chart) and 3.15(c)). R02.4.4 (finiteness, cohomological dimension and Tate's global Euler characteristic formula, in 3.15(c)). R02.5.1 (the Greenberg–Wiles formula, from which the Euler characteristic counts of 3.11, 3.14, 3.18, 3.19, 3.20(b), (c), 3.21, 4.1, 4.4 and the counts of 3.15 follow).

### From TauCetiRoadmap.IntegralIwasawaTheory

§§0.1–0.3 (cyclotomic towers); §3.4 (`μ = 0` iff bounded `p`-rank iff `X` finitely generated over `ℤ_p`); §3.5 (`X′ = X/D_∞`); §4.1a (the `ℓ`-adic logarithm, for the Check of 1.3); §5.6 (`ferreroWashington`, used as bounded `ℓ`-rank on every layer); §10.5 (`twistedRamified_coinvariants`: for `E ⊇ μ_{2p}` and `n ≠ 0` the dual of `𝔛_S(E_∞)(−n)_Γ` is `H¹(𝒪_{E,S}, ℚ_p/ℤ_p(n))`).

### From ReducibilityIdealsAndUltrafilterPatching, a sub-roadmap of this family

Additions to DeformationAndDerivedPatchingAlgebra: §4.8: graded local algebras with a torus-fixed point, cotangent lattices `cot_j`, graded smooth points (whose two chart conditions 3.18 uses for weighted presentations by any grading group), two-signed points, and the derivation bound (3), in the form of the formal proof: for a discrete valuation ring `O` with finite residue field, an `O`-algebra map `x : A → O` killing `A_j`, `F ⊆ A_j`, `c ∈ O ∖ {0}` and an `O`-module `M` with an injective additive map `D : M → Hom_O(A, O/c)` whose values kill `F` and are reductions modulo `c` of `O`-valued point derivations of weight `j` at `x`, `length_O M ≤ cotLen_j(F)` (in 3.4, with `c = b`, `M = 𝒮` and `D` `O`-linear; the residue field of `O` is finite there). §4.9(1): under (M1)–(M5), the two-signed points form finitely many orbits and `cotLen_{−1}(F) ≤ 2 Σ_ξ v(ξ(a))`; (M3) there is the disjunction "no negative-zero non-positive-zero point, or no positive-zero non-negative-zero point, over the same point of `Spec A₀`" (in 3.3). §6.10: the radical of the generic determinantal ideal is prime of height at most `g + 1` (the form of the formal proof); for a complete discrete valuation ring `O`, `a ≥ b ≥ 0`, `f₁, …, f_b` and a `(g + 1) × (g + 1)` matrix `M` over the maximal ideal of `O[[X₁, …, X_a, Y₀, …, Y_g]]`, the determinantal section `(f, M·Y, det M)` is chained in dimension `a − b` ("chained in dimension `D`": `c ≥ D` and every minimal prime of dimension `≥ D + 1`), in 3.12; the notion also in 3.19. §6.11: in a finite `ℤ/2`-graded algebra `B ⊕ N` with a determinantal presentation, a prime of `B` not containing the ideal generated by the products of two elements of `N`, of dimension `≥ 1 + D₀`, lies in every prime of the support of `N` (and the case `N = 0`), in 3.15. §6.12: propagation along components, local (with `D₁ ≥ 0`) and global, in 4.2 and 4.5. §§6.14–6.16: the coordinate grading of a ring with weighted coordinates, the graded part of a weighted presentation (its weight-zero part a coefficient ring, the graded pieces finite over it, homomorphisms determined by the variables) and the rescaling ring of an artinian coefficient ring, in 3.19(a). §6.13: the limit group of an ultrafilter for a topologically finitely generated profinite group with surjections onto the `Γ_N` (for a nonprincipal ultrafilter, the limits of lifts of `φ_N`, `τ_N` with `φ_N^{−1}τ_Nφ_N = τ_N^{q_N}`, `q_N` positive integers `≡ 1 mod ℓ^N` and `τ_N` in a closed pro-`ℓ` subgroup, commute in the limit group); for a nonprincipal ultrafilter, modules `M_N` free modulo each truncation `(𝔪_Λ^j, (σ)^k)` for almost all `N` (ranks not bounded), maps with composites `f` and relations holding up to `𝔪_R^j`, a finite module `𝕄` over the `(σ)`-adic completion `𝔹` of `R[1/f]` with `σ` quasi-regular, `𝕄/(σ)𝕄 ≅ 𝔹 ⊗_R 𝒳` and `𝔦𝔹 ⊆ √(Ann_𝔹 𝕄)`; and (dim) (with equality), (fib), (move) (with the inclusion of the lifted thick prime in `q_{i+1}` in the patching ring as its hypothesis), in 3.15.

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§6.6 (connectedness dimension `c` and the bound `c(A/I) ≥ c(A) − ara(I) − 1` for complete local `A`), in 3.19.

### From TauCetiRoadmap.LocalGaloisDeformationRings

§§F.0.2, F.2.3, F.2.6, F.3.1, 1.4 (minimal relative presentations, the universal and framed lifting rings, local deformation problems, tangent and obstruction spaces), in 3.6; §1.3 (the universal rings of the characters on inertia), in 3.11 and 3.19; §§1.7, 1.9 (ordinary representations and the ordinary flag scheme), in 3.11, 4.1 and 4.4 (local chart).

### From TauCetiRoadmap.GlobalGaloisDeformations

§3.7 (presentation of the framed global ring over the local rings by the relative tangent space, with kernel bounded by the obstruction space; the Schur hypothesis only in the identification with a dual Selmer group) and §8.4 (the polarized case), in 3.6; §§8.3–8.4 (tangent and obstruction spaces and presentations of polarized problems), in 3.11 and 3.19; §4.5 (diagonalizable groups on complete local algebras) in 3.6 and 4.4 (local chart); §4.6 (quotients by free actions of formally smooth groups) in 3.18.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII

§0.1 (ordinary representations), §0.8 (automorphy is invariant under algebraic twists, in 3.20(d), (e) and 4.7(i)), §0.9 (soluble base change and descent of polarized automorphy, for `r|_{G_M}` irreducible, `M` CM or totally real, used with `F = ℚ` in the outline of 3.20(e), in 3.22(c) and 4.7(i), and in the outline of 3.20(d)), §2.1 (the group `𝒢_n`), §2.2 (the determinant subring), §§3.8–3.13 (Iwahori levels, the big ordinary Hecke algebra, Hida classicality, the `Λ`-adic Galois representation at non-Eisenstein maximal ideals); §7.5 (restriction of pseudodeformations to a subgroup of finite index is finite), in 3.20(e); §9.1 (generic Galois representations; a `ρ` whose Frobenius-semisimplified Weil–Deligne representation is `rec^T` of a generic representation is generic; genericity descends from a finite extension), §9.2 (`H¹_f = H¹_g` at generic places), §9.3 (the adjoint Bloch–Kato Selmer group of a conjugate self-dual representation), §9.8 (ordinary tangent vectors of trivial weight lie in `H¹_g`). The forms of §0.9 that [FormalProof] uses are: a cuspidal representation of `GL₂` over an imaginary quadratic field whose infinitesimal character at each embedding is regular of the form `{a, a + k}`, `k ≥ 2` an integer, and which is unramified with the same Satake parameter at the places above each of almost all primes, descends to a cuspidal representation of `GL₂(𝔸_ℚ)` with the same Satake parameters at almost all places of degree one and that infinitesimal character; a regular algebraic cuspidal representation of `GL₂` over a totally real field `F` has a cuspidal base change to a totally complex quadratic extension, with the same infinitesimal character and the same components at the places that split, unless it is isomorphic to its twist by the character of the extension; for a Galois extension of prime degree of totally complex fields and `GL_n`, `n ≥ 1`: base change of cuspidal representations with regular infinitesimal character unless they are isomorphic to a twist by a character of the extension, descent of those invariant at almost all places, and two cuspidal representations with the same cuspidal base change differ by such a character at almost all places.

### From TauCetiRoadmap.SelmerIwasawaCohomology

§4.9 (the Bloch–Kato local condition `H¹_f` for de Rham representations of the Galois group of a finite extension of `ℚ_p`: the dimension formula `dim H¹_f = dim H⁰ + dim D_dR/Fil⁰` and the exact orthogonality of `H¹_f(V)` and `H¹_f(V^*(1))` under local Tate duality), in 4.1 (local chart).

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

§2.43 (irreducibility of `r_{ℓ,ι}(π)` for a density-one set of `ℓ`, for `π` a regular algebraic polarizable cuspidal representation of `GL_n` over a CM field, of extremely regular weight, which proves AutomorphicGaloisRepresentationsPartII AG2.6's `ExtremelyRegularIrreducibility n` for every `n ≥ 2`), in 3.20(f), 4.2(d), 4.4 and 4.8.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

AG2.0 (*Rationality of the good Hecke polynomials*; the Hodge–Tate multiset attached to a weight; polarizable representations, (iv) of its definition, in 5.7; the `ℓ`-adic character of an algebraic Hecke character, in 3.16 and 3.23); AG2.2 (*Twisting an essentially self-dual form into unitary type*); AG2.3 (*Arbitrary regular conjugate-self-dual existence*, with compatibility at the good places); AG2.5 (*Caraiani's full away-prime compatibility*: `WD(r|_{G_{L_v}})^{F-ss} ≅ ι⁻¹rec(π_v|det|^{(1−n)/2})`, including the monodromy, at every `v ∤ ℓ`; *Temperedness of regular unitary-type cuspidal forms*: a regular algebraic conjugate self-dual cuspidal representation of `GL_n` over a CM field is tempered at every finite place, in 3.20(f) and 4.4); AG2.6, each under `ExtremelyRegularIrreducibility m`, which ModularityAndLanglandsExtensions §2.43 proves for every `m ≥ 2`: *Polarized coefficient-prime domination* (at `v | ℓ` the semisimplified Weil representations of `WD(r|_{G_{F_v}})` and of `rec(Π_v|det|^{(1−m)/2})` agree), in 3.20(f), 4.4 and 4.8(0); *Full polarized local–global compatibility at `ℓ`* (`WD(r|_{G_{F_v}})^{F-ss} ≅ ι⁻¹rec(Π_v|det|^{(1−n)/2})` with monodromy, for the polarized branch), in 4.2(d) and 4.4; *Totally real polarized coefficient-prime descent* (the same comparison for regular algebraic essentially self-dual cuspidal representations over totally real fields, `GL₂(𝔸_ℚ)` included), in 4.8(a).

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

AL.3.3.8 (the Jacquet–Shalika bound: the normalized Satake parameters of a unitary generic unramified local component lie strictly between `q^{−1/2}` and `q^{1/2}` in absolute value).

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

SR.1.4 (Iwahori decompositions), SR.2.1 (smooth induction), SR.2.2 (Jacquet functors and Jacquet's lemma), SR.2.3 (Jacquet's lemma on invariants, Iwahori invariants); SR.5.2, *modular-generic-segments* (a product of pairwise unlinked segments is irreducible and generic, and every generic irreducible representation is such a product); all in 4.8(0).

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§7.4 (polarized representations, `𝒢_n` and oddness), for the equivalence of the two descriptions of `𝒟` in 4.1.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

ALS.1.5 (Betti cohomology as group cohomology); ALS.2.4 (finite triangulation at a neat level, with free lifting to smaller normal levels); ALS.5b.5 (cuspidal cohomology injects into Betti cohomology); ALS.5b.6 (for `F` totally real or CM, regular algebraic cuspidal representations of `GL_n` contribute to cohomology).

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§§5.2, 5.5 (regular algebraic representations and Clozel's purity of the infinity type).

### From TauCetiRoadmap.RepresentationTheory

LieHighestWeight Layer 6 (the Weyl character and dimension formulas); ClassicalGroups Layer 5 (the Weyl dimension formula for `GL_n`).

### From TauCetiRoadmap.IntegralHeckeAndGaloisDeterminants

§§1.1, 1.3, 1.4 (Cayley–Hamilton algebras, Henselian lifting and generalized matrix algebras, reducibility ideals), in 3.11, 3.15 and 4.1.

### From TauCetiRoadmap.PadicHodgeTheory

§3.6 (for crystalline `V` of the prescribed Hodge type, ordinarity is equivalent to the valuations of the crystalline Frobenius lying on the Hodge polygon; a de Rham regular ordinary restriction to a finite extension descends); §§5.1, 5.3 (de Rham representations, potentially semistable periods and the Weil–Deligne representation); in 3.17(a).

### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa

§F.6 (`deRham_iff_potentiallySemistable`), in 3.17(a).

### From TauCetiRoadmap.PadicFamilies

§§1.7, 1.8, 1.8a, 1.9, 4.1 (congruence modules, Hida families and the big Galois representation), for the seeds of 4.2 and of 3.22(c).

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

R17.4.13 (the Gelbart–Jacquet lift), for the seeds of 4.2. R17.6.4 (Frobenius-semisimple Weil–Deligne compatibility, with monodromy, away from `ℓ` for newforms), in 4.8(a).

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

§6.26 (cyclic automorphic induction for `GL_n`, Arthur–Clozel), for the seeds of both cases in the outline of 3.20(d).

### From TauCetiRoadmap.ModularForms

Layer 0 (character Eisenstein series, their coefficients `Σ_{d | n} χ(d)d^{k−1}`, the constant term at `∞` and the decomposition into Eisenstein and cusp spaces; in weight at least three through its Tau Ceti contract), in 3.22(a); the constant terms at the other cusps are 3.22(a).

### From TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights

§1.2 (cusp forms and the cusp ideal), §2.10 (diamond operators on coherent cohomology), §2.15 (the equivariant cuspidal sequence `0 → ω^n(−C) → ω^n → ω^n|_C → 0` and its cohomology), Layer 2 (integral `q`-expansions and integral Hecke operators on the lattice of integral cusp forms) and §5.10 (Deligne–Serre eigenvalue lifting: if commuting operators on a finite free module over a discrete valuation ring have a nonzero common eigenvector modulo the maximal ideal, there is a nonzero common eigenvector over a discrete valuation ring of a finite extension of the fraction field, dominating the given one, whose eigenvalues reduce to the residual ones; the eigenvector need not reduce to the residual one), in 3.22(b).

### From TauCetiRoadmap.ClassFieldTheory

Layer 4 (the transfer corresponds to the inclusion of ground levels), Layer 5 (local Tate duality and the local Euler characteristic for finite modules, in 3.15(c)), Layer 7 (the absolute local Artin map, on units in 3.11, 3.14, 3.19, 3.20(e) and 3.23, and in 3.15(c)), Layer 11 (global Artin reciprocity, for the Hecke characters of 3.20(d₂), (e) and 3.23), §13.1 (`kroneckerWeber` with conductor, `hilbertClassField`; the global conductor–discriminant formula, in 6.5).

### From TauCetiRoadmap.Chebotarev

Layer 10 (Chebotarev density), for the Taylor–Wiles places of 3.15, the auxiliary primes of 3.14 and 3.20, and the auxiliary places `v₀` of 3.16 and of tower fields (4.4).

### From TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger

§0.1 (the class module and its projectors), §2.1 (the rational Stickelberger element `θ_m = Σ(a₀/m)[a⁻¹]` with `(1 + c)θ_m = N`), §2.3 (positive smoothing `s_(m,b) = (b − [b])θ_m`), §2.5 (annihilation of the full class group by the integral Stickelberger ideal at every conductor `m ≥ 2`), §3.1 (character evaluation of the Stickelberger element, `B_{1,χ⁻¹}` at conductor `m`); §§0.1, 2.3, 2.5, 3.1 in 3.5, and §§2.1, 2.3, 2.5 in the route of 6.5.

### From TauCetiRoadmap.DirichletPadicLFunctions

§0.4 (generalized Bernoulli numbers; `L(1 − k, χ) = −B_{k,χ}/k` and its Euler factors at imprimitive level, in 3.5, 3.22 and 6.5); §§2.3, 2.4 (the finite tame kernel and the integral tame measure of a nonprincipal character of level prime to `p`, with moments `L(η, −k)`, imprimitive characters included), in the alternative route of 3.22(b).

### From TauCetiRoadmap.ProfiniteCohomology

§5.4 (inflation–restriction), in 1.1, 3.5 and 6.5; §§9.5–9.6 (Hilbert 90 and Kummer theory), in 5.2 and 6.5; Layer 11 (cohomological dimension), in 1.1.

### From TauCetiRoadmap.LFunctions

Layer 4 (Dirichlet `L`-functions, their functional equations), for the nonvanishing of the generalized Bernoulli numbers `B_{k,χ}`, `k ≥ 2`, of the parity `χ(−1) = (−1)^k`, in 6.5.

### From TauCetiRoadmap.HeightsAndUnits

§4.2 (the `S`-unit theorem), in step (4) of 6.5.

### From TauCetiRoadmap.EffectiveBounds

Layer 1 (`NumberField.classNumber_le_bound`, `h_F ≤ |d_F|·4^{[F:ℚ]}`), in step (4) of 6.5.

### From TauCetiRoadmap.ExplicitNumberFields

§5.3, first form (`h_K ≤ b(log b + γ + 1/b)^{n−1}`, `γ` Euler's constant, for every admissible `b`), with §0.3 (admissible `b`), at `b = √|d|`, in
5.1 and in step (4) of 6.5.

### From TauCetiRoadmap.AnalyticNumberTheoryPartI

§0.32 (Siegel–Walfisz), for primes in fixed classes in ranges `(y, 2y]`, in 5.7 and 7.5.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§1.6 (the product of primitive characters of coprime levels is primitive), in the conductor clause of 0.2.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement], distributed as a Lean archive in fourteen parts on its author's page (footnote 1 of [Announcement]); source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>, cited at commit `ab0b7522a5ccc9b8530edf475af5088f8f6464aa`, to which the declaration names and file paths given at the targets refer. Its window bound on twisted wild kernels and its case analysis are reconstructed in Layers 1–7.
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>. It describes the bound as the "weakening of Vandiver" of its argument.
- C. Soulé, *K-théorie des anneaux d'entiers de corps de nombres et cohomologie étale*, Invent. Math. 55 (1979): finiteness.
- C. Soulé, *A bound for the torsion in the K-theory of algebraic integers*, Documenta Math., Extra Volume Kato (2003): the
  published K-theoretic bound, compared with BernoulliBoundsForClassGroupEigenspaces Layer 9; the bound consumed in 1.6, 2.2 and 6.1 is
  BernoulliBoundsForClassGroupEigenspaces §9.7, proved homologically for every prime.
- P. Schneider, *Über gewisse Galoiscohomologiegruppen*, Math. Z. 168 (1979): 1.1.
- B. Ferrero and L. Washington, *The Iwasawa invariant μ_p vanishes for abelian number fields*, Ann. of Math. 109 (1979): 2.3,
  2.4, 3.14, 4.2, 4.4, 4.5.
- K. Iwasawa, *Riemann–Hurwitz formula and p-adic Galois representations for number fields*, Tôhoku Math. J. 33 (1981), and
  Y. Kida, *ℓ-extensions of CM-fields and cyclotomic invariants*, J. Number Theory 12 (1980): context for 2.3.
- H. Jacquet and J. Shalika, *On Euler products and the classification of automorphic representations I*, Amer. J. Math. 103
  (1981): the bound used in 3.2, 5.4, 5.7 and 6.4.
- L. Clozel, *Motifs et formes automorphes: applications du principe de fonctorialité* (1990): 3.1.
- K. Horie, *Ideal class groups of Iwasawa-theoretical abelian extensions over the rational field*, J. London Math. Soc. 66
  (2002), and T. Fukuda and K. Komatsu, *Weber's class number problem in the cyclotomic ℤ₂-extension of ℚ*, Experiment.
  Math. 18 (2009): context for 3.5; L. Washington, *The non-p-part of the class number in a cyclotomic ℤ_p-extension*,
  Invent. Math. 49 (1978), the qualitative statement.
- J. Bellaïche and G. Chenevier, *Families of Galois representations and Selmer groups*, Astérisque 324 (2009): generalized
  matrix algebras and reducibility ideals in 3.15 (and ReducibilityIdealsAndUltrafilterPatching §6.11); context for 3.4, 4.1.
- B. Mazur, *Deforming Galois representations*, in Galois groups over ℚ, MSRI Publ. 16 (1989): the presentation argument of
  3.6.
- A. Grothendieck, SGA 2, Exposé XIII: the connectedness theorem behind ReducibilityIdealsAndUltrafilterPatching §6.10 (cited there)
  and 3.19(b).
- K. Ribet, *A modular construction of unramified p-extensions of ℚ(μ_p)*, Invent. Math. 34 (1976): the construction that
  3.3–3.4 reverse; the lattice with nonsplit reduction (Ribet's lemma) in the outline of 3.20(d).
- P. Deligne and J.-P. Serre, *Formes modulaires de poids 1*, Ann. Sci. ÉNS 7 (1974), Lemme 6.11: the lifting of residual
  eigenvalues, in 3.22(b).
- J. Arthur and L. Clozel, *Simple algebras, base change, and the advanced theory of the trace formula*, Annals of Math.
  Studies 120 (1989): the descent in 4.2, and the base change and automorphic induction of the seeds in the outline of 3.20(d).
- C. Skinner and A. Wiles, *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999); J. Thorne,
  *Automorphy lifting for residually reducible l-adic Galois representations*, J. Amer. Math. Soc. 28 (2015); P. Allen,
  J. Newton and J. Thorne, *Automorphy lifting for residually reducible l-adic Galois representations, II*, Compositio Math.
  156 (2020): the propagation and patching methods extended by 3.11–3.23, 4.2 and 4.4 here and by ReducibilityIdealsAndUltrafilterPatching §§6.12–6.13 (no Steinberg place, constituents
  exchanged by the polarization, the cyclotomic `ℤ_ℓ`-tower in place of a `ℤ_q`-tower).
- G. Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group, and pseudorepresentations over arbitrary
  rings*, in Automorphic Forms and Galois Representations, LMS Lecture Note Ser. 414 (2014): determinants, in 3.15 and 3.16.
- D. Geraghty, *Modularity lifting theorems for ordinary Galois representations*, Math. Ann. 373 (2019): ordinarity from
  Weil–Deligne data, compared with 3.17(a).
- L. Berger, *Représentations p-adiques et équations différentielles*, Invent. Math. 148 (2002): de Rham representations are
  potentially semistable, in 3.17(a).
- S. Bloch and K. Kato, *L-functions and Tamagawa numbers of motives*, in The Grothendieck Festschrift I (1990): the local
  subspaces `H¹_f`, their dimension and duality, in 4.1 (local chart) and 4.3(iv).
- S. Gelbart and H. Jacquet, *A relation between automorphic representations of GL(2) and GL(3)*, Ann. Sci. ÉNS 11 (1978): the
  seeds of 4.2.
- A. V. Zelevinsky, *Induced representations of reductive p-adic groups II*, Ann. Sci. ÉNS 13 (1980), and I. N. Bernstein and
  A. V. Zelevinsky, *Induced representations of reductive p-adic groups I*, Ann. Sci. ÉNS 10 (1977): irreducibility of
  products of unlinked segments, in 4.2(d) and 4.8(0).
- W. Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups* (notes): Jacquet's lemma
  for a subgroup with an Iwahori factorization, in 4.8(0).
- T. Saito, *Modular forms and p-adic Hodge theory*, Invent. Math. 129 (1997): compatibility at `ℓ` for newforms, the classical
  form of the comparison used in 4.8(a).
- T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, *Potential automorphy and change of weight*, Ann. of Math. 179 (2014),
  Theorem 5.5.2: irreducibility for a density-one set of primes, for `π` regular algebraic, polarizable and cuspidal over a CM
  field, of extremely regular weight, the input of the comparisons at `ℓ` in 3.20(f), 4.2(d), 4.4 and 4.8.
- A. Caraiani, *Local–global compatibility and the action of monodromy on nearby cycles*, Duke Math. J. 161 (2012), and
  T. Barnet-Lamb, T. Gee, D. Geraghty and R. Taylor, *Local–global compatibility for l = p, II*, Ann. Sci. ÉNS 47 (2014):
  the comparisons used in 4.3, 4.7 and 4.8.
- J. Newton and J. Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type*, J. Eur. Math.
  Soc. 25 (2023): 4.3, 4.5, 4.7.
- K. Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Astérisque 295 (2004), Theorem 14.2: 4.3.
- R. Greenberg, *On the Iwasawa invariants of totally real number fields*, Amer. J. Math. 98 (1976): context for the Summary.
