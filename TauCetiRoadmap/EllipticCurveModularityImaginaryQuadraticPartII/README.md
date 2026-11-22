# Roadmap: modularity of elliptic curves over imaginary quadratic fields, Part II: all CM fields

**Summary.** An elliptic curve over a number field `K` is modular when its étale `H¹` is realized by
the `ℓ`-adic Galois representations attached to an automorphic representation of `GL₂(𝔸_K)`. The
parent roadmap EllipticCurveModularityImaginaryQuadratic proves every elliptic curve over an
imaginary quadratic field modular, and EllipticCurveModularityTotallyReal treats totally real
fields. This roadmap does the same over every CM field: a number field that is a totally imaginary
quadratic extension of its maximal totally real subfield.

The main theorem states that for every CM field `K` and every elliptic curve `E/K` there is an
isobaric automorphic representation `π_E` of `GL₂(𝔸_K)`, of weight zero and trivial central
character, realizing `H¹(E_K̄, Q̄_ℓ)` for every prime `ℓ` and every isomorphism `ι : Q̄_ℓ ≅ ℂ`. At
each finite place not above `ℓ`, the Frobenius-semisimple Weil–Deligne representation of `E`,
monodromy included, matches the local component of `π_E` under the local Langlands correspondence.
Every finite local factor agrees, each complex place carries the expected parameter, and
`L(E/K, s) = L(π_E, s − 1/2)`. `π_E` is cuspidal when `E` has no complex multiplication over `K̄`;
otherwise it comes from algebraic Hecke characters, by automorphic induction or as an isobaric sum.

Without complex multiplication, the proof follows the parent's geometric prime switch: a family of
cyclic covers with parameter `t` connects a quadratic twist `B_t` of `E` to an auxiliary elliptic
curve `A_t` through congruences modulo `p`, `3` and `p`, for a prime `p > 100`, over `F = K(μ₃ₚ)`.
Once `A_t` is modular over `F`, three lifting steps make `B_t` modular, and descent to `K` and
removal of the twist give `E`.

Over a general CM field two things change. First, the parent makes `A_t` modular over `F` by the
Caraiani–Newton residual criterion at five, which needs `ζ₅ ∉ F`. But `ζ₅ ∉ K` no longer implies it:
the CM field `ℚ(ζ₁₅ + ζ₁₅⁻¹, i)` omits `ζ₅`, yet adjoining `ζ₃` gives `ℚ(ζ₆₀)`. Making `A_t` modular
over `K` before base change to `F` proves the second main theorem: if `ζ₅ ∉ K`, every elliptic curve
over `K` is modular, with all the conclusions above. Its only lifting inputs are Theorems 5.2 and
6.1 of Caraiani–Newton.

Second, when `ζ₅ ∈ K` the mod-five representation of `A_t` has image `SL₂(𝔽₅)`, exactly the case the
Caraiani–Newton lifting theorem excludes. The difficulty is one class: for the trace-zero adjoint
`ad⁰`, `H¹(SL₂(𝔽₅), ad⁰)` is one-dimensional, while `H¹(SL₂(k), ad⁰)` vanishes for every other
finite field `k` of odd characteristic. In their patching argument the exclusion matters only when
choosing Taylor–Wiles primes, auxiliary primes that kill a dual Selmer group. The remedy is a
*protected* place: a place away from five where residual inertia is nontrivial and unipotent.
Inflated to the Galois group, that class is ramified there, so the local condition excludes it.

The third main theorem is this lifting theorem, for any continuous two-dimensional five-adic Galois
representation `ρ` of a CM field. It keeps the hypotheses of Caraiani–Newton's Theorem 5.2 except
their condition on the projective image; among them, `ρ` is potentially semistable above five with
Hodge–Tate weights `0` and `1`, and its reduction comes from a cuspidal automorphic representation
with matching types above five. The new case is a field containing `ζ₅` with a nonempty finite set
of protected places. At each of them, every inertia element has characteristic polynomial `(X − 1)²`
under `ρ`, the automorphic representation has Iwahori-fixed vectors, and both are unramified at the
conjugate place. Then `ρ` comes from a cuspidal regular algebraic automorphic representation of
`PGL₂` of weight zero.

For `A_t`, a degeneration of type `I₃` of the cover family gives the protected place: for `t` near
it at a place `v` above an auxiliary prime, `A_t` is split multiplicative at `v`, with minimal
discriminant of valuation prime to five. After a switch at five keeping `v`, the lifting theorem and
descent make `A_t` modular over `K`.

The roadmap also builds on CrystallineLocalGlobalCompatibilityCM, whose patching it extends to
protected places, and on PotentialAutomorphyInfrastructure for solvable base change and descent.
Layers 1–2 run the switch over any CM field and settle the case `ζ₅ ∉ K`. Layers 3–6 build the
lifting theorem at five, Layer 7 the protected auxiliary curve, and Layer 8 the main theorem.

## How to read the build

Layer 1 adds two lemmas the libraries lack: CM-ness of the cyclotomic extensions of a CM field and
of the fields between two CM fields, and descent of the residual hypotheses of the lifting theorems
along finite extensions. Layer 2 runs the parent's switch over an arbitrary CM field: given an
automorphic seed for `V_η` over `F`, the three lifts and the descent give `E`; when `ζ₅ ∉ K` the
seed comes from the parent's residual criterion over `K` followed by base change, which proves
Theorem 2.5. Layers 3–6 build the lifting theorem at five with a protected place: the finite-group
and local computations (Layer 3), the global Galois cohomology and Taylor–Wiles primes (Layer 4),
the Hecke algebras and prepared patching (Layer 5) and the solvable preparation and descent
(Layer 6). Layer 7 produces a protected place on the auxiliary curve from a degeneration of type `I₃`
of the cover family, retains it through the switch at five and proves the auxiliary curve modular
when `μ₅ ⊂ K`. Layer 8 combines Layers 2 and 7 into the headline. Layers 1–2 are independent of
Layers 3–7.

## Conventions

- `K` is a CM number field: a totally imaginary quadratic extension of its maximal totally real
  subfield `K⁺`, in Mathlib's sense `NumberField.IsCMField`; `c` is complex conjugation and `v^c` the
  conjugate of a finite place `v`. `E/K` is an elliptic curve `y² = h(x)` with separable cubic `h`.
  In §6.1, which names no elliptic curve, `E` is a totally real Galois extension of `ℚ` of degree eight,
  and `E_a`, `E_b`, `E_c` are the imaginary quadratic fields so named in ACC23 §6.5.12.
- The parent's notation is kept: `p > 100` is the prime of the parent's §7.2 (general number-field
  form), `n = 3p`, `F = K(μ_n)`, `U ⊂ 𝔸¹_K` is `switchParameterOpen`, `B_t: h(t)y² = h(x)`, `C_m(t)` the
  cyclic covers, `w` the reflection, `A_t = Pic⁰(C₃(t)/⟨w⟩)`, `V_θ` the character systems, `η, ψ`
  characters of orders `3, p` and `χ = ηψ`. Switch parameters are defined in the next bullet. The field
  `F = K(μ_n)` is meant in the Summary, Scope and ownership, How to read the build, Layers 2 and 8, §7.5
  and Layer 1 outside §1.2; §1.2, Layers 4–6 and §7.4 each introduce their own number field `F` in
  their statements, and Layer 3 uses only local fields `F_v` and their extensions `F'_w`. In the
  supplier contracts `F` is the field of the cited statement: a finite extension of `ℚ_ℓ` for the
  Tau Ceti Euler characteristic, the CM field of CrystallineLocalGlobalCompatibilityCM and of ACC23
  §3.1 elsewhere; in Downstream consumers it is the CM field of ModularityAndLanglandsExtensions
  §2.29. The conventions below on `M(1)` and unramified classes apply to whichever `F` is in force.
  The letter `F` never denotes a finite field; finite coefficient fields are written `k`. The switch
  parameter `t` occurs in Layers 2, 7 and 8 only, and the parameter `t` of the curves `A_t` and `B_t`
  also in the Summary, Scope and ownership and the parent's supplier contract; in Layers 4–5 the
  letter `t` is the number `|T|` of framed places. The characters `η, ψ, χ` and their systems
  `V_η, V_ψ, V_χ` occur in How to read the build, Layer 2 and §8.1 only. Elsewhere `ψ` is the
  unramified determinant character of §3.4, `χ = (χ_v)_{v∈R}` is the tuple of tame characters at `R` in
  Layer 5 and in the supplier contract of CrystallineLocalGlobalCompatibilityCM (the index of the
  problems `𝒮_χ` of that roadmap's §9.5), and `χ_(h(t))` is the quadratic character of `K(√h(t))/K`
  by which `B_t` twists `E` (the parent's §8.4, used in Layer 2). The reflection `w` occurs in §7.1
  only; elsewhere `w` is a finite place. The letter `p` is the prime of the parent's switch
  (`p > 100`; in §7.1 any prime `p > 3`) in the Summary's
  account of the switch, the Layer 1 Examples and Layers 2, 7 and 8; everywhere else it is a coefficient
  prime, odd in the coefficient conventions below, in Layer 3 and in the supplier obligations, and five
  where `p = 5` is written.
- *Switch parameters.* Let `E/K` be geometrically non-CM over a number field `K`, with `p`, `n`, `F` and
  `U` as above. A *switch parameter* for `(K, E, p)` is a point `t ∈ U(K)` with the following three
  properties. (S1) For every place `v₀` of `K` above `3p`, `t` lies in an open `Ω_{v₀} ⊂ U(K_{v₀})` with
  the property of the parent's §6.5 `local_type_opens`: for every `t' ∈ Ω_{v₀}` and every place `v` of
  `F` above `v₀`, the Jacobian `J_{t'} = Pic⁰(C_n(t'))` has, after an extension of `F_v` independent of
  `t'`, the potential reduction type of `E` (good ordinary, good supersingular or totally toric);
  the parent's §6.6 `character_local_types` then gives the local types of the character systems at
  `t` above `3p`. (S2) The residual conclusions of the parent's §7.4 `simultaneous_specialization` hold
  at `t`: for each pair `(m, ℓ) ∈ {(3, p), (3, 5), (p, 3)}` and every character `θ` of order `m`, the
  reduction of `V_θ` modulo `ℓ` is absolutely irreducible on `G_{F(ζ_ℓ)}` and decomposed generic over
  `F`; the reduction of `V₁` modulo `p` is absolutely irreducible on `G_{F(ζ_p)}` and decomposed generic
  over `F`; and `A_t` is geometrically non-CM. (S3) For the finite Galois field `D/ℚ` of the parent's
  §7.4, the compositum of the normal closure of `K` with `ℚ(μ₃ₚ, ζ₅)`, the image of `G_D` on each
  residual system of (S2) contains the image of the geometric monodromy of the parent's §7.1.

  - *Existence, with further local opens.* For every number field `K`, every geometrically non-CM
    `E/K`, every `p` of the parent's §7.2 and every finite set `Σ` of finite places of `K` prime to
    `3p`, each with a nonempty open of `U(K_v)` prescribed, there is a switch parameter lying in all
    the prescribed opens. Route: apply the parent's §7.4 to the places above `3p` together with `Σ`,
    with opens at the places above `3p` chosen inside the nonempty opens of the parent's §6.5, which
    have the property of (S1), and the prescribed opens at `Σ`; its conclusions give (S2) and (S3)
    for the same `t` (the memberships, the image of `G_D`, the witness primes and non-CM).
  - *What the theorems use.* Theorems 2.1(a) and 2.2 and §7.5(a) use (S2); the local alternatives of
    Theorem 2.2 use (S1); §7.5(a) uses (S3); Theorem 2.1(a) and (c), §7.5(c) and Theorem 8.1 use the
    non-CM clause of (S2). None uses how `t` was found.

  **Checks.**

  - For imaginary quadratic `K`, the parameter of the parent's §8.2 (chosen by its §7.4 inside the
    opens of its §6.5) is a switch parameter, and Theorem 2.2 is then the parent's §§8.3–8.4.
  - A `t ∈ U(K)` with `A_t` geometrically CM is not a switch parameter: it fails the last clause of
    (S2), and it fails (S3) for the pair `(3, 5)` as well, since the geometric monodromy there contains
    the transvections `[[1, 3],[0, 1]]` and `[[1, 0],[3, 1]]` (§7.5), which do not commute
    (`[[1,3],[0,1]]·[[1,0],[3,1]] = [[0,3],[3,1]]` against `[[1,0],[3,1]]·[[1,3],[0,1]] = [[1,3],[3,0]]`
    over `𝔽₅`), whereas both, of order five, would lie in the abelian subgroup of index at most two of
    the mod-five image of a CM curve.
  - (S1) does not follow from (S2) and (S3): the parent's §7.4 accepts any nonempty opens above `3`.
    At a place `v₀ | 3` where `E` has potentially good reduction and the data of §7.1(b) are defined
    over `K_{v₀}`, an open near `R_*` gives `t` with `v₀(s)` large, so `v₀(j(A_t)) < 0` by §7.1(d);
    then `A_t`, an isogeny factor of `J_t` through the quotient maps from `C_n(t)` to `C₃(t)` and on to
    the curve whose Jacobian is `A_t`, is potentially multiplicative at `v₀` while `E` is not, and no
    open containing `t` has the property of (S1).
  - A switch parameter is not tied to the places at which it was prescribed: one lying also in the
    opens of §7.2 above an auxiliary prime `q ∤ 3p` is still a switch parameter, and the parent's §7.4
    with those opens added produces one; §7.5 uses exactly this.
- Cohomological normalization as in the parent: `H¹` is étale `H¹`, its determinant is `ε_ℓ⁻¹`,
  `HT(ε_ℓ) = −1`, Frobenius in compatible systems is geometric and `rec^T(π_v) = rec(π_v ⊗ |det|^(−1/2))`.
  The residual representation of `H¹(A)` is the dual of `A[ℓ]`; dualizing inverts both eigenvalue
  ratios, so decomposed genericity (AutomorphicGaloisRepresentationsPartII AG2.7,
  `IsDecomposedGeneric`) and absolute irreducibility pass between the two.
- *Modular* has the parent's meaning: for geometrically non-CM `E`, a cuspidal regular algebraic
  weight-zero `π` of `PGL₂(𝔸_K)` (a cuspidal `π` of `GL₂(𝔸_K)` with trivial central character) with
  `r_ι(π) ≅ H¹(E_K̄, Q̄_ℓ)` for one, hence every, `(ℓ, ι)`; for geometrically CM `E`, the induction or
  isobaric sum of its Hecke characters as in Theorem 2.4.
- Local computations away from the coefficient prime `p` use the coefficient-`p` tame quotient
  `ℤ_p(1) ⋊ Ẑ` of `G_{F_v}` (LocalGaloisDeformationRings §2.6), with a topological generator `τ` of
  inertia and an *arithmetic* Frobenius lift `φ`, related by `φτφ⁻¹ = τ^(q_v)`. Witness: for
  `q_v = 11` and `U = [[1,1],[0,1]]` over `𝔽₅`, `U¹¹ = U`, so a scalar residual Frobenius is
  compatible with residual inertia `U` exactly because `11 ≡ 1 mod 5`; for `q_v = 7` one needs
  `ρ̄(φ)Uρ̄(φ)⁻¹ = U⁷ = [[1,2],[0,1]]`, which a scalar cannot achieve, whereas the geometric Frobenius
  `φ⁻¹` would conjugate `U` to `U³`, since `7⁻¹ ≡ 3 mod 5`.
- `ad⁰` is the trace-zero adjoint of ArithmeticGaloisRepresentations §7.2 (for a homomorphism into
  `GL₂(k)`, its §7.9 `ResidualImage.adZeroRep`): the trace-zero `2×2` matrices with the conjugation
  action, with the standard basis `e = E₁₂`, `h = diag(1, −1)`, `f = E₂₁` (used in Layers 3–4 only,
  where the cubic `h` of the curve does not occur). The matrix `U = 1 + e = [[1,1],[0,1]]` occurs in
  the Frobenius witness above and in Layers 3–6 only, the parameter open `U ⊂ 𝔸¹_K` in the definition
  of switch parameters and Layers 2 and 7 only. For `D = Ad(U)`: `D(e) = e`, `D(h) = h − 2e`,
  `D(f) = f + h − e`; `D` has this meaning in Layer 3 only, while in Layer 7 `D_t` is the quotient
  curve of §7.1, and in Layer 7, the definition of switch parameters and the parent's supplier
  contract `G_D` is the absolute Galois group of the finite Galois field `D/ℚ` of the parent's §7.4.
  The trace form `⟨X, Y⟩ = tr(XY)` has Gram matrix
  `[[0,0,1],[0,2,0],[1,0,0]]` in this basis, of determinant `−2`; it identifies `ad⁰` with its dual
  whenever `2` is invertible (the perfectness and splitting of §7.2 there) and is degenerate in
  characteristic two.
- For a `G_F`-module `M` over a field of characteristic `p`, `M(1) = M ⊗ μ_p`. When `μ_p ⊂ F`, a choice
  of primitive `ζ_p` identifies `M(1) ≅ M`. Unramified classes are
  `H¹_ur(F_v, N) = ker(H¹(F_v, N) → H¹(I_v, N)) = H¹(G_{F_v}/I_v, N^(I_v))`.
- Relative dual Selmer groups follow GlobalGaloisDeformations §3.6: for a framing set `T ⊆ S`
  containing the places above `p`, the dual group imposes `L_v^⊥` at `v ∈ S ∖ T` and **no** condition
  at `v ∈ T`.
- The condition "every element of `ρ(I_v)` has characteristic polynomial `(X − 1)²`" is the
  *unipotent-inertia condition*; CaptainSude26 calls it the Steinberg condition. At a protected place
  it is the minimally ramified condition (Theorem 3.4). It is distinct from the Steinberg lifts of
  LocalGaloisDeformationRings §2.5, which are defined for trivial residual data.
- `Iw_v ⊂ PGL₂(O_{F_v})` is the Iwahori subgroup of matrices upper triangular modulo `ϖ_v`. `O` is the
  ring of integers of a finite extension of `ℚ₅` (of `ℚ_p` in Layer 3) with uniformizer `ϖ` and
  residue field `k`; `CNL_O` is the category of complete Noetherian local `O`-algebras with residue
  field `k`. In Layer 7, which uses no coefficient ring, `O` is, as in the parent, the origin of `E` and of
  its quadratic twists `B_t`. In Layer 5 and in the supplier obligations, `K`, `K_v` and `K^P` are
  levels (compact open subgroups), as in the sources; the number field there is `F`. In the supplier
  obligations `λ` is the dominant weight of the coefficients, as in ACC23; in §§7.1–7.2 `λ` is the unit
  power series of the Tate parameter.

## Layer 1: Cyclotomic CM fields and descent of residual hypotheses

### 1.1 Cyclotomic extensions and intermediate fields of CM fields

Prove: (a) let `K` be a CM number field, `S` a set of positive integers and `L/K` a finite extension
with `IsCyclotomicExtension S K L`; then `L` is a CM field. (b) Let `K ⊆ L` be CM number fields; then
every intermediate field `K ⊆ K' ⊆ L` is a CM field. Both are instances of the criterion of
MordellLawrenceVenkatesh §1.3: a number field inside `ℚ̄` is totally real or CM exactly when `c₁c₂`
fixes it pointwise for all complex conjugations `c₁, c₂ ∈ Gal(ℚ̄/ℚ)`. For (a), `L` is generated over `K`
by a cyclotomic field `ℚ(μ_m) ⊆ L`, which is CM or `ℚ` (`IsCyclotomicExtension.Rat.isCMField`); every
`c₁c₂` fixes `K` and `ℚ(μ_m)` pointwise, hence their composite `L` (MilneCM, Corollary 1.5, p. 10). For
(b), every `c₁c₂` fixes `L` pointwise, hence `K'` (MilneCM, Remark 1.6, p. 10); in the language of
MordellLawrenceVenkatesh §1.4, the largest CM-or-totally-real subfield of the CM field `L` is `L`
itself, so every subfield of `L` is totally real or CM. In both cases the field
contains `K`, so it is totally complex (`NumberField.isTotallyComplex_of_algebra`) and therefore CM,
not totally real. Part (a) makes `F = K(μ_n)` CM in Layers 2 and 8; part (b) is the fact used when
descending along `F/K` through intermediate fields (LeHung26, Lemma 5.1, p. 9).

*Needs:* Mathlib `NumberField.IsCMField`, `IsCyclotomicExtension`,
`IsCyclotomicExtension.Rat.isCMField`, `NumberField.isTotallyComplex_of_algebra`;
MordellLawrenceVenkatesh §§1.3–1.4.

**Checks.**

- For `K = ℚ(i)` and `L = ℚ(ζ₂₀)`, `Gal(L/K) ≅ (ℤ/5)ˣ` is cyclic of order four; the intermediate
  fields are `ℚ(i)`, `ℚ(i, √5)` and `ℚ(ζ₂₀)`, and the middle one is CM with maximal real subfield
  `ℚ(√5)`.
- Part (b) does not need `L/K` cyclotomic: for `K = ℚ(i) ⊂ K' = ℚ(i, √5) ⊂ L = ℚ(i, √3, √5)`, `L` is CM
  of degree eight with quadratic subfields `ℚ(√d)`, `d ∈ {−1, ±3, ±5, ±15}`; it contains neither `ζ₈`
  (no `√2`) nor `ζ₅` (`Gal(L/ℚ) ≅ (ℤ/2)³` has no cyclic quotient of order four), so its roots of unity
  are `μ₁₂` and `K(μ₁₂) = ℚ(i, √3) ≠ L`. Still `K'` is CM with maximal real subfield `ℚ(√5)`.
- The subfield `ℚ(√5)` of `ℚ(ζ₂₀)` is totally real, not CM: part (b) concerns fields containing `K`,
  and fails for arbitrary subfields of `L`.
- Part (a) needs `K` CM: for `K = ℚ(2^(1/3))`, `K(ζ₃)` is the splitting field of `X³ − 2`, with Galois
  group `S₃`; its complex conjugations are transpositions, `c₁c₂` can be a three-cycle, which moves
  `2^(1/3)`, and the field is not CM.
- For `S = {1, 2}` the extension is trivial, `L = K`, and (a) reduces to `K` being CM.
- For `K = ℚ(√−3)` and `S = {4}`, `L = ℚ(ζ₁₂)` is abelian over `ℚ`, and (a) agrees with
  `NumberField.IsCMField.of_isAbelianGalois`.

### 1.2 Descent of residual hypotheses along a finite extension

Let `K ⊆ F` be number fields with `F/K` finite, `k` a finite field of characteristic `ℓ` and
`r̄ : G_K → GL_n(k)` continuous. Prove: (a) if a rational prime `q` is a decomposed-generic prime for
`r̄|G_F` in the sense of AutomorphicGaloisRepresentationsPartII AG2.7, then `q` is a
decomposed-generic prime for `r̄`; in particular `r̄|G_F` decomposed generic implies `r̄` decomposed
generic; (b) if `r̄|G_{F(ζ_ℓ)}` is absolutely irreducible then so is `r̄|G_{K(ζ_ℓ)}`. For (a): `q` is
completely split in `F`, hence in `K`; for `v | q` in `K` and `w | v` in `F` one has `F_w = K_v = ℚ_q`,
so the decomposition groups coincide, `r̄|G_{K_v} = (r̄|G_F)|G_{F_w}` is unramified with the same
Frobenius eigenvalues and `q_v = q_w = q`. Part (b) holds because `G_{F(ζ_ℓ)} ⊆ G_{K(ζ_ℓ)}`.
(LeHung26, §4.4, last sentences of "All conjugates", lines 318–321.)

*Needs:* AutomorphicGaloisRepresentationsPartII AG2.7 (`IsDecomposedGenericPrime`,
`decomposedGenericPrime_local`); ArithmeticGaloisRepresentations §2.1 (decomposition groups).

**Checks.**

- For `K = F = ℚ` the statement is the identity.
- The converse fails: the trivial representation `1 ⊕ 1` over `𝔽₃` is decomposed generic over `ℚ`
  with witness `2` (ratio `1 ≠ 2 ≡ 2⁻¹ mod 3`), but over `ℚ(ζ₃)` every completely split prime is
  `≡ 1 mod 3`, so the ratio `1` equals `q` modulo three and no witness exists.
- A prime that is split in `K` but not completely split in `F` is not a witness for `r̄|G_F`; the
  descent uses complete splitting in the larger field.

### Examples

Let `K₆₀ ⊂ ℚ(ζ₆₀)` be the fixed field of `{1, 29} ⊂ (ℤ/60)ˣ`, that is `ℚ(ζ₁₅ + ζ₁₅⁻¹, i)`: `a ≡ ±1 mod 15`
and `a ≡ 1 mod 4` force `a ∈ {1, 29}`. It has degree eight and is CM, being abelian over `ℚ` and
containing `i`. It does not contain `ζ₅`, since `29 ≢ 1 mod 5`. Since also `29 ≢ 1 mod 3`, the fixed
group of `K₆₀(ζ₃)` is trivial, so `K₆₀(ζ₃) = ℚ(ζ₆₀) ∋ ζ₅`, and `ζ₅ ∈ K₆₀(μ₃ₚ)` for every `p`
(LeHung26, Remark 4.2, line 352). Over `K₆₀` the parent's order (seed over `F`) is unavailable, while
Theorem 2.1 applies.

### Dependencies

Mathlib's CM-field and cyclotomic API; MordellLawrenceVenkatesh §§1.3–1.4;
AutomorphicGaloisRepresentationsPartII AG2.7;
ArithmeticGaloisRepresentations §2.1.

## Layer 2: The switch over an arbitrary CM field

### 2.1 The auxiliary curve made modular before base change

Let `K` be a CM field with `ζ₅ ∉ K`, `E/K` geometrically non-CM, and `t ∈ U(K)` a switch parameter
(Conventions). Prove: (a) `A_t` is geometrically non-CM, and the mod-five residual representation of
`H¹(A_t)` is absolutely irreducible on `G_{K(ζ₅)}` and decomposed generic over `K`; (b) `A_t` is
modular over `K`: there is a cuspidal weight-zero `π_A` of `PGL₂(𝔸_K)` realizing `H¹(A_t)` at every
`(ℓ, ι)`; (c) `F/K` is finite abelian, `F` is CM, and the base change `π_{A,F}` is a cuspidal
weight-zero representation of `PGL₂(𝔸_F)` with `r_ι(π_{A,F}) ≅ V_η` under the parent's identification
`V_η ≅ H¹(A_t)|G_F`. No assertion `ζ₅ ∉ F` is made or used.

For (a), (S2) of the switch parameter `t` (the parent's §7.4(1) for the pair `(3, 5)`) gives absolute
irreducibility on `G_{F(ζ₅)}` and decomposed genericity over `F` of the residual `V_η`, and its non-CM
clause (the parent's §7.4(3)) gives non-CM; transport to `H¹(A_t)`
by §4.2 and descend to `K` by Theorem 1.2. For (b), apply the parent's §5.3 `cm_modularity` over
`L = K` with `ℓ = 5`, then §0.3 `modular_elliptic_all_coefficients`. For (c), `F` is CM by
Theorem 1.1, `H¹(A_t)|G_F` is absolutely irreducible because `A_t` is non-CM, and
PotentialAutomorphyInfrastructure §2.3(1) gives the cuspidal base change with
`r_ι(π_{A,F}) ≅ H¹(A_t)|G_F`. (LeHung26, §4.5(1), line 336, and §4.6, lines 342–355; CN23,
Theorem 6.1, line 4513.)

*Needs:* Theorems 1.1, 1.2; EllipticCurveModularityImaginaryQuadratic §§4.2, 5.3, 7.4, 0.3
(`modular_elliptic_all_coefficients`); PotentialAutomorphyInfrastructure §2.3;
FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3; AutomorphicGaloisRepresentationsPartII AG2.7.

**Checks.**

- Over `K₆₀` (Layer 1 Examples), `ζ₅ ∉ K₆₀` while `ζ₅ ∈ F`, so `cm_modularity` applies over `K₆₀` and
  not over `F`.
- For imaginary quadratic `K` the hypotheses hold and `ζ₅ ∉ F` also holds by the parent's §5.1, so
  the parent's order and this one give the same `π_{A,F}` by strong multiplicity one.
- If `A_t` had CM, its base change could be non-cuspidal (PotentialAutomorphyInfrastructure §2.3,
  second Check); the non-CM clause of (S2), from the parent's §7.4(3), is what makes `π_{A,F}`
  cuspidal.

### 2.2 Three lifts, descent and removal of the twist over a CM field

Let `K` be a CM field (`ζ₅ ∈ K` allowed), `E/K` geometrically non-CM and `t ∈ U(K)` a switch
parameter. Suppose one member of `V_η` is realized by a cuspidal weight-zero representation `π_η` of
`PGL₂(𝔸_F)`. Prove that `E` is modular over `K`: there is a cuspidal weight-zero `π_E` of
`PGL₂(𝔸_K)` with `r_ι(π_E) ≅ H¹(E_K̄, Q̄_ℓ)` for one `(ℓ, ι)`.

The route is the parent's §8.3 table, applied over `F`, which is CM by Theorem 1.1. Change the
coefficient prime of `π_η` to `p` (§8.1 `character_automorphy_change_prime`). Lift
`V_η → V_χ` at `p`, `V_χ → V_ψ` at `3` and `V_ψ → V₁` at `p` with §5.2 `potentiallySemistableCM`,
and before each later row move to its coefficient prime by the same §8.1 statement. In every row
§4.1 supplies the determinant, the Hodge–Tate weights, potential semistability and the finiteness of
the ramification set; §4.4 the residual isomorphism; (S2) of the switch parameter (the parent's
§7.4(1)–(2)) decomposed genericity over `F` and absolute irreducibility on `G_{F(ζ_ℓ)}`; (S1) with the
parent's §6.6 and §8.1 `character_automorphic_local_type` the local alternatives above `ℓ`. The
lifting primes are `3` and `p > 100`, so the five-adic projective-field
clause of §5.2 never applies.
This gives a cuspidal weight-zero realization of `V₁ = H¹(B_t)|G_F`. Since `B_t` is a quadratic twist
of the non-CM `E`, `H¹(B_t)|G_F` is absolutely irreducible, and PotentialAutomorphyInfrastructure
§2.3(2) descends it along the soluble CM extension `F/K` to `π_B` realizing `H¹(B_t)`. Finally
`H¹(E) ≅ H¹(B_t) ⊗ χ_(h(t))` (the parent's §8.4), and `π_E = π_B ⊗ (χ_(h(t)) ∘ Art_K⁻¹)` has trivial
central character since `χ_(h(t))² = 1`. (LeHung26, §4.3, line 292, the table of §4.6, lines 344–351,
and Lemma 5.1, line 357; CaptainSude26, Proposition 6.2, line 634; OpenAI26, Proposition 9.3 and
Lemma 9.4, pp. 26–27.)

*Needs:* Theorem 1.1; EllipticCurveModularityImaginaryQuadratic §§4.1, 4.4, 5.2, 6.6, 7.4, 8.1, 8.3,
8.4; PotentialAutomorphyInfrastructure §2.3; FaltingsFinitenessAndIsogenyTheorems
R28.6.2–R28.6.3; EllipticCurves Layer 5; ClassFieldTheory Layer 11;
AutomorphicGaloisRepresentationsPartII AG2.7.

**Checks.**

- The middle lift is at `3` with residual input from the order-`p` characters ((S2) for the pair
  `(p, 3)`); replacing it by a lift at `5` would require the five-adic projective-field clause, which can fail
  when `ζ₅ ∈ F`.
- If `h(t)` is a square in `K`, `χ_(h(t))` is trivial and `π_E = π_B`; twisting twice by
  `χ_(h(t))` returns `π_B`.
- At a quadratic step of the descent the two descents differ by the quadratic character of the step;
  PotentialAutomorphyInfrastructure §2.3(2) selects the one realizing `H¹(B_t)` itself.

### 2.3 All coefficient primes, local factors and complex parameters over a CM field

Let `K` be a CM field and `E/K` geometrically non-CM and modular. Prove: the realizing `π_E` is
unique up to isomorphism, has trivial central character and realizes `H¹(E_K̄, Q̄_ℓ)` for every
`(ℓ, ι)`; for every finite `v ∤ ℓ`,
`ι WD(H¹(E_K̄, Q̄_ℓ)|G_{K_v})^(F-ss) ≅ rec^T(π_{E,v})`, including the monodromy operator; every finite
local factor agrees with that of `E`, including at places above `ℓ`; at each of the `[K⁺:ℚ]` complex
places the archimedean parameter of `π_E` is the parent's `complexInfinityParameter`
`z ↦ diag(z/|z|, conj(z)/|z|)`; and `L(E/K, s) = L(π_E, s − 1/2)`. The first assertions are the
parent's §0.3 `modular_elliptic_all_coefficients` over the CM field `K`; the factors at `v | ℓ`, the
complex parameter and the `L`-function identity follow by the arguments of the parent's §8.5, which
use only the realization and the local reduction type. (OpenAI26, §9.4, pp. 27–28; CN23, Lemma 6.1.3,
line 4545.)

*Needs:* EllipticCurveModularityImaginaryQuadratic §0.3 (`modular_elliptic_all_coefficients`), §8.5
(`complexInfinityParameter` and the local-factor arguments); GL2AutomorphicRepresentationsAndTransfer
R16.3.2; Mathlib `WeierstrassCurve.localPolynomial`, `WeierstrassCurve.LSeries`.

**Checks.**

- At a split multiplicative place the local factor has degree one and `N` has rank one; at a
  potentially good place with nontrivial inertia the factor is `1`; at a good place it has degree two.
  The first two already differ in the Weil part of the parameter, unramified at the split
  multiplicative place and ramified at the other. What `N` changes is the degree: with `N` forgotten,
  the split multiplicative parameter is unramified with Frobenius eigenvalues `1` and `q_v`, and its
  factor would be `((1 − T)(1 − q_v T))⁻¹`, of degree two, against `(1 − T)⁻¹` with `N`; at `q_v = 4`
  these are `((1 − T)(1 − 4T))⁻¹` and `(1 − T)⁻¹`.
- For `K = ℚ(ζ₈)` there are two complex places, and each carries the same parameter; at `z = i` it is
  `diag(i, −i)`, of trace zero and determinant one.
- At a good place with `q_v = 4`, `a = 4` the cohomological polynomial is `T² − 4T + 4` and the unitary
  Satake roots are both `1`, fixing the direction of the shift `s − 1/2`.

### 2.4 Curves with complex multiplication over a CM field

Let `K` be a CM field and `E/K` geometrically CM by the imaginary quadratic field `M`. The geometric
endomorphisms of `E` are defined over `KM` (the parent's §8.6). Over `KM` the curve has all its CM
defined over the base, so ComplexMultiplicationAndExplicitReciprocity §4.1 (the algebraic Hecke
character of a CM abelian variety and the one-dimensional CM components of its Tate module) splits
`V_ℓ(E) ⊗ Q̄_ℓ`, as a `G_{KM}`-module, into the realizations of the Hecke character of `E/KM` along
the two embeddings of `M`; dually, `H¹(E)|G_{KM}` is the sum of the realizations of two algebraic
Hecke characters `θ, θ'` of `KM`. Prove: if `M ⊆ K` then `E` is realized by the isobaric sum
`θ ⊞ θ'` over `K`, which is not cuspidal; if `M ⊄ K` then `E` is realized by the quadratic automorphic
induction `AI_{KM/K}(θ)`, which is cuspidal because `θ` and its conjugate have different infinity
types. In both cases the central character is trivial in the unitary normalization, the
representation has weight zero, its local parameters agree with those of `E` at every finite place,
and `L(E/K, s) = L(π_E, s − 1/2)`. The argument after the splitting is the parent's §8.6 over the CM
base `K`. (OpenAI26, §9.4, pp. 27–28; LeHung26, §5, lines 364–366; CaptainSude26, proof of Theorem
1.1, lines 676–683.)

*Needs:* EllipticCurveModularityImaginaryQuadratic §8.6; ComplexMultiplicationAndExplicitReciprocity
§4.1; AutomorphicGaloisRepresentationsPartII AG2.0; GL2AutomorphicRepresentationsAndTransfer
R17.4.16; Mathlib `WeierstrassCurve.localPolynomial`, `WeierstrassCurve.LSeries`.

**Checks.**

- Over `K = ℚ(ζ₈) ⊇ ℚ(i)`, the curve `y² = x³ − x` has CM by `ℚ(i) ⊆ K` and uses the isobaric sum.
- Over the same `K`, `y² = x³ + 1` has CM by `ℚ(√−3) ⊄ ℚ(ζ₈)` and uses induction from `ℚ(ζ₂₄)`; the
  statement "every CM curve is noncuspidal over a CM field" is false.
- Geometric CM is a condition over `K̄`: `y² = x³ − x` over `ℚ(√−3)` has no `K`-rational CM but is
  geometrically CM and is treated here, by induction.

### 2.5 Modularity over CM fields not containing ζ₅

Prove: let `K` be a CM field with `ζ₅ ∉ K`. Then every elliptic curve `E/K` is modular, with all the
conclusions of Theorem 2.3 if `E` is geometrically non-CM and of Theorem 2.4 if it is geometrically CM.
For non-CM `E`, choose a switch parameter `t`; Theorem 2.1(c) supplies `π_η = π_{A,F}`, Theorem 2.2
gives modularity and Theorem 2.3 the remaining assertions. Its lifting inputs are the parent's §§5.2
and 5.3, that is CN23 Theorems 5.2 and 6.1. (LeHung26, Theorem 1.1, line 86, with the proof of §4.6,
line 342, and Lemma 5.1, line 357.)

*Needs:* Theorems 2.1, 2.2, 2.3, 2.4; EllipticCurveModularityImaginaryQuadratic §7.4.

**Checks.**

- For imaginary quadratic `K` this is the parent's `imaginary_quadratic_modularity`.
- `K = ℚ(ζ₅)` contains `ζ₅` and is excluded; Theorem 8.1 covers it.
- Over `K₆₀` the theorem applies although `ζ₅ ∈ K₆₀(μ₃ₚ)`.

### Examples

Over `K = ℚ(√−1, √2)`, a non-CM curve with reducible mod-`3` and mod-`5` images is still covered: the
auxiliary curve, not `E`, supplies the residual hypotheses at five, over `K`. Over `K₆₀` the seed is
modular over `K₆₀` and its base change to `F` is the starting point of the chain.

### Dependencies

Layer 1; EllipticCurveModularityImaginaryQuadratic Layers 1–8 as listed in the supplier contracts;
PotentialAutomorphyInfrastructure §2.3; FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3;
GL2AutomorphicRepresentationsAndTransfer R16.3.2 and R17.4.16; ComplexMultiplicationAndExplicitReciprocity
§4.1; AutomorphicGaloisRepresentationsPartII AG2.0 and AG2.7; EllipticCurves Layer 5; ClassFieldTheory
Layer 11; Mathlib's `L`-function of a Weierstrass curve.

## Layer 3: Finite-group and local cohomology at a protected place

### 3.1 The adjoint representation of SL₂, specialised

Let `k` be a field and let `ad⁰` be the trace-zero adjoint of the tautological representation of
`SL(2, k)` on `k²`, imported from ArithmeticGaloisRepresentations: for the abstract group `SL(2, k)`
it is that roadmap's §7.9 `ResidualImage.adZeroRep` of `Matrix.SpecialLinearGroup.toGL`, on the
trace-zero endomorphisms `LinearMap.ker (LinearMap.trace k (Fin 2 → k))` with `g · X = g X g⁻¹`;
for finite `k`, where `SL(2, k)` is a finite and hence profinite group, it is its §7.2
*ContinuousRep.adZero*, and it is the coefficient module of the groups `H¹(SL₂(k), ad⁰)` of its §7.7.
Prove that the central element `−1` acts trivially, so the representation factors through
`PSL₂(k)`, and that if `2 ∈ k^×` the invariants vanish: a trace-zero matrix commuting with
`U = [[1,1],[0,1]]` and with its transpose `Uᵀ` is zero, so `H⁰(SL(2, k), ad⁰) = 0`. For finite `k`
of odd characteristic with `#k ≠ 5` this vanishing is also part of ArithmeticGaloisRepresentations
§7.7, which states it together with `H¹(SL₂(k), ad⁰) = 0` and therefore excludes `𝔽₅`; the
statement here differs in covering every field with `2 ∈ k^×`, among them `𝔽₅`, the case Layer 4
uses, and every infinite field of characteristic other than two. The route: for
`X = [[x, y],[z, −x]]`, `UX − XU = [[z, −2x],[0, −z]]` and `UᵀX − XUᵀ = [[−y, 0],[2x, y]]`. The
trace form `⟨X, Y⟩ = tr(XY)`, its invariance and its perfectness on `ad⁰` when `2 ∈ k^×` (the trace
pairing on `M₂(k)` is perfect, `ad⁰` is the orthogonal of `k·1`, and the two are complementary,
`ad = k·1 ⊕ ad⁰`, when `2 ∈ k^×`; statements about the underlying `k`-modules), and base change
along a field embedding `k → k'` for a finite group acting, are ArithmeticGaloisRepresentations §7.2
and are used here in that form. (CaptainSude26, Lemma 3.1 and its proof, lines 187–192, for the
basis `e, h, f` and the action of `Ad(U)`; proof of Lemma 3.2, line 224, for the trace form; proof of
Lemma 3.3, line 234, for the vanishing of invariants over `𝔽₅`.)

*Needs:* ArithmeticGaloisRepresentations §§7.2, 7.9; Mathlib `Matrix.SpecialLinearGroup`,
`Matrix.SpecialLinearGroup.toGL`.

**Checks.**

- For `U = [[1,1],[0,1]]` the action on `e, h, f` is `e ↦ e`, `h ↦ h − 2e`, `f ↦ f + h − e`; left
  multiplication `X ↦ UX` is not the action, since `Uf = f + E₁₁` has trace one. When `2 ∈ k^×` the
  matrices of `ad⁰` fixed by `U` alone form the line `k e`, so the transpose is needed for the
  vanishing.
- The identity and `−1` act as the identity; the action of `diag(2, 3) ∈ SL(2, 𝔽₅)` scales `e` by
  `2/3 = 4`, `f` by `3/2 = 4` and fixes `h`.
- In characteristic two the identity matrix has trace `2 = 0`, lies in `ad⁰` and is fixed by every
  `g`, so `H⁰(SL(2, k), ad⁰) = k·1 ≠ 0` and the hypothesis `2 ∈ k^×` cannot be dropped; there the
  trace form also has `⟨h, h⟩ = 2 = 0` and Gram determinant `−2 = 0`, so the self-duality of
  ArithmeticGaloisRepresentations §7.2 is unavailable.
- Over `𝔽₅`, `(Ad(U) − 1)³ = 0` and `Ad(U)⁵ = 1`, while `(Ad(U) − 1)² ≠ 0` since it sends `f` to `−2e`.

### 3.2 The exceptional class of SL₂(𝔽₅) is detected by a unipotent subgroup

Prove: for `U = [[1,1],[0,1]] ∈ SL(2, 𝔽₅)` and its cyclic subgroup `⟨U⟩` of order five, restriction
`H¹(SL(2, 𝔽₅), ad⁰) → H¹(⟨U⟩, ad⁰)` is bijective, both groups being one-dimensional over `𝔽₅`,
and the target is spanned by the class corresponding to `f` under
`Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`. The same holds after extending scalars to any field
`k ⊇ 𝔽₅`, and for every subgroup of order five of `SL(2, 𝔽₅)`, these being conjugate. Injectivity is
restriction to a Sylow subgroup of index `24`, invertible in `𝔽₅` (ArithmeticGaloisRepresentations
§7.7); the source is one-dimensional by ArithmeticGaloisRepresentations §7.7; for the target, the norm
`1 + D + ⋯ + D⁴` of `D = Ad(U)` is `5 + 10(D − 1) + 10(D − 1)²`, which vanishes in characteristic five,
so `H¹(⟨U⟩, ad⁰) = ad⁰ / (D − 1)ad⁰ = ad⁰ / (k e ⊕ k h)`, spanned by the class of `f`.
(CaptainSude26, Lemma 3.3, lines 231–241.)

*Needs:* §3.1; Mathlib `groupCohomology.map`, `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`;
ArithmeticGaloisRepresentations §§7.2, 7.7, 7.9.

**Checks.**

- Over `𝔽₇` the same restriction is injective but not surjective: `H¹(SL(2, 𝔽₇), ad⁰) = 0` by
  ArithmeticGaloisRepresentations §7.7, while `H¹` of the order-seven unipotent subgroup is still
  one-dimensional. Bijectivity is special to five.
- Over `𝔽₃` the norm `N = 1 + D + D²` of `D = Ad(U)` is `(D − 1)²`, nonzero, and
  `ker N = k e ⊕ k h = (D − 1)ad⁰`, so `H¹(⟨U⟩, ad⁰) = 0`: an order-three unipotent detects nothing.
- Restriction to the order-three subgroup generated by `[[0,−1],[1,−1]]` is zero on `H¹`, since its
  order is invertible in `𝔽₅`; detection needs the Sylow-five subgroup.

### 3.3 Protected local residual data

Let `p` be an odd prime, `F_v` a finite extension of `ℚ_ℓ` with `ℓ ≠ p`, `k` a finite field of
characteristic `p` and `ρ̄ : G_{F_v} → GL₂(k)` continuous. Define `ρ̄` to be *protected* if `ρ̄(I_v)` is
nontrivial and consists of unipotent matrices. (CaptainSude26 treats only `p = 5`: Lemma 3.1, lines
177–183, assumes `μ₅ ⊂ F_v`, `ρ̄(τ) = U` and `ρ̄(φ) = 1`, and the paragraph after Lemma 5.1, lines
533–536, brings a protected split Tate curve over a field containing `μ₅` to that form.)

- `ρ̄|I_v` is trivial on the kernel of `I_v → ℤ_p(1)` and factors through the coefficient-`p` tame
  quotient of LocalGaloisDeformationRings §2.6; `ρ̄(I_v)` is cyclic of order `p`, generated by
  `ρ̄(τ)`, and in a suitable basis `ρ̄(τ) = U = [[1,1],[0,1]]`.
- In that basis `ρ̄(φ)` is upper triangular with diagonal entries of ratio `q_v`, since
  `ρ̄(φ) U ρ̄(φ)⁻¹ = U^(q_v)`; if `q_v ≡ 1 mod p`, `ρ̄(φ) = a(1 + bE₁₂)`, and when `b ∈ 𝔽_p` a change of
  tame lift `φ ↦ φτ^x` makes `ρ̄(φ)` scalar.
- The condition is preserved by restriction to `F'_w/F_v` of ramification index prime to `p`, by
  unramified twists and by duality; it is destroyed when `p` divides the ramification index.

*Needs:* LocalGaloisDeformationRings §2.6; ArithmeticGaloisRepresentations §6.3.

**Checks.**

- For a split Tate curve `E/F_v` with Tate parameter `q_E` and `p ∤ v(q_E)`, `E[p]` and its dual are
  protected: ArithmeticGaloisRepresentations §6.3 gives inertia acting by `[[1, v(q_E)·t_p(σ)],[0,1]]`.
- For `p | v(q_E)` the module `E[p]` is unramified, hence not protected; for
  `q_E = ϖ_v⁵` and `p = 5` this is the case.
- Over `𝔽₅` with `q_v = 11`, let inertia act through a tame quotient of order three, a generator
  mapping to `M = [[0, −1],[1, −1]]`, and let a Frobenius lift map to `Φ = [[4, 1],[0, 1]]`. Then
  `M³ = 1`, `ΦMΦ⁻¹ = [[4, 1],[4, 0]] = M⁻¹ = M¹¹`, as the tame relation requires since `11 ≡ 2 mod 3`,
  and `M` has characteristic polynomial `X² + X + 1`; inertia is nontrivial and not unipotent, so `ρ̄`
  is not protected. A diagonal model `diag(ζ₃, ζ₃⁻¹)` does not exist over `𝔽₅`, whose unit group has order
  four; it needs `𝔽₂₅`.
- For `p = 5`, after a base change of ramification index five, residual inertia becomes `U⁵ = 1`:
  protection is lost.

### 3.4 The unipotent-inertia condition at a protected place

Let `ρ̄` be protected, `ψ : G_{F_v} → O×` an unramified character lifting `det ρ̄`, `A ∈ CNL_O` and
`ρ_A : G_{F_v} → GL₂(A)` a lift of `ρ̄` with determinant `ψ`. Prove that the following are equivalent:
(i) `ρ_A(σ)` has characteristic polynomial `(X − 1)²` for every `σ ∈ I_v`; (ii)
`(ρ_A(τ) − 1)² = 0`; (iii) `ρ_A` is minimally ramified in the sense of LocalGaloisDeformationRings
§2.3. These lifts form a local deformation problem whose framed ring with determinant `ψ` is formally
smooth of relative dimension three, `R^{□,ψ,uni}_v ≅ O[[x₁, x₂, x₃]]`, and every such lift satisfies
`q_v (tr ρ_A(φ))² = (1 + q_v)² ψ(φ)`. The route: the kernel of `I_v → ℤ_p(1)` is a profinite group of
order prime to `p` on which `ρ̄` is trivial, so `ρ_A` maps it into the pro-`p` kernel of reduction and
hence trivially; thus `ρ_A|I_v` factors through `⟨τ⟩`.
By Cayley–Hamilton `N = ρ_A(τ) − 1` satisfies `N² = tr(N) N − det(N)`; a residually nonzero
off-diagonal entry is a unit, so (ii) forces `tr N = det N = 0` and conversely. In the basis
`(N e₂, e₂)`, `N = E₁₂`, and the relation `ρ_A(φ) N ρ_A(φ)⁻¹ = q_v N` forces
`ρ_A(φ) = [[q_v δ, z],[0, δ]]` with `δ² = ψ(φ)/q_v` and `δ` the unique square root lifting the residual
one. Residually this basis is `(e₁, e₂)`, in which `ρ̄(τ) = U`, so `z` lifts the upper-right entry `z̄`
of `ρ̄(φ)` in that basis. The free parameters are the entries `a ∈ 𝔪_A`, `b − 1 ∈ 𝔪_A` of
`N = [[a, b],[−a²/b, −a]]` and `z − [z̄] ∈ 𝔪_A`, with `[z̄] ∈ O` the Teichmüller lift; these are the
three coordinates `x₁, x₂, x₃`. (CaptainSude26, Lemma 3.1 and its proof, lines 177–220, for `p = 5`,
`μ₅ ⊂ F_v`, `ρ̄(τ) = U` and `ρ̄(φ) = 1`; the route above uses neither `μ_p ⊂ F_v` nor `ρ̄(φ) = 1`, only
the normal form of §3.3 and that `p` is odd.)

*Needs:* §3.3; LocalGaloisDeformationRings §§1.10, 2.3, 2.6, 2.8, 2.21.

**Checks.**

- Over `O[ζ₅]`, `ρ(τ) = [[ζ₅, 1],[0, ζ₅⁻¹]]` reduces to the protected `U` but has characteristic
  polynomial `(X − ζ₅)(X − ζ₅⁻¹) ≠ (X − 1)²`: residual protection does not imply the condition.
- For `q_v = 11`, `δ = 1` and `z = 0`, `ρ(φ) = diag(11, 1)` gives `11 · 12² = 1584 = 12² · 11`, the
  rank-two Steinberg Frobenius relation of LocalGaloisDeformationRings §2.5.
- The first-order lift with `ρ(τ) = (1 + εf)U` has trace `2 + ε` and violates (i); the lift with
  `ρ(τ) = (1 + εh)U` has trace `2` and determinant `1` and satisfies it.
- For `k = 𝔽₂₅`, `q_v = 11`, `ρ̄(τ) = U` and `ρ̄(φ) = 1 + ζE₁₂` with `ζ ∈ 𝔽₂₅ ∖ 𝔽₅`, `ρ̄(φ)` commutes
  with `U = U¹¹`, so `ρ̄` is protected and `z̄ = ζ ≠ 0`. No change of tame lift removes it: `φ ↦ φτ^x`
  replaces `ζ` by `ζ + x` with `x ∈ 𝔽₅`. The third coordinate is `z − [ζ]`; the coordinate `z` itself
  is a unit on every lift.

### 3.5 The tangent line and its dual

Let `ρ̄` be protected, `M = ad⁰ρ̄` over `k`, and `L_v ⊆ H¹(F_v, M)` the image of the tangent space of the
framed ring of §3.4. Prove: (a) `L_v = H¹_ur(F_v, M)` and `dim_k L_v = h⁰(F_v, M)`, which is `1` if
`q_v ≡ 1 mod p` and `0` otherwise; (b) under the local Tate pairing between `H¹(F_v, M)` and
`H¹(F_v, M(1))` (via the trace form of ArithmeticGaloisRepresentations §7.2), the annihilator
`L_v^⊥` is `H¹_ur(F_v, M(1))`; (c) if `μ_p ⊂ F_v`, then `h⁰ = h² = 1`, `h¹ = 2`, and under
`M(1) ≅ M` the line `L_v` is its own annihilator; (d) if `p ≥ 5`, `ρ̄(τ) = U` and `ρ̄(φ) = 1`,
recording cocycle values on `(τ, φ)`, `H¹(F_v, M) = k[(f, 0)] ⊕ k[(0, e)]` and `L_v = k[(0, e)]`.
For (a): unramified first-order lifts keep
`ρ̄|I_v` and so satisfy §3.4(i), giving `H¹_ur ⊆ L_v`; the framed ring of §3.4 has tangent dimension
three, so `dim L_v = 3 − (3 − h⁰) = h⁰`; and `dim H¹_ur = dim (M^(I_v))_φ = h⁰`. For (b): cup products of
unramified classes are inflated from `H²(Ẑ, −) = 0`, and the orders
`#H¹(M) = #H⁰(M) · #H⁰(M(1))` (`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`,
`TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed`) and `#H¹_ur(N) = #H⁰(N)` show the two
orthogonal subgroups are complementary; this is the counting argument of ArithmeticGaloisDuality
R02.4.2 without its hypothesis that `M` be unramified. For (c): `h⁰ = 1` by (a); `h² = h⁰(M(1)) = 1` by
local duality, the trace form and `M(1) ≅ M`; `h¹ = 2` by the Euler characteristic; and `M(1) ≅ M`
carries `L_v^⊥ = H¹_ur(F_v, M(1))` of (b) onto `H¹_ur(F_v, M) = L_v`. For (d): `ρ̄(φ) = 1` forces
`q_v ≡ 1 mod p`; for `D = Ad(U)`, as `(D − 1)³ = 0`, the sum `1 + D + ⋯ + D^(q_v − 1)` is
`q_v + C(q_v, 2)(D − 1) + C(q_v, 3)(D − 1)²` with binomial coefficients `C(q_v, j)`, which is `1`
because `p ≥ 5` and `p | q_v − 1`; the cocycle computation of the second Check then applies.
(CaptainSude26, Lemmas 3.1–3.2, lines 177–226, prove (a)–(d) for `p = 5`, `μ₅ ⊂ F_v`, `ρ̄(τ) = U` and
`ρ̄(φ) = 1`.)

*Needs:* §§3.1, 3.4; ArithmeticGaloisRepresentations §7.2; LocalGaloisDeformationRings §2.8; Tau
Ceti `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`,
`TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed`; ArithmeticGaloisDuality R02.4.2;
ClassFieldTheory Layer 5.

**Checks.**

- For `p = 5` and `μ₅ ⊂ F_v`: `M^(I_v) = k e`, so `h⁰ = 1`, `h² = h⁰(M(1)) = 1`, and the Euler
  characteristic gives `h¹ = 2`. Without `μ₅`, for `q_v ≡ 2 mod 5`, `φ` scales `e` by `2`, so `h⁰ = 0`
  and `L_v = 0`.
- In (d), for a cocycle `ξ`, the relation `φτφ⁻¹ = τ^(q_v)` forces `(D − 1)ξ(φ) = 0` because
  `1 + D + ⋯ + D^(q_v − 1) = 1` when `p ≥ 5` and `p | q_v − 1`; so `ξ(φ) ∈ k e`, `ξ(τ)` is free modulo
  `(D − 1)M = k e ⊕ k h`, and `dim H¹ = 4 − 2 = 2`.
- The ramified class `(f, 0)` is not in `L_v` (trace condition of §3.4(i)) and pairs nontrivially with
  `(0, e)`. As `L_v^⊥ = L_v = k[(0, e)]` here, a class `a(f, 0) + b(0, e)` lies in `L_v^⊥` only for
  `a = 0`, that is, only when its image in `H¹(I_v, M)` vanishes.

### Examples

For a split Tate curve over `ℚ₁₁` with Tate parameter `q_E`, `v(q_E) = 1` and `p = 5`, residual
inertia is `U`, residual Frobenius is `[[1, b],[0,1]]` with `b ∈ 𝔽₅`, the unipotent-inertia ring is
smooth of relative dimension three, `H¹(ℚ₁₁, ad⁰ρ̄)` is two-dimensional and the unramified line is
self-annihilating.

### Dependencies

Mathlib group cohomology, `Matrix.SpecialLinearGroup` and `Matrix.SpecialLinearGroup.toGL`; Tau
Ceti local duality and Euler characteristic; ArithmeticGaloisRepresentations §§6.3, 7.2, 7.7, 7.9;
ArithmeticGaloisDuality R02.4.2; LocalGaloisDeformationRings §§1.10, 2.3, 2.6, 2.8, 2.21;
ClassFieldTheory Layer 5.

## Layer 4: Global Galois cohomology at five with a protected place

### 4.1 Exceptional classes ramify at protected places

Let `F` be a number field with `μ₅ ⊂ F`, `k` a finite field of characteristic five, `ρ̄ : G_F → GL₂(k)`
continuous with image conjugate in `GL₂(k̄)` to `SL₂(𝔽₅)`, `M = ad⁰ρ̄`, `L` the field cut out by `ρ̄`,
`C_N = F(μ_(5^N))`, and `v ∤ 5` a place at which `ρ̄|G_{F_v}` is protected. Prove: a class
`κ ∈ H¹(G_F, M)` whose restriction to `G_{LC_N}` vanishes for some `N ≥ 1` and whose restriction to
`G_{F_v}` is unramified is zero. Consequently, for a finite set `S` and any subspace of
`H¹(G_{F,S}, M(1))` whose classes satisfy the dual condition `L_v^⊥` of §3.5 at `v`, restriction to
`G_{LC_N}` is injective. The route: `L ∩ C_N = F` because `SL₂(𝔽₅)` is perfect and `C_N/F` abelian;
inflation–restriction identifies the kernel of restriction to `G_{LC_N}` with
`H¹(Gal(LC_N/F), M) ≅ H¹(SL₂(𝔽₅), ad⁰ ⊗ k)`, the `Gal(C_N/F)`-part contributing `Hom(−, M^(SL₂)) = 0`
(`M^(SL₂) = (ad⁰)^(SL₂(𝔽₅)) ⊗ k = 0` by §3.1 at `𝔽₅` and the coefficient change of
ArithmeticGaloisRepresentations §7.7); `C_N/F` is unramified at `v`, so `I_v` maps onto an
order-five subgroup of `SL₂(𝔽₅) × {1}`; by §3.2 a nonzero class restricts nontrivially to it, and
inflation to `I_v` is injective, so `κ|G_{F_v}` would be ramified. (CaptainSude26, Lemma 3.3,
lines 227–241.)

*Needs:* §§3.1, 3.2, 3.3, 3.5; ArithmeticGaloisDuality R02.2; ArithmeticGaloisRepresentations §4.3
(perfectness via Mathlib `Matrix.SL2.commutator_eq_top`) and §7.7 (coefficient change).

**Checks.**

- Without a protected place the statement fails: the inflation of a nonzero class of
  `H¹(SL₂(𝔽₅), ad⁰)` vanishes on `G_L` and is unramified wherever `ρ̄` is.
- At a place where `ρ̄(I_v)` has order two, every class of `H¹(SL₂(𝔽₅), ad⁰)` restricts to zero on
  `ρ̄(I_v)`, so such a place protects nothing.
- For `ρ̄` with image `SL₂(𝔽₇)` and `μ₇ ⊂ F`, `H¹(SL₂(𝔽₇), ad⁰) = 0` (ArithmeticGaloisRepresentations
  §7.7) and the conclusion holds with no protected place.

### 4.2 Taylor–Wiles primes with a protected place

Keep the setting of §4.1, let `S` be a finite set of finite places containing the places above five
and the ramification of `ρ̄`, written `S = T ⊔ P` with `T` containing the places above five and `P` a
nonempty set of places at which `ρ̄` is protected. Put
`H_Q = ker(H¹(G_{F,S∪Q}, M(1)) → ⊕_{v∈P} H¹(F_v, M(1))/L_v^⊥ ⊕ ⊕_{w∈Q} H¹(F_w, M(1)))`. Prove: for every
`N ≥ 1`, every `r ≥ dim H_∅` and every finite set `B` of places there is a Taylor–Wiles datum `Q_N` of
level `N` in the sense of GlobalGaloisDeformations §5.1, of exactly `r` places of degree one over `ℚ`
outside `S ∪ B`, with `H_{Q_N} = 0`; each rational prime below `Q_N` is unramified in `F` and splits in
every imaginary quadratic subfield of `F`.

The route. As `μ₅ ⊂ F`, `M(1) ≅ M`. Let `g ∈ ρ̄(G_F)` correspond to `diag(2, 3)` under a conjugation of
`ρ̄(G_F)` onto `SL₂(𝔽₅)`; `Ad(g)` has eigenvalues `4, 1, 4` on `M` (on `e, h, f` for `diag(2, 3)`
itself), so `W = (Ad(g) − 1)M`, its `4`-eigenspace, is a hyperplane. Call `σ ∈ G_{C_N}` *detecting* for
a nonzero `κ ∈ H_∅` if `ρ̄(σ)` is conjugate to `g` and the value at `σ` of a cocycle representing `κ`
lies outside `(Ad ρ̄(σ) − 1)M`; this depends neither on the representative nor on `σ` within its
conjugacy class. A detecting `σ` with `ρ̄(σ) = g` exists. On `G_{LC_N}`, which acts trivially on `M`,
the cocycle is a homomorphism, nonzero by §4.1 and equivariant for conjugation by `G_F`; its values span
a nonzero `ρ̄(G_F)`-stable subspace, which is `M` because `M` is absolutely irreducible: after a
conjugation over `k̄`, `M ⊗ k̄` is the module `ad⁰ ⊗ k̄` of `SL₂(𝔽₅)`, which
ArithmeticGaloisRepresentations §7.2 identifies with `(Sym² V)^∨ ⊗ det V = (Sym² V)^∨` for the standard
representation `V`, and `Sym² V` is absolutely irreducible for `SL₂(𝔽₅)` by its §7.8 (`Sym^a` for
`0 ≤ a ≤ p − 1`, here `a = 2 ≤ 4`), hence so is its dual. So some `κ(γ)`, `γ ∈ G_{LC_N}`, lies outside
`W`. Since `L ∩ C_N = F` there is `σ₀ ∈ G_{C_N}` with `ρ̄(σ₀) = g`, and `κ(γσ₀) = κ(γ) + κ(σ₀)`, so
`σ₀` or `γσ₀` is detecting. In a finite Galois quotient
through which `κ`, `ρ̄` and `Gal(C_N/F)` factor, a place `w ∉ S` with Frobenius in the class of a
detecting element has `q_w ≡ 1 mod 5^N`, distinct residual eigenvalues and `κ|G_{F_w} ≠ 0`, because an
unramified class at `w` is its value at `Frob_w` modulo `(Ad ρ̄(Frob_w) − 1)M`; places with Frobenius in
the class of `σ₀` have the first two properties whatever `κ` is. These are the detecting and padding
classes of GlobalGaloisDeformations §5.6, which, with the places above primes ramified in `F` added to
`B`, yields `r` places of degree one over `ℚ` with jointly injective localizations on `H_∅` (Chebotarev
Layer 10); a rational prime with an unramified place of degree one in `F` splits in every quadratic
subfield. A class of `H_{Q_N}` is trivial on `G_{F_w}` for `w ∈ Q_N`, so it is unramified there and lies
in `H_∅` with zero localizations at `Q_N`; it vanishes. (CaptainSude26, Lemma 3.4, lines 242–263;
replaces AKT23, Lemma A.5, line 3979, and CrystallineLocalGlobalCompatibilityCM §9.3 in this case.)

*Needs:* §4.1; ArithmeticGaloisRepresentations §§7.2, 7.8; GlobalGaloisDeformations §§3.6, 5.1, 5.6;
Chebotarev Layer 10.

**Checks.**

- `diag(2, 3)` lies in `SL₂(𝔽₅)` (`6 ≡ 1`), has distinct eigenvalues and acts on `e, f` by `4` and on
  `h` by `1`, so its coinvariants on `ad⁰` are one-dimensional.
- If every protected place were put into the framing set `T`, no dual condition would remain at a
  place of `P`, and the inflated exceptional class would lie in every `H_Q`: its values at a
  Taylor–Wiles Frobenius `g`, of order prime to five, are coboundaries on `⟨g⟩`, so it is locally
  trivial at every Taylor–Wiles prime, and `H_Q` never vanishes. Framing only part of `P` does no
  harm: at a protected place left unframed the inflated class is ramified (§4.1) and fails `L_v^⊥`.
- For `H_∅ = 0` the padding class still yields exactly `r` primes; the size is independent of `N`.
- Vanishing invariants do not give the spanning step: for the upper triangular subgroup `B` of
  `SL₂(𝔽₅)`, `ad⁰` has no nonzero invariant (`U` fixes only `k e`, which `diag(2, 3)` scales by `4`), yet
  `k e` is `B`-stable. For `SL₂(𝔽₅)` the transpose moves it: `Ad(Uᵀ)e = e − h − f` and
  `Ad(Uᵀ)²e = e − 2h − 4f`, which with `e` have determinant `2 ≠ 0` in the basis `e, h, f`, so they
  span `ad⁰`.

### 4.3 The relative presentation with unframed protected places

Let `F` be a CM field with `μ₅ ⊂ F`, `d = [F⁺:ℚ]`, `ρ̄` and `S = T ⊔ P` as in §4.2 with `t = |T|`, and `𝒮`
a fixed-determinant (`ε₅⁻¹`) global deformation problem with arbitrary local conditions `R_v` at
`v ∈ T` and the unipotent-inertia condition of §3.4 at `v ∈ P`. For `Q_N` from §4.2 with `|Q_N| = r` and
the augmented problem `𝒮_{Q_N}` unrestricted at `Q_N`, prove that the `T`-framed ring `R^{□T}_{𝒮_{Q_N}}`
is a quotient of `R^loc_T[[x₁, …, x_g]]` with `R^loc_T = ⊗̂_{v∈T} R_v` and `g = r − 3d − 1 + t`,
independent of `N`. The protected places have no factor in `R^loc_T`. In the formula of
GlobalGaloisDeformations §3.6 the global invariants vanish (as in §4.1: §3.1 at `𝔽₅` and the
coefficient change of ArithmeticGaloisRepresentations §7.7), each complex place contributes `−3`, each
Taylor–Wiles place `dim L_w − h⁰ = 1` (LocalGaloisDeformationRings §2.16), each protected place
`dim L_v − h⁰ = 0` (§3.5(a)), and the dual group vanishes (§4.2); the surjection is
GlobalGaloisDeformations §3.7, whose tangent-generator part needs no liftability at `P`.
(CaptainSude26, proof of Theorem 4.2, lines 416–444.)

*Needs:* §§3.1, 3.4, 3.5, 4.2; GlobalGaloisDeformations §§3.4, 3.6, 3.7, 5.1;
LocalGaloisDeformationRings §2.16; ArithmeticGaloisRepresentations §7.7 (coefficient change).

**Checks.**

- For `F = ℚ(ζ₅)` (`d = 2`, a single place above five), `T` that place (`t = 1`) and `r = 6`, the least
  value with `g ≥ 0`, the count is `g = 6 − 6 − 1 + 1 = 0`, the value at six primes, `[F⁺:ℚ] = 2` and
  one framed place of the count of CrystallineLocalGlobalCompatibilityCM §9.3 (the number of
  Taylor–Wiles primes, less `3[F⁺:ℚ] + 1`, plus the number of framed places, all of its ramification
  set being framed); only the formula is compared, since that section needs an imaginary quadratic
  subfield, which `ℚ(ζ₅)` lacks. No field with `d = 1` is an instance: an imaginary quadratic field
  does not contain `μ₅`.
- For `d = 2`, `t = 3`, `r = 10` and local rings of relative dimension `3` away from five and
  `3 + [F_v:ℚ₅]` above five, `dim R^loc_T = 1 + 9 + 4 = 14`, `g = 6`, `dim R^loc_T[[x]] = 20 = r + 4t − d`,
  and the framing algebra with `Z₅^r` has dimension `1 + (4t − 1) + r = 22 = r + 4t`: the deficit is
  `d`, as for `PGL₂` over a CM field.
- Framing the protected places instead would add `|P|` generators and three local dimensions per
  place, leaving the deficit `d` unchanged, but loses the dual condition of §4.2 (second Check there).

### Examples

For a CM field `F ⊇ ℚ(ζ₅)` prepared as in Layer 6 and one protected place above a prime
`q ≡ 1 mod 5`, the inflation of the nonzero class of `H¹(SL₂(𝔽₅), ad⁰)` is ramified at the protected place,
so it is excluded from the dual Selmer group before any Taylor–Wiles prime is chosen.

### Dependencies

Layer 3; ArithmeticGaloisDuality R02.2; ArithmeticGaloisRepresentations §§4.3, 7.2, 7.7, 7.8;
GlobalGaloisDeformations §§3.4, 3.6, 3.7, 5.1, 5.6; LocalGaloisDeformationRings §2.16; Chebotarev Layer 10.

## Layer 5: Hecke algebras and patching with a protected place

### 5.1 Protected prepared data

Define a *protected prepared datum* to consist of a CM field `F` with `μ₅ ⊂ F`, an isomorphism
`ι : Q̄₅ ≅ ℂ`, finite sets of finite places `S = S₅ ⊔ R ⊔ P` with `S₅` the places above five,
`S₅ = S₅^cr ⊔ S₅^st`, `R ∪ P` prime to five, `P` nonempty and `P^c ∩ S = ∅`, and a cuspidal regular
algebraic weight-zero `π` of `PGL₂(𝔸_F)`, such that: (i) each rational prime that ramifies in `F` or
lies below a place of `S` has two places in some imaginary quadratic subfield of `F`; (ii) for each
`v ∈ S₅`, with `v̄` the place of `F⁺` below it, there is a five-adic `v̄' ≠ v̄` with
`Σ_{w̄ ≠ v̄, v̄'} [F⁺_w̄ : ℚ₅] > [F⁺:ℚ]/2`, and the residue field of `v̄` is larger than `𝔽₅`; (iii)
`π_v` is unramified for `v ∉ R ∪ P ∪ S₅^st` and `π_v^(Iw_v) ≠ 0` for `v ∈ R ∪ P ∪ S₅^st`; (iv) for
`v ∈ S₅^st`, `π` is `ι`-ordinary of weight zero at `v` and `r_ι(π)|G_{F_v}` is non-crystalline ordinary;
(v) `ρ̄ = r̄_ι(π)` has image conjugate to `SL₂(𝔽₅)` and is decomposed generic; (vi) `ρ̄|G_{F_v}` is
trivial for `v ∈ S₅ ∪ R`; (vii) `ρ̄|G_{F_v}` is protected for `v ∈ P`. (CaptainSude26, §4, lines
264–289; CN23, §5.6, lines 4226–4260.)

- The level `K^P = ∏ K_v ⊂ PGL₂(Ô_F)` is `PGL₂(O_{F_v})` outside `R ∪ P ∪ S₅^st` and `Iw_v` on
  `R ∪ P ∪ S₅^st`; it has no pro-`v` Iwahori auxiliary places.
- The framing set is `T = S₅ ⊔ R`; the unitary parabolics at five and the maximal ideal `𝔪` are those of
  CrystallineLocalGlobalCompatibilityCM §9.4 for the partition of `S₅`.
- CrystallineLocalGlobalCompatibilityCM §8.7 makes the localized complexes at `K^P` perfect. Its
  hypotheses (`p` odd, `ζ_p ∈ F`, `ρ̄_𝔪` absolutely irreducible, a free rank-one coefficient module
  with trivial reduction) hold by `μ₅ ⊂ F`, by (v), and because every coefficient character used at
  this level is trivial modulo `ϖ`.
- Forgetting `P` into the Iwahori places, that is replacing `R` by `R ∪ P`, gives the data and
  clauses (5)–(13) of CrystallineLocalGlobalCompatibilityCM §9.1, and clause (14) at every place
  except those of `P`: clause (10) holds because `S = S₅ ∪ (R ∪ P)` and `ζ₅ ∈ F`, so clauses (11) and
  (12) are vacuous; clause (15) fails, by (v).

*Needs:* §3.3; CrystallineLocalGlobalCompatibilityCM §§8.7, 9.1, 9.4; AutomorphicGaloisRepresentationsPartII
AG2.7.

**Checks.**

- `P = ∅` is excluded: with image `SL₂(𝔽₅)` and `ζ₅ ∈ F` that is exactly the configuration excluded by
  clause (15) of CrystallineLocalGlobalCompatibilityCM §9.1.
- A place `v ∈ P` with `v^c ∈ R` violates `P^c ∩ S = ∅`.
- Condition (i) at five and `μ₅ ⊂ F` make every five-adic place `v̄` of `F⁺` split in `F` with
  `F⁺_v̄ = F_v ⊇ ℚ₅(ζ₅)`, so its ramification index is divisible by four, and (ii) asks residue degree
  at least two: every five-adic local degree of `F⁺` is a multiple of four and at least eight. With
  `[F⁺:ℚ] = 40` and five-adic places of `F⁺` of ramification index four and residue degrees `(2, 2, 6)`,
  condition (ii) holds at the two places of degree eight (complementary sum `24 > 20`) and fails at the
  place of degree twenty-four (complementary sum `8 < 20`), so the datum is not prepared; with five
  places of ramification index four and residue degree two the complementary sum is `24 > 20`
  everywhere. No smaller `[F⁺:ℚ]` satisfies (ii) at every place: two degrees of at least eight force
  `[F⁺:ℚ] > 32`, the degree is a multiple of four, and at `36` every place would need degree eight,
  which does not divide `36`.
- A residue field `𝔽₅` above five violates (ii) even when `ρ̄` is trivial there.

### 5.2 The protected deformation problems

For a protected prepared datum, a tuple `χ = (χ_v)_{v∈R}` of characters `k_v× → O×` trivial modulo `ϖ`
and a Taylor–Wiles datum `Q` from §4.2 with `Q ∩ (S ∪ S^c) = ∅` (the output of §4.2 for a forbidden
set `B ⊇ S^c`), define `𝒮^P_χ` as the problem `𝒮_χ` of
CrystallineLocalGlobalCompatibilityCM §9.5 on `S₅ ∪ R` (fixed-determinant Barsotti–Tate rings at
`S₅^cr`, the ordinary rings `R^△_v` at `S₅^st`, the character-type rings `R^{ε₅⁻¹, χ_v}_v` at `R`) together
with the unipotent-inertia condition of §3.4 at every `v ∈ P`, framed at `T = S₅ ⊔ R`; and `𝒮^P_{χ,Q}`
by adding the unrestricted fixed-determinant rings at `Q` with the `O[Δ_Q]`-structure of
GlobalGaloisDeformations §5.5. (CaptainSude26, §4, lines 285–289; CN23, §5.6, line 4361.)

- `𝒮^P_χ` and `𝒮^P_1` have the same reduction modulo `ϖ`, because each `χ_v ≡ 1 mod ϖ` and the protected
  condition does not depend on `χ`.
- Killing the augmentation ideal of `O[Δ_Q]` recovers `𝒮^P_χ` from `𝒮^P_{χ,Q}`.
- Its `T`-framed rings have the presentation of §4.3 over `R^loc_χ = ⊗̂_{v∈T} R_{v,χ}`, of dimension
  `1 + 3t + 2d`.
- The coefficient module on `K^P` is `O(χ⁻¹)` at `R` and trivial at `P`.
- The level at a Taylor–Wiles datum `Q` is the pair `K^P(Q)`: compact open subgroups
  `K^P_1(Q) ⊆ K^P_0(Q) ⊆ K^P`, both equal to `K^P` at every place outside `Q`. For `w ∈ Q`, where
  `K^P_w = PGL₂(O_{F_w})` because `w ∉ S`, `K^P_0(Q)_w = Iw_w` and `K^P_1(Q)_w` is the kernel of the
  homomorphism `Iw_w → Δ_w` sending the class of `[[a, b],[c, d]]` to the image of `a/d mod ϖ_w`, where
  `Δ_w` is the largest quotient of `k_w×` of five-power order; `a/d` is unchanged by scalars, so the map
  is defined on `PGL₂`. Hence `K^P_0(Q)/K^P_1(Q) ≅ Δ_Q = ∏_{w∈Q} Δ_w`. These are the groups
  `K₀(Q) ⊇ K₁(Q)` of CrystallineLocalGlobalCompatibilityCM §§9.6 and 9.9 for the level `K^P` (ACC23,
  §6.5, p. 169, lines 6819–6824, taken in `PGL₂` as in CN23, line 4367), and an object at the level
  `K^P(Q)` is the one that section builds from `C•(K^P_0(Q)/K^P_1(Q), O(χ⁻¹))`.

*Needs:* §§3.4, 4.2, 4.3, 5.1; CrystallineLocalGlobalCompatibilityCM §§9.5, 9.6, 9.8, 9.9;
GlobalGaloisDeformations §§3.4, 5.5; LocalGaloisDeformationRings §§2.15, 3.14, 4.14–4.15, 6.6.

**Checks.**

- For `Q = ∅` the augmented problem is `𝒮^P_χ`; for `χ = 1` the coefficient module is trivial.
- The Steinberg lifts of LocalGaloisDeformationRings §2.5 are defined for trivial residual data and do
  not apply at `P`, where `ρ̄` is protected; the condition used is §3.4's.
- For the smallest configuration of §5.1 (`d = 40`, ten five-adic places of `F` of local degree eight)
  and `R = ∅`, `t = 10` and `dim R^loc_χ = 1 + 10 · (3 + 8) = 111 = 1 + 3t + 2d`: the protected places add
  nothing to the local base.

### 5.3 Hecke-valued representations satisfy the protected problems

For a protected prepared datum, every `χ` and every Taylor–Wiles datum `Q` of §4.2 with
`Q ∩ (S ∪ S^c) = ∅`, prove: there are `N ≥ 1` depending only on `[F:ℚ]`, ideals `J_{χ,Q}` with
`J_{χ,Q}^N = 0` and surjective `O[Δ_Q]`-algebra maps `R_{𝒮^P_{χ,Q}} → T_{χ,Q}/J_{χ,Q}`, where `T_{χ,Q}`
is the derived Hecke image of CrystallineLocalGlobalCompatibilityCM §9.9 at the level `K^P(Q)`, matching
the characteristic polynomials of Frobenius at `v ∉ S ∪ Q` with `P_v(X)`, compatible with reduction
modulo `ϖ` from `χ` to `1` and with augmentation from `Q` to `∅` as in ACC23, §6.4.1. The route is the
construction of CrystallineLocalGlobalCompatibilityCM §§9.7 and 9.9 with `R ∪ P` in the role of the
Iwahori places `R` on the automorphic side. What `P` adds is one verification at each `v ∈ P`: over
`T_{χ,Q}/J_{χ,Q}`, `tr ρ(σ) = 2` and `det ρ(σ) = 1` for every `σ ∈ I_v`. For `2 × 2` matrices these two
identities are condition (i) of §3.4, and §3.4 holds over every object of `CNL_O`, nonreduced ones
included, so on each local factor of that finite `O`-algebra they are all that the local problem at `v`
asks. An identity between ring elements persists along a ring homomorphism and descends along an
injective one. So, as for the character-type condition at `R` in CrystallineLocalGlobalCompatibilityCM
§9.7, it suffices to prove the two identities modulo a nilpotent ideal at a neat `GL₂` level, over the
Hecke algebra enlarged by the torus operators (into which the original Hecke algebra embeds after a
further nilpotent quotient), and to carry them to `K^P(Q)` along the ring maps and finitely many
nilpotent quotients of CrystallineLocalGlobalCompatibilityCM §8.6. That section makes the level neat by
shrinking it only at the places above two auxiliary rational primes, chosen outside
`(S ∪ Q) ∪ (S ∪ Q)^c`, so the neat level is still `Iw_v` at `v` (CaptainSude26, lines 367–372). There
the inertial comparison identifies `det(X − ρ(σ))` with the torus polynomial `P_{v,σ}`, built from the
operators of `diag(u, 1)` and `diag(1, u)`, where `u ∈ O_{F_v}^×` corresponds to `σ` under local
reciprocity. Both matrices lie in `Iw_v` and the coefficient module is trivial at `v` (§5.2), so both
operators are the identity and `P_{v,σ} = (X − 1)²`. Since `P^c ∩ S = ∅` and `Q ∩ S^c = ∅`, no place
of `P^c` lies in `S ∪ Q`, so `K^P(Q)` is hyperspecial on `P^c`. The inertial
comparison (`gap:acc-torsion-inertial-comparison`) is applied with the conjugation-stable set
`(S ∪ Q) ∪ (S ∪ Q)^c` and the Iwahori-type set `R ∪ P ∪ Q`; every conjugate of a place of `R ∪ P ∪ Q`
that is not itself in `R ∪ P ∪ Q` lies outside `S ∪ Q` and has hyperspecial level, so the representation
is unramified outside `S ∪ Q`, in particular at `P^c` (CaptainSude26, lines 299–314). (CaptainSude26,
Lemma 4.1, lines 291–408; CN23, Propositions 5.6.2–5.6.3, lines 4334–4390; ACC23, Theorem 3.1.1, line
2346.)

*Needs:* §§3.4, 5.1, 5.2; CrystallineLocalGlobalCompatibilityCM §§8.6, 9.4, 9.6, 9.7, 9.9;
`gap:acc-torsion-inertial-comparison` (AutomorphicGaloisRepresentationsPartII AG2.5).

**Checks.**

- At `v ∈ P`, on `Iw_v` with the trivial coefficient module, the operators of `diag(u, 1)` and
  `diag(1, u)`, `u ∈ O_{F_v}^×`, are the identity and `P_{v,σ} = (X − 1)²`. Were the coefficient module
  at `v` the character `χ_v⁻¹(a/d)` used at `R`, they would act by `χ_v(u)⁻¹` and `χ_v(u)`, giving
  `(X − χ_v(u))(X − χ_v(u)⁻¹)`, whose roots are not `1` once `χ_v(u) ≠ 1`: not the protected condition.
- At level `Iw_{v,1}` (pro-`v` Iwahori) the torus operators act through `k_v×` and the polynomial is not
  forced to be `(X − 1)²`; the full Iwahori level at `P` is part of the datum.
- For `Q = ∅` the maps are those of the first construction, with `Δ_∅ = 1`.
- The exclusion `Q ∩ S^c = ∅` is needed. A place `w = v^c` with `v ∈ P`, `q_w = 11` and
  `ρ̄(Frob_w) = diag(2, 3)` over `𝔽₅` meets the Taylor–Wiles conditions (`11 ≡ 1 mod 5`, determinant
  `6 ≡ 1`, distinct eigenvalues), but putting it into `Q` replaces `PGL₂(O_{F_w})` at `w` by
  `K^P_0(Q)_w = Iw_w`, of index `q_w + 1 = 12`, and `K^P_1(Q)_w`, of index `12 · 5 = 60` (`#k_w× = 10`,
  so `Δ_w` has order five); over `𝔽₅[ε]/(ε²)` the inertia image `diag(1 + ε, 1 − ε)` has determinant
  `1 − ε² = 1`, commutes with `diag(2, 3)` and equals its eleventh power `diag(1 + 11ε, 1 − 11ε)`, so
  `𝒮^P_{χ,Q}` would contain a lift ramified at a place of `P^c`.

### 5.4 The prepared protected lifting theorem

For a protected prepared datum, let `ρ : G_F → GL₂(Q̄₅)` be continuous with `ρ̄ ≅ r̄_ι(π)`,
`det ρ = ε₅⁻¹`, unramified outside `S`, every element of `ρ(I_v)` of characteristic polynomial `(X − 1)²`
for `v ∈ R ∪ P`, Barsotti–Tate at `S₅^cr` and ordinary there exactly where `r_ι(π)` is, and a
non-crystalline extension of `ε₅⁻¹` by the trivial character at `S₅^st`. Prove that `ρ ≅ r_ι(Π)` for a
cuspidal regular algebraic weight-zero `Π` of `PGL₂(𝔸_F)`. The route is the patching proof of
CrystallineLocalGlobalCompatibilityCM §9.10 with three changes: framing at `T = S₅ ⊔ R` with the
protected conditions imposed in the global problems, Taylor–Wiles data from §4.2 with forbidden set
`B = S^c` (so `Q_N ∩ (S ∪ S^c) = ∅`) and presentations from §4.3, and Hecke maps from §5.3. Patch
the two systems `χ = 1` and `χ` with `χ_v² ≠ 1` (possible since `q_v ≡ 1 mod 5` at `R`) by
DeformationAndDerivedPatchingAlgebra §§8.1–8.5 with the perfect complexes of
CrystallineLocalGlobalCompatibilityCM §9.6 at `K^P`. The dimensions `dim R_∞ = r + 4t − d` and
`dim S_∞ = r + 4t` give deficit `d = l₀`. The components at five are those of LocalGaloisDeformationRings
§§4.14–4.15 and 6.6, those at `R` those of §2.15; `P` has no factor in the local base (§4.3), so no
component is chosen there. Propagation of
automorphic support is CrystallineLocalGlobalCompatibilityCM §§8.2–8.5, and the weight-zero rational
comparison of §9.10 turns the support point into `Π`. (CaptainSude26, Theorem 4.2 and proof,
lines 410–498; CN23, Proposition 5.6.1, line 4261.)

*Needs:* §§4.2, 4.3, 5.1, 5.2, 5.3; CrystallineLocalGlobalCompatibilityCM §§7.5, 8.2–8.5, 9.6, 9.10;
DeformationAndDerivedPatchingAlgebra §§8.1–8.5; LocalGaloisDeformationRings §§2.15, 3.14, 4.14–4.15,
6.6; GlobalGaloisDeformations §3.4.

**Checks.**

- If `ρ` had inertia at `v ∈ P` acting through `ζ₅^(±1)` (first Check of §3.4) it would not define a point
  of the patched problem, although `ρ̄` is protected.
- At each place above five, `π` and `ρ` must give points of one irreducible component of the local
  ring: at `S₅^cr` both ordinary or both non-ordinary, at `S₅^st` both non-crystalline ordinary. An
  ordinary `r_ι(π)` with a supersingular `ρ` at a place of `S₅^cr` is excluded by the hypotheses.
- For the smallest configuration of §5.1 (`d = 40`, `t = 10`, `R = ∅`) the deficit is forty, matching
  `l₀ = 40` for `PGL₂` over a CM field of degree eighty, one for each complex place; at `r = 111`, the
  least value with `g ≥ 0`, `dim R_∞ = 111 = r + 4t − d` and `dim S_∞ = 151 = r + 4t`.

### Examples

A protected prepared datum arises from two elliptic curves over a prepared CM field containing `μ₅`
with isomorphic mod-five representations of image `SL₂(𝔽₅)`, the modular one supplying `π`, both
semistable at `S`, split multiplicative at a place `v ∈ P` with five not dividing `v(Δ)`, and good at
`v^c` (Layer 7).

### Dependencies

Layers 3–4; CrystallineLocalGlobalCompatibilityCM §§7.5, 8.2–8.7, 9.1, 9.4–9.10;
DeformationAndDerivedPatchingAlgebra §§8.1–8.5; GlobalGaloisDeformations §§3.4, 5.5;
LocalGaloisDeformationRings §§2.15, 3.14, 4.14–4.15, 6.6; AutomorphicGaloisRepresentationsPartII
AG2.5 through `gap:acc-torsion-inertial-comparison`, and AG2.7.

## Layer 6: The lifting theorem at five with a protected place

### 6.1 Solvable preparation keeping the protected places

Let `F` be a CM field with `ζ₅ ∈ F`, `ρ : G_F → GL₂(Q̄₅)` and `π` satisfying conditions (1)–(3) and (5) of
CN23 Theorem 5.2 at `p = 5` with `ρ̄(G_F)` conjugate to `SL₂(𝔽₅)`, and `P` a nonempty finite set of places
`v ∤ 5` such that, for every `v ∈ P`: `ρ̄|G_{F_v}` is protected; every element of `ρ(I_v)` has
characteristic polynomial `(X − 1)²`; `π_v^(Iw_v) ≠ 0`; and `ρ`, `π` are unramified at `v^c`. Prove: there
is a finite solvable Galois CM extension `F'/F`, linearly disjoint over `F` from the field cut out by
`ρ̄`, in which every place of `P ∪ P^c` of odd residue characteristic splits completely and every place
of `P ∪ P^c` above two has ramification index dividing four, such that `F'`, `S' = S'₅ ⊔ R' ⊔ P'` with
`P'` the places above `P`, the base change `π_{F'}` and `ρ|G_{F'}` satisfy §5.1 and the hypotheses of
§5.4. The route is the preparation of CrystallineLocalGlobalCompatibilityCM §9.11 (choice of its finite
set `V` of auxiliary places of `F`: places prime to `10` at which `ρ` and `π` are unramified, containing
every place above one rational prime witnessing the decomposed genericity of `ρ̄` and, for each
extension `L' ≠ F` of `F` inside the field cut out by `ρ̄` (here `F(ζ₅) = F`), a place that does not
split completely in `L'`, so that a finite Galois `F'/F` in which `V` splits completely keeps
`ρ̄(G_{F'}) = ρ̄(G_F)` and that witness (CN23, lines 4455–4463); prescribed completions over `F⁺`
through GL2ModularityLifting §1.7 and PotentialAutomorphyInfrastructure §2.5; the five-adic degree
condition; then the three imaginary quadratic composita), whose construction does not use clause (15).
Write `F₁` for the CM field reached before the degree condition and `F₁⁺` for its maximal totally real
subfield. The degree condition comes from the composite `F₁E` with a totally real Galois extension
`E/ℚ` of degree eight with solvable group, linearly disjoint from a finite Galois extension of `ℚ`
containing `F₁` and the field cut out by `ρ̄`, in which five and every rational prime under a place of
`V` split completely (PotentialAutomorphyInfrastructure §2.5 applied over `ℚ` with the real place
split gives a cyclic one; CaptainSude26 lines 582–588 uses a multiquadratic one). By linear disjointness
`[F₁⁺E:ℚ] = 8[F₁⁺:ℚ]`, and as `E ⊗ ℚ₅ ≅ ℚ₅⁸`, above each five-adic place `u` of `F₁⁺` lie eight
places `w` of `F₁⁺E`, each with `(F₁⁺E)_w = (F₁⁺)_u`; so `[(F₁⁺E)_w:ℚ₅] ≤ [F₁⁺:ℚ] = [F₁⁺E:ℚ]/8`. The
final field `F'` is CM and contains the totally real `F₁⁺E`, so `F₁⁺E ⊆ F'⁺`; for a place `w'` of `F'⁺`
over `w`, `[F'⁺_{w'}:(F₁⁺E)_w] ≤ [F'⁺:F₁⁺E]`, and the product gives `[F'⁺_{w'}:ℚ₅] ≤ [F'⁺:ℚ]/8`. The
five-adic local degrees of `F'⁺` add up to `[F'⁺:ℚ]`, so `F'⁺` has at least eight five-adic places,
and removing any two of them leaves a sum of at least `(3/4)[F'⁺:ℚ] > [F'⁺:ℚ]/2`: the degree half of
condition (ii) of §5.1, whose residue-field half comes from the prescribed completions. Since `E` comes
before the composita, the primes ramified in `E` are among those ACC23 requires to split in `E_b`. The
route makes three additions at `P`: trivial prescribed completions at the places of `F⁺` below `P`,
which split in `F` because `v^c ≠ v`; the rational primes below `P` among those split completely in `E`;
and the odd rational primes below `P` among the primes required to split in each of the three imaginary
quadratic fields `E_a`, `E_b = ℚ(√−d_b)`, `E_c = ℚ(√−d_c)` (ACC23 already requires it in `E_b`, `ρ` being
ramified at `P`). Two splits in `E_a` but never in `E_b` (third Check), so at a place `v` of `P ∪ P^c`
above two the composita give `F'_w = F_v(√−d_b, √−d_c)`, of degree dividing four over `F_v`. Since `ζ₅ ∈ F` no auxiliary smooth places are added. Linear disjointness and
perfectness of `SL₂(𝔽₅)` preserve `ρ̄(G_{F'}) = ρ̄(G_F)`; decomposed genericity is preserved by
PotentialAutomorphyInfrastructure §2.1 or a split witness. At a place of `P'` the completion is that of
`P` or, above two, an extension of ramification index dividing four, which is prime to five: protection
persists (§3.3), unipotent inertia persists on the smaller inertia group, Iwahori vectors persist
because the parameter of `π_v` is trivial on inertia, and `P'^c` lies outside `S'`. (CN23, end of the
proof of Theorem 5.2, lines 4433–4509; CaptainSude26, proof of Proposition 5.2, lines 543–603; ACC23,
§6.5.12, p. 178, lines 7163–7187, for the three imaginary quadratic fields.)

*Needs:* §§3.3, 5.1; CrystallineLocalGlobalCompatibilityCM §9.11; GL2ModularityLifting §1.7;
PotentialAutomorphyInfrastructure §§2.1, 2.3, 2.5; PotentialModularityAndCompatibleSystems §§2.12–2.16;
AutomorphicGaloisRepresentationsPartII AG2.7.

**Checks.**

- A ramified prescribed completion of index five at a place of `P` would make residual inertia
  `U⁵ = 1`; the preparation keeps every place above `P` of odd residue characteristic split, and above
  two its ramification index divides four.
- If `ρ(I_{v^c})` is infinite, or finite of order divisible by five (for instance when `ρ̄` is also
  protected at `v^c`), no CM extension `F'/F` reaches `P'^c ∩ S' = ∅` with `P'` protected. Complex
  conjugation of `F'` matches each place above `v^c` with a place above `v` of isomorphic completion and
  equal ramification index. Making `ρ` unramified at a place above `v^c` is impossible when `ρ(I_{v^c})`
  is infinite (an open subgroup of an infinite profinite group is nontrivial) and otherwise forces a
  ramification index divisible by five there, hence at the matching place above `v`, where residual
  inertia is generated by a power of `U⁵ = 1` and is trivial (§3.3, third bullet). If instead
  `ρ(I_{v^c})` has order three, a prescribed completion of ramification index three at the place of `F⁺`
  below `v` makes `ρ` unramified above `v^c` and keeps protection above `v`, three being prime to five.
  The preparation of this section prescribes trivial completions at `P ∪ P^c` and adds there only the
  ramification of the imaginary quadratic composita above two, so it needs `ρ` and `π` unramified at
  `v^c`.
- Above two the three fields cannot all split. Under the conditions of ACC23 §6.5.12 (lines
  7165–7172: five is unramified, and an odd prime other than five ramified in one of `E_b`, `E_c` splits
  in the other), two splits in `E_a` and never in `E_b`. If `−d_b` were a square in `ℚ₂`, the Hilbert
  symbol `(−d_b, −d_c)_l` would be `1` at `l = 2`, at every odd prime dividing `d_b` (it splits in `E_c`),
  at every odd prime dividing `d_c` (it splits in `E_b`) and at every other prime, and `−1` at the real
  place, against the product formula. For ACC23's choice `E_b = ℚ(√−p_b)`, `E_c = ℚ(√−p_c)` with
  `p_b ≡ 1 mod 4` and `p_c ≡ 1 mod 4p_b`, the completion of `E_bE_c` at two is `ℚ₂(√−p_b, √−p_c)`; it
  contains the unramified `ℚ₂(√(p_b p_c))` (`p_b p_c ≡ 1 mod 4`) and has ramification index two, prime to
  five, so a protected place above two stays protected.
- For `q = 11` below `P` the added congruences are compatible with ACC23's: `p_b = 109` and `p_c = 2617`
  are primes with `109 ≡ 1 mod 4`, `2617 ≡ 1 mod 436` and `109 ≡ 2617 ≡ −1 mod 11` (`11 ∤ 436`). Then
  `−4·109 ≡ −4·2617 ≡ 4 mod 11` is a nonzero square, so `11` splits in `E_b` and `E_c`, and `109` splits
  in `E_c` (`−2617 ≡ −1`, a square modulo `109 ≡ 1 mod 4`). With `E_a` split at `2, 5, 11` and `11`
  split completely in the totally real field `E`, every completion of `F'` above a place of `P ∪ P^c`
  over `11` is that of `F`.
- The degree step for `F = ℚ(ζ₅)` and `q = 11` below `P`, with `F₁ = F`. Here `F₁⁺ = ℚ(√5)` has one
  five-adic place, of local degree `2 = [F₁⁺:ℚ]`, so condition (ii) of §5.1 fails (there is no second
  five-adic place). Take `E = ℚ(√31, √59, √71)`: the three primes are distinct, so `E` is totally real
  of degree eight with group `(ℤ/2)³`, and `31 ≡ 1`, `59 ≡ 4`, `71 ≡ 1 mod 5` and `31 ≡ 9`, `59 ≡ 4`,
  `71 ≡ 5 mod 11` are nonzero squares, so five and eleven split completely in `E`. No quadratic subfield
  of `E` is `ℚ(√5)`, so `F₁⁺E` has degree `16` and eight five-adic places of local degree `2 = 16/8`;
  omitting two leaves `12 = (3/4)·16 > 8`. The residue fields there are still `𝔽₅`, so the residue half
  of (ii) needs the prescribed completions. Since `31 ≡ 59 ≡ 71 ≡ 3 mod 4`, two ramifies in `E`: this
  `E` serves only when no place of `P` lies above two (primes `≡ 1 mod 8` would split two), and
  `31, 59, 71` must then split in `E_b`. A field in which five does not split does nothing: `ℚ(√5, √2)`
  (`2` is not a square modulo five) has a single five-adic place, of local degree `4`, its whole degree.
- For `F = ℚ(ζ₅)`, which has no imaginary quadratic subfield, the imaginary quadratic composita are
  required to reach condition (i) of §5.1.

### 6.2 Potentially Barsotti–Tate lifting at five with a protected place

Let `F` be a CM field, `ι : Q̄₅ ≅ ℂ` and `ρ : G_F → GL₂(Q̄₅)` continuous, satisfying conditions (1), (2), (3)
and (5) of CN23 Theorem 5.2 at `p = 5`: `ρ` unramified almost everywhere with `det ρ = ε₅⁻¹`;
potentially semistable at every `v | 5` with all labelled weights `{0, 1}`; `ρ̄` decomposed generic and
`ρ̄|G_{F(ζ₅)}` absolutely irreducible; and a cuspidal regular algebraic weight-zero `π` of `PGL₂(𝔸_F)`
with `r̄_ι(π) ≅ ρ̄`, matching potential ordinarity and `N(rec(π_v)) = 0` at the potentially crystalline
places above five and `ι`-ordinary with non-potentially-crystalline `r_ι(π)` at the others. Suppose
either that clause (4) holds (if the projective image of `ρ̄(G_{F(ζ₅)})` is `PSL₂(𝔽₅)`, the field cut out
by the projective image of `ρ̄` does not contain `ζ₅`), or that `ζ₅ ∈ F` and there is a nonempty finite
set `P` of places `v ∤ 5` such that for every `v ∈ P`: `ρ̄(I_v)` is nontrivial and unipotent; every
element of `ρ(I_v)` has characteristic polynomial `(X − 1)²`; `π_v` has nonzero Iwahori-fixed vectors;
and `ρ` and `π` are unramified at `v^c`. Prove that `ρ ≅ r_ι(Π)` for a cuspidal regular algebraic
weight-zero `Π` of `PGL₂(𝔸_F)`. If (4) holds this is the parent's §5.2 `potentiallySemistableCM`.
Otherwise `ζ₅ ∈ F` by hypothesis, so `ε̄₅⁻¹` is trivial on `G_F = G_{F(ζ₅)}`, and since (4) fails the
projective image of `ρ̄(G_F)` is conjugate to `PSL₂(𝔽₅)`. The preimage of `PSL₂(𝔽₅)` in `SL₂(k̄)` is
`SL₂(𝔽₅)` (a scalar of determinant one is `±1`), and a subgroup of `SL₂(𝔽₅)` surjecting onto
`PSL₂(𝔽₅)` has even order, so contains the unique involution `−1` and is all of `SL₂(𝔽₅)`; hence
`ρ̄(G_F)` is conjugate to `SL₂(𝔽₅)`. Apply §6.1, then §5.4 over `F'`, then
PotentialAutomorphyInfrastructure §2.3(2) to descend, `ρ|G_{F'}` being absolutely irreducible. The
hypothesis `ζ₅ ∈ F` of the protected alternative is the standing assumption `μ₅ ⊂ F` of the protected
route and does not follow from the failure of (4) (first Check). (CaptainSude26, §4 and Theorem 4.2,
lines 264–498, with `μ₅ ⊂ F` at line 267; CN23, Theorem 5.2, lines 3849–3872.)

*Needs:* §§5.4, 6.1; EllipticCurveModularityImaginaryQuadratic §5.2; PotentialAutomorphyInfrastructure
§2.3; AutomorphicGaloisRepresentationsPartII AG2.7.

**Checks.**

- The hypothesis `ζ₅ ∈ F` is not implied by the failure of (4). Let `ζ₅ ∉ F` with `det ρ̄ = ε̄₅⁻¹` of
  order two, so `[F(ζ₅):F] = 2`, and suppose the antecedent of (4), so `ρ̄(G_{F(ζ₅)})` is conjugate to
  `SL₂(𝔽₅)`. If `ρ̄` is valued in `GL₂(𝔽₅)`, as the mod-five representation of an elliptic curve is, an
  element `g` of determinant `−1` gives `det(2g) = 4·(−1) = 1`, so the projective image of `G_F` is
  `PSL₂(𝔽₅)`, the projective kernels of `G_F` and `G_{F(ζ₅)}` have indices `60` and `2·60 = 120` in
  `G_F`, and (4) holds (CN23, Lemma 6.1.4, line 4562). Over `k = 𝔽₂₅` take `μ` with `μ² = 2` and
  `γ = diag(1, 2)`: then `det(μγ) = 2·2 = 4 = −1`, `tr(μγ) = 3μ ∉ 𝔽₅`, `(μγ)² = diag(2, 3) ∈ SL₂(𝔽₅)`, and
  `⟨SL₂(𝔽₅), μγ⟩` has order `240`, determinants `{±1}` and projective image `PGL₂(𝔽₅)` of order `120`
  (`det γ = 2` is not a square modulo five); both projective kernels have index `120`, so they are
  equal, the projective field contains `F(ζ₅)` and (4) fails although `ζ₅ ∉ F`.
- If `ζ₅ ∉ F` and `det ρ̄` has order four, (4) holds for every coefficient field: the projective image of
  `G_F` normalizes `PSL₂(𝔽₅)` in `PGL₂(k̄)`, whose normalizer is `PGL₂(𝔽₅)` (the centralizer is trivial
  because `SL₂(𝔽₅)` is perfect and its standard representation is absolutely irreducible,
  ArithmeticGaloisRepresentations §7.8 at `a = 1`), so `[G_F:G] ≤ 120 < 240 = 4·60 = [G_F:H]`
  for the two projective kernels `G ⊇ H`.
- For imaginary quadratic `F`, `ζ₅ ∉ F` since `[ℚ(ζ₅):ℚ] = 4`, so only the alternative (4) is available
  and the theorem is the parent's §5.2.
- A protected place of a split Tate curve with `5 | v(Δ)` does not exist: such a place has unramified
  residual representation and fails the first condition at `P`.

### Examples

For a CM field `F ∋ ζ₅` and the `H¹` of an elliptic curve whose residual representation is decomposed
generic with image `SL₂(𝔽₅)`, split multiplicative at a place `v ∤ 5` with `5 ∤ v(Δ_min)` and good at
`v^c`, the theorem applies with `P = {v}`
whenever a residually isomorphic modular curve with matching reduction at five and at `v`, `v^c` is
available.

### Dependencies

Layers 3 and 5; CrystallineLocalGlobalCompatibilityCM §9.11; EllipticCurveModularityImaginaryQuadratic §5.2;
GL2ModularityLifting §1.7; PotentialAutomorphyInfrastructure §§2.1, 2.3, 2.5;
PotentialModularityAndCompatibleSystems §§2.12–2.16; AutomorphicGaloisRepresentationsPartII AG2.7.

## Layer 7: The protected auxiliary elliptic curve

### 7.1 The multiplicative degeneration of type I₃

Let `K` be a number field (this section and §7.2 do not use that `K` is CM), `E/K: y² = h(x)`, `p > 3`
prime, `n = 3p`, and `R_*` a point of exact order `2n` of the parameter cover with `[n]R_* = a/2`
nonzero two-torsion, as in the parent's §2.1. Prove: (a) for `t ∈ U(K)` the image of the `K`-point
`(O, 1)` of `C₃(t)` is a `K`-point of `D_t = C₃(t)/⟨w⟩`, so `D_t ≅ A_t` over `K`; (b) the special fibre
of the parent's §2.3 `nodalModel` at `R_*` for `m = 3` is the elliptic component `E'`, a rational
component `Z` and three nodes of smoothing order one joining them, and on its nodes the reflection `w`
has one orbit of size one, `{ν₀}`, and one of size two; in the chart `xy = s` of the parent's §2.1 at
`ν₀`, `w` is `(x, y) ↦ (−x, −y)`; (c) the quotient `𝒟` of that regular model by `w` has special fibre
the two curves `E'/w` and `Z/w`, both of genus zero, meeting in two points, so its dual graph is a cycle
of length two: at the image of `ν₀` the invariants `z₁ = x²`, `z₂ = y²` satisfy `z₁z₂ = s²`, an edge of
thickness two, and the orbit of size two has one image, an edge of thickness one. Blowing up the image
of `ν₀` once replaces the thickness-two edge by a rational curve met in two points of thickness one, so
the resulting regular model has special fibre a triangle of rational curves: `D_t`, and with it `A_t`,
has semistable reduction of Kodaira type `I₃` in the smoothing parameter `s`; (d) `1/j(A_t)` has a zero
of exact order three in `s`, and over a field containing the data of (b) the Tate parameter `q_A` of
`A_t` is `s³λ(s)` for a power series `λ` with `λ(0) ≠ 0`. For (b): on the elliptic component `E' → E`,
an étale cyclic triple cover, the lifts of `[−1]` are `Q ↦ −Q + c₀` with `c₀ ∈ ker(E' → E)`; the nodes
on `E'` form the fiber `P₀ + ker` over the two-torsion point, and `2(P₀ + rT') = c₀` has exactly one
solution `r ∈ ℤ/3` because two is invertible modulo three. For (c): `Q ↦ −Q + c₀` has the four fixed
points `2Q = c₀`, so `E'/w` has genus zero, and `w` moves two nodes of `Z`, so acts on `Z` nontrivially
with rational quotient. For (d), the total thickness `2 + 1 = 3` equals `v(q_A)` per unit of `v(s)`;
`R_*` is not two-torsion, so `x` is étale there and the `t`-parameter is a unit multiple of `s`.
(CaptainSude26, Lemma 5.1, lines 503–532, for a CM field `K` containing `μ₅` (line 500) and the large
prime `p` of its line 45; the route above uses neither restriction.)

*Needs:* EllipticCurveModularityImaginaryQuadratic §§1.3, 2.1, 2.3, 4.2; EllipticCurves Layer 4;
SchemeAndStackFoundations §§4.13, 4.18.

**Checks.**

- An involution of a three-element set fixes one or three points; three fixed nodes would make the
  quotient two rational curves meeting in three points, of arithmetic genus two, contradicting genus
  one. Exactly one fixed node is forced.
- The total thickness after resolution is `1 + 1 + 1 = 3`, equal to the thickness `2 + 1` before it;
  the type is `I₃`, not the `I₂` read from the two quotient nodes alone.
- For `p = 101`, `R_*` has order `606` and `[303]R_* = a/2`; `x` is unramified at `R_*` since `606 ≠ 2`.

### 7.2 Local opens at an auxiliary prime

Keep the setting of §7.1. Prove: there is a finite set `Σ₀` of rational primes such that for every
rational prime `q ∉ Σ₀` with `q ≥ 7`, `q ≠ p`, split completely in the field of definition of the data of
§7.1(b) and in the normal closure of `K`, and every place `v` of `K` above `q`: (a) there is a nonempty
open `Ω_v ⊂ U(K_v)` such that for `t ∈ Ω_v` the curve `A_t` has split multiplicative reduction at `v`
with `v(Δ_min(A_t)) = 3m_v`, for a fixed integer `m_v` prime to five; (b) for every other place `v' ≠ v`
of `K` above `q` there is a nonempty open `Ω_v' ⊂ U(K_v')` on which `A_t` has good reduction at `v'`.
For (a): let `K₁ ⊇ K` be the field of definition of the data of §7.1(b), over which §7.1(c)–(d) hold;
the model of §7.1(c) and its coordinate `s` are defined over `O_{K₁}[1/n₀]` for some integer `n₀ ≥ 1`.
Let `Σ₀` contain the prime factors of `n₀`, the residue characteristics of the places of bad
reduction of `E`, and the finitely many primes modulo which the reduced family is no longer two
rational curves meeting in two nodes of thicknesses two and one (type `I₃` once the thickness-two node
is resolved), or the coefficient of `s³` in `1/j(A_t)` is not a unit. For `q` as in the statement and
`v | q`, `K₁` embeds in `K_v` and §7.1(c)–(d) hold over `O_{K_v}`, with `q_A = s³λ(s)` and
`λ(0) ∈ O_{K_v}^×`. Fix an integer `m_v > 0` with `5 ∤ m_v`, large enough that `λ` converges to a
unit where `v(s) ≥ m_v`, and let `Ω_v` be the set of `t ∈ U(K_v)` near the degeneration point with
`v(s) = m_v`: it is open, nonempty because `s` is a unit multiple of a local coordinate of the `t`-line
there (§7.1(d)), and on it `A_t` is split multiplicative, the branches being defined over `K_v`, with
`v(Δ_min(A_t)) = v(q_A) = 3m_v`. For (b):
near the compact-type boundary point `O` the Jacobian family is an abelian scheme with fiber `E³` (the
parent's §2.2); by the parent's §6.1 the `d`-torsion is locally constant for an integer `d ≥ 3` prime
to `q` (`d = 3` will do, as `q ≥ 7`), hence unramified, so nearby fibers are semistable
(NeronModelsAndSemistableAbelianVarieties §3.12); by the parent's §6.3 their toric rank is that of `E³`,
namely zero, so they have good reduction, and so does the isogeny factor `A_t`; the parent's §6.5
pulls the neighborhood back to the `t`-line. (CaptainSude26, Lemma 5.1, lines 520–532, under the same
restrictions, which the route above does not use.)

*Needs:* §7.1; EllipticCurveModularityImaginaryQuadratic §§2.2, 6.1, 6.3, 6.5;
NeronModelsAndSemistableAbelianVarieties §§3.1, 3.12, 5.1; EllipticCurves Layer 4.

**Checks.**

- `v(s) = 5` gives `v(Δ_min) = 15`, divisible by five: the residual inertia is trivial and the place is
  not protected; `v(s) = 1` or `7` give `3` or `21`.
- Every place of `K` above `q`, including `v^c`, is constrained; a single selected place would leave
  `v^c` possibly bad, violating the hypothesis at `v^c` of §6.2.
- `q = 5` is excluded: a split multiplicative place above five is not prime to the coefficient prime.

### 7.3 Split Tate curves give protected places

Let `K_v` be a finite extension of `ℚ_ℓ` with `ℓ ≠ 5` and `μ₅ ⊂ K_v`, and `A/K_v` split multiplicative with
`5 ∤ v(Δ_min(A))`. Prove: `A[5]` and the residual representation of `H¹(A)` are protected (§3.3);
in the basis of §3.3 a Frobenius lift acts residually by a unipotent upper triangular matrix, which
becomes the identity once the lift is multiplied by a suitable power of `τ`; every
element of the image of `I_v` on `H¹(A_K̄, Q̄₅)` has characteristic polynomial `(X − 1)²`; and if `A` is
the localization of a modular non-CM curve with realizing `π`, then `π_v` is the Steinberg
representation, which has nonzero Iwahori-fixed vectors. If instead `5 | v(Δ_min(A))`, `A[5]` is
unramified. The Tate-curve description is ArithmeticGaloisRepresentations §6.3 with
`v(Δ_min) = v(q_A)` for the Tate parameter `q_A` of `A` (EllipticCurves Layer 4); the automorphic
statement is the parent's §0.3 `automorphic_wd`, the full Weil–Deligne parameter being `Sp(2)`.
(CaptainSude26, paragraph after Lemma 5.1, lines 533–536.)

*Needs:* §3.3; ArithmeticGaloisRepresentations §6.3; EllipticCurves Layer 4;
EllipticCurveModularityImaginaryQuadratic §0.3; GL2AutomorphicRepresentationsAndTransfer R16.3.2.

**Checks.**

- For `v(q_A) = 3` the residual inertia is `[[1, 3],[0, 1]]`, a nontrivial unipotent; for `v(q_A) = 15` it
  is trivial.
- A non-split multiplicative curve is the unramified quadratic twist of a split one. The twist
  leaves inertia acting as before, so the curve is still protected, and multiplies the residual image
  of Frobenius by `−1`, giving `−1` times a unipotent matrix; its automorphic component is Steinberg
  twisted by the unramified quadratic character, which still has Iwahori-fixed vectors.
- Good reduction gives unramified `A[5]`, never protected.

### 7.4 The switch at five with retained auxiliary places

Let `F` be a CM field, `ρ̄ : G_F → GL₂(𝔽₅)` continuous with `det ρ̄ = ε̄₅` and decomposed generic, a
partition `S₅^st ⊔ S₅^ord ⊔ S₅^ss` of the places above five, a finite Galois `F_avoid/F`, a finite set `Σ`
of finite places of `F` not above `2, 3, 5`, and nonempty opens `Ω_w ⊂ Y_ρ̄(F_w)` for `w ∈ Σ`, where
`Y_ρ̄` is the fixed-pairing twist of the parent's §0.2. Prove:

(a) there is a finite extension `L/F` with every conclusion of the parent's §0.3 `solvable_preparation`
for `p = 5`, `ρ̄` and `F_avoid` (solvable, Galois and CM, linearly disjoint from `F_avoid`; above `2`, `3`
and `5` split over `L⁺` with `ρ̄` trivial on the decomposition groups; above five, local elliptic
curves with good ordinary and with good supersingular reduction and all five-torsion rational; above
two, `L_{w'}(√−1)/L_{w'}` unramified; a rational prime `q₀ > 5` witnessing the decomposed genericity
of `ρ̄` split completely in `L`) in which, in addition, every place of `Σ` splits completely;

(b) there are such an `L` and a non-CM modular elliptic curve `A'/L` with every conclusion of the
parent's §0.3 `switch_five` for `ρ̄`, the partition and `F_avoid`: `L ∩ F_avoid = F`, `A'[5] ≅ ρ̄|G_L`
symplectically, split multiplicative, good ordinary or good supersingular reduction at every place
above `S₅^st`, `S₅^ord`, `S₅^ss` respectively, Tate reduction at every place above `2` and `3`, and
`ρ̄|G_L` decomposed generic; and such that for every `w ∈ Σ` and `w' | w` the point of
`Y_ρ̄(L_{w'}) = Y_ρ̄(F_w)` given by `A'` lies in `Ω_w`.

For (a), choose a witness `q₀ > 5` for `ρ̄` (witnesses avoid any finite set:
AutomorphicGaloisRepresentationsPartII AG2.7). Every conclusion of `solvable_preparation` other than
linear disjointness is a condition on the completions of `L` at the finitely many places above `2`, `3`,
`5` and `q₀`; realize them, together with the splitting at `Σ`, as completions of a totally real soluble
extension of `F⁺`. First fix a target completion `N_u` for each place `u` of `F⁺` that carries a
condition. If `u` has residue characteristic `2`, `3` or `5`, let `N_u/F⁺_u` be a finite Galois
extension containing, for each place `w | u` of `F`, the field `F_w` and the fixed field of the kernel
of `ρ̄|G_{F_w}`; containing `√−1` if `u | 2`; and, if `u | 5`, containing over each such `F_w` the
five-division fields of one elliptic curve with good ordinary and one with good supersingular reduction
(EllipticCurves Layer 4). The Galois closure over `F⁺_u` of the compositum of these finitely many finite
extensions is such an `N_u`. If `u` lies below a place of `Σ` or above `q₀`, let `N_u = F⁺_u`; if `u` is
real, let `N_u = ℝ`. Each `u` receives one value: the places below `Σ` and those above `q₀` have residue
characteristic prime to `30`, and a place of both kinds receives `F⁺_u` twice. Write `F̃_avoid` for the
Galois closure of `F_avoid` over `F⁺`; it contains `F`. GL2ModularityLifting §1.7 (CHT08, Lemma
4.1.2), over the base `F⁺` with the local data `N_u` and the avoided field `F̃_avoid`, provides a soluble
Galois `L⁺/F⁺`, linearly disjoint from `F̃_avoid` over `F⁺`, whose completion at every place above
each such `u` is `N_u`. All its real completions are `ℝ`, so `L⁺` is totally real; as `F` is totally
imaginary, `L⁺ ∩ F = F⁺`, so `L = L⁺F` is a totally imaginary quadratic extension of `L⁺`, hence CM, and
`L/F` is Galois with group `Gal(L⁺/F⁺)`, which is soluble. By the linear disjointness,
`Gal(L⁺F̃_avoid/F⁺) = Gal(L⁺/F⁺) × Gal(F̃_avoid/F⁺)`, in which the subgroups fixing `L` and `F̃_avoid`
generate the subgroup `Gal(L⁺/F⁺) × Gal(F̃_avoid/F)` fixing `F`; so `L ∩ F̃_avoid = F` and
`L ∩ F_avoid = F`. For `w | u` and `w' | w`, `L_{w'}` is the compositum of `L⁺_{u'}` and `F_w`: above
`2, 3, 5` this is `N_u`, which contains `F_w`, so the place of `L⁺` splits in `L` and
`ρ̄|G_{L_{w'}}` is trivial; above `q₀` and `Σ` it is `F_w`. Since `q₀` splits completely in `F`, it
splits completely in `L` and remains a witness for `ρ̄|G_L` (AutomorphicGaloisRepresentationsPartII
AG2.7). For (b), run the parent's proof of `switch_five` with (a) in place of `solvable_preparation`:
`Y_ρ̄` is an open of `ℙ¹` over `F` (the parent's §0.2 `fixed_pairing_twist_rational`), hence over `L`;
the parent's §0.3 `hilbert_local_selection`, which uses of `L` only the conclusions of
`solvable_preparation` and accepts finitely many nonempty opens, is applied over `L` with its conditions
for `seed_modular` and for the five-adic partition and with `Ω_w` at every place of `L` above `w ∈ Σ`.
The places above `Σ` have residue characteristic prime to `30`, so none of them carries a Tate,
discriminant or partition condition, all of which sit above `2`, `3` and `5`. The conditions for
`seed_modular` include one further family, away from `2, 3, 5`: the decomposed genericity of the
mod-three representation that `seed_modular` assumes is obtained by prescribing good reduction, with
one fixed reduction over `𝔽_l`, at every place above an auxiliary rational prime `l > 5` (AKT23,
Proposition 9.13, pp. 79–80, lines 3700–3706). Every sufficiently large prime `l` split completely in a
fixed finite extension serves, so `l` is chosen after the other prescribed places and prime to all of
them, in particular to the residue characteristics of `Σ` (AKT23, Lemma 9.7 and its proof, p. 75,
lines 3488–3510). The selected `A'` is modular by the parent's §0.3 `seed_modular`, and is non-CM because it
is a Tate curve above two while a CM elliptic curve has potentially good reduction everywhere
(ShimuraVarieties §5.6). (CaptainSude26, Proposition 5.2 and proof, lines 538–603, for the prescriptions
over `F⁺` at lines 549–563; CN23, Proposition 6.1.5 and proof, lines 4574–4611; CHT08, Lemma 4.1.2, p.
116.)

*Needs:* EllipticCurveModularityImaginaryQuadratic §0.2 (`fixed_pairing_twist`,
`fixed_pairing_twist_rational`) and §0.3 (`solvable_preparation` and `switch_five`, whose conclusions
(a) and (b) keep, `hilbert_local_selection`, `seed_modular`); GL2ModularityLifting §1.7; EllipticCurves
Layer 4; ShimuraVarieties §5.6; AutomorphicGaloisRepresentationsPartII AG2.7.

**Checks.**

- For `Σ = ∅`, (a) is `solvable_preparation` and (b) is `switch_five`.
- The splitting at `Σ` is not a conclusion of `solvable_preparation`, and it is what keeps a protected
  place protected: for `v | 11` in `Σ` with residual inertia `U` at `v`, an extension with
  ramification index five above `v` would make residual inertia there generated by a power of
  `U⁵ = 1` (§3.3, fourth Check), whereas under (a) `L_{w'} = F_v`.
- A place of `Σ` above `2` would conflict with the mandatory Tate condition there; `Σ` avoids `2, 3, 5`.
- A residue characteristic prime to `30` does not by itself separate `Σ` from every condition of the
  selection. The mod-three seed prescribes good reduction, with a fixed reduction, at every place above
  an auxiliary prime `l > 5` split completely in a finite extension `M` of `L` containing `ζ_{5⁷}` and
  the field cut out by `ρ̄|G_L`, so `l ≡ 1 mod 5⁷` (AKT23, lines 3493 and 3507). If `ρ̄` is unramified at
  the places of `Σ` and their residue characteristic `r` splits completely in `M`, then `r` meets every
  requirement on `l` except primality to `Σ`; with `l = r`, an open `Ω_w` of curves of multiplicative
  reduction and the good-reduction condition would fall on the same place, two disjoint opens, and the
  selection would have no point. Choosing `l` prime to `Σ` excludes this. In §7.5 the clash cannot
  arise: `ρ̄ = A_t[5]|G_L` is ramified at the places above `v | q` (§7.3), so `q` does not split
  completely in `M`; and for `q = 11`, `11 ≢ 1 mod 5⁷` as well.
- Trivial completion at the place `u` of `F⁺` below `w ∈ Σ` gives `L_{w'} = F_w` whether `u` splits in
  `F` (then `L_{w'} = F⁺_u = F_w`) or not (then `L⁺_{u'} = F⁺_u` and `F` supplies the quadratic
  extension `F_w`), so `Ω_w` is meaningful at every `w' | w`; an unramified quadratic completion of `L`
  over `F_w` would change the local opens.
- Over `ℚ₅`, `y² = x³ − x` has good ordinary reduction (`8` points over `𝔽₅`, trace `−2`) and
  `y² = x³ + 1` good supersingular reduction (`6` points, trace `0`); completions above five containing
  their five-division fields give the local curves of (a).

### 7.5 The modular auxiliary curve over a CM field containing μ₅

Let `K` be a CM field with `μ₅ ⊂ K` and `E/K` geometrically non-CM, with `p` from the parent's §7.2, and
`q`, `v` as in §7.2 with `q` also prime to the bad reduction of `E`. Prove: there is a switch parameter
`t ∈ U(K)` lying, in addition, in the opens of §7.2 at the places above `q`; for every such `t`: (a) the
mod-five representation of `A_t` has image conjugate to `SL₂(𝔽₅)` over `K` and is decomposed generic;
(b) `H¹(A_t)` is protected at `v` and unramified at `v^c`; (c) `A_t` is modular over `K`. For (a): by
the switch-parameter property (S3), the image of `G_D` on the reduction of `V_η` modulo five contains
the geometric monodromy, which for `(m, ℓ) = (3, 5)` contains the opposite transvections
`[[1, ±3],[0,1]]` and `[[1, 0],[±3, 1]]` (the parent's §7.1 with coefficient `3`), and these generate
`SL₂(𝔽₅)`. The parent's §4.2 `cubic_character_elliptic` identifies `V_η` with `H¹(A_t)|G_F`, whose
reduction modulo five is the dual of `A_t[5]|G_F` (Conventions); `g ↦ (gᵀ)⁻¹` maps `SL₂(𝔽₅)` onto
itself, so the image of `G_K ⊇ G_D` on `A_t[5]` contains `SL₂(𝔽₅)`, and it lies in `SL₂(𝔽₅)` because
`det = ε̄₅` is trivial on `G_K`. In the same way (S2) gives the decomposed genericity of the reduction
of `V_η` over `F`, which passes to `A_t[5]|G_F` through that identification and the dual, and descends
from `F` to `K` by Theorem 1.2. Part (b) is §7.3. For (c): apply §7.4(b) to `ρ̄ = A_t[5]`
with the partition given by the potential reduction types of `A_t` above five, `F_avoid` containing the
field cut out by `ρ̄`, and `Σ` the places of `K` above `q`, with the open of curves of split
multiplicative reduction whose minimal discriminant has valuation prime to five at `v` and the open of
curves of good reduction at each other place above `q`; each is nonempty, since by the choice of `t` in
the opens of §7.2 the curve `A_t` itself is a point of it. Over the resulting `L`, which contains `ζ₅`
because `K` does, the protected alternative of Theorem 6.2 applies to `H¹(A_t)|G_L`, `π_{A'}` and `P`
the places above `v`: clause (4) fails, the protected conditions hold by §7.3 and the splitting of
§7.4(a) at the places above `q`, the five-adic matching holds by the parent's §0.3
`auxiliary_local_types`, which applies to `A'` because `A'` has every conclusion of `switch_five`
(§7.4(b)). Descend along `L/K` by PotentialAutomorphyInfrastructure §2.3(2); the result is cuspidal
because `A_t` is non-CM. (CaptainSude26, Proposition 2.3(3)–(4), lines
120–125, and Corollary 5.3, line 604.)

*Needs:* §§7.2, 7.3, 7.4, 6.2; Theorem 1.2; EllipticCurveModularityImaginaryQuadratic §4.2
(`cubic_character_elliptic`), §§6.5, 7.1, 7.2, 7.4 and §0.3 (`auxiliary_local_types`,
`modular_elliptic_all_coefficients`); PotentialAutomorphyInfrastructure §2.3;
AutomorphicGaloisRepresentationsPartII AG2.7.

**Checks.**

- The subgroup of `SL₂(𝔽₅)` generated by `[[1,3],[0,1]]` and `[[1,0],[3,1]]` has order `120`; a single
  transvection generates a group of order five, whose image would not be `SL₂(𝔽₅)`.
- Over `K = ℚ(ζ₅)`, `det A_t[5] = ε̄₅` is trivial on `G_K`, so the image is inside `SL₂(𝔽₅)` and equals it;
  over a field without `ζ₅` the same monodromy gives an image containing `SL₂(𝔽₅)` with nontrivial
  determinant, and Theorem 2.1 applies instead.
- An image of `SL₂(𝔽₅)` excludes CM: the image of a CM curve has an abelian subgroup of index at most
  two, while `SL₂(𝔽₅)` is perfect of order `120`.

### Examples

For `K = ℚ(ζ₅)` and `E: y² = x³ + x + 1` (discriminant `−2⁴·31`; `j = 6912/31` is not integral, so `E`
is geometrically non-CM), choose `p > 100` from the parent's §7.2, a prime `q ≡ 1 mod 5` other than `p`
and `31`, outside `Σ₀` and split completely in the field of definition of the data of §7.1(b), a place
`v | q` and `t` in all the opens; `A_t` is split multiplicative at `v` with
`v(Δ_min) = 3m_v`, good at the other three places above `q`, and the switch at five produces `A'` over a
solvable CM extension, after which Theorem 6.2 and descent make `A_t` modular over `ℚ(ζ₅)`.

### Dependencies

Layers 1, 3 and 6; EllipticCurveModularityImaginaryQuadratic §§0.2, 0.3, 1.3, 2.1–2.3, 4.2, 6.1, 6.3, 6.5,
7.1, 7.2, 7.4; NeronModelsAndSemistableAbelianVarieties §§3.1, 3.12, 5.1; ArithmeticGaloisRepresentations
§6.3; EllipticCurves Layer 4; SchemeAndStackFoundations §§4.13, 4.18; GL2ModularityLifting §1.7;
ShimuraVarieties §5.6; PotentialAutomorphyInfrastructure §2.3; GL2AutomorphicRepresentationsAndTransfer
R16.3.2; AutomorphicGaloisRepresentationsPartII AG2.7.

## Layer 8: Every elliptic curve over every CM field

### 8.1 The headline

Prove: for every CM number field `K` and every elliptic curve `E/K` there is an isobaric automorphic
representation `π_E` of `GL₂(𝔸_K)`, of weight zero and trivial central character, realizing
`H¹(E_K̄, Q̄_ℓ)` for every `ℓ` and every `ι`, with full Frobenius-semisimple Weil–Deligne compatibility
`ι WD(H¹|G_{K_v})^(F-ss) ≅ rec^T(π_{E,v})` at every finite `v ∤ ℓ`, agreement of every finite local factor,
archimedean parameter `complexInfinityParameter` at every complex place, and
`L(E/K, s) = L(π_E, s − 1/2)`. It is cuspidal if `E` is geometrically non-CM; otherwise it is the
quadratic automorphic induction or the isobaric sum of Theorem 2.4. For geometrically CM `E` use
Theorem 2.4. For non-CM `E`: if `ζ₅ ∉ K`, Theorem 2.5; if `ζ₅ ∈ K`, take `t` from §7.5, which makes
`A_t` modular over `K`, and re-run the argument of Theorem 2.1(c), which does not use `ζ₅ ∉ K`:
`F = K(μ₃ₚ)` is CM by Theorem 1.1; `A_t` is geometrically non-CM by the last clause of (S2), `t`
being a switch parameter (the parent's §7.4(3)), so `H¹(A_t)|G_F` is absolutely
irreducible (FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3); PotentialAutomorphyInfrastructure
§2.3(1) gives the cuspidal weight-zero base change of `π_{A_t}` to `PGL₂(𝔸_F)`, which realizes `V_η`
under the identification `V_η ≅ H¹(A_t)|G_F` of the parent's §4.2 `cubic_character_elliptic`. Then
apply Theorem 2.2 and Theorem 2.3. (CaptainSude26, Theorem 1.1, line 26, with its proof, line 671; LeHung26,
Remark 1.3.1, line 125.)

*Needs:* Theorems 1.1, 2.1–2.5 and 7.5; EllipticCurveModularityImaginaryQuadratic §4.2
(`cubic_character_elliptic`) and §7.4; PotentialAutomorphyInfrastructure §2.3;
FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3; Mathlib `WeierstrassCurve.localPolynomial`,
`WeierstrassCurve.LSeries`.

**Checks.**

- `K = ℚ(ζ₅)` contains `ζ₅` and its only quadratic subfield `ℚ(√5)` is real; only the second branch
  applies, and the prepared field condition (i) of §5.1 is reached only after the imaginary quadratic
  composita of §6.1.
- For `K₆₀`, the first branch applies; the second branch over `K₆₀(μ₅) = ℚ(ζ₆₀)` followed by descent along
  the abelian extension `ℚ(ζ₆₀)/K₆₀` gives the same `π_E` by strong multiplicity one.
- For imaginary quadratic `K` the statement is the parent's `imaginary_quadratic_modularity`.

### Examples

Every elliptic curve over `ℚ(ζ₅)`, over `ℚ(ζ₁₅)`, over `ℚ(ζ₂₀)` and over `K₆₀` is modular. The first
three contain `ζ₅` and use Layer 7, including for curves whose own mod-three and mod-five images are
reducible. The biquadratic field `ℚ(√−1, √5)` does not contain `ζ₅` (its Galois group over `ℚ` is
`(ℤ/2)²`, while `ℚ(ζ₅)/ℚ` is cyclic of degree four), so it is covered by Theorem 2.5.

### Dependencies

Layers 1, 2 and 7; EllipticCurveModularityImaginaryQuadratic §§4.2, 7.4; PotentialAutomorphyInfrastructure
§2.3; FaltingsFinitenessAndIsogenyTheorems R28.6.2–R28.6.3; Mathlib's `L`-function of a Weierstrass
curve.

## Downstream consumers

- Modularity of elliptic curves over every totally real and every CM field: Theorem 8.1 together
  with EllipticCurveModularityTotallyReal, which treats totally real bases from the same parent.
- ModularityAndLanglandsExtensions §2.29: its residual criterion with prescribed `p`-adic elliptic
  types over CM fields can drop the hypothesis `ζ₅ ∉ F` by Theorems 6.2 and 8.1.
- Arithmetic applications needing the entire `L(E/K, s)` over CM fields, in the way
  BianchiModularForms consumes `imaginary_quadratic_modularity` over imaginary quadratic fields.
- Theorem 6.2 is stated for an arbitrary representation and serves any consumer of
  CrystallineLocalGlobalCompatibilityCM §9.12 meeting residual image `SL₂(𝔽₅)` over a field
  containing `ζ₅`, provided there is a nonempty set `P` of places satisfying the conditions of §6.2.

## Scope and ownership

**Where the parent stops.** EllipticCurveModularityImaginaryQuadratic ends at
`imaginary_quadratic_modularity` (§8.6). Its section *Downstream consumers and boundaries* places
other CM fields outside its scope and records the field `ℚ(ζ₁₅ + ζ₁₅⁻¹, i)`, over which `ζ₅ ∉ K` but
`ζ₅ ∈ K(ζ₃)`. In the parent the imaginary-quadratic hypothesis enters through the ramification
proof `cyclotomic_switch_field` of `ζ₅ ∉ F` (§5.1) and through the specialized statements of
§§8.2–8.6. Its Layers 1–4, Layer 6 and §§7.2–7.4 are stated over arbitrary number fields; its
§0.3 outputs, §5.2 `potentiallySemistableCM` and §5.3 `cm_modularity` are stated over arbitrary CM
fields. This roadmap starts exactly there.

**Owned here.**

- Layer 1: CM-ness of the cyclotomic extensions of a CM field and of every field between two CM
  fields (instances of the criterion of MordellLawrenceVenkatesh §1.3, where the CM base excludes the
  totally real alternative), and the descent of decomposed genericity and cyclotomic absolute
  irreducibility along a finite extension of number fields.
- Layer 2: the auxiliary curve made modular over `K` before base change when `ζ₅ ∉ K`; the three
  lifts, the descent along `F/K` and the removal of the twist over an arbitrary CM field; the full
  local comparison and the CM branch over an arbitrary CM field; the endpoint for `ζ₅ ∉ K`.
  Theorems 2.2–2.4 are the parent's §§8.3–8.6 over an arbitrary CM base; the parent states them for
  imaginary quadratic `K` only, and their proofs are applied here, not repeated.
- Layer 3: the detection of the exceptional class of `H¹(SL₂(𝔽₅), ad⁰)` by an order-five
  unipotent subgroup, for the trace-zero adjoint of ArithmeticGaloisRepresentations §§7.2 and 7.9
  restricted to `SL₂`, with the triviality of the centre and the vanishing of invariants on it for
  every field in which `2` is invertible (ArithmeticGaloisRepresentations §7.7 states that vanishing,
  with that of `H¹`, for finite fields of odd characteristic other than `𝔽₅`);
  protected local residual data, their unipotent-inertia deformation condition, its tangent line and
  its dual.
- Layer 4: the vanishing on protected places of the exceptional global classes, Taylor–Wiles primes
  at `p = 5` for residual image `SL₂(𝔽₅)` with a protected place, and the relative presentation in
  which protected places are not framed.
- Layers 5–6: Hecke-valued Galois representations at Iwahori level on the protected places, the
  prepared lifting theorem and the general lifting theorem at five with a protected place over CM
  fields. Theorem 5.3 is CrystallineLocalGlobalCompatibilityCM §§9.7 and 9.9 with the protected
  places added to the Iwahori places; Theorem 6.1 is the preparation of its §9.11 with the
  protected places kept split at odd residue characteristic and kept protected above two.
- Layer 7: the multiplicative degeneration of `A_t` of type `I₃`, the auxiliary-prime local opens,
  the solvable preparation and the switch at five with finitely many further places split completely
  (the parent's §0.3 `solvable_preparation` and `switch_five` with that additional conclusion), and
  the modular auxiliary curve over a CM field containing `μ₅`.
- Layer 8: the headline over every CM field.

**Imported, never re-planned.** The parent supplies the cover family, its degenerations, integral
monodromy, character systems and congruences (Layers 1–4), Serre's large-prime theorem (§5.1),
`potentiallySemistableCM` (§5.2), `cm_modularity` (§5.3), the independent seed, `switch_five` and
`modular_elliptic_all_coefficients` (§0.3), the local opens (Layer 6), the simultaneous
specialization (§§7.1–7.4), the change of coefficient prime and automorphic local types (§8.1) and
the local and CM arguments of §§8.5–8.6. MordellLawrenceVenkatesh supplies the criterion for a
number field to be totally real or CM by products of complex conjugations (§1.3) and the largest
CM-or-totally-real subfield of a number field (§1.4); Theorem 1.1 applies them to the two
configurations the switch needs and does not restate them.
CrystallineLocalGlobalCompatibilityCM supplies the integral local–global compatibility, non-neat
`PGL₂` complexes, prepared patching and the solvable preparation (§§7.5, 8.2–8.7, 9.1, 9.4–9.11).
ArithmeticGaloisRepresentations supplies the trace-zero adjoint with its conjugation action, its
trace pairing, the splitting `ad = A·1 ⊕ ad⁰` when `2` is invertible and its base change (§7.2, and
§7.9 `ResidualImage.adZeroRep` for a homomorphism into `GL₂(k)`), and the cohomology of `SL₂` with
these coefficients (§7.7); Layer 3 restricts it to `SL₂` and does not define it again.
ComplexMultiplicationAndExplicitReciprocity supplies the algebraic Hecke character of a CM elliptic
curve over a base containing its CM field and the splitting of its Tate module into the realizations
of that character (§4.1); Theorem 2.4 applies it over `KM` and does not restate it. The
deformation-theoretic, automorphic and arithmetic carriers come from the suppliers listed below.

**Outside this roadmap.** Totally real fields (they use the totally real lifting theorems and are
EllipticCurveModularityTotallyReal); number fields that are neither CM nor totally real; abelian varieties of
`GL₂`-type; the exceptional modular-curve analysis of Caraiani–Newton §7
(ModularityAndLanglandsExtensions §2.30); height-density statements (ModularityAndLanglandsExtensions
§2.29).

**Lean.** `Suggested.lean` declares nothing, and its module docstring says why. The headline
theorems are Theorem 2.5 (modularity over CM fields not containing `ζ₅`), Theorem 6.2 (the
protected lifting theorem at five) and Theorem 8.1 (modularity over every CM field), and none is
statable against the pinned Mathlib and Tau Ceti. Theorems 2.5 and 8.1 need automorphic
representations of `GL₂(𝔸_K)` over a number field `K` with their attached `ℓ`-adic Galois
representations `r_ι(π)`, local Langlands parameters and `L`-functions; Theorem 6.2 needs these and,
in addition, potentially semistable `5`-adic representations of local Galois groups with their
labelled Hodge–Tate weights. The pins supply the elliptic-curve side: Tau Ceti's
`WeierstrassCurve.tateModuleGaloisRepresentation` (the `ℤ_ℓ`-linear Galois action on the Tate module,
dual to `H¹`); Mathlib's `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries`
(`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`), the Euler product over the primes of a
number field of the local factors of a Weierstrass curve, each taken on a minimal model over the
completion, which is the left side of `L(E/K, s) = L(π_E, s − 1/2)`; Mathlib's `continuousCohomology`
with Tau Ceti's local duality on it (used in §3.5); and Mathlib's `NumberField.AdeleRing`. Neither
library has automorphic forms or automorphic representations on `GL₂(𝔸_K)`, the Galois
representations attached to them, Weil–Deligne representations or the local Langlands
correspondence, `L`-functions of automorphic representations of `GL₂(𝔸_K)` for a CM field `K`
(Mathlib's `ModularForm.L` is the `L`-function of a classical modular form on the upper half-plane,
an object over `ℚ`), or potentially semistable representations with Hodge–Tate weights. The
field-theoretic, finite-group and local statements of Layers 1 and 3 are ingredients of the proofs,
not headlines, and are specified here as mathematics with their Checks.

**Sources.** CaptainSude26, an unrefereed pseudonymous manuscript, is cited for the
protected local condition, the detection of the exceptional class, the protected patching and the
degeneration of type `I₃`; LeHung26, a discussion draft, is cited for making the auxiliary curve
modular before the cyclotomic base change; the parent cites OpenAI26. Theorem 2.5 uses as
lifting inputs only Caraiani–Newton's Theorems 5.2 and 6.1, through the parent's §§5.2–5.3.
Theorem 8.1 uses Layers 3–7 only for fields containing `ζ₅`. The local and finite-group statements
of Layer 3 are proved by explicit computations recorded in their Checks.

## Exact supplier contracts

### From Mathlib

Pin `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`.

- `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean`): a characteristic-zero
  field that is totally complex and quadratic over `maximalRealSubfield`. With it
  `NumberField.IsCMField.of_isAbelianGalois` (an abelian totally complex number field is CM) and
  `IsCyclotomicExtension.Rat.isCMField` (`ℚ(μ_S)` is CM when `S` contains some `n > 2`). The file has
  no statement about composita or subfields of CM fields; MordellLawrenceVenkatesh §§1.3–1.4 supplies
  the criterion and Theorem 1.1 the two instances needed.
- `IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean`) and `IsPrimitiveRoot`.
- `NumberField.isTotallyComplex_of_algebra`
  (`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`): an extension of a
  totally complex field is totally complex.
- `Matrix.SpecialLinearGroup.toGL` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`):
  the embedding `SL₂(k) → GL₂(k)`, along which §3.1 restricts the trace-zero adjoint of
  ArithmeticGaloisRepresentations §7.9. That adjoint lives on Mathlib's trace kernel
  `LinearMap.ker (LinearMap.trace k (Fin 2 → k))` with the conjugation action of
  `Representation.linHom`; ArithmeticGaloisRepresentations §7.2 adds the conjugation representation
  and its trace pairing.
- `groupCohomology` and `groupCohomology.map`
  (`Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean`): the map
  `Hⁿ(H, A) → Hⁿ(G, B)` induced by `f : G →* H` and a morphism `res f A ⟶ B`; restriction to a
  subgroup is the case of its inclusion and the identity morphism.
- `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`
  (`Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean`): for a finite
  commutative group generated by `g`, odd-degree cohomology is `ker N / im(ρ(g) − 1)`.
- `Matrix.SpecialLinearGroup` (`SL(2, ZMod 5)`) and `Matrix.SL2.commutator_eq_top`
  (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean`): perfectness of `SL₂(k)` for `#k ≥ 4`.
- `WeierstrassCurve.localPolynomial`, `WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries`
  (`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`): over the fraction field of a discrete
  valuation ring with residue field of cardinality `q`, the local polynomial of a Weierstrass curve is
  read on its minimal model and is `1 − aT + qT²` with `a = q + 1 − #W(κ)` at good reduction, `1 − T`
  at split multiplicative, `1 + T` at nonsplit multiplicative and `1` at additive reduction; over a
  number field `K`, `LFunction` is the formal Euler product over the primes `𝔭` of `𝓞_K` of
  `1/f_𝔭(N𝔭^(−s))` for the local polynomial `f_𝔭` of the base change to `K_𝔭`, and `LSeries` is its
  complex Dirichlet series. These are the finite local factor of `E` and `L(E/K, s)` in Theorems 2.3,
  2.4 and 8.1: they depend only on `E`, since each factor is read on a minimal model over the
  completion.

### From Tau Ceti

Pin `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

- `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean`): for a finite
  extension `F` of `ℚ_ℓ` and a finite smooth discrete `ZMod n`-module `A`,
  `#H¹ = #H⁰ · #H² · ℓ^([F:ℚ_ℓ]·v_ℓ(#A))`; for `#A` prime to `ℓ` the last factor is `1`. Its
  carriers are `TauCeti.ClassFieldTheory.GalRep` (finite smooth discrete Galois modules over a
  `p`-adic field) and their continuous cohomology.
- `TauCeti.ClassFieldTheory.tateDualityPairing_perfect_mixed`
  (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean`): the local Tate pairing between
  `Hⁱ` of the Tate dual and `Hʲ`, `i + j = 2`, is perfect for finite smooth discrete modules.

### From TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic

- §0.2 `fixed_pairing_twist`, `fixed_pairing_twist_rational`: the twisted fixed-pairing curve
  `Y_ρ̄` and its identification with an open of `ℙ¹` after preparation.
- §0.3 `solvable_preparation`, `hilbert_local_selection`, `seed_modular`, `switch_five`,
  `modular_elliptic_all_coefficients` with its components `automorphic_unique`,
  `automorphic_all_primes`, `automorphic_wd` and `automorphic_potentially_multiplicative_ordinary`,
  and `auxiliary_local_types`; all over an arbitrary CM field.
- §1.1 `switchParameterOpen`, §1.3 `cyclicCover` and the reflection, §2.1 `boundary_regular_model`,
  §2.2 `compactTypeModel` and `compact_type_jacobian`, §2.3 `nodalModel`.
- §4.1 `characterSystem`, `character_system_properties`; §4.2 `cubic_character_elliptic`,
  `auxiliaryEllipticCurve`, `trivial_character_twist`; §4.4 `prime_switch_congruences`.
- §5.1 `nonCM_elliptic_large_residual_primes`; §5.2 `potentiallySemistableCM` (over any CM field, with
  its `p = 5` projective-field clause); §5.3 `cm_modularity` (over any CM field not containing `ζ₅`).
- §6.1 `finite_torsion_locally_constant`, §6.3 `local_reduction_constancy`, §6.5 `local_type_opens`,
  §6.6 `character_local_types`.
- §7.1 `switchCoefficient` and `character_regular_word`; §7.2 the general number-field prime
  choice; §7.4 `simultaneous_specialization`, including the inclusion of the geometric monodromy in
  the specialized image of `G_D` and the non-CM conclusion.
- §8.1 `character_automorphy_change_prime`, `character_automorphic_local_type`; §8.3 the lifting
  table; §8.4 the twist identity `B_t ⊗ χ_(h(t)) ≅ E` on `H¹`; §8.5 `complexInfinityParameter` and the
  local-factor arguments of `elliptic_full_local_comparison`; §8.6 the argument of
  `cm_elliptic_realization`.

### From TauCetiRoadmap.CrystallineLocalGlobalCompatibilityCM

§7.5 (local–global compatibility at `p` through deformation rings, CN23, Theorem 4.2.15); §§8.2–8.5
(two-system patching data, propagation of automorphic components and support); §8.6 (Galois
representations for `PGL₂` over CM fields, including the non-neat to neat comparison); §8.7
(perfectness at non-neat level when `ζ_p ∈ F`); §9.1 (the prepared data and its clauses (5)–(15));
§9.4 (prepared level and unitary parabolics); §9.5 (the problems `𝒮_χ`); §9.6 (patching complexes,
CN23, Lemma 5.6.4);
§9.7 and §9.9 (Hecke-valued representations satisfy `𝒮_χ` and `𝒮_{χ,Q}`); §9.8 (Taylor–Wiles
problems); §9.10 (prepared lifting and the weight-zero rational comparison `q₀ = l₀ = [F⁺:ℚ]`);
§9.11 (solvable preparation). Clause (15) of §9.1 enters the prepared lifting proof of CN only
through Taylor–Wiles selection (CN23 line 4404); Layer 4 replaces that step.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

- AG2.0 (algebraic weights, algebraic Hecke characters and their Galois characters), used by the CM
  branch of §2.4 and, through it, by ComplexMultiplicationAndExplicitReciprocity §4.1.
- AG2.5 (local comparison away from the coefficient prime, monodromy and purity), used through the
  parent's §0.3 and by §5.3.
- AG2.7 (`IsDecomposedGenericPrime`, `decomposedGenericPrime_local`, `IsDecomposedGeneric`): a
  rational prime `q ≠ ℓ` is decomposed generic for `r̄` when it splits completely in the base field and
  `r̄` is unramified and generic at every place above it; `r̄` is decomposed generic when such a
  prime exists. Used by §§1.2, 2.1, 2.2, 5.1, 6.1, 6.2, 7.4 and 7.5.

What AutomorphicGaloisRepresentationsPartII must provide (gap:acc-torsion-inertial-comparison): a
statement in its Layer AG2.5 of Theorem 3.1.1 of ACC23 (Allen et al., *Potential automorphy over CM
fields*), the torsion local–global compatibility for `GL_m` at Iwahori places away from `p`. The setting is that of ACC23 §3.1 (lines 2309–2345): a CM field `F`
containing an imaginary quadratic field, with every `p`-adic place of `F⁺` split in `F`; a good level
`K`; a dominant weight `λ` (Theorem 5.3 uses `λ = 0`); a finite conjugation-stable set `S` of finite
places containing those above `p`, with the conditions there on residue characteristics outside `S`;
a subset `R ⊆ S` of places prime to `p`, each with residue characteristic split in an imaginary
quadratic subfield, such that `Iw_{v,1} ⊆ K_v ⊆ Iw_v` for `v ∈ R` and `K_v = GL_m(O_{F_v})` for
`v ∈ R^c ∖ R`; and a non-Eisenstein maximal ideal `𝔪`. The statement gives an integer `N` depending
only on `m` and `[F:ℚ]`, an ideal `I_R` with `I_R^N = 0` in the localized Hecke algebra of level `K`
and weight `λ`, generated together with the torus operators `t_{v,i}(σ)` at `R`, and a continuous
representation of `G_{F, S ∖ (R^c ∖ R)}` over the quotient whose Frobenius characteristic polynomials
outside `S ∖ (R^c ∖ R)` are the Hecke polynomials `P_v` and whose characteristic polynomial at every
`σ ∈ W_{F_v}`, `v ∈ R`, is the torus polynomial `P_{v,σ}` (ACC23, Theorem 3.1.1, lines 2346–2355).
Theorem 5.3 needs it with `m = 2`. PotentialAutomorphyInfrastructure and
CrystallineLocalGlobalCompatibilityCM §9.7 (and §9.9 through it) consume the same statement as AG2.5,
whose text states characteristic-zero comparisons only.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructure

- §2.1 `genericity_normal_closure_restriction`: decomposed genericity and absolute irreducibility
  survive restriction to `FK` for a finite Galois `K/ℚ` linearly disjoint from the Galois closure of
  the residual-cyclotomic field; used by §6.1.
- §2.3 `soluble_base_change_and_descent`: for `F` and a soluble Galois extension `E/F`, both CM or
  totally real, (1) cuspidal base change of a regular algebraic `π` whose Galois representation stays
  irreducible on `G_E`, with local–global compatibility at every finite place, and (2) descent of a
  representation `ρ` of `G_F` that is irreducible on `G_E` and automorphic there; used by §§2.1, 2.2,
  6.1, 6.2, 7.5 and 8.1.
- §2.5 `auxiliary_cm_extension_prescriptions`: over any number field, for every `N ≥ 1`, a cyclic
  extension of degree `N`, disjoint from a given finite Galois extension, in which a given finite set
  of places, real places included, splits completely, with the CM refinement over a CM base; §6.1
  uses it over `ℚ` for the totally real degree step, and for trivial prescribed completions at the
  places below `P`.

### From TauCetiRoadmap.MordellLawrenceVenkatesh

§1.3 (a number field inside `ℚ̄` is totally real or CM exactly when `c₁c₂` fixes it pointwise for all
complex conjugations `c₁, c₂ ∈ Gal(ℚ̄/ℚ)`) and §1.4 (the largest CM-or-totally-real subfield `E_K` of
a number field `K`: a subfield of `K` lies in `E_K` exactly when it is totally real or CM), used by
Theorem 1.1.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

- §2.1 (decomposition groups).
- §4.3 (Sylow subgroups and `PSL₂`; perfectness of `SL₂(k)` through Mathlib
  `Matrix.SL2.commutator_eq_top`).
- §6.3 (the Tate curve `E` of parameter `q_E` over a finite extension of a `p`-adic field: for `ℓ`
  different from the residue characteristic, inertia acts through a nontrivial unipotent group,
  `WD(V_ℓ E) ≅ Sp(2)`, and `E[ℓ^n]` is unramified exactly when `ℓ^n | v(q_E)`).
- §7.2 (*ContinuousRep.adZero*: the trace-zero adjoint of a representation of a profinite group with
  its conjugation action; the invariant trace pairing, perfect between `ad⁰` and `ad/A·1` and hence on
  `ad⁰` when `2 ∈ A^×` through the splitting `ad = A·1 ⊕ ad⁰`; base change).
- §7.7 (restriction to a subgroup containing a Sylow subgroup is injective on `H¹`;
  `H⁰(SL₂(k), ad⁰) = H¹(SL₂(k), ad⁰) = 0` for `k` finite of odd characteristic with `#k ≠ 5`;
  `H¹(SL₂(𝔽₅), ad⁰)` is one-dimensional; change of coefficient field, in particular
  `(M ⊗ k')^G = M^G ⊗ k'` for fields `k ⊆ k'` and `M` finite-dimensional).
- §7.8 (`Sym^a(F̄_p²)` is absolutely irreducible for `SL₂(F)`, `F` finite of characteristic `p`,
  `0 ≤ a ≤ p − 1`), used by §4.2 at `p = 5`, `a = 2`, and in a Check of §6.2 at `a = 1`.
- §7.9 (`ResidualImage.adZeroRep`: the same adjoint for a homomorphism into `GL_n(k)`, on the trace
  kernel `LinearMap.ker (LinearMap.trace k (n → k))`).

### From TauCetiRoadmap.ArithmeticGaloisDuality

R02.2 (inflation–restriction and the Hochschild–Serre spectral sequence), used by §4.1; R02.4.2 (the
local Tate pairing, and the counting proof that the unramified classes of an unramified module of
order prime to the residue characteristic and of its Cartier dual are exact annihilators), whose
argument §3.5 runs without the hypothesis that the module be unramified.

### From TauCetiRoadmap.LocalGaloisDeformationRings

§1.10 (fixed determinant), §2.3 (minimally ramified lifts), §2.5 (Steinberg lifts of trivial residual
data, which §§3.4 and 5.2 distinguish from the protected condition), §2.6 (the `q`-tame group), §2.8
(the minimally ramified ring), §2.15 (character-type rings for Ihara avoidance), §2.16 (Taylor–Wiles
tangent dimension), §2.21 (unipotent lifts of a regular unipotent residual monodromy are minimally
ramified), §3.14, §§4.14–4.15 and §6.6 (fixed-determinant Barsotti–Tate and ordinary rings at `p` and
their components).

### From TauCetiRoadmap.GlobalGaloisDeformations

§3.4 (representability of `T`-framed global deformations of type `𝒮`, with `n²|T| − 1` frame
variables), §3.6 (relative tangent space and dual Selmer group with framing set `T`), §3.7
(presentation of the global ring over the local rings), §5.1 (Taylor–Wiles data), §5.5 (inertia at
Taylor–Wiles places and the `Δ_Q`-structure), §5.6 (shared Chebotarev selection for Selmer detection).

### From TauCetiRoadmap.DeformationAndDerivedPatchingAlgebra

§§8.1–8.5 (simultaneous patching of two coefficient systems, with augmentation and paired residual
comparisons), used by §5.4.

### From TauCetiRoadmap.GL2ModularityLifting

§1.7 `cht_soluble_prescribed_completions` (CHT08 Lemma 4.1.2: soluble extensions with prescribed
completions), used by §§6.1 and 7.4.

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems

§§2.12–2.16 (Frobenius primes, avoidance by extra split primes, disjointness through towers,
extension of local characters, soluble prescribed-completion extensions), used by §6.1.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

R16.3.2 (Steinberg monodromy and its local factors), used by §§2.3 and 7.3; R17.4.16 (quadratic
automorphic induction), used by §2.4.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

§4.1 (the algebraic Hecke character `ψ_A` of an abelian variety `A/k` over a number field with CM by
a field `E ⊂ End⁰_k(A)` of degree `2 dim A`, all of whose endomorphisms are defined over `k`, and the
splitting of `V_ℓ(A) ⊗ Q̄_ℓ` as a `G_k`-module into the one-dimensional realizations of `ψ_A` along
the embeddings of `E`), applied to a CM elliptic curve over `KM`; used by §2.4.

### From TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

R28.6.2 (semisimplicity of `V_ℓ(E)` for an elliptic curve) and R28.6.3 (the Tate Hom comparison for
elliptic curves). Applied over every finite extension `L` of the base, they give
`End_{ℚ_ℓ[G_L]}(V_ℓ E) = End_L(E) ⊗ ℚ_ℓ = ℚ_ℓ` for geometrically non-CM `E`, hence absolute
irreducibility of `H¹` on `G_L`; used by §§2.1, 2.2 and 8.1.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§3.1 (the semistable reduction predicate and toric rank), §3.12 (full level forces semistability),
§5.1 (Néron–Ogg–Shafarevich), used by §7.2.

### From TauCetiRoadmap.ShimuraVarieties

§5.6 (a CM abelian variety over a number field, in particular a CM elliptic curve, has potentially
good reduction at every finite place), used by §7.4 to exclude CM for a curve with a Tate place.

### From TauCetiRoadmap.EllipticCurves

Layer 4 (reduction types, minimal discriminants, the Tate curve of parameter `q_E` with
`v(Δ) = v(q_E)` and `j = 1/q_E + 744 + ⋯`) and Layer 5 (quadratic twists).

### From TauCetiRoadmap.ClassFieldTheory

Layer 5 (local duality and the local Euler characteristic) and Layer 11 (global reciprocity, used to
turn a quadratic Galois character into a Hecke character).

### From TauCetiRoadmap.SchemeAndStackFoundations

§§4.13 and 4.18 (regular schemes, resolution of curves, nodal families), used by §7.1.

### From TauCetiRoadmap.Chebotarev

Layer 10 (Dirichlet-density Chebotarev), through GlobalGaloisDeformations §5.6.

## References

All statements are in our own words; locators are lines of the line-numbered texts of the fixed
versions below, with printed pages where given.

- **LeHung26.** Bao V. Le Hung, *A geometric prime switch for elliptic curves over totally real and CM
  fields* (discussion draft), Hexagon preprint 2610.00156v1, 7 October 2026, CC BY 4.0. Theorem 1.1,
  p. 2 (line 86); Remark 1.3.1, p. 3 (line 125); §4.1–§4.6, pp. 7–9 (lines 272–355); Remark 4.2, p. 9
  (line 352); §5, p. 9: Lemma 5.1 (line 357) and the CM case (lines 364–366). Unrefereed.
- **CaptainSude26.** CaptainSude (pseudonymous), *Every elliptic curve over a CM number field is
  modular*, GitHub release v1.0.0, 7 October 2026, 15 pages. Theorem 1.1, p. 1 (line 26);
  Proposition 2.3, p. 3 (line 120); Lemmas 3.1–3.4, pp. 4–6 (lines 177–263); §4 setting, p. 6
  (lines 264–289); Lemma 4.1, p. 6 (line 291); Theorem 4.2, p. 9 (line 410); Lemma 5.1, p. 10
  (line 503) and the paragraph after it, p. 11 (lines 533–536); Proposition 5.2, p. 11 (line 538);
  Corollary 5.3, p. 12 (line 604); Proposition 6.2, p. 13 (line 634); proof of Theorem 1.1, p. 14
  (lines 671–683). Unrefereed; no licence is stated, so it is cited by locator only.
- **OpenAI26.** OpenAI, *Modularity of elliptic curves over imaginary quadratic fields*, 4 October 2026,
  revision `adc7f1241b42e322a6451854ab7e4b4c146bf78a`. Proposition 9.3 and Lemma 9.4, pp. 26–27; §9.4,
  pp. 27–28. The parent's source.
- **CN23.** Ana Caraiani and James Newton, *On the modularity of elliptic curves over imaginary quadratic
  fields*, arXiv:2301.10509v3. Theorem 4.2.15, p. 71 (line 3749); Theorem 5.2, pp. 73–74 (line 3849);
  §5.6 data (lines 4226–4260); the Taylor–Wiles levels in `PGL₂` (lines 4362–4368); Lemma 5.6.4,
  p. 85 (line 4397);
  Proposition 5.6.1 (line 4261); Propositions 5.6.2–5.6.3 (lines 4334–4390); the use of
  Taylor–Wiles primes (line 4404); end of the proof of Theorem 5.2 (lines 4433–4509); Theorem 6.1, p. 87
  (line 4513); Lemma 6.1.3, p. 88 (line 4545); Lemma 6.1.4, p. 88 (line 4562); Proposition 6.1.5,
  pp. 88–89 (line 4574).
- **AKT23.** Patrick B. Allen, Chandrashekhar Khare and Jack A. Thorne, *Modularity of `GL₂(𝔽_p)`-representations
  over CM fields*, arXiv:1910.12986v2. Lemma A.5, p. 86 (line 3979), replaced in this case by §4.2;
  Lemma 9.7 and its proof, p. 75 (lines 3470–3510), and Proposition 9.13 and its proof, pp. 79–80
  (lines 3684–3716), for the auxiliary prime of the mod-three seed in §7.4.
- **ACC23.** P. B. Allen et al., *Potential automorphy over CM fields*, arXiv:1812.09999v2. §3.1 setting,
  pp. 57–58 (lines 2309–2345); Theorem 3.1.1, p. 58 (line 2346); §6.4.1 (patching data); §6.5, p. 169
  (the levels `K₀(Q) ⊇ K₁(Q)` at Taylor–Wiles places, lines 6819–6824); §6.5.12,
  p. 178 (auxiliary imaginary quadratic fields, lines 7163–7187).
- **CHT08.** Laurent Clozel, Michael Harris and Richard Taylor, *Automorphy for some l-adic lifts of
  automorphic mod l Galois representations*, Publ. Math. IHÉS 108 (2008). Lemma 4.1.2, p. 116.
- **MilneCM.** J. S. Milne, *Complex Multiplication*, course notes, version of 14 July 2020. Proposition 1.4,
  Corollary 1.5 and Remark 1.6, p. 10 (lines 273–300).
