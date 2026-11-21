# Roadmap: higher local class field theory

**Summary.** An `n`-dimensional local field is a complete discretely valued field whose residue
field is an `(n − 1)`-dimensional local field, the chain `F = K_n, K_{n−1}, …, K_0` ending in a
finite field `K_0 = 𝔽_q`. The fields `𝔽_q((t₁))((t₂))` and `ℚ_p{{t}}` are two-dimensional, and
so are the fraction fields of completed local rings of a surface at a point on a curve. Higher
local class field theory describes the abelian extensions of such a field through its
**topological Milnor K-group** `K_n^top(F)` in the degree equal to the dimension, as those of a
classical local field are described through `Fˣ = K_1(F)`. This roadmap builds it for fields
whose first residue field `K_{n−1}` has characteristic `p`: every field of characteristic `p`
and every field of mixed characteristic.

The main objects are the higher local fields themselves, with local parameters, the standard
fields `K((X))` and `K{{t}}` and Zhukov's classification; the higher topology on `F`, which for
`n ≥ 2` is coarser than the valuation topology and makes multiplication only sequentially
continuous; Fesenko's sequential topology on `K_n(F)` and the quotient `K_n^top(F)` by the
intersection of its neighbourhoods of zero; and the reciprocity map
`Ψ_F : K_n^top(F) → Gal(F^ab/F)`, due to Parshin in characteristic `p` and to Kato in general,
constructed here by Fesenko's explicit method. The headline theorems are: for every finite
Galois `L/F`, `Ψ_F` induces an isomorphism `K_n^top(F)/N_{L/F}K_n^top(L) ≅ Gal(L/F)^ab`, it sends
the symbol of a system of local parameters to the arithmetic Frobenius, and in dimension one it
is the local Artin map; for `n ≥ 2`, the existence theorem, that `L ↦ N_{L/F}K_n^top(L)` is a
bijection from finite abelian extensions to open subgroups of finite index of `K_n^top(F)`; and
for `n ≥ 2`, injectivity of `Ψ_F`. On the way it proves Fesenko's identification of the
neighbourhood intersection with `⋂_{l ≥ 1} l K_n(F)` and builds three explicit pairings: the
tame pairing away from `p`, the Artin–Schreier–Witt pairing with Parshin's residue formula in
characteristic `p`, and the Hilbert pairing with Vostokov's formula in mixed characteristic.

Milnor K-theory, its residue maps and Kato's norm come from K2SymbolsBrauer. Artin–Schreier–Witt
theory and the one-dimensional Schmid–Witt symbol come from FunctionFieldArithmetic. In
dimension one, the reciprocity map is compared with the local Artin map of ClassFieldTheory,
whose Frobenius convention it follows. FormalLaurentPuiseux supplies derivatives and residues
of Laurent series for Parshin's formula.

Layer 0 defines higher local fields and their extensions. Layer 1 builds the topologies on `F`
and on `Fˣ`. Layer 2 builds `K_n^top(F)`, its generators and structure, the residue pairings of
Parshin and Vostokov defined by their formulas, Fesenko's identification of the neighbourhood
intersection, and norms, and proves that the open subgroups of finite index separate its points.
Layer 3 proves Fesenko's class field axioms for `K_n^top`. Layer 4 constructs the reciprocity
map at finite level, in mixed characteristic through Artin–Schreier trees, and passes to the
limit. Layer 5 identifies the three pairings with the reciprocity map and proves the existence
theorem and injectivity.

## Conventions

- **Universe.** Fields are `F : Type`, as in `TauCeti.ClassFieldTheory.artinMap`, which 4.7
  compares with.
- **Higher local fields.** `IsHigherLocalField n F`, for `[Field F] [ValuativeRel F]`, is defined
  by recursion on `n`: `IsHigherLocalField 0 F` is `Finite F`, and `IsHigherLocalField (n + 1) F`
  says that the valuation is discrete (`ValuativeRel.IsDiscrete`), nontrivial and of rank one,
  that `F` is complete for the uniformity of `Valued.mk' (valuation F)`, and that `𝓀[F]` is an
  `n`-dimensional local field for some valuative relation. That relation is unique (0.1), so the
  chain `F = K_n, K_{n−1} = 𝓀[F], …, K_0` is determined by `F`. Write `q = |K_0|` and
  `p = char K_0`.
- **The class field hypothesis.** Let `m` be the largest index with `char K_m = p`. Layers 1–5
  assume `n ≥ 1` and `m ≥ n − 1`, that is, `char K_{n−1} = p`: either `char F = p` (`m = n`) or
  `F` is of **mixed characteristic** (`m = n − 1`). Statements bind `p` explicitly, through
  `[Fact p.Prime] [CharP 𝓀[F] p]` with `p` occurring in the statement, so that the hypothesis
  survives elaboration.
- **No valuation uniformity instance.** `F` never carries `Valued F _` as an instance, and
  `Valued.mk' (valuation F)` is installed locally only to state completeness. In dimension at
  least two the topology of `F` is the higher topology (1.1), which is strictly coarser than the
  valuation topology. The topologies of Layers 1 and 2 are definitions, installed with `letI`.
- **Standard fields are a type synonym.** Mathlib's `LaurentSeries.valued` is a global instance
  on `K⸨X⸩`, so `K⸨X⸩` already carries the valuation topology and installing the higher topology
  on it would create a second `TopologicalSpace` instance. The standard fields are therefore
  built from `LaurentField K`, a `def` (not an `abbrev`) equal to `K⸨X⸩`, with `Field`,
  `Algebra K` and the `X`-adic `ValuativeRel` (`ValuativeRel.ofValuation`) transported by
  `inferInstanceAs`, and no `Valued`, `UniformSpace` or `TopologicalSpace` instance.
  `𝔽_q⸨X⸩⸨X⸩` is `LaurentField (LaurentField 𝔽_q)`. `K{{t}}` (0.2) is a new structure and
  carries no topology instance either. A statement about the valuation topology of `K⸨X⸩` uses
  the type `LaurentSeries K` itself, where `LaurentSeries.valued` applies.
- **Local parameters.** `t_1, …, t_n ∈ F` are local parameters when `t_n` is a uniformizer of
  `K_n = F` and, for `i < n`, `t_i` is a unit of `K_n, …, K_{i+1}` whose successive residues
  ending in `K_i` are a uniformizer of `K_i`. The **last** parameter is the uniformizer of `F`.
  For `ℚ_p{{t}}`, `t_1 = t` and `t_2 = p`; for `𝔽_q((t₁))((t₂))`, `t_i = t_i`.
- **Milnor K-groups** are those of K2SymbolsBrauer §5.4, with integral coefficients, `K_m(F)`
  the degree-`m` part and `{a_1, …, a_m}` a symbol. **Residues put the uniformizer last**:
  `∂{u_1, …, u_{m−1}, π} = {ū_1, …, ū_{m−1}}` (K2SymbolsBrauer §§9.11 and 9.16).
- **The degree map** `v_F : K_n(F) → ℤ` is the composite of the residues
  `K_n(K_n) → K_{n−1}(K_{n−1}) → ⋯ → K_0(K_0) = ℤ`. So `v_F{t_1, …, t_n} = 1`, and `v_F` is the
  valuation for `n = 1`.
- **Purely unramified extensions.** `F_d = F(μ_{q^d − 1})` inside `AlgebraicClosure F`, and
  `F^pur = ⋃_d F_d = ⋃_{(l, p) = 1} F(μ_l)`. `Frob_F ∈ Gal(F^pur/F)` is `ζ ↦ ζ^q` on roots of
  unity of order prime to `p`. These are the extensions of the last residue field, the purely
  unramified extensions of [Zhukov 2000, §1.2]; an extension unramified at the top but not over
  `K_0`, such as `𝔽_q((t₁))(t₁^{1/ℓ})((t₂))`, is not purely unramified.
- **Arithmetic Frobenius.** `Ψ_F({t_1, …, t_n})` acts on `F^pur` as `Frob_F`, matching
  Conventions C.6 of ClassFieldTheory. Every explicit formula below is normalized by this.
- **Pairings put the Kummer or Artin–Schreier–Witt entry first.** For `μ_l ⊂ F`,
  `(a, α)_l = Ψ_F(α)(a^{1/l})/a^{1/l}`; in characteristic `p`, `[w, α)_r = Ψ_F(α)(y) − y` for
  `℘y = w`, `y ∈ W_r`. In dimension one these are the Hilbert symbol of [Serre, *Local Fields*,
  XIV] and the Schmid–Witt symbol of FunctionFieldArithmetic §4.3.

## Layer 0: higher local fields

Layer 0 holds for every higher local field; the class field hypothesis enters in Layer 1.

### 0.1 Definition

`IsHigherLocalField n F` as in the conventions [Zhukov 2000, §1.1]. The valuative relation of
`𝓀[F]` is unique (`existsUnique_residue_valuativeRel`): a field that is henselian for two
independent rank-one valuations is separably closed (F. K. Schmidt), and a higher local field is
not, having the extensions `F_d`. Dimension one is `IsNonarchimedeanLocalField F` for the
valuative topology (`isHigherLocalField_one_iff`), a complete discretely valued field with finite
residue field being locally compact. With `m` the largest index such that `char K_m = p`, there
are `n + 1` types: `char F = p` (`m = n`) and `char K_{m+1} = 0` for `0 ≤ m ≤ n − 1`; mixed
characteristic is `m = n − 1`.

Provide the following API.

- `IsHigherLocalField`, with the residue field's relation `existsUnique_residue_valuativeRel`.
- `isHigherLocalField_one_iff`.
- The chain `K_i` with its valuative relations, `K_0` finite of cardinality `q`, and the index
  `m`.
- `IsHigherLocalField n F → IsHigherLocalField n F'` along a field isomorphism respecting the
  valuative relations.

**Checks.**

- `𝔽_q`, `ℚ_p` and `𝔽_p⸨X⸩` have dimensions `0`, `1`, `1`.
- `ℚ_p{{t}}` is two-dimensional with `K_1 = 𝔽_p((t))`, so `m = 1 = n − 1`; `ℚ_p((X))` is
  two-dimensional with `K_1 = ℚ_p`, so `m = 0` and it fails the class field hypothesis.
- `ℚ_p` with the trivial valuative relation is not one-dimensional: nontriviality is part of the
  definition.

*Needs:* Mathlib `ValuativeRel`, `ValuativeRel.IsDiscrete`, `IsNontrivial`, `IsRankLeOne`,
`Valued.mk'`, `IsNonarchimedeanLocalField`.

### 0.2 The fields `K{{t}}` and `K((X))`

For a complete discretely valued field `K`, `K{{t}}` is the set of series `∑_{i ∈ ℤ} a_i t^i`,
`a_i ∈ K`, with `inf v(a_i) > −∞` and `v(a_i) → ∞` as `i → −∞`, with
`v(∑ a_i t^i) = min v(a_i)` [Zhukov 2000, §1.1, Example 3]. It is a complete discretely valued
field with the uniformizer of `K` and residue field `𝓀[K]((t̄))`. If `K` is `m`-dimensional,
`K{{t}}` is `(m+1)`-dimensional, and so is `LaurentField K` with its `X`-adic valuative relation
(`isHigherLocalField_laurentField`). The **standard fields** are
`k{{T_1}}⋯{{T_m}}((T_{m+2}))⋯((T_n))` for a local field `k`, `0 ≤ m ≤ n − 1`, and
`𝔽_q((T_1))⋯((T_n))`.

Provide the following API.

- `LaurentField` with its `Field`, `Algebra K` and `ValuativeRel` instances, and the inclusion of
  `K` and the variable `X`.
- `isHigherLocalField_laurentField`.
- `K{{t}}` as a field with its valuation, the embedding of `K`, its residue field, completeness,
  and its dimension.
- `K((X)){{Y}} ≅ K((Y))((X))` [Zhukov 2000, §1.1, Remark].

**Checks.**

- `∑_{i ≥ 1} p^i t^{−i}` lies in `ℚ_p{{t}}` but not in `ℚ_p((t))`, where coefficients of
  negative powers must vanish eventually.
- `∑_{i ≥ 1} t^{−i}` lies in neither: `v(a_i) = 0` does not tend to infinity.
- The residue field of `ℚ_p{{t}}` is `𝔽_p((t̄))`, not `𝔽_p`: the valuation of `K{{t}}` is
  that of `K`, not the `t`-adic one.

*Needs:* 0.1; Mathlib `LaurentSeries`, `HahnSeries`, `ValuativeRel.ofValuation`.

### 0.3 Local parameters and the rank-`n` valuation

Local parameters exist. They define the rank-`n` valuation `𝐯 = (v_1, …, v_n) : Fˣ → ℤⁿ`, with
`ℤⁿ` ordered lexicographically from the last coordinate, `v_n` the valuation of `F` and `v_i`
read on the residue of `x t_n^{−v_n(x)} ⋯` in `K_i` [Zhukov 2000, §1.1]. `𝐯(t_i)` is the `i`-th
basis vector. `𝐯` depends on the parameters, its equivalence class does not, and so neither do
`𝒪_F = {𝐯 ≥ 0}`, `𝓂_F = {𝐯 > 0}` and the principal units `V_F = 1 + 𝓂_F`. When
`char K_{n−1} = p`, `R ⊂ 𝒪_F` is the set of multiplicative (Teichmüller) representatives of
`K_0`: it is closed under multiplication, `Rˣ = μ_{q−1}(F) ≅ K_0ˣ`, and it is a subfield exactly
when `char F = p` (for `F = ℚ_p`, `R = {0} ∪ μ_{p−1}` and `1 + 1 = 2 ∉ R`). Then
`Fˣ = ⟨t_1⟩ × ⋯ × ⟨t_n⟩ × Rˣ × V_F` [Zhukov 2000, §§1.1, 1.4.2].

Provide the following API.

- Existence of local parameters, and parameters of `K{{t}}` and `K((X))` from those of `K`.
- `𝐯` as a valuation of rank `n`, its dependence on the parameters only up to equivalence.
- The filtration `U_{𝐢} = 1 + {x : 𝐯(x) ≥ 𝐢}`, `𝐢 > 0`, of `V_F` and its graded pieces
  `u_{𝐢} = U_{𝐢}/U_{𝐢+(1,0,…,0)} ≅ K_0` [Fesenko 2000a, §6.8.1].
- The set `R` with `Rˣ = μ_{q−1}(F)`, and the decomposition of `Fˣ` under the class field
  hypothesis.

**Checks.**

- On `𝔽_p((t₁))((t₂))`, replacing `t_2` by `t_2' = t_1t_2` changes `𝐯(t_2)` from `(0, 1)` to
  `(−1, 1)`: `𝐯` depends on the parameters.
- For `n = 2`, `1 + t_1` and `1 + t_1^2` are units of `𝒪[F]` outside `1 + t_2𝒪[F]`, so the
  filtration `1 + t_2^i𝒪[F]` puts them in the same step, while `1 + t_1 ∈ U_{(1,0)} ∖ U_{(2,0)}` and
  `1 + t_1^2 ∈ U_{(2,0)}`: the rank-`n` filtration separates them.

*Needs:* 0.1–0.2; Mathlib Hensel's lemma (`HenselianLocalRing`).

### 0.4 Classification

[Zhukov 2000, §1.1, Classification Theorem]. If `char F = p`, then `F ≅ 𝔽_q((X_1))⋯((X_n))`,
the isomorphism sending local parameters to the variables. If `char K_1 = 0`, then
`F ≅ k((X_1))⋯((X_{n−1}))` for a local field `k`. If `char K_{m+1} = 0` and `char K_m = p`, then
`F` is a finite extension of a standard field `k{{T_1}}⋯{{T_m}}((T_{m+2}))⋯((T_n))`, and has a
finite extension which is standard. In mixed characteristic the standard subfield is
`k_0{{T_1}}⋯{{T_{n−1}}}` with `k_0` the fraction field of `W(𝔽_q)`, embedded through the
canonical lifting of [Zhukov 2000, §1.3.1].

Provide the following API.

- The three cases, the first as an isomorphism with iterated `LaurentField`.
- The canonical lifting `h_{t_1, …, t_{n−1}} : K_0((t_1))⋯((t_{n−1})) → 𝒪_F` in mixed
  characteristic, and the embedding of `k_0{{T_1}}⋯{{T_{n−1}}}` sending `T_i` to `t_i`.

**Checks.**

- `ℚ_p{{t}}` is itself standard, with `m = 1`; `ℚ_p{{t}}(p^{1/2})` is a finite extension of it.
- In characteristic `p` the isomorphism is not unique: `X_1 ↦ X_1 + X_2` is another one.

*Needs:* 0.1–0.3; Mathlib `WittVector`.

### 0.5 Finite extensions

A finite extension `L` of an `n`-dimensional local field `F`, separable or not, is one. For a
finite extension `L` of a complete discretely valued field `K`, the valuation of `K` prolongs
uniquely to `L`, the integral closure of the valuation ring is a discrete valuation ring, free of
rank `[L : K]`, and `L` is complete [Serre, *Local Fields*, II §2, Proposition 3]; uniqueness of
the prolongation is Mathlib's `spectralNorm_unique`. So `𝓀[L]` is a finite extension of
`𝓀[F]`, and induction applies. Inseparable extensions occur: in the Check, and among the residue
extensions in the induction.
With `e_i(L/F) = e(L_i/K_i)` and `f(L/F) = [L_0 : K_0]`,
`[L : F] = f(L/F) ∏_i e_i(L/F)`, and the `e_i` do not depend on the parameters
[Zhukov 2000, §1.2].

**Checks.**

- `𝔽_p((t₁))(t₁^{1/ℓ})((t₂))` over `𝔽_p((t₁))((t₂))` has `e_1 = ℓ`, `e_2 = 1`, `f = 1`.

*Needs:* 0.1–0.3; Mathlib `spectralNorm_unique`, `IsIntegralClosure`,
`IsDiscreteValuationRing`.

### 0.6 Purely unramified extensions

`F_d/F` is Galois, cyclic of degree `d`, generated by `Frob_F`; local parameters of `F` are local
parameters of `F_d`, `K_0(F_d) = 𝔽_{q^d}`, and every finite extension `L/F` contains a largest
`F_d`, with `d = f(L/F)`. `Gal(F^pur/F) ≅ Ẑ`, `Frob_F ↦ 1` (`TauCeti.zHat`). This is Fesenko's
axiom (A1) [Fesenko 2000c, §10.1].

**Checks.**

- `F(μ_ℓ) = F` for `ℓ ∣ q − 1`, and `[F(μ_ℓ) : F]` is the order of `q` modulo `ℓ` for `ℓ ≠ p`.

*Needs:* 0.5; Tau Ceti `TauCeti.zHat`; Mathlib `GaloisField`, `IsCyclotomicExtension`.

### Examples

`𝔽_q((t₁))((t₂))`, `ℚ_p{{t}}` and `ℚ_p{{t}}(p^{1/2})` satisfy the class field hypothesis;
`ℚ_p((X))` does not.

### Dependencies

Mathlib valuative relations, Laurent series, Witt vectors and spectral norms; Tau Ceti
`TauCeti.zHat`.

## Layer 1: topologies

From here on `F` satisfies the class field hypothesis.

### 1.1 The higher topology

[Parshin 1984; Zhukov 2000, §§1.3.1–1.3.2]. On `K((X))` with `K` topologized, the basic
neighbourhoods of `0` are the sets `∑_i U_i X^i` with `U_i` open in `K` and `U_i = K` for
`i ≫ 0`. Starting from the discrete topology on `K_0`, this defines the topology of every field of
characteristic `p`. In mixed characteristic, the basic neighbourhoods are the sets
`∑_i h(a_i) π^i`, `a_i ∈ U_i`, for `h` the canonical lifting of 0.4 and `π` a uniformizer, and on
`E{{X}}` the alternative description of [Zhukov 2000, §1.3.1, Remark 3] applies. On a finite
extension of a standard field it is the product topology through a basis. The theorems: the
topology does not depend on the presentation, the parameters or the basis; `F` is a complete
Hausdorff topological additive group; for `n ≥ 2` no base of neighbourhoods of `0` is countable
and `UU = F` for every open subgroup `U`, so multiplication is not continuous; multiplication is
sequentially continuous; `x ↦ cx` is a homeomorphism for `c ≠ 0`; for finite `L/F` the topology
of `F` is induced from `L`. In dimension one it is the valuation topology. Every element of `F` is
uniquely a convergent sum `∑_{𝐢 ∈ Ω} b_𝐢 t_1^{i_1} ⋯ t_n^{i_n}` over an admissible
`Ω ⊂ ℤⁿ` with `b_𝐢 ∈ R` [Zhukov 2000, §1.3.4].

Provide the following API.

- The higher topology on `F`, as a definition installed with `letI`, and its basic
  neighbourhoods on standard fields.
- Independence of the presentation.
- Completeness, Hausdorffness, `IsTopologicalAddGroup`, sequential continuity of multiplication
  (Mathlib `SeqContinuous`), and the failure of continuity for `n ≥ 2`.
- Agreement with the valuation topology in dimension one.
- The power series expansion.

**Checks.**

- On `F = LaurentField (LaurentField 𝔽_p)`, with `t_1` the inner variable, `t_1^k → 0` for the
  higher topology. But `v(t_1^k) = 0` for every `k`, so on the same element of
  `LaurentSeries (LaurentField 𝔽_p)` it does not tend to `0` for `LaurentSeries.valued`, the
  `t_2`-adic topology. Every neighbourhood of `0` contains some `t_2^i𝒪[F]`, so the valuation
  topology is strictly finer.
- In dimension one the two topologies agree.
- Outside the hypothesis the construction is not canonical. On `ℚ_p((X))` a nonzero derivation
  `D` of `ℚ_p` gives a second coefficient field `E' = {a + D(a)X + ⋯}`; `D` is discontinuous, so
  some `e_k → 0` in `ℚ_p` has `D(e_k) ↛ 0`. The constants `e_k` tend to `0` for the topology read
  through `ℚ_p`, but their `X`-coefficient in `E'`-coordinates is `−D(e_k)`, so they do not tend
  to `0` for the topology read through `E'` [Zhukov 2000, §1.3.1(c)].

*Needs:* 0.2–0.5.

### 1.2 The topology on `Fˣ`

[Zhukov 2000, §1.4.2]. The topology `τ` on `Fˣ = ⟨t_1⟩ × ⋯ × ⟨t_n⟩ × Rˣ × V_F` is the product of
the discrete topology on the first factors and the topology induced by 1.1 on `V_F`. It does not
depend on the parameters; Cauchy sequences converge; multiplication is sequentially continuous.
For `n ≤ 2`, `Fˣ` is a topological group with a countable base of open subgroups; for `n ≥ 3`
it is not a topological group.

**Checks.**

- For `n = 2`, the sets `1 + t_2^i𝒪[F] + t_1^jA[[t_1, t_2]]`, `i, j ≥ 1`, with `A = K_0` or
  `W(K_0)`, form a base at `1` [Zhukov 2000, §1.4.1].
- For `n ≥ 3`, every `τ`-open subgroup `A` of `Fˣ` satisfies
  `1 + t_n^2𝒪[F] ⊆ (1 + t_n^3𝒪[F])A` [Zhukov 2000, §1.4.2, Remark 1]; the sequential saturation
  of 1.3 has open subgroups without this property.

*Needs:* 0.3, 1.1.

### 1.3 Sequential saturations

[Fesenko 2000a, §6.2]. The sequential saturation of a topology is the finest topology with the
same convergent sequences. `λ` on `F` and `λ_*` on `Fˣ` are the sequential saturations of 1.1 and
1.2, and the `∗`-product topology on `X_1 × ⋯ × X_j` is the sequential saturation of the product
topology. Theorems, the properties (1)–(7) of the source: subtraction and division are
sequentially continuous; `α_i^{p^i} → 1` for every sequence of principal units `α_i ∈ V_F`; every fundamental sequence
converges; `V_F` and `F^{×m}` are closed in `Fˣ`; and the intersection of the open subgroups of
finite index containing a closed subgroup `H` is `H`. For finite `L/F`, `N_{L/F} : Lˣ → Fˣ` and
the trace are sequentially continuous.

**Checks.**

- On `𝔽_p((t₁))((t₂))`, `F ∖ {t_2^i t_1^{−j} + t_2^{−i} t_1^j : i, j ≥ 1}` is open for `λ` but not
  for the higher topology: `λ` is strictly finer for `n ≥ 2`.
- For `n = 1`, `λ_*` restricted to `V_F` is the topology induced from `λ`.

*Needs:* 1.1–1.2; Mathlib `SeqContinuous`, `SequentialSpace`.

### Examples

The Checks of 1.1 and 1.3 on `𝔽_p((t₁))((t₂))` separate the three topologies: valuation, higher,
and `λ`.

### Dependencies

Layer 0.

## Layer 2: topological Milnor K-groups

### 2.1 Definition

[Fesenko 2000a, §6.3]. `λ_m` is the finest topology on `K_m(F)` for which subtraction and the
symbol map `(Fˣ)^m → K_m(F)`, `(Fˣ)^m` with the `∗`-product of `λ_*`, are sequentially
continuous. `Λ_m(F)` is the intersection of the `λ_m`-neighbourhoods of `0`; it is a closed
subgroup contained in `VK_m(F) = ⟨{V_F}·K_{m−1}(F)⟩`. The **topological Milnor K-group** is
`K_m^top(F) = K_m(F)/Λ_m(F)` with the quotient topology, and `VK_m^top(F)` is the image of
`VK_m(F)`. `K_1^top(F) = Fˣ` with `λ_*`. A sequentially continuous symbolic map from `(Fˣ)^m` to
a discrete group has a kernel on `K_m(F)` that is open for `λ_m`, so it factors through
`K_m^top(F)`.

Provide the following API.

- `λ_m`, `Λ_m(F)`, `K_m^top(F)` with its topology, and its functoriality in field embeddings.
- `Λ_m(F)` closed, `Λ_m(F) ⊆ VK_m(F)`, `K_1^top(F) = Fˣ`.
- The factorization of sequentially continuous symbolic maps to discrete groups.

**Checks.**

- `K_1^top(F) = Fˣ`. Outside the hypothesis this fails: if `char K_{n−1} = 0` the uniquely
  divisible group `1 + 𝓂_{K_n}` lies in `Λ_1` [Fesenko 2000a, §6.3].
- For a one-dimensional `F`, `K_3(F)` is a nonzero uniquely divisible group
  [Fesenko 2000a, §6.1] while `K_3^top(F) = 0` (2.3): `Λ_3(F)` is all of `K_3(F)`.

*Needs:* 1.3; K2SymbolsBrauer §5.4.

### 2.2 The degree map

[Fesenko 2000a, §6.4.1]. `v_F` kills `Λ_n(F)`, descends to `K_n^top(F)`, is onto, satisfies
`v_F{t_1, …, t_n} = 1`, is continuous for the discrete topology on `ℤ`, and does not depend on
the parameters. This is the valuation of Fesenko's axiom (A2) [Fesenko 2000c, §10.1].

**Checks.**

- `v_F{t_2, t_1} = −1` for `n = 2`: the order of the entries matters.
- `v_F{θ, t_2, …, t_n} = 0` for `θ ∈ Rˣ`.

*Needs:* 2.1; K2SymbolsBrauer §§9.11, 9.16.

### 2.3 Generators and structure

[Fesenko 2000a, §§6.5, 6.7.1; Fesenko 2001, §§4.2–4.3, 4.7].

- **Generators** [Fesenko 2001, §4.2]. For `α_1 ∈ V_F` and `α_2, …, α_m ∈ Fˣ`, the symbol `{α_1, …, α_m}` is, modulo
  `Λ_m(F)`, a convergent sum `∑_J {β_J, t_{j_1}, …, t_{j_{m−1}}}` with `β_J ∈ V_F` depending
  sequentially continuously on the `α_i`, `J` running over the `(m − 1)`-subsets of
  `{1, …, n}`. So `VK_m^top(F)` is topologically generated by the symbols
  `{1 + θ t_n^{i_n} ⋯ t_1^{i_1}, t_{j_1}, …, t_{j_{m−1}}}`, `θ ∈ R`, and `K_m^top(F) = 0` for
  `m ≥ n + 2`.
- **Structure.** Through `v_F` and the composite residues `∂^{(m)}` of K2SymbolsBrauer §9.11,
  `K_m^top(F) ≅ VK_m^top(F) ⊕ ℤ^{a(m)} ⊕ (ℤ/(q − 1))^{b(m)}`, the free part spanned by the
  symbols `{t_{j_1}, …, t_{j_m}}`, `j_1 < ⋯ < j_m`, and the torsion part by symbols with one
  entry `θ ∈ Rˣ`. In degree `n`: `K_n^top(F) = ℤ{t_1, …, t_n} ⊕ (ℤ/(q − 1))^n ⊕ VK_n^top(F)`,
  and the kernel of `v_F` on `K_n^top(F)` is `VK_n^top(F) ⊕ (ℤ/(q − 1))^n`.
- **Away from `p`.** For a prime `ℓ ≠ p`, `V_F` is `ℓ`-divisible, so
  `K_m(F)/ℓ = K_m^top(F)/ℓ ≅ (ℤ/ℓ)^{a(m)} ⊕ (ℤ/d)^{b(m)}`, `d = gcd(q − 1, ℓ)`.
- **Divisible elements are in `Λ`.** `⋂_{l ≥ 1} lK_m(F) ⊆ Λ_m(F)` [Fesenko 2000a, §6.5, Lemma]:
  write `x ∈ VK_m(F)` as `∑ {α_J, t_{j_1}, …}` modulo `Λ_m(F)` and apply property (3) of 1.3.
- **Torsion prime to `p`.** If a primitive `l`-th root of unity `ζ_l` lies in `F` and `p ∤ l`,
  the `l`-torsion of `K_m^top(F)` is `{ζ_l}·K_{m−1}^top(F)` [Fesenko 2000a, §6.6, proof of
  Theorem 3; Fesenko 2001, §4.7, proof of (ii)], from the structure above and the previous
  bullet.

**Checks.**

- For `ℓ ∣ q − 1`, `K_2^top(𝔽_q((t₁))((t₂)))/ℓ ≅ (ℤ/ℓ)^3`, spanned by `{t_1, t_2}`, `{θ, t_2}`,
  `{t_1, θ}`.
- For `ℓ ∤ q(q − 1)`, `K_n^top(F)/ℓ ≅ ℤ/ℓ` through `v_F`.
- `{θ, t_2, …, t_n}` with `θ` a generator of `Rˣ` has order `q − 1`, matching
  `{ζ_{q−1}}·K_{n−1}^top(F)`.

*Needs:* 2.1–2.2, 0.3, 1.3 (property (3)); K2SymbolsBrauer §§9.11, 9.17.

### 2.4 Separation

[Fesenko 2000a, §6.6, Theorem 1 and Corollary; Fesenko 2001, §4.6, Theorem]. Under the class
field hypothesis, the homomorphism
`g : ∏_J V_F → VK_m(F)`, `(β_J) ↦ ∑_J {β_J, t_{j_1}, …, t_{j_{m−1}}}`, `J` running over the
`(m − 1)`-subsets of `{1, …, n}`, induces a homeomorphism of `∏_J V_F/g^{−1}(Λ_m(F))`, with the
quotient of the `∗`-product topology, onto `VK_m^top(F)`, and `g^{−1}(Λ_m(F))` is closed.
Consequently `Λ_m(F)` is the intersection of the open subgroups of finite index of `K_m(F)`:
the open subgroups of finite index of `K_m^top(F)` have zero intersection.

**Checks.**

- For `n = 1`, this says that the open subgroups of finite index of `Fˣ` have trivial
  intersection.
- `ℓ^r K_n^top(F)` is open of finite index for `ℓ ≠ p`, and contains `VK_n^top(F)`; these alone
  do not separate `VK_n^top(F)`, so the `p`-part of the theorem is not formal.

*Needs:* 2.1, 2.3, 1.3 (property (7)).

### 2.5 Parshin's residue pairing in characteristic `p`

[Parshin 1984; Fesenko 2000a, §6.4.3; Fesenko 2001, §3.1]. Let `char F = p` and fix an
isomorphism `F ≅ 𝔽_q⸨t_1⸩⋯⸨t_n⸩` of 0.4, the `t_i` local parameters. Let
`A_r = W_r(𝔽_q)⸨t_1⸩⋯⸨t_n⸩`, the iterated Laurent series ring over `W_r(𝔽_q)` (Mathlib
`LaurentSeries` over a commutative ring). Modulo `℘W_r(F)`, every class of `W_r(F)` is a
convergent `ℤ/p^r`-combination of Teichmüller monomials `[c t_1^{i_1} ⋯ t_n^{i_n}]`, `c ∈ 𝔽_q`,
since `V x ≡ Fr(V x) = p x` modulo `℘`, `Fr` the Witt vector Frobenius. Its lift `w̃ ∈ A_r` replaces each `[c t^𝐢]` by
`[c] t^𝐢`; for `b ∈ Fˣ` written `t^𝐚 θ ∏(1 + θ_𝐢 t^𝐢)` with `θ, θ_𝐢 ∈ R` (1.1), its lift `b̃`
puts `[·]` on the coefficients. **Parshin's pairing** is

`P_r(w, {b_1, …, b_n}) = Tr_{W_r(𝔽_q)/(ℤ/p^r)} Res(w̃ · dlog b̃_1 ∧ ⋯ ∧ dlog b̃_n) ∈ ℤ/p^r`,

where `Res` takes the coefficient of `t_1^{−1} ⋯ t_n^{−1}` in front of
`dt_1 ∧ ⋯ ∧ dt_n`. At `r = 1` it reads
`P_1(a, {b_1, …, b_n}) = Tr_{𝔽_q/𝔽_p} res(a · det(∂b_i/∂t_j)/(b_1 ⋯ b_n))`, and for `n = 1` it is
the residue formula of FunctionFieldArithmetic §4.3. A Witt vector of characteristic `p` is not
determined by its ghost components, so the value at length `r` is computed on these lifts and
not through ghost components in `F`. Two targets make the formula statable:

- **coefficientwise derivations**: a derivation `D` of a commutative ring `A` extends to
  `LaurentSeries A` by `D(∑ a_i X^i) = ∑ D(a_i)X^i`. It is a derivation, continuous for the
  higher topology when `A` is a field, and commutes with the outer `LaurentSeries.derivative`.
  Starting from `LaurentSeries.derivative` on the innermost variable and extending outward gives
  the partial derivatives `∂/∂t_j` on `A_r` and on `LaurentField (⋯ (LaurentField 𝔽_q))`;
- **the iterated residue**: the coefficient of `t_1^{−1} ⋯ t_n^{−1}`, `coeff_{−1}` taken from the
  outermost variable inward. It is `W_r(𝔽_q)`-linear and kills the partial derivatives `∂f/∂t_j`.

Targets: `P_r` does not depend on the isomorphism, the representative or the lifts; it kills
`℘W_r(F)` and is additive in `w`; it is multilinear and symbolic in the `b_i` and sequentially
continuous in each, so it induces `P_r : W_r(F)/℘ × K_n^top(F)/p^r → ℤ/p^r` (2.1); and it has
properties (1)–(3) of [Fesenko 2000a, §6.4.3]:
`P_r(Vw, α) = V P_{r−1}(w, α)`, compatibility with the restriction `W_{r+1} → W_r`, and the
triangular values `P_1(θ_0, {t_1, …, t_n}) = Tr θ_0` and
`P_1(θ_0 θ^{−1} i_l^{−1} t_1^{−i_1} ⋯ t_n^{−i_n}, {1 + θ t_n^{i_n} ⋯ t_1^{i_1}, t_1, …, t̂_l, …, t_n}) = (−1)^{l−1} Tr θ_0`
for `p ∤ i_l`, the sign coming from moving `dt_l/t_l` into place.

**Checks.**

- For `a ∈ 𝔽_q`, `P_1(a, α) = v_F(α) · Tr_{𝔽_q/𝔽_p}(a)`.
- On `𝔽_p((t₁))((t₂))`, `P_1(t_1^{−1}, {1 − t_1, t_2}) = −1`, the residue of
  `−t_1^{−1}(1 − t_1)^{−1} dt_1 ∧ dt_2/t_2`; and `P_1(t_1^{−1}t_2^{−1}, {t_1, t_2}) = 0`.
- At `r = 2`, `w = (0, a) = V[a]` with `Tr_{𝔽_q/𝔽_p}(a) ≠ 0` has both ghost components `0` in
  characteristic `p`, while `w̃ = p[a]` gives `P_2(w, {t_1, …, t_n}) = p·Tr(a) ≠ 0` in `ℤ/p^2`.
- Swapping two entries of `{b_1, …, b_n}` changes the sign of the determinant, matching
  `v_F{t_2, t_1} = −1`.

*Needs:* 0.4, 1.1–1.3, 2.1–2.2; FunctionFieldArithmetic §3.1; FormalLaurentPuiseux L2–L3;
Mathlib `WittVector`, `LaurentSeries`.

### 2.6 Vostokov's map in mixed characteristic

[Vostokov 1985; Vostokov 2000, §8.3, Theorem 1; Fesenko 2001, §3.2]. Let `F` be of mixed
characteristic, `p > 2` and `μ_{p^r} ⊂ F`. Vostokov's map
`V(·,·)_r : (Fˣ)^{n+1} → μ_{p^r}`, defined by the residue formula of §8.3 on lifts to
`k_0{{X_1}}⋯{{X_n}}`, is well defined, independent of the lifts and of the parameters,
multilinear and symbolic, and sequentially continuous, so it induces
`V(·,·)_r : K_n^top(F)/p^r × Fˣ/F^{×p^r} → μ_{p^r}` (2.1), which is nondegenerate. The
Shafarevich basis `t_1, …, t_n`, `ε_J = 1 + θ t_n^{j_n} ⋯ t_1^{j_1}` (`p ∤ gcd(𝐣)`,
`0 < 𝐣 < p𝐞/(p − 1)`) and `ω = ω(a)` computes it: `V({t_1, …, t_n}, ε_J)_r = 1`,
`V({t_1, …, t_n}, ω)_r = ζ_{p^r}`, and for every `θ ∈ Rˣ` there is `θ' ∈ Rˣ` with
`V({1 + θ t_n^{i_n} ⋯ t_1^{i_1}, t_1, …, t̂_l, …, t_n}, 1 + θ' t_n^{pe_n/(p−1) − i_n} ⋯ t_1^{pe_1/(p−1) − i_1})_r = ζ_{p^r}`
for `p ∤ i_l`, `0 < 𝐢 < p𝐞/(p − 1)`. Vostokov's primary elements `E(χ)`, principal units with
prescribed values `V({t_1, …, t_n}, E(χ))_r`, are part of this target [Fesenko 2001, §3.2].

**Checks.**

- `V({t_1, …, t_n}, t_i)_r = 1`: `{t_1, …, t_n, t_i}` is `±{…, −1, …}` by `{t_i, t_i} = {t_i, −1}`,
  so it is `2`-torsion, and `p` is odd. A formula that is not symbolic fails this.

*Needs:* 0.3–0.4, 1.1–1.3, 2.1; Mathlib `WittVector`, `PowerSeries.exp`.

### 2.7 The groups `K_n^top(F)/p`

[Fesenko 2000a, §§6.4, 6.7.2; Fesenko 2000b, §7.2; Fesenko 2001, §§4.3, 4.5]. By the method of
§6.4 (a pairing whose values on the generators are triangular), `K_n^top(F)/p` has the following
topological bases. In characteristic `p`, from the triangular values of 2.5: the symbols
`{1 + θ t_n^{i_n} ⋯ t_1^{i_1}, t_n, …, t̂_l, …, t_1}` with `p ∤ gcd(i_1, …, i_n)`,
`l = min{k : p ∤ i_k}`, `θ` in an `𝔽_p`-basis of `K_0`, together with `{t_1, …, t_n}`. In mixed characteristic with `ζ_p ∈ F`, from 2.6: the same symbols with
`0 < 𝐢 < p𝐞/(p − 1)`, `𝐞 = 𝐯(p)`, together with the symbols `ω_*(j)` of §6.7.2. If `ζ_p ∉ F`,
pass to `F(ζ_p)`, of degree prime to `p`, and back. Vostokov's map is defined for `p > 2`
(2.6); §6.7.2 states the bases without restriction on `p`, and this target is that statement.

In characteristic `p` this refines to Parshin's structure theorem [Fesenko 2000b, §7.2, Theorem
1; Fesenko 2001, §4.5]: for the subgroups `E_J ⊆ V_F` generated by the `1 + θ t^𝐢`,
`p ∤ gcd(𝐢)`, whose smallest index `l` with `p ∤ i_l` is not in `J`, `∏_J E_J → VK_m^top(F)` is
an isomorphism and a homeomorphism. So `K_m^top(F)` has no `p`-torsion in characteristic `p`
[Fesenko 2000b, §7.2, Corollary].

**Checks.**

- In characteristic `p`, `K_n^top(F)/p` is not finitely generated, unlike `K_n^top(F)/ℓ` for
  `ℓ ≠ p`.
- On `𝔽_p((t₁))((t₂))`, `{1 − t_1, t_2} ∉ pK_2^top(F)`, since `P_1(t_1^{−1}, {1 − t_1, t_2}) = −1`
  (2.5).

*Needs:* 0.3, 2.3–2.6.

### 2.8 Bloch–Kato's graded quotients of `K_m(F)/p`

[Bloch–Kato 1986, §4, (4.3)–(4.8), pp. 121–123, and §5, (5.1)–(5.3), pp. 124–126]. Let `F` be
of mixed characteristic, `k = K_{n−1}` its residue field, so `[k : k^p] = p^{n−1}`, `π` a
uniformizer of `F`, `e = v_F(p)` and `e' = ep/(p − 1)`. Write `k_q(F) = K_q(F)/p` and `Ω^j` for
the absolute Kähler differentials `Ω^j_k`, with `Z^j_1 = ker(d)` and `C` the Cartier operator. For
`m ≥ 1`, `U^m k_q(F)` is the subgroup generated by the symbols `{1 + π^m x, y_1, …, y_{q−1}}`
with `x ∈ 𝒪[F]`, `y_i ∈ Fˣ`, and `U^0 k_q(F) = k_q(F)`; `gr^m = U^m/U^{m+1}`.

- **The symbol maps** [(4.3)]. `ρ_m : Ω^{q−1} ⊕ Ω^{q−2} → gr^m k_q(F)`,
  `(x dy_1/y_1 ∧ ⋯ ∧ dy_{q−1}/y_{q−1}, 0) ↦ {1 + π^m x̃, ỹ_1, …, ỹ_{q−1}}` and
  `(0, x dy_1/y_1 ∧ ⋯ ∧ dy_{q−2}/y_{q−2}) ↦ {1 + π^m x̃, ỹ_1, …, ỹ_{q−2}, π}`, for lifts `x̃`,
  `ỹ_i`, is well defined and onto. It depends on `π`.
- **Graded pieces below `e'`** [(4.7), (5.2)]. For `0 < m < e'`, `ρ_m` induces
  `gr^m k_q(F) ≅ Ω^{q−1}` if `p ∤ m`, and `gr^m k_q(F) ≅ Ω^{q−1}/Z^{q−1}_1 ⊕ Ω^{q−2}/Z^{q−2}_1`
  if `p | m`.
- **The top and above** [(5.1)]. `U^m k_q(F) = 0` for `m > e'`. If `e'` is an integer, `ρ_{e'}`
  kills `(1 + aC)Z^{q−1}_1 ⊕ (1 + aC)Z^{q−2}_1`, where `a` is the residue of `pπ^{−e}`.
- **Depth zero** [(5.3)]. `gr^0 k_q(F) ≅ k_q(k) ⊕ k_{q−1}(k)`, and through the differential symbol
  `k_q(k) ≅ ν_k(q)` this is a sum of logarithmic differentials.

Surjectivity is elementary: the symbol calculus of (4.1)–(4.6) with `(1 + π^m x)^p ≡ 1 + pπ^m x^p`
modulo higher terms. Injectivity [(4.8)] is proved in §5 through the cohomological symbol
[(5.2)]. A limit argument reduces to a residue field finitely generated over `𝔽_p`, of
transcendence degree `d`, and a norm argument to `μ_p ⊂ F`. Then `gr^m` and `gr^{e'−m}` pair,
through the symbol and the cup product, into the top step `U^{e'}h^{d+2}` of
`h^{d+2} = H^{d+2}(F, μ_p^{⊗(d+2)})`, compatibly up to an `𝔽_p^×`-multiple with the wedge pairing
of differential forms, which is perfect. That this top step is nonzero is [Kato 1980, §1,
Theorem 2], as Bloch and Kato cite it.

**Checks.**

- `n = 1`, `q = 1`: `k` is finite, `Ω^0 = k` and `Ω^j = 0` for `j ≥ 1`, so `gr^m(Fˣ/p) ≅ k` for
  `p ∤ m < e'` and `gr^m = 0` for `p | m < e'`, since then `Z^0_1 = k`. This is the classical
  structure of `U_F^{(m)}/U_F^{(m+1)}(Fˣ)^p`. At `m = e'`, `C` is `x ↦ x^{1/p}` on the perfect
  field `k`, and `1 + aC` is `𝔽_p`-linear with kernel of order at most `p`, so `gr^{e'}` has
  `𝔽_p`-dimension at most one; classically it is nonzero exactly when `μ_p ⊂ F`.
- `F = ℚ_p{{t}}`, `p` odd, `q = 2`, `m = 1`: `e' = p/(p − 1)` is not an integer, `p ∤ 1`, and
  `gr^1 k_2(F) ≅ Ω^1_{𝔽_p((t))}`, the one-dimensional `k`-space `k·dt`, infinite over
  `𝔽_p`, spanned by the classes `{1 + p x, t}`. So 2.9 needs the topology, not finiteness.
- The second summand is not redundant when `p | m < e'`, which needs `e ≥ p`, as for
  `F = ℚ_p(μ_{p²}){{t}}` (`e' = p²`, `m = p`): for `q = 2` it is `k/Z^0_1 = k/k^p ≠ 0`, the class
  of `{1 + π^m x̃, π}` for `x ∉ k^p`. A description by `Ω^{q−1}` alone would lose it.

*Needs:* K2SymbolsBrauer §5.4; KTheoryFiniteLocalFields §3.0 (the differential symbol and `ν_k`)
and §3.0a (the norm residue isomorphism, for injectivity); ProfiniteCohomology Layer 12 (the
graded cup product).

### 2.9 Fesenko's theorem

[Fesenko 2000a, §6.6, Theorems 2–3; Fesenko 2001, §4.5, Theorem, and §4.7, Theorem]. For every
`F` under the class field hypothesis, `Λ_m(F) = ⋂_{l ≥ 1} lK_m(F)`, and it is a divisible group,
so `K_m^top(F)` has no nonzero infinitely divisible elements. In characteristic `p`,
`K_m^top(F)` has no `p`-torsion (2.7). In mixed characteristic, if `ζ_{p^r} ∈ F`, the
`p^r`-torsion of `K_m^top(F)` is `{ζ_{p^r}}·K_{m−1}^top(F)`. One inclusion is the third bullet
of 2.3.

- **Characteristic `p`** [Fesenko 2000a, §6.6, Theorem 2]. The differential symbol
  `K_m(F)/p → Ω^m_F` is injective and continuous, and `Ω^m_F` is Hausdorff, so
  `Λ_m(F) ⊆ pK_m(F)`. Since `K_m^top(F)` has no `p`-torsion (2.7), `Λ_m(F) = pΛ_m(F)`.
- **Mixed characteristic, first step** [Fesenko 2000a, §6.6, proof of Theorem 3, case `r = 1`].
  `Λ_m(F) ⊆ pVK_m(F)`. After adjoining `μ_p` (its degree is prime to `p`, and `VK_m(F)` is
  `l`-divisible for `l` prime to `p`), the intersection of the open subgroups of `VK_m(F)`
  containing `pVK_m(F)` is `pVK_m(F)`. This is because the graded pieces of 2.8 are quotients of
  `Ω^j_{K_{n−1}}`, finite-dimensional over `K_{n−1}^p`, on which the topology induced from
  `K_{n−1}` is Hausdorff.
- **Mixed characteristic, induction on `r`** [Fesenko 2001, §4.7, proof of the Theorem]. The
  claim is that `p^r VK_m(F)` is the intersection of the open subgroups of `VK_m(F)` that contain
  it. Use the pairing
  `(α, χ)_r : K_m(F)/p^r × H^{n+1−m}(F, μ_{p^r}^{⊗(n−m)}) → H^{n+1}(F, μ_{p^r}^{⊗n})`: the norm
  residue symbol `K_m(F)/p^r → H^m(F, μ_{p^r}^{⊗m})` followed by the cup product. The symbol is
  KTheoryFiniteLocalFields §3.0a (in characteristic `0`, `p` is invertible in `F`; Bloch and
  Kato's Theorem (5.12) is this case), and the cup product is ProfiniteCohomology Layer 12. An
  element `α` of the intersection lies in `A_χ = {α : (α, χ)_r = 0}` for every `χ`. Take
  `L = F(μ_{p^r})` with `[L : F] = p^s`. By induction `α = N_{L/F} β` with `β ∈ VK_m(L)`, so `β`
  is orthogonal to `res H^{n+1−m}(F)`. Over `L`, `K_{n+1}(L)/p^r = K_{n+1}^top(L)/p^r ≅ μ_{p^r}`
  through `V(·,·)_r`, by induction on `r` with the primary elements of 2.6, and with the norm
  residue isomorphism in degree `n + 1` this identifies `(·,·)_{r,L}` with `V(·,·)_r` up to these
  identifications. So `β` is annihilated by `i_{F/L}K_{n+1−m}(F)` under `V(·,·)_r`,
  hence `β ∈ (σ − 1)K_m(L) + p^{r−s} i_{F/L}K_m(F) + p^r K_m(L)` for a generator `σ` of
  `Gal(L/F)`, and `α ∈ p^r K_m(F)`. As `K_m(F)/VK_m(F)` has no `p`-torsion (2.3),
  `α ∈ p^r VK_m(F)`.
- **The torsion.** The coefficient sequence `0 → μ_{p^s}^{⊗m} → μ_{p^{s+1}}^{⊗m} → μ_p^{⊗m} → 0`,
  compared with the symbol, gives `px ∈ Λ_m(F) ⇒ px ∈ ⋂_r p^r K_m(F)`, so
  `x = {ζ_p}·a_r + p^{r−1}b_r`; the `a_r` form a Cauchy sequence in a complete quotient of
  `K_{m−1}^top(F)`, whose limit gives `x = {ζ_p}·y` [Fesenko 2001, §4.7, proof of (ii)].

This target builds four things:

- that `A_χ` is open [Fesenko 2001, §4.7, Lemma];
- the projection formula `(N_{L/F} β, χ)_{r,F} = (β, res χ)_{r,L}`, from §3.0a's compatibility of
  the symbol with norms and corestriction and Layer 12's projection formula;
- the identification `K_{n+1}(L)/p^r ≅ μ_{p^r}` through `V(·,·)_r` for `μ_{p^r} ⊂ L`;
- the annihilator of `i_{F/L}K_{n+1−m}^top(F)` under `V(·,·)_r` on `K_m^top(L)/p^r`, which is
  `(σ − 1)K_m^top(L) + p^{r−s} i_{F/L}K_m^top(F) + p^r K_m^top(L)` [Fesenko 2001, §4.3, Lemma].

The proof in [Fesenko 2001] runs through `V(·,·)_r`, which §3.2 there defines for odd `p`; the
statement of [Fesenko 2001, §4.7, Theorem] is made for every `p`, and this target is the
statement for every `p`.

**Checks.**

- For `n = 1`, `Λ_1(F) = 1`: `Fˣ` has no nonzero infinitely divisible elements; and the
  `p^r`-torsion of `Fˣ` is `μ_{p^r}`, which is `{ζ_{p^r}}` times `K_0^top(F) = ℤ`.

*Needs:* 2.1, 2.3–2.4, 2.6–2.8; K2SymbolsBrauer §10.24; KTheoryFiniteLocalFields §3.0 (the differential symbol in
characteristic `p`) and §3.0a (the norm residue symbol and its norm compatibility);
ProfiniteCohomology Layers 10 and 12 (cup product and projection formula).

### 2.10 Norms

[Fesenko 2000a, §6.8; Fesenko 2001, §4.8]. For finite `L/F`, Kato's norm
`N_{L/F} : K_n(L) → K_n(F)` (K2SymbolsBrauer §10.24) maps `Λ_n(L) = ⋂ lK_n(L)` into
`Λ_n(F) = ⋂ lK_n(F)` (2.9) and descends to `N_{L/F} : K_n^top(L) → K_n^top(F)`. It is transitive,
and `v_F ∘ N_{L/F} = f(L/F) · v_L` (K2SymbolsBrauer §10.26 along the chain), which is the formula
`v(N_{L/F}K_n^top(L)) = |L ∩ F^pur : F| v(K_n^top(F))` of axiom (A2). The inclusion
`i_{F/L} : K_n^top(F) → K_n^top(L)` is induced by `F ⊆ L`, and `N_{L/F} ∘ i_{F/L} = [L : F]`.
`Gal(L/F)` acts on `K_n^top(L)` for Galois `L/F`, compatibly with norms.

- **Norms of units** [Fesenko 2000a, §6.8.1, Proposition]. Let `L/F` be cyclic of prime degree
  `ℓ` with `f(L/F) = 1`. Then `L = F(t_{s,L})` for some `s` and a local parameter `t_{s,L}` of
  `L` replacing `t_s`. If `ℓ = p` and `σt_{s,L}/t_{s,L} = 1 + θ_0 t_n^{r_n} ⋯ t_{s,L}^{r_s} ⋯ t_1^{r_1} + ⋯`,
  the field norm on the graded pieces `u_𝐢` of the rank-`n` unit filtration (0.3) is: below `𝐫`,
  `θ ↦ θ^p` onto `u_{(pi_1, …, i_s, …, pi_n)}`; at `𝐫`, `θ ↦ θ^p − θθ_0^{p−1}`; above `𝐫`,
  `θ ↦ −θθ_0^{p−1}`, from `u_{(j_1 + r_1, …, pj_s + r_s, …, j_n + r_n)}` to
  `u_{(j_1 + pr_1, …, j_s + r_s, …, j_n + pr_n)}`.
- **Openness** [Fesenko 2000a, §6.8.2, Corollary 2; Fesenko 2001, §4.8, (1)–(2)]. Under
  `N_{L/F}`, images of closed subgroups are closed, preimages of open subgroups are open, and
  images of open subgroups are open; so `N_{L/F}K_n^top(L)` is open. The proof reduces to prime degree and uses
  the previous bullet and 2.4.

**Checks.**

- In degree one `N_{L/F}` is the field norm.
- `v_F ∘ N_{F_d/F} = d · v_{F_d}`, so `{t_1, …, t_n}` is not a norm from `F_d` for `d ≥ 2`.

*Needs:* 0.3, 0.5, 1.3, 2.2, 2.4, 2.9; K2SymbolsBrauer §§10.24, 10.26.

### Examples

For `F = 𝔽_p((t₁))((t₂))` and `ℓ ∣ p − 1`, `K_2^top(F)/ℓ ≅ (ℤ/ℓ)^3` (2.3), and
`{1 − t_1, t_2} ∉ pK_2^top(F)`, detected by Parshin's pairing (2.5, 2.7).

### Dependencies

Layers 0–1; K2SymbolsBrauer §§5.4, 9.11, 9.16, 9.17, 10.24, 10.26; KTheoryFiniteLocalFields §§3.0,
3.0a; ProfiniteCohomology Layers 10 and 12; FunctionFieldArithmetic §3.1; FormalLaurentPuiseux
L2–L3.

## Layer 3: the class field axioms

Fesenko's axioms [Fesenko 2000c, §10.1] for the pair `F^pur/F` and `F ↦ K_n^top(F)`: (A1) is
0.6, (A2) is 2.2 with 2.10, and this layer proves (A3) and (A4).

### 3.1 Purely unramified extensions

For `L = F_d` with generator `σ = Frob_F`:

- (A3a) `|K_n^top(F) : N_{L/F}K_n^top(L)| = d`, and `N_{L/F}K_n^top(L) = {α : d ∣ v_F(α)}`;
- (A3b) in characteristic `p`, the sequence `0 → K_n^top(F) →(i_{F/L}) K_n^top(L) →(1−σ) K_n^top(L)`
  is exact [Fesenko 2000c, §10.2, Theorem 1; Fesenko 2000b, §7.5 for `p`-extensions;
  Fesenko 1991b, Theorem 3.3 for degree prime to `p`].

Every element of `VK_n^top(F)` is a norm from `VK_n^top(F_d)`, so the norm group is the
preimage of `dℤ` under `v_F`. Axiom (A3c), the exactness of
`K_n^top(L) →(1−σ) K_n^top(L) →(N_{L/F}) K_n^top(F)`, is the case `L = F_d` of 3.2(b).

**Checks.**

- (A3b) fails in mixed characteristic. For `k = ℚ_p(ζ_p)`, `ω ∈ k` a `p`-primary element and `π`
  a prime of `k` with `{ω, π}` generating `K_2(k)/p`, put `F = k{{t}}`: then
  `{ω, π} ∉ pK_2^top(F)`, but its image in `K_2^top(F(ω^{1/p}))` is `0`, while `F(ω^{1/p})/F` is
  purely unramified of degree `p` [Fesenko 2000c, §10.3.2, Example]. This is why Layer 4 takes
  another route in mixed characteristic.
- `{t_1, …, t_n}` generates `K_n^top(F)/N_{F_d/F}K_n^top(F_d) ≅ ℤ/d`.

*Needs:* 0.6, 2.2–2.3, 2.10.

### 3.2 Cyclic extensions of prime degree

[Fesenko 2000a, §6.8; Fesenko 2001, §4.8]. Let `L/F` be cyclic with generator `σ`; in (a), (c)
and the first half of (b) its degree is a prime `ℓ`.

- (a) `K_n^top(L) = {Lˣ}·i_{F/L}K_{n−1}^top(F)` [§6.8.2].
- (b) For prime degree `ℓ`,
  `K_n^top(F)/ℓ ⊕ K_n^top(L)/ℓ →(i_{F/L} ⊕ (1−σ)) K_n^top(L)/ℓ →(N_{L/F}) K_n^top(F)/ℓ` is exact
  [§6.8.3, Theorem 4; Fesenko 2001, §4.8, Theorem], by explicit calculation in the bases of
  2.3 (`ℓ ≠ p`) and 2.7 (`ℓ = p`), adjoining `ζ_ℓ` if necessary. For every cyclic `L/F`,
  (A4a) `K_n^top(L) →(1−σ) K_n^top(L) →(N_{L/F}) K_n^top(F)` is exact [§6.8.3, Corollary;
  Fesenko 2001, §4.8], from the sequence modulo `ℓ` along a tower of prime-degree steps and the
  description of the torsion of `K_n^top` (2.3 away from `p`, 2.9 at `p`).
- (c) (A4b) `|K_n^top(F) : N_{L/F}K_n^top(L)| = ℓ` [§6.8.2, Corollary 1]. If `f(L/F) = ℓ`, `L` is
  `F_ℓ` and 3.1 applies, with generator `{t_1, …, t_n}`. If `f(L/F) = 1` and `ℓ ≠ p`, a generator
  is `{θ_*, t_1, …, t̂_s, …, t_n}` with `θ_* ∈ μ_{q−1} ∖ μ_{q−1}^ℓ`. If `f(L/F) = 1` and `ℓ = p`,
  then `L = F(t_{s,L})` for a local parameter `t_{s,L}` of `L` replacing `t_s`, and
  `σt_{s,L}/t_{s,L} = 1 + θ_0 t_n^{r_n} ⋯ t_{s,L}^{r_s} ⋯ t_1^{r_1} + ⋯`. The norm on the graded
  pieces `u_𝐢` of the rank-`n` unit filtration is given by the three cases of 2.10
  [Fesenko 1991a, Proposition 4.1; Fesenko 1991b, Proposition 3.1]. The class of
  `{1 + θ_* t_n^{pr_n} ⋯ t_s^{r_s} ⋯ t_1^{pr_1}, t_1, …, t̂_s, …, t_n}`, with `θ̄_*` outside the image
  of `θ ↦ θ^p − θθ_0^{p−1}` on `K_0`, generates the quotient.

**Checks.**

- For the Artin–Schreier extension `y^p − y = t_1^{−1}` of `𝔽_p((t₁))((t₂))`, the symbol
  `{1 − t_1, t_2}` is not a norm (5.2 detects it), so it generates the quotient of order `p`.
- The filtration by powers of `t_n𝒪_F` cannot carry the computation for `ℓ = p`: by the Check
  of 0.3 it does not separate the generators `1 + θ t_n^{i_n} ⋯ t_1^{i_1}` of `V_F`.

*Needs:* 0.3, 2.3, 2.7, 2.9–2.10, 3.1.

### 3.3 Norm groups determine cyclic extensions in characteristic `p`

(A4c) In characteristic `p`, for cyclic `L/F` and `L'/F` of the same prime degree,
`N_{L/F}K_n^top(L) = N_{L'/F}K_n^top(L')` implies `L = L'` [Fesenko 2000c, §10.2, by the
Proposition of §6.8.1; Fesenko 1991b, pp. 1118–1119].

**Checks.**

- `F_ℓ` and an Artin–Schreier extension of degree `ℓ = p` have different norm groups: the first
  is `v_F^{−1}(pℤ)`, which contains `{1 − t_1, t_2}`.

*Needs:* 3.1–3.2.

### 3.4 The prime-to-`p` axioms in mixed characteristic

[Fesenko 2000c, §10.3.1]. For `F` of mixed characteristic, `VK_n^top(F) = ⋂_{(l,p)=1} lK_n^top(F)`,
and the axioms (A1)–(A4), including (A3b), hold for `K'_n(F) = K_n^top(F)/VK_n^top(F)` and the
extensions of degree prime to `p`. `K'_n(F) ≅ ℤ ⊕ (ℤ/(q − 1))^n` by 2.3, and the axioms are
computed in this basis and with the tame symbol.

**Checks.**

- `K'_n(F)/ℓ = K_n^top(F)/ℓ` for every prime `ℓ ≠ p`, and `K'_n(F)/p ≅ ℤ/p` through `v_F`: the
  quotient keeps exactly the prime-to-`p` information.

*Needs:* 2.3, 2.10, 3.1–3.2.

### Examples

For `F = 𝔽_p((t₁))((t₂))` and `L = F(y)`, `y^p − y = t_1^{−1}`: `|K_2^top(F) : N_{L/F}K_2^top(L)| = p`,
with `{1 − t_1, t_2}` outside the norm group and `{t_1, t_2}` inside it.

### Dependencies

Layers 0–2.

## Layer 4: reciprocity

### 4.1 The Neukirch–Fesenko map

[Fesenko 2000c, §10.1]. For `L/F` finite Galois and `σ ∈ Gal(L/F)`, choose
`σ̃ ∈ Gal(LF^pur/F)` with `σ̃|_L = σ` and `σ̃|_{F^pur} = Frob_F^i`, `i ≥ 1`; let `Σ` be its fixed
field, a finite extension of `F`, and put
`Υ_{L/F}(σ) = N_{Σ/F}Π_Σ mod N_{L/F}K_n^top(L)`, where `Π_Σ ∈ K_n^top(Σ)` is any element with
`v_Σ(Π_Σ) = 1`, for instance the symbol of a system of local parameters of `Σ`. It does not
depend on `Π_Σ`, since `ΣL/Σ` is purely unramified and
`VK_n^top(Σ) ⊆ N_{ΣL/Σ}VK_n^top(ΣL)` (3.1), nor on `σ̃`. It is compatible with norms: for
`F ⊆ E ⊆ L`, `N_{E/F} ∘ Υ_{L/E} = Υ_{L/F}` on `Gal(L/E)`.

**Checks.**

- `Υ_{F_d/F}(Frob_F) = {t_1, …, t_n}`: take `σ̃ = Frob_F` on `F_dF^pur = F^pur`, so `Σ = F`.
- With `σ̃ = Frob_F^{1+d}` instead, `Σ = F_{1+d}` and `N_{Σ/F}{t_1, …, t_n} = (1 + d){t_1, …, t_n}`,
  the same class modulo `N_{F_d/F}K_n^top(F_d) = v_F^{−1}(dℤ)`.

*Needs:* 0.6, 2.10, 3.1.

### 4.2 Reciprocity by the class field axioms

[Fesenko 2000c, §§10.1–10.2]. If (A1)–(A3) hold, `Υ_{L/F}` is a homomorphism; if moreover (A4)
holds, it induces an isomorphism `Υ^ab_{L/F} : Gal(L/F)^ab → K_n^top(F)/N_{L/F}K_n^top(L)` for
every finite Galois `L/F`. The proof defines, after Hazewinkel, an explicit inverse
`Ψ_{L/F} : K_n^top(F)/N_{L/F}K_n^top(L) → Gal(L/F)^ab` and shows `Ψ_{L/F} ∘ Υ^ab_{L/F} = id`. In characteristic `p` all axioms hold (Layer 3; [§10.2, Theorem 1]); in mixed
characteristic they hold for `K'_n` and extensions of degree prime to `p` (3.4).

**Checks.**

- For `L = F_d` the isomorphism sends `Frob_F` to the class of `{t_1, …, t_n}`, a generator of
  `ℤ/d` (3.1).

*Needs:* 4.1, Layer 3.

### 4.3 Artin–Schreier trees in mixed characteristic

[Fesenko 2000c, §10.4]. Let `F` be of mixed characteristic. A `p`-extension `L/F` is an
**Artin–Schreier tree** if there is a tower `F = F_0 ⊂ ⋯ ⊂ F_r = L` with each `F_i/F_{i−1}`
cyclic of degree `p` generated by a root of `X^p − X − a`, `a ∈ F_{i−1}`; it is **strong** if
every cyclic subextension `M/E` of degree `p` with `F ⊆ E ⊆ M ⊆ L` is of that form. `L/F` is
totally ramified if `L ∩ F^pur = F`. Targets:

- the properties (1)–(4) of §10.4.1: if `μ_p ⊄ F` every `p`-extension is an Artin–Schreier tree,
  and if `μ_p ⊂ F`, `F(a^{1/p})/F` is one exactly when `aF^{×p} ⊆ V_F F^{×p}`; every totally
  ramified cyclic `L/F` of degree `p` lies in a totally ramified Galois Artin–Schreier tree; for
  every totally ramified finite Galois `p`-extension `L/F` there is a totally ramified finite
  `p`-extension `Q/F` with `LQ/Q` a strong Artin–Schreier tree and `L^pur ∩ Q^pur = F^pur`; and
  for a totally ramified Artin–Schreier tree `L/F` of degree `p`,
  `v_{L^pur}(K_n^top(L^pur)^{Gal(L/F)}) = pℤ`;
- Proposition 1: for a strong Artin–Schreier tree `L/F`, the sequence
  `1 → Gal(L/F)^ab →(g) VK_n^top(L^pur)/I(L|F) →(N) VK_n^top(F^pur) → 0` is exact, where
  `g(σ) = σΠ − Π` for `v_L(Π) = 1` and `I(L|F) = ⟨σα − α : α ∈ VK_n^top(L^pur)⟩`, and
  `K_n^top(L^pur)` is the colimit over finite subextensions;
- the Corollary: the map `Ψ_{L/F} : VK_n^top(F)/N_{L/F}VK_n^top(L) → Gal(L/F)^ab`,
  `α ↦ g^{−1}((Frob_L − 1)β)` for `N_{L^pur/F^pur}β = i_{F/F^pur}α`;
- Proposition 2: `Ψ_{L/F} ∘ Υ^ab_{L/F}` is the identity for strong Artin–Schreier trees;
- Theorem 2: `Υ^ab_{L/F}` is an isomorphism for every finite Galois `p`-extension `L/F`,
  through the norm square from `LQ/Q` to `L/F` given by property (3), and induction on the
  degree for surjectivity.

**Checks.**

- If `μ_p ⊂ F` and `F` is two-dimensional with parameters `t_1, t_2`, `F(t_1^{1/p})/F` is not an
  Artin–Schreier tree, and the construction of property (2) embeds it in one.
- `Ψ_{L/F}` cannot be defined for Artin–Schreier trees that are not strong; the example of 3.1 is
  the obstruction [§10.4.2, Remark].

*Needs:* 4.1, 3.1–3.2, 2.10.

### 4.4 Reciprocity at finite level

For every finite Galois `L/F`, `Υ^ab_{L/F} : Gal(L/F)^ab → K_n^top(F)/N_{L/F}K_n^top(L)` is an
isomorphism. In characteristic `p` this is 4.2. In mixed characteristic, 4.2 for `K'_n` gives it
for `ℓ`-extensions with `ℓ ≠ p`, and 4.3 for `p`-extensions; the general case follows by
restriction to the Sylow fixed fields `L_ℓ` of `L`, through the norm compatibility of 4.1 and
`N_{L_ℓ/F} ∘ i_{F/L_ℓ} = [L_ℓ : F]`, prime to `ℓ`. Consequences:

- **norm limitation**: `N_{L/F}K_n^top(L) = N_{L'/F}K_n^top(L')` for `L'` the largest abelian
  subextension of `L/F`;
- for abelian `L/F`, `Ψ_{L/F} = (Υ^ab_{L/F})^{−1}` composed with the quotient map, compatible
  with restriction for `L ⊆ L'`;
- `L ↦ N_{L/F}K_n^top(L)` is injective and inclusion-reversing on finite abelian extensions, and
  `N_{LL'/F} = N_{L/F} ∩ N_{L'/F}`, `N_{L∩L'/F} = N_{L/F} + N_{L'/F}`;
- for finite separable `M/F`, `N_{M/F}K_n^top(M)` is open (2.10) of finite index, as it contains
  the norm group of the Galois closure;
- every subgroup of `K_n^top(F)` containing `N_{M/F}K_n^top(M)` for a finite separable `M/F` is
  `N_{L/F}K_n^top(L)` for a unique finite abelian `L/F`.

**Checks.**

- `|K_n^top(F) : N_{L/F}K_n^top(L)| = [L : F]` for abelian `L/F`; for `L = F(μ_3, t_1^{1/3})`
  with `q ≡ 2 mod 3`, `Gal(L/F) ≅ S_3` and the index is `2`, that of `F_2 = F(μ_3)`.

*Needs:* 4.1–4.3, 2.10.

### 4.5 The absolute map

`Ψ_F : K_n^top(F) → Gal(F^ab/F)` is the limit of the `Ψ_{L/F}`: for every finite abelian `L/F`,
`α ∈ N_{L/F}K_n^top(L)` exactly when `Ψ_F(α)` is trivial on `L`, and every element of
`Gal(L/F)` is such a restriction. `Ψ_F` is continuous, with dense image [Fesenko 2000c, §10.4].

**Checks.**

- `Ψ_F` is not onto: its image misses the elements of `Gal(F^pur/F) ≅ Ẑ` outside `ℤ`, by 4.6.

*Needs:* 4.4.

### 4.6 Normalization and functoriality

`Ψ_F(α)|_{F^pur} = Frob_F^{v_F(α)}`; for finite separable `L/F`, `Ψ_F ∘ N_{L/F}` is `Ψ_L`
followed by `Gal(L^ab/L) → Gal(F^ab/F)`; for `τ ∈ G_F`, `Ψ_{τL}(τα) = τΨ_L(α)τ^{−1}`. The residue
`∂ : K_n^top(F) → K_{n−1}^top(K_{n−1})` is compatible with `Ψ_F` and `Ψ_{K_{n−1}}` through the
map from `Gal(F^ab/F)` to the Galois group of the maximal abelian extension of `K_{n−1}`, read on
the extensions of `F` unramified for its discrete valuation [Fesenko 2000c, §10.5, Theorem 3].

**Checks.**

- `Ψ_F({t_1, …, t_n})|_{F^pur} = Frob_F`, and `Ψ_F({t_2, t_1})|_{F^pur} = Frob_F^{−1}` for `n = 2`.
- `Ψ_F({t_1, …, t_n})` fixes `F_d` only for `d = 1`, matching 2.10.

*Needs:* 4.5, 2.2, 2.10; K2SymbolsBrauer §9.11.

### 4.7 Dimension one

For `n = 1`, `Ψ_F({x}) = TauCeti.ClassFieldTheory.artinMap F x`. Both are homomorphisms
`r : Fˣ → G_F^ab` such that `r(π)` lifts arithmetic Frobenius for every uniformizer `π`
(`isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`) and, for every finite abelian `L`, `r(x)`
is trivial on `L` exactly when `x ∈ N_{L/F}Lˣ`. For `artinMap` this is
`exists_openSubgroup_artinMap_mem_iff` at the open normal subgroup `V` with `classField F V = L`,
whose statement gives some open `U`. The argument needs `U` to be the kernel of
`G_F^ab → Gal(L/F)^ab`, which is the `U` its proof constructs (its docstring says so); stating
that identification is part of this target. Two such maps agree:
uniformizers generate `Fˣ`, and for `L` finite abelian and `d` divisible by `[L : F]`, let `M` be
the fixed field of `r(π)` in `LF_d`. The order of `r(π)` on `LF_d` is the least common multiple
of its order on `L`, which divides `[L : F]`, and its order `d` on `F_d`, so it is `d`. Then
`M ∩ F_d = F` and `MF_d = LF_d`, `π ∈ N_{M/F}Mˣ`, so `r'(π)` is trivial on `M` and is `Frob_F` on
`F_d`, hence agrees with `r(π)` on `LF_d`.

**Checks.**

- For `F` a finite extension of `ℚ_p` or of `𝔽_p⸨X⸩`, `K_1^top(F) = Fˣ`, `v_F` is the valuation,
  and `Ψ_F` is `artinMap F`.

*Needs:* 4.5–4.6; ClassFieldTheory Layer 7 and Conventions C.6.

### Examples

On `F = 𝔽_p((t₁))((t₂))`, `Ψ_F({1 − t_1, t_2})` sends a root `y` of `y^p − y = t_1^{−1}` to
`y − 1` (5.2), and `Ψ_F({t_1, t_2})` fixes it.

### Dependencies

Layers 0–3; ClassFieldTheory.

## Layer 5: pairings, existence and injectivity

### 5.1 The tame pairing

[Fesenko 2000a, §6.4.2]. For `ℓ^r ∣ q − 1`, `a ∈ Fˣ` and `α ∈ K_n^top(F)`,
`(a, α)_{ℓ^r} = (∂^{(n)}{a, α})^{(q−1)/ℓ^r}`, where `∂^{(n)} : K_{n+1}(F) → K_1(K_0) = K_0ˣ` is
the composite of the residues, and `μ_{ℓ^r}(K_0)` is identified with `μ_{ℓ^r}(F)` through `R`.
The source gives the Hilbert symbol as this power of the tame symbol up to sign
[Vostokov 2000, §8.3, Remark]; the conventions fix the sign, as the Checks show. The pairing
`Fˣ/ℓ^r × K_n^top(F)/ℓ^r → μ_{ℓ^r}` is perfect, both sides being finite of order `ℓ^{r(n+1)}`
(2.3). Fesenko's explicit formula for the tame symbol in terms of the matrix `(v_i(α_j))` is part
of this target.

**Checks.**

- On `ℚ_p{{t}}` with `t_1 = t`, `t_2 = p` and `ℓ ∣ p − 1`: `(u, {t, p})_ℓ = u^{(p−1)/ℓ}` for
  `u ∈ μ_{p−1}`, from `Frob_F(u^{1/ℓ}) = u^{p/ℓ}`; and `(t, {t, p})_ℓ = (−1)^{(p−1)/ℓ}`, since
  `∂{t, t, p} = {t̄, t̄} = {t̄, −1}` and `∂{t̄, −1} = −1`. Reversing the residue normalization would
  invert the first value.
- In dimension one this is the tame Hilbert symbol `(u, π)_ℓ = ū^{(q−1)/ℓ}`.

*Needs:* 2.3, 4.6; K2SymbolsBrauer §§9.11, 9.16.

### 5.2 The Artin–Schreier–Witt pairing and Parshin's formula

[Parshin 1984; Fesenko 2000a, §6.4.3; Fesenko 2000b, §§7.2–7.3]. In characteristic `p`,
`[w, α)_r` for `w ∈ W_r(F)/℘W_r(F)` (`aswQuotient`, FunctionFieldArithmetic §3.1).
**Parshin's formula**: `[w, α)_r = P_r(w, α)`, the residue pairing of 2.5. In dimension one this
is the residue formula of FunctionFieldArithmetic §4.3. The pairing
`W_r(F)/℘ × K_n^top(F)/p^r → ℤ/p^r` is nondegenerate on both sides, and the annihilators of
finite subgroups of `W_r(F)/℘` are exactly the open subgroups of finite index of `K_n^top(F)`
containing `p^rK_n^top(F)`.

**Checks.**

- For `a ∈ 𝔽_q`, `[a, α)_1 = v_F(α) · Tr_{𝔽_q/𝔽_p}(a)`, both from Parshin's formula (2.5) and
  from `Frob_F(y) − y = Tr(a)` for `y^p − y = a`.
- On `𝔽_p((t₁))((t₂))`, `[t_1^{−1}, {1 − t_1, t_2})_1 = −1`, the two-dimensional reading of the
  Schmid–Witt value `[t^{−1}, 1 − t) = −1` through `∂{1 − t_1, t_2} = 1 − t_1`.
- "Open" alone does not suffice for `n ≥ 2`: on `𝔽_p((t₁))((t₂))` the annihilator of all
  `t_1^k t_2^{−1}`, `k ≥ 1`, is open and contains `pK_2^top(F)`, but has infinite index, since
  `t_1^k t_2^{−1}` takes the value `−k` on `{1 + t_2 t_1^{−k}, t_2}` and `0` on
  `{1 + t_2 t_1^{−k'}, t_2}` for `k' ≠ k`.

*Needs:* 2.4–2.5, 2.7, 4.5–4.6; FunctionFieldArithmetic §§3.1, 4.3.

### 5.3 The Hilbert pairing for `p > 2`

[Vostokov 1985; Vostokov 2000, §8.3, Theorem 2 and Remark; Fesenko 2000a, §6.4.4]. Let `F` be
of mixed characteristic, `p > 2` and `μ_{p^r} ⊂ F`. Every open subgroup of finite index of
`K_n^top(F)` containing `p^rK_n^top(F)` is the annihilator under Vostokov's map (2.6) of a
subgroup of `Fˣ/F^{×p^r}` [§8.3, Theorem 2]. The Hilbert pairing of the conventions is
`(a, α)_{p^r} = V(α, a)_r^{ε}` for a sign `ε ∈ {±1}`; the source states the agreement up to
sign [§8.3, Remark]. The target determines `ε` by evaluating both sides on
`(ω, {t_1, …, t_n})`: `V({t_1, …, t_n}, ω)_r = ζ_{p^r}` (2.6), against
`(ω, {t_1, …, t_n})_{p^r} = Ψ_F({t_1, …, t_n})(ω^{1/p^r})/ω^{1/p^r}`.

*Needs:* 2.6–2.7, 4.5–4.6.

### 5.4 Index-two subgroups in mixed characteristic at `p = 2`

Let `F` be of mixed characteristic with `p = 2`. Every open subgroup of index `2` of
`K_n^top(F)` is the annihilator of some `a ∈ Fˣ` under the Hilbert pairing `(·,·)_2`
[Fesenko 1991a].

**Checks.**

- For `n = 1` this is the nondegeneracy of the quadratic Hilbert symbol on `Fˣ/F^{×2}`.

*Needs:* 2.4, 2.7, 4.5.

### 5.5 The existence theorem

[Fesenko 2000c, §10.5]. For `n ≥ 2` and `char K_{n−1} = p`, `L ↦ N_{L/F}K_n^top(L)` is an
inclusion-reversing bijection from the finite abelian extensions of `F` in `AlgebraicClosure F`
to the open subgroups of finite index of `K_n^top(F)`. Let `N` be open of prime index `ℓ`.

- If `ℓ ∤ q(q − 1)`, then `K_n^top(F)/ℓ ≅ ℤ/ℓ` through `v_F` (2.3) and `N` is the norm group of
  `F_ℓ` (3.1).
- If `ℓ ∣ q − 1`, `N` is the annihilator of some `⟨a⟩` under the tame pairing (5.1).
- If `char F = p = ℓ`, `N` is the annihilator of some `⟨w⟩` under `[·,·)_1` (5.2).
- If `F` is of mixed characteristic, `ℓ = p` and `μ_p ⊂ F`, `N` is the annihilator of some `⟨a⟩`
  under the Hilbert pairing (5.3 for `p > 2`, 5.4 for `p = 2`). If `μ_p ⊄ F`, the preimage of `N`
  under `N_{F'/F}`, `F' = F(μ_p)`, has index `p` because `[F' : F]` is prime to `p`, and the
  result for `F'` descends through 4.4.

By Kummer theory (`TauCeti.kummerMap`) or Artin–Schreier theory (FunctionFieldArithmetic §3.1),
and 4.4, such an annihilator is `N_{L/F}K_n^top(L)` for a cyclic `L/F` of degree `ℓ`. A general
`N` of finite index lies in an open subgroup `N_1 = N_{L/F}K_n^top(L)` of prime index; the
preimage of `N` under `N_{L/F}` is open (2.10) of smaller index in `K_n^top(L)`, hence by
induction a norm group from some `M/L`, so `N` contains `N_{M/F}K_n^top(M)` and is an abelian
norm group by 4.4.

**Checks.**

- For `ℓ ≠ p`, `ℓ^rK_n^top(F)` is the norm group of the maximal abelian extension of exponent
  `ℓ^r`.
- `v_F^{−1}(dℤ)` is the norm group of `F_d`.

*Needs:* 4.4, 5.1–5.4, 2.3, 2.10; Tau Ceti `TauCeti.kummerMap`; FunctionFieldArithmetic §3.1.

### 5.6 Injectivity

[Fesenko 2000c, §10.5, Corollary 1]. For `n ≥ 2` and `char K_{n−1} = p`, `Ψ_F` is injective. By
4.5 its kernel is the intersection of the norm groups of the finite abelian extensions, which by
5.5 is the intersection of the open subgroups of finite index of `K_n^top(F)`, which is zero by
2.4. With 2.9, the kernel of `K_n(F) → Gal(F^ab/F)` is `⋂_{l ≥ 1} lK_n(F)`.

**Checks.**

- `{1 − t_1, t_2} ≠ 0` in `K_2^top(𝔽_p((t₁))((t₂)))` and `Ψ_F` moves a root of
  `y^p − y = t_1^{−1}` (5.2).

*Needs:* 2.4, 2.9, 4.5, 5.5.

### Examples

On `ℚ_p{{t}}`, `(u, {t, p})_ℓ = u^{(p−1)/ℓ}` for `u ∈ μ_{p−1}` and `ℓ ∣ p − 1` (5.1); on
`𝔽_p((t₁))((t₂))`, `[t_1^{−1}, {1 − t_1, t_2})_1 = −1` (5.2).

### Dependencies

Layers 0–4; FunctionFieldArithmetic §§3.1, 4.3; Tau Ceti `TauCeti.kummerMap`.

## Scope and ownership

This roadmap owns:

- the predicate `IsHigherLocalField`, local parameters and the rank-`n` valuation, the fields
  `K{{t}}` and `LaurentField K`, the classification, finite extensions, and the purely
  unramified extensions `F_d`;
- for fields satisfying the class field hypothesis: the higher topology on `F`, the topology on
  `Fˣ` and their sequential saturations; `K_n^top(F)`, Bloch and Kato's graded quotients of
  `K_m(F)/p` in mixed characteristic, the identification of `Λ_n(F)`, the
  degree map, generators and structure, norms and separation; the class field axioms; the
  Neukirch–Fesenko map, Artin–Schreier trees, reciprocity at finite level and the absolute map
  `Ψ_F` with its normalization, functoriality and dimension-one comparison; the tame,
  Artin–Schreier–Witt and Hilbert pairings with their explicit formulas; and, for `n ≥ 2`, the
  existence theorem and injectivity of `Ψ_F`.

It does not own:

- Milnor K-theory of a field, its residue maps, rigidity modulo integers prime to the residue
  characteristic, Kato's norm and the norm–residue square: K2SymbolsBrauer.
- The differential symbol `K_m(F)/p → Ω^m_F` in characteristic `p`, and the norm residue
  isomorphism `K_m(F)/l ≅ H^m(F, μ_l^{⊗m})` for `l` invertible in `F`: KTheoryFiniteLocalFields.
- Cup products and the projection formula in continuous cohomology: ProfiniteCohomology.
- Artin–Schreier–Witt theory of fields of characteristic `p` and the one-dimensional Schmid–Witt
  symbol: FunctionFieldArithmetic.
- Local class field theory of one-dimensional local fields: ClassFieldTheory. Its existence
  theorem and injectivity (Layer 8, `localAbelianExistence`, `injective_artinMap`) are for
  characteristic `0`, and 5.5–5.6 are stated for `n ≥ 2`. For one-dimensional fields of
  characteristic `p`, existence and injectivity are FunctionFieldArithmetic §4.2.
- Derivatives and residues of one-variable Laurent series: FormalLaurentPuiseux.
- Higher local fields with `char K_{n−1} = 0` beyond Layer 0, Kato's cohomological construction,
  nonabelian higher reciprocity and ramification theory of higher local fields. None of these is
  an input here, and none is in this roadmap.

## Exact supplier contracts

### From K2SymbolsBrauer

- §5.4: `MilnorK F`, `MilnorK.symbol`, `MilnorK.degree F n`, functoriality, degree one is `Fˣ`.
- §9.11: the residue `∂_v : K_m(F) → K_{m−1}(k)` and specialization of a discretely valued field,
  with the uniformizer-last normalization of §9.16.
- §9.17: rigidity, `K_m(F)/l ≅ K_m(k)/l ⊕ K_{m−1}(k)/l` for `F` complete and `l` prime to
  `char k`.
- §10.24: Kato's norm `N_{E/F}` for every finite `E/F`, transitive, the field norm in degree
  one; §10.26: the norm–residue square `∂_F ∘ N_{E/F} = N_{l/k} ∘ ∂_E` for `F` complete.

### From KTheoryFiniteLocalFields

- §3.0a: for `l` invertible in a field `F`, the norm residue isomorphism
  `K_m(F)/l ≅ H^m(F, μ_l^{⊗m})`, sending `{a_1, …, a_m}` to `κ(a_1) ∪ ⋯ ∪ κ(a_m)`, with its
  compatibility with restriction and with norms and corestriction along finite extensions (2.8,
  2.9).
- §3.0: for a field of characteristic `p`, `dlog : K_m(F)/p ≅ ν_F(m) ⊆ Ω^m_F`, in particular the
  injectivity of the differential symbol.

### From ProfiniteCohomology

- Layer 12: the graded cup product on continuous cohomology in all degrees, its compatibility with
  connecting maps, and (with Layer 10) the projection formula `cor(res(x) ∪ y) = x ∪ cor(y)`
  (2.8, 2.9).

### From FunctionFieldArithmetic

- §3.1: the Artin–Schreier–Witt operator `℘`, `aswQuotient p F r = W_r(F)/℘W_r(F)`, Witt
  additive Hilbert 90 and `artinSchreierWitt_galois`, the perfect pairing
  `Gal(F^ab/F)/p^r × W_r(F)/℘W_r(F) → ℤ/p^r` for every field of characteristic `p`.
- §4.2: local existence and injectivity in equal characteristic, dimension one.
- §4.3: the Schmid–Witt symbol and its residue formula, the dimension-one case of 2.5 and 5.2.

### From ClassFieldTheory and Tau Ceti

- `TauCeti.ClassFieldTheory.artinMap`, `denseRange_artinMap`, `continuous_artinMap`,
  `classField`, `exists_openSubgroup_artinMap_mem_iff`, and
  `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`; the Frobenius convention, Conventions C.6.
- `TauCeti.kummerMap`, Kummer theory over any field; `TauCeti.zHat`.

### From FormalLaurentPuiseux

- L2–L3: `LaurentSeries.derivative`, the residue `Res(f dt) = coeff_{−1} f` and its invariance
  under change of uniformizer, in every characteristic.

### From Mathlib

- `ValuativeRel` with `valuation`, `IsDiscrete`, `IsNontrivial`, `IsRankLeOne`, `𝒪[F]`, `𝓀[F]`,
  `Valued.mk'`; `IsNonarchimedeanLocalField`; `LaurentSeries` with `LaurentSeries.valued`;
  `WittVector`; `spectralNorm_unique`; `GaloisField`; `SeqContinuous`; `Field.absoluteGaloisGroup`,
  `Field.absoluteGaloisGroupAbelianization`, `AlgEquiv.restrictNormal`, `IntermediateField`,
  `IsGalois`.

## References

- A. N. Parshin, *Local class field theory*, Trudy Mat. Inst. Steklov **165** (1984), 143–170;
  Proc. Steklov Inst. Math. 1985, no. 3, 157–185 [Parshin 1984].
- K. Kato, *A generalization of local class field theory by using K-groups* I, II, III, J. Fac.
  Sci. Univ. Tokyo **26** (1979), **27** (1980), **29** (1982); part II is [Kato 1980].
- S. V. Vostokov, *Explicit construction of class field theory for a multidimensional local
  field*, Izv. Akad. Nauk SSSR Ser. Mat. **49** (1985), 283–308; Math. USSR Izv. **26** (1986),
  263–288 [Vostokov 1985].
- S. Bloch and K. Kato, *p-adic étale cohomology*, Publ. Math. IHÉS **63** (1986), 107–152
  [Bloch–Kato 1986].
- I. B. Fesenko, *Class field theory of multidimensional local fields of characteristic 0 with
  residue field of positive characteristic*, St. Petersburg Math. J. **3** (1992), 649–678
  [Fesenko 1991a].
- I. B. Fesenko, *Multidimensional local class field theory II*, St. Petersburg Math. J. **3**
  (1992), 1103–1126 [Fesenko 1991b].
- I. B. Fesenko, *Sequential topologies and quotients of Milnor K-groups of higher local
  fields*, Algebra i Analiz **13** (2001), no. 3, 198–221 [Fesenko 2001].
- I. Fesenko and M. Kurihara (eds.), *Invitation to higher local fields*, Geom. Topol. Monogr.
  **3** (2000), Part I:
  - I. Zhukov, *Higher dimensional local fields*, section 1, pp. 5–18 [Zhukov 2000];
  - I. Fesenko, *Topological Milnor K-groups of higher local fields*, section 6, pp. 61–74
    [Fesenko 2000a];
  - I. Fesenko, *Parshin's higher local class field theory in characteristic p*, section 7,
    pp. 75–79 [Fesenko 2000b];
  - S. V. Vostokov, *Explicit formulas for the Hilbert symbol*, section 8, pp. 81–89
    [Vostokov 2000];
  - I. Fesenko, *Explicit higher local class field theory*, section 10, pp. 95–101
    [Fesenko 2000c].
- J.-P. Serre, *Local Fields*, GTM 67: II §2 and XIV [Serre, *Local Fields*].
