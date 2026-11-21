# Roadmap: Wach lattices over the cyclotomic tower

**Summary.** Let `p` be an odd prime, `F/ℚ_p` a finite unramified extension of degree `n`, and `E/ℚ_p` a finite extension with valuation ring `O_E`, uniformizer `λ` and residue field `k`, containing the images of the embeddings of `F`. A crystalline `E`-representation `V` of `G_F` with a `G_F`-stable `O_E`-lattice `T` has a Wach lattice `N(T)` over `O_E⊗W(k_F)[[π]]`, on which `Γ_F` acts trivially modulo `π` and Frobenius has bounded `q`-height, `q = φ(π)/π`. This roadmap reduces Wach lattices modulo `λ` and follows, with explicit exponents, what the reduction remembers when the Hodge–Tate weights are much larger than `p`, beyond the Fontaine–Laffaille range. On the invariants of the torsion subgroup `Γ_F^{tor}` of `Γ_F ≅ ℤ_p^×` the reduction becomes a family `N̄(T) = (N̄_i)_{i∈ℤ/n}` of `k[[X]]`-lattices, one for each embedding of `F`, in an étale `(φ,γ)`-module over `k((X))`, where `X` is the reduction of the trace of `π` under `Γ_F^{tor}`.

The headline theorems are these. (1) If the Hodge–Tate weights `HT_i(V)` lie in `[−a_i, b_i]` with `a_i, b_i ≥ 0`, each `N̄_i` is free of rank `dim V` over `k[[X]]`, with `φ_i^*N̄_{i−1} ⊂ X^{−a_i}N̄_i`, `X^{b_i}N̄_i ⊂ φ_i^*N̄_{i−1}` and `(γ − 1)N̄_i ⊂ XN̄_i`, and the operator `X^{−1}(γ − 1)` on `N̄_i/XN̄_i` has characteristic polynomial `∏_{u∈HT_i(V)}(Y − ū)`. Conversely, if `T` is a stable lattice in any `E`-representation `V` and a finite free `O_E⊗A_F^+`-submodule `N` spanning `D(T)` satisfies `q^{a_i}e_iφ(N) ⊆ N`, `q^{b_i}e_iN ⊆ φ^*N` and `(g − 1)N ⊆ πN` for all `g ∈ Γ_F`, then `V` is crystalline with `HT_i(V) ⊂ [−a_i, b_i]` and `N = N(T)`. (2) Let `ρ` be crystalline of dimension `r` with weights `HT_i(ρ) = U_i` and a stable lattice `T₀`, and let `χ_c = χ_1χ_cyc^{−(c−1)}` (`1 ≤ c ≤ t`) be crystalline characters with `HT_i(χ_c) = {w_i + c − 1}`; call a finite `O_E[G_F]`-module admissible if it is isomorphic to `L₁/L₂` for stable lattices `L₂ ⊂ L₁` in a finite sum of crystalline representations with weights `U_i ⊔ {w_i, …, w_i + t − 1}` and with the characteristic polynomials of `ρ ⊕ χ_1 ⊕ ⋯ ⊕ χ_t` modulo `λ`. If the weights satisfy explicit position inequalities relative to `p` (which force `p ≥ 11` but allow weights far above `p`), the classes `z ∈ H¹(G_F, (T₀/λ)(χ̄_1^{−1}))` whose extension of `k(χ̄_1)` by `T₀/λ` is admissible form a subspace of dimension at most `d = Σ_i #{u ∈ U_i : u < w_i}`. (3) For a surjection `f : T₁ ↠ T₂` of stable lattices in crystalline representations with `HT_i(T₁) ⊂ [−M_i, h_i]`, `M_i, h_i ≥ 0`, and `H = max_i(M_i + h_i)`, every cokernel `e_iN(T₂)/f(e_iN(T₁))` is killed by `π^H` and by `p^{e_W}`, `e_W = ⌊Hp/(p − 1)² + 3 + log_p(H + 1)⌋`, and vanishes when `H ≤ p − 2`. (4) If `HT_i(V) = U_i ⊂ [0, h]` and `t ≥ 1` graded pieces of a filtration of `T/λT` by `G_F`-submodules are isomorphic to `k(χ̄_s)` for crystalline characters `χ_s` with `HT_i(χ_s) = {w_{i,s}} ⊂ [0, h]`, the lattices that `N̄(T)` induces on these pieces are `X^{c_s(i)}N̄(O_E(χ_s))_i` for unique integers `c_s(i)`, the carries, with `0 ≤ w_{i,s} + p·c_s(i − 1) − c_s(i) ≤ h` and `(p − 1)|c_s(i)| ≤ h`, and the sum of `w_{i,s} + p·c_s(i − 1) − c_s(i)` over the `t` pieces is at least the sum of the `t` smallest elements of `U_i`.

The roadmap builds on [PhiGammaModulesAndIwasawaCohomology](../../PhiGammaModulesAndIwasawaCohomology/README.md), whose Wach modules, integral étale realization, operator `ψ` and Herr complexes it uses and whose Layer 6 it continues, and on [PadicPeriodRings](../../PadicPeriodRings/README.md) for crystalline representations. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [SelmerLengthBoundsAndLocalLifting](../SelmerLengthBoundsAndLocalLifting/README.md) turns the residual bound into the identification of torsion classes cut out of crystalline lattices with the Bloch–Kato finite ones and uses the cokernel bounds for its lifting theorems with loss, and [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md) uses the Sen weights modulo `p` and the carries for weight elimination.

The roadmap has one layer, numbered 6 after the layer of PhiGammaModulesAndIwasawaCohomology it continues. Its first two targets reduce Wach lattices modulo `λ` on `Γ_F^{tor}`-invariants, with heights, exact sequences, localisation at `ζ_p − 1` and at all levels, the crystallinity criterion, and the Sen operator with the Sen weights modulo `p`. The next three are semilinear algebra over `k((X))`: lattice families with the same height conditions agree up to a power `X^σ`, a gauge lemma, the operator `ψ` modulo `p` with two polar counts, and the counting theorem for polar Herr pairs. The last three define position data and models of admissible modules and prove the residual bound, bound the cokernel of the Wach lattices of a surjection and the torsion of a truncated Herr complex, and compute the carries of rank-one subquotients.

## Conventions

The setting of 6.4 is fixed throughout: `p` is an odd prime; `F/ℚ_p` is finite unramified of degree `n` with residue field `k_F`; `E/ℚ_p` is finite with valuation ring `O_E`, uniformizer `λ` and residue field `k`, and contains the images of the embeddings of `F`; the embeddings `emb_i : F → E` are indexed by `i ∈ ℤ/n` with `emb_{i+1}∘σ = emb_i` for the arithmetic Frobenius `σ`, and `e_i` is the idempotent of `O_E⊗_{ℤ_p}W(k_F)[[π]] = ∏_{i∈ℤ/n} O_E[[π]]` of the factor of `emb_i`. For a de Rham `E`-representation `V`, `HT_i(V)` is the multiset of Hodge–Tate weights at `emb_{i−1}`, and `ℚ_p(1)` has weight `−1`. `Γ_F^{tor}` is the torsion subgroup of `Γ_F ≅ ℤ_p^×`, cyclic of order `p − 1`; `γ ∈ Γ_F` is the element with `χ(γ) = 1 + p`; `π₀ = Σ_{δ∈Γ_F^{tor}} δ(π)`, and `X ∈ k[[π]]` is its reduction. Lattice families, their height and `Γ` conditions, the operator `∇ = X^{−1}(γ − 1)` and the Sen multiplicities `sen(N_i)` are defined in 6.6, with `σ_i = ⌊Σ_{j≥0} h_{i+j+1}/p^{j+1}⌋` (indices modulo `n`).

Notation and conventions not restated here are those of [PhiGammaModulesAndIwasawaCohomology](../../PhiGammaModulesAndIwasawaCohomology/README.md): its Conventions (the coordinate `π` with `φ(π) = (1+π)^p − 1` and `γ(π) = (1+π)^{χ(γ)} − 1`, the signed Herr complex, the Hodge–Tate convention), the integral étale realization `T ↦ D(T)` over `O_E⊗A_F` (PhiGammaModulesAndIwasawaCohomology §1.0), and the Wach modules `N(V)` over `E⊗B_F^+` and lattices `N(T) = N(V) ∩ D(T)` over `O_E⊗A_F^+` (PhiGammaModulesAndIwasawaCohomology §6.0), with `q = φ(π)/π`. Crystalline and de Rham representations, `D_cris` and `D_dR` are those of PadicPeriodRings §§4.1–4.2.

## Layer 6: Wach lattices modulo a uniformizer, Sen weights and carries

This layer continues PhiGammaModulesAndIwasawaCohomology §§6.0–6.3, which construct Wach modules, their base change, good bases and `ψ`-fixed vectors. It reduces Wach lattices modulo `λ` (6.4, 6.5), develops the semilinear algebra of lattice families modulo `p` (6.6–6.8), and applies it to admissible classes (6.9), to surjections of crystalline lattices (6.10) and to rank-one subquotients (6.11).

### 6.4 Reduction of Wach lattices modulo a uniformizer

**Setting (fixed for 6.4–6.9).** Let `p` be odd, `F/ℚ_p` finite unramified of degree `n` with residue field `k_F`,
and `E/ℚ_p` finite with valuation ring `O_E`, uniformizer `λ` and residue field `k`, such that `E` contains the images of
the embeddings of `F`. Index the embeddings `emb_i : F → E` by `i ∈ ℤ/n` so that `emb_{i+1}∘σ = emb_i`, `σ` the arithmetic
Frobenius. Then `O_E⊗_{ℤ_p}W(k_F)[[π]] = ∏_{i∈ℤ/n} O_E[[π]]`, with idempotents `e_i` (`e_i` the factor of `emb_i`), and `φ`
carries the factor `i−1` to the factor `i`. **Labelling of Hodge–Tate data:** for a de Rham `E`-representation `V` of `G_F`
write `HT_i(V)` for its multiset of Hodge–Tate weights at `emb_{i−1}`, the embedding of the *source* factor of the
Frobenius map into the factor `i` (standing convention: `ℚ_p(1)` has weight `−1`). With this labelling the heights of
`φ` into the factor `i` and the Sen weights of the factor `i` below are read off the same multiset `HT_i(V)`.

Since `F` is unramified, `Γ_F ≅ ℤ_p^×`; write `Γ_F^{tor}` for its torsion subgroup, cyclic of order `p − 1` (it is not the
`Δ_K` of the Conventions, which is trivial for odd `p`), and `γ ∈ Γ_F` for the element with `χ(γ) = 1 + p`. Put
`π₀ = Σ_{δ∈Γ_F^{tor}} δ(π) ∈ ℤ_p[[π]]^{Γ_F^{tor}}` and let `X ∈ k[[π]]` be its reduction. Prove: `π₀ ≡ π^{p−1}` modulo
`(p, π^p)`; `k[[π]]^{Γ_F^{tor}} = k[[X]]`; `φ(X) ∈ X^p·k[[X]]^×`; `γ(X) ∈ X − X² + X³k[[X]]`; and `π₀ + p` vanishes, to
first order, at `π = ζ − 1` for every primitive `p`-th root of unity `ζ`.

For a finite `k[G_F]`-module `A` put `D̄_i(A) := e_iD(A)^{Γ_F^{tor}}` (PhiGammaModulesAndIwasawaCohomology §1.0), a finite-dimensional `k((X))`-space with the
`φ`-semilinear maps `φ_i : D̄_{i−1}(A) → D̄_i(A)` and the `γ`-semilinear `γ_i`; `A ↦ D̄(A) = (D̄_i(A))_i` is exact. For a
crystalline `E`-representation `V` of `G_F` with `G_F`-stable `O_E`-lattice `T`, let `N(T) ⊂ D(T)` be its Wach lattice
(PhiGammaModulesAndIwasawaCohomology §6.0), and define the **reduced invariant Wach lattice** `N̄(T) = (N̄_i)_{i∈ℤ/n}`, `N̄_i := e_i(N(T)/λN(T))^{Γ_F^{tor}}`,
inside `D̄_i(T/λT)`. Write `φ_i^*L` for the `k[[X]]`-span of `φ_i(L)`. Prove:

1. `N(T)` has an `O_E⊗W(k_F)[[π]]`-basis of `Γ_F^{tor}`-invariant vectors; `N(T)/λ → D(T/λT)` is injective; each `N̄_i` is
   free of rank `dim_E V` over `k[[X]]` and spans `D̄_i(T/λT)`.
2. (*heights*) if `HT_i(V) ⊂ [−a_i, b_i]` with `a_i, b_i ≥ 0`, then `q^{a_i}e_iφ(N(T)) ⊂ N(T)` and `q^{b_i}e_iN(T) ⊂ φ^*N(T)`,
   hence `φ_i^*N̄_{i−1} ⊂ X^{−a_i}N̄_i` and `X^{b_i}N̄_i ⊂ φ_i^*N̄_{i−1}`;
3. `(γ − 1)N̄_i ⊂ XN̄_i`;
4. (*rank one*) for a crystalline character with `HT_i = {a_i}`, `φ_i^*N̄_{i−1} = X^{a_i}N̄_i`;
5. (*saturation, sums and exact sequences*) for stable lattices `T′ ⊂ T` with `T′[1/p] = T[1/p]`, `N(T′) = N(T) ∩ D(T′)`;
   `N(T ⊕ T′) = N(T) ⊕ N(T′)`; and for an exact sequence `0 → T₀ → T₁ →^{f} T₂ → 0` of `G_F`-stable lattices in crystalline
   representations, `N(T₀) = N(T₁) ∩ D(T₀)` and `f(N(T₁))[1/p] = N(T₂)[1/p]`;
6. (*localisation at `ζ_p − 1`*) let `F_1 = F(ζ_p)`, on which `Γ_F` acts through `Gal(F_1/F)`, `t = log(1 + π)`, and `B^+_{rig,F}`
   the ring of series in `π` over `F` convergent on the open unit disc. Then `N(V) ⊗_{E⊗B_F^+} (E ⊗ B^+_{rig,F}[1/t])` has a basis of
   `Γ_F`-invariant vectors, on which `φ` has a constant matrix, and
   `N(V) ⊗_{E⊗B_F^+} (E ⊗ B^+_{rig,F}[1/t]) = (E ⊗ B^+_{rig,F}[1/t]) ⊗_{E⊗F} D_cris(V)` (Berger's comparison; `t` must be inverted, see
   the Checks). Through it define `ι_1 : N(V) → (E ⊗_{ℚ_p} F_1)((t)) ⊗_{E⊗F} D_cris(V)` as `φ^{−1}` followed by expansion at
   `π = ζ_pe^{t/p} − 1`: `ι_1(f ⊗ d) = σ^{−1}(f)(ζ_pe^{t/p} − 1) ⊗ φ^{−1}(d)` for `f ∈ E ⊗ B^+_{rig,F}[1/t]` (`σ^{−1}` on the
   coefficients of the series; `log(1 + π)` goes to `t/p`, so the values are Laurent series in `t`), extended `E`-linearly. Then
   `ι_1` is injective, `σ^{−1}`-semilinear over `F` (so it carries `e_iN(V)` into the factor of `emb_{i−1}`), and `Γ_F`-equivariant for
   the action on `F_1`, `t ↦ χ(g)t` and the trivial action on `D_cris(V)`; and the image of `e_iN(V)` generates, over
   `(E⊗F_1)[[t]]`, the `emb_{i−1}`-factor of the lattice
   `Fil⁰((E⊗F_1)((t)) ⊗_{E⊗F} D_dR(V)) = Σ_j t^{−j}(E⊗F_1)[[t]] ⊗_{E⊗F} Fil^jD_dR(V)`, whose jumps are the weights `HT_i(V)`
   (`D_dR(V) = D_cris(V)` for `F` unramified, a module over `E ⊗ F`, so `E` is not counted twice).
7. (*localisation at all levels*) for every `s ≥ 1`, with `F_s = F(ζ_{p^s})`, the map
   `ι_s : N(V) → (E ⊗_{ℚ_p} F_s)((t)) ⊗_{E⊗F} D_cris(V)`, `φ^{−s}` followed by expansion at `π = ζ_{p^s}e^{t/p^s} − 1` (the zeros of
   `φ^{s−1}(q)`) through the same comparison, is injective, `σ^{−s}`-semilinear, carries `e_iN(V)` into the factor of `emb_{i−s}`, and
   the image generates there the factor of `Σ_j t^{−j}(E⊗F_s)[[t]] ⊗_{E⊗F} Fil^jD_dR(V)` (`Fil⁰`); an element of `N(V)[1/φ^{s−1}(q)]` lies in
   `N(V)` if and only if its localisations at all the zeros of `φ^{s−1}(q)` lie in `Fil⁰`.
8. (*crystallinity from heights*) let `T` be a `G_F`-stable `O_E`-lattice in an `E`-representation `V` of `G_F`, not assumed
   crystalline, and `N ⊆ D(T)` a finite free `O_E⊗A_F^+`-submodule with `(O_E⊗A_F) ⊗ N = D(T)`, such that for every `i`
   and integers `a_i, b_i ≥ 0`: `q^{a_i}e_iφ(N) ⊆ N`, `q^{b_i}e_iN ⊆ φ^*N`, and `(g − 1)N ⊆ πN` for every `g ∈ Γ_F`. Then `V` is
   crystalline, `HT_i(V) ⊂ [−a_i, b_i]`, and `N = N(T)`.

*Route.* (1) `Γ_F` acts trivially on `N(T)/πN(T)` (PhiGammaModulesAndIwasawaCohomology §6.0), so averaging over `Γ_F^{tor}` (order prime to `p`) lifts a
basis of `N(T)/π` to invariant vectors, and Nakayama gives a basis; `N(T) = N(V) ∩ D(T)` makes it saturated in `D(T)`, so
its reduction injects; invariants of a group of order prime to `p` commute with reduction. (4) The Wach module of a
crystalline character is free of rank one on a vector `e` with `φ(e_{i−1}e) = u_iq^{a_i}e_ie`, `u_i` units: the rank-one case
of PhiGammaModulesAndIwasawaCohomology §6.0, where the filtered reduction `Fil^jN(V) = {x : φ(x) ∈ q^jN(V)}` read componentwise (for `x ∈ e_{i−1}N(V)`,
`φ(x) ∈ e_iN(V)`) puts the jump of the filtration on `e_{i−1}D_cris(V)`, the Hodge–Tate weight at `emb_{i−1}`, at the exponent
of `q` in `φ(e_{i−1}e)`. (2) Twist by crystalline characters `ψ` of prescribed labelled weights (products of the conjugates
`emb_j∘χ_LT` of a Lubin–Tate character of `F`, which exist since `E` contains the images of the embeddings), using the tensor
law of PhiGammaModulesAndIwasawaCohomology §6.0 and (4): if `HT_j(ψ) = {a_j}` for all `j`, then `V ⊗ ψ` has nonnegative weights, so `φ(N(V ⊗ ψ)) ⊂ N(V ⊗ ψ)`, and
`N(V ⊗ ψ) = N(V) ⊗ N(ψ)` gives `q^{a_i}e_iφ(N(T)) ⊂ N(T)`; if `HT_j(ψ) = {m − b_j}` with `m ≥ max_j(a_j + b_j)`, the weights of
`V ⊗ ψ` lie in `[0, m]`, and PhiGammaModulesAndIwasawaCohomology §6.0's bound `q^mN(V ⊗ ψ) ⊂ φ^*N(V ⊗ ψ)` reads `q^me_iN(T) ⊂ q^{m−b_i}e_iφ^*N(T)`, whence
`q^{b_i}e_iN(T) ⊂ φ^*N(T)` (`q` is a nonzerodivisor). Reduce modulo `λ` on invariants: `q ≡ π^{p−1} ≡ X·unit` modulo `λ`.
(3) `(γ−1)N(T) ⊂ πN(T)` and, on a `Γ_F^{tor}`-invariant basis, `πO_E[[π]] ∩ O_E[[π]]^{Γ_F^{tor}} = π₀O_E[[π]]^{Γ_F^{tor}}`:
an invariant series vanishing at `0` starts in degree divisible by `p − 1`. (5) The first two from the embedded definition
`N(T) = N(V) ∩ D(T)` and additivity of `N(V)`. For the exact sequence, twist all three by one crystalline character so
that the weights are nonnegative (as in (2)); work over `B := E⊗B_F^+`, a finite product of principal ideal domains, and use
the uniqueness of PhiGammaModulesAndIwasawaCohomology §6.0 twice. `M := N(V₁) ∩ D(V₀)` is a saturated `B`-submodule of `N(V₁)` (the quotient embeds in the
`B_F`-space `D(V₂)`), hence free, of rank `dim V₀` (at least `dim V₁ − dim V₂` by the embedding, at most `dim V₀`), so it spans
`D(V₀)`; it is `φ`-stable and `(g − 1)M ⊆ πN(V₁) ∩ D(V₀) = πM` for `g ∈ Γ_F` (`π` is invertible in `B_F`); and it inherits the
height bound:
for `m ∈ M`, `q^hm = Σ_k(1 + π)^kφ(n_k)` with `n_k ∈ N(V₁)`, and the decomposition `D(V₁) = ⊕_{0≤k<p}(1 + π)^kφ(D(V₁))` is
unique and restricts to the étale `D(V₀)`, so every `n_k ∈ D(V₀)`, i.e. `n_k ∈ M`. By uniqueness `M = N(V₀)`, and intersecting
with `D(T₀) ⊆ D(T₁)` gives `N(T₀) = N(T₁) ∩ D(T₀)`. Likewise `f(N(V₁))` is finitely generated and torsion-free over `B`, hence
free, spans `D(V₂)`, and inherits the height and `Γ` conditions (`f(φ^*N) = φ^*f(N)`), so it is `N(V₂)`. (6) Berger's comparison: after inverting `t`, `N(V)` and `D_cris(V)` generate
the same module over `B^+_{rig,F}`, and the filtration of PhiGammaModulesAndIwasawaCohomology §6.0 is recovered at the zeros of `q` through the maps
`φ^{−n}` followed by evaluation at `ζ_{p^n}e^{t/p^n} − 1`; for `n = 1` this is `ι_1`, whose image is `Fil⁰`. The map
`σ^{−1}` on coefficients carries the idempotent `e_i` to `e_{i−1}`, hence the factor; `γ` acts on `F_1` through
`Gal(F_1/F)` and on `t` by `χ(γ)`. (7) The same comparison for every `n = s` gives the first half; the second half follows
from it: `N(V)` is free over `E⊗B_F^+`, a finite product of principal ideal domains, the zeros of `φ^{s−1}(q)` are maximal
ideals of it, and an element of `N(V)[1/φ^{s−1}(q)]` lies in `N(V)` exactly when it lies in the completion of `N(V)` at each of
them, which is `Fil⁰` by the first half. (8) Twist by a crystalline character `ψ` with `HT_j(ψ) = {a_j}` (as in (2)): by
(4) `N ⊗ N(ψ)` is `φ`-stable, with `q^{a_i+b_i}e_i(N ⊗ N(ψ)) ⊆ φ^*(N ⊗ N(ψ))`, and `Γ_F` acts trivially on it modulo `π`. A
`φ`-stable finitely generated `O_E⊗A_F^+`-submodule of `D(T ⊗ ψ)` lies in `D^+(T ⊗ ψ)`: modulo `p` its coordinates in a basis
of `T ⊗ ψ` have valuations bounded below, while `φ` multiplies negative valuations by `p`, and one climbs from `p` to `p^k`
because `p·a ∈ A^+` implies `a ∈ A^+`. So `V ⊗ ψ` is of finite height, and a free `φ`- and `Γ_F`-stable lattice of finite
`q`-height in `D^+` on which `Γ_F` acts trivially modulo `π` makes it crystalline (Wach's criterion); its weights are the jumps
of the filtration of PhiGammaModulesAndIwasawaCohomology §6.0, in `[0, a_i + b_i]` at `i`. Uniqueness (PhiGammaModulesAndIwasawaCohomology §6.0) gives `N ⊗ N(ψ) = N(T ⊗ ψ)`; untwist. Sources:
Berger-Wach-2004, §§II–III (Proposition II.1.1, Theorem III.4.4 and the description of `N(V)` through its localisations);
Wach 1996 (the criterion of (8)). *Needs:* PhiGammaModulesAndIwasawaCohomology §§6.0–6.1; PhiGammaModulesAndIwasawaCohomology §1.0 (integral étale realization and its reduction); PhiGammaModulesAndIwasawaCohomology §3.4 (the
prime-to-`p` torsion adapter); PhiGammaModulesAndIwasawaCohomology §5.6a (cyclotomic localisations); PadicPeriodRings §§4.1–4.3.

**API.**

- `T ↦ N̄(T)` is functorial in `G_F`-maps of lattices, additive in direct sums and compatible with unramified twists.
- The height and `Γ` conditions of (2)–(3) pass to `N̄(T) ∩ D̄(A)` for every `G_F`-stable submodule `A ⊂ T/λT` and to the
  images in `D̄` of quotients (intersection with an étale subfamily commutes with `φ^*`).
- `ι_1` is compatible with direct sums, tensor products and Tate twists of crystalline representations, and is
  `σ^{−1}`-semilinear, not `F`-linear: composing with the `F`-linear evaluation without `φ^{−1}` changes the lattice.

**Checks.**

- `T = O_E`: `N̄_i = k[[X]]`, `φ_i^*N̄_{i−1} = N̄_i`, `γ = 1` on `N̄_i/XN̄_i`.
- `F = ℚ_p`, `T = ℤ_p(−a)`, `a ≥ 0` (weight `a`): `N̄` is free on a vector `≡ π^ae_{−a}` modulo higher powers of `π`,
  and `φ^*N̄ = X^aN̄`. Measured in `π` instead of `X` the exponent would be `(p − 1)a`: the reduction lives on the
  `Γ_F^{tor}`-invariants, where `X ≡ π^{p−1}`.
- (*the labelling*) `n = 2`, a crystalline character whose Wach module has `φ(e) = (u_0q^{k_0}, u_1q^{k_1})e` (`u_i` units,
  component `i`): by the filtration formula of PhiGammaModulesAndIwasawaCohomology §6.0 the jump of `Fil` on the component `0` of `N/π` is `k_1`, so the
  Hodge–Tate weight at `emb_0` is `k_1`, `HT_1 = {k_1}`, `HT_0 = {k_0}`, and `φ_i^*N̄_{i−1} = X^{k_i}N̄_i`. For
  `(k_0, k_1) = (5, 0)` reading the height of `φ` into the factor `i` off the weight at `emb_i` would exchange the two
  heights. With `F = ℚ_p` or parallel weights the two labellings agree, so these cases cannot tell them apart.
- `T = ℤ_p(−1)`, `F = ℚ_p`, `n = πe_{−1}` (PhiGammaModulesAndIwasawaCohomology §6.0): `π` does not vanish at `ζ_p − 1`, so `ι_1(n)` is a unit multiple of
  `e_{−1} = t^{−1}·(te_{−1})`, and `te_{−1}` spans `D_dR = Fil¹D_dR`. The image is `t^{−1}F_1[[t]] ⊗ D_dR`, which is
  `Fil⁰(F_1((t)) ⊗ D_dR)`; the unfiltered lattice `F_1[[t]] ⊗ D_dR` of PhiGammaModulesAndIwasawaCohomology §5.6a is a different one.
- (*`t` must be inverted*) In the same example, with `d := te_{−1}` spanning `D_cris(V)`, the Wach generator is `πe_{−1} = (π/t)·d`, and
  `π/t` has a pole at every `ζ_{p^n} − 1`, `n ≥ 1`: `N(V)` is not contained in `B^+_{rig,F} ⊗_F D_cris(V)`; and `N(V) ⊗ B^+_{rig,F}` has no
  `Γ_F`-invariant basis, its invariant vectors being the multiples of `d = (t/π)·πe_{−1}`, where `t/π` vanishes at those points. More
  generally the factor for a character of weight `a` is `(π/t)^a`. The comparison holds after `t` is inverted, and the expansions
  are Laurent series.
- (*the localisation is `σ^{−1}`-semilinear*) `n = 2`, rank one, `φ(e_{i−1}e) = u_iq^{k_i}e_ie` as in the labelling Check, with
  `γ(e_ie) = g_ie_ie`. From `φγ = γφ`, `g_i = φ(g_{i−1})·(q/γ(q))^{k_i}`; at `π = ζ_p − 1`, `φ(g_{i−1}) = g_{i−1}(0) = 1` and
  `q/γ(q) = φ(π/γ(π))·γ(π)/π = χ(γ)^{−1}` (as `χ(γ) = 1 + p`), so `g_i(ζ_p − 1) = χ(γ)^{−k_i}`: the line `ι_1(e_iN)` carries the
  `γ`-eigenvalue of `t^{−k_i} ⊗ D_cris`, and lies in the factor of `emb_{i−1}`, where the Hodge–Tate weight is `k_i`. The
  `F`-linear evaluation would put `e_iN` in the factor of `emb_i`, whose `Fil⁰` is `t^{−k_{i+1}} ⊗ e_iD_cris`: for
  `(k_0, k_1) = (5, 0)` it would produce the wrong lattice.

- (*the `Γ` condition in (8)*) `F = ℚ_p`, `T = O_E`, `N = πO_E[[π]]`: `N` is free and spans `D(T)`, `φ(N) = qN ⊆ N` and
  `qN ⊆ φ^*N`, so the height conditions hold with `a = 0`, `b = 1`; but `(γ − 1)π = pπ + ⋯ ∉ π²O_E[[π]]`, and indeed
  `N ≠ N(O_E) = O_E[[π]]`. Without the `Γ` condition the last conclusion of (8) fails.
- (*(5) is not right exactness*) the second half of (5) is an equality after inverting `p` only: 6.10's Checks give a
  surjection with weights `{0, −(p − 1)}` whose Wach lattices have cokernel `O_E[[π]]/(p, π^{p−1})`.

### 6.5 The Sen operator of a Wach lattice and Sen weights modulo `p`

In the setting of 6.4, let `V` be crystalline and put `U_i := HT_i(V)`. Put `ν := π₀^{−1}(γ − 1)` and
`c(a) := (1 − (1+p)^a)/p ∈ ℤ_p` for `a ∈ ℤ` (so `c(a) ≡ −a` modulo `p`, and `c` is injective). For `s ≥ 1` let
`M_{i,s} := {s′ − u : 0 ≤ s′ < s, u ∈ U_i} ⊂ ℤ`, a finite **set** (each value counted once). Prove:

1. (*Sen clause*) `ν` maps `N(T)^{Γ_F^{tor}}` into itself; for every `s ≥ 1` the product over the distinct values
   `∏_{m∈M_{i,s}}(ν − c(m))` maps `e_iN(T)^{Γ_F^{tor}}` into `(π₀ + p)^sN(T)`; and modulo `π₀ + p` the characteristic polynomial
   of `ν` on `e_iN(T)^{Γ_F^{tor}}` is `∏_{u∈U_i}(Y − c(−u))` (with multiplicities).
2. (*Sen weights modulo `p`*) Put `∇ := X^{−1}(γ − 1)`, the reduction of `ν`. Then `∇` preserves `N̄_i`, and its
   characteristic polynomial on `N̄_i/XN̄_i` is `∏_{u∈U_i}(Y − ū)`, `ū` the residue of `u` in `𝔽_p ⊂ k`. Call the roots
   the **Sen weights** of `N̄_i` (with multiplicity).
3. (*semisimplicity at zero*) If `s ≥ 1` and every `u ∈ U_i` congruent modulo `p` to an integer of `[0, s)` is equal to
   it, then `f(Y) := ∏_{m∈M_{i,s}, m≠0}(Y + m̄) ∈ k[Y]` has `f(0) ≠ 0` and `∇f(∇)N̄_i ⊂ X^sN̄_i`: `0` is a semisimple
   eigenvalue of `∇` on `N̄_i/X^sN̄_i`.
4. (*Sen clause with poles*) for every `y ≥ 1`, with `M⁻_{i,y} := {−(u + k) : u ∈ U_i, 1 ≤ k ≤ y}` (a set), the product
   `∏_{m∈M⁻_{i,y}}(ν − c(m))` maps `e_i(π₀ + p)^{−y}N(T)^{Γ_F^{tor}}` into `e_iN(T)^{Γ_F^{tor}}`.

*Route of (1).* `π₀ + p` vanishes simply at the points `ζ − 1` (6.4), and `N(T)^{Γ_F^{tor}}/(π₀ + p)^s` is a free
`O_E`-module (of rank `s·dim V` on each factor), so it suffices to work after inverting `p`. There, by 6.4 (6), the module
is the `Γ_F^{tor}`-invariant part of `Fil⁰((E⊗F_1)((t))⊗D_dR(V))/t^s`, on which `γ` acts semisimply with eigenvalue
`χ(γ)^m = (1+p)^m` on the part `t^{s′−u} ⊗ (line of weight u)`, `0 ≤ s′ < s`, `m = s′ − u ∈ M_{i,s}`. The operator `ν`
is not `γ`-equivariant, but it is triangular for the filtration by the sums of the eigenspaces with exponent `≥ m`:
multiplication by `π₀ = −p + (π₀ + p)` acts on its graded pieces as `−p` (the factor `π₀ + p`, a unit times `t`, raises
`m`), and `(γ − 1)` acts on the eigenline of `m` by `(1+p)^m − 1 = −p·c(m)`, so `ν` acts on the
graded piece of `m` by the scalar `c(m)`. An operator preserving a filtration and acting by pairwise distinct scalars on
the graded pieces is killed by the product of the corresponding factors, one per distinct value; `c` is injective. The
case `s = 1` gives the characteristic polynomial. *Route of (2).* Reduce (1) for `s = 1` modulo `λ`: `π₀ + p ≡ X` and
`c(−u) ≡ u`. *Route of (3).* Reduce (1) modulo `λ`: `(π₀ + p)^sN(T) ∩ N(T)^{Γ_F^{tor}} = (π₀+p)^sN(T)^{Γ_F^{tor}}` reduces
into `X^sN̄_i`, `ν − c(m)` reduces to `∇ + m̄`, and under the hypothesis `0` is the only element of `M_{i,s}` divisible by
`p` (if it occurs at all); so `∏_{m∈M_{i,s}}(∇ + m̄)` equals `∇f(∇)` or `f(∇)` and kills `N̄_i/X^sN̄_i`, while
`f(0) = ∏_{m≠0} m̄ ≠ 0`. *Route of (4).* As for (1): `(π₀ + p)^{−y}N(T)^{Γ_F^{tor}}/N(T)^{Γ_F^{tor}}` is `O_E`-free, and after
inverting `p` it is, by 6.4 (6), the `Γ_F^{tor}`-invariant part of `t^{−y}Fil⁰/Fil⁰`, on which `γ` acts semisimply with
eigenvalue `χ(γ)^m` on the part `t^{−k−u} ⊗ (line of weight u)`, `1 ≤ k ≤ y`, `m = −(u + k)`; `ν` is triangular for the same
filtration and acts on the graded piece of `m` by `c(m)`. Sources: Berger-Wach-2004, §§II–III (the localisation of
6.4 (6)). *Needs:* 6.4; PhiGammaModulesAndIwasawaCohomology §6.0
(filtered reduction); PhiGammaModulesAndIwasawaCohomology §5.6a (de Rham differential-equation realization).

**API.**

- `ν` satisfies `ν(fx) = γ(f)ν(x) + π₀^{−1}(γ(f) − f)x` for `f ∈ O_E[[π₀]]`, and is additive in direct sums of lattices
  and compatible with the unramified base change of PhiGammaModulesAndIwasawaCohomology §6.1.
- The Sen weights of `N̄_i(T ⊗ T′)` for a crystalline character `T′` with `HT_i(T′) = {a}` are those of `N̄_i(T)` shifted
  by `ā`.

**Checks.**

- `F = ℚ_p`, `T = ℤ_p(−a)`: `∇` acts on `N̄/XN̄` by `ā`. For `a = p` the Sen weight is `0` although the Hodge–Tate
  weight is not: Sen weights are residues, which is the reason for the margins in 6.9.
- For `T = O_E` (`U = {0}`) the hypothesis of (3) holds exactly for `s ≤ p`, with `f(Y) = ∏_{0<j<s}(Y + j)` (on
  `X^jN̄/X^{j+1}N̄`, `∇` acts by `−j`); for `s = p + 1` the weight `0` is congruent to `p ∈ [0, s)` and the hypothesis fails.
- (*distinct values*) For `U = {0, 0}` and `s = 1`, `M_{i,1} = {0}` and (1) says `ν` itself maps `N` into `(π₀+p)N`. The
  product over pairs `ν²` would only give that `∇` is nilpotent on `N̄/XN̄`, not that it is zero there, and (3) would not
  follow.
- For `U = {0, p}` and `s = 1` the hypothesis of (3) fails (`p ≡ 0` but `p ≠ 0`): both weights give the Sen weight `0`,
  and (3) asserts nothing.

### 6.6 Lattice families in étale `(φ,γ)`-modules over `k((X))`

Let `k` be a field of characteristic `p`, and let `φ, γ` be commuting `k`-algebra endomorphisms of `k((X))` with
`φ(X) ∈ X^pk[[X]]^×` and `γ(X) ∈ X − X² + X³k[[X]]` (as in 6.4). An **étale `(φ,γ)`-family** of rank `r` is a family
`D = (D_i)_{i∈ℤ/n}` of `r`-dimensional `k((X))`-spaces with `φ`-semilinear `φ_i : D_{i−1} → D_i` whose linearizations
are bijective and `γ`-semilinear bijections `γ_i` with `φ_iγ_{i−1} = γ_iφ_i`. A **lattice family** `N = (N_i)` consists
of `k[[X]]`-lattices `N_i ⊂ D_i`. For integers `w_i, w′_i` it satisfies the **height condition** `(w, w′)` if
`φ_i^*N_{i−1} ⊂ X^{−w_i}N_i` and `X^{w′_i}N_i ⊂ φ_i^*N_{i−1}` for all `i`, and the **`Γ` condition** if
`(γ_i − 1)N_i ⊂ XN_i`. Under the `Γ` condition `∇ := X^{−1}(γ − 1)` is a `k`-linear operator on every `X^aN_i/X^bN_i`;
`sen(N_i)(x)` is the multiplicity of `x ∈ k̄` as a generalized eigenvalue of `∇` on `N_i/XN_i`. For integers `h_i ≥ 0`
put `σ_i := ⌊Σ_{j≥0} h_{i+j+1}/p^{j+1}⌋` (indices modulo `n`). Prove:

1. (*shift*) for a lattice `N` with the `Γ` condition, `a ∈ ℤ` and `m ≥ 1`, the multiplicity of `x` as a generalized
   eigenvalue of `∇` on `X^aN/X^{a+m}N` is `Σ_{0≤j<m} sen(N)(x + a + j)`; in particular `∇` is bijective on
   `X^aN/X^{a+m}N` when `N` has no Sen weight in `{a, …, a+m−1}`;
2. (*comparison*) if `N, N′` are lattice families in the same `D`, both with the height condition `(w, h − w)`, then
   `X^{σ_i}N_i ⊂ N′_i` for every `i`;
3. (*contraction*) `σ_i + 1 ≤ p(σ_{i−1} + 1) − h_i` for every `i`.

*Route.* (1) `γ(X^a) ≡ X^a(1 − aX)` modulo `X^{a+2}`, so `∇` acts on `X^{a+j}N/X^{a+j+1}N ≅ N/XN` as `∇ − (a+j)`; sum over
the `m` graded pieces. (2) Let `m_i` be minimal with `X^{m_i}N_i ⊂ N′_i`. The height conditions give
`X^{m_i+h_i}φ_i^*N_{i−1} ⊂ φ_i^*N′_{i−1}`; since `φ^*` multiplies the elementary divisors of a pair of lattices by `p`,
`m_{i−1} ≤ ⌊(m_i + h_i)/p⌋`. With `S_i = Σ_{j≥0}h_{i+j+1}/p^{j+1}`, `pS_{i−1} = h_i + S_i`, so
`m_{i−1} − S_{i−1} ≤ (m_i − S_i)/p`; the largest `m_i − S_i` is therefore `≤ 0`, and `m_i ≤ ⌊S_i⌋ = σ_i`.
(3) `σ_{i−1} = ⌊(h_i + S_i)/p⌋`, so the integer `p(σ_{i−1}+1) − h_i` exceeds `S_i ≥ σ_i`. Sources: [FormalProof].
*Needs:* PhiGammaModulesAndIwasawaCohomology §0.1 (linearized Frobenius modules); Mathlib `PowerSeries`, `LaurentSeries`, `Module.End.maxGenEigenspace`.

**API.**

- Sums, intersections and images under morphisms of étale families of lattice families with the height condition
  `(w, h − w)` and the `Γ` condition again satisfy both.
- `sen` is additive in short exact sequences of lattice families (saturated sub-families and their images).

**Checks.**

- `n = 1`, rank one, `φ(e) = X^he`: the lattices `X^{−m}k[[X]]e`, `0 ≤ m ≤ ⌊h/(p−1)⌋`, all satisfy the height condition
  `(0, h)`, so the exponent `σ = ⌊h/(p−1)⌋` of (2) cannot be lowered; for `h ≤ p − 2` the lattice is unique (`σ = 0`), the
  Fontaine–Laffaille range.
- `N = k[[X]]` with `∇ = 0` on `N/XN`: `∇` acts on `X^aN/X^{a+1}N` by `−a`, so it is bijective there exactly when
  `p ∤ a`. Writing the shift with `+a` would get the sign of every margin in 6.9 wrong.
- `n = 2`, `h_0 = h_1 = 60`, `p = 41`: `σ_0 = σ_1 = ⌊60/40⌋ = 1`, and (3) reads `2 ≤ 41·2 − 60`.

### 6.7 Herr pairs on lattice families: the gauge lemma, the operator `ψ` modulo `p`, and two polar counts

For an étale `(φ,γ)`-family `D` the **Herr complex** is `∏_iD_i → ∏_iD_i × ∏_iD_i → ∏_iD_i` with
`d(x) = ((φ_ix_{i−1} − x_i)_i, (γ_ix_i − x_i)_i)` and `d(b, g) = ((γ_i − 1)b_i − φ_ig_{i−1} + g_i)_i`, the family form of
the signed complex of PhiGammaModulesAndIwasawaCohomology §3.1; a **Herr pair** is a 1-cocycle `(b, g)`. Let `N` be a lattice family with the height
condition `(w, h − w)` (`0 ≤ w_i ≤ h_i`) and the `Γ` condition, and `σ` as in 6.6. Clauses (1) and (2) hold for every
`(φ,γ)` as in 6.6. Clauses (3) and (4) are statements about the ring of 6.4: `k((X)) = k((π))^{Γ_F^{tor}}`, with `φ` and
`γ` induced from `k((π))` (`φ(π) = (1+π)^p − 1`, `γ(π) = (1+π)^{1+p} − 1`); call an étale family over this ring
**cyclotomic**. Prove:

1. (*gauge lemma*) Suppose `N_i` has no Sen weight in `{0, …, σ_i + 1}` for every `i`. (a) If `g_i ∈ XN_i` for all `i`,
   there is `y ∈ ∏N_i` with `g_i − (γ_i − 1)y_i ∈ X^{σ_i+3}N_i` for all `i`. (b) If `g_i ∈ X^{σ_i+3}N_i` and
   `b_i ∈ N_i` for all `i`, then `(b, g) = d(m)` with `m ∈ ∏N_i`.
2. (*polar kernel*) If `Z ⊂ X^{−w_i}N_i` is a `k`-subspace with `∇Z ⊂ N_i`, then
   `dim_k Z/(Z ∩ N_i) ≤ Σ_{0≤j<w_i} sen(N_i)(j − w_i)`, the sum over the integers `j`.
3. (*`ψ` modulo `p`*) Let `p ≥ 3` and work over the ring of 6.4.
   (a) The `k`-linear map `ψ` of `k((π)) = ⊕_{j=0}^{p−1}(1+π)^jφ(k((π)))`, `ψ(Σ_j(1+π)^jφ(a_j)) = a_0`, commutes with
   `γ` and with `Γ_F^{tor}`, so it restricts to `k((X))`; on a cyclotomic étale family, writing
   `D_i ⊗ k((π)) = ⊕_j(1+π)^jφ_i(D_{i−1} ⊗ k((π)))` defines `ψ : D_i → D_{i−1}` with `ψ(aφ_i(x)) = ψ(a)x` and `ψγ = γψ`.
   (b) `ψ(X^ak[[X]]) = k[[X]]` exactly for `2 − p ≤ a ≤ 1`; hence `ψ(X^aφ_i^*M) = M` for every lattice `M ⊂ D_{i−1}` and
   `2 − p ≤ a ≤ 1`.
   (c) For a lattice `M ⊂ D_{i−1}` with the `Γ` condition and `2 − p ≤ a ≤ 0`, `γ − 1` maps `(X^aφ_i^*M)^{ψ=0}` onto
   `(X^{a+1}φ_i^*M)^{ψ=0}`. More generally the map is bijective for every integer `a ≢ 1 (mod p)`; for `a ≡ 1 (mod p)` the modules
   `(X^aφ_i^*M)^{ψ=0}` and `(X^{a+1}φ_i^*M)^{ψ=0}` coincide, `γ − 1` is injective on them, and it is not onto when `M ≠ 0`.
4. (*polar count*) Over the ring of 6.4, let `p ≥ 3`, `N₀ = N_{i−1}`, `N = N_i`, `1 ≤ v ≤ p − 2`,
   `X^vN ⊂ φ^*N₀ ⊂ X^{−w_i}N`, `v + 2 ≤ p(σ_{i−1} + 3) − w_i`, `N₀` without Sen weights in `{0, …, σ_{i−1} + 1}`, and `0` a
   semisimple eigenvalue of `∇` on `N/X^{v+1}N`. If `Z ⊂ X^{−v}φ^*N₀` is a `k`-subspace with `(γ − 1)Z ⊂ X^{v+2}N`, then
   `dim_k Z/(Z ∩ N) + Σ_{0≤y≤v} sen(N)(y) ≤ r`.

*Route of (1).* (1a) Apply 6.6 (1) with `a = 0`, `m = σ_i + 2` to `X^{−1}g_i`. (1b) `φ` maps `X^{σ_{i−1}+3}N_{i−1}` into
`X^{p(σ_{i−1}+3)−w_i}N_i ⊂ X^{σ_i+3}N_i` by 6.6 (3), so the cocycle relation gives `∇b_i ∈ X^{σ_i+2}N_i`, hence
`b_i ∈ X^{σ_i+2}N_i` by 6.6 (1); `φ` maps `∏X^{σ_i+2}N_i` into `X` times itself, so `1 − φ` is bijective there and
`b = (φ − 1)m`; then `g − (γ − 1)m` is a `φ`-fixed vector of the same contracting lattice, hence zero. *Route of (2).*
`Z/(Z∩N_i)` lies in the kernel of `∇` on `X^{−w_i}N_i/N_i`, whose dimension is at most the multiplicity of `0` there, given
by 6.6 (1). *Route of (3).* (a) `γ((1+π)^j) = (1+π)^jφ((1+π)^j)` and `δ((1+π)^j) = (1+π)^{jδ}` for `δ ∈ Γ_F^{tor}` permute the
summands and fix the summand `j = 0`; for a family, the étale condition gives the decomposition after extending scalars to
`k((π))`, and `ψ` descends by taking `Γ_F^{tor}`-invariants (order prime to `p`). (b) `ψ(π^{pm+r}k[[π]]) = π^mk[[π]]` for
`0 ≤ r ≤ p − 1`, and `k[[π]]^{Γ_F^{tor}} = k[[X]]` with `X = π^{p−1}·unit`; the module statement follows from
`ψ(aφ(x)) = ψ(a)x`. (c) Put `M_π = k[[π]] ⊗ M`; the `Γ` condition gives `(γ − 1)M_π ⊂ π^{p−1}M_π ⊂ π²M_π` (`p ≥ 3`). On the
summand `(1+π)^jφ(·)` of `(φ^*M_π)^{ψ=0}`, `1 ≤ j ≤ p − 1`, `γ − 1` acts in the coordinate `x` by `T_j = (1+π)^jγ − 1`,
and `T_j(π^cm) ≡ j·π^{c+1}m` modulo `π^{c+2}M_π`; since `j` is a unit, `T_j : π^cM_π → π^{c+1}M_π` is bijective for every
`c` (successive approximation). So `γ − 1` maps `B_c := (π^{pc}k[[π]]·φ(M_π))^{ψ=0}` bijectively onto `B_{c+1}`. A nonzero
element `Σ_{j≥1}(1+π)^jφ(x_j)` of a `ψ`-zero part has `π`-order `pm + ρ`, where `m = min_j v_π(x_j)` and `0 ≤ ρ ≤ p − 2` is
the order at `T = 1` of `Σ_jc_jT^j` (`c_j` the leading coefficients); so a `Γ_F^{tor}`-invariant element of `π`-order `≥ pc`
lies in `B_c`, and `B_c^{Γ_F^{tor}} = (X^{⌈pc/(p−1)⌉}φ^*M)^{ψ=0}`. The values `⌈pc/(p−1)⌉`, `c ∈ ℤ`, are exactly the
integers `≢ 1 (mod p)`, and every level `(X^aφ^*M)^{ψ=0}` is one of the `B_c^{Γ_F^{tor}}`; for `a ≡ 1` the levels `a` and
`a + 1` coincide (for `a = 1`: `π^{p−1} = Σ_{j<p}(1+π)^j` in characteristic `p`, so `ψ(π^{p−1}φ(m)) = m`). This gives the
bijection for `a ≢ 1`. For `a ≡ 1`, `γ − 1` maps the common level `B_c^{Γ_F^{tor}}` bijectively onto `B_{c+1}^{Γ_F^{tor}}`, which is a
proper subspace when `M ≠ 0`: `γ − 1` commutes with `Γ_F^{tor}`, so the graded pieces `B_c^{Γ_F^{tor}}/B_{c+1}^{Γ_F^{tor}}` all have the
same dimension, and they are not all zero, because `⋂_cB_c = 0` while the `Γ_F^{tor}`-average of `(1+π)φ(m)`, `m ≠ 0` invariant, is a
nonzero invariant `ψ`-zero element (its components lie in the distinct summands `(1+π)^jφ(·)`, `j` the residues of the
`χ(δ)`, `δ ∈ Γ_F^{tor}`). Without the filtration, the bijectivity of `γ − 1` on `ψ`-zero parts is Herr's
(modulo `p`) and Cherbonnier–Colmez's (PhiGammaModulesAndIwasawaCohomology §3.5 in characteristic zero). *Route of (4).* Put
`F = X^{−v}φ^*N₀ ⊃ N ⊃ L = X^{v+1}N`. For `x ∈ F`, `ψ(Xx) ∈ ψ(X^{1−v}φ^*N₀) = N₀` by (3b) (`1 − v ≥ 3 − p`), and
`Xx − φ(ψ(Xx)) ∈ (X^{1−v}φ^*N₀)^{ψ=0} = (γ − 1)F^{ψ=0}` by (3c) with `a = −v ∈ [2 − p, −1]` (these two ranges are where
`1 ≤ v ≤ p − 2` enters); so `x = X^{−1}φ(n₀) + ∇f` with `n₀ ∈ N₀`, `f ∈ F`. Writing `n₀` in a `k[[X]]`-basis of `N₀`,
`X^{−1}φ(n₀) ∈ S + X^{−1}φ(XN₀)` with `S = X^{−1}φ(k-span of the basis)`, `dim S ≤ r`. For `n ∈ N₀`: `∇` is bijective on
`N₀/X^{σ_{i−1}+2}N₀` by 6.6 (1), because `N₀` has no Sen weight in `{0, …, σ_{i−1} + 1}`; so `n = ∇n′ + n″` with `n′ ∈ N₀`,
`n″ ∈ X^{σ_{i−1}+2}N₀`, and `X^{−1}φ(Xn) = ∇φ(n′) + X^{−1}φ(X)φ(n″)`, where `φ(n′) ∈ φ^*N₀ ⊂ F` and
`X^{−1}φ(X)φ(n″) ∈ X^{p(σ_{i−1}+3)−1}φ^*N₀ ⊂ X^{p(σ_{i−1}+3)−1−w_i}N ⊂ X^{v+1}N = L`, the last inclusion being the hypothesis
`v + 2 ≤ p(σ_{i−1} + 3) − w_i`. Hence `F ⊂ S + ∇F + L`. Since `∇` preserves `F` and `L` (the `Γ` condition), the cokernel of
`∇` on the finite-dimensional `F/L` has dimension `≤ r`, and so has its kernel. It contains the image of `Z` and the generalized
`0`-eigenspace of `∇` on `N/L` (semisimplicity makes it a kernel), of dimension `Σ_{0≤y≤v} sen(N)(y)` by 6.6 (1), and the
first meets the second trivially modulo `N`. Sources: Herr 1998, §§2–4; Cherbonnier–Colmez 1999 (`ψ` and `γ − 1` on
`ψ`-zero parts); [FormalProof]. *Needs:* 6.6; PhiGammaModulesAndIwasawaCohomology §§2.2, 2.4, 2.5, 3.1, 3.5.

**API.**

- `ψ` on cyclotomic families is functorial in morphisms of étale families and satisfies `ψ∘φ = id`.
- The `ψ`-zero parts `(X^aφ^*M)^{ψ=0}` are modules over `φ(k[[X]]) = k[[X^p]]` (`ψ(φ(f)y) = fψ(y)`; on the ring of 6.4,
  `φ(X) = X^p`), decreasing in `a` and constant on `a ≡ 1, a + 1`. They are not `k[[X]]`-modules: on the trivial module,
  `ψ(1 − X) = 0` while `ψ(X(1 − X)) = 1`.

**Checks.**

- `n = 1`, `N = k[[X]]` with `∇ = 0` modulo `X` (one Sen weight, `0`), `w = 1`: the bound of (2) is `sen(N)(−1) = 0`,
  and indeed `∇(X^{−1}) = X^{−1} + (terms in k[[X]]) ∉ N`.
- For the same `N` in the trivial family (`n = 1`, rank one) the Herr pair `(1, 0)` is not a coboundary, although `b ∈ N`
  and `g = 0`: the hypothesis of (1) fails, since `0` is a Sen weight, and (1b) fails with it.
- (*the excluded exponents*) Trivial module, `a = 1`: `y = 1 − X`, the `Γ_F^{tor}`-average of `1 + π`, is `ψ`-zero of
  `X`-order `0`, and `(γ − 1)y = X² + ⋯` lies in `(X²φ^*M)^{ψ=0} = (Xφ^*M)^{ψ=0}`. As `γ − 1` is injective on `ψ`-zero parts,
  `y` is its only preimage, and `y ∉ Xφ^*M`: `γ − 1` does not map `(Xφ^*M)^{ψ=0}` onto `(X²φ^*M)^{ψ=0}`. Likewise `a = 1 − p`
  with `X^{−p}(1 − X)`. Both are `≡ 1 (mod p)`. For `M = 0` both modules are `0` and the map is onto: the failure needs `M ≠ 0`.
- `ψ(X²k[[X]]) = Xk[[X]]` and `ψ(X^{1−p}k[[X]]) ∋ X^{−1}`: the range of (3b) is sharp at both ends.

### 6.8 The counting theorem

Work over the ring of 6.4 (`p ≥ 3`). Let `N` be a lattice family of rank `r` in a cyclotomic étale family `D` with the
height condition `(w, h − w)`, `0 ≤ w_i ≤ h_i`, and the `Γ` condition. Give each `i` a **type**, low or high, and an integer
`d_i ≥ 0`, and put `v_i := h_i − w_i`. Assume for every `i`: `N_i` has no Sen weight in `{0, …, σ_i + 1}`; if `i` is low,
`Σ_{0≤j<w_i} sen(N_i)(j − w_i) ≤ d_i`; if `i` is high, `1 ≤ v_i ≤ p − 2`, `d_i + Σ_{0≤y≤v_i} sen(N_i)(y) ≥ r`, and `0` is a
semisimple eigenvalue of `∇` on `N_i/X^{v_i+1}N_i`. Call a Herr pair `(b, g)` **polar for `N`** if for every `i`:
`g_i ∈ XN_i`; `b_i ∈ X^{−w_i}N_i` if `i` is low; and, if `i` is high, `b_i ∈ X^{−v_i}φ_i^*N_{i−1}` and
`g_i − (γ_i − 1)x_i ∈ X^{v_i+2}N_i` for some `x_i ∈ N_i`. Prove: **the polar Herr pairs span, modulo Herr coboundaries, a
`k`-space of dimension at most `d = Σ_id_i`.** Polarity is monotone in `N`: a pair polar for `N` is polar for every lattice
family containing `N` with the same hypotheses.

*Route.* Given polar pairs `z_a = (b_a, g_a)`, `a ≤ s`, apply the gauge lemma 6.7 (1a) to replace each by
`z′_a = z_a − d(y_a)` with `y_a ∈ ∏N_i` and `g′_{a,i} ∈ X^{σ_i+3}N_i`. Put `c_{a,i} = b′_{a,i}` (low `i`) and
`c_{a,i} = b′_{a,i} + x_{a,i} − y_{a,i}` (high `i`); then `c_{a,i} − b′_{a,i} ∈ N_i`, and `(γ − 1)c_{a,i}` lies in
`XN_i` (low) or in `X^{v_i+2}N_i` (high), using 6.6 (3) for `p(σ_{i−1}+3) − w_i ≥ v_i + 2`. By 6.7 (2) with the low Sen
count, resp. 6.7 (4) with the high one (`1 ≤ v_i ≤ p − 2`), the classes of `(c_{a,i})_a` modulo `N_i` span a space of
dimension `≤ d_i`. If `Σ_at_ac_{a,i} ∈ N_i` for every `i`, then `Σ_at_az′_a` has `b ∈ ∏N_i` and `g ∈ ∏X^{σ_i+3}N_i`, so it is
a coboundary by 6.7 (1b), and `t = 0`. Hence `a ↦ (c_{a,i} mod N_i)_i` is injective on `k^s` and `s ≤ d`. Sources:
[FormalProof]. *Needs:* 6.6–6.7.

**API.**

- Polar pairs form a `k`-subspace of Herr cocycles containing the coboundaries `d(m)`, `m ∈ ∏N_i`.

**Checks.**

- If every `i` is low and `d = 0`, the theorem says every polar Herr pair is a coboundary.
- Rank zero: `d = 0` and there is nothing to count.
- (*`v_i ≥ 1` in the high type*) For `v_i = 0` the element `φ(y)` of the route of 6.7 (4) need not lie in `Xφ^*N₀`, and the
  bound is not asserted.

### 6.9 Position data, models, and the residual bound for admissible classes

**Position data.** In the setting of 6.4, position data of rank `r` and block length `t ≥ 1` consist, for every
`i ∈ ℤ/n`, of integers `h_i ≥ 2`, `η_i ≥ 1`, `w_i`, a type (low or high) and a multiset `U_i` of `r` integers. The
**block** is `B_i = {w_i, …, w_i + t − 1}`, the **window** is `[1, η_i]` (low) or `[h_i − η_i, h_i − 1]` (high),
`σ_i = ⌊Σ_{j≥0}h_{i+j+1}/p^{j+1}⌋`, and `d_i = #{u ∈ U_i : u < w_i}`, `d = Σ_id_i`. The data are **in position** if

- (P1) `U_i ⊂ [1, h_i − 1]`, `1 ≤ w_i` and `w_i + t − 1 ≤ h_i − 1`;
- (P2) the block lies in the window: `w_i + t − 1 ≤ η_i` (low), `h_i − η_i ≤ w_i` (high);
- (P3) `η_i + 4σ_i + 6 < p`;
- (P4) `|u − β| > σ_i + 2` for every `u ∈ U_i` in the window and every `β ∈ B_i`;
- (P5) for every `u ∈ U_i` outside the window and every integer `y` with `−2σ_i − 2 ≤ y ≤ η_i + 2σ_i + 3`: `u ≢ y`
  (low), resp. `h_i − u ≢ y` (high), modulo `p`.

Since `η_i ≥ 1`, (P3) forces `p ≥ 11`: position data exist only for `p ≥ 11`. The position hypothesis enters through
its arithmetic consequences: no `u ∈ U_i` is congruent modulo `p` to an integer in `[w_i − σ_i − 2, w_i + t + 1 + σ_i]`;
in the low type no `u ∈ U_i` is congruent to an integer in `[−σ_i, 0]` and no weight outside the window to one in
`[0, η_i]`; in the high type no `u ∈ U_i` is congruent to an integer in `[h_i, h_i + σ_i + 1]`, no weight outside the
window to one in `[h_i − η_i, h_i]`, and `t ≤ h_i − w_i ≤ η_i`; and `t + 2σ_i + 1 < p`, `η_i + σ_i + 2 < p`.

**Full representations and admissible modules.** Let `ρ` be a crystalline `E`-representation of `G_F` of dimension `r`
with `HT_i(ρ) = U_i`, and `χ_1, …, χ_t` crystalline characters with `χ_c = χ_1χ_cyc^{−(c−1)}`, `HT_i(χ_c) = {w_i + c − 1}`. A
crystalline representation `W` is **full** if `HT_i(W) = U_i ⊔ B_i` for every `i` and
`det(Y − W(g)) ≡ det(Y − ρ(g))·∏_c(Y − χ_c(g))` modulo `λ` for every `g ∈ G_F`; a finite `O_E[G_F]`-module is
**admissible** if it is isomorphic to `L₁/L₂` for `G_F`-stable `O_E`-lattices `L₂ ⊂ L₁` in a finite direct sum of full
representations. Admissible modules are closed under submodules, quotients and finite sums.

**Models.** Let `A` be admissible and killed by `λ`. An **admissible presentation** of `A` is a `G_F`-stable lattice `L` in a
finite sum of full representations, a `G_F`-submodule `A₁ ⊂ L/λL` and a `G_F`-surjection `A₁ ↠ A`. The **model** of
`A ⊗ χ̄_1^{−1}` attached to it is the lattice family in `D̄(A ⊗ χ̄_1^{−1})` obtained by intersecting `N̄(L ⊗ χ_1^{−1})` with
`D̄(A₁ ⊗ χ̄_1^{−1})` and taking the image (6.4, `D̄` exact). For a stable lattice `T₀ ⊂ ρ` put `T̄ = (T₀/λ)(χ̄_1^{−1})` and
`N^{std} := N̄(T₀(χ_1^{−1}))`, the **standard lattice** of `T̄`. Prove:

1. (*models*) (a) Every admissible `A` killed by `λ` has a model; every model satisfies the height condition `(w, h − w)`
   and the `Γ` condition, and its Sen weights lie among the residues of the elements of `(U_i ⊔ B_i) − w_i`; if the data are
   in position, then at every `i` of high type `0` is a semisimple eigenvalue of `∇` modulo `X^{h_i−w_i+1}`.
   (b) If the data are in position, the Sen weights of every model of a subquotient of `T̄` are residues of `U_i − w_i`.
   (c) If the data are in position, then for `1 ≤ c ≤ t` the only model of `k(χ̄_c) ⊗ χ̄_1^{−1} = k(χ̄_cyc^{1−c})` is the
   standard lattice `N̄(O_E(χ_cχ_1^{−1}))`, and the semisimplification of `T̄` has no constituent `k(χ̄_cyc^{−e})`,
   `−1 ≤ e < t`.
2. (*the largest model*) the models of `T̄` have a largest element `N^max`, which contains `N^{std}`; if the data are in
   position, `N^max_i` has no Sen weight in `{0, …, σ_i + 1}`, `Σ_{0≤j<w_i} sen(N^max_i)(j − w_i) = d_i` when `i` is low,
   and `d_i + Σ_{0≤y≤h_i−w_i} sen(N^max_i)(y) = r` when `i` is high;
3. (*residual bound*) if the data are in position, the classes `z ∈ H¹(G_F, T̄)` for which the extension of `k(χ̄_1)` by
   `T₀/λ` defined by `z` is admissible form a subspace of dimension at most `d`;
4. (*classes of the block characters*) if the data are in position, then for `1 ≤ e < t` every class
   `z ∈ H¹(G_F, k(χ̄_cyc^{−e}))` for which the extension of `k(χ̄_1)` by `k(χ̄_{e+1})` defined by `z` is admissible is zero,
   and for `e = 0` these classes are exactly the unramified ones.

*Route of (1a).* Reduce 6.4 for `L ⊗ χ_1^{−1}`, whose weights lie in `[1 − w_i, h_i − 1 − w_i]`, and use exactness of `D̄`
and the API of 6.4 (heights and `Γ` condition pass to intersections and images); the Sen weights by 6.5 (2); semisimplicity
by 6.5 (3) with `s = h_i − w_i + 1`, whose hypothesis holds in the high type for data in position (by (P3) for the weights
in the window and the block, by (P5) for the others). *Route of (1b).* A
model of a subquotient of `T̄` and the lattice induced on the same subquotient by `N^{std}` satisfy the same height
conditions, so by 6.6 (2) each lies between `X^{±σ_i}` times the other; by 6.6 (1) every Sen weight of the model is a Sen
weight of the induced lattice shifted by some `c ∈ [−σ_i, σ_i]`, hence congruent to `u − w_i + c`, `u ∈ U_i`. By (1a) it is
also a residue of `(U_i ⊔ B_i) − w_i`; a block residue `e′ ∈ [0, t − 1]` would give `u ≡ w_i + e′ − c`, which the position
hypothesis excludes. *Route of (1c)* (a count over the whole lattice, not over one line). Let `L` be a lattice in a sum of
`μ` full representations and take a composition series of `(L/λL)(χ̄_1^{−1})` refining a given admissible presentation,
with the lattices induced by `N̄(L ⊗ χ_1^{−1})` on its graded pieces (saturated intersections, then images). (i) The Sen
multisets of the pieces at `i` add up to `μ` times the residues of `(U_i ⊔ B_i) − w_i` (6.5 (2) with multiplicities).
(ii) Each piece satisfies the height and `Γ` conditions. (iii) A piece isomorphic to `k(χ̄_cyc^{−e})`, `−1 ≤ e < t`, carries
`X^{−m_i}N̄(O_E(χ_cyc^{−e}))_i` with `|m_i| ≤ σ_i` (6.6 (2)), so its Sen weight `e + m_i ∈ [−1 − σ_i, t − 1 + σ_i]` is a residue
of `(U_i ⊔ B_i) − w_i`, hence (position hypothesis, and `t + 2σ_i + 1 < p`) an element of `{0, …, t − 1}`. (iv) Each of
these residues occurs exactly `μ` times in (i), and there are at least `μ` pieces isomorphic to each `k(χ̄_cyc^{−e})`,
`0 ≤ e < t` (residual characteristic polynomials of full representations); so there are exactly `μ`, no piece is
`k(χ̄_cyc)`, `T̄^{ss}` contains no `k(χ̄_cyc^{−e})` for `−1 ≤ e < t`, and `Σ_G m_{G,i} = 0` over the character pieces `G`,
for each `i`. (v) The height condition on a character piece reads `p·m_{G,i−1} ∈ [s_i + w_i − h_i, s_i + w_i]` with
`s_i = e + m_{G,i} ∈ [0, t − 1]`; if `i` is low, `s_i + w_i ≤ η_i < p` gives `m_{G,i−1} ≤ 0`; if `i` is high,
`s_i + w_i − h_i ≥ −η_i > −p` gives `m_{G,i−1} ≥ 0`. For fixed `i` all `m_{G,i−1}` have one sign and sum to zero, so they
vanish: every character piece carries the standard lattice, in particular every model of `k(χ̄_c) ⊗ χ̄_1^{−1}`.

*Route of (2).* The sum of two models is a model (through the sum of the presentations), and all models lie in
`X^{−σ_i}N^{std}_i` (6.6 (2)), a Noetherian module, so a largest model exists. For the count put `Q = N^max/N^{std}`: for
every integer `y`, `sen(N^max)(y) + mult_Q(y + 1) = sen(N^{std})(y) + mult_Q(y)` (6.6 (1)), and `mult_Q(y) ≠ 0` only if
`y − j` is a Sen weight of `N^{std}` for some `1 ≤ j ≤ σ_i`. No Sen weight in `{0, …, σ_i + 1}`: by (1b) and the position
hypothesis. Low type: sum the identity over `y ∈ [−w_i, −1]`; the boundary terms `mult_Q(0)` and `mult_Q(−w_i)` vanish by
the position hypothesis, and `Σ_{−w_i≤y≤−1} sen(N^{std})(y) = d_i`. High type (`v_i = h_i − w_i`): sum over
`y ∈ [0, v_i + σ_i + 1]`. The boundary term `mult_Q(0)` vanishes as in the low type, and `mult_Q(v_i + σ_i + 2)` vanishes
because no `u ∈ U_i` is congruent to an integer of `[h_i + 2, h_i + σ_i + 1]`; the tail `sen(N^max)(y)`,
`v_i < y ≤ v_i + σ_i + 1`, vanishes by (1b), since no `u ∈ U_i` is congruent to an integer of `[h_i + 1, h_i + σ_i + 1]`;
and `Σ_{0≤y≤v_i+σ_i+1} sen(N^{std})(y) = #{u ∈ U_i : u ≥ w_i} = r − d_i`. (Summing only over `[0, v_i]` would leave the
term `−mult_Q(v_i + 1)`, which the excluded interval `[h_i, h_i + σ_i + 1]` alone does not kill.)

*Route of (3).* An admissible class gives a model `N_z` of its extension, through a presentation by a lattice in a sum of
full representations; the image of `N_z` in the model of `k(χ̄_1) ⊗ χ̄_1^{−1} = k` is the standard lattice by (1c) with
`c = 1`; a lift `ε_i` of its generator gives the Herr pair `b_i = φ_iε_{i−1} − ε_i`, `g_i = (γ_i − 1)ε_i`, polar for
`N_z ∩ D̄(T̄)` (in the high type replace `ε` by `f(0)^{−1}f(∇)ε` with `f` from 6.5 (3)); it represents `z` in Herr's `H¹`
(PhiGammaModulesAndIwasawaCohomology §3.6), and a coboundary there is a coboundary in Galois cohomology. All models lie in `N^max` and polarity is monotone,
so 6.8 applied to `N^max` with (2) bounds the dimension by `d`.

*Route of (4).* Let `1 ≤ e < t` and `N := N̄(O_E(χ_cyc^{−e}))` with generator `f_i`, `φ_if_{i−1} = X^e·unit·f_i`,
`∇f ≡ e·f`. An admissible extension gives, as in (3) with (1c), a Herr pair `(b, g)` relative to `N` with `g_i ∈ XN_i` and
`b_i` of pole order at most `J_i`, `J_i = w_i` (low) or `h_i − w_i − e` (high, from `b_i ∈ X^{−v_i}φ_i^*N_{i−1}` and
`φ_i^*N_{i−1} = X^eN_i`). Since `g_i ∈ XN_i` and `φ(XN_{i−1}) ⊂ X^{p+e}N_i`, the cocycle relation gives `(γ_i − 1)b_i ∈ XN_i`,
that is `∇b_i ∈ N_i`. As `∇(X^{−j}f) = (e + j)X^{−j}f + ⋯`, a top pole order `j₀ ≥ 1` would satisfy `e + j₀ ≡ 0 (mod p)`,
impossible because `1 ≤ e + j₀ ≤ η_i < p`: `e + j₀ ≤ t − 1 + w_i ≤ η_i` in the low type and `e + j₀ ≤ h_i − w_i ≤ η_i` in the
high type, both by (P2), and `η_i < p` by (P3). So `b ∈ ∏N_i` and `g ∈ ∏XN_i`. Because `e ≥ 1`,
`φ` maps `∏N_i` into `X·∏N_i`, so `1 − φ` is bijective there, `b = (φ − 1)m`, and `g − (γ − 1)m` is `φ`-fixed in
`X·∏N_i`, hence zero: the pair is a coboundary. For `e = 0` the same reduction leaves `b ∈ ∏_ik` modulo
`((m_{i−1} − m_i)_i)` and `g = 0`: one dimension, the unramified line; conversely the unramified classes are admissible,
by the lattice `{(a, b) : a ≡ b (mod λ)}` in `χ_1 ⊕ χ_1μ` (`μ` unramified, `μ ≡ 1 (mod λ)`) inside the sum of the two full
representations `ρ ⊕ χ_1 ⊕ ⋯ ⊕ χ_t` and `ρ ⊕ χ_1μ ⊕ χ_2 ⊕ ⋯ ⊕ χ_t`.

Sources: [FormalProof]; Herr 1998 (the comparison of PhiGammaModulesAndIwasawaCohomology §3.6). *Needs:* 6.4–6.8; PhiGammaModulesAndIwasawaCohomology §§3.4, 3.6 (integral Herr comparison for
finite `p`-primary modules); PadicPeriodRings §§4.1–4.3 (crystalline representations).

**API.**

- Being in position is invariant under the cyclic shift of the index `i` and under a common unramified twist.
- Full representations are closed under unramified twists `≡ 1 (mod λ)` of a summand; admissibility is preserved by
  enlarging `E` and is detected after an injection of finite modules.

**Checks.**

- If every `h_i ≤ p − 2`, then `σ_i = 0`: this is the Fontaine–Laffaille range, where the residual bound is classical.
  For `F = ℚ_p`, `r = t = 1`, weights `u ≠ w` with `|u − w| > 2`: the Fontaine–Laffaille extensions of `χ_1` by `ρ` form a
  space of dimension `1` if `u < w` and `0` if `u > w`, which is `d`; (3) is sharp there.
- `n = 2`, `h_0 = h_1 = 60`, `p = 41`: `σ_0 = σ_1 = 1` and (P3) allows windows with `η_i ≤ 30`, although `h_i` exceeds
  `p − 2 = 39`.
- (*a failure outside the hypothesis*) `F = ℚ_p`, `p ≥ 13`, `r = t = 1`, `w = η = 1`, low type, `U = {w + p − 1} = {p}`,
  `h = p + 1` (so `σ = 1`): (P1)–(P4) hold and (P5) fails (`u ≡ 0 = w − 1`). Then `T̄` is trivial, the
  lattices `{(a, b) : a ≡ b (mod p)}` in `χ_1 ⊕ χ_1χ_cyc^{−(p−1)}μ` (`μ` unramified, `μ ≡ 1 mod p`) make every class of
  `H¹(G_{ℚ_p}, 𝔽_p)` admissible (dimension `2`), while `d = 0` and `H⁰(G_{ℚ_p}, T̄) ≠ 0`: the conclusions of (1c) and (3)
  fail.
- (*one lattice does not see uniqueness*) `n = 1`, `p = 41`, `h = 100`, `η = 26`, high type, `w = 80`, `t = 2`, `U = {66}`
  (in position, `σ = 2`): the family
  `X^{−1}k[[X]]` in `D̄(k)` satisfies the height condition `(80, 20)` (`φ^*X^{−1}k[[X]] = X^{−40}·X^{−1}k[[X]]`), the `Γ`
  condition, has Sen weight `1 = (w + 1) − w`, a block residue, and `0` is a simple eigenvalue modulo `X^{21}`: it has
  every property of (1a) and is not the standard lattice. (1c) needs the count over all character pieces.
- (*the high-type telescoping*) Rank one, `n = 1`, `p = 41`, `h = 100`, `η = 20`, high type, `t = 1`, `w = 85`, `U = {99}`
  (in position, `σ = 2`): `X^{−2}N^{std}` has
  `φ`-exponent `14 − 80 = −66 ∈ [−85, 15]` and Sen weight `16 = v + 1`; it satisfies the height condition and is excluded
  only because it is not a model, which is why the sum in (2) runs to `v + σ + 1`.

### 6.10 Annihilators of the cokernel of Wach lattices, and the truncated Herr complex

In the setting of 6.4, let `f : T₁ ↠ T₂` be a surjection of `G_F`-stable `O_E`-lattices in crystalline `E`-representations,
with `HT_i(T₁) ⊂ [−M_i, h_i]`, `M_i, h_i ≥ 0` (standing convention: `ℚ_p(1)` has weight `−1`); put `H := max_i(M_i + h_i)`,
`M := max_i M_i`, `c_H := 1 + ⌈log_p(H + 1)⌉`, `C_i := e_iN(T₂)/f(e_iN(T₁))`, and let `s_i` be the least `s` with `π^sC_i = 0`.
For integers `0 ≤ j ≤ s` put

`cost(j, s) := Σ_{j<k≤s, (p−1)|k}(1 + v_p(k))`,

so that `cost(j, s) = 0` when `s < p − 1`, and `cost(0, s) ≤ s·p/(p − 1)²`. Fix `γ₀ ∈ Γ_F` with `χ(γ₀)` a topological
generator of `ℤ_p^×` (`p` is odd); `γ` is as in 6.4 (a topological generator of the pro-`p` part of `Γ_F`). Prove:

1. (*cokernel*) `f(N(T₁))[1/p] = N(T₂)[1/p]` (6.4 (5)), so every `C_i` has finite length, and `π^HC_i = 0`, so `s_i ≤ H`.
   More generally, if `N′ ⊆ N` are families of `O_E[[π]]`-submodules `e_iN′ ⊆ e_iN` of one étale `φ`-module over `O_E⊗A_F` (`N′`
   not necessarily free) with `q^{M_i}φ(e_{i−1}N) ⊆ e_iN`, `q^{h_i}e_iN′ ⊆ O_E[[π]]·φ(e_{i−1}N′)` for all `i`, and `N/N′` killed by a
   power of `π`, then `π^HN ⊆ N′`;
2. (*`γ`-descent*) let `R` be a `ℤ_p`-algebra with a `ℤ_p`-linear automorphism `γ′` and an element `X` with
   `γ′(X) = X(u + Xt)`, `u ∈ ℤ_p^×`, `t ∈ R`, and let `N′ ⊆ N` be `R`-submodules of a module on which `X` is injective, with a
   `γ′`-semilinear action preserving both and `(γ′ − 1)N ⊆ XN`, `(γ′ − 1)N′ ⊆ XN′`. If `c ∈ ℤ_p` and `cX^{j+1}N ⊆ N′`, then
   `c(u^{j+1} − 1)X^jN ⊆ N′`; hence `X^sN ⊆ N′` implies `∏_{j<k≤s}(u^k − 1)·X^jN ⊆ N′`. Consequently (with `γ′ = γ₀`,
   `X = π`, `u = χ(γ₀)`) `p^{cost(j,s_i)}π^jC_i = 0` for `0 ≤ j ≤ s_i`; in particular `C_i = 0` when `H ≤ p − 2`. As round
   bounds: `p^aπ^jC_i = 0` whenever `a ≥ (s_i − j)p/(p − 1)² + c_H`, and `p^{e_W}C_i = 0` with
   `e_W := ⌊Hp/(p − 1)² + 3 + log_p(H + 1)⌋ ≥ cost(0, H) + 3`;
3. (*Frobenius recursion*) `s_{i−1} ≤ M_i + h_i + c_H + 2 + ⌈s_i/(p − 1)⌉`. Hence, if the indices `i + 1, …, i + j` have
   `M_k + h_k ≤ 2G`, then `s_i ≤ (2G + c_H + 3)(p − 1)/(p − 2) + H/(p − 1)^j`, and the least `r_i` with `p^{r_i}C_i^{Γ_F^{tor}} = 0`
   satisfies `r_i ≤ cost(0, s_i)`, hence `r_i ≤ 10(G/p + H/(p − 1)^{j+1} + 1 + log_p(H + 1))`;
4. (*the truncated Herr complex*) for a lattice `T` as above with all its weights in `[−M, h]`, put `N := N(T)^{Γ_F^{tor}}`
   over `O_E[[π₀]]`, `Q := π₀ + p`, and consider
   `N →^{d⁰} Q^{−M}N ⊕ π₀N →^{d¹} π₀Q^{−M}N`, `d⁰x = ((φ − 1)x, (γ − 1)x)`, `d¹(y, z) = (γ − 1)y − (φ − 1)z`.
   If `ω ∈ π₀Q^{−M}N` and `p^kω ∈ im d¹` for some `k`, then `p^{e°_U}ω ∈ im d¹`, where
   `e°_U := Σ_{j∈J}v_p(j) + a + v_p(a!)`, `a := ⌊M/(p − 1)⌋` and
   `J := ({w + k : w a Hodge–Tate weight of T, 1 ≤ k ≤ M} ∖ {0}) ∪ {1, …, M}`. In particular `e°_U = 0` when `M + h ≤ p − 2`
   (then `a = 0` and `0 < |j| < p` for `j ∈ J`). As a round bound, the same holds with
   `e_U := Σ_{j∈J}v_p(j) + a_A + v_p(a_A!) ≥ e°_U`, `a_A := a + 1`.

The interval `[−M_i, h_i]` contains `0`; the statements are not invariant under twist.

*Route.* (1) The first claim is 6.4 (5). `C_i` is finitely generated and killed by a power of `p`; `(O_E⊗A_F) ⊗ f(N(T₁))`
maps onto `(O_E⊗A_F) ⊗ N(T₂) = D(T₂)` because `D` is exact and `N(T)` spans `D(T)` (PhiGammaModulesAndIwasawaCohomology §6.0), so `C_i[1/π] = C_i ⊗ A_F = 0` (for
a module killed by `p^m`, `⊗A_F` is `[1/π]`): `C_i` is killed by a power of `π`, and the general form applies to
`N = N(T₂)`, `N′ = f(N(T₁))`, which need not be free (the pole bound for `T₂` and the height bound for `T₁` come from 6.4 (2), the
weights of `T₂` being among those of `T₁`). General form: let `I_i := {g ∈ O_E[[π]] : g·e_iN ⊆ e_iN′}`, which contains a power of `π`.
(i) *Key inclusion:* `q^{M_i+h_i}I_i ⊆ φ(I_{i−1})O_E[[π]]`. For `g ∈ I_i` write `q^{M_i+h_i}g = Σ_{0≤k<p}(1 + π)^kφ(z_k)`
(`O_E[[π]]` is free over `φ(O_E[[π]])` on the `(1 + π)^k`). For `y ∈ e_{i−1}N`, `q^{M_i}φ(y) ∈ e_iN`, so
`g·q^{M_i}φ(y) ∈ e_iN′` and `q^{M_i+h_i}g·φ(y) = Σ_k(1 + π)^kφ(z_ky)` lies in
`q^{h_i}e_iN′ ⊆ O_E[[π]]·φ(e_{i−1}N′) = ⊕_k(1 + π)^kφ(e_{i−1}N′)` (`φ(O_E[[π]])·φ(e_{i−1}N′) = φ(e_{i−1}N′)` for any submodule); the
decomposition of the étale module is unique, so `z_ky ∈ e_{i−1}N′`
for every `y`, that is `z_k ∈ I_{i−1}`. (ii) *Ring lemma:* put `𝔟_i := (I_i : π^H)`. For `x = Σ_k(1 + π)^kφ(x_k) ∈ 𝔟_i`,
`q^Hπ^Hx = φ(π^H)x = Σ_k(1 + π)^kφ(π^Hx_k)` lies in `φ(I_{i−1})O_E[[π]] = ⊕_k(1 + π)^kφ(I_{i−1})` by (i) (`H ≥ M_i + h_i`), so
`x_k ∈ 𝔟_{i−1}`: `𝔟_i ⊆ φ(𝔟_{i−1})O_E[[π]]`. Modulo `λ` the image of `𝔟_i` is `(π^{c_i})` with `c_i` finite (`𝔟_i ⊇ I_i`
contains a power of `π`), and `φ(π) ≡ π^p`, so `c_i ≥ p·c_{i−1}`; around the cycle `c_i ≥ p^nc_i`, so `c_i = 0`, `𝔟_i`
contains a unit, and `π^H ∈ I_i`. Only "`I_i` contains a power of `π`" is used, no power of `p`. Modulo `λ` and on the
`Γ_F^{tor}`-invariants this is a relative of 6.6 (2), which compares two lattice families with the same height conditions.
(2) Expand `(γ′ − 1)(cX^{j+1}n)` with `γ′(X^{j+1}) = X^{j+1}(u^{j+1} + Xt′)` and `γ′n = n + Xn₂`: it equals `(u^{j+1} − 1)cX^{j+1}n` plus
`X·(cX^{j+1}n₃)`, which lies in `XN′`; so `X·(u^{j+1} − 1)cX^jn ∈ XN′`, and `X` is injective. For `u` a topological generator
of `ℤ_p^×`, `v_p(u^k − 1) = 1 + v_p(k)` if `(p − 1) | k` and `0` otherwise, so `∏_{j<k≤s}(u^k − 1) = p^{cost(j,s)}·unit`; apply
this to `N = e_iN(T₂)`, `N′ = f(e_iN(T₁))` (`γ₀` is `ℤ_p`-linear on `O_E[[π]]`, preserves the factors, and acts trivially modulo
`π` on both lattices) with `s = s_i`. The bounds on `cost`: the multiples of `p − 1` in `(0, s]` are `(p − 1)m`, `m ≤ s/(p − 1)`,
and `Σ_mv_p(m) = v_p(⌊s/(p − 1)⌋!) ≤ s/(p − 1)²`, so `cost(0, s) ≤ s/(p − 1) + s/(p − 1)²`; in a window `(j, s]` there are at
most `(s − j)/(p − 1) + 1` multiples, whose valuations add at most `(s − j)/(p − 1)² + 1/(p − 1) + log_p(s/(p − 1))`, and
`p/(p − 1) − log_p(p − 1) ≤ 1` for `p ≥ 3`, whence `cost(j, s) ≤ (s − j)p/(p − 1)² + c_H`. (3) For `n ∈ e_{i−1}N(T₂)` and
`ε := M_i + h_i + c_H + 2 + ⌈s_i/(p − 1)⌉`, `φ(π^εn) = q^{h_i}·[π^{ε−t}·π^tq^{ε−M_i−h_i}]·q^{M_i}φ(n)`, `t = ⌈s_i/(p − 1)⌉`; expanding `q = pw + π^{p−1}`, every term of the
bracket is a multiple of `p^aπ^{(p−1)U+t}`, `a + U = c_H + 2 + t`, which kills `C_i` either because `(p − 1)U + t ≥ s_i` or by
(2); so the bracket maps `q^{M_i}φ(n)` into `f(e_iN(T₁))`, `q^{h_i}` maps that into `φ^*f(e_{i−1}N(T₁))`, and `φ`-detection
(freeness of `O_E[[π]]` over its Frobenius image) gives `π^εn ∈ f(e_{i−1}N(T₁))`. One Frobenius step divides the
`π`-exponent by `p − 1` and adds the local span; `j` steps across indices of span `≤ 2G` give the bound on `s_i`. (2) with
`j = 0` gives `p^{cost(0,s_i)}C_i = 0`, and `C_i^{Γ_F^{tor}}` is a direct summand of `C_i` (`Γ_F^{tor}` has order prime to `p`), so
`r_i ≤ cost(0, s_i) ≤ s_i·p/(p − 1)²`; with the bound on `s_i` this is the round bound. (4) Fact (0): the complex is defined.
`Q` and `q` both vanish to first order exactly at the points `ζ − 1`, `ζ` a primitive `p`-th root of unity, so `Q = q·unit`;
`π₀ = π^{p−1}·unit`, whence `φ(π₀) = π₀Q^{p−1}·unit`; and `γ` permutes the zeros of `Q`, so `γ(Q)/Q` is a `Γ_F^{tor}`-invariant
unit with value `1` at `π₀ = 0` (both sides are `p` there): `γ(Q) ∈ Q(1 + π₀O_E[[π₀]])`. Hence `(γ − 1)(Q^{−M}N) ⊆ π₀Q^{−M}N` and
`(φ − 1)(π₀N) ⊆ π₀Q^{−M}N`, and `d¹d⁰ = 0` because `φ` and `γ` commute. Three facts: (i) `φ` maps `π₀^{a+1}N` into
`π₀^{a+1}Q^{(p−1)(a+1)−M}N ⊆ Q·π₀^{a+1}N`, because `M < (p − 1)(a + 1)` (strict) for `a = ⌊M/(p − 1)⌋`, and `1 − φ` is bijective
on `π₀^{a+1}N`; (ii) `γ` acts on `π₀^iN/π₀^{i+1}N` by `u₁^i`, `u₁ = χ(γ)^{p−1}`, so `c_Γ := ∏_{i=1}^{a}(1 − u₁^i)` satisfies
`c_Γπ₀N ⊆ (γ − 1)(π₀N) + π₀^{a+1}N`; (iii) with `δ := π₀^{−1}(γ − 1)` and `R(Y) := ∏_{j∈J}(Y − c(−j))`, `δR(δ)` maps `Q^{−M}N`
into `N`, by 6.5 (4) (the factor for `u + k = 0` is `δ` itself; further factors are harmless, as `δ` preserves `N`). Write
`p^kπ₀ω′ = (γ − 1)y − (φ − 1)(π₀n)` for `ω = π₀ω′`, and `c_Γπ₀n = (γ − 1)(π₀x) + π₀^{a+1}z′` by (ii); with
`Y′ := c_Γy − (φ − 1)(π₀x) ∈ Q^{−M}N` and `φ(π₀^{a+1}z′) = π₀^{a+1}m′` (`m′ ∈ QN` by (i)),
`c_Γp^kω′ = δY′ + π₀^a(z′ − m′)`. Applying `R(δ)` and (iii), `p^kc_ΓR(δ)ω′ ∈ N`, hence `R(δ)ω′ ∈ N` (`Q^{−M}N/N` is `O_E`-free). Finally `R(0)ω′ = R(δ)ω′ − δR₁(δ)ω′`, and (ii), (i) put
`c_Γπ₀R(δ)ω′` and `c_Γ(γ − 1)R₁(δ)ω′` in `im d¹`, so `R(0)c_Γω ∈ im d¹`, with `v_p(R(0)c_Γ) = Σ_{j∈J}v_p(j) + a + v_p(a!)`
(`v_p(c(−j)) = v_p(j)`, `v_p(1 − u₁^i) = 1 + v_p(i)`); this is `e°_U`, and `e_U ≥ e°_U`. For `M = 0`, (i) with `a = 0` makes `d¹`
onto (`1 − φ` is bijective on `π₀N`). *Needs:* PhiGammaModulesAndIwasawaCohomology §6.0; 6.4, 6.5; 6.6 (2) (the modulo-`λ` comparison); PhiGammaModulesAndIwasawaCohomology §3.1 (Herr complexes);
Mathlib `PowerSeries`, `Polynomial`.

**API.**

- (2) is a statement about any pair of `γ′`-stable lattices; it applies to the full ring `O_E[[π]]` with `γ₀` (where only one
  factor in `p − 1` costs) and to the `Γ_F^{tor}`-invariants with `γ`.
- (1)–(3) are compatible with unramified base change (PhiGammaModulesAndIwasawaCohomology §6.1) and with direct sums of surjections.
- The general form of (1) is a statement about two lattices in one étale `φ`-module; it does not use `Γ`. Modulo `λ`, on
  `Γ_F^{tor}`-invariants and with height conditions on both lattices, compare 6.6 (2).

**Checks.**

- `T₁ = T₂`: every `C_i = 0`, and (1)–(3) are empty.
- (*the Fontaine–Laffaille range*) If `H ≤ p − 2`, `cost(0, H) = 0` and (2) gives `C_i = 0`: `f(N(T₁)) = N(T₂)`. If moreover
  `M + h ≤ p − 2`, then `e°_U = 0` and (4) says that `im d¹` is saturated in `π₀Q^{−M}N`.
- (*(1) and (2) are sharp*) `F = ℚ_p`, `m ≥ 1`, `c := (p − 1)p^{m−1}`,
  `T₁ := {(a, b) ∈ p^{−m}ℤ_p ⊕ ℤ_p(c) : p^ma ≡ b (mod p^m)}` (stable, as `χ^c ≡ 1 (mod p^m)`), `f(a, b) = b`, so `T₂ = ℤ_p(c)`,
  the kernel is `ℤ_p`, the weights are `{0, −c}`, `M = H = c`, `h = 0`. Then
  `N(T₁) = {(a/p^m, π^{−c}βe_c) : a, β ∈ ℤ_p[[π]], β ≡ π^ca (mod p^m)}`, and `C = N(T₂)/f(N(T₁)) ≅ ℤ_p[[π]]/(p^m, π^c)`:
  `π^H` is needed, and `p^aπ^{c−1}C = 0` exactly when `a ≥ m = cost(c − 1, c)`. For `m = 1` the cokernel is
  `ℤ_p[[π]]/(p, π^{p−1})`: `T ↦ N(T)` is not right exact on lattices at span `p − 1`.
- (*`M = 0`*) `d¹` is onto (`1 − φ` is bijective on `π₀N`), matching `e°_U = 0`.
- Over the full ring with `γ` in place of `γ₀` (`u = 1 + p`), every factor `u^k − 1` costs `1 + v_p(k)`, and (2) would only give
  `p^{s_i + v_p(s_i!)}C_i = 0` (at `p = s_i = 3` the exponent is `4`): the generator `γ₀` is what saves a factor `p − 1`.
- (*`N′` need not be free*) In the sharp example above with `m = 1`, the image of `N(T₁)` in the Wach line of `T₂` is the ideal
  `(p, π^{p−1})` times its generator, of rank one but needing two generators; the general form of (1) applies to it.

### 6.11 Rank-one subquotients of a reduced Wach lattice: carries

In the setting of 6.4, let `V` be crystalline of dimension `r` with `HT_i(V) = U_i ⊂ [0, h]` for every `i`, `T ⊂ V` a stable
lattice, `0 = A_0 ⊂ A_1 ⊂ ⋯ ⊂ A_m = T/λT` a filtration by `G_F`-submodules, and for a graded piece `G = A_l/A_{l−1}` let
`N̄^G` be the lattice family induced by `N̄(T)` on `D̄(G) = D̄(A_l)/D̄(A_{l−1})`: intersect with `D̄(A_l)`, then take the image.
Let `S` be a set of `t ≥ 1` graded pieces with `G_s ≅ k(χ̄_s)` for crystalline characters `χ_s` (`s ∈ S`) with
`HT_i(χ_s) = {w_{i,s}} ⊂ [0, h]`; identify `D̄(G_s)` with `D̄(k(χ̄_s))` through a chosen isomorphism. For a multiset `U` and
`m′ ≤ #U` let `σ_{m′}(U)` be the sum of its `m′` smallest elements. Prove:

0. (*minors*) for `1 ≤ m′ ≤ r`, every `m′ × m′` minor of the matrix of the linearisation
   `φ^*(e_{i−1}N(T)^{Γ_F^{tor}}) → e_iN(T)^{Γ_F^{tor}}`, in bases over `O_E[[π₀]]`, is divisible by `(π₀ + p)^{σ_{m′}(U_i)}`; hence
   every `m′ × m′` minor of the matrix of `φ_i : N̄_{i−1} → N̄_i` is divisible by `X^{σ_{m′}(U_i)}`;
1. (*carries*) for `s ∈ S` there are unique integers `c_s(i)` (`i ∈ ℤ/n`) with `N̄^{G_s}_i = X^{c_s(i)}·N̄(O_E(χ_s))_i`;
2. `0 ≤ w_{i,s} + p·c_s(i − 1) − c_s(i) ≤ h`;
3. `(p − 1)·|c_s(i)| ≤ h`; in particular every carry is `0` when `h ≤ p − 2`;
4. the multiset of residues `{w_{i,s} − c_s(i) mod p : s ∈ S}` is contained in the multiset of residues of `U_i`;
5. `Σ_{s∈S}(w_{i,s} + p·c_s(i − 1) − c_s(i)) ≥ σ_t(U_i)`.

*Route.* (0) Pass to the exterior power. `∧^{m′}N(V)` is free, spans `D(∧^{m′}V)`, satisfies the height conditions
(`φ(N) ⊆ N` and `q^hN ⊆ φ^*N` give `φ(∧^{m′}N) ⊆ ∧^{m′}N` and `q^{m′h}∧^{m′}N ⊆ φ^*∧^{m′}N`) and the `Γ` condition, so it is
`N(∧^{m′}V)` by the uniqueness of PhiGammaModulesAndIwasawaCohomology §6.0. The weights of `∧^{m′}V` at `i` are the sums of `m′`-element sub-multisets of
`U_i`, all at least `σ := σ_{m′}(U_i)`. Twisting by a crystalline character `ψ` with `HT_j(ψ) = {−σ_j}` (as in the route of
6.4 (2)) makes them nonnegative, so `φ(N(∧^{m′}V ⊗ ψ)) ⊆ N(∧^{m′}V ⊗ ψ)`, and `φ(e_{i−1}e_ψ) = unit·q^{−σ}e_ie_ψ` (6.4 (4))
gives `φ(e_{i−1}∧^{m′}N(V)) ⊆ q^σe_i∧^{m′}N(V)`. In the basis of wedges of a `Γ_F^{tor}`-invariant basis (6.4 (1)) the
matrix of `φ` on `∧^{m′}` has the `m′ × m′` minors of the matrix of `φ` as entries; so every minor is divisible by `q^σ` in
`O_E[[π]][1/p]`, hence by `Q^σ` (`Q := π₀ + p = q·unit`, see 6.10, route of (4)); since `Q` is distinguished, divisibility
in `O_E[[π]][1/p]` implies divisibility in `O_E[[π]]`, and the quotient is `Γ_F^{tor}`-invariant, so it lies in `O_E[[π₀]]`.
Reduce modulo `λ`: `Q ≡ X`. (1) Two `k[[X]]`-lattices
in the line `D̄_i(G_s)` differ by a power of `X`. (2) The height condition `(0, h)` passes from `N̄(T)` to the induced
lattices (6.4, API); with `φ_i^*N̄(χ_s)_{i−1} = X^{w_{i,s}}N̄(χ_s)_i` (6.4 (4)) and `φ(X) = X^p`,
`φ_i^*N̄^{G_s}_{i−1} = X^{w_{i,s} + pc_s(i−1) − c_s(i)}N̄^{G_s}_i`. (3) From (2), `p|c_s(i − 1)| ≤ h + |c_s(i)|`; at an index where
`|c_s|` is largest, `(p − 1)|c_s| ≤ h`. (4) The Sen weights of `N̄_i` are the residues of `U_i` (6.5 (2)); `sen` is additive
over the graded pieces of a filtration by saturated sub-families (6.6, API); the Sen weight of `N̄(χ_s)_i` is `w̄_{i,s}`
(6.5 (2)) and that of `X^cN̄(χ_s)_i` is `w̄_{i,s} − c` (6.6 (1)). (5) In bases adapted to the filtration (possible since the
induced lattices are free) the matrix of `φ_i` is block upper triangular with the matrices of the induced maps on the
diagonal; its principal minor at the `t` positions of `S` is triangular with diagonal entries `unit·X^{w_{i,s}+pc_s(i−1)−c_s(i)}`
by (2), and (0) with `m′ = t` gives the inequality. *Needs:* PhiGammaModulesAndIwasawaCohomology §6.0 (uniqueness, tensor and twist laws); 6.4 (1), (2), (4),
6.5 (2), 6.6 (1) and the API of 6.4, 6.6; Mathlib `Matrix.det`, `ExteriorAlgebra.exteriorPower`.

**Checks.**

- `T = ⊕_{s}O_E(χ_s)` with the filtration by partial sums: every carry is `0`.
- `h ≤ p − 2`: every carry is `0` by (3), and (2) and (5) become statements about the weights.
- (*a carry of size `h/(p − 1)`*) `F = ℚ_p`, `T := {(a, b) ∈ ℤ_p ⊕ ℤ_p(1 − p) : a ≡ b (mod p)}` (weights `0`, `p − 1`; `h = p − 1`),
  `v₁ := (1, 1)`, `v₂ := (p, 0)`. Then `N(T) = π^{p−1}ℤ_p[[π]]v₁ ⊕ ℤ_p[[π]]v₂` and `N̄(T) = Xk[[X]]v̄₁ ⊕ k[[X]]v̄₂`; `T/pT` has
  the sub `⟨v̄₂⟩` and the quotient `⟨v̄₁⟩`, both trivial. With `χ_{sub} = χ_cyc^{1−p}` (weight `p − 1`) and `χ_{quot} = 1`
  (weight `0`): the induced lattices are `k[[X]]v̄₂ = X^{−1}N̄(χ_{sub})` and `Xk[[X]]v̄₁ = X·N̄(1)`, carries `−1` and `+1`;
  `(p − 1)|c| = h`, the quantities of (2) are `0` and `h`, the residues `{p, −1}` are those of `U = {0, p − 1}`, and (5) is an
  equality `p − 1 = σ_2(U)`. So (3) is sharp.

### Examples

For `F = ℚ_p` and `T = ℤ_p(−a)` with `a ≥ 0`, `N̄` is free on a vector `≡ π^ae_{−a}` modulo higher powers of `π` and `φ^*N̄ = X^aN̄` (6.4); `∇` acts on `N̄/XN̄` by `ā`, so the reduced invariant Wach lattice of `ℤ_p(−p)` has Sen weight `0`, although its Hodge–Tate weight is `p` (6.5). For `n = 1` and `φ(e) = X^he` in rank one, the lattices `X^{−m}k[[X]]e`, `0 ≤ m ≤ ⌊h/(p−1)⌋`, all satisfy the height condition `(0, h)`: lattice families with the same height conditions are determined only up to `X^σ` (6.6). On the trivial module, `γ − 1` maps `(X^aφ^*M)^{ψ=0}` onto `(X^{a+1}φ^*M)^{ψ=0}` exactly when `a ≢ 1 (mod p)` (6.7). If every `h_i ≤ p − 2`, then `σ_i = 0`, and for `F = ℚ_p`, `r = t = 1` and weights `u ≠ w` with `|u − w| > 2` the residual bound `d` is the dimension of the Fontaine–Laffaille extensions of `χ_1` by `ρ`, `1` if `u < w` and `0` if `u > w` (6.9). For `F = ℚ_p`, the lattice `{(a, b) ∈ p^{−1}ℤ_p ⊕ ℤ_p(p − 1) : pa ≡ b (mod p)}` maps onto `ℤ_p(p − 1)` with cokernel `ℤ_p[[π]]/(p, π^{p−1})` on Wach lattices, so `T ↦ N(T)` is not right exact on lattices (6.10). For `F = ℚ_p` and `T = {(a, b) ∈ ℤ_p ⊕ ℤ_p(1 − p) : a ≡ b (mod p)}`, with weights `0` and `p − 1`, the sub and the quotient of `T/pT` carry the carries `−1` and `+1`, so the bound `(p − 1)|c| ≤ h` is attained (6.11).

### Dependencies

PhiGammaModulesAndIwasawaCohomology §§0.1, 1.0, 2.2, 2.4, 2.5, 3.1, 3.4, 3.5, 3.6, 5.6a, 6.0 and 6.1; PadicPeriodRings §§4.1–4.3 for crystalline representations; Mathlib power series, Laurent series, polynomials, generalized eigenspaces, determinants and exterior powers.

## Downstream consumers

In the family RiemannHypothesisForDirichletLFunctions, SelmerLengthBoundsAndLocalLifting §4.10a uses 6.4–6.9 to identify the torsion classes cut out of crystalline lattices with the Bloch–Kato finite ones beyond the Fontaine–Laffaille range (this final local theorem needs Bloch–Kato's `H¹_f` of a lattice, which is why it is stated there), and SelmerLengthBoundsAndLocalLifting §§4.10c–4.10e, the lifting theorems with loss, use the annihilators of 6.10, the exactness and crystallinity clauses 6.4 (5), (8), the localisation clause 6.4 (7) and the Sen clause with poles 6.5 (4); they cover surjections of crystalline lattices, unramified, ramified cyclotomic and tamely ramified bases, and potentially crystalline lattices of tame type (SelmerLengthBoundsAndLocalLifting §§4.10c–4.10f). The ramified cyclotomic and tame cases need lattices of the same kind over ramified bases: the values of prismatic `F`-crystals on cyclotomic prisms (SelmerLengthBoundsAndLocalLifting §4.10e (0)), and for the tame type their values on Breuil–Kisin prisms; both come from PrismaticCohomologyPartIII. SelmerLengthBoundsAndLocalLifting §4.10e (0) also states, at every finite level `s` of the cyclotomic tower and over subfields of `F(μ_{p^s})`, the uniqueness clause (U)_s whose case at level one and over `F` is 6.4 (8); there crystallinity is a hypothesis, here a conclusion. Through these, CongruenceModulesOfThetaLifts uses this roadmap for the local condition at `ℓ` (CongruenceModulesOfThetaLifts §7.6) and for the total congruence bound (CongruenceModulesOfThetaLifts §§7.10a–7.10c, also through LengthBoundsInPadicFamilies §1.8e). CongruenceModulesOfThetaLifts §7.16 (weight elimination) uses 6.4 and, directly, the Sen weights modulo `ℓ` of 6.5 (the Sen weights modulo `ℓ` of the Wach lattices of eigensystems of weight `μ` are the residues of `μ_a + N − 1 − a`) and the carries of 6.11 (1) of the residual characters of an eigensystem, with the arithmetic lemmas there.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns, in the setting of 6.4: the reduction of Wach lattices modulo a uniformizer of the coefficients, their behaviour in exact sequences of lattices and the crystallinity criterion by heights and the `Γ` condition, their localisation at `ζ_p − 1` and at all levels, their Sen operator (also on the polar parts) and Sen weights modulo `p` (6.4, 6.5); the semilinear algebra of lattice families in étale `(φ,γ)`-modules over `k((X))`: comparison, gauge lemma, the operator `ψ` modulo `p` with its filtered surjectivity, polar counts and the counting theorem (6.6–6.8); position data and models of admissible modules, and the residual bound for admissible classes (6.9); the annihilators of the cokernel of the Wach lattices of a surjection of crystalline lattices, with the torsion bound for a truncated Herr complex (6.10); and the lattices induced by a reduced Wach lattice on rank-one subquotients of the reduction, with their carries (6.11).

Not owned here. The theory these statements extend is owned by [PhiGammaModulesAndIwasawaCohomology](../../PhiGammaModulesAndIwasawaCohomology/README.md): Wach modules over `O_E⊗A_F^+` with their `q`-heights, trivial `Γ` action modulo `π`, filtered reduction modulo `π` and uniqueness for a crystalline representation, including Berger's existence theorem, are PhiGammaModulesAndIwasawaCohomology §6.0; their unramified base change, good bases and `ψ`-fixed vectors PhiGammaModulesAndIwasawaCohomology §§6.1–6.3; the integral étale realization and its reduction PhiGammaModulesAndIwasawaCohomology §1.0; linearized Frobenius modules PhiGammaModulesAndIwasawaCohomology §0.1; the module `ψ` PhiGammaModulesAndIwasawaCohomology §§2.2–2.5; Herr complexes and their integral comparison with Galois cohomology PhiGammaModulesAndIwasawaCohomology §§3.1, 3.4–3.6; the cyclotomic localisations of the unfiltered de Rham lattice PhiGammaModulesAndIwasawaCohomology §5.6a; and the Sen operator of a relative Robba module PhiGammaModulesAndIwasawaCohomology §7.2a. Crystalline representations and their period functors are owned by [PadicPeriodRings](../../PadicPeriodRings/README.md): PadicPeriodRings §§4.1–4.3. The final local theorem drawn from these statements (the Bloch–Kato form of the residual bound) and the lifting theorems with loss for finite classes are not stated here: they belong to the consumer named above, [SelmerLengthBoundsAndLocalLifting](../SelmerLengthBoundsAndLocalLifting/README.md), and so do the lattices over ramified bases that its ramified cyclotomic and tame cases need.

## Exact supplier contracts

### From TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

§6.0: for finite unramified `F/ℚ_p`, a crystalline `E`-representation `V` and a `G_F`-stable `O_E`-lattice `T`, the Wach module `N(V)` over `E⊗B_F^+` and the embedded lattice `N(T) = N(V) ∩ D(T)` over `O_E⊗A_F^+`, finite free, with trivial `Γ` action modulo `π` and the `q`-height bound; existence, uniqueness inside `D(V)` and `D(T)`, the tensor, dual and interval-twist laws, `N(T)[1/p] = N(V)`, and the filtered comparison `D_cris(V) ≅ N(V)/πN(V)` with `Fil^iN(V) = {x ∈ N(V) : φ(x) ∈ q^iN(V)}` (used in 6.4–6.11). §6.1: unramified base and coefficient change (the API of 6.5 and 6.10). §1.0: the integral étale realization `T ↦ D(T)` over `O_E⊗A_F` with its reduction and coefficient algebras, exact (6.4). §0.1: linearized Frobenius modules (6.6). §§2.2, 2.4, 2.5: the module `ψ` from a linearization, the `ψ`-zero projector and period coordinates (6.7). §3.1: native Herr complexes (6.7, 6.10). §3.4: generator change and the prime-to-`p` torsion adapter (6.4, 6.9). §3.5: invertibility of `γ − 1` on `ψ`-zero parts (6.7). §3.6: the integral Galois comparison of Herr cohomology for finite `p`-primary modules (6.9). §5.6a: the de Rham differential-equation realization and its cyclotomic localisations (6.4, 6.5).

### From TauCetiRoadmap.PadicPeriodRings

§§4.1–4.3: the period rings `B_cris` and `B_dR`, the functors `D_cris` and `D_dR` with the Hodge filtration, and the fixed-field identities, which define crystalline and de Rham representations and their Hodge–Tate weights (6.4–6.11).

### From Mathlib

`PowerSeries`, `LaurentSeries` and `Module.End.maxGenEigenspace` (6.6); `Polynomial` (6.10); `Matrix.det` and `ExteriorAlgebra.exteriorPower` (6.11).

## References

- **Berger-Wach-2004** — Laurent Berger, *Limites de représentations cristallines*, Compositio Mathematica 140 (2004), 1473–1498: Proposition II.1.1, Theorem III.4.4 and the description of `N(V)` through its localisations (6.4, 6.5).
- Nathalie Wach, *Représentations p-adiques potentiellement cristallines*, Bulletin de la Société Mathématique de France 124 (1996), 375–400: Wach modules and the crystallinity criterion (6.4, 6.5).
- Laurent Herr, *Sur la cohomologie galoisienne des corps p-adiques*, Bulletin de la Société Mathématique de France 126 (1998), 563–600: Herr complexes with torsion coefficients, and `γ − 1` on `ψ`-zero parts modulo `p` (6.7, 6.9, 6.10).
- Frédéric Cherbonnier and Pierre Colmez, *Théorie d'Iwasawa des représentations p-adiques d'un corps local*, Journal of the American Mathematical Society 12 (1999), 241–268: `ψ` and `γ − 1` on `ψ`-zero parts (6.7).
- Jean-Marc Fontaine, *Représentations p-adiques des corps locaux I*, The Grothendieck Festschrift II (1990), 249–309: étale `(φ,Γ)`-modules (6.4).
- **[FormalProof]** Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It is the source of the reduction of Wach lattices modulo `λ`, the comparison and gauge lemmas, the operator `ψ` modulo `p`, the polar counts, the counting theorem, the models and the residual bound (6.4–6.9), of the annihilators of the cokernel of Wach lattices and the truncated Herr complex (6.10), and of the carries of rank-one subquotients (6.11).
- **[Announcement]** Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
