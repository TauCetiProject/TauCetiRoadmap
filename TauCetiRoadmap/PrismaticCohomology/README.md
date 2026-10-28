# Roadmap: prismatic cohomology, Part I — Delta rings, prisms and relative cohomology

**Summary.** Construct the integral delta-algebra API beyond the p-local inputs of PerfectoidSpaces, orientation-free relative cohomology over bounded prisms, its animated extension and general perfectoidization. The smooth Hodge–Tate, crystalline and restricted de Rham comparisons are constructed in Layer 1.

## Scope and ownership

PerfectoidQuotients and AInfCohomology supply prerequisites. This roadmap constructs Layers 0–2.

Cross-roadmap prerequisites use the section labels of their owning roadmaps.

This part owns the integral polynomial, localization, completion and δ-ideal API over arbitrary commutative rings; the p-local geometric δ-ring and prism objects and restricted affine theory are imported from PerfectoidSpaces. It owns the extension to arbitrary bounded prisms with canonical Breuil–Kisin twists and formal schemes, and animated perfectoidization, arc descent and integral J-almost purity (§§2.0, 2.22–2.31). PerfectoidSpaces owns the semiperfectoid universal quotient. General orientable envelopes, Laurent relative Frobenius and relative quasiregular initiality are targets of §§0.93, 1.13a and 2.13a, with their wider ranges stated explicitly.

Mathlib supplies ordinary Witt vectors, adic completions, divided powers and divided power algebras, localizations, sites and derived categories. EnhancedDerivedSheaves and DerivedDeRhamCohomology supply their enhanced, completed and animated interfaces; SchemeAndStackFoundations supplies adic thickening systems; §1.0 constructs the bounded p-adic formal schemes and sites used here. No divided power envelope or full cotangent complex is inferred from its naive counterpart. AlgebraicVectorBundles supplies the ordinary affine vector-bundle dictionary; compatible-system effectivity in §2.28 is additional.

### Imported interfaces

The following interfaces are consumed from their single owners. The section labels identify these inputs throughout this roadmap. The interfaces and checks specify the supplier contracts; they are not additional construction targets.

<a id="s0-59"></a>
<a id="layer-0-delta-etale-extension"></a>

**§0.59 δ-structures on completely étale algebras and derived completions.** PerfectoidQuotients §0.0 (complete étale δ-extension). Use `completeEtale_algebraization` and `delta_witt2_etale` of PerfectoidQuotients §0.0: algebraize a derived I-complete, I-completely étale algebra for finitely generated `I` containing `p`, and extend its length-two Witt section uniquely. Its `delta_derivedCompletion` supplies the discrete derived-completion consequence.

**Supplier checks.**

For `C=F_p` the ghost kernel is `V(F_p)`, and `W₂(C)=Z/p²` cannot be replaced by the underived ghost fibre product `F_p`. For `p` invertible in `C`, the ghost map identifies `W₂(C)` with `C×C` and the étale base-change formula holds on both factors. For `C=Z_(p)`, the ideal `V(C)` is not square-zero: `V(1)²=V(p)≠0`, whereas the kernel `V(C[p])` of α is zero. For an étale `C→D` in characteristic `p`, the overlap isomorphism is relative Frobenius; an argument using the identity on both overlap maps gives the wrong glued algebra when `C` is imperfect.

**Worked supplier check.** For `A = Z_(p)` and `I = (p)`: the derived p-completion `Z_p` carries the unique δ-structure with `φ = id`. For `A = Z_p[x]` with `φ(x) = x^p` and `B` the p-completion of `A[1/x]`: the δ-structure extends with `φ(1/x) = 1/x^p`.

<a id="s0-72"></a>
<a id="layer-0-prism"></a>

**§0.72 prism.** PerfectoidSpaces §P4.15.2 (prisms). Use its δ-ring carrier, Frobenius, reduction `A/I` and Cartier ideal, with `p ∈ I + φ(I)A`; locally distinguished regular generators recover the prism condition.

**Supplier checks.**

- `prism_ideal_ne_bot`: If A is nonzero then the ideal of a prism on A is nonzero.
- `prism_p_squared_fails`: There is no prism structure on the ring `Z_p` with ideal `(p^2)`.
- `prism_zero_ring`: On the zero ring there is exactly one prism.
- `prism_ideal_p_implies_torsionfree`: If the ideal of a prism is `(p)` then `p` is a nonzerodivisor of A.

**Worked supplier check.** `(Z_p, (p))`, `(Z_p[[q−1]], ([p]_q))`, `(A_inf, ker θ)` and `(W(k)[[u]], (E(u)))` are prisms. `(Z_p, (p^2))` is not a prism: `p ∉ (p^2) + φ(p^2)Z_p`. `(Z_p[[q−1]], (q−1))` is not a prism: `p ∉ (q−1, q^p−1)`. `(Z, (p))` is not a prism: `Z` is not derived p-complete.

<a id="s0-75"></a>
<a id="layer-0-ainf-prism"></a>

**§0.75 The perfect prism of a perfectoid ring.** PerfectoidSpaces §§P1.16–P1.18, P4.15.2 (Fontaine prism). Its ring is `W(R^♭)`, ideal `ker θ`, Frobenius the Witt Frobenius, and reduction canonically `R`; the prism is perfect.

**Supplier checks.**

- `ainf_prism_theta_teichmuller`: `θ` sends the Teichmüller lift `[x]` to the untilt of `x` (Mathlib `WittVector.fontaineTheta_teichmuller`).
- `ainf_prism_kernel_not_p`: If `p ≠ 0` in `O` then `ker θ ≠ (p)`: `p` is not in the kernel.
- `ainf_prism_perfect_bounded`: The prism `(W(O^♭), ker θ)` is bounded.

**Worked supplier check.** `R = Z_p^cycl-completion`, `ε = (1, ζ_p, ζ_{p^2}`, …): `ξ = [p]_q` at `q = [ε^{1/p}]`, that is `ξ = 1 + [ε^{1/p}] +` … `+ [ε^{(p−1)/p}]`, and `θ(ξ) = 1 + ζ_p +` … `+ ζ_p^{p−1} = 0`. `R` perfect of characteristic `p`: `A_inf(R) = W(R)`, `ker θ = (p)`, and the prism is the crystalline prism `(W(R), (p))`.

<a id="s0-83"></a>
<a id="layer-0-prism-perfection"></a>

**§0.83 Perfection of a prism.** PerfectoidSpaces §P4.15.2 (completed prism perfection). The completed Frobenius colimit is initial among perfect prisms under the given prism; its structural map and unique lifts respect composition, `p` is regular, and the extended ideal has a distinguished regular generator.

**Supplier checks.**

- `perfection_of_perfect_prism`: If `φ` is bijective then ι : `A → A_perf` is bijective.
- `perfection_padic`: For the prism `(Z_p, (p))`, ι : `Z_p → A_perf` is bijective.
- `perfection_kills_frobenius_kernel`: ι need not be injective: every a with `φ(a) = 0` maps to `0` in `A_perf` (for instance `x − 1` in `Z_p[x]/(x^p − 1)` with `φ(x) = 1`).
- `prism_perfection_raw_generator_zero_divisor`: Put `T=Z_p[[u]]`, `M_i=T/(u^(p^(i+1))−p)`, `M=∏_(i≥0)M_i` and `A=T⊕M` with `M²=0`. On `T` take `φ(u)=u^p`. The substitution `u↦u^p` gives a φ-semilinear map `M_i→M_(i+1)`; let `F` be its right shift on `M`, with zeroth component zero, and set `φ_A(a,m)=(φ_T(a),pF(m))`. This is a Frobenius lift on the p-torsion-free ring A, hence defines `δ`. For `d=u−p`, both `p` and `d` are regular, `δ(d)` is a unit, A is `(p,d)-complete` and `(A/d)[p^∞]=(A/d)[p]`, so (A,(d)) is bounded. Let `e_i` have component `1` in `M_i` and zero elsewhere. The class of `e_0` at stage `1` of `colim_φ A` is nonzero, since `φ_A^r(e_0)=p^r e_r≠0` for every `r`. The image of `d` acts at that stage by `φ_T(d)=u^p−p`, which kills `e_0`. This gives an explicit zero divisor before p-completion, rather than applying Lemma 2.34 without separatedness.

**Worked supplier check.** `(Z_p[[q−1]], ([p]_q))_perf = (Z_p[q^{1/p^∞}]^∧_{(p,q−1)}, ([p]_q))`, whose reduction is `Z_p[ζ_{p^∞}]^∧`. The perfection of the Breuil–Kisin prism is `(A_inf(O_{K_∞}^∧), ker θ)` with `K_∞ = K(π^{1/p^∞})`.

<a id="s0-84"></a>
<a id="layer-0-perfect-prisms-perfectoid-rings"></a>

**§0.84 Perfect prisms and perfectoid rings.** PerfectoidSpaces §P4.15.2 (perfect-prism equivalence).

**Worked supplier check.** `O_C` ↔ `(A_inf, (ξ))`; a perfect `F_p-algebra R` ↔ `(W(R), (p))`; `Z_p^cycl` ↔ `(Z_p[q^{1/p^∞}]^∧, ([p]_q))`. `Z_p` is not perfectoid, and correspondingly there is no perfect prism with `A/I = Z_p`.

<a id="s0-85"></a>
<a id="layer-0-perfectoid-tor-independence"></a>

**§0.85 Tor-independence of perfectoid rings.** PerfectoidQuotients §0.0 (perfectoid Tor-independence).

**Worked supplier check.** `O_C⟨x^{1/p^∞}⟩ ⊗̂_{O_C} O_C⟨y^{1/p^∞}⟩ = O_C⟨x^{1/p^∞}`, `y^{1/p^∞}⟩`. For non-perfectoid rings the completed tensor product can have higher `Tor`: `Z_p ⊗^L_{Z_p[x]} Z_p` along `x ↦ 0` twice.

<a id="s0-86"></a>
<a id="layer-0-regular-prismatic-envelopes"></a>

**§0.86 Prismatic envelopes of regular ideals.** PerfectoidSpaces §P4.15.2 (regular prismatic envelopes). Use the initial complete δ-algebra making the regular generators divisible by the prism ideal; maps are uniquely determined by the base map and satisfy the specified division relations, with complete flatness and completed base change.

**Supplier checks.**

For the next three Checks, `B` is a derived `(p,I)`-complete δ-A-algebra and locally `I=(d)` with `d` regular on `B`.

- For the empty family of elements, `B` itself (if `d` is a nonzerodivisor on `B`) is an envelope.
- If `x =` d·y in `B` and `d` is a nonzerodivisor on `B` then `B` is an envelope of the single element `x`, with `z = y`.
- In an envelope the elements `z_i` are determined by `d·z_i = x_i`.
- In an envelope, `φ(d)·δ(z_i) = δ(x_i) − z_i^p·δ(d)`: this is a required `δ` relation, so the envelope cannot in general be replaced by the ordinary ring `B[z]/(d·z − x)` without imposing the iterated `δ` relations. Uniqueness of `δ(z_i)` is not inferred by cancelling `φ(d)`.
- Over `(Z_p,(p))`, the empty-family envelope of `B=Z_p[X]` with `δ(X)=0` is `Z_p⟨X⟩`, not `B`.
- For a δ-structure with `φ(x) = x^p` on a polynomial ring in `x`, the subring generated by `x` and `x/p` is not stable under `δ`: `δ(x/p) = (x^p/p^{p+1})·(p^{p−1} − 1)` does not lie in it; for `p = 2`, `δ(x/2) = x^2/8` is not in Z[x, `x/2]`.

**Worked supplier check.** `(A, I) = (Z_p, (p))`, `B = Z_p⟨x⟩` with `φ(x) = x^p`, `J = (p, x)`: `C = Z_p{x/p}^∧`, whose Frobenius pullback is the p-completed PD polynomial algebra. Over the q-de Rham prism with `B =` A⟨x⟩, `δ(x) = 0` and `J = ([p]_q, x)`: `C = B{x/[p]_q}^∧`; its base change along the A-linear δ-map `B → B`, `x ↦ x^p`, is `B{φ(x)/[p]_q}^∧ = B{x^p/[p]_q}^∧`, the q-PD envelope of `(B, (q − 1, x))` (BS22 Lemma 16.10); this is not the Frobenius twist of `C`, which is `B{x^p/[p]_{q^p}}^∧`. For `J =` IB the envelope is `B` itself.

<a id="s1-25"></a>
<a id="layer-1-perfect-prism-initial"></a>

**§1.25 A perfect prism is initial among prisms over its reduction.** PerfectoidSpaces §P4.15.2 (initiality of the Fontaine prism).

**Worked supplier check.** `(A,I) = (Z_p,(p))`: every prism `(B,J)` with `p ∈ J`, that is every crystalline prism, receives exactly one map from `(Z_p,(p))`. `(A,I) = (A_inf, ker θ)`: a ring map `O_C → B/J` determines the map `A_inf → B`. Failure of the converse: for the Breuil–Kisin prism `(Z_p[[u]],(u − p))` and the perfect prism `(A_inf(O_C), ker θ)`, the maps `u ↦ [p^♭]` attached to the different compatible systems `p^♭` of p-power roots of `p` are distinct maps of prisms inducing the same map `Z_p → O_C`.

<a id="s2-11"></a>
<a id="layer-2-idempotent-retract-initial-object"></a>

**§2.11 Initial objects as idempotent retracts.** PerfectoidSpaces §P4.15.3 (idempotent-retract argument).

**Worked supplier check.** `C` the category of sets and `X = ∅` with `F(Y) = (∅ → Y)`: `e` is the identity and `X` is initial. `C` the category of pointed sets and `X` a two-point pointed set with `F(Y)` the constant map to the base point: `e` is the constant map and the retract is the one-point set. `C =` prisms over `(A, I)` with a map from `R` and `X = (Δ_{R/A}, IΔ_{R/A})`: BS22 Lemma 7.7 `(3)`.

<a id="s2-15"></a>
<a id="layer-2-qrsp-prism"></a>

**§2.15 The prism of a quasiregular semiperfectoid ring.** PerfectoidSpaces §P4.15.3 (initial QRSP prism).

**Worked supplier check.** `S = R` perfectoid: `Δ_S = A_inf(R)`. `S = O_C/p`: `Δ_S = A_inf{p/ξ}^∧` (§2.21). `S = R⟨x^{1/p^∞}`, `y^{1/p^∞}⟩/(xy)`: §2.18. Independence: for `S = O_C/p` the perfect prisms `A_inf(O_C)` and `A_inf(O_C⟨Y^{1/p^∞}⟩)` with `Y ↦ 0` give the same `Δ_S`. For pS `= 0`, `Δ_S` is `A_crys(S)` up to the Frobenius twist (§2.20).

## Conventions

Suggested.lean uses `Delta.Structure` for the integral δ-identities, `Delta.IsDeltaMap` for ring maps commuting with δ, and `Delta.associatedFrobenius` for the function `x↦x^p+pδ(x)`. Regular and p-regular mean that multiplication by the indicated element (or by `p`) is injective; no nonzero-ring convention is imposed.

Fix a prime `p` throughout the geometric theory. Rings are unital and may be zero. The elementary `δ` polynomial identities make sense over any commutative ring; prismatic and log-delta rings are `Z_(p)-algebras`. In Suggested.lean, the elementary structures are explicitly polynomial generalizations: the prime assumption occurs on the theorems, and they are not substitutes for a complete prism.

The addition correction is the integer polynomial

```text
C_p(x,y) = - Σ_(0<i<p) (binom(p,i)/p) x^i y^(p-i).
φ(x) = x^p + p δ(x).
```

The coefficients are divided in the integers before casting into a ring. No formula cancels `p` unless multiplication by `p` is injective. In particular `C_2(x,y) = −xy` and `C_3(x,y) = −xy(x+y)`. The identity endomorphism of `Z` reconstructs `δ(2)=−1` at `p=2`, `δ(4)=−6` at `p=2`, and `δ(2)=−2` at `p=3`. An ordinary Frobenius congruence is weaker than `δ` data in a ring with p-torsion.

Use cohomological indexing. `D(A)` in a construction of commutative algebra objects means the stable derived infinity category, not merely the homotopy category of complexes. A simplicial commutative ring is animated. Completed tensor products and left Kan extensions are derived; every completion is marked by its ideal. `D_comp(A)` uses derived `(p,I)-completion` for a bounded prism `(A,I)`. “Discrete” means concentrated in degree zero. Derived p-completion and classical completion agree only under the hypotheses stated for that comparison.

Sites use a fixed universe cutoff `κ` (ALB23 Remark 3.1.2, p.16). The flat topology is generated by finite jointly completely faithfully flat families, including the empty family over the zero prism. All site arrows reverse ring maps. Complete flatness is tested by derived tensor with ideal-torsion modules; complete faithful flatness also requires faithful flatness modulo the marked ideal. These conventions do not turn a single nonfaithful projection into a cover.

QRSP means derived p-complete with bounded p-power torsion, a quotient of a perfectoid ring, and `L_(S/Z_p)[−1]` p-completely flat. The equivalent predicates and the QRSP basis are imports from DerivedDeRhamCohomology §§5.1–5.4 and PerfectoidQuotients Layer `0` (BMS2 Definition 4.20, Remarks 4.21–4.22, Lemma 4.25, pp.22–24; BS22 Notation 7.1, p.55). Every additional base or regularity hypothesis is local to its target.

Unless a target specifies a different range, `(A,I)` in Layers 1–2 is a bounded prism: `A/I` has bounded p-power torsion and A is derived and classically `(p,I)-complete`. An animated `A/I-algebra` is derived p-complete; its tensor products and colimits are derived and p-completed. For a perfect prism `φ_A` is bijective, `I=(d)` with `d` distinguished regular, `A=A_inf(A/I)`; this perfect hypothesis is imposed explicitly where used. Delta-algebra targets before p-localization impose neither p-torsion-freeness nor finiteness.

The Hodge–Tate module twist is `M{n}=M⊗(I/I²)^(⊗n)`, `n∈Z`, with negative powers duals. Only twists of `A/I-modules` are used here. Filtered and graded operations, exterior/divided powers and completed Tor-amplitude use the enhanced supplier interfaces below. No orientation is silently chosen.

## Exact supplier contracts

A supplier row specifies the interface used, under the hypotheses shown. Its theories are imported. Each target lists its own additional prerequisites.

| Supplier | Layers | Required interface |
| --- | --- | --- |
| AlgebraicVectorBundles, Layers L0A–L0B | `2` | Monoidal sheaves, duals and finite projective modules `≃` finite locally free sheaves on affines (Layers L0A–L0B). Compatible-tower effectivity is §2.28, not part of this equivalence. |
| DerivedModuleAlgebra §0.K.1; AInfCohomology §AI.1.7 | 0–2 | Finite-sequence Koszul complexes, exterior terms, alternating contraction, concatenation and regular-sequence acyclicity; the commuting-endomorphism cochain adapter, with its signed tensor differential. |
| DerivedDeRhamCohomology §§PD.6–PD.7 | `0`, `1`, `2` | PD envelopes with their initial property and flat base change, including p-completion. For p-torsion-free `B` and a sequence regular modulo `p`, retain p-torsion-freeness; in characteristic `p` use the divided-power monomial basis. `A_crys(S)` is the initial p-complete PD thickening of a semiperfect `F_p`-algebra `S`, with Frobenius, PD/conjugate filtrations and the PD logarithm. The `γ_p-stability` and `γ_k∘γ_p` identities are used with their p-torsion-free hypotheses (BS22 Lemmas 2.38, 16.11). |
| DerivedModuleAlgebra §§1.1–1.9, 1.E.1; DerivedDeRhamCohomology §§1.10–1.23 | `0`, `1`, `2` | Derived completion at a finitely generated ideal, completed tensors, Nakayama and complete-flat descent; complete Tor-amplitude and the bounded-torsion discreteness criterion (BMS2 Lemmas 4.4–4.7). The finite complete Tor-amplitude tensor/totalization exchange is a local target of [§1.10](#s1-10). Filtered derived categories, Day tensor, graded pieces, completion, Beilinson t-structure and heart and Bocksteins retain their enhanced coherences. Derived complete `M` with perfect reduction is perfect. Negative tensor powers of invertible ideals are allowed; no unqualified classical-completion comparison is assumed. |
| EnhancedDerivedSheaves §§0.1–0.3, E1.1–E1.4 | `0` | Enhanced module derived categories, derived tensor, adjunctions and derived limits; their homotopy categories recover ordinary derived categories. The complete enhancements and algebra objects are retained, not inferred from triangulated categories. |
| EnhancedDerivedSheaves §E0.4 | `0` | Products and limits with fixed universe cutoffs; §0.93 takes its solution-set product in a larger ambient universe. |
| DerivedModuleAlgebra §§0.1–0.17, 0.25 | `0`, `1`, `2` | Full cotangent complexes, transitivity, derived exterior/divided powers, décalage `∧^i(M[1])≃Γ^i(M)[i]`, p-complete Tor-amplitude and quasisyntomic/QRSP predicates. Square-zero deformation classes, map-lifting and uniqueness under cotangent vanishing are affine inputs; scheme lifting groupoids are §2.6. |
| DerivedDeRhamCohomology §§2.7–2.26, 5.8 | `1` | Derived p-complete de Rham algebras with Hodge filtration, polynomial models, continuous forms for smooth algebras and crystalline base change; the shared logarithmic constructors are in DerivedDeRhamCohomology §6.20. Comparison maps preserve multiplication and the stated filtrations. |
| DerivedDeRhamCohomology §§5.1–5.7, 5.17, 5.26 | `1`, `2` | Quasisyntomic site and QRSP basis, completed faithfully flat cotangent-power descent, unfolding from QRSP objects and completed left Kan extension. BMS2 Lemma 4.34 supplies the relative cotangent-flatness condition only in its perfect-base range. §5.26 supplies `DerivedDeRham.formalEtaleRealization`, `formalEtaleAffine`, `formalEtaleCoverDescent`, `formalEtalePullback` and `formalEtaleFiltered` on quasisyntomic charts. |
| CrystallineCohomology §§CR.1.1–CR.1.3 | `1` | Crystalline sites/topoi and crystals, Čech–Alexander models, connections and smooth descent; the prismatic realization uses these actual sites and evaluation maps. |
| CrystallineCohomology §§CR.2.1–CR.2.3 | `1`, `2` | Smooth-lift crystalline–de Rham comparison at finite PD level, Čech computation and derived inverse p-power limits, with the stated Frobenius and completed-base-change compatibilities. The perfect-k animated polynomial extension is constructed in §2.19. |
| DerivedDeRhamCohomology §§3.4–3.6 | `1` | Cartier isomorphism for smooth characteristic-p schemes, including exterior products, relative Frobenius and crystalline Bockstein normalization. |
| EnhancedDerivedSheaves Layer E2 | `1` | Enhanced sheaves, hypercovers, effective epimorphisms, cohomological descent and replete-topos limits. Use space-valued fpqc sheafification, not just groupoid stackification. |
| SchemeAndStackFoundations §§2.1–2.6 | `1` | Small étale sites and functorial morphisms of topoi, smooth and étale localization and gluing of scheme cohomology. |
| SchemeAndStackFoundations §§4.7–4.8 | `1` | Adic thickening systems, level-preserving `Spf`, and completion systems. The bounded p-adic formal-scheme carrier, its small étale site and the abstract gluing adapter are constructed in §1.0; the prismatic specializations are §§2.4, 2.17. |
| CrystallineCohomology §§CR.DDR.4.5, CR.DDR.5.18–CR.DDR.5.22 | `2` | Derived de Rham–Witt as the p-completed polynomial extension, its smooth crystalline comparison and quasiregular semiperfect PD identification; the prismatic comparison is §2.19. |
| EnhancedDerivedSheaves Layers E5:abstract and E5:descent | `2` | Symmetric monoidal stable ∞-categories and commutative algebra objects (E5:abstract); descendability and module descent (E5:descent); conservativity and colimits require the stated uniform descendability index. All coherences survive completion. |
| SchemeAndStackFoundations §1.1 | `2` | Affine module and finite locally free faithfully flat descent (`qcoh_fpqc_descent`); complete-projective effectivity is constructed in §2.28. |
| DerivedDeRhamCohomology §§3.1–3.6 | `1` | Polynomial Cartier maps and completed derived Cartier comparison, compatible with cotangent transitivity and the conjugate filtration. |
| PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25; §§P4.15.2–P4.15.5 | 0–2 | Integral perfectoid predicate, tilt, `A_inf`, `θ` and primitive `ξ`; prisms, rigidity, regular prismatic envelopes, completed perfection and perfect-prism equivalence; initial Fontaine prism; oriented smooth affine `Δ`, Hodge–Tate comparison, completed base change and Construction 7.6, QRSP initial prism and retract argument; André covers and surjective semiperfectoid perfectoidization. Extensions to an invertible ideal, formal schemes and general animated inputs are identified below. |
| PerfectoidQuotients §0.0; §§0.1, 0.3 | 0–2 | `perfectoid_tor_independence` and `fontaine_tor_independence` for completed perfectoid maps; `delta_etale_extension`, `completeEtale_algebraization`, `delta_witt2_etale`, `delta_derivedCompletion`, `perfectPrism_completeEtale_lift` with the stated complete étale hypotheses. Quasisyntomic/QRSP predicates, p-completed cotangent consequences and bounded Witt torsion retain their original hypotheses; the semiperfectoid universal quotient is supplied by PerfectoidSpaces §§P4.15.2–P4.15.5. |
| EnhancedDerivedSheaves §E1.9; DerivedDeRhamCohomology §5.23 | `1` | `perfect_proper_pushforward` for perfect complexes tensored with bounded finitely presented, target-flat modules of proper support over arbitrary bases; effectivity and perfectness for the compatible proper smooth p-adic tower. |
| AInfCohomology §AI.7.2; EnhancedDerivedSheaves §§E5:presentability.2, E5:spectra-comparison | `2` | `AInf.Trace.tateFinite`, `AInf.Trace.tateDiagonal`, `spectra`, `eilenbergMacLane` and `moduleSpectra_equiv_derived` for the underlying-spectrum power operation of §2.24. |
| EnhancedDerivedSheaves §E5:animation.2 | `2` | `frobenius_zero_on_positive_homotopy` and `perfection_isDiscrete` for characteristic-p animated rings. |
| EtaleCohomologyFoundations §§0.5–0.6, F.0.4, F.1, F.2.1 | `2` | Qcqs continuity, `VanishingCycles.universalHomeomorphismEtaleEquivalence`, `VanishingCycles.finiteCoefficientCohomology` and `VanishingCycles.properBaseChange` for arbitrary torsion. |

Idempotent lifting uses Tau Ceti `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` and `TauCeti.exists_projective_quotient_smul_top_linearEquiv` (a91d3aaf, `RingTheory/AdicCompletion/Idempotent.lean`, `Algebra/Module/Projective/Lift.lean`): the first needs complete source algebra and prescribed kernel, the second a projective ambient module with complete endomorphism ring. The compatible-tower equivalence is the categorical adapter of §2.28.

CrystallineCohomology §§CR.DDR.4.5, CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22 supply `DerivedDeRham.derivedDeRhamWitt`, `qrspWittControl`, `qrspPdDerham`, `acrysStructure` and `regularFpCrystallineCech`. These own the `F_p` polynomial extension, its PD identification on quasiregular semiperfect rings and the regular crystalline Čech computation; §2.19 owns the comparison with `Δ` over every perfect `k`.

### Existing library interface

| Declaration | Provision |
| --- | --- |
| Mathlib `Nat.Prime.dvd_choose_self` | For `p` prime and `0<i<p`, `p` divides `binomial(p,i)`. Divide integer coefficients, not elements of the target ring. |
| Mathlib `add_pow` | Binomial expansion in a commutative semiring, including both endpoint terms. |
| Mathlib `FiniteField.pow_card` | Every element of a finite field satisfies `x^card=x`; applied to `F_p` and integer Fermat divisibility. |
| Mathlib `TrivSqZeroExt` | Existing square-zero carrier `R` times `M` and its central-action commutative ring structure. Multiplication uses the two cross actions. |
| Mathlib `TrivSqZeroExt.inr_injective` | The inclusion of the square-zero module is injective. |
| Mathlib `TrivSqZeroExt.snd_mul` | The second product coordinate is the sum of the two cross actions. |
| Mathlib `TrivSqZeroExt.snd_pow` | With central action, the second coordinate of `x^n` is `n` times `x.fst^(n-1)` acting on x.snd, including the natural predecessor convention at zero. |
| Mathlib `TruncatedWittVector` | Existing length-n p-typical Witt-vector carrier and transported Witt ring structure, not the pointwise product ring. |
| Mathlib `TruncatedWittVector.ext` | Equality by equality of every coordinate. |
| Mathlib `WittVector.truncate` | Ring homomorphism from infinite Witt vectors to the first `n` coordinates. |
| Mathlib `WittVector.truncate_surjective` | Every truncated Witt vector lifts. A chosen zero-padding lift is not asserted to be a ring map. |
| Mathlib `WittVector.coeff_truncate` | Coordinates below `n` are unchanged by truncation. |
| Mathlib `WittVector.map` | Witt ring map induced by a coefficient-ring map. |
| Mathlib `WittVector.map_coeff` | The induced Witt map acts coefficientwise. |
| Mathlib `WittVector.ghostComponent` | Each ghost coordinate is a ring homomorphism on infinite Witt vectors. |
| Mathlib `WittVector.ghostComponent_apply` | The nth ghost coordinate evaluates the nth Witt polynomial. |
| Mathlib `WittVector.constantCoeff` | The zeroth coordinate as a ring homomorphism. |
| Mathlib `wittPolynomial_zero` | The zeroth Witt polynomial is `X_0`. |
| Mathlib `wittPolynomial_one` | The first Witt polynomial is `p X_1+X_0^p` over the declared coefficient ring. |
| Mathlib `IsLocalization` | Existing localization property on the algebra map, with its actual ring and algebra structures; no new localization carrier. |
| Mathlib `IsLocalization.map_units` | Elements of the denominator submonoid map to units. |
| Mathlib `IsLocalization.algebraMap_isUnit_iff` | An element becomes a unit exactly when it divides an element of the denominator submonoid. No domain assumption. |
| Mathlib `IsLocalization.mk'` | The fraction `a/s` in any algebra carrying the localization instance. |
| Mathlib `IsLocalization.mk'_spec'` | The image of `s` times the fraction `a/s` equals the image of a. |
| Mathlib `IsLocalization.lift` | Extends an actual ring map that sends every denominator to a unit; independent of representatives. |
| Mathlib `IsLocalization.lift_eq` | The lifted ring map agrees with the original map on every element of the base ring. |
| Mathlib `IsLocalization.ringHom_ext` | Ring maps out of a localization are equal when their composites with the base algebra map are equal. |
| Mathlib `Submodule.mul_induction_on'` | Dependent induction on membership in a product of submodules: prove products of members and closure under addition, retaining the membership hypotheses for each summand. |
| Mathlib `Ideal.Quotient.factorPow` | The existing ring map `A/I^m` to `A/I^n` for `n≤m`, acting as the identity on representatives. |
| Mathlib `AdicCompletion` | The inverse-limit subtype of compatible module quotients. It is not asserted adically complete for arbitrary infinitely generated ideals. |
| Mathlib `AdicCompletion.AdicCauchySequence` | The existing carrier of sequences whose mth and nth terms agree modulo `I^m` for `m≤n`. |
| Mathlib `AdicCompletion.mk` | The existing map from an adic Cauchy sequence to its compatible system of quotient classes. |
| Mathlib `AdicCompletion.transitionMap_comp_eval_apply` | The coordinates of an element of the completion commute with the existing quotient transition maps. |
| Mathlib `AdicCompletion.evalₐ` | The normalized algebra evaluation from the completion to `A/I^n`, including the comparison with the underlying module quotient by `I^n` times top. |
| Mathlib `AdicCompletion.evalₐ_mk` | The nth normalized coordinate of the element of the completion represented by an adic Cauchy sequence is the class of its nth term. |
| Mathlib `AdicCompletion.ext_evalₐ` | Equality of all normalized quotient coordinates implies equality in the actual completion. |
| Mathlib `AdicCompletion.evalₐ_of` | The nth coordinate of a base element under the canonical completion map is its class modulo `I^n`. |
| Mathlib `AdicCompletion.algebraMap_apply` | The algebra map to the completion agrees with AdicCompletion.of under the scalar tower. |
| Mathlib `AdicCompletion.factor_evalₐ_eq_eval` | Relates normalized ideal-quotient evaluation and the underlying module-quotient evaluation through the quotient factor map. |
| Mathlib `AdicCompletion.pow_smul_top_eq_ker_eval` | For `I` finitely generated, `I^n` times the completed module equals the kernel of its nth evaluation. Finiteness of the module and Noetherianity of the ring are not assumed. |
| Mathlib `AdicCompletion.isAdicComplete` | For `I` finitely generated, the existing completion is I-adically complete as a module; its proof uses the exact kernel-power comparison. |
| Mathlib `Ideal.jacobson` | The Jacobson radical (infimum of maximal ideals containing an ideal); the hypothesis `p ∈ rad(A)` of the monoid Frobenius and of the extension to `M^gp`. |
| Mathlib `Ideal.mem_jacobson_bot` | Membership in the radical of zero is equivalent to all elements `x*y+1` being units. |
| Mathlib `Ideal.isPrime_span_singleton_of_prime` | The ideal generated by a prime element is prime. |
| Mathlib `Nat.prime_iff_prime_int` | A natural prime is a prime element of the integers. |
| Mathlib `Localization.AtPrime` | The existing localization at the complement of a prime ideal; no new p-local ring carrier. |
| Mathlib `IsLocalization.AtPrime.isLocalRing` | A ring localized at a prime ideal is local, at its actual IsLocalization model. |
| Mathlib `Ideal.span` | Existing ideal span of a subset, as an A-submodule of A. |
| Mathlib `Ideal.subset_span` | Each generator belongs to its ideal span. |
| Mathlib `Ideal.span_le` | Containment of a span is equivalent to containment of every generator. |
| Mathlib `Submodule.span_induction` | Dependent span induction with generator, zero, addition and scalar-multiplication cases. |
| Mathlib `Function.iterate_zero_apply` | The zeroth function iterate is the identity. |
| Mathlib `Function.iterate_succ_apply'` | The successor iterate applies the function to the previous iterate. |
| Mathlib `RingHom.ker` | The ordinary ideal kernel of a ring homomorphism. |
| Mathlib `RingHom.mem_ker` | Kernel membership is equality of the image with zero. |
| Mathlib `Ideal.Quotient.mk` | The existing quotient ring projection. |
| Mathlib `Ideal.Quotient.eq_zero_iff_mem` | A quotient projection vanishes exactly on the ideal. |
| Mathlib `Ideal.Quotient.lift` | A ring map annihilating the ideal factors through the existing quotient ring. |
| Mathlib `Ideal.Quotient.lift_mk` | The quotient lift evaluates on projected representatives as the original map. |
| Mathlib `Ideal.Quotient.mk_surjective` | Every quotient ring element has a representative. |
| Mathlib `Ideal.Quotient.ringHom_ext` | Ring maps from a quotient agree if they agree after its projection. |
| Mathlib `MvPolynomial` | Multivariate polynomial rings; the free `δ_log-ring` on one generator is a polynomial ring on `x`, `δ_log(x)`, `δ^n(δ_log(x))`. |
| Mathlib `MvPolynomial.X` | The variables of a polynomial ring |
| Mathlib `Module.FaithfullyFlat` | Faithful flatness of a module, used for the Frobenius of free δ-rings and for covers |
| Mathlib `Module.Flat` | Flatness of a module |
| Mathlib `WittVector` | the p-typical Witt-vector carrier and its existing ring operations; the cofree `δ` structure is a target below |
| Mathlib `WittVector.frobenius` | The Witt vector Frobenius as a ring endomorphism |
| Mathlib `WittVector.frobenius_bijective` | The Witt vector Frobenius is bijective over a perfect ring of characteristic `p` |
| Mathlib `WittVector.teichmuller` | The Teichmüller lift `R →*` 𝕎 `R` as a monoid homomorphism; it gives the `rank-1` prelog structures R♭ `→ W(R♭)` and M♭ `→ A_inf(R)`. |
| Mathlib `WittVector.isAdicCompleteIdealSpanP` | `W(k)` is p-adically complete for `k` perfect of characteristic `p` |
| Mathlib `PerfectRing` | Perfect rings of characteristic `p` |
| Mathlib `Module.Invertible` | Invertible modules: the Cartier divisor condition on a prism ideal |
| Mathlib `Submodule.IsPrincipal` | Principal ideals: orientability of a prism |
| Mathlib `nonZeroDivisors` | The submonoid of nonzerodivisors |
| Mathlib `IsReduced` | Reduced rings |
| Mathlib `TensorProduct` | Tensor products of modules; carrier of `A ⊗_{Z_(p)[M]} Z_(p)[N]` in the extension of `δ_log` along `M ⊂ N ⊂ M^gp`. |
| Mathlib `CategoryTheory.SimplicialObject` | Simplicial objects of a category |
| Mathlib `Algebra.Etale` | Étale algebras |
| Mathlib `DividedPowers` | Divided power structures on an ideal; the PD ideals `J` of `δ_log-PD` triples. |
| Mathlib `RingTheory.Sequence.IsRegular` | Successive-element regularity on a module together with a nonzero final quotient. The bridge to Koszul regularity, including conventions allowing zero quotients, is an explicit DerivedModuleAlgebra §§0.1–0.17, 0.25 input; this structure alone does not supply that bridge. |
| Mathlib `PowerSeries` | Formal power series; the ring `W(k)[[u]]` of the Breuil–Kisin prelog prism. |
| Mathlib `PadicInt` | The ring of p-adic integers |
| Mathlib `Polynomial.cyclotomic` | Cyclotomic polynomials: `[p]_q` is the p-th one |
| Mathlib `Polynomial.cyclotomic_prime` | The p-th cyclotomic polynomial is `1 + X +` … `+ X^(p−1)` |
| Mathlib `Polynomial.eval_one_cyclotomic_prime` | The p-th cyclotomic polynomial takes the value `p` at `1` |
| Mathlib `Polynomial.IsEisensteinAt` | Eisenstein polynomials at an ideal |
| Mathlib `CategoryTheory.GrothendieckTopology` | Grothendieck topologies on a category; the étale and flat topologies on log prismatic sites, the Kummer étale and quasisyntomic topologies are instances. |
| Mathlib `CategoryTheory.Presheaf.IsSheaf` | The sheaf condition for a presheaf with values in a category; used for `O` and its reduction. |
| Mathlib `CategoryTheory.GrothendieckTopology.over` | The induced topology on a slice category; the slice description of the relative site (Remark 4.3) refines it. |
| Mathlib `CategoryTheory.Functor.IsCocontinuous` | Cocontinuous (cover-lifting) functors of sites; the functor `μ` of Construction 4.4 is one. |
| Mathlib `CategoryTheory.Functor.sheafPushforwardCocontinuous` | The pushforward of sheaves along a cocontinuous functor, by right Kan extension; this is `ν_*` on sheaves. |
| Mathlib `Algebra.Smooth` | Ordinary formally smooth, finitely presented algebras. For the p-completely smooth convention used here, smoothness modulo `p` is combined with derived p-completeness and p-complete flatness through DerivedModuleAlgebra §§1.1–1.9 and DerivedDeRhamCohomology §§1.10–1.23; this declaration alone does not establish the completed notion. |
| Mathlib `DerivedCategory` | The derived category of an abelian category (homological complexes up to quasi-isomorphism); a `1-categorical` shadow of `D(A)` in which log prismatic cohomology lives. |
| Mathlib `Ideal.Cotangent` | `I/I²` as a module over `R/I`; the Breuil–Kisin twist of `A/I-modules` is built from it. |
| Mathlib `TensorPower` | Tensor powers of a module; `(I/I²)^{⊗i}`. |
| Mathlib `AlgebraicTopology.alternatingCofaceMapComplex` | The unnormalised cochain complex of a cosimplicial object; the Čech–Alexander complex and Lemma 5.4 use it. |
| Mathlib `KaehlerDifferential` | Kähler differentials `Ω[S⁄R]` as the cotangent module of the diagonal ideal; the non-log `Ω^1` with which log differentials are compared `(Ω^1 → Ω^1_log)`. |
| Mathlib `KaehlerDifferential.D` | The universal derivation `d` : `S → Ω[S⁄R]`. |
| Mathlib `WittVector.frobenius_verschiebung` | `F(V(x)) =` p·x for every commutative ring; gives `ψ(I) ⊂ pW(A/I)`. |
| Mathlib `Module.Projective` | Projective modules, for the descent of finite projective modules |
| Mathlib `Module.Finite` | Finitely generated modules, for the descent of finite projective modules |
| Mathlib `IsAdicComplete` | Classical I-adic completeness (Hausdorff and precomplete), the form of p-completeness available for rings with bounded `p^∞-torsion` |
| Mathlib `Ideal.map` | the ideal generated by the image of an ideal; the ideals `(φ^r)^*(I) = φ^r(I)A` of a transversal prism |
| Mathlib `Ideal.Quotient.factor` | the ring map `R/S → R/T` for `S ≤ T`; the transition maps of the tower `B/Fil^i_N B` |
| Mathlib `frobenius` | the Frobenius `x ↦ x^p` of a ring of characteristic `p`, the endomorphism σ of `B` in Lemma 9.2 |
| Mathlib `Units` | the unit group `A^×`, containing the rank-one units on which the prismatic logarithm is defined |
| Mathlib `Ideal.smul_top_eq_map` | `I` • ⊤ `=` (I.map (algebraMap `R` S)).restrictScalars `R`: the scalar-extension submodule is the extended ideal |
| Mathlib `Ideal.map_pow` | map `f (I ^ n) =` (map `f I) ^ n` for ideals of commutative semirings |
| Mathlib `RingHom.FaithfullyFlat` | Faithful flatness of a ring map is Module.FaithfullyFlat for its induced algebra; stable under base change. |
| Mathlib `Perfection` | The perfection `{f` : ℕ `→` α `// f (n+1)^p = f n}` of a monoid (with a CommMonoid instance via Perfection.submonoid); it is the tilt M♭ `= lim_{m ↦ m^p} M` of KY Definition 2.18. |

## How to read the build

Construct the integral delta-algebra API beyond the p-local inputs of PerfectoidSpaces, orientation-free relative cohomology over bounded prisms, its animated extension and general perfectoidization. The smooth Hodge–Tate, crystalline and restricted de Rham comparisons are constructed in Layer 1. Within a layer, the explicit prerequisites determine construction order. Suppliers are consumed by roadmap name and section.

Suggested.lean states the free and cofree δ-ring theorems, Witt reconstruction of perfect p-complete δ-rings, and general orientable-envelope existence. Its module docstring identifies the missing objects needed to state the cohomological comparisons and perfectoidization theorems at the pins. Lean names in the construction targets specify the requested library interfaces; the headline statements in Suggested.lean are identified explicitly in their sections.

## Layer 0: Delta algebra and prisms

Start with integral polynomials on the existing ring carrier. The Witt-section description then constructs the localization and completion operations without cancelling `p`. Delta ideals and free/animated `δ` algebras lead to PD envelopes, distinguished elements, bounded prisms and their regular envelopes. The key distinction is between the ordinary Frobenius function, its congruence modulo `p`, and the extra `δ` operation.

### 0.1–0.7 Integral delta algebra

<a id="s0-1"></a>
<a id="layer-0-delta-addition-correction"></a>

**§0.1 Integral addition correction.**

Define `C_p(x,y)` as minus the sum over `1≤i≤p-1` of `(binomial(p,i)/p) x^i y^(p-i)`. The quotient is an exact natural/integer coefficient, then cast to `R`. Never divide by `p` in `R`.

(BS22, Definition 2.1; p. 13.)

*Needs:* Mathlib `Nat.Prime.dvd_choose_self`.

- Every ring map carries `C_p(x,y)` to `C_p` of the images.
- `C_p(x,0)=0`.
- `C_p(x,y)=C_p(y,x)`.

**Checks.**

- `correction_dyadic`: Over `Z`, `C_2(x,y)=-xy`.
- `correction_cubic`: Over `Z`, `C_3(x,y)=-xy(x+y)`.
- `correction_zero_argument`: `C_p(x,0)=0` in every ring.

<a id="s0-2"></a>
<a id="layer-0-correction-identity"></a>

**§0.2 Cleared-denominator correction identity.**

In every commutative ring, `p C_p(x,y)=x^p+y^p-(x+y)^p`.

Multiplication by `p` need not be injective in `R`.

(BS22, Definition 2.1; p. 13.)

*Needs:* §0.1 and Mathlib `add_pow`.

<a id="s0-3"></a>
<a id="layer-0-delta-frobenius-dictionary"></a>

**§0.3 Delta structure on a ring.**

On the existing ring `R`, a `δ` structure is a function `δ:R→R` with `δ(0)=δ(1)=0`, `δ(x+y)=δ(x)+δ(y)+C_p(x,y)`, and `δ(xy)=x^p δ(y)+y^p δ(x)+p δ(x)δ(y)`. Morphisms are unital ring maps commuting with `δ`. The Frobenius reconstruction and Witt-section equivalence are separate targets below.

`R` is a commutative ring. The elementary polynomial prefix is generalized to rings; subsequent prismatic consumers retain the source `Z_(p)-algebra` hypotheses.

(BS22, Definition 2.1; opening p-local convention; p. 13.)

*Needs:* §0.1.

- Pointwise equality of `δ` gives equality of structures.
- `δ(-x)=-δ(x)-C_p(x,-x)`.
- `δ(1+1)=C_p(1,1)`.

**Checks.**

- `delta_two_forced`: Every `2-δ` structure on `Z` sends `2` to `-1`.
- `delta_zero_operation_rejected`: No `2-δ` structure on `Z` has identically zero `δ`.
- `delta_zero_ring`: The zero ring admits a `δ` structure.
- `delta_product_rule_integers`: Every `2-δ-structure` on `Z` has `δ(4) = −6 = 2²·δ(2) + 2²·δ(2) + 2·δ(2)²` with `δ(2) = −1`: the product rule with its term `p·δ(x)·δ(y)`.

<a id="s0-4"></a>
<a id="layer-0-ordinary-frobenius-lift"></a>

**§0.4 Ordinary Frobenius lift.**

A FrobeniusLift is a unital endomorphism `f` of `R` such that for each `x` there exists `y` with `f(x)=x^p+p y`. Equivalently its reduction modulo `(p)` is Frobenius. The witnesses form a proposition, not a chosen `δ` operation or a derived homotopy.

(BS22, Remarks 2.2 and 2.5; pp. 13, 14.)

*Needs:* Mathlib `Ideal.Quotient.mk` and `Ideal.span`.

- Equality of underlying maps gives equality of lifts.
- `f(x)` and `x^p` have equal images modulo `(p)`.
- The witness condition is equivalent to the quotient equality for all `x`.

**Checks.**

- `lift_on_integers`: The identity on `Z` is a lift.
- `lift_in_characteristic_p`: The identity on `F_p` is a lift.
- `power_not_ring_map`: No lift on `Z` at `p=2` has underlying function `x→x^2`.

<a id="s0-5"></a>
<a id="layer-0-associated-frobenius"></a>

**§0.5 Associated Frobenius endomorphism.**

Construct the ordinary lift `phi_delta(x)=x^p+p δ(x)` from a `δ` structure, for arbitrary commutative rings including p-torsion.

use the given `δ` structure on `R`.

(BS22, Remark 2.2; p. 13.)

*Needs:* §§0.2–0.4.

- Evaluation is `x^p+p δ(x)`.
- `δ(x)=0` implies `φ(x)=x^p`.
- Delta-compatible ring maps commute with associated Frobenius.

**Checks.**

- `phi_rank_one`: A delta-zero element has `φ(x)=x^p`.
- `phi_integer_two`: For the canonical operation on `Z` at `p=2`, `φ(2)=2`, not `4`.
- `phi_zero_ring`: Any two structures on the zero ring give the same lift.

<a id="s0-6"></a>
<a id="layer-0-torsionfree-frobenius-equivalence"></a>

**§0.6 Torsion-free Frobenius reconstruction.**

If multiplication by `p` on `R` is injective, construct an equivalence between `δ` structures and ordinary Frobenius lifts, with forward map Associated Frobenius endomorphism. CharZero alone is not sufficient.

Multiplication by the cast of `p` on `R` is injective; the zero ring is permitted.

(BS22, Remark 2.2; p. 13.)

*Needs:* §§0.3–0.5 and the stated injectivity of multiplication by p.

- The forward map is the associated Frobenius lift.
- The inverse satisfies `p δ(x)=f(x)-x^p`.
- Reconstruction from the associated lift returns the original structure.

**Checks.**

- `reconstruction_integer_value`: At `p=2` the identity on `Z` reconstructs `δ(2)=-1`.
- `reconstruction_rejects_characteristic_p`: Multiplication by `p` is not injective on `F_p`.
- `reconstruction_zero_ring`: Multiplication by `p` is injective on the zero ring.

<a id="s0-7"></a>
<a id="layer-0-frobenius-morphism-reflection"></a>

**§0.7 Frobenius compatibility detects delta morphisms.**

For `δ` rings `R,S` and a ring map `f:R→S`, if multiplication by `p` is injective on `S`, then `f` commutes with `δ` exactly when it commutes with associated Frobenius. No cancellation hypothesis on `R` is needed.

`f` is unital; target multiplication by `p` is injective.

(BS22, Remark 2.2 and Definition 2.1; p. 13.)

*Needs:* §§0.3, 0.5 and injectivity of multiplication by p on the target.

**Checks.**

- The canonical integer structure and the identity map satisfy both compatibilities.
- The projection `Z⊕F_p·ε→Z` from §0.14 has p-torsion in its source; target injectivity suffices.
- The identity between the distinct structures of §0.15 commutes with Frobenius and fails delta compatibility when the target has p-torsion.

**Proof route.** Verify the integral polynomial identities universally, then specialize; cancel `p` only for the explicitly torsion-free reconstruction (BS22 §2, pp.13–16).

*Needs:* Mathlib `Nat.Prime.dvd_choose_self`, Mathlib `add_pow`, Mathlib `Ideal.Quotient.mk`, Mathlib `Ideal.span`.

### 0.8–0.15 Integer and square-zero tests

<a id="s0-8"></a>
<a id="layer-0-integer-delta"></a>

**§0.8 Canonical delta operation on the integers.**

Construct the canonical `δ` structure on `Z` with `D_p(a)=(a-a^p)/p`, using exact integer division. Its associated Frobenius is the identity. This is the integral elementary prefix of the source p-local example.

Negative integers and `p=2` are included.

(BS22, Example 2.6; p. 14.)

*Needs:* §0.6 and Mathlib `FiniteField.pow_card` for integer Fermat divisibility.

- `δ(a)=(a-a^p)/p` in `Z`.
- Associated Frobenius is RingHom.id `Z`.
- `δ(p)=1-p^(p-1)`.

**Checks.**

- `integer_negative_dyadic`: `D_2(-1)=-1`.
- `integer_cubic_value`: `D_3(2)=-2`.
- `integer_zero`: `D_p(0)=0`.

<a id="s0-9"></a>
<a id="layer-0-delta-stable-quotient"></a>

**§0.9 Descent to a delta-stable quotient.**

For a `δ` structure on `R` and an ideal `I`, `δ(I)` contained in `I` is equivalent to existence of a unique `δ` structure on `R/I` compatible with the quotient map.

use the actual ideal and quotient ring.

(BS22, Lemma 2.9; p. 15.)

*Needs:* §§0.1, 0.3 and Mathlib `Ideal.Quotient.mk`, `Ideal.Quotient.lift`.

**Checks.**

- `I=0` recovers the given delta structure.
- `I=R` gives the unique structure on the zero ring.
- For canonical delta on `Z`, `(p)` is Frobenius-stable but not delta-stable, since `δ(p)=1−p^(p−1)` is not in `(p)`; it gives no quotient delta structure.

<a id="s0-10"></a>
<a id="layer-0-square-zero-correction"></a>

**§0.10 Correction polynomial on a square-zero extension.**

Let `B` map to `F_p` and use its central action. In the existing square-zero extension `B` plus `F_p`, the second coordinate of `C_p((a,b),(c,d))` is `(abar^(p-1)-(abar+cbar)^(p-1))`*b+(cbar^(p-1)-(abar+cbar)^(p-1))*`d`.

`B` is commutative; the left action comes from the unital `B→F_p` map and the opposite action is central.

(BS22, Definition 2.1; square-zero calculation; p. 13; PIN-square, snd_mul and snd_pow.)

*Needs:* §0.1 and Mathlib `TrivSqZeroExt.snd_mul`, `TrivSqZeroExt.snd_pow`, `add_pow`.

<a id="s0-11"></a>
<a id="layer-0-witt2-mul-coordinate"></a>

**§0.11 Second coordinate of length-two Witt multiplication.**

On TruncatedWittVector `p 2 R`, `(xy)_1=x_0^p`*y_1+y_0^p*`x_1+p`*x_1*`y_1`.

`R` is arbitrary commutative and unital.

(BS22, Remark 2.4; p. 13.)

*Needs:* Mathlib `WittVector.ghostComponent`, `WittVector.ghostComponent_apply`, `wittPolynomial_one`, `WittVector.truncate_surjective` and `WittVector.coeff_truncate`.

<a id="s0-12"></a>
<a id="layer-0-correction-map-naturality"></a>

**§0.12 Naturality of the integral correction.**

For a unital ring map `f:R→T`, `f(C_p(x,y))=C_p(f(x),f(y))`. This is the naturality assertion of §0.1, with no second construction.

`R` and `T` are commutative rings, including rings with p-torsion.

(BS22, Definition 2.1: integral addition polynomial and its naturality; p. 13.)

*Needs:* §0.1 and integral polynomial evaluation under ring maps.

<a id="s0-13"></a>
<a id="layer-0-integer-cast-delta"></a>

**§0.13 Delta on integer scalars.**

For `δ` structure on `R` and integer a, `δ(a*1_R)` is the cast of the integer `(a-a^p)/p`. Consequently a nonzero ring of characteristic `p` has no `δ` structure.

Do not assume p-torsionfreeness of `R`.

(BS22, Example 2.6; p. 14.)

*Needs:* §§0.1–0.3, 0.8 and the unital integer ring map.

<a id="s0-14"></a>
<a id="layer-0-square-zero-delta-family"></a>

**§0.14 Delta structures on a square-zero extension.**

For a `δ` ring `B` mapping to `F_p` and `λ` in `F_p`, define `delta_lambda(a,b)=(delta_B(a),(λ-abar^(p-1))*b)` on the existing central square-zero extension `B` plus `F_p`. This is a `δ` structure with associated Frobenius `(a,b)→(phi_B(a),0)`.

The left scalar action on `F_p` is induced by the displayed ring map and the opposite action is central.

(BS22, Remark 2.2 torsion boundary; square-zero example; p. 13; PIN-square, TrivSqZeroExt and central-action CommRing structure.)

*Needs:* §§0.3, 0.5, 0.8, 0.10, 0.13 and Mathlib `TrivSqZeroExt` with its central-action commutative ring structure.

On `TrivSqZeroExt ℤ (ZMod 2)`, use the central opposite integer action and the standard square-zero commutative ring structure.

- On `TrivSqZeroExt ℤ (ZMod 2)`, there is a family of 2-δ-structures indexed by `λ∈ZMod 2` with `δ_λ(a,b)=(D_2(a),(λ−abar)b)`.
- The first coordinate is `delta_B(a)`.
- The second coordinate is `(λ-abar^(p-1))*b`.
- Frobenius is `inl(phi_B(a))`, independent of `λ`.

**Checks.**

- `square_zero_parameter`: For `B=Z` and `ε=(0,1)`, `delta_lambda(ε)=λ*ε`.
- `square_zero_addition_correction`: `delta_lambda(1+ε)=(λ-1)*ε`; omitting the correction fails.
- `square_zero_base_compatibility`: Restriction along inl is the canonical integer `δ`.

<a id="s0-15"></a>
<a id="layer-0-frobenius-forgetful-not-injective"></a>

**§0.15 Distinct delta structures with the same Frobenius.**

For `λ` different from `μ` in `F_p`, the square-zero structures on `B` plus `F_p` differ but have the same associated lift. With `B=Z` the ring has characteristic zero; with `B=Z_(p)` it is p-local. Ordinary Frobenius data need not determine `δ`.

The dyadic integer witness has parameters 0 and 1: the operations differ on `ε`, their Frobenius maps agree everywhere, and the identity ring map is not delta-compatible.

The base and scalar actions are those of Delta structures on a square-zero extension; `λ` and `μ` are distinct.

(BS22, Remarks 2.2-2.3 and Example 2.6; square-zero witness; pp. 13, 14.)

*Needs:* §§0.5, 0.14 and Mathlib `TrivSqZeroExt.inr_injective`.

**Checks.**

- On `Z⊕F₂·ε`, the parameters 0 and 1 give `δ₀(ε)=0` and `δ₁(ε)=ε≠0`.
- Both associated Frobenius maps send `(a,b)` to `(a,0)`, so their equality does not detect the parameter.
- The identity ring map between these structures is Frobenius-compatible and fails delta compatibility; with parameter 1, `φ(ε)=ε²=0` although `ε` is not rank one.

**Proof route.** Verify the integral polynomial identities universally, then specialize; cancel `p` only for the explicitly torsion-free reconstruction (BS22 §2, pp.13–16).

*Needs:* [§0.6](#s0-6), Mathlib `FiniteField.pow_card`, [§0.3](#s0-3), [§0.1](#s0-1), [§0.2](#s0-2), Mathlib `TrivSqZeroExt.snd_mul`, Mathlib `TrivSqZeroExt.snd_pow`, Mathlib `add_pow`, Mathlib `WittVector.ghostComponent`, Mathlib `WittVector.ghostComponent_apply`, Mathlib `wittPolynomial_one`, Mathlib `WittVector.constantCoeff`, Mathlib `WittVector.map_coeff`, Mathlib `WittVector.truncate`, Mathlib `WittVector.truncate_surjective`, Mathlib `WittVector.coeff_truncate`, Mathlib `WittVector.map`, [§0.5](#s0-5), Mathlib `TrivSqZeroExt`, Mathlib `TrivSqZeroExt.inr_injective`.

### 0.16–0.21 Witt sections

<a id="s0-16"></a>
<a id="layer-0-witt2-add-coordinate"></a>

**§0.16 Second coordinate of length-two Witt addition.**

On TruncatedWittVector `p 2 R`, `(x+y)_1=x_1+y_1+C_p(x_0,y_0)`, for arbitrary commutative `R`.

use the existing Witt ring operations, not pointwise operations.

(BS22, Remark 2.4; p. 13.)

*Needs:* §0.1 and Mathlib `WittVector.ghostComponent`, `wittPolynomial_zero`, `wittPolynomial_one`, `WittVector.truncate_surjective`, `WittVector.coeff_truncate`.

<a id="s0-17"></a>
<a id="layer-0-delta-witt-section-equivalence"></a>

**§0.17 Delta structures as Witt-vector sections.**

For arbitrary `R`, construct an equivalence between `δ` structures and unital ring maps `s:R→TruncatedWittVector p 2 R` whose first coordinate is `s(x)_0=x`. Send `δ` to `s(x)=(x,δ(x))`; recover `δ` from coordinate one. This is a first-coordinate section, not a ghost-map section.

no p-torsionfreeness hypothesis on `R`.

(BS22, Remark 2.4; p. 13.)

*Needs:* §§0.3, 0.5, 0.11, 0.16 and Mathlib `TruncatedWittVector.ext`, `WittVector.constantCoeff`.

- The section has coordinates `(x,δ(x))`.
- The inverse recovers coordinate one.
- `s(x)_0^p+p*s(x)_1` equals `phi_delta(x)`.
- Existence of this equivalence on the pinned length-two Witt carrier, with coordinate one equal to the specified delta operation.

**Checks.**

- `witt_section_integer_two`: At `p=2`, the canonical integer δ-structure gives a section sending `2` to `(2,−1)`, with ghost-one coordinate `2`.
- `witt_no_section_in_characteristic_p`: There is no first-coordinate ring section for nonzero `F_p`.
- `witt_sections_distinguished_despite_ghost`: Different square-zero parameters give distinct sections with identical ghost-one composites.

<a id="s0-18"></a>
<a id="layer-0-witt2-coefficient-map"></a>

**§0.18 Coefficient map on length-two Witt vectors.**

For a ring map `f:R→T` construct `witt2Map(f):W_2(R)→W_2(T)` with both Witt coordinates mapped by `f`, using the existing TruncatedWittVector `p 2` carrier.

`R,T` are commutative rings. No torsion-freeness or condition on the Jacobson radical.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §0.12 and Mathlib `WittVector.map`, `WittVector.map_coeff`, `WittVector.truncate`, `WittVector.truncate_surjective`, `WittVector.coeff_truncate`.

- The jth coordinate of `witt2Map(f)(z)` equals `f(z_j)`; the separate lemma target supplies this API.
- The identity ring map induces the identity Witt map.
- `witt2Map(g` composed with `f)=witt2Map(g`) composed with `witt2Map(f)`.
- For a ring map `f:R→S` and `x∈W(R)`, `witt2Map(f)(truncate₂(x)) = truncate₂(WittVector.map(f)(x))`.

**Checks.**

- `witt2_map_identity`: `witt2Map(id)(z)=z`.
- `witt2_map_torsion_coordinate`: The image of (0,1) in `W_2(Z)` under reduction to `W_2(F_2)` has coordinates (0,1), although both target ghost coordinates vanish.
- `witt2_map_zero_target`: Any coefficient map to the zero ring sends every length-two Witt vector to zero.

<a id="s0-19"></a>
<a id="layer-0-witt2-coefficient-map-coeff"></a>

**§0.19 Coordinates of the Witt coefficient map.**

For `j` in Fin `2`, `(witt2Map(f)(z))_j=f(z_j)`. This is the projection API promoted for consumers.

`f` is a unital map of commutative rings.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §0.18 and Mathlib `TruncatedWittVector.ext`.

<a id="s0-20"></a>
<a id="layer-0-witt2-unit-criterion"></a>

**§0.20 Units in length-two Witt vectors.**

For `z=(a,b)` in `W_2(R)`, `z` is a unit if and only if both a and `a^p+p*b` are units of `R`.

`R` is an arbitrary commutative ring, possibly zero.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §§0.11, 0.16 and the two-coordinate inverse equations on Mathlib `TruncatedWittVector`.

<a id="s0-21"></a>
<a id="layer-0-witt-section-coordinates"></a>

**§0.21 Coordinates of the delta Witt section.**

The section associated to `δ` sends `x` to the length-two vector `(x,δ(x))`. This is the coordinate formula for the section of §0.17, with no second section construction.

`δ` is a structure on the existing commutative ring.

(BS22, Remark 2.4 and the section coordinate formula; p. 13.)

*Needs:* §0.17.

**Proof route.** Verify the integral polynomial identities universally, then specialize; cancel `p` only for the explicitly torsion-free reconstruction (BS22 §2, pp.13–16).

*Needs:* [§0.2](#s0-2), Mathlib `WittVector.ghostComponent`, Mathlib `WittVector.ghostComponent_apply`, Mathlib `wittPolynomial_zero`, Mathlib `wittPolynomial_one`, Mathlib `WittVector.map`, Mathlib `WittVector.map_coeff`, Mathlib `WittVector.truncate`, Mathlib `WittVector.truncate_surjective`, Mathlib `WittVector.coeff_truncate`, [§0.12](#s0-12), [§0.3](#s0-3), [§0.5](#s0-5), [§0.11](#s0-11), Mathlib `TruncatedWittVector`, Mathlib `TruncatedWittVector.ext`, Mathlib `WittVector.constantCoeff`.

### 0.22–0.28 Localization

<a id="s0-22"></a>
<a id="layer-0-delta-localization"></a>

**§0.22 Localization of a delta structure.**

Let `B` be an A-algebra carrying IsLocalization `S B` and let `i:A→B` be its algebra map. Given a `δ` structure on A and units `i(φ(s))` for every `s` in `S`, construct a `δ` structure localize on `B` compatible with `i`. No injectivity of `i` or multiplication by `p` is required.

`A,B` are commutative rings; `S` is a submonoid of A. The image-unit condition is in `B`; it is not an assertion that `φ(S)` is literally contained in `S`.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §§0.17–0.20 and Mathlib `IsLocalization`, `IsLocalization.map_units`, `IsLocalization.lift`, `IsLocalization.lift_eq`, `IsLocalization.ringHom_ext`.

- `delta_B(i(a))=i(delta_A(a))`; supplied by Compatibility with the localization map.
- Every `δ` structure on `B` compatible with `i` equals localize; supplied by Uniqueness of localized `δ` data.
- For `z=a/s`, `i(s)^p`*i(phi(s))*`delta_B(z)=i(s)^p`*i(delta(a))-i(a)^p*`i(δ(s))`; supplied by Delta of a fraction.
- Existence and uniqueness of the compatible structure on any `IsLocalization S B` model under the image-unit hypothesis.

**Checks.**

- `delta_localization_identity`: The identity localization recovers the original `δ` structure.
- `delta_localization_zero`: A zero localization has the unique zero `δ` operation.
- `delta_localization_rational_value`: Localizing the canonical `2-δ` structure on `Z` in `Q` gives `δ(1/3)=1/9`.
- `delta_localization_torsion_survives`: In the localization of `Z` plus `F_2*ε` at powers of (3,1), the `λ=1` operation extends, `ε` remains nonzero, and `δ(ε)=ε`. A p-torsionfree-quotient substitute fails.

<a id="s0-23"></a>
<a id="layer-0-localized-delta-on-base"></a>

**§0.23 Compatibility with the localization map.**

The constructed localize structure satisfies `delta_B(i(a))=i(delta_A(a))` for every a.

The hypotheses and unit witnesses are those of Localization of a `δ` structure.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §0.22 and Mathlib `IsLocalization.lift_eq`.

<a id="s0-24"></a>
<a id="layer-0-delta-localization-unique"></a>

**§0.24 Uniqueness of localized delta data.**

Under the localization construction hypotheses, every `δ` structure `e` on `B` compatible with `i:A→B` equals localize. In particular the construction is independent of proofs of the image-unit condition.

`B` carries the actual IsLocalization `S B` instance. Compatibility means equality of `δ` operations on the image of A, not merely compatibility of Frobenius.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §§0.17, 0.19–0.20, 0.22 and Mathlib `IsLocalization.ringHom_ext`, `TruncatedWittVector.ext`.

<a id="s0-25"></a>
<a id="layer-0-delta-localization-criterion"></a>

**§0.25 Criterion for extension across a localization.**

A `δ` structure on A extends compatibly to `B=S^(-1)A` if and only if each `i(φ(s))` is a unit in `B`. When it extends it is unique. Equivalently each `φ(s)` divides some element of `S`.

A and `B` are commutative rings; IsLocalization `S B` specifies `i`.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §§0.5, 0.20, 0.22–0.24 and Mathlib `IsLocalization.algebraMap_isUnit_iff`.

<a id="s0-26"></a>
<a id="layer-0-delta-localization-universal"></a>

**§0.26 Universal property in delta rings.**

Let `e` be any compatible extension of `d` from A to the localization `B`. For a delta-compatible ring map `f:A→C` sending `S` to units, there is a unique ring map `g:B→C` extending `f` and commuting with `δ`. Its underlying map is the existing IsLocalization.lift.

`C` is a commutative ring with a specified `δ` structure; no p-torsionfreeness of `C`.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §§0.17, 0.19–0.20, 0.22–0.24 and Mathlib `IsLocalization.lift`, `IsLocalization.lift_eq`, `IsLocalization.ringHom_ext`.

<a id="s0-27"></a>
<a id="layer-0-delta-localization-fraction"></a>

**§0.27 Delta of a fraction.**

For `z=mk'(B,a,s)`, the constructed `δ` satisfies `i(s)^p`*i(phi(s))*`delta_B(z)=i(s)^p`*i(delta(a))-i(a)^p*`i(δ(s))`. The coefficient of `delta_B(z)` is a unit, so this determines the value without dividing by `p`.

The data and unit condition are those of Localization of a `δ` structure; a is in A and `s` is in `S`.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §§0.3, 0.5, 0.22–0.23 and Mathlib `IsLocalization.mk'`, `IsLocalization.mk'_spec'`.

<a id="s0-28"></a>
<a id="layer-0-delta-localization-phi-stable"></a>

**§0.28 Frobenius-stable localizations.**

If `φ(S)` is contained in `S`, the given `δ` structure on A extends uniquely to its ordinary localization at `S`, and the extension has the delta-morphism universal property.

The elementary ring statement holds generally; the source instance retains A as a `Z_(p)-algebra`.

(BS22, Lemma 2.15 and proof; p. 16.)

*Needs:* §§0.22–0.26 and Mathlib `IsLocalization.map_units`.

**Proof route.** Localize the length-two Witt section and use its unique extension; the necessary denominator is `φ(s)`, not merely `s` (BS22 Remark 2.16, p.17).

*Needs:* [§0.17](#s0-17), [§0.21](#s0-21), [§0.19](#s0-19), [§0.20](#s0-20), [§0.5](#s0-5), Mathlib `IsLocalization`, Mathlib `IsLocalization.map_units`, Mathlib `IsLocalization.lift`, Mathlib `IsLocalization.lift_eq`, Mathlib `IsLocalization.ringHom_ext`, Mathlib `WittVector.constantCoeff`, Mathlib `WittVector.truncate_surjective`, Mathlib `WittVector.coeff_truncate`, Mathlib `TruncatedWittVector.ext`, Mathlib `IsLocalization.algebraMap_isUnit_iff`, [§0.3](#s0-3), Mathlib `IsLocalization.mk'`, Mathlib `IsLocalization.mk'_spec'`.

### 0.29–0.40 Ideal continuity and completion

<a id="s0-29"></a>
<a id="layer-0-delta-adic-correction"></a>

**§0.29 Ideal membership of the addition correction.**

For any ideal `J` of A, if `y` is in `J` then `C_p(x,y)` is in `J`, for arbitrary `x`.

A is a commutative ring. The ideal need not contain `p`.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §0.1 and closure of an ideal under addition and multiplication by scalars.

<a id="s0-30"></a>
<a id="layer-0-delta-adic-power-loss"></a>

**§0.30 One-power loss on an ideal containing p.**

If `p` is in the ideal `I` of the `δ` ring A, then `δ(x)` is in `I^n` whenever `x` is in `I^(n+1)`, for every `n≥0`. No finite-generation or Noetherian hypothesis.

`I` is an actual ideal in the given commutative `δ` ring; `p` means the integer cast.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §§0.3, 0.29 and Mathlib `Submodule.mul_induction_on'`.

<a id="s0-31"></a>
<a id="layer-0-delta-adic-congruence"></a>

**§0.31 Uniform ideal-adic congruence bound.**

If `p` is in `I` and x-y is in `I^(n+1)`, then `δ(x)-δ(y)` is in `I^n`. Thus the modulus of ideal-adic uniform continuity may be chosen as `n+1`.

`I` need not be finitely generated and A need not be separated.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §§0.3, 0.29–0.30.

<a id="s0-32"></a>
<a id="layer-0-delta-shifted-quotient"></a>

**§0.32 Shifted quotient delta operation.**

For each `n`, construct the function `q_n:A/I^(n+1) → A/I^n` sending the class of a to the class of `δ(a)`. This is a function, not a ring homomorphism, additive map or `δ` structure on either finite quotient.

`p` is prime and lies in `I`; A carries the given `δ` structure.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §0.31 and Mathlib `Ideal.Quotient.mk`.

- `q_n([a]_(n+1))=[δ(a)]_n`; the separate lemma target supplies this evaluation.
- For `m≤n`, reduction from `n` to `m` after `q_n` equals `q_m` after reduction from `n+1` to `m+1`.
- `q_n(0)=0`, including the zero target `A/I^0`.

**Checks.**

- `shifted_quotient_dyadic`: At `p=2`, `I=(2)`, canonical integer δ gives `q_1(2 mod 4)=1 mod 2`.
- `shifted_quotient_triadic`: At `p=3`, `I=(3)`, canonical integer δ gives `q_1(3 mod 9)=1 mod 3`.
- `shifted_quotient_second_level`: At `p=2`, `I=(2)`, canonical integer δ gives `q_2(4 mod 8)=2 mod 4`.
- `shifted_quotient_not_additive`: At `p=2` and `I=(2)`, `q_1(1+1)` is not `q_1(1)+q_1(1)`.
- `shifted_quotient_zero_level`: The map `q_0` has target `A/I^0=0` and sends every input to zero.

<a id="s0-33"></a>
<a id="layer-0-delta-shifted-quotient-mk"></a>

**§0.33 Evaluation of the shifted quotient operation.**

The function `q_n` applied to the class of a modulo `I^(n+1)` is the class of `δ(a)` modulo `I^n`.

The data are those of Shifted quotient `δ` operation.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §0.32.

<a id="s0-34"></a>
<a id="layer-0-delta-shifted-quotient-transition"></a>

**§0.34 Compatibility of shifted quotient operations.**

For `m≤n`, `factorPow(I,m≤n)` composed with `q_n` equals `q_m` composed with `factorPow(I,m+1≤n+1)`, as functions.

`p` is in `I`; use the existing quotient transition ring maps on both sides.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §§0.32–0.33 and Mathlib `Ideal.Quotient.factorPow`.

<a id="s0-35"></a>
<a id="layer-0-delta-classical-completion"></a>

**§0.35 Canonical delta structure on the inverse-limit completion.**

Let `I` contain `p`. On the existing ring `B=AdicCompletion I A` construct a `δ` structure `D` whose normalized nth coordinate is `q_n` applied to the `(n+1)st` coordinate of the input. The construction works without finite generation. Calling `B` complete for its extended-ideal topology, and uniqueness among all compatible `δ` structures, use the separate finite-generation theorem.

A is a commutative `δ` ring; `I` is an ideal with `p` in `I`. Use the actual inverse-limit carrier, coordinate maps and ring structure from the pinned library; do not introduce a replacement completed ring.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §§0.3, 0.12, 0.32–0.34 and Mathlib `AdicCompletion`, `AdicCompletion.transitionMap_comp_eval_apply`, `AdicCompletion.ext_evalₐ`.

- `rho_n(D(x))=q_n(rho_(n+1)(x))`; supplied by Coordinates of completed `δ`.
- `D(i(a))=i(δ(a))`; supplied by Compatibility with the canonical completion map.
- Equal `(n+1)st` input coordinates give equal nth `δ` coordinates; supplied by One-step modulus in the completion kernel topology.

**Checks.**

- `completion_dyadic_scalar`: For `A=Z` and `I=(2)`, `rho_1(D(i(2)))` is the nonzero class of `-1` modulo `2`.
- `completion_unit_ideal`: For `I=A` the inverse-limit ring is zero and `D` sends every element to zero.
- `completion_complete_base`: Under the existing ofAlgEquiv for a complete base, `D` agrees with the given `δ` operation.
- `completion_torsion_survives`: For `A=Z` plus `F_2*ε`, `I=(2)`, and the `λ=1 δ` operation, `ε` remains nonzero in the completion and `D(ε)=ε`.

<a id="s0-36"></a>
<a id="layer-0-delta-completion-coordinate"></a>

**§0.36 Coordinates of completed delta.**

For the constructed `D` on AdicCompletion `I A`, `rho_n(D(x))=q_n(rho_(n+1)(x))` for every `n` and `x`.

`p` is in `I`; finite generation is not required.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §0.35 and Mathlib `AdicCompletion.evalₐ`.

<a id="s0-37"></a>
<a id="layer-0-delta-completion-base"></a>

**§0.37 Compatibility with the canonical completion map.**

If `i:A→AdicCompletion I A` is the existing algebra map, then `D(i(a))=i(δ(a))`.

`p` is in `I`; neither `I` finite nor `i` injective is assumed.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §§0.33, 0.35–0.36 and Mathlib `AdicCompletion.evalₐ_of`, `AdicCompletion.algebraMap_apply`, `AdicCompletion.ext_evalₐ`.

<a id="s0-38"></a>
<a id="layer-0-delta-completion-congruence"></a>

**§0.38 One-step modulus in the completion kernel topology.**

If `rho_(n+1)(x)=rho_(n+1)(y)`, then `rho_n(D(x))=rho_n(D(y))`. Thus `D` is uniformly continuous for the inverse-limit kernel topology with explicit modulus `n+1`.

`p` is in `I`. The inverse-limit topology is specified by the actual quotient kernels; no equality with powers of the extended ideal is assumed without justification.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17.)

*Needs:* §§0.32, 0.35–0.36.

<a id="s0-39"></a>
<a id="layer-0-delta-completion-unique-fg"></a>

**§0.39 Unique classical completion for a finitely generated ideal.**

If `I` is finitely generated and contains `p`, the classical completion AdicCompletion `I A` has a unique `δ` structure for which its canonical algebra map from A is delta-compatible. The constructed operation has the one-step ideal-adic continuity bound. No Noetherianity, p-torsionfreeness, reducedness or separation hypothesis on A is imposed.

I.FG is retained for the kernel-power equality and hence uniqueness among ALL compatible structures, not just those already known continuous.

(BS22, Lemma 2.17, full statement and proof, printed; p. 17; PIN-adic-complete, pow_smul_top_eq_ker_eval and isAdicComplete.)

Use the existing `AdicCompletion I A` carrier for this existence and uniqueness theorem.

*Needs:* §§0.31, 0.35–0.38 and Mathlib `AdicCompletion.pow_smul_top_eq_ker_eval`, `AdicCompletion.isAdicComplete`, with I finitely generated.

**Checks.**

- `I=A` gives the zero completion with its unique delta structure.
- For `A=Z⊕F₂·ε`, `I=(2)` and the parameter-1 structure of §0.14, completion retains the nonzero class `ε` and its delta value `ε`; no torsion-free hypothesis is available.
- For `A=Z×Q`, canonical delta on both factors and `I=(p)`, completion kills the rational factor and gives `Z_p`; separation of `A` is not required.

<a id="s0-40"></a>
<a id="layer-0-frobenius-image-unit-jacobson"></a>

**§0.40 Frobenius image units in radical targets.**

Let `d` be a `δ` structure on A and `f:A→B` any unital ring map. If `p` lies in the Jacobson radical of `B`, then `f(phi_d(x))` is a unit exactly when `f(x)` is a unit, for every `x` in A. No `δ` structure on `B` or `δ` compatibility of `f` is assumed.

A and `B` are commutative unital rings, including zero rings; `p_B` belongs to `jacobson(0_B)`.

(BS22, Remark 2.16, printed; associated Frobenius formula of Remark 2.2; pp. 13, 17.)

*Needs:* §0.5 and Mathlib `Ideal.jacobson`, `Ideal.mem_jacobson_bot`.

**Proof route.** Use the integral addition and product laws to lose one ideal-adic power, then pass to the shifted inverse system (BS22 Lemma 2.17, p.17).

*Needs:* [§0.1](#s0-1), [§0.3](#s0-3), Mathlib `Submodule.mul_induction_on'`, Mathlib `Ideal.Quotient.factorPow`, [§0.12](#s0-12), Mathlib `AdicCompletion`, Mathlib `AdicCompletion.AdicCauchySequence`, Mathlib `AdicCompletion.mk`, Mathlib `AdicCompletion.evalₐ`, Mathlib `AdicCompletion.evalₐ_mk`, Mathlib `AdicCompletion.ext_evalₐ`, Mathlib `AdicCompletion.transitionMap_comp_eval_apply`, Mathlib `AdicCompletion.evalₐ_of`, Mathlib `AdicCompletion.algebraMap_apply`, Mathlib `AdicCompletion.pow_smul_top_eq_ker_eval`, Mathlib `AdicCompletion.factor_evalₐ_eq_eval`, Mathlib `AdicCompletion.isAdicComplete`, Mathlib `Ideal.smul_top_eq_map`, Mathlib `Ideal.map_pow`, [§0.5](#s0-5), Mathlib `Ideal.jacobson`, Mathlib `Ideal.mem_jacobson_bot`.

### 0.41–0.46 Radical targets and p-localization

<a id="s0-41"></a>
<a id="layer-0-witt2-unit-jacobson"></a>

**§0.41 Witt units over a radical base.**

If `p` belongs to `jacobson(0_B)`, a vector `z` in the existing `W_2(B)` is a unit exactly when its zeroth Witt coordinate is a unit.

`B` is a commutative ring and `p_B` is in its Jacobson radical.

(BS22, Remark 2.4; Remark 2.16; pp. 13, 17.)

*Needs:* §0.20 and Mathlib `Ideal.mem_jacobson_bot`.

<a id="s0-42"></a>
<a id="layer-0-delta-localization-jacobson"></a>

**§0.42 Localization with a radical target.**

Given a `δ` structure `d` on A and an existing localization `B` of A at `S`, construct the unique compatible `δ` structure on `B` whenever `p_B` lies in `jacobson(0_B)`. No literal Frobenius stability of `S` and no p-torsionfreeness are imposed.

A and `B` are commutative rings; `B` has Algebra A `B` and IsLocalization `S B`; `p_B` is in the Jacobson radical.

(BS22, Remark 2.16, printed; Lemma 2.15; pp. 16, 17.)

*Needs:* §§0.22–0.26, 0.40–0.41 and Mathlib `IsLocalization.map_units`.

- The operation on `i(a)` is `i(delta_A(a))`.
- Every compatible `δ` structure equals localizeJacobson.
- For any proof of the original Frobenius image-unit condition, localizeJacobson equals localize with that proof.

**Checks.**

- `jacobson_localization_identity`: An identity localization with `p` in the radical recovers `d`.
- `jacobson_localization_zero`: On a zero localization the operation is zero.
- `jacobson_localization_dyadic`: At `p=2` the localized operation sends the integer scalar `2` to `-1`, including in a target with torsion.

<a id="s0-43"></a>
<a id="layer-0-integer-frobenius-identity"></a>

**§0.43 Frobenius of the integer delta structure.**

The associated Frobenius of intDelta `p` on `Z` is the identity ring endomorphism, as specified by §0.8.

(BS22, Example 2.6; integral restriction of its formula; p. 14.)

*Needs:* §§0.5, 0.8.

<a id="s0-44"></a>
<a id="layer-0-p-local-integer-delta"></a>

**§0.44 The canonical p-local integer delta structure.**

On the existing Localization.AtPrime of the prime ideal `(p)` in `Z`, construct the canonical `δ` structure. Its Frobenius is the identity and `p*δ(x)=x-x^p`; the equation specifies division by `p` inside this domain, not a field division operation.

Use the prime-ideal instance from `Nat.prime_iff_prime_int` and `Ideal.isPrime_span_singleton_of_prime`.

(BS22, Example 2.6; Lemma 2.15; pp. 14, 16.)

*Needs:* §§0.8, 0.25, 0.27–0.28, 0.43 and Mathlib `Nat.prime_iff_prime_int`, `Ideal.isPrime_span_singleton_of_prime`, `Localization.AtPrime`, `IsLocalization.AtPrime.isLocalRing`.

- Delta of the image of a in `Z` equals the image of `intDelta(a)`.
- The associated ring endomorphism is the identity.
- For `x`, `p*δ(x)=x-x^p`.
- Every δ-structure on `Z_(p)` agrees with intAtPrime; equality follows on integers and then on inverses of integers prime to `p`.

**Checks.**

- `p_local_integer_prime`: `Delta(p)=1-p^(p-1)`.
- `p_local_integer_negative_dyadic`: At `p=2`, `δ(-1)=-1`.
- `p_local_integer_third`: At `p=2`, if `z` is the localization fraction `1/3` then `9*δ(z)=1`, hence `δ(z)=1/9`.
- `p_local_integer_zero`: `Delta(0)=0`.

<a id="s0-45"></a>
<a id="layer-0-p-local-integer-delta-base"></a>

**§0.45 Restriction to the integer operation.**

The canonical map `Z→Z_(p)` commutes with intDelta and intAtPrime.

use the existing algebra map to Localization.AtPrime `(p)`.

(BS22, Example 2.6; p. 14.)

*Needs:* §§0.23, 0.44.

<a id="s0-46"></a>
<a id="layer-0-p-local-integer-initial"></a>

**§0.46 Initiality of the p-local integer delta ring.**

For commutative `δ` ring `B` in which the image of every integer not divisible by `p` is a unit, there exists exactly one unital ring map `Z_(p)→B` commuting with `δ`. `B` may have nonzero p-torsion or be the zero ring.

the coefficient condition is explicit: for every integer `n` with `p` not dividing `n`, the cast of `n` is a unit of `B`.

(BS22, Example 2.6, printed; p. 14.)

*Needs:* §§0.13, 0.26, 0.44–0.45 and Mathlib `IsLocalization.lift`, `IsLocalization.lift_eq`, `IsLocalization.ringHom_ext`.

**Proof route.** Witt units over a Jacobson-radical base permit localization of the section; specialize the integer operation for initiality (BS22 Remark 2.16, p.17).

*Needs:* [§0.20](#s0-20), Mathlib `Ideal.mem_jacobson_bot`, [§0.40](#s0-40), [§0.22](#s0-22), [§0.23](#s0-23), [§0.24](#s0-24), [§0.26](#s0-26), Mathlib `IsLocalization.map_units`, [§0.8](#s0-8), [§0.6](#s0-6), [§0.5](#s0-5), Mathlib `Nat.prime_iff_prime_int`, Mathlib `Ideal.isPrime_span_singleton_of_prime`, Mathlib `Localization.AtPrime`, Mathlib `IsLocalization.AtPrime.isLocalRing`, Mathlib `IsLocalization.ringHom_ext`, [§0.13](#s0-13), Mathlib `IsLocalization.lift`, Mathlib `IsLocalization.lift_eq`.

### 0.47–0.54 Delta ideals and universal quotients

<a id="s0-47"></a>
<a id="layer-0-delta-span-stability"></a>

**§0.47 Delta stability from ideal generators.**

For a subset `S` of A, the ordinary ideal `J` generated by `S` is delta-stable if and only if `δ(s)` belongs to `J` for every `s` in `S`.

(BS22, Section 2 opening convention and Definition 2.1; Lemma 2.9 and Example 2.10; pp. 13, 15.)

*Needs:* §§0.3, 0.29 and Mathlib `Submodule.span_induction`, `Ideal.subset_span`.

<a id="s0-48"></a>
<a id="layer-0-delta-ideal-closure"></a>

**§0.48 Delta-stabilization of an ideal.**

For an ideal `I` of A, define its delta-stabilization `C_d(I)` to be the ordinary ideal generated by all `δ^n(a)`, for `n` a nonnegative integer and a in `I`. The exponent means iteration of `δ`, with `δ^0` the identity; it is not a ring power or a Witt-coordinate operation.

(BS22, Section 2 opening convention and Definition 2.1; Lemma 2.9 and Example 2.10; pp. 13, 15.)

*Needs:* §0.3 and Mathlib `Ideal.span`, `Function.iterate_zero_apply`, `Function.iterate_succ_apply'`.

- Span of `δ^n(x)` for `x∈I`, `n≥0`.
- `I⊂I_δ`.
- `δ(I_δ)⊂I_δ`.
- For a δ-stable ideal `J`, `I_δ⊂J` iff `I⊂J`.
- `(I_δ)_δ=I_δ`.
- `I⊂J` implies `I_δ⊂J_δ`.

**Checks.**

- `ideal_closure_zero`: The delta-stabilization of the zero ideal is the zero ideal.
- `ideal_closure_stable_fixed`: If `I` is already delta-stable, then `C_d(I)=I`.
- `ideal_closure_prime_is_top`: In every `δ` ring A, `C_d((p))` is the unit ideal: both `p` and `δ(p)=1-p^(p-1)` belong to it, so `1` does too.
- `ideal_closure_not_ordinary_span`: For the canonical `2-δ` structure on the integers, `C_d((2))` differs from the ordinary ideal `(2)`, since `δ(2)=-1`.
- `ideal_closure_minimality_requires_stable`: On `Z` at `p=2`, `I=0` and `J=(2)` satisfy `I_δ⊂J` but `J` is not δ-stable; minimality requires the stated stable-target hypothesis.

<a id="s0-49"></a>
<a id="layer-0-delta-ideal-closure-stable"></a>

**§0.49 Stability of delta-stabilization.**

For ideal `I`, `δ` carries `C_d(I)` into `C_d(I)`.

(BS22, Section 2 opening convention and Definition 2.1; Lemma 2.9 and Example 2.10; pp. 13, 15.)

*Needs:* §§0.47–0.48 and Mathlib `Function.iterate_succ_apply'`.

<a id="s0-50"></a>
<a id="layer-0-delta-ideal-closure-minimal"></a>

**§0.50 Minimality of delta-stabilization.**

For any delta-stable ideal `J`, `C_d(I)` is contained in `J` if and only if `I` is contained in `J`.

(BS22, Section 2 opening convention and Definition 2.1; Lemma 2.9 and Example 2.10; pp. 13, 15.)

*Needs:* §0.48 and Mathlib `Ideal.span_le`, using delta stability of the target ideal.

<a id="s0-51"></a>
<a id="layer-0-delta-kernel-stability"></a>

**§0.51 Kernels of delta morphisms.**

If f:A to `B` is a unital ring map between `δ` rings and `f` commutes with their `δ` operations, then its ordinary ring-homomorphism kernel is delta-stable.

(BS22, Section 2 opening convention and Definition 2.1; Lemma 2.9 and Example 2.10; pp. 13, 15.)

*Needs:* §0.3 and Mathlib `RingHom.ker`, `RingHom.mem_ker`.

<a id="s0-52"></a>
<a id="layer-0-delta-universal-quotient"></a>

**§0.52 Universal delta quotient by an ideal.**

On the existing quotient ring `Q=A/C_d(I)`, construct the unique `δ` structure for which the ordinary quotient map q:A to `Q` commutes with `δ`. This is the universal `δ` A-algebra annihilating `I`, as proved by the separate universal-property theorem.

(BS22, Section 2 opening convention and Definition 2.1; Lemma 2.9 and Example 2.10; pp. 13, 15.)

*Needs:* §§0.9, 0.48–0.50 and Mathlib `Ideal.Quotient.mk`.

- The quotient `δ` operation sends `q(a)` to `q(δ(a))`; this is also a separate projection lemma.
- Every `δ` structure on `A/C_d(I)` compatible with `q` equals the constructed one.
- For a in `I`, the existing quotient projection `q` sends a to zero.

**Checks.**

- `universal_quotient_zero_ideal`: When `I` is the zero ideal, `q` is bijective and intertwines the given `δ` operation with the quotient `δ` operation.
- `universal_quotient_prime_collapses`: For `I=(p)`, the quotient `A/C_d(I)` is the zero ring, expressed by its carrier being a subsingleton.
- `universal_quotient_identity_factor`: For the target quotient itself and `f=q`, the unique endomorphism extending `q` and commuting with `δ` is the identity; equivalently exactly one such endomorphism exists.

<a id="s0-53"></a>
<a id="layer-0-delta-universal-quotient-projection"></a>

**§0.53 Delta compatibility of the quotient projection.**

For a in A, the constructed `δ` operation on `A/C_d(I)` sends `q(a)` to `q(δ(a))`.

(BS22, Section 2 opening convention and Definition 2.1; Lemma 2.9 and Example 2.10; pp. 13, 15.)

*Needs:* §0.52 and Mathlib `Ideal.Quotient.eq_zero_iff_mem`.

<a id="s0-54"></a>
<a id="layer-0-delta-universal-quotient-lift"></a>

**§0.54 Universal property of the delta quotient.**

Let `B` be a `δ` ring and f:A to `B` a unital ring map commuting with `δ` and annihilating `I`. There exists a unique ring map `g:A/C_d(I)` to `B` extending `f` and commuting with the quotient `δ` operation. Its underlying map is the existing ordinary quotient lift.

The quotient structure and this unique factorization use the ordinary ideal quotient.

(BS22, Section 2 opening convention and Definition 2.1; Lemma 2.9 and Example 2.10; pp. 13, 15.)

*Needs:* §§0.50–0.53 and Mathlib `Ideal.Quotient.lift`, `Ideal.Quotient.lift_mk`, `Ideal.Quotient.mk_surjective`, `Ideal.Quotient.ringHom_ext`.

**Checks.**

- For `I=0`, the factorization through the zero-ideal quotient recovers the original delta map.
- For `I=(p)`, its delta closure is the unit ideal, so the universal quotient is zero; an annihilating delta map can only have a zero target.
- For `f` equal to the universal quotient projection, its unique delta-compatible factor is the identity endomorphism of the quotient.

**Proof route.** The `δ` product and sum laws make the ideal generated by all δ-iterates stable; minimality gives the quotient universal property (BS22 Lemma 2.9, p.15).

*Needs:* [§0.3](#s0-3), [§0.29](#s0-29), Mathlib `Ideal.subset_span`, Mathlib `Submodule.span_induction`, Mathlib `Ideal.span`, Mathlib `Function.iterate_zero_apply`, [§0.13](#s0-13), Mathlib `Function.iterate_succ_apply'`, Mathlib `Ideal.span_le`, Mathlib `RingHom.ker`, Mathlib `RingHom.mem_ker`, [§0.9](#s0-9), Mathlib `Ideal.Quotient.mk`, Mathlib `Ideal.Quotient.eq_zero_iff_mem`, Mathlib `Ideal.Quotient.lift`, Mathlib `Ideal.Quotient.lift_mk`, Mathlib `Ideal.Quotient.mk_surjective`, Mathlib `Ideal.Quotient.ringHom_ext`.

<a id="s0-55"></a>
<a id="layer-0-free-delta-ring"></a>

### 0.55 Free δ-rings

Extend the p-local free object of PerfectoidSpaces §P4.15.2 integrally: `Delta.Free(S)=Z[x_(s,n)]`, `δx_(s,n)=x_(s,n+1)`, `φx_(s,n)=x_(s,n)^p+px_(s,n+1)`, for any set `S`. Its universal map sends `x_(s,n)` to `δ^n(f_s)`; `φ` is faithfully flat, and after inverting `p` the `φ^n(x_(s,0))` are polynomial generators.

`S` is any set. The source states the one-generator case over `Z_(p)` (all rings there are `Z_(p)-algebras`); the statement over `Z` has the same proof, since `Z[x_{s,n}]` is p-torsion-free and the displayed `φ` lifts Frobenius, and it base-changes to the p-local statement.

(BS22, Lemma 2.11 (Free δ-rings) and its proof; Corollary 2.12; pp. 15, 16.)

*Needs:* [§0.6](#s0-6), [§0.3](#s0-3), [§0.5](#s0-5), Mathlib `MvPolynomial`, Mathlib `MvPolynomial.X`, Mathlib `Module.FaithfullyFlat`.

`Delta.freeDelta_universal` in Suggested.lean states existence of the δ-structure on `MvPolynomial (S × ℕ) ℤ`, its universal mapping property for arbitrary generator sets, and faithful flatness of its associated Frobenius. The universal map sends `x_{s,n}` to `δ^n(f s)` and is the unique δ-map with the specified values at `x_{s,0}`.

**Checks.**

- `free_delta_frobenius_X`: `φ(x_{s,0}) = x_{s,0}^p + p·x_{s,1}` in Free `S`.
- `free_delta_lift_int_two`: For `p = 2` the δ-map `Free(point) → Z` with `x_0 ↦ 2` sends `x_1` to `−1`.
- `free_delta_finite_stage_not_finite`: For one generator, `Z[x₀]→Z[x₀,x₁]`, `x₀↦x₀ᵖ+px₁`, becomes a polynomial extension after inverting p, so the transition itself is not finite.
- `free_delta_empty`: The free δ-ring on the empty set is `Z` with its canonical δ-structure: the structure map `Z → Free(∅)` is bijective.
- `free_delta_not_free_ring`: The ring map Z[x] `→ Free(point)`, `x ↦ x_0`, is not surjective: `x_1 = δ(x_0)` is not in its image, so the free δ-ring is strictly bigger than the free ring.

**Proof route.** Put `A_n=Z[x₀,…,x_n]`. For `n≥1`, `A_n` is finite free of rank `pⁿ` over `φ(A_(n−1))[x_n]`, with basis `∏_(j<n)x_j^(a_j)`, `0≤a_j<p`, by the triangular monic relations. Hence `φ(A_(n−1))→A_n` is faithfully flat, as a polynomial extension followed by a finite free map. The initial integer map is the identity. Pass to the filtered colimit and finite subsets of the generator set (BS22 Lemma 2.11, pp.15–16).

<a id="s0-56"></a>
<a id="layer-0-delta-ring-category"></a>

### 0.56 Limits, colimits and Witt vectors of δ-rings

δ-rings have all limits and colimits, preserved by the forgetful functor. The free functor is its left adjoint and the cofree Witt δ-ring its right adjoint; the API below specifies both the integral operation and the adjunction, without ghost injectivity or cancellation of `p`.

rings are commutative. The δ-structure on `W(R)` is constructed by integral universal polynomials and then proved cofree. For `R` with p-torsion, neither cancellation of `p` nor injectivity of the ghost map is used.

(BS22, Remark 2.7 (Limits and colimits of δ-rings, and Witt vectors); Remark 2.13; pp. 14, 16.)

*Needs:* [§0.17](#s0-17), [§0.21](#s0-21), [§0.3](#s0-3), [§0.55](#s0-55), Mathlib `WittVector`, Mathlib `WittVector.frobenius`, Mathlib `WittVector.ghostComponent`, Mathlib `TensorProduct`.

Ring maps commuting with δ are closed under identities and composition and commute with φ. Products have coordinatewise δ; `A⊗_C B` has the unique δ-operation extending the two δ-maps.

`Delta.witt_cofree` in Suggested.lean states existence of the integral δ-operation on `W(R)`, with associated Frobenius `WittVector.frobenius`, and its cofree mapping property for every source δ-ring. The natural δ-unit `w_A:A→W(A)` has `(w_A x)₀=x`, `(w_A x)₁=δx` and `ghost_n(w_A x)=φ^n(x)`. It commutes with δ even with p-torsion. The unique lift of `f:A→R` is `W(f)∘w_A`, giving `Hom_δ(A,W(R))≃Hom_Ring(A,R)`, and both unit–constant-coefficient adjunction triangles hold.

**Checks.**

- `witt_unit_int_ghost`: For `A = Z` with its canonical δ-structure, every ghost component of `w_Z(n)` equals `n`.
- `delta_prod_fst`: The first projection A `× B → A` commutes with `δ` for the product structure.
- `witt_delta_torsionfree`: On `W(Z)` the δ-structure satisfies `p·δ(x) = F(x) − x^p`.
- `witt_torsion_polynomial`: At `p=2` on `W(F₂)`, `δ_W([1])=0` and `δ_W(V([1]))` has zeroth coordinate `1`. The latter detects an operation lost by trying to cancel `p` in `F₂`.
- `witt_adjunction_triangle`: For `A=Z` with canonical `δ` and `f:Z→F₂`, the lift has zeroth coordinate `f`; lifting `constantCoeff:W(F₂)→F₂` returns the identity of `W(F₂)`.
- `witt_unit_not_teichmuller`: For `A = Z` and `p = 2`, `w_Z(2)` is not the Teichmüller representative `[2]`: its first Witt coordinate is `δ(2) = −1`, not `0`.

**Proof route.** Construct the Witt δ-coordinate polynomials by the p-typical Dwork criterion over `Z[X_i]` and specialize; triangular recovery from iterated `δ` proves cofreedom without ghost injectivity (Hes10 Lemmas 1.1, 1.18, pp.6–7,16; BS22 Remark 2.7, p.14).

<a id="s0-57"></a>
<a id="layer-0-delta-radical-localization"></a>

### 0.57 p-local localization of a δ-ring

For a multiplicative `S⊂A` let `T` be generated by `φ^n(S)`, `n≥0`. Localizing `S^−1A` along `V(p)` gives the same ring as localizing `T^−1A` there, with the universal δ-structure specified below; likewise along `V(p,I)`. Arbitrary `S^−1A` need not carry `δ`.

A is a δ-ring; `S` is a submonoid of A. An arbitrary localization `S^{-1}A` need not carry a compatible δ-structure; the statement concerns its p-localization.

(BS22, Remark 2.16 (Localizations in the p-local world); p. 17.)

*Needs:* [§0.28](#s0-28), [§0.26](#s0-26), [§0.40](#s0-40), [§0.42](#s0-42), Mathlib `IsLocalization`, Mathlib `Ideal.jacobson`.

- Monoid generated by `φ^n(S)`, `n≥0`.
- `φ(T)⊂T`.
- Localization along `V(p,I)`, inverting all elements congruent to a unit modulo `(p,I)`.
- `p` lies in its Jacobson radical when localizing along `V(p)`.
- The compatible localized δ-structure.
- Initial `δ-A-algebra` with the prescribed inversions and radical condition.

**Checks.**

- `frobenius_saturation_phi_stable_already`: If `φ(S) ⊂ S` then the Frobenius saturation of `S` is `S`.
- `frobenius_saturation_int`: For `A = Z` with its canonical δ-structure `(φ = id)` the Frobenius saturation of any submonoid is itself.
- `frobenius_saturation_free_strict`: In the free δ-ring on one generator `x_0`, the Frobenius saturation of the powers of `x_0` contains `x_0^p + p·x_1`, which is not a power of `x_0`.
- `radical_localization_dyadic`: For `A=Z`, `p=2` and `S` generated by `3`, the result is `Z_(2)`, with `δ(2)=−1`; in particular `5` is a unit. The ordinary localization `Z[1/3]` fails the last assertion.
- `radical_localization_inverts_prime`: For `A=Z` and `S` generated by `p`, the p-localization is the zero ring: after `p` is inverted, `1+p·(−1/p)=0` is among the elements inverted.
- `radical_localization_empty_generators`: With `S={1}` and `A=Z`, the result is `Z_(p)`, rather than `Z`; every integer prime to `p` becomes a unit.

**Proof route.** Apply the Witt-section localization criterion to the Frobenius saturation; elements congruent to units modulo `p` are units after the radical localization (BS22 Remark 2.16, p.17).

<a id="s0-58"></a>
<a id="layer-0-witt2-derived-pullback-square"></a>

### 0.58 The pullback square for W_2 of a simplicial commutative ring

`(1)` For a p-torsion-free ring `R` the square of rings formed by the restriction `W_2(R) → R`, `(x, y) ↦ x`, the Witt vector Frobenius `F` : `W_2(R) → R`, `(x, y) ↦ x^p +` p·y, the projection `R → R/p` and the composite `R → R/p → R/p` of the projection with the Frobenius of `R/p` is a pullback square: `W_2(R)` ≅ {(a, `b) ∈ R × R` : `b` ≡ `a^p` modulo `p}`. `(2)` For simplicial commutative ring `B` there is a pullback square of simplicial commutative rings, functorial in `B`, with the same two maps out of `W_2(B) (W_2` applied levelwise) and with `R/p` replaced by `B ⊗^L_Z F_p`. In particular, for a cosimplicial simplicial ring `B^•` with discrete `colim lim`, `colim_{Δ^op} lim_Δ W_2(B^•)` is `W_2` of `colim_{Δ^op} lim_Δ B^•`.

`W₂` uses §§0.11,0.16. The square is constructed here; no equivalence with arbitrary coherent derived Frobenius-lift data is asserted.

(BS22, Remark 2.5 (the two squares) and the proof of Lemma 7.7 (1); pp. 14, 57.)

*Needs:* [§0.16](#s0-16), [§0.11](#s0-11), [§0.17](#s0-17), EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, EnhancedDerivedSheaves §E5:animation.1, Mathlib `TruncatedWittVector`.

**Proof route.** First verify the torsion-free square, then use polynomial simplicial resolutions and the finite-coordinate Witt operations (BS22 Remark 2.5, p.14; Lemma 7.7, p.57).

<a id="s0-60"></a>
<a id="layer-0-animated-delta-rings"></a>

### 0.60 Simplicial commutative δ-rings

Animate the category of finite free δ-rings (§0.55), equivalently invert underlying weak equivalences in simplicial δ-rings. The forgetful functor preserves limits and colimits. With chosen points `x,d,x_i` of A, form `A{x/p}=A⊗^L_(Z{t})Z{s}` using `t↦x` and `t↦ps`, and `A{J/(d)}=A⊗^L_(A{t_i})A{s_i}` using `t_i↦x_i` and `t_i↦ds_i`, `J=(d,x_i)`. These depend on the diagrams, not just `π₀-classes`. For finitely generated `I` containing a power of `p`, derived I-completion is left adjoint to the complete subcategory.

Animation, sifted extension and pushouts use EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4; completion uses DerivedModuleAlgebra §§1.1–1.9 and DerivedDeRhamCohomology §§1.10–1.23.

(BS22, Corollary 2.39 (statement: the derived pushout square in simplicial commutative δ-rings); Remark 2.37; Corollary 2.44; proof of Proposition 3.13; pp. 24, 25, 27, 33.)

*Needs:* [§0.56](#s0-56), [§0.55](#s0-55), EnhancedDerivedSheaves §E5:animation.1, EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `CategoryTheory.SimplicialObject`, [§0.59](#s0-59).

- A simplicial commutative ring with a δ-structure in each degree, compatible with all simplicial operators.
- The constant simplicial δ-ring on a δ-ring.
- The levelwise Frobenius `φ`, an endomorphism of the underlying simplicial ring.
- In each degree `n` the Frobenius is `x ↦ x^p + p·δ_n(x)`.

**Checks.**

- `simplicial_delta_const_obj`: The constant simplicial δ-ring on A has the ring A in every degree.
- `simplicial_delta_const_frobenius`: The levelwise Frobenius of the constant simplicial δ-ring on A is the Frobenius of A in every degree.
- `simplicial_delta_face_commutes`: Every simplicial operator of a simplicial δ-ring commutes with the levelwise Frobenius.
- `simplicial_delta_frobenius_mod_p`: In each degree the Frobenius of a simplicial δ-ring is congruent to the p-th power map modulo `p`; a simplicial ring with an arbitrary levelwise endomorphism is not a simplicial δ-ring.
- `simplicial_delta_integer_value`: In the constant simplicial canonical `2-δ-ring Z`, `δ_n(2)=−1` in every simplicial degree `n`. A levelwise zero operation fails.
- `simplicial_delta_characteristic_p_rejected`: The constant simplicial ring `F_p` with identity Frobenius admits no δ-structure; a simplicial Frobenius lift is insufficient.
- `simplicial_delta_torsion_morphism_rejected`: On `Z⊕F_p·ε`, the identity ring map between the `λ=0` and `λ=1` square-zero δ-structures commutes with Frobenius but sends `δ_0(ε)=0` to an element different from `δ_1(ε)=ε`. It cannot be a simplicial operator between these δ-structures.

**Proof route.** Animate finite free objects and their polynomial operations, then use completed pushouts and the completion adjunction (BS22 Remarks 2.37, 2.45, pp.24,27).

<a id="s0-61"></a>
<a id="layer-0-distinguished-element"></a>

### 0.61 Distinguished elements

Consume distinguishedness from PerfectoidSpaces §P4.15.2. The additional API is δ-functoriality, generator changes (§§0.62–0.63) and the integral witnesses: `δ(p)=1−p^(p−1)`, `[p]_q`, Fontaine `ξ`, and Eisenstein generators with `φ(u)=u^p`.

A is a δ-ring for the prime `p`.

(BS22, Definition 2.19 and Example 2.20; p. 18.)

*Needs:* [§0.3](#s0-3), [§0.8](#s0-8).

- `Prismatic.IsDistinguished.map`: A δ-map sends distinguished elements to distinguished elements.
- `Prismatic.isDistinguished_p_int`: `p` is distinguished in `Z_(p)` with its canonical δ-structure.
- `Prismatic.IsDistinguished.p_mem_span`: If `d` is distinguished then `p ∈ (d, φ(d))`: indeed `p·δ(d) = φ(d) − d^p`.

**Checks.**

- `distinguished_p_value`: In `Z_(p)` with its canonical δ-structure, `δ(p) = 1 − p^{p−1}`.
- `distinguished_p_squared_fails`: `p^2` is not distinguished in `Z_(p)`.
- `distinguished_zero_ring`: In the zero ring every element is distinguished.
- `distinguished_unit_times_p`: For a unit `u` of `Z_(p)`, u·p is distinguished (Factors of distinguished elements applied to `Z_(p)`).
- `distinguished_universal_not_p_multiple`: In the universal `δ-Z_(p)-algebra` with `δ(d)` inverted, `d` is distinguished but `d∉pA`: modulo `p` it remains a nonzero polynomial variable. Thus distinguished does not mean `p` times a unit.

**Proof route.** Apply `δ` functoriality and the product formula to generator changes, and compute the distinguished witnesses (BS22 Definition 2.19 and Lemmas 2.23–2.25, pp.18–19).

### 0.62–0.67 Regularity and perfect delta rings

<a id="s0-62"></a>
<a id="layer-0-distinguished-factor-rigidity"></a>

**§0.62 Factors of distinguished elements.**

Let A be a δ-ring. `(1)` If `d ∈ A` is distinguished, `u ∈ A` is a unit and `d`, `p ∈ rad(A)`, then u·d is distinguished. `(2)` If `d =` f·h is distinguished with `f`, `p ∈ rad(A)`, then `f` is distinguished and `h` is a unit.

A is a δ-ring; `rad(A)` is the Jacobson radical. For `(1)`: `d`, `p ∈ rad(A)`. For `(2)`: `f`, `p ∈ rad(A)`.

(BS22, Lemmas 2.23 and 2.24 with proofs; p. 19.)

*Needs:* §§0.3, 0.5, 0.61 and Mathlib `Ideal.jacobson`, `Ideal.mem_jacobson_bot`.

<a id="s0-63"></a>
<a id="layer-0-local-distinguished-prism-generators"></a>

**§0.63 Local distinguished generators of a prism ideal.**

Let A be a δ-ring. (a) (Lemma 2.25) If `d`, `p ∈ rad(A)`, then `d` is distinguished if and only if `p ∈ (d, φ(d))`; in particular distinguishedness depends only on the ideal `(d)`. `(b)` (Lemma 3.1) Let `I ⊂ A` be a locally principal ideal with `p`, `I ⊂ rad(A)`. The following are equivalent: `(1) p ∈ I^p + φ(I)A`; `(2) p ∈ I + φ(I)A`; `(3)` one can choose a δ-map `A→A′`, obtained as an ind-Zariski localization and faithfully flat, for which `IA′=(d)`, `δ(d)` is a unit, and both `d` and `p` lie in `rad(A′)`.

A is a δ-ring; in (a) `d`, `p ∈ rad(A)`; in `(b) I` is locally principal and `p`, `I ⊂ rad(A)`. No global generator of `I` is assumed in `(b)`.

(BS22, Lemma 2.25 and Lemma 3.1 with proofs; pp. 19, 28.)

*Needs:* §§0.5, 0.57, 0.61–0.62 and Mathlib `Module.FaithfullyFlat`.

<a id="s0-64"></a>
<a id="layer-0-p-torsion-freeness-criteria"></a>

**§0.64 p-torsion in δ-rings.**

A δ-ring A is p-torsion-free if its Frobenius `φ` is injective (for instance if A is perfect), and also if A is reduced. Neither hypothesis implies the other: `A = Z_p[x]/(x^p − 1)` with `φ(x) = x^p` is reduced and `φ(x − 1) = 0`; `B = Z_p[x]/(x^2)` with `φ(x) =` p·x is not reduced and `φ` is injective.

A is any δ-ring. (The source assumes `Z_(p)-algebras` and uses that `δ(p) = 1 − p^{p−1}` is a unit; this is not needed, because p·x `= 0` gives `p^{p−1}φ(x) = φ(p^{p−1}x) = 0` and `δ(p)φ(x) = 0`, hence `φ(x) = 0.`)

(BS22, Lemma 2.28 (p-torsion in δ-rings) with proof; Remark 2.29; p. 20.)

*Needs:* §§0.3, 0.5, 0.13 and Mathlib `IsReduced`.

<a id="s0-65"></a>
<a id="layer-0-perfect-delta-rings"></a>

**§0.65 Perfect δ-rings and Witt vectors of perfect rings.**

A δ-ring A is perfect if `φ` is an isomorphism. The following categories are equivalent: `(1)` perfect p-complete δ-rings; `(2)` p-adically complete, p-torsion-free rings A with `A/p` perfect; `(3)` perfect `F_p-algebras`. The functor `(1) → (2)` forgets `δ`; in particular every ring map between perfect p-complete δ-rings is a δ-map. The functors between `(2)` and `(3)` are A `↦ A/p` and `R ↦ W(R)`; in particular `W(R)` has exactly one δ-structure for `R` perfect of characteristic `p`. The inclusion of perfect δ-rings into δ-rings has the left adjoint A `↦ colim_φ A` and the right adjoint A `↦ lim_φ A`.

"p-complete" in `(1)` and `(2)` is classical p-adic completeness; for perfect δ-rings it agrees with derived p-completeness because they are p-torsion-free.

(BS22, Definition 2.26, Remark 2.27, Corollary 2.31 with proof; p. 20.)

`Delta.perfect_wittEquiv` in Suggested.lean states Witt reconstruction of every perfect p-complete δ-ring from its reduction, with the reduction and Frobenius compatibilities. The uniqueness of δ on `W(R)` for perfect characteristic-p `R` is a consequence of this classification.

*Needs:* §§0.6, 0.55–0.56, 0.64, Mathlib `PerfectRing`, `WittVector.frobenius_bijective`, `WittVector.isAdicCompleteIdealSpanP` and DerivedModuleAlgebra §§0.1–0.17, 0.25 for the complete-category comparison.

**Checks.**

- For `R=F_p`, the unique structure on `W(R)=Z_p` has identity Frobenius.
- For `R=F_p[t^(1/p^∞)]`, the structure on `W(R)` has bijective Witt Frobenius and reduction `R`; the statement is not restricted to fields.
- The perfect delta ring `Q` with identity Frobenius is not p-adically complete: `Q/p=0`, so reduction and Witt reconstruction cannot recover it without the completeness hypothesis.

<a id="s0-66"></a>
<a id="layer-0-rank-one-elements"></a>

**§0.66 Perfect elements have rank one.**

Let A be a δ-ring and `x ∈ A`. Then `δ(x^{p^n}) ∈ p^n A` for all `n ≥ 0`. In particular, if A is p-adically separated and `y ∈ A` admits a `p^n-th` root for every `n`, then `δ(y) = 0 (y` has rank `1`); in particular `φ(y) = y^p` (the converse needs A p-torsion-free).

A is a δ-ring; for the second statement A is p-adically separated.

(BS22, Lemma 2.32 (Perfect elements have rank 1) with proof; p. 21.)

*Needs:* §§0.3, 0.5, 0.55 and p-adic separatedness for the infinite-root conclusion.

<a id="s0-67"></a>
<a id="layer-0-distinguished-in-perfect-delta-rings"></a>

**§0.67 Distinguished elements of perfect δ-rings.**

Let A be a perfect p-complete δ-ring, so `A = W(R)` with `R = A/p` perfect, and let `d = Σ_{i≥0} [a_i] p^i` be the Teichmüller expansion of `d ∈ A`. Then `d` is distinguished if and only if `a_1` is a unit of `R`. Moreover (Lemma 2.34) if A is a p-torsion-free, p-adically separated δ-ring with `A/p` reduced and `d ∈ A` is distinguished, then `d` is a nonzerodivisor and `R = A/d` satisfies `R[p^∞] =` R[p].

First statement: A perfect and p-complete. Second statement: A p-torsion-free, p-adically separated, `A/p` reduced (for example A perfect and p-complete); `d` distinguished.

(BS22, Lemma 2.33 (Distinguished elements in perfect δ-rings) and Lemma 2.34, with proofs; p. 21.)

*Needs:* §§0.61, 0.64–0.66 and Mathlib `WittVector.teichmuller`, `nonZeroDivisors`; p-adic separatedness for distinguished-element regularity.

**Proof route.** Use the product identity and radical unit tests, then the Witt expansion on perfect rings; separatedness is used both for §0.66’s infinite-root conclusion and for §0.67’s distinguished-element regularity theorem (BS22 §§2.2–2.3, pp.18–21).

*Needs:* [§0.3](#s0-3), [§0.61](#s0-61), Mathlib `Ideal.jacobson`, Mathlib `Ideal.mem_jacobson_bot`, [§0.57](#s0-57), [§0.5](#s0-5), Mathlib `Module.FaithfullyFlat`, Mathlib `IsReduced`, [§0.13](#s0-13), [§0.6](#s0-6), [§0.56](#s0-56), Mathlib `PerfectRing`, Mathlib `WittVector.frobenius_bijective`, Mathlib `WittVector.isAdicCompleteIdealSpanP`, Mathlib `WittVector`, DerivedModuleAlgebra §§0.1–0.17, 0.25, [§0.55](#s0-55), Mathlib `WittVector.teichmuller`, Mathlib `nonZeroDivisors`.

<a id="s0-68"></a>
<a id="layer-0-free-delta-pd-envelope"></a>

### 0.68 The PD envelope of the free δ-ring as a δ-pushout

Import the restricted p-local PD identities of PerfectoidSpaces §P4.15.2: for p-regular `δ-Z_(p)-algebras`, existence of `z^p/p!` implies all divided powers, and `Z_(p){x,φ(x)/p}` is the PD envelope of `(x)`. The extra target is the animated assertion: the displayed `free-δ` pushout `Z_(p){z}←Z_(p){y}→Z_(p){x}`, `y↦pz,φ(x)`, is also a pushout of underlying animated rings and is discrete.

A is a p-torsion-free `Z_(p)-algebra` with a δ-structure. The inverse of every prime-to-p integer is available, so `γ_n(z)=z^n/n!` is defined in `A[1/p]`. The printed Remark 2.37 writes `D_(x)(Z_(p))` for `D_(x)(Z_(p){x})`; the corrected form is used.

(BS22, Lemmas 2.35 and 2.36 with proofs; Remark 2.37; pp. 22, 23, 24.)

*Needs:* [§0.55](#s0-55), [§0.56](#s0-56), [§0.60](#s0-60), [§0.6](#s0-6), DerivedDeRhamCohomology §§PD.6–PD.7, Mathlib `DividedPowers`.

**Proof route.** Consume the restricted PD identity and check the animated pushout on the free polynomial resolution (BS22 Lemmas 2.35–2.36 and Remark 2.37, pp.22–24).

<a id="s0-69"></a>
<a id="layer-0-pd-envelope-as-delta-envelope"></a>

### 0.69 PD envelopes of regular sequences are δ-envelopes

For p-regular `Z_(p)-algebra B` and finite mod-p Koszul-regular `f_i`, the derived base change of the universal polynomial PD envelope along `x_i↦f_i` is discrete, p-regular and `D_(f)(B)`, compatibly with base changes retaining those hypotheses. If `B=A` is a δ-algebra, `A{φ(f_i)/p}` is this envelope, finitely presented as a `δ-A-algebra`; it is `φ*` of `A{f_i/p}`, the universal p-regular `δ-A-algebra` making `I=(f_i)` divisible by `p`. The twist is essential: for `Z_(p)[x]`, the envelopes `A{x/p}` for `φ(x)=x^p` and `φ(x)=x^p+p` are incomparable.

PD envelopes and universality are DerivedDeRhamCohomology §§PD.6–PD.7; regularity and p-regularity are exactly those stated above.

(BS22, Lemma 2.38, Corollary 2.39 with proofs; Remark 2.40; Warning 2.41; pp. 24, 25.)

*Needs:* [§0.68](#s0-68), [§0.60](#s0-60), [§0.55](#s0-55), DerivedDeRhamCohomology §§PD.6–PD.7, EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, Mathlib `RingTheory.Sequence.IsRegular`, Mathlib `DividedPowers`, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

**Proof route.** Reduce modulo `p` to the Koszul-regular PD calculation, then lift by torsion-freeness and derived p-completion (BS22 Lemma 2.38 and Corollary 2.39, pp.24–25).

<a id="s0-70"></a>
<a id="layer-0-complete-regular-sequence"></a>

### 0.70 Completely regular sequences relative to a base

For animated A, `I=(f₁,…,f_n)⊂π₀A` and derived I-complete `B`, call `x₁,…,x_r` I-completely regular relative to A when `Kos(A;f)→Kos(B;f,x)` is flat. This extends PerfectoidSpaces §P4.15.2 to relative animated bases; for discrete `A,B` and `I=0` it means Koszul regularity of `x` and A-flatness of `B/(x)`.

A animated; `I` finitely generated; `B` derived I-complete. `Kos(A; f)` is the derived quotient `A ⊗^L_{Z[t_1..t_n]} Z`; flatness of a map of animated rings is the notion of EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4 `/` DerivedModuleAlgebra §§1.1–1.9. The definition does not depend on the choice of generators of `I`.

(BS22, Definition 2.42; p. 26.)

*Needs:* DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, Mathlib `RingTheory.Sequence.IsRegular`, Mathlib `Module.Flat`.

- `Prismatic.IsRelativelyRegular`: The relative Koszul-flat predicate above.
- `Prismatic.IsRelativelyRegular.nil`: The empty sequence is regular exactly when `B` is I-completely flat over A.
- `Prismatic.IsRelativelyRegular.polynomial`: Polynomial variables give a relatively completely regular sequence.
- `Prismatic.IsRelativelyRegular.baseChange`: Stability under completed animated base change, with the base ideal transported.

**Checks.**

- `relatively_regular_variable`: In `Z_p⟨x⟩` over `Z_p` with `I = (p)`, the sequence `[x]` is relatively regular: modulo `p` the quotient is `F_p`, flat over `F_p`.
- `relatively_regular_empty_self`: For `B = A` with A derived I-complete, the empty sequence is relatively regular: the defining map of derived quotients is the identity.
- `relatively_regular_p_fails`: In `Z_p` over `Z_p` with `I = (p)`, the sequence `[p]` is not relatively regular: the second `p` is zero on `F_p`, and `Kos(Z_p; p,p)` has nonzero homotopy in degree `1`, so it is not flat over `F_p`.
- `relatively_regular_non_flat_quotient`: In Z[x] over `Z` with `I = (0)`, the sequence [p·x] is regular but not relatively regular: `Z[x]/(p·x)` is not flat over `Z`.

**Proof route.** Express complete regularity by the derived Koszul quotient; animated flat base change proves independence and stability (BS22 Definition 2.42, p.26).

<a id="s0-71"></a>
<a id="layer-0-pd-envelope-complete-flatness"></a>

### 0.71 Complete flatness of PD envelopes and of p-adic δ-envelopes

`(1)` (Lemma 2.43) Let A be an animated ring and `B` a p-complete animated A-algebra with `x_1,…,x_r ∈ π_0(B)` such that `x_1^p,…,x_r^p` is p-completely regular relative to A. Let `D` be the pushout of `D_(y)(Z_p[y_1,…,y_r])^∧` ← `Z_p[y_1,…,y_r]^∧ → B (y_i ↦ x_i)` in derived p-complete animated rings. Then `A → D` is p-completely flat. `(2)` (Corollary 2.44) Let A be a p-complete animated δ-ring, `B` a p-complete animated `δ-A-algebra` and `x_1,…,x_r ∈ π_0(B)` p-completely regular relative to A. Then `C = B{x_1/p,…,x_r/p}^∧`, the pushout of `Z_p{z_i}^∧` ← `Z_p{x_i}^∧ → B (x_i ↦ p·z_i)`, is p-completely flat over A.

Derived p-completion and p-complete flatness are those of DerivedModuleAlgebra §§1.1–1.9. In `(1)` the hypothesis is on the p-th powers `x_i^p`; in `(2)` on the `x_i` themselves.

(BS22, Lemma 2.43 and Corollary 2.44 with proofs; pp. 26, 27.)

*Needs:* [§0.70](#s0-70), [§0.69](#s0-69), [§0.55](#s0-55), [§0.60](#s0-60), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§PD.6–PD.7.

**Proof route.** Compute modulo `p` using the PD monomial basis and the stated relative regularity, then apply complete-flatness detection (BS22 Lemma 2.43 and Corollary 2.44, pp.26–27).

<a id="s0-73"></a>
<a id="layer-0-prism-category"></a>

### 0.73 Maps of prisms; perfect, bounded, orientable and crystalline prisms

Import the prism predicates from PerfectoidSpaces §P4.15.2. Build their category of δ-pairs and its flat morphisms: `(A,I)→(B,J)` is (faithfully) flat when `A→B` is `(p,I)-completely` (faithfully) flat. No orientation is part of an object; an orientation is a chosen generator of `I`. The API below records functoriality and the crystalline specializations.

`(A, I)`, `(B, J)` prisms. `(p, I)-complete` (faithful) flatness is the notion of DerivedModuleAlgebra §§1.1–1.9.

(BS22, Definition 3.2 (2)–(3); Definition 1.4; pp. 3, 28.)

*Needs:* [§0.72](#s0-72), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `Submodule.IsPrincipal`, Mathlib `Module.FaithfullyFlat`.

- `Prismatic.Prism.Hom`: δ-pair maps carrying `I` into `J`.
- `Prismatic.Prism.Hom.id`: Identity map.
- `Prismatic.Prism.Hom.comp`: Composition.
- `Prismatic.Prism.IsCrystalline.isBounded`: Crystalline implies bounded.
- `Prismatic.Prism.IsCrystalline.isOrientable`: Crystalline implies orientable.
- `Prismatic.Prism.Hom.ext`: Equality detected by underlying ring maps.

**Checks.**

- `prism_hom_id_toRingHom`: The underlying ring map of the identity map of a prism is the identity.
- `prism_hom_map_phi`: A map of prisms commutes with the Frobenius lifts.
- `prism_bounded_of_torsionfree_quotient`: If `p` is a nonzerodivisor on `A/I` then the prism is bounded.
- `prism_perfect_frobenius_injective`: A perfect prism has injective Frobenius; a prism with non-injective Frobenius is not perfect.

**Proof route.** Use the imported rigidity to identify extended ideals; complete flat base change supplies the categorical flat interface (BS22 Definition 3.2, p.28).

<a id="s0-74"></a>
<a id="layer-0-crystalline-prism"></a>

### 0.74 Crystalline prisms

Crystalline prisms are precisely (A,(p)) for p-torsion-free p-adically complete δ-rings A; construct the specialization interface below, including `Z_p`, `W(k)` for perfect `F_p-algebras k`, and `Z_p⟨x⟩` with `φ(x)=x^p`.

A is a δ-ring, p-torsion-free and classically p-adically complete.

(BS22, Example 3.3; Example 2.20 (1); pp. 18, 29.)

*Needs:* [§0.72](#s0-72), [§0.73](#s0-73), [§0.8](#s0-8), [§0.65](#s0-65), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `PadicInt`, Mathlib `WittVector`, Mathlib `WittVector.isAdicCompleteIdealSpanP`.

- `Prismatic.Prism.crystalline`: The crystalline prism of a p-regular p-complete δ-ring.
- `Prismatic.Prism.crystalline_I`: Its ideal is `(p)`.
- `Prismatic.Prism.crystalline_isCrystalline`: It satisfies IsCrystalline.
- `Prismatic.Prism.padicInt`: Specialization `A=Z_p`.
- `Prismatic.Prism.witt`: Specialization `A=W(k)`, `k` perfect of characteristic `p`.
- `Prismatic.Prism.padicInt_I`: `Z_p` prism ideal `(p)`.
- `Prismatic.Prism.witt_I`: Witt prism ideal `(p)`.

**Checks.**

- `crystalline_prism_padic_phi`: The Frobenius of the prism `(Z_p, (p))` is the identity.
- `crystalline_prism_padic_perfect`: The prism `(Z_p, (p))` is perfect and bounded.
- `crystalline_prism_witt_phi`: The Frobenius of the prism `(W(k), (p))` is the Witt vector Frobenius.
- `crystalline_prism_bar`: The reduction of `(Z_p, (p))` has `p = 0` and exactly `p` elements.

**Proof route.** p-regularity identifies derived and ordinary p-completion and makes `(p)` an invertible prism ideal (BS22 Example 3.3, p.29).

<a id="s0-76"></a>
<a id="layer-0-breuil-kisin-prism"></a>

### 0.76 The Breuil–Kisin prism

For a complete mixed-characteristic DVR `O_K` with arbitrary perfect residue field `k`, choose `π` and its Eisenstein polynomial `E∈W(k)[u]`, of degree `[K:W(k)[1/p]]`. Construct the bounded oriented Breuil–Kisin prism `(W(k)[[u]],(E))`, `φ(u)=u^p`, reduction `u↦π`. It is nonperfect; every generator of the kernel is distinguished.

`k` perfect of characteristic `p`; `K` finite totally ramified over `W[1/p]`; `E` Eisenstein of degree `e = [K` : `W[1/p]]`. The perfect residue-field hypothesis identifies the unramified coefficient ring with `W(k)`; the source’s shorter description omits that hypothesis.

(BS22, Example 2.20 (4); p. 18.)

*Needs:* [§0.72](#s0-72), [§0.73](#s0-73), [§0.6](#s0-6), [§0.61](#s0-61), [§0.74](#s0-74), Mathlib `PowerSeries`, Mathlib `WittVector`, Mathlib `Polynomial.IsEisensteinAt`.

- `Prismatic.Prism.breuilKisin`: The Breuil–Kisin prism above.
- `Prismatic.Prism.breuilKisin_I`: Ideal `(E)`.
- `Prismatic.Prism.breuilKisin_phi_X`: `φ(u)=u^p`.
- `Prismatic.Prism.breuilKisin_isBounded`: Boundedness.
- `Prismatic.Prism.breuilKisin_bar`: Reduction `W(k)[[u]]/(E)≃O_K`, `u↦π`.

**Checks.**

- `breuil_kisin_not_perfect`: The Breuil–Kisin prism is not perfect: `u` is not in the image of `φ`.
- `breuil_kisin_not_crystalline`: For `E = u − p` over `Z_p` the ideal `(E)` is not `(p)`.
- `breuil_kisin_linear_reduction`: For `E = u − p` over `Z_p`, the quotient `Z_p[[u]]/(u − p)` is `Z_p` via `u ↦ p`.

**Proof route.** The Eisenstein constant term makes `δ(E)` a unit; regularity and completeness verify the prism conditions (BS22 Example 3.3, p.29).

<a id="s0-77"></a>
<a id="layer-0-q-de-rham-prism"></a>

### 0.77 The q-de Rham prism

`A = Z_p[[q − 1]]` with the δ-structure determined by `φ(q) = q^p` (equivalently `δ(q) = 0`), and `I = ([p]_q)`, where `[p]_q = (q^p − 1)/(q − 1) = 1 + q +` … `+ q^{p−1}` is the p-th cyclotomic polynomial evaluated at `q`. Then `(A, I)` is a bounded, oriented, non-perfect prism with `A/I = Z_p[ζ_p]`. The ideal of the prism is `([p]_q)`, not `(q − 1)`: `(A, (q − 1))` is not a prism.

(BS22, Example 2.20 (2); Notation 16.1; Example 1.3; pp. 2, 18, 106.)

*Needs:* [§0.72](#s0-72), [§0.73](#s0-73), [§0.6](#s0-6), [§0.61](#s0-61), [§0.63](#s0-63), Mathlib `PowerSeries`, Mathlib `PadicInt`, Mathlib `Polynomial.cyclotomic`, Mathlib `Polynomial.cyclotomic_prime`, Mathlib `Polynomial.eval_one_cyclotomic_prime`.

- `Prismatic.qAnalog`: The q-analogue `[n]_q = 1 + q +` … `+ q^{n−1}` in a ring with a chosen element `q`.
- `Prismatic.qAnalog_mul_sub_one`: `(q − 1)·[n]_q = q^n − 1`.
- `Prismatic.qAnalog_one_eq`: At `q = 1`, `[n]_q = n`.
- `Prismatic.Prism.qDeRham`: The prism `(Z_p[[q − 1]], ([p]_q))`.
- `Prismatic.Prism.qDeRham_I`: Its ideal is generated by `[p]_q`.
- `Prismatic.Prism.qDeRham_phi_q`: `φ(q) = q^p`.

**Checks.**

- `q_analog_two`: `[2]_q = 1 + q`.
- `q_analog_prime_cyclotomic`: In Z[X] with `q = X`, `[p]_q` is the p-th cyclotomic polynomial.
- `q_de_rham_ideal_not_q_minus_one`: In `Z_p[[q − 1]]` the ideals `([p]_q)` and `(q − 1)` are different.
- `q_de_rham_p_mem`: `p ∈ ([p]_q, [p]_{q^p})` in `Z_p[[q − 1]]`.

**Proof route.** Compute `δ([p]_q)` modulo `(p,q−1)`, then use the cyclotomic quotient and completeness (BS22 Example 3.3, p.29).

<a id="s0-78"></a>
<a id="layer-0-universal-oriented-prism"></a>

### 0.78 The universal oriented prism

An oriented prism adds a generator `d` of `I`. Construct the universal one as the `(p,d)-completion` of `Z_(p){d,δ(d)^−1}`; its unique lift to `(A,(d_A))` sends `d` to `d_A`. Its quotient is p-torsion-free, and `A/(p,d)→A/(p,d^p)`, `x↦x^p`, is faithfully flat. The API retains both the orientation and its forgetful map.

It is universal among oriented prisms, not among orientable ones. This is the Frobenius-twisted faithful flatness needed for Construction 6.1; it does not assert faithful flatness of Frobenius on the whole completed prism.

(BS22, Example 2.21; Example 3.4; pp. 18, 29.)

*Needs:* [§0.55](#s0-55), [§0.28](#s0-28), [§0.57](#s0-57), [§0.35](#s0-35), [§0.72](#s0-72), [§0.73](#s0-73), [§0.63](#s0-63).

- `Prismatic.Prism.Oriented`: Prism plus a chosen ideal generator.
- `Prismatic.Prism.Oriented.isDistinguished`: Its generator is distinguished.
- `Prismatic.Prism.Oriented.generator_mem_nonZeroDivisors`: Its generator is regular.
- `Prismatic.Prism.Oriented.isOrientable`: Forgetting the generator gives IsOrientable.
- `Prismatic.Prism.universalOriented`: Universal oriented prism.
- `Prismatic.Prism.universalOriented_lift`: Unique orientation-preserving δ-lift to any oriented prism.
- `Prismatic.Prism.universalOriented_lift_generator`: The lift sends the universal generator to the specified generator.

**Checks.**

- `oriented_padic`: The prism `(Z_p, (p))` is oriented by `p`, and `δ(p) = 1 − p^{p−1}`.
- `oriented_generator_unique_up_to_unit`: Two orientations of the same prism differ by a unit.
- `oriented_not_unit`: If A is nonzero, the generator of an oriented prism is not a unit.

**Proof route.** Invert `δ(d)` in the free δ-ring and complete; polynomial coordinates modulo `(p,d)` give the displayed Frobenius flatness (BS22 Example 3.4, p.29).

<a id="s0-79"></a>
<a id="layer-0-rigidity-prism-ideal"></a>

### 0.79 Rigidity of maps of prisms

Consume rigidity `I⊗_A` B≅J from PerfectoidSpaces §P4.15.2. Retain the converse: a derived `(p,I)-complete δ-A-algebra B` gives a prism (B,IB) exactly when `B` is I-torsion-free.

`(A, I)` is a prism; in the converse `B` is a `δ-A-algebra` that is derived `(p, I)-complete`.

(BS22, Lemma 3.5 (Rigidity of maps) with proof; Proposition 1.5; pp. 3, 29.)

*Needs:* [§0.72](#s0-72), [§0.73](#s0-73), [§0.63](#s0-63), [§0.62](#s0-62), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `Module.Invertible`.

**Proof route.** Apply the imported local distinguished-generator argument; regularity of the extended invertible ideal is exactly the missing prism condition (BS22 Lemma 3.5, p.29).

<a id="s0-80"></a>
<a id="layer-0-prism-frobenius-ideal-principal"></a>

### 0.80 The Frobenius pullback of a prism ideal is principal

Let `(A, I)` be a prism. Then `φ(I)A` is a principal ideal and each of its generators is a distinguished element. Both `φ^*I=I⊗_{A,φ}A` and the ideal `I^p` are free A-modules of rank one.

`(A, I)` is a prism.

(BS22, Lemma 3.6 with proof; p. 29.)

*Needs:* [§0.72](#s0-72), [§0.63](#s0-63), [§0.62](#s0-62), [§0.67](#s0-67), [§0.65](#s0-65).

- `Prismatic.Prism.exists_distinguished_generator_map`: For a prism `(A,I)`, there exists a distinguished `d∈A` with `φ(I)A=(d)`. The stronger assertion about every generator is part of the target theorem.

**Proof route.** Use local generators and glue the canonical trivializations of `φ*I` and `I^p` (BS22 Lemma 3.6, p.29).

<a id="s0-81"></a>
<a id="layer-0-bounded-prism-complete-flatness"></a>

### 0.81 Properties of bounded prisms

For bounded prisms, A is classically complete. Every derived `(p,I)-complete`, completely flat A-complex `M` is discrete and classically complete, with no `I^n-torsion` and bounded p-torsion modulo `I^n`, all `n≥0`. Complete (faithfully) flat `δ-A-algebras` correspond to (faithfully) flat prism maps `B↦(B,IB)`. There is a completely faithfully flat ind-Zariski completed δ-extension orienting `I=(d)`, still bounded, with `d` distinguished regular.

`(A, I)` is bounded: `A/I` has bounded `p^∞-torsion`. In `(2)` and `(3)` derived `(p, I)-completeness` of `M` and of `B` is a hypothesis: the printed statement of Lemma 3.7(2)–(3) omits it, its proof uses it, and without it the statement is false.

(BS22, Lemma 3.7 (Properties of bounded prisms) with proof; p. 30.)

*Needs:* [§0.72](#s0-72), [§0.73](#s0-73), [§0.79](#s0-79), [§0.63](#s0-63), [§0.59](#s0-59), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

**Proof route.** Apply the bounded-torsion completion and complete-flatness criteria locally on an orientation (BS22 Lemma 3.7, pp.30–31).

<a id="s0-82"></a>
<a id="layer-0-perfect-prism-properties"></a>

### 0.82 Properties of perfect prisms

For perfect `(A,I)`, consume boundedness from PerfectoidSpaces §P4.15.2. Retain the sharp bound `(A/I)[p^∞]=(A/I)[p]` and the regularity consequences under §0.67’s separatedness hypotheses.

`(A, I)` is a prism with `φ` bijective.

(BS22, Lemma 3.8 (Properties of perfect prisms) with proof; p. 31.)

*Needs:* [§0.80](#s0-80), [§0.64](#s0-64), [§0.67](#s0-67), [§0.81](#s0-81), [§0.73](#s0-73), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

**Proof route.** Use Witt perfection, then the separated regularity and sharp torsion calculation of §0.67 (BS22 Lemma 3.8, p.31).

### 0.87–0.92 Torsion controls and Witt operations

<a id="s0-87"></a>
<a id="layer-0-transversal-prism-regular-sequences"></a>

**§0.87 Regular sequences in a transversal prism.**

Let `(A, I)` be a prism and `d ∈ I` a distinguished element. If `(p, d)` is a regular sequence in A, then for all `r`, `s ≥ 0` with `r ≠ s` the sequences `(p, φ^r(d))` and `(φ^r(d), φ^s(d))` are regular.

`(A, I)` prism; `d ∈ I` distinguished; `(p, d)` regular (the prism is transversal: `A/I` is p-torsion-free). The proof uses that `p` lies in the Jacobson radical and that A is p-adically separated, both consequences of derived `(p, I)-completeness` with p-torsion-freeness.

(ALB23, Lemma 2.1.7 (arXiv numbering; Lemma 2.7 in the published version) with proof; p. 13.)

*Needs:* §§0.5, 0.61, 0.72, 0.81 and Mathlib `RingTheory.Sequence.IsRegular`.

<a id="s0-88"></a>
<a id="layer-0-prismatic-envelope-rank-one-presentation"></a>

**§0.88 Presentation of a prismatic envelope for a rank-one element.**

Let `(A, I)` be a bounded prism, `d ∈ A` a distinguished element and `x ∈ A` an element of rank `1 (δ(x) = 0)`. Then for every `n ≥ 0` there are elements `z_n ∈ A{x/d}^{∧(p,d)}`, natural in `(A, x)`, with `φ^n(d)·φ^{n−1}(d)^p` ⋯ `d^{p^n}·z_n = x^{p^n}`; and `δ^n(x/d)` lies in the subring `A[z_0,…,z_n]` of `A{x/d}^{∧(p,d)}`.

`d` distinguished; `δ(x) = 0`. `A{x/d}^{∧(p,d)}` is the derived `(p, d)-completed δ-A-algebra` obtained by freely adjoining `x/d`.

(ALB23, Lemma 4.9.4 (arXiv numbering; Lemma 4.89 in the published version) with proof, and the sentence before the proof; p. 72.)

*Needs:* §§0.5, 0.61, 0.66, 0.86.

<a id="s0-89"></a>
<a id="layer-0-unbounded-torsion-example"></a>

**§0.89 A (p,f)-complete ring with bounded torsion modulo f and unbounded torsion.**

Fix a prime `p`. Put `S=Z[f]` and `M=⊕_(i≥0) M_i`, where `M_i` has generators `e_0,…,e_i` and relations `p e_j=f e_(j+1)` for `j<i` and `p e_i=0`. Construct the square-zero ring `S⊕M` and identify it with `Z[f,x_(i,j)]/J_0`, where `J_0` imposes these relations and all products of x-generators zero. Let `R` be its classical `(p,f)`-completion. Then `f` is regular on `R`, the p-power torsion of `R/f` is killed by `p`, and `x_(i,0)` has exact order `p^(i+1)` in `R`. In particular `R` has unbounded p-power torsion and no `(p,f)`-power torsion.

Construct an injective `S`-linear map `M_i→(Z/p^(i+1))[f,f⁻¹]` sending `e_j` to `p^j f^(−j)`. Thus `f` is regular on each `M_i` and on `M`. Prove the uniform identities `pM⊆fM`, `(p,f)^nM=f^nM` and `(f^(n+1)M :_M f)=f^nM`. Identify `R` with `S^∧_(p,f)⊕lim_n M/f^nM`, with square-zero second summand. The colon identity implies that `f` remains regular on the second summand and that its quotient by `f` is `M/fM`; hence `R/f=Z_p⊕M/fM`, where `p(M/fM)=0`. Prove `p^i e_0=f^i e_i` survives modulo `f^(i+1)M`, so it also survives completion; `p^(i+1)e_0=0` gives the exact order.

(ALB23, Appendix A, Example A.4, p.95; square-zero variant with the module and filtration calculations above.)

*Needs:* Mathlib `MvPolynomial`, `TrivSqZeroExt`, module direct sums, localization and `AdicCompletion`. The module model and uniform filtration identities are construction targets here.

- `Prismatic.UnboundedTorsion.Rel`: Relations `p x_(i,j)=f x_(i,j+1)`, `x_(i,i+1)=0`, and all products of x-generators zero.
- `Prismatic.UnboundedTorsion.Ring`: The quotient polynomial ring by those relations.
- `Prismatic.UnboundedTorsion.p_pow_mul_x`: `p^k x_(i,0)=f^k x_(i,k)`, `k≤i`.
- `Prismatic.UnboundedTorsion.p_pow_succ_mul_x`: `p^(i+1)x_(i,0)=0`.
- `Prismatic.UnboundedTorsion.moduleModel`: The square-zero presentation and the injective Laurent-module maps.
- `Prismatic.UnboundedTorsion.filtration`: The three uniform filtration identities and the completed module decomposition.
- `Prismatic.UnboundedTorsion.Completion`: Its `(p,f)-completion`.
- `Prismatic.UnboundedTorsion.f_nonzerodivisor`: `f` is regular after completion.

**Checks.**

- `unbounded_torsion_order_two`: `p^2·x_{1,0} = 0` in the uncompleted model.
- `unbounded_torsion_nonzero`: `p·x_{1,0} ≠ 0` in the uncompleted model: the torsion is not killed by `p`.
- `unbounded_torsion_no_bound`: In the completed ring, `p^i x_(i,0)` survives modulo `f^(i+1)` for every `i`, whereas `p^(i+1)x_(i,0)=0`.
- `unbounded_torsion_mod_f`: The completed quotient is `Z_p⊕M/fM`; its torsion is killed by `p` even though the completed ring has no uniform p-torsion bound.

<a id="s0-90"></a>
<a id="layer-0-frobenius-fpqc-local-surjectivity"></a>

**§0.90 Fpqc local surjectivity of Frobenius.**

For a δ-ring A and `x∈A` there is a faithfully flat δ-map `A→B` and `y∈B` with `φ_B(y)=x`. The ring `B` is the pushout of `Z{t}→A`, `t↦x`, and `Z{t}→Z{s}`, `t↦φ(s)`.

no p-torsion-freeness or completion of A is assumed.

(BS22, Corollary 2.12, §2; p. 16.)

*Needs:* §§0.55–0.56 and Mathlib `RingHom.FaithfullyFlat`.

<a id="s0-91"></a>
<a id="layer-0-delta-prime-power-valuation"></a>

**§0.91 δ and prime power nilpotence.**

On `Z_(p)`, if `v_p(a)=n>0` then `v_p(δ(a))=n−1`. In particular `δ^n(p^n)` is a unit. No nonzero δ-ring has `p^n=0` for any `n>0`.

the valuation formula concerns `Z_(p)`, while the nilpotence conclusion concerns all δ-rings.

(BS22, Example 2.6, §2; p. 14.)

*Needs:* §§0.8, 0.13, 0.27–0.28, 0.44.

<a id="s0-92"></a>
<a id="layer-0-joyal-delta-operations"></a>

**§0.92 Joyal operations and Witt-coordinate identities.**

For a δ-ring A, define `δ_n(x)` as the n-th Witt coordinate of the canonical δ-map `w_A:A→W(A)`. Then `δ_0(x)=x`, `δ_1(x)=δ(x)`, and `φ^n(x)=∑_(i=0)^n p^iδ_i(x)^(p^(n−i))`. In the free δ-ring `δ_n(x)` equals `δ^n(x)` plus a polynomial in the previous iterates. Thus the free δ-ring is also the polynomial ring on the `δ_n(x)`.

The identity is integral, including with p-torsion; only its universal torsion-free proof divides by `p^n`.

(BS22, Remarks 2.13–2.14, §2.1; p. 16.)

*Needs:* §§0.55–0.56 and the integral Witt ghost identities.

- Define `δ_n(x)=(w_A(x))_n`, with `δ_0=id` and `δ_1=δ`.
- `φ^n(x)=∑_(i=0)^n p^iδ_i(x)^(p^(n−i))`, naturally under δ-ring maps.
- The `δ_n(x)` freely generate the underlying polynomial algebra of the free δ-ring; the change from iterated `δ` is integral and triangular.

**Checks.**

- `pr0_joyal_second_three`: At `p=2` in `Z_(2)`, `δ₂(3)=−24`, whereas `δ²(3)=−6`; the ghost equation is `3=3⁴+2(−3)²+4δ₂(3)`.
- `pr0_joyal_third_two`: At `p=2`, `δ₃(2)=−40`, since `2=2⁸+2(−1)⁴+4(−4)²+8δ₃(2)`.
- `pr0_joyal_second_not_iterate`: At `p=2` in `Z_(2)`, `δ(2)=−1`, `δ²(2)=−1`, whereas `δ_2(2)=−4` from `2=2⁴+2(−1)²+4δ_2(2)`. Higher Witt coordinates are not iterated `δ`.

**Proof route.** Use regular-sequence cancellation for envelopes and integral Witt-coordinate identities for torsion; compute the explicit bounded-quotient counterexample separately (BS22 Remark 2.14, p.16, and Lemma 3.7, p.30; ALB23 Example A.4, p.95).

*Needs:* [§0.72](#s0-72), [§0.61](#s0-61), [§0.5](#s0-5), Mathlib `RingTheory.Sequence.IsRegular`, [§0.86](#s0-86), [§0.66](#s0-66), [§0.81](#s0-81), [§0.78](#s0-78), Mathlib `MvPolynomial`, Mathlib `AdicCompletion`, [§0.55](#s0-55), [§0.56](#s0-56), Mathlib `RingHom.FaithfullyFlat`, [§0.8](#s0-8), [§0.44](#s0-44), [§0.28](#s0-28), [§0.13](#s0-13).

<a id="s0-93"></a>
<a id="layer-0-general-prismatic-envelope"></a>

### 0.93 General envelopes over orientable prisms

For an orientable prism `(A,I=(d))`, a δ-A-algebra `B` and an ideal `J⊇IB`, construct the general envelope of `(B,J)`. This is a prism `(C,IC)` with a δ-A-map `B→C` carrying `J` into `IC`, universal for such maps into prisms over `A`. Both the base and the target prisms may be unbounded. No completeness, flatness, finite generation or regularity is required of the input; neither boundedness nor complete flatness is asserted for the output. ([K1](#ref-k1), Propositions 3.1–3.2, p.13; [Lecture V](#ref-lecture-v), Lemma 5.1, p.6, with the bounded-base convention on p.1.)

Restriction along `B→C` gives an equivalence between δ-A-maps `C→T` and δ-A-maps `B→T` sending `J` into `IT`, for every prism `T` over `A`. Construct the induced maps of envelopes with identity and composition laws, the canonical isomorphism obtained from two generators of `I`, and the comparison with §0.86 under its bounded-base, complete-flatness and relative complete-regularity hypotheses.

**Proof route.** Rigidity makes `d` injective in every target. For a discrete ring `T`, derived completeness at `(p,d)` is equivalent to bijectivity of the two telescope operators `Δ_f:(ℕ→T)→(ℕ→T)`, `Δ_f(x)_n=x_n−f x_(n+1)`, for `f=p,d`. Their inverse-coordinate operations are uniquely determined and hence preserved by A-maps. Put `κ=max(ℵ₀,|A|,|B|)` and `λ=κ^ℵ₀`. In a target, the subring generated by the image of `B`, the unique d-quotients of its elements from `J`, and closure under δ and these countably ary inverse operations for `ω₁` stages has cardinal at most `λ`. Every countable family lies in a common earlier stage, so this subring remains derived complete and d-regular. In a larger universe take the product of representatives of these small targets, including zero, and the same generated closed subring in that product. Projection to the small subring inside any given target gives existence of a lift; preservation of the generating operations gives uniqueness by transfinite induction. The prism relation is inherited from `A`. This argument uses choice and never identifies an arbitrary animated completion with a discrete ring. (Stacks, Tags [091P](https://stacks.math.columbia.edu/tag/091P), [091Q](https://stacks.math.columbia.edu/tag/091Q), [091S](https://stacks.math.columbia.edu/tag/091S), More on Algebra §93, Lemmas 93.1–93.2 and Definition 93.4, pp.261–263, for the completeness criteria.)

`Prism.generalEnvelope_exists` in Suggested.lean states existence of the ring and its universal map. Its definitions `Prism.telescope`, `Prism.IsOrientedPrism`, `Prism.CarriesIdeal` and `Prism.IsEnvelope` express the telescope criterion and mapping property; `Prism.Envelope` bundles the commutative ring, δ-operation and universal map. These definitions retain the given δ-structures and impose no boundedness condition.

**Checks.**

- If `(B,IB)` is a prism and `J=IB`, its identity map is an envelope.
- `J=B` gives the zero prism: divisibility of 1 makes `d` a unit, incompatible with derived d-completeness in a nonzero ring.
- For the completed free δ-algebra on `x` and `J=(d,x)`, the comparison with §0.86 carries its complete-flatness and relative regularity hypotheses.
- The uncompleted free δ-algebra on `x,y` with `J=(d,x²,xy,y²)` is an admissible input without a regular presentation; its envelope is not asserted flat.
- For any unbounded orientable prism, `B=A,J=I` returns `A`; a bounded-output assertion would contradict this case.
- `Δ_0` on `ℕ→ℤ` is the identity, so its inverse coordinates introduce no elements.
- Both constant sequences 0 and 1 belong to the kernel of `Δ_1` on `ℕ→ℤ`; the unit ideal is not a derived-complete ideal of `ℤ`.
- The constant sequence `−1` satisfies `Δ_2(x)=1`; replacing subtraction by addition gives `−3`.

*Needs:* [§0.79](#s0-79), [§0.55](#s0-55) and the integral δ-algebra API, DerivedModuleAlgebra §§1.1–1.9 (derived completeness and the telescope criterion), EnhancedDerivedSheaves §E0.4 (products and limits with explicit universe cutoffs).

### Examples

At `p=2` on `Z`, `δ(a)=(a−a²)/2` gives `δ(2)=−1` and `δ(4)=−6`. Its associated Frobenius is the identity. The product rule on 2·2 computes `4(−1)+4(−1)+2(−1)²=−6`, so omitting the final `pδ(x)δ(y)` term is detected. The ideal `(2)` is Frobenius-stable but not delta-stable; its `δ` closure is the unit ideal. On `Z_(2)`, `2` is distinguished and `4` is not. On the nonzero ring `F₂`, the identity is an ordinary Frobenius lift but there is no `δ` structure. These examples force both the integral division convention and the no-torsion hypothesis of reconstruction.

**§0.1.** `C_2=-xy` and `C_3=-xy(x+y)`. The formula evaluates when `p` is zero or a zero divisor in `R`.

**§0.8.** `D_2(-1)=-1`, whereas at odd `p` it is zero.

**§0.9.** `I=0` returns the original operation and `I=R` gives the zero ring. The ideal `(p)` in canonical `Z` is Frobenius-stable but not delta-stable, since `δ(p)=1-p^(p-1)`.

**§0.10.** At `p=2` the result is `-cbar`*b-abar*`d`, the second coordinate of `-xy`.

**§0.15.** The identity between the two structures is Frobenius-compatible but not delta-compatible. For `λ=1`, `φ(ε)=ε^p=0` while `δ(ε)=ε` is nonzero, rejecting the rank-one converse.

**§0.16.** Over `F_2`, `(1,0)+(1,0)=(0,1)`, rejecting pointwise addition.

**§0.20.** For `p=2` over `Z`, (1,1) is not a unit although its first coordinate is. Over `F_p` the criterion reduces to invertibility of a. The unique vector over the zero ring is a unit.

**§0.25.** In `A=Z_(p)[X]` with `φ(X)=X^p+p`, the localization `A[X^-1]` has no compatible `δ` structure: `X^p+p` is not a Laurent unit. For `p=2` on `Z` plus `F_2*ε` and `s=(3,1)`, `φ(s)=(3,0)` divides `s^2` but is not a power of `s`. Literal stability is not necessary.

**§0.27.** For the canonical integer structure at `p=2`, `δ(1/3)=1/9`. For `φ(X)=X^p+p` in the rational function field, `δ(X^-1)=-1/(X^p*(X^p+p))`; replacing the second denominator by `X^p` is false.

**§0.30.** For canonical `δ` on `Z` and `I=(p)`, `δ(p^(n+1))=p^n`*(1-p^((n+1)*`(p-1)`)) has exactly order `n`, so the loss is sharp. The hypothesis `p` in `I` matters: on `Z_(p)[X]` with `φ(X)=X^p+p`, `δ(X^m)` has nonzero constant term `p^(m-1)`, so it is not `(X)-adically` continuous.

**§0.31.** At `p=2`, `0` and `2` are equal modulo `2` but their deltas are `0` and `-1` modulo `2`. An unshifted congruence is false.

**§0.41.** Over `F_p` this recovers the first-coordinate criterion without ghost injectivity. Over `Z` at `p=2` the vector (1,1) is a counterexample when the radical hypothesis is removed, since its first ghost expression is `3`.

**§0.47.** The empty generating set gives the stable zero ideal. For `p=2` on the integers, the generator `2` fails the criterion because `δ(2)=-1` is not in `(2)`.

**§0.49.** At `p=2` on the integers, stabilization of `(2)` contains `-1` and hence is the stable unit ideal, not the original ideal.

**§0.51.** The projection from the existing integer square-zero example to its integer factor is delta-compatible; its nonzero square-zero kernel is stable.

**§0.55.** At `p=2` the free integral δ-ring has `δ(x₀²)=2x₀²x₁+2x₁²`; the cross term survives before p-localization.

**§0.56.** The pushout of `Z{t}→Z{s}`, `t↦φ(s)`, and `Z{t}→A`, `t↦x`, has underlying ring `A⊗_(Z{t})Z{s}`.

**§0.57.** For free `A=Z{x}` and `S={x^n}`, `φ(x)=x^p+pδ(x)` is not a unit of `A[1/x]`, but becomes a unit after p-localization.

**§0.58.** `R = Z`: `W_2(Z)` ≅ {(a, `b) ∈ Z × Z` : `b` ≡ `a^p` mod `p}`; the pair `(p, 0)` is the image of the Witt vector `(p, −p^{p−1})`, and `(1, 0)` is not in the image. `R = F_p` (not p-torsion-free): the underived square fails, `W_2(F_p) = Z/p²` is not `F_p ×_{F_p} F_p = F_p`; the derived square holds with `F_p ⊗^L_Z F_p` in the corner.

**§0.60.** A discrete δ-ring, viewed as a constant simplicial δ-ring, has `π_0` the original δ-ring and no higher homotopy. For `A = Z_(p){x}`, the animated δ-ring obtained by freely adjoining `φ(x)/p` is discrete (BS22 Remark 2.37); and `A{x/p}` is `Z_(p){s}` with `x =` p·s, a pushout along an isomorphism.

**§0.61.** `δ(p) = 1 − p^{p−1}` in `Z_(p)`; for `p = 2` this is `−1`. `p^2` is not distinguished in `Z_p`: `δ(p^2) = p − p^{2p−1}` is divisible by `p`. In the free δ-ring on `d`, the generator `d` is not distinguished; it becomes distinguished after inverting `δ(d)` and its Frobenius iterates (BS22 Example 2.21).

**§0.62.** In `Z_(p)`: `p =` p·1 and `(−p) = (−1)·p` are distinguished. The hypothesis `f ∈ rad(A)` in `(2)` is needed: in `Z_(p)`, `p =` 1·p with `f = 1 ∉ rad`; `f` is not distinguished `(δ(1) = 0)` and `h = p` is not a unit.

**§0.63.** For `A = Z_p[[q − 1]]` and `I = ([p]_q)`: `p ∈ (I, φ(I))` because `φ([p]_q) = [p]_{q^p}` ≡ `p` modulo `[p]_q`. For `I = (p^2) ⊂ Z_p`: `p ∉ I + φ(I)A`, consistent with `p^2` not being distinguished.

**§0.64.** `Z ⊕ F_2·ε` with the `λ = 1` structure of Delta structures on a square-zero extension has `2-torsion` and is neither reduced nor has injective Frobenius. The two examples of Remark 2.29.

**§0.65.** `W(F_p) = Z_p` with `φ = id` is perfect; `Z_p[x]` with `φ(x) = x^p` is not (`x` is not in the image of `φ`). For `R = F_p[x^{1/p^∞}]`, `W(R)` is the p-completion of `Z_p[x^{1/p^∞}]` with `φ(x^{1/p^n}) = x^{1/p^{n−1}}`.

**§0.66.** In `W(R)` for `R` perfect, the Teichmüller representatives [a] have rank `1`: `φ([a]) = [a]^p`. `q ∈ Z_p[[q − 1]]` with `δ(q) = 0` has rank `1` without having p-power roots: the converse of the lemma fails.

**§0.67.** The nonseparated raw perfection of §0.83 has a distinguished zero divisor, so its regularity cannot be inferred before imposing separatedness. In `W(F_p) = Z_p`: `d = p` has `a_0 = 0`, `a_1 = 1`; `d = p^2` has `a_1 = 0` and is not distinguished. `ξ = p − [p^♭] ∈ A_inf(O_C)` has unit coefficient of `p` in its Teichmüller expansion and is distinguished; `A_inf/ξ = O_C` is p-torsion-free.

**§0.68.** For `p = 2` and `z = x`: `δ(x^2/2) = x^4/8 + x^2·δ(x) + δ(x)^2`, which exhibits `x^4/8 = 3·γ_4(x)` as an element of `C`. `C ≠ Z_(p){x}[1/p]`: `1/p ∉ C`.

**§0.69.** `A = Z_p[x]` with `φ(x) = x^p`, `f = x`: `A{x^p/p}` is the divided power polynomial algebra on `x` over `Z_p`. Warning 2.41: `δ_1(x/p) = (x^p/p^{p+1})(p^{p−1} − 1)` and `δ_2(x/p) = δ_1(x/p) + 1/p`.

**§0.71.** `A = Z_p`, `B = Z_p⟨x⟩`: `C = Z_p{x, x/p}^∧` is p-completely flat over `Z_p`. The hypothesis is not automatic: for `B = A = Z_p` the sequence `(p)` is not p-completely regular relative to A (Completely regular sequences relative to a base), and the corollary does not apply to `B{p/p}^∧`.

**§0.73.** `(Z_p, (p))` is perfect, bounded, oriented by `p` and crystalline; `(Z_p[[q−1]], ([p]_q))` is bounded and orientable, not perfect, not crystalline. A δ-map is a map of prisms only if it carries `I` into `J`: the map `Z_p[[q−1]] → Z_p`, `q ↦ 1`, is a map of prisms `([p]_q) → (p)`, and there is no map of prisms in the other direction because `p` is not sent into `([p]_q)` by the structure map `Z_p → Z_p[[q−1]]`.

**§0.74.** `(Z_p, (p))`: `δ(p) = 1 − p^{p−1}`, a unit, so `p` is distinguished. `(F_p, (0))` is not a prism: `(0)` is not invertible; `(Z/p^2, (p))` is not a prism: `p` is a zero divisor.

**§0.76.** `K = Q_p`, `π = p`: `A = Z_p[[u]]`, `E = u − p`, `δ(u − p) = δ(−p) +` (correction) is a unit congruent to `δ(−p)` modulo `u`. `K = Q_p(p^{1/2})`, `p` odd: `E = u^2 − p`.

**§0.78.** The map to `(Z_p, (p))` with `d ↦ p`, and the map to `(Z_p[[q−1]], ([p]_q))` with `d ↦ [p]_q`. There is no map from the universal oriented prism to `(Z_p, (p))` sending `d` to `p^2`.

**§0.79.** Every map of prisms out of a crystalline prism lands in a crystalline prism. The unique δ-map `Z_p[[q−1]] → Z_p` (with `φ = id` on `Z_p`) sends `q` to `1` and `[p]_q` to `p`; it is a map of prisms to `(Z_p, (p))`, and indeed `J =` IB `= (p)`.

**§0.80.** For `(Z_p[[q−1]], ([p]_q))`: `φ(I)A = ([p]_{q^p})`. For a perfect prism the lemma gives that `I` itself is principal.

**§0.81.** `M = A`: recovers `(1)`. For the q-de Rham prism, `A/[p]_q^n` is p-torsion-free for all `n`. For a `(p,f)-complete` ring `R` with `f` a nonzerodivisor, bounded `p^∞-torsion` of `R/f` does not give bounded `p^∞-torsion` of `R (A (p,f)-complete` ring with bounded torsion modulo `f` and unbounded torsion; that ring is not claimed to be a prism).

**§0.82.** `A_inf(O_C)/ξ=O_C` is p-torsion-free; `(W(R),(p))` is the characteristic-p perfect-prism specialization.

**§0.87.** q-de Rham prism: `([p]_q, [p]_{q^p})` is a regular sequence in `Z_p[[q−1]]`; so is `(p, [p]_{q^{p^r}})`. In a crystalline prism `d = p` and `(p, d)` is not regular: the hypothesis excludes it.

**§0.88.** `n = 0`: `d·z_0 = x`. `n = 1`: `φ(d)·d^p·z_1 = x^p`. For `d = p` (so `φ(d) = p`) and `x` of rank one: `z_1 = x^p/p^{p+1}` and `δ(x/p) = (φ(x/p) − (x/p)^p)/p = p^{p−1}·z_1 − z_1 ∈ A[z_0, z_1]`.

**§0.90.** For `x=p` in `Z_(p)`, the construction adjoins a Frobenius preimage without requiring one in `Z_(p)`. This is a local surjectivity assertion, not surjectivity of `φ` on every δ-ring.

**§0.91.** For `p=2`, `δ(4)=−6` has valuation one and `δ²(4)=−21` is odd. The assertion rules out nonzero rings `Z/p^n`, including `n>1`.

### Dependencies

DerivedDeRhamCohomology §§PD.6–PD.7, DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves §§0.1–0.3, E1.1–E1.4, EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, EnhancedDerivedSheaves §E5:animation.1, PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, DerivedDeRhamCohomology §§5.1–5.4; PerfectoidQuotients §§0.1, 0.3, PerfectoidSpaces §§P1.16–P1.18. Exact inputs are given in the supplier contracts; internal construction dependencies are linked above.

## Layer 1: Relative prismatic cohomology and smooth comparisons

Construct the bounded-prism site with finite jointly faithful covers, then its relative slices and structure sheaves. The Čech–Alexander model makes the Frobenius and Bockstein explicit. Smooth Hodge–Tate comparison removes the preliminary complete Tor-amplitude restriction on base change. The de Rham comparison retains its Witt torsion hypothesis.

<a id="s1-0"></a>
<a id="layer-1-bounded-formal-sites"></a>

### 1.0 Bounded formal sites and restriction from the quasisyntomic basis

Construct p-adic formal schemes as thickening systems locally of the form `(Spec(B/p^(n+1)))_(n≥0)` for classically p-complete B, and their full subcategory `Prismatic.Formal.BoundedPadicScheme` with bounded p-power torsion on charts. The ambient category supplies the formal arc site of §2.0; bounded charts supply the relative smooth comparisons. Morphisms are compatible morphisms of systems; over the p-adic ideal every unital ring map is level-preserving. Prove affine ring-map recovery and Zariski gluing. Compute affine fibre products in the ambient category by classically p-completed tensor products. A product lies in the bounded subcategory when that tensor product has bounded p-power torsion, in particular for p-completely étale charts. No closure of bounded rings under arbitrary completed tensor products is assumed. Construct the small formal étale site from p-completely étale charts and prove its equivalence with the small étale site of the special fibre. SchemeAndStackFoundations §§4.7–4.8 provide the underlying systems. (Stacks Definition 87.9.9, Tag 0AIF; BS22 Definition 4.1 and Construction 4.4, pp.36–37.)

Prove `Prismatic.Formal.boundedSite_gluing`: a complete-derived-category-valued affine functor `F` on bounded p-complete rings with completely étale descent extends uniquely by affine-open descent. For `F` on quasisyntomic charts satisfying quasisyntomic descent, construct the abstract adapter using DerivedDeRhamCohomology §5.5's QRSP unfolding and §5.26's `DerivedDeRham.formalEtaleRealization`, retaining `formalEtaleAffine`, `formalEtaleCoverDescent`, `formalEtalePullback` and `formalEtaleFiltered`. The overlap, pullback and filtered laws apply with the same chart and coefficient hypotheses as the supplied functor. (DerivedDeRhamCohomology §5.26; BMS2 Remark 10.4, p.75.)

*Needs:* SchemeAndStackFoundations §4.7, SchemeAndStackFoundations §§4.7–4.8, SchemeAndStackFoundations §§2.1–2.6, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§5.1–5.7, 5.26 (quasisyntomic sites, QRSP unfolding, `DerivedDeRham.formalEtaleRealization`, `formalEtaleAffine`, `formalEtaleCoverDescent`, `formalEtalePullback`, `formalEtaleFiltered`), EnhancedDerivedSheaves Layer E2, EnhancedDerivedSheaves Layer E3.

**Checks.** Morphisms `Spf C→Spf B` recover precisely unital maps `B→C`. The two principal charts of the formal projective line glue to its p-power system. Completely étale charts of `Spf B` reduce to étale charts of `Spec(B/p)` and lift uniquely back. For p-completely étale charts the completed fibre product remains bounded. On `Spf B` the identity affine chart recovers `F(B)`. For a quasisyntomic sheaf `F` and `B=O_C⟨x⟩`, the compatible-root Čech nerve computes the same value as formal restriction. A disjoint union of two affine charts gives a product, including the empty formal scheme with terminal value. A single proper principal open is not a cover of `Spf B`; its value cannot replace the chart limit. A ring with unbounded p-power torsion does not qualify as a bounded chart.

**Proof route.** Glue the affine p-power systems, lift special-fibre étale charts uniquely using cotangent vanishing and completely étale algebraization, and glue `F` by its completely étale descent; on quasisyntomic charts apply the supplied formal realization (BS22 Construction 4.4, p.37; DerivedDeRhamCohomology §5.26; BMS2 Remark 10.4, p.75).

<a id="s1-1"></a>
<a id="layer-1-prismatic-structure-sheaf"></a>

### 1.1 The site of all bounded prisms and its structure sheaves

Build the site and its structure sheaves by the API below, with the finite-family, zero-object and universe conventions fixed above. `O` and Ō are acyclic on every object: `H^i((A,I),O)=H^i((A,I),Ō)=0` for `i>0`. Complete flat pushouts are discrete bounded prisms; without boundedness no discreteness assertion is made.

Boundedness is essential to pushout discreteness. Completeness, finite covers, site variance and the universe cutoff are Conventions.

(BS22, Corollary 3.12 and its proof; p. 33; BS22, Corollary 3.12, proof, second paragraph; p. 33; ALB23, Remark 3.1.2 and Proposition 3.1.3; p. 16.)

*Needs:* [§0.72](#s0-72), [§0.73](#s0-73), [§0.79](#s0-79), [§0.81](#s0-81), [§0.56](#s0-56), [§0.60](#s0-60), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves Layer E2, Mathlib `CategoryTheory.GrothendieckTopology`, Mathlib `CategoryTheory.Presheaf.IsSheaf`.

- `Prismatic.Site.BoundedPrism`: `Prism_bdd^op`.
- `Prismatic.Site.IsFlatCover`: `C` is `(p,J)-completely` faithfully flat over `B`.
- `Prismatic.Site.BoundedPrism.flatTopology`: Finite jointly flat covering families, including empty over zero.
- `Prismatic.Site.BoundedPrism.pushout`: `(B⊗^L_A C)^∧`, flat over `C` when `A→B` covers.
- `Prismatic.Site.BoundedPrism.structurePresheaf`: `O(B,J)=B`.
- `Prismatic.Site.BoundedPrism.reducedStructurePresheaf`: `Ō(B,J)=B/J`.
- `Prismatic.Site.BoundedPrism.structurePresheaf_isSheaf`: `O` and Ō are sheaves.
- `Prismatic.Site.BoundedPrism.cechComplex`: Completed tensor Čech complex.
- `Prismatic.Site.BoundedPrism.cechComplex_exact`: `A→B^•` and `A/I→B^•/I` are limits for flat covers.

**Checks.**

- `pr1_structure_presheaf_obj`: `O(B,J) = B` and Ō(B,J) `= B/J` for every bounded prism `(B,J)`.
- `pr1_flat_cover_id`: The identity of a bounded prism is a flat cover, and the Čech complex of the identity cover has `H^0 = B` and no higher cohomology.
- `pr1_flat_cover_base_change`: For a flat cover `(A,I) →` (B,IB) and any map `(A,I) →` (C,IC) of bounded prisms, the projection from the pushout (C,IC) `→` (D,ID) is a flat cover.
- `pr1_non_flat_not_cover`: The map of crystalline prisms `(Z_p⟨x⟩,(p)) → (Z_p,(p))`, `x ↦ 0` (with `φ(x) = x^p`), is not a flat cover, because `F_p[x] → F_p` is not flat; in general a map of bounded prisms whose reduction modulo `(p,J)` is not flat is not a cover.
- `pr1_product_projection_family_covers`: For two nonzero bounded prisms, the two projection maps from their product are jointly completely faithfully flat, so their arrows generate a covering sieve. Neither projection by itself is faithfully flat; a topology defined by a single cover in each covering sieve fails this test.
- `pr1_empty_cover_zero_prism`: The empty family covers the zero prism, hence its empty sieve is covering. Every sheaf of rings takes the zero prism to the one-element ring.

**Proof route.** Apply complete faithfully flat descent to the completed tensor Čech nerve, then its affine acyclicity criterion (BS22 Corollary 3.12, p.33).

<a id="s1-2"></a>
<a id="layer-1-relative-prismatic-site"></a>

### 1.2 The relative prismatic site (X/A)_Δ

For a p-adic formal `X` over `A/I`, define the relative site by bounded prisms under `(A,I)` with `Spf(B/IB)→X` and the induced finite-family flat topology. If `h_X(B)=Hom_(A/I)(Spf(B/IB),X)` on the slice `(∗/A)_Δ`, then `h_X` is a sheaf and `Shv((X/A)_Δ)=Shv((∗/A)_Δ)_(/h_X)`. Thus `X→Y` induces the corresponding topos morphism; on an affine `X=Spf R` use the API below.

`(A,I)` is a bounded prism; formal schemes over `A/I` carry the p-adic topology. The definition is made for every p-adic formal scheme `X` over `A/I`; the comparison theorems of this layer assume `X` smooth over `A/I` (Remark 4.2), and for general `X` the cohomology of this site is not the derived theory of Layer `2`. By rigidity (§0.79) the prism ideal of every object is IB, so only `B`, `g` and `f` are data. In the affine case the algebraic language of Notation 4.16 is used: an object mapping to every other object of `(R/A)_Δ`, viewed as rings, is called weakly initial (it is weakly final in the site). Use the formal spectrum and `R=A/I` in the base case of Notation 4.16.

(BS22, Definition 4.1; p. 36; BS22, Remark 4.3; p. 37; ALB23, Definition 3.1.1; p. 16.)

*Needs:* [§1.0](#s1-0), [§1.1](#s1-1), [§0.73](#s0-73), [§0.79](#s0-79), SchemeAndStackFoundations §§4.7–4.8, EnhancedDerivedSheaves Layer E2, Mathlib `CategoryTheory.GrothendieckTopology.over`, Mathlib `CategoryTheory.Presheaf.IsSheaf`.

- `Prismatic.Site.RelativePrism`: Object `(B,J)`, `A→B`, `R→B/J`, with reverse-ring site arrows.
- `Prismatic.Site.RelativePrism.ideal_eq_map`: `J=IB`.
- `Prismatic.Site.RelativePrism.flatTopology`: Induced finite-family flat topology.
- `Prismatic.Site.RelativePrism.structureSheaf`: `O_Δ(B)=B` as an A-algebra.
- `Prismatic.Site.RelativePrism.reducedStructureSheaf`: `Ō_Δ(B)=B/IB` as an R-algebra.
- `Prismatic.Site.RelativePrism.structureSheaf_isSheaf`: Both are sheaves.
- `Prismatic.Site.RelativePrism.forget`: Forget `R→B/IB`, retaining `A→B`, then forget `A→B`, both preserving covers.
- `Prismatic.Site.RelativePrism.restrict`: `R→S` gives `(S/A)_Δ→(R/A)_Δ` by restriction, preserving covers and structure sheaves.
- `Prismatic.Site.RelativePrism.base`: (A,id,id) is final for `R=A/I`.

**Checks.**

- `pr1_relative_site_base_terminal`: For `R = A/I` the object `(A, id, id)` is a final object of the site `((A/I)/A)_Δ`.
- `pr1_relative_site_sheaf_obj`: `O_Δ(B,g,f) = B` and `Ō_Δ(B,g,f) = B/IB`.
- `pr1_relative_site_ideal_rigid`: A `δ-A-algebra B` with an ideal `J` strictly containing IB such that `(B,J)` is a prism receiving a map of prisms from `(A,I)` does not exist: for every map of prisms `(A,I) → (B,J)` one has `J =` IB.
- `pr1_relative_site_restrict_id`: Restriction along the identity `R → R` is the identity functor of `(R/A)_Δ`, and restriction is compatible with the forgetful functors to `Prism_bdd^op`.

**Proof route.** Use the category of elements of `h_X` in the bounded-prism slice; §1.1 gives sheaf descent (BS22 Definition 4.1, pp.35–36).

<a id="s1-3"></a>
<a id="layer-1-prismatic-to-etale-morphism"></a>

### 1.3 The morphism from the prismatic topos to the étale topos

For smooth formal `X/(A/I)`, the reduction functor `μ:(X/A)_Δ→fSch_/X` sends `(B,g,f)` to `Spf(B/IB)→X` and is cocontinuous for the étale topology. Composing its topos morphism with restriction to `X_ét` gives `ν_X`. For étale `U→X`, `(U/A)_Δ` is the slice over `U`; restriction preserves sheaves and (`ν_`*F)(U)=H⁰((U/A)_Δ,F). For abelian F, R^iν_*`F` is the sheafification of these `H^i`.

The construction only needs p-adic formal `X`, though comparisons assume smoothness. Its étale site is that of `X` mod `p` (SchemeAndStackFoundations §§2.1–2.6); `μ` is cocontinuous, and only the pushforward is used.

(BS22, Construction 4.4; p. 37; BS22, Construction 4.4; p. 37.)

*Needs:* [§1.0](#s1-0), [§1.2](#s1-2), [§0.81](#s0-81), [§0.59](#s0-59), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, SchemeAndStackFoundations §§2.1–2.6, SchemeAndStackFoundations §§4.7–4.8, Mathlib `CategoryTheory.Functor.IsCocontinuous`, Mathlib `CategoryTheory.Functor.sheafPushforwardCocontinuous`, Mathlib `Algebra.Etale`.

**Proof route.** Lift completely étale maps uniquely in prisms to prove cocontinuity; compute direct image on each étale slice (BS22 §4.2, pp.37–38).

<a id="s1-4"></a>
<a id="layer-1-relative-prismatic-cohomology"></a>

### 1.4 Relative prismatic cohomology `Δ_{X/A}`

For smooth formal `X/A/I` set `Δ_(X/A)=Rν_*O_Δ` and `RΓ_Δ(X/A)=RΓ(X_ét,Δ_(X/A))`; for p-completely smooth `R` use its affine value. These are `(p,I)-complete E∞-A-algebras`. Their evaluation, cup product, variance, negative-degree vanishing and prism base change are specified below; the Čech model is §1.8 and Frobenius §1.9.

`X` is a smooth p-adic formal scheme over `A/I`; `R` is a p-completely smooth `A/I-algebra`: `R` is derived p-complete and `R ⊗^L_{A/I} (A/I)/p` is a smooth `(A/I)/p-algebra` in degree `0`. For other `X` the same formula defines site cohomology, which this layer uses only for p-completely syntomic algebras (§1.15, §1.24). The commutative algebra structure is in the derived `∞-category`; in a `1-categorical` derived category only the commutative ring structure on cohomology and the cosimplicial ring models are visible. Derived `(p,I)-completeness` follows because `Δ_{R/A}` is a limit of the `(p,I)-complete` rings `B`.

(BS22, Construction 4.9, first paragraph, and Notation 4.16; pp. 39, 41; BS22, Theorem 1.8, opening; p. 4; ALB23, Definition 3.1.5; p. 16.)

*Needs:* [§1.2](#s1-2), [§1.3](#s1-3), [§1.1](#s1-1), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves Layer E2, SchemeAndStackFoundations §§2.1–2.6, Mathlib `DerivedCategory`.

- `Prismatic.Site.cohomologyEval`: Natural evaluation `Δ_(R/A)→B`.
- `Prismatic.Site.cohomologyUnit`: Algebra unit `A→Δ`.
- `Prismatic.Site.cohomologyMap`: `R→S` induces `Δ_R→Δ_S`.
- `Prismatic.Site.cohomologyMap_id`: Identity law.
- `Prismatic.Site.cohomologyMap_comp`: Composition law.
- `Prismatic.Site.cohomologyBaseChangeMap`: Compatible prism/formal maps induce `Δ_(R/A)→f_*Δ_(R′/B)`.
- `Prismatic.Site.cohomology_isZero_of_neg`: `H^iΔ=0` for `i<0` in the smooth range.
- `Prismatic.Site.cohomologyCup`: `E∞` cup product and unit, respected by evaluations, functorial maps and reduction.

**Checks.**

- `pr1_cohomology_base`: For `R = A/I` the unit `A → Δ_{(A/I)/A}` is an isomorphism.
- `pr1_cohomology_unit_natural`: For a map `R → S` of `A/I-algebras`, the composite of the unit `A → Δ_{R/A}` with `Δ_{R/A} → Δ_{S/A}` is the unit of `Δ_{S/A}`.
- `pr1_cohomology_base_degrees`: For `R = A/I`, `H^i(Δ_{(A/I)/A}) = 0` for every `i ≠ 0`.
- `pr1_cohomology_not_discrete`: If the p-completed module `Ω̂^1_{R/(A/I)} ≠ 0` for a p-completely smooth `R` (for instance `R = A/I⟨X⟩`), then `Δ_{R/A}` is not concentrated in degree `0`: `H^1(Δ_{R/A} ⊗^L_A A/I) ≠ 0`. So `Δ_{R/A}` is not the value of `O_Δ` on any single object.

**Proof route.** Apply enhanced derived pushforward to `O_Δ` and the complete affine Čech model (BS22 Construction 4.4, p.37).

<a id="s1-5"></a>
<a id="layer-1-hodge-tate-cohomology"></a>

### 1.5 Hodge–Tate cohomology `Δ̄_{X/A}` and Breuil–Kisin twists of `A/I`-modules

For smooth `X/A/I` define `Δ̄_(X/A)=Rν_*Ō_Δ≃Δ_(X/A)⊗^L_A A/I`, with its `O_X-algebra` structure; use the same reduction on affines. With the twists below, the coefficient extension gives the triangle `Δ̄{i+1}→Δ⊗^L_A I^i/I^(i+2)→Δ̄{i}`, `i≥0`.

`(A,I)` is a bounded prism, `X` a smooth p-adic formal scheme over `A/I`, `R` a p-completely smooth `A/I-algebra`. The twist M{i} of this layer is the twist of `A/I-modules` of Bhatt–Scholze Construction 4.9. Absolute twists of the prism itself are outside this roadmap. The Hodge–Tate comparison carries the twist `{−i}` on `Ω^i` and no Frobenius twist.

(BS22, Construction 4.9, first paragraph; p. 39; ALB23, Definition 3.1.5; p. 16.)

*Needs:* [§1.4](#s1-4), [§1.2](#s1-2), [§0.72](#s0-72), [§0.79](#s0-79), Mathlib `Ideal.Cotangent`, Mathlib `TensorPower`, Mathlib `DerivedCategory`.

- `Prismatic.HodgeTate.Twist`: `R{i}=R⊗(I/I²)^⊗i`, extended to all integers by duality.
- `Prismatic.HodgeTate.twistZero`: `R{0}≃R`.
- `Prismatic.HodgeTate.twistAdd`: `R{i+j}≃R{i}⊗R{j}`.
- `Prismatic.HodgeTate.twistOfOrientation`: `d^i↦1` trivializes the twist for `I=(d)`.
- `Prismatic.HodgeTate.reduction`: `Δ→Δ̄` in `D(A)`.
- `Prismatic.HodgeTate.structureMap`: `R→Δ̄` in `D(R)`.
- `Prismatic.HodgeTate.cohomologyMap`: `R→S` gives `Δ̄_R→Δ̄_S` after scalar restriction.

**Checks.**

- `pr1_twist_zero`: R{0} `= R`.
- `pr1_twist_oriented`: If `I = (d)` then R{i} is free of rank one over `R` for every `i ≥ 0`, with basis the class of `d^{⊗i}`.
- `pr1_hodge_tate_base`: For `R = A/I` the structure map `A/I → Δ̄_{(A/I)/A}` is an isomorphism.
- `pr1_hodge_tate_not_discrete`: If the p-completed module `Ω̂^1_{R/(A/I)} ≠ 0` for a p-completely smooth `R` then `H^1(Δ̄_{R/A}) ≠ 0`; so `Δ̄_{R/A}` is not R[0], the reduction of the structure sheaf of a lift.

**Proof route.** Reduction by the invertible ideal commutes with the site limit; its length-two coefficient extension gives the triangle (BS22 Construction 4.9, pp.39–40).

<a id="s1-6"></a>
<a id="layer-1-change-of-topology"></a>

### 1.6 Flat, étale, Nisnevich and Zariski topologies compute the same cohomology

On the category underlying `(X/A)_Δ` consider the topologies whose covers are the maps of prisms (B,IB) `→` (C,IC) that are `(p,I)-completely` étale covers, Nisnevich covers or Zariski covers. There are morphisms of topoi `Shv((X/A)_Δ) → Shv((X/A)_{Δ,ét}) → Shv((X/A)_{Δ,Nis}) → Shv((X/A)_{Δ,Zar})`, and the derived pushforward along each of them carries `O_Δ` to `O_Δ` and `Ō_Δ` to `Ō_Δ`. Hence `RΓ((X/A)_Δ, O_Δ)` and `RΓ((X/A)_Δ, Ō_Δ)` may be computed in any of the four topologies. The same holds for coefficients in a crystal in `(p,I)-complete` complexes, that is, an assignment `(B,g,f) ↦ M(B) ∈ D_{(p,I)-comp}(B)` compatible with completed base change.

`(A,I)` is bounded and `X` is a p-adic formal scheme over `A/I`. Zariski, Nisnevich and étale covers of `Spf(B)` lift uniquely to `(p,I)-completely` étale `δ-B-algebras`, so each of these topologies is coarser than the flat topology. Only the two structure sheaves and crystals are compared; arbitrary sheaves on the four sites have different cohomology.

(BS22, Remark 4.5; p. 37.)

*Needs:* [§1.1](#s1-1), [§1.2](#s1-2), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves Layer E2.

**Proof route.** Compare the affine Čech resolutions in the four topologies using complete flat descent (BS22 Remark 4.2 and Corollary 3.12, pp.33,36).

<a id="s1-7"></a>
<a id="layer-1-cech-alexander-complex"></a>

### 1.7 Weakly initial objects and Čech–Alexander complexes

Extend PerfectoidSpaces §P4.15.3 from oriented smooth affines to invertible ideals and syntomic presentations. Given `B₀=A[x_s]^∧→R` surjective, set `B=Free_(δ,A)(B₀)^∧`, `J₀=ker(B₀→R)`, `R′=(B/J₀B)^∧_p`, `J=ker(B→R′)`, `C=B{J/I}^∧`. Apply this to B₀’s Čech nerve to obtain `C^•`. The API gives weak initiality, complete flatness and coproduct compatibility. Taking generators indexed by `R` gives strict functoriality in `R`, though that choice need not commute with prism base change; polynomial presentations do. Infinite regular families are handled by completed filtered colimits.

Here `R` is p-completely smooth or syntomic over `A/I` (ALB23 Remark 3.1.8). Finite presentations use regular envelopes; infinite ones use their completed filtered colimit. Boundedness identifies the indicated classical and derived completions (BS22 Lemma 3.7).

Since every prism over `(A,I)` under `R` receives a map from `C`, and `C^n` is the `(n+1)`-fold coproduct, `Hom(C^n,B) ≃ Hom(C,B)^(n+1)` compatibly with cofaces and codegeneracies. With `S(B)=Hom(C,B)` this is exactly the Čech nerve data `CechNerveData` of [AC](#ref-ac) (`Cohomology/Cech.lean`), which §1.8 uses.

(BS22, Construction 4.17; p. 41; BS22, Construction 4.18 and Remark 4.19; pp. 42, 43; ALB23, Remark 3.1.8 (2); p. 17.)

*Needs:* [§1.2](#s1-2), [§0.86](#s0-86), [§0.55](#s0-55), [§0.81](#s0-81), [§0.56](#s0-56), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `MvPolynomial`, Mathlib `AlgebraicTopology.alternatingCofaceMapComplex`.

- `Prismatic.Site.weaklyInitial`: Envelope object `C` for a surjective generating family `S→R`.
- `Prismatic.Site.weaklyInitial_hom_nonempty`: Every object maps to it in the site direction.
- `Prismatic.Site.weaklyInitial_flat`: `C` is `(p,I)-completely` flat over A.
- `Prismatic.Site.cechAlexander`: `C^n` is its `(n+1)-fold` algebraic coproduct.
- `Prismatic.Site.cechAlexander_obj_zero`: `C^0=C`.
- `Prismatic.Site.cechAlexanderComplex`: Alternating-coface cochain complex in degrees `≥0`.
- `Prismatic.Site.cechAlexander_baseChange`: Completed termwise base change is an isomorphism for the base-changed presentation.

**Checks.**

- `pr1_cech_alexander_base`: For `R = A/I` and the empty family of variables the weakly initial object is the final object `(A, id, id)` of the site, and `C^•` is constant with value A.
- `pr1_cech_alexander_affine_line`: For `R = A/I⟨X⟩` with the presentation A⟨X⟩ `→ R`: `C^0 = A{X}^∧` is the completed free `δ-A-algebra` on one generator, so maps of prisms over `(A,I)` from `(C^0,IC^0)` to a bounded prism (B,IB) over `(A,I)` correspond bijectively to elements of `B`; and `C^1 = A{X,Y}{(X−Y)/I}^∧`.
- `pr1_weakly_initial_not_initial`: If `Ω^1_{R/(A/I)} ≠ 0` the two coface maps `C^0` ⇉ `C^1` are different; so the weakly initial object is not initial and `Δ_{R/A} ≠ C^0`.

**Proof route.** Consume the oriented envelope construction, glue its generator changes, and pass to completed filtered colimits for regular families (BS22 Construction 4.17, pp.41–42).

<a id="s1-8"></a>
<a id="layer-1-cech-alexander-computes-cohomology"></a>

### 1.8 Čech–Alexander complexes compute prismatic cohomology; independence of the presentation

Extend the oriented affine computation of PerfectoidSpaces §P4.15.3 by orientation descent: `Δ_(R/A)≃Tot C^•` and `Δ̄_(R/A)≃Tot(C^•/I)`, compatibly as `E∞-algebras`. The common tensor-product refinement of any two presentations identifies these maps coherently; hence §1.7’s functorial complex represents `Δ` and étale gluing gives the formal version.

`(A,I)` bounded; `R` p-completely smooth over `A/I` (or p-completely syntomic, with the same proof). The statement uses the general fact: for a topos 𝒳, an abelian sheaf `F` and a weakly final object `X_0` with Čech nerve `X_0^•`, `RΓ(𝒳,F) ≃ R lim RΓ(X_0^•,F)`; if `F` is acyclic on each `X_0^n` this is the complex `F(X_0^•)` (Bhatt–Scholze, footnote to Construction 4.18).

The presheaf form of this fact is formalised in [AC](#ref-ac). For a category `J` with objects in `Type (v+1)`, morphisms in `Type v` and Čech nerve data `X[•]`, `rightDerivedLimIsoCech` (`Cohomology/CechDerived.lean`) gives `Rⁿ lim F ≅ Hⁿ(F(X[0]) → F(X[1]) → ⋯)` for every `F : J ⥤ ModuleCat.{v+1} R` with `R` small. It rests on `hasEnoughInjectivesFunctorCategory` (`Cohomology/FunctorCategoryInjectives.lean`), enough injectives in `J ⥤ ModuleCat.{v+1} R` for such large `J`. At our Mathlib pin the Grothendieck-abelian instance for presheaves of modules, which yields enough injectives, is stated over a small category only, and the category of bounded prisms over `(A,I)` is not small. The same tool serves the prismatic Čech–Alexander statement: take `J` the bounded prisms over `(A,I)` under `R`, `X[n]=C^n` with §1.7's identification `Hom(C^n,B) ≃ Hom(C,B)^(n+1)`, and `F` the structure presheaf with values lifted one universe up. This identifies `R lim O_Δ` over the category with `Tot C^•`; §1.1's acyclicity of `O_Δ` on each `C^n` gives the same complex for the flat topology. [AC](#ref-ac) is built at an older Mathlib pin, so the statement stays a target here.

(BS22, Construction 4.18 and its footnote; p. 42; BS22, Theorem 5.2, proof (the same argument on the crystalline side); p. 45.)

*Needs:* [§1.7](#s1-7), [§1.1](#s1-1), [§1.4](#s1-4), EnhancedDerivedSheaves Layer E2.

**Proof route.** The weakly initial object’s coproduct nerve resolves the terminal sheaf; tensor-product refinements identify the augmentations (BS22 Construction 4.18 and its footnote, p.42).

<a id="s1-9"></a>
<a id="layer-1-frobenius-on-prismatic-cohomology"></a>

### 1.9 The Frobenius of prismatic cohomology

Apply the objectwise Frobenius lift of the δ-sheaf `O_Δ`, then `Rν_*` and global sections. The resulting natural `E∞-maps` are `φ_A-semilinear`, represented termwise on Čech models; their linearization and base-change compatibilities are the API below.

`(A,I)` bounded prism, `X` a p-adic formal scheme over `A/I` (smooth where comparison theorems are used). `φ_A` need not be flat or an isomorphism; `φ_A^*` is a derived functor and is not assumed to commute with totalisations unless proved (Theorem 5.2, proof). `φ` carries `I` into `φ(I)A`, which is contained in `I` only for crystalline prisms; so in general `Ō_Δ` has no induced endomorphism (for `I = (p)` it has the Frobenius); reduction modulo `I` after `φ` gives the maps used in the de Rham comparison.

(BS22, Theorem 1.8, opening; p. 4; ALB23, Definition 3.1.5; p. 16.)

*Needs:* [§1.4](#s1-4), [§1.2](#s1-2), [§1.8](#s1-8), [§0.73](#s0-73), [§0.3](#s0-3), [§0.5](#s0-5), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

- `Prismatic.Site.RelativePrism.sheafFrobenius`: Objectwise `φ_B` on `O_Δ`.
- `Prismatic.Site.RelativePrism.sheafFrobenius_structureMap`: `φ_B(g(a))=g(φ_A(a))`.
- `Prismatic.Site.frobenius_naturality`: `φ` commutes with `Δ(R→S)`.
- `Prismatic.Site.frobeniusLinearization`: A-linear adjoint `φ_A^*Δ→Δ`.

**Checks.**

- `pr1_frobenius_sheaf_component`: On an object `(B,g,f)` the Frobenius of `O_Δ` is `x ↦ x^p + pδ(x)`.
- `pr1_frobenius_trivial_base`: If `φ_A` is the identity (for instance `A = Z_p`) then `φ_{A,*}` is isomorphic to the identity functor of `D(A)`, so `φ_R` is an A-linear endomorphism of `Δ_{R/A}`.
- `pr1_frobenius_not_linear`: If `φ_A(a) ≠` a and `g` : `A → B` is injective then `φ_B(g(a)) ≠ g(a)`: the Frobenius is not A-linear, so it is not an endomorphism of `Δ_{R/A}` in `D(A)`.

**Proof route.** Apply the natural δ-Frobenius to the structure sheaf and its functorial Čech resolution (BS22 Construction 4.4, p.37).

<a id="s1-10"></a>
<a id="layer-1-base-change-finite-tor-amplitude"></a>

### 1.10 Base change along maps of finite complete Tor amplitude

Consume oriented affine base change from PerfectoidSpaces §P4.15.3. For smooth `R/A/I` and any bounded-prism map `A→A′`, the base-changed presentation computes `Δ_(R′/A′)`, `R′=R⊗̂_AA′`. If `A′` has finite `(p,I)-complete` Tor-amplitude over A, tensor commutes with totalization, giving `Δ⊗̂^L_AA′≃Δ_(R′/A′)` and the corresponding Hodge–Tate iso. This step extends to unoriented bases before §1.21 removes its `Tor` bound.

Finite complete Tor-amplitude means `A′⊗^L_AA/(p,I)` has finite Tor-amplitude over `A/(p,I)`; this is the prerequisite for the Hodge–Tate proof, not a consequence of §1.21.

(BS22, Lemma 4.20, Lemma 4.22 and their proofs; pp. 43, 44.)

*Needs:* [§1.7](#s1-7), [§1.8](#s1-8), [§0.86](#s0-86), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

<a id="complete-base-change-totalization"></a>

**Completed tensor and totalization.** Construct `Prismatic.completeBaseChange_totalization` here. Let `C` be a commutative ring, `J` a finitely generated ideal, and `C→C′` a ring map of finite J-complete Tor-amplitude. For a cosimplicial object `M•` of `D(C)`, suppose there is one integer `b` with `Mⁿ∈D≥b(C)` for every cosimplicial degree `n`. Then the canonical comparison

`LΛ_(JC′)(Tot(M•)⊗ᴸ_C C′) → Tot(LΛ_(JC′)(M•⊗ᴸ_C C′))`

is an equivalence. Completion uses the image ideal `JC′`; the terms need not already be complete. Separate lower bounds depending on `n` do not supply the uniform hypothesis. (BS22, Lemma 4.22 and proof, p.44.)

*Needs:* DerivedModuleAlgebra §§1.1–1.8 (derived limits, completion and complete Tor-amplitude); EnhancedDerivedSheaves §§0.1–0.3 (enhanced derived categories and limits).

**Checks.**

- Identity base change on derived J-complete terms recovers their totalization.
- For `C→C[t]`, flatness gives Tor-amplitude zero, so the exchange holds for every uniformly bounded-below diagram, even though `C[t]` need not be perfect over `C`.
- For `C=Z`, `J=(p)` and `C′=F_p`, the exchange holds with Tor-amplitude `[−1,0]`; `F_p⊗ᴸ_Z F_p` retains its nonzero degree `−1` term.

**Proof route.** Finite partial totalizations commute with completed tensor by exactness. A Koszul complex on finite generators of `J` and the finite complete Tor-amplitude give a fixed integer `c` such that completed base change sends `D≥n(C)` into `D≥n−c(C′)`. Thus the errors of the partial totalizations tend uniformly to arbitrarily high degrees, and the comparison survives the inverse limit (BS22 Lemma 4.22, p.44). For prismatic base change the Čech terms are discrete, so their common lower bound is zero. Apply the helper to oriented base change termwise, then descend orientations (BS22 Lemma 4.20, p.43).

<a id="s1-11"></a>
<a id="layer-1-etale-localization"></a>

### 1.11 Étale localisation of Hodge–Tate cohomology

Use PerfectoidSpaces §P4.15.3 and PerfectoidQuotients §0.0 for the oriented affine inputs. For completely étale `R→S` between smooth `A/I-algebras`, extend to the formal relative site: in algebraic variance, restriction has left adjoint `(B,R→B/IB)↦(B_S,S→B_S/IB_S)`, where `B_S` is the unique complete étale δ-B lift of `(B/IB)⊗̂^L_RS`. It preserves coproducts and weak initiality; `Δ̄_(R/A)⊗̂^L_RS≃Δ̄_(S/A)`.

`(A,I)` is bounded; `R` and `S` are p-completely smooth over `A/I` and `R → S` is p-completely étale: `S` is derived p-complete and `S ⊗^L_R R/p` is étale over `R/p`. The statement is for `Δ̄`; the corresponding statement for `Δ` follows only after completion along `I` and is not an S-linear statement, since `Δ_{R/A}` is not an R-module.

(BS22, Lemma 4.21 and its proof; p. 43.)

*Needs:* [§1.7](#s1-7), [§1.8](#s1-8), [§1.5](#s1-5), [§0.81](#s0-81), [§0.59](#s0-59), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `Algebra.Etale`.

**Proof route.** Use PerfectoidQuotients §0.0’s complete étale δ-lift to construct the adjoint and compare the two Čech augmentations (BS22 Lemma 4.21, pp.43–44, using Lemma 2.18, pp.17–18).

<a id="s1-12"></a>
<a id="layer-1-bockstein-differential"></a>

### 1.12 The Bockstein differential on twisted Hodge–Tate cohomology

For smooth `R` or formal `X`, the connecting maps of §1.5 give `β_I` on `H^`*(Δ̄){*}, with the square-zero and signed Leibniz laws below. Consequently `β_I∘η⁰` is an `A/I-derivation` and induces `η¹` from the p-completed differentials (finite projective for smooth `R`).

`(A,I)` is a bounded prism; `R` is p-completely smooth over `A/I`. `β_I` is `A/I-linear` but not R-linear. Graded commutativity is xy `= (−1)^{deg x` · deg `y}` yx. The vanishing of squares of odd elements is not part of this target; for elements `β_I(f)`, `f ∈ R`, it is Lemma 4.10 and is proved in §1.18. When `I = (d)` the twists are trivialised by `d` and `β_I` is the Bockstein of the triangle `Δ → Δ → Δ̄` given by multiplication by `d` (the convention of the source for `d = p`).

(BS22, Construction 4.9; p. 39.)

*Needs:* [§1.5](#s1-5), [§1.4](#s1-4), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§2.7–2.26, 5.8, Mathlib `KaehlerDifferential`, Mathlib `KaehlerDifferential.D`.

- `Prismatic.HodgeTate.twistedCohomology`: `H^i(Δ̄){i}`.
- `Prismatic.HodgeTate.bockstein`: `A/I-linear β_I` from the coefficient triangle.
- `Prismatic.HodgeTate.bockstein_comp_bockstein`: `β_I²=0`.
- `Prismatic.HodgeTate.cup`: Associative unital R-bilinear graded-commutative cup product.
- `Prismatic.HodgeTate.bockstein_cup`: `β_I(xy)=β_I(x)y+(−1)^i xβ_I(y)`.
- `Prismatic.HodgeTate.eta0`: Degree-zero structure ring map `η⁰`.
- `Prismatic.HodgeTate.eta1`: R-linear `η¹` with `η¹(dg)=β_I(η⁰g)`.

**Checks.**

- `pr1_bockstein_eta1_d`: `η^1_R(dg) = β_I(η^0_R(g))` for every `g ∈ R`; hence `η^1_R(f` dg) `= f·β_I(η^0_R(g))`.
- `pr1_bockstein_base_zero`: For `R = A/I`, `β_I` vanishes on `H^0(Δ̄_{(A/I)/A}) = A/I`.
- `pr1_bockstein_not_linear`: If dg `≠ 0` in `Ω^1_{R/(A/I)}` for a p-completely smooth `R`, then `β_I(η^0_R(g)) ≠ 0` although `β_I(η^0_R(1)) = 0`: `β_I` is not R-linear.

**Proof route.** Take the connecting morphism of the coefficient triangle and its multiplicative structure (BS22 Construction 4.9, pp.39–40).

<a id="s1-13"></a>
<a id="layer-1-relative-frobenius-cosimplicial-lemma"></a>

### 1.13 The relative Frobenius of a polynomial Čech nerve is a cosimplicial quasi-isomorphism on modules

Use the affine characteristic-p input of PerfectoidSpaces §P4.15.3. The extra coefficient statement: for any polynomial `B/k`, `char(k)=p`, its Čech nerve `B^•` and relative Frobenius `B^(•,1)→B^•`, every cosimplicial `B^(•,1)-module N` has `N→N⊗_(B^(•,1))B^•` a quasi-iso on unnormalized cochains. No variable-set finiteness is needed.

The tensor is termwise. BS22’s monoid partition uses residues `{0,…,p−1}^r`, not all of `N^r`.

(BS22, Lemma 5.4 and its proof; p. 48.)

*Needs:* Mathlib `AlgebraicTopology.alternatingCofaceMapComplex`, Mathlib `MvPolynomial`.

**Proof route.** Decompose polynomial monomials by their residues modulo `p`; the relative Frobenius Čech summands contract after adjoining coefficients (BS22 Lemma 5.4, pp.46–49).

<a id="s1-13a"></a>
<a id="layer-1-laurent-relative-frobenius"></a>

### 1.13a Laurent relative Frobenius on a Čech nerve

For a characteristic-p ring `k`, an arbitrary set `S`, `G=⊕_(s∈S)ℤ` and `B=k[G]`, let `B^n=B^(⊗_k(n+1))` be the Čech nerve and put `B^(•,(1))=B^•⊗_(k,Frob_k)k`. Prove `Prismatic.laurentRelativeFrobenius`: for every cosimplicial `B^(•,(1))-module N`, the comparison `N→N⊗_(B^(•,(1)))B^•` induces a quasi-isomorphism of unnormalized cochain complexes of k-modules. The tensor product is ordinary and degreewise. Relative Frobenius is free in every degree, but `N` need not be k-flat. The free abelian group may have infinite rank; arbitrary nonfree groups and monoids with p-torsion are not included. ([BS22](#ref-bs22), Lemma 5.4 and proof, pp.48–49, for the polynomial argument; [K1](#ref-k1), Appendix B, Lemma B.4, pp.61–62, for its Laurent application.)

**Proof route.** Every `g∈G` has a unique expression `g=ph+a` with finitely supported coordinates `0≤a_s<p`. These representatives give a degreewise free basis compatible with cofaces. The resulting free k-module factor is the underlying semicosimplicial module of the split Čech nerve of `k→k[G/pG]`. Its augmentation is a cosimplicial homotopy equivalence, preserved by degreewise tensoring with any cosimplicial k-module. Cofaces suffice to identify the unnormalized complexes; codegeneracies need not preserve the chosen basis. Finite support supplies the same basis for infinite `S`, without requiring an arbitrary coefficient module to descend to finitely many variables.

The split factor has degree-n basis `(G/pG)^(n+1)`. Its pointed augmentation, tensored degreewise with any cosimplicial k-module `N`, is a quasi-isomorphism on unnormalized cochains. Applying this to the underlying k-module of the coefficient object gives the asserted Laurent comparison; the exponent decomposition uses finitely supported integer coordinates.

**Checks.**

- If `S` is empty, then `B=k` and the relative comparison is the identity.
- At `p=2` and `G=ℤ`, `−1=2(−1)+1`, so `X^(−1)=X^(−2)X`; the quotient exponent cannot be restricted to nonnegative integers.
- At `p=2`, a codegeneracy adds the pair `(1,1)` to give 2, outside the residue set `{0,1}`. Basis compatibility is required only for cofaces.
- For `k=𝔽_p[ε]/(ε²)`, take constant `N=k/(ε)` with every group variable acting as 1. The split homotopy still applies although `N` is not k-flat.

*Needs:* [§1.13](#s1-13), Mathlib `AlgebraicTopology.alternatingCofaceMapComplex`, EnhancedDerivedSheaves §§E1.1–E1.4 (module tensor products), and the coface-compatible splitting in this section.

<a id="s1-14"></a>
<a id="layer-1-crystalline-comparison"></a>

### 1.14 The crystalline comparison

For a crystalline prism (A,(p)), a PD ideal `I` containing `p` and smooth `R/(A/I)`, put `R^(1)=R⊗_(A/I,ψ)A/p`, where `ψ:A/I→A/p` is induced by Frobenius, which kills `I/p`. Then `Δ_(R^(1)/A)≃RΓ_crys(R/A)`, canonically as `E∞-A-algebras` with Frobenius. Crystalline cohomology is the derived limit over the PD thickenings `A/p^n`. For `I=(p)`, the comparison is induced by `φ_A`* C^•→D^•, where C^• is the prismatic Čech–Alexander object and D^• the p-completed PD envelope object of the same presentation; φ_A* `C^•` computes `Δ_(R^(1)/A)`.

(A,(p)) is a crystalline prism, hence bounded; `I` is a PD ideal containing `p` (its divided powers are unique since A is p-torsion-free, and they are compatible with the canonical ones on `(p)`). `R` is a smooth `A/I-algebra` in the usual sense (`A/I` has characteristic `p`). The Frobenius twist is on the prismatic side: it is `R^{(1)}`, not `R`, whose prismatic cohomology is the crystalline cohomology of `R`. For `I = (p)` and with base change (§1.21) this reads `φ_A^*Δ_{R/A} ≃ RΓ_crys(R/A)`; the untwisted statement `Δ_{R/A} ≃ RΓ_crys(R/A)` is false in general. The statement `φ_A^*C^•` computes `Δ_{R^{(1)}/A}` is termwise; it is not claimed here that `φ_A^*` commutes with the totalisation of `C^•`.

(BS22, Notation 5.1, Theorem 5.2 and its proof; p. 45; BS22, Theorem 1.8 (1) and Example 1.9 (1); pp. 4, 5; ALB23, Theorem 3.1.7 and the paragraph before it; p. 17.)

*Needs:* [§1.0](#s1-0), [§1.7](#s1-7), [§1.8](#s1-8), [§1.13](#s1-13), [§1.10](#s1-10), [§1.9](#s1-9), [§0.74](#s0-74), [§0.69](#s0-69), [§0.86](#s0-86), DerivedDeRhamCohomology §§PD.6–PD.7, CrystallineCohomology §§CR.1.1–CR.1.3, CrystallineCohomology §§CR.2.1–CR.2.3, DerivedDeRhamCohomology §§3.4–3.6, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `DividedPowers`, SchemeAndStackFoundations §§4.7–4.8.

**Proof route.** Compare Frobenius-twisted prismatic envelopes with PD envelopes termwise and totalize (BS22 Theorem 5.2, pp.44–45).

<a id="s1-15"></a>
<a id="layer-1-crystalline-comparison-syntomic"></a>

### 1.15 The crystalline comparison for syntomic algebras

Let (A,(p)) be a crystalline prism, `J ⊂ A` a PD ideal with `p ∈ J`, and `R` a syntomic `A/J-algebra` (flat, of finite presentation, with local complete intersection fibres). Put `R^{(1)} := R ⊗_{A/J,ψ} A/p`. Then there is a canonical Frobenius-compatible isomorphism of `E_∞-A-algebras RΓ((R^{(1)}/A)_Δ, O_Δ) ≃ RΓ_crys(R/A)`, where the left side is the cohomology of the prismatic site of `R^{(1)}` and the right side is crystalline cohomology relative to the PD thickening `Spec(A/J) ⊂ Spf(A)`. For `R` smooth this is §1.14.

(A,(p)) crystalline; `J` a PD ideal containing `p`; `R` syntomic over `A/J`. The left side is site cohomology. Its identification with derived prismatic cohomology of `R^{(1)}`, and the extension of the comparison from quasiregular semiperfect `F_p-algebras` to all quasisyntomic `F_p-algebras` by descent, belong to Layer `2` (§2.12, The prism of a quasiregular semiperfectoid ring and Quasisyntomic descent and unfolding) and consume this target; they are not asserted here. For `J ≠ (p)` the reduction to `J = (p)` uses a syntomic lift of `R` to `A/p`, which exists Zariski-locally (a relative global complete intersection lifts by lifting its equations, and flatness is checked on the unchanged fibres); the canonical map of the smooth case glues the local isomorphisms.

(ALB23, Remark 3.1.8 (2); p. 17; ALB23, Remark 3.1.8 (2), last sentence; p. 17.)

*Needs:* [§1.14](#s1-14), [§1.7](#s1-7), [§1.8](#s1-8), [§1.13](#s1-13), [§0.86](#s0-86), [§0.69](#s0-69), CrystallineCohomology §§CR.2.1–CR.2.3, DerivedDeRhamCohomology §§PD.6–PD.7.

**Proof route.** Use the same regular PD-envelope calculation for syntomic presentations and flat descent (BS22 Remark 5.3, p.45).

<a id="s1-16"></a>
<a id="layer-1-hodge-tate-comparison-char-p"></a>

### 1.16 The Hodge–Tate comparison in characteristic p

Consume the affine crystalline Hodge–Tate calculation from PerfectoidSpaces §P4.15.3. For smooth `S/A/p` extend it to the sheaf-level DGA: `β_p(f)²=0` even at `p=2`, giving `η`*:Ω*`≃(H*Δ̄,β_p)`, with `H^i=Ω^i{−i}`. The induced crystalline `Δ` base-change isos hold for all crystalline prism maps, with twists trivialized by `p`.

(A,(p)) is a crystalline prism; `S` is smooth over `A/p`. The source states `(2)` for 'the comparison map from Theorem 4.11', whose construction for `p = 2` rests on Lemma 4.10, itself deduced from Proposition 6.2, whose proof uses this corollary. The order adopted here removes the circle: `(1)` is proved together with `(2)` from the Cartier isomorphism, and Proposition 6.2 then only uses the statement for `η^0` and `η^1` of the affine line. The Cartier isomorphism is imported from DerivedDeRhamCohomology §3.4.

(BS22, §5, introduction, p. 45; Corollary 5.5, p. 49, and its proof, p. 50.)

*Needs:* [§1.0](#s1-0), [§1.14](#s1-14), [§1.11](#s1-11), [§1.10](#s1-10), [§1.12](#s1-12), DerivedDeRhamCohomology §3.4, DerivedDeRhamCohomology §§2.7–2.21, DerivedDeRhamCohomology §§2.7–2.26, 5.8, CrystallineCohomology §§CR.2.1–CR.2.3, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `Algebra.Smooth`, SchemeAndStackFoundations §§4.7–4.8, DerivedDeRhamCohomology §§3.1–3.6.

**Proof route.** Use crystalline Cartier on affine charts and glue; the dyadic square-zero identity is integral (BS22 Corollary 5.5 and proof, pp.49–50).

<a id="s1-17"></a>
<a id="layer-1-crystallization-of-oriented-prism"></a>

### 1.17 Mapping an oriented prism to a crystalline one

Assume (A,(d)) oriented, `A/d` p-torsion-free and `A/(p,d)→A/(p,d^p)`, `x↦x^p`, flat. Then `B=A{φ(d)/p}^∧_p` is discrete, p-torsion-free, `(p,d)-complete` and the PD envelope of `(d)`. The prism map `α=can∘φ_A` has the API below. Mod `p` it factors `A/p→A/(p,d)→A/(p,d^p)→B/p=D_(d)(A/p)`: the legs have finite `Tor` amplitude, are faithfully flat, and are free respectively. Hence completed `α-pullback` is conservative with finite complete `Tor` amplitude and identifies both `Δ` and `Δ̄` of every p-completely smooth `R` with their base changes.

(A,(d)) is an oriented prism with `A/(d)` p-torsion-free; then `p` is a nonzerodivisor on A and `(p,d)` is a regular sequence. The Frobenius hypothesis is: only the flatness of `A/(p,d) → A/(p,d^p)` is used, and this is what Example 3.4 provides for the universal oriented prism; the printed hypothesis 'the Frobenius on `A/p` is flat' is stronger than what is proved there. α is the Frobenius-twisted canonical map; the canonical map `A → B` itself is not a map of prisms to (B,(p)), since the image of `d` is not divisible by `p`.

(BS22, Construction 6.1; p. 51.)

*Needs:* [§1.10](#s1-10), [§0.69](#s0-69), [§0.62](#s0-62), [§0.74](#s0-74), [§0.60](#s0-60), [§0.73](#s0-73), [§0.78](#s0-78), DerivedDeRhamCohomology §§PD.6–PD.7, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

- `Prismatic.Crystalline.crystallization`: Crystalline prism `B` under the displayed hypotheses.
- `Prismatic.Crystalline.crystallizationCan`: Canonical δ-map `can:A→B`.
- `Prismatic.Crystalline.crystallizationMap`: Prism map α.
- `Prismatic.Crystalline.crystallizationMap_apply`: `α=can∘φ_A`.
- `Prismatic.Crystalline.crystallization_isCrystalline`: Prism ideal `(p)`.
- `Prismatic.Crystalline.crystallization_frobenius_unit`: `can(φ_A(d))=p` times a unit.
- `Prismatic.Crystalline.crystallization_cohomology`: `α-completed` base change identifies `Δ_(R/A)` and `Δ_(R_B/B)` for p-completely smooth `R`.

**Checks.**

- `pr1_crystallization_alpha_d`: `α(d)` lies in pB.
- `pr1_crystallization_alpha_eq`: α `=` can ∘ `φ_A`; in particular `α(d) = can(d)^p + p·can(δ(d))`.
- `pr1_crystallization_can_not_prism_map`: If `A/(p,d) ≠ 0` then `can(d) ∉` pB: the untwisted canonical map `A → B` does not carry `(d)` into `(p)`, so it is not a map of prisms (A,(d)) `→` (B,(p)).

**Proof route.** Compute the PD envelope after the twisted map α; its three mod-p factors give conservative finite-Tor pullback (BS22 Construction 6.1, pp.51–52).

<a id="s1-18"></a>
<a id="layer-1-hodge-tate-affine-line"></a>

### 1.18 The Hodge–Tate comparison for the affine line and the vanishing of β(f)²

Consume the oriented affine-line comparison of PerfectoidSpaces §P4.15.3; descend to bounded invertible `I`. For `R=A/I⟨X⟩`, `η⁰:R≃H⁰Δ̄`, `η¹:Ω¹≃H¹Δ̄{1}` and `H^i=0` for `i>1`. The integral one-variable calculation proves `β_I(f)²=0` on every smooth formal `X/A/I`, including at `p=2`.

`(A,I)` is an arbitrary bounded prism; no orientation and no torsion-freeness is assumed. Only the maps `η^0` and `η^1` of §1.12 occur in the statement; the full map `η^*` is constructed afterwards (§1.19). The printed proof refers to `Ω^1_{R/(A/d)}` for a general prism; it is `Ω^1_{R/(A/I)}`.

(BS22, Proposition 6.2, the paragraph before it, and its proof; p. 51; BS22, Lemma 4.10 and the sentence after it; p. 39.)

*Needs:* [§1.12](#s1-12), [§1.16](#s1-16), [§1.17](#s1-17), [§1.10](#s1-10), [§1.7](#s1-7), [§1.8](#s1-8), [§0.81](#s0-81), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, [§0.78](#s0-78).

**Proof route.** Reduce the affine line to the crystalline case by §1.17 and descend its square-zero generator identity (BS22 Lemma 4.10, p.39, and Proposition 6.2, pp.51–52).

<a id="s1-19"></a>
<a id="layer-1-hodge-tate-comparison-map"></a>

### 1.19 The Hodge–Tate comparison map η^*

For smooth formal `X/A/I`, extend `η⁰` uniquely to the DGA map `η`*:Ωhat*`→H`*(Δ̄){*}; on a form `f₀df₁∧⋯∧df_i` it is `f₀β_I(f₁)⋯β_I(f_i)`. The maps are `O_X-linear`, natural in `X` and in bounded prisms; they depend only on the `E∞-object Δ` and its reduced `O_X-algebra` structure. The affine and differential compatibilities are recorded below.

`(A,I)` is a bounded prism and `X` is smooth over `A/I`. The existence of `η^`* uses Lemma 4.10: β_I(f)² = 0 for every local section f of O_X. For p odd this follows from graded commutativity; for p = 2 it is deduced from the affine line (§1.18), by functoriality along A/I⟨T⟩ → O_X(U), T ↦ f. The universal property used is that of the de Rham complex: Ω^*`_{R/k}` is initial among graded-commutative differential graded k-algebras `E` with a k-algebra map `R → E^0` such that squares of the elements `d(r)` vanish (completed form for p-completely smooth `R`).

(BS22, Construction 4.9 and Lemma 4.10; p. 39; BS22, Lemma 4.10 and the sentence after it; p. 39; ALB23, Theorem 3.1.6 and the paragraph before it; p. 17.)

*Needs:* [§1.12](#s1-12), [§1.18](#s1-18), [§1.5](#s1-5), DerivedDeRhamCohomology §§2.7–2.21, DerivedDeRhamCohomology §§2.7–2.26, 5.8, Mathlib `KaehlerDifferential`.

- `Prismatic.HodgeTate.comparisonMap`: `η^i:Ωhat^i→H^i(Δ̄){i}`.
- `Prismatic.HodgeTate.comparisonMap_one`: `η¹(dg)=β_I(η⁰g)`.
- `Prismatic.HodgeTate.comparisonMap_wedge`: `η(ω∧τ)=η(ω)∪η(τ)`.
- `Prismatic.HodgeTate.comparisonMap_d`: `η(dω)=β_Iη(ω)`.
- `Prismatic.HodgeTate.bockstein_eta0_cup_self`: `β_I(η⁰f)²=0`, including `p=2`.

**Checks.**

- `pr1_comparison_map_one_formula`: `η^1_R(f` dg) `= f·β_I(η^0_R(g))`.
- `pr1_comparison_map_base`: For `R = A/I`, `η^0` : `A/I → H^0(Δ̄_{(A/I)/A})` is bijective and `Ω^i = 0` for `i > 0`.
- `pr1_comparison_map_square_zero`: `η^2_R(dg ∧` dg) `= 0 = β_I(g)` ∪ `β_I(g)`, also for `p = 2`.

**Proof route.** Square-zero Bockstein generators give the universal exterior-algebra map; the signed Leibniz rule identifies differentials (BS22 Construction 4.9 and Lemma 4.10, pp.39–40).

<a id="s1-20"></a>
<a id="layer-1-hodge-tate-comparison"></a>

### 1.20 The Hodge–Tate comparison theorem

Extend PerfectoidSpaces §P4.15.3 by canonical twists and étale gluing: on smooth formal `X/A/I`, `η`*:Ω*`≃(H`*Δ̄{*`},β_I`) is a DGA iso. Thus `Δ̄` is perfect with `H^i=Ω^i{−i}`, zero above relative dimension. On affine `X=Spf R` this is `Ω^i{−i}≃H^i(Δ⊗^L_AA/I)`.

`(A,I)` is a bounded prism; `X` is smooth over `A/I (R` p-completely smooth over `A/I`). Without smoothness the statement fails for site cohomology. The twist is `{−i} = ⊗_{A/I} (I/I²)^{⊗ −i}`; there is no Frobenius twist in this comparison. `Ω^i` denotes p-completed differential forms, a finite locally free `O_X-module`.

(BS22, Theorem 4.11; p. 40; BS22, Theorem 6.3 and its proof; p. 52; BS22, Theorem 1.8 (2); p. 4.)

*Needs:* [§1.0](#s1-0), [§1.19](#s1-19), [§1.18](#s1-18), [§1.16](#s1-16), [§1.11](#s1-11), [§1.17](#s1-17), [§1.10](#s1-10), [§1.7](#s1-7), [§0.81](#s0-81), SchemeAndStackFoundations §§2.1–2.6, DerivedDeRhamCohomology §§2.7–2.26, 5.8, SchemeAndStackFoundations §§4.7–4.8.

**Proof route.** Check `η*` on the affine line and étale polynomial charts, then glue with the canonical twists (BS22 Theorem 6.3 and its proof, pp.52–53).

<a id="s1-21"></a>
<a id="layer-1-prismatic-base-change"></a>

### 1.21 Base change for prismatic cohomology

Extend oriented affine base change from PerfectoidSpaces §P4.15.3 to bounded prisms `A→B` without `Tor` assumptions. For smooth formal `X`, completed pullback identifies both `Δ` and `Δ̄` with their values on `X_B`; for qcqs `X` also `RΓ_Δ(X/A)⊗̂^L_AB≃RΓ_Δ(X_B/B)`. At crystalline (A,(p)), scalar φ-base change gives `φ_A*Δ_(R/A)≃Δ_(R¹/A)≃RΓ_crys(R/A)`, with `φ`, and the same for qcqs smooth `X`. General prism Frobenius is not a prism endomorphism.

The global qcqs restriction is necessary for base change of products; BS22 Theorem 1.8(5) omits it, while its sheaf Corollary 4.12 needs none.

(BS22, Corollary 4.12 and its proof; p. 40; BS22, Corollary 4.12, proof; p. 40; BS22, Theorem 1.8 (1), (5) and Remark 5.3; pp. 4, 45.)

*Needs:* [§1.20](#s1-20), [§1.19](#s1-19), [§1.5](#s1-5), [§1.4](#s1-4), [§1.14](#s1-14), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§2.7–2.26, 5.8, SchemeAndStackFoundations §§2.1–2.6.

**Proof route.** Reduce to Hodge–Tate and complete Nakayama; qcqs finite descent commutes with completed base change (BS22 Corollary 4.12 and its proof, p.40).

<a id="s1-22"></a>
<a id="layer-1-de-rham-comparison"></a>

### 1.22 The de Rham comparison (W(A/I) p-torsion-free)

Assume `W(A/I)` is p-regular. For smooth formal `X/A/I`, `Δ_(X/A)⊗̂^L_(A,φ_A)A/I≃Ωhat*_(X/(A/I))`, multiplicatively. Let `q:A→A/I` be the quotient and put `ψ=F∘WittVector.map(q)∘w_A:A→W(A/I)`, equivalently `F∘Delta.wittLift(q)`. This gives `Δ_(R/A)⊗̂^L_(A,ψ)W(A/I)≃RΓ_crys((R/p)/W(A/I))`, relative to the PD ideal `ker(W(A/I)→A/(I,p))`; reduction is the de Rham iso. For qcqs `X` it holds on `RΓ`. All reductions are derived p-completed.

Assume `W(A/I)` p-torsion-free, as when `A/I` is p-torsion-free or `I=(p)` with `A/p` reduced. The reduction is along `A→_(φ)A/I`; untwisted reduction is Hodge–Tate, with `Ω^i{−i}` cohomology. In the proof `ψ(I)⊂FVW(A/I)=pW(A/I)`.

(BS22, Theorem 6.4, the paragraph before it, and its proof; p. 53; BS22, Theorem 6.4, proof; p. 53; BS22, Theorem 1.8 (3); p. 4.)

*Needs:* [§1.21](#s1-21), [§1.14](#s1-14), [§1.4](#s1-4), [§0.56](#s0-56), [§0.74](#s0-74), CrystallineCohomology §§CR.2.1–CR.2.3, DerivedDeRhamCohomology §§2.7–2.26, 5.8, DerivedDeRhamCohomology §§2.7–2.21, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `WittVector`, Mathlib `WittVector.frobenius_verschiebung`.

**Proof route.** Use the Witt crystalline lift with the stated `ψ`, then reduce along its zeroth coordinate (BS22 Theorem 6.4 and its proof, pp.53–54).

<a id="s1-23"></a>
<a id="layer-1-proper-smooth-perfectness"></a>

### 1.23 Perfectness of prismatic cohomology of proper smooth formal schemes

For proper smooth formal `X/A/I`, `RΓ_Δ` is perfect, with Tor-amplitude [0,2dim], and arbitrary bounded-prism base change. Its reduction is perfect with finite graded pieces `RΓ(X,Ω^i){−i}[−i]`, `0≤i≤dim`.

`(A,I)` is a bounded prism; `A/I` need not be noetherian. `X` is proper and smooth over `Spf(A/I)`: quasi-compact, separated, of finite relative dimension, with `X ⊗ Z/p^n` proper and smooth over `A/(I,p^n)` for all `n`. Perfectness is asserted for the complex of global sections, not for the individual cohomology modules `H^i_Δ(X/A)`, which need not be finitely presented or flat.

(BS22, Theorem 1.8, final sentence, p.5.)

*Needs:* [§1.0](#s1-0), EnhancedDerivedSheaves §E1.9 (`perfect_proper_pushforward`), DerivedDeRhamCohomology §5.23 (effectivity and perfectness for the proper smooth p-adic tower), [§1.20](#s1-20), [§1.21](#s1-21), [§1.5](#s1-5), [§0.81](#s0-81), DerivedDeRhamCohomology §§5.1–5.7, 5.17, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, SchemeAndStackFoundations §§4.7–4.8, SchemeAndStackFoundations §§2.1–2.6.

**Proof route.** Apply `perfect_proper_pushforward` to `Ω^i_(X_n/A_n)` at each finite level, then DerivedDeRhamCohomology §5.23’s compatible-perfect-system argument. The finite Hodge–Tate filtration is perfect; complete Nakayama lifts perfectness to `Δ` (BS22 Theorem 1.8, final sentence, p.5).

<a id="s1-24"></a>
<a id="layer-1-p-torsion-free-h0-syntomic"></a>

### 1.24 p-torsion-freeness for syntomic algebras and its completion hypothesis

Let `(A,I)` be a bounded prism with A p-torsion-free. Assume in addition that the I-power torsion of `A/p` is bounded, locally after trivialising the invertible ideal `I`. Equivalently, the transition system `((A/I^n)[p])_n` is pro-zero. For a p-completely syntomic `A/I-algebra S`, prove `SyntomicPrismatic.p_torsion_free`: `H⁰((S/A)_Δ,O_Δ)` is p-torsion-free. Here p-completely syntomic means that `S` is p-complete with bounded p-power torsion, `S⊗ᴸ_{A/I}(A/I)/p` is the ordinary quotient `S/p`, and `(A/I)/p→S/p` is syntomic. Layer `2` identifies this site cohomology with `H⁰(Δ_{S/A})`. The extra completion hypothesis holds for crystalline, transversal, perfect and noetherian prisms, including the perfect `A_inf` bases used in prismatic Dieudonné theory. It cannot be omitted for arbitrary bounded prisms.

The source is ALB23, Lemma 5.1.6, p.76. Its statement has no extra completion hypothesis; the completed-flatness step in its proof has the larger generality ruled out below. The valid argument uses BS22, Proposition 3.13, pp.33–35, together with the one-element bounded-torsion argument of BMS2, Lemmas 4.6–4.7, pp.18–19. Replacing the element `p` in that module argument by a generator `d` of `I` uses the same Koszul-tower proof and no primality property of `d`.

*Needs:* [§1.7](#s1-7), [§1.8](#s1-8), [§0.86](#s0-86), [§0.81](#s0-81), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

**Argument.** Locally write `I=(d)`. For a derived `(p,d)-complete`, `(p,d)-completely` flat A-complex `B`, BS22 Lemma 3.7 gives discreteness. If `A/p` has bounded d-power torsion, its derived d-complete, d-completely flat base change `B⊗ᴸ_A A/p` is discrete by the one-element Koszul-tower argument of BMS2 Lemmas 4.6–4.7. Since `p` is regular on A, `H^(−1)` of this base change is `B[p]=0` (`CompleteFlat.p_torsion_free`). Descent detects this vanishing; apply it to the first Čech–Alexander term and then its `H⁰` equaliser. The ideal is checked before invoking p-complete flatness.

For the negative control set `T₀=Z_p[[d]]`, `J_n=(p,d^n)`, `M=∏_(n≥1)J_n`, `T=Z_p[d,t]^∧_(p,d)`. Let `(tm)_1=0` and `(tm)_(n+1)=dm_n`; this continuous action extends to `T` since `dJ_n⊂J_(n+1)`. Put `A=T⊕M` with `M²=0`, `φ_T(d)=d^p+p`, `φ_T(t)=t^p` and `φ_A(a,m)=(φ_T(a),0)`. Both `p` and `d` are regular, so `δ_A(a,m)=(δ_T(a),−a^(p−1)m)`, and `δ_A(d)=1`. Since `J_n/dJ_n=Z_p·p⊕F_p·d^n`, all p-torsion of `A/d` is killed by `p`. Quotients by the finitely generated `(p,d)^r` commute with products, making `M` and A classically complete. Regular `d` and the finite filtration of `A/d^n` by `A/d` make each quotient's p-torsion bounded; the iterated Koszul limit is thus `lim_n lim_r A/(d^n,p^r)=A`, proving derived completeness. Therefore (A,(d)) is a p-regular bounded prism.

Let `e_n` have `p` in component `n` and zero elsewhere. In `M/pM`, `d^n e_n=0` and `te_n=de_(n+1)`. The representative of `t^r e_n` is `pd^r` in component `n+r`, nonzero modulo `pJ_(n+r)` because `d^r∉(p,d^(n+r))`. After `R=A[1/t]`, the classes `z_n=t^(1−n)e_n` satisfy `d^n z_n=0`, `dz_(n+1)=z_n` and `z₁≠0`. For `B=LΛ_(p,d)R`, flatness of `R/A` and BS22 Lemma 3.7 give a discrete bounded prism. The perfect A-complex `A/p` commutes with completion, and the degree `−1` Milnor sequence of the two-term Koszul tower gives

```text
B⊗ᴸ_A A/p ≃ LΛ_d(R/p),
B[p] = H^(−1)(LΛ_d(R/p)) ≃ lim_n (R/p)[d^n] ≠ 0.
```

There is no degree `−2` term; transitions multiply by `d`, so `(z_n)` is the required nonzero limit element. Moreover `B/d=S=((A/d)[1/t])^∧_p`. Bounded p-torsion and BMS2 Lemma 4.7 make `S` p-completely étale over `A/d`. Every relative prism over `S` inverts `t` modulo `d`, hence inverts `t` by the Jacobson property; its map from `A[1/t]` extends uniquely through `B`. Thus `B` is initial, `H⁰((S/A)_Δ,O_Δ)=B` and the unqualified syntomic assertion fails even for this étale `S`. This counterexample is deduced from BS22 Lemma 3.7 and the completion definitions, not attributed to ALB23.

**Checks.**

- `SyntomicPrismatic.crystalline`: For `(A,I)=(Z_p,(p))` and `S=F_p`, the structure cohomology is `Z_p`, whereas the Hodge–Tate structure cohomology is `F_p`. The theorem concerns `O_Δ`.
- `SyntomicPrismatic.perfect_base`: For `A=A_inf(R)`, `A/p` is reduced. If `d^n x=0` then `(dx)^n=0`, hence `dx=0`; the d-torsion bound is one. This covers the perfect-prism applications, including `p=2`.
- `CompleteFlat.shift_two_terms`: At `p=2`, `t e₁=d e₂` is nonzero modulo 2M and `d²e₂=0`. Dividing by the now invertible `t` gives `d(t⁻¹e₂)=e₁`, rather than a zero transition.
- `CompleteFlat.localization_counterexample`: The sequence `(t^(1−n)e_n)_n` is nonzero in `lim_n(R/p)[d^n]`, so the completed localisation `B` has nonzero p-torsion although A is p-torsion-free.
- `CompleteFlat.boundedness_not_enough`: `A/d` has all its p-power torsion killed by `p`, while `A/p` has d-torsion of every order. Boundedness modulo `I` is distinct from the extra hypothesis modulo `p`.
- `SyntomicPrismatic.zero_base`: For `A=0` and `S=0`, both structure cohomology and its p-torsion are zero. No faithfulness or nonzero-ring assertion is used.

For a perfect `A_inf` base, this applies to the coordinate rings of finite locally free group schemes and to p-completely syntomic algebras of the form `O_C⟨x⟩/(x^n−p)`. If p-torsion-freeness of A itself is dropped, `S=A/I` already gives `H⁰=A` and disproves the conclusion whenever `A[p]≠0`.

<a id="s1-26"></a>
<a id="layer-1-acceptance-computations"></a>

### 1.26 polynomial algebra, étale chart, crystalline base, Frobenius twist

The comparison calculations are: `(1)` for `R=(A/I)⟨X₁,…,X_n⟩`, the completed Čech–Alexander model of A⟨X⟩ computes `Δ`, and `H^i(Δ̄){i}` is free on ordered products of `β_I(X_j)`, with `β_I(X_j^m)=mX_j^(m−1)β_I(X_j)`; `(2)` along a completely étale polynomial chart `R→S`, `Δ̄_S=Δ̄_R⊗̂ᴸ_RS` and the same basis gives `Ω^i_S`; `(3)` over `(Z_p,(p))`, `Δ_(F_p[X]/Z_p)=[Z_p⟨X⟩→Z_p⟨X⟩dX]`, `d(X^m)=mX^(m−1)dX`, has `H⁰=Z_p` and `H¹=coker d`. Its reduction has `H⁰=F_p[X^p]`, `H¹=F_p[X^p]X^(p−1)dX` and `β_p(X)=[X^(p−1)dX]`. `(4)` For `k=F_(p²)`, `p≥5`, take a smooth affine Weierstrass elliptic curve `R̃=k[X,Y]/(Y²−X³−aX−b)` with `j∉F_p`. It is not k-isomorphic to its Frobenius twist `R̃^(1)`. Thus `Δ_(R̃^(1)/W(k))≃φ_A`*Δ_(R̃/W(k))≃RΓ_crys(R̃/W(k)), and Δ_(R̃/W(k))⊗ᴸ_(W(k),φ)k≃Ω^*`_R̃/k`; untwisted `Δ̄` has cohomology `Ω^i_R̃/k` and is de Rham of `R̃⊗_(k,Frob^−1)k`, a different curve.

`(1)`, `(2)`: any bounded prism. `(3)`: the crystalline prism `(Z_p,(p))`. `(4)`: `k = F_{p²}`, `p ≥ 5`, a, `b ∈ k` with j-invariant outside `F_p`. In `(3)` the twist is invisible because `F_p[X]^{(1)} = F_p[X]` over `F_p`; `(4)` is chosen so that the twist changes the algebra. In `(4)` the two `W(k)-module` structures on `RΓ_crys` differ by `φ`; the complexes are abstractly isomorphic as complexes of abelian groups since `φ` is an automorphism of `W(k)`.

(BS22, Remark 4.19; p. 43; BS22, Example 1.9 (1); p. 5.)

*Needs:* [§1.20](#s1-20), [§1.11](#s1-11), [§1.14](#s1-14), [§1.21](#s1-21), [§1.22](#s1-22), [§1.7](#s1-7), [§1.12](#s1-12), [§1.16](#s1-16), [§0.74](#s0-74), CrystallineCohomology §§CR.2.1–CR.2.3.

**Proof route.** Compute on polynomial and étale charts using §§1.14,1.20; a `non-F_p` elliptic j-invariant detects the coefficient Frobenius twist (BS22 Theorem 1.8, pp.3–4).

<a id="s1-27"></a>
<a id="layer-1-prismatic-hyperdescent"></a>

### 1.27 Prismatic hyperdescent

On the flat site of bounded prisms, the assignments `(B,J)↦B` and `(B,J)↦B/J`, valued in the respective derived categories, satisfy hyperdescent. A flat hypercover of an object computes its derived sections by totalisation. The same holds on a relative prismatic site and after derived pushforward to the small étale site.

Bounded prisms; finite jointly completely faithfully flat covering families; a universe cut-off is fixed. The statement uses derived totalisations, not an ordinary equalizer of rings.

(BS22, Corollary 3.12 and Definition 4.1, §3–4; pp. 33, 36.)

*Needs:* [§1.1](#s1-1), [§1.2](#s1-2), EnhancedDerivedSheaves Layer E2.

**Proof route.** Use the enhanced complete-flat Čech descent and its hypercover criterion (BS22 Corollary 3.12, p.33).

### Examples

For `R=A/I` the relative site has final object (A,I,id), `Δ=A` and `Δ̄=A/I`. For `R=(A/I)⟨X⟩`, the model begins `C⁰=A{X}^∧` and `C¹=A{X,Y}{(X−Y)/I}^∧`. The Hodge–Tate comparison sends dX to `β(X)` in `H¹(Δ̄){1}`; `β(1)=0` while `β(X)≠0` when `A/I≠0`. Thus `β` is not R-linear. At `p=2` its square vanishes by the affine-line argument, not solely by graded commutativity. Over the crystalline prism `(Z_p,(p))`, reduction of the de Rham differential of `x^p` and division by `p` gives `x^(p−1)dx`, fixing the Bockstein sign.

**§1.1.** For `Z_p→W(F̄_p)`, the completely flat Čech complex `W(F̄_p)→W(F̄_p⊗F̄_p)→…` has `H⁰=Z_p` and no positive cohomology.

**§1.3.** For `X = Spf(R)` and a p-completely étale `R → S`, (`ν_`*O_Δ)(Spf S) = H^0((S/A)_Δ, O_Δ). For U = X the formula gives ν_*`F(X) = H^0((X/A)_Δ, F)`, the global sections. The lift of a Zariski cover `Spf(R_f)` of `Spf(B/IB)` is the `(p,I)-completed` localisation of `B` at a lift of `f`, with its unique δ-structure.

**§1.5.** `Δ̄_{(A/I)/A} = A/I`. For an oriented prism (A,(d)) every twist M{i} is identified with `M` by `d^i`, and the triangle for `i = 0` is the reduction of `Δ →d Δ` modulo `d²`. For the q-de Rham prism `(Z_p[[q−1]],([p]_q))`, `I/I²` is free on the class of `[p]_q`.

**§1.6.** For `R = A/I` the cohomology of `O_Δ` in the Zariski topology of `((A/I)/A)_Δ` is A in degree `0`. The `étale-topology` version is the one used when a statement is checked on an étale chart of `X`.

**§1.8.** For `R = A/I` the theorem gives `Δ_{R/A} = A`. Two presentations of `A/I⟨X⟩`, by A⟨X⟩ and by A⟨X,Y⟩ with `Y ↦ 0`, give quasi-isomorphic complexes through the presentation A⟨X,Y,X′⟩. `H^0(Δ_{R/A})` is the equaliser of the two coface maps `C^0` ⇉ `C^1`.

**§1.10.** A completely flat map of bounded prisms satisfies the hypothesis with amplitude `0`. The map α of §1.17 satisfies the hypothesis. For `A → A′` with infinite complete `Tor` dimension this finite-amplitude theorem does not apply.

**§1.11.** For a p-completed localisation `S = R⟨1/f⟩`: `Δ̄_{S/A} = Δ̄_{R/A} ⊗̂^L_R R⟨1/f⟩`. Étale chart: for a p-completely étale map `A/I⟨X_1,…,X_n⟩ → S`, `Δ̄_{S/A} = Δ̄_{A/I⟨X⟩/A} ⊗̂^L S`; with the Hodge–Tate comparison for the polynomial ring this gives `H^i(Δ̄_{S/A}) = Ω^i_{S/(A/I)}{−i}`. For `R = S` the functor `F` is the identity.

**§1.12.** For `R = A/I` the cohomology is `A/I` in degree `0` and `β_I = 0`. For `R = A/I⟨X⟩`, `β_I(X)` is a generator of `H^1(Δ̄_{R/A}){1}` ≅ `Ω^1_{R/(A/I)}` (§1.18). For a crystalline prism and `I = (p)`, `β_p` is the Bockstein of crystalline cohomology modulo `p²`, which on the de Rham complex of a lift sends the class of `x^p` to the class of `x^{p−1}dx`.

**§1.13.** For `B = k` (no variables) the map is the identity. For `B =` k[x] and `N = B^{•,(1)}` the lemma says that `k[x^p]-type` Čech complex and the Čech complex of `k →` k[x] are quasi-isomorphic; both are resolutions of `k`. The decomposition `k[E(pM)] ⊗_k` k[ES] ≅ k[EM] is an isomorphism of semi-cosimplicial modules only: codegeneracies do not preserve `S (p = 2, r = 1`: (1,1) `↦ 2 ∉ S`).

**§1.14.** `A = Z_p`, `I = (p)`, `R = F_p[x]`: `Δ_{F_p[x]/Z_p} ≃ RΓ_crys(F_p[x]/Z_p)`, the de Rham complex of `Z_p⟨x⟩`; here `R^{(1)} = R`. `A = W(k)` with `k` perfect and R̃ smooth over `k`: `Δ_{R̃^{(1)}/W(k)} ≃ RΓ_crys(R̃/W(k))`; the twist is by the Frobenius of `k`. `A = A_crys(O_C/p)` and `I = ker(A_crys → O_C/p)`, a PD ideal strictly containing `(p)`: for `R` smooth over `O_C/p`, `Δ_{R^{(1)}/A_crys} ≃ RΓ_crys(R/A_crys)`, with `ψ` : `O_C/p → A_crys/p` induced by the Frobenius.

**§1.15.** `R = F_p[x]/(x^n)` over `(Z_p,(p))`: the prismatic site cohomology of `R^{(1)} = R` is `RΓ_crys(R/Z_p)`, computed by the PD envelope of `(x^n)` in `Z_p⟨x⟩` with its de Rham complex. `R = k[x,y]/(xy)` over `W(k)`: a syntomic, non-smooth example. For `R` smooth the statement and the map coincide with §1.14.

**§1.16.** `S = F_p[X]` over `Z_p`: `H^0(Δ̄) = F_p[X]`, `H^1(Δ̄) = F_p[X]·β_p(X)`, `H^i = 0` for `i ≥ 2`; under the crystalline comparison `β_p(X)` is the class of `X^{p−1}dX`. `S = F_2[X] (p = 2)`: `β_2(X)² = 0`. Base change: for a map of crystalline prisms `Z_p → W(k)`, `Δ_{F_p[X]/Z_p} ⊗̂ W(k) ≃ Δ_{k[X]/W(k)}`.

**§1.17.** For the universal oriented prism `A_0` the ring `D_0 = A_0{φ(d)/p}^∧` receives `Z_p`, and `(Z_p,(p)) → (D_0,(p))` is a map of crystalline prisms. For the Breuil–Kisin prism `(W(k)[[u]],(E(u)))` the construction gives the p-completed PD envelope of `(E(u))`, a ring of Breuil type, with α induced by `φ`. `α(d) = φ(d)` is `p` times a unit; the canonical image of `d` is not in pB.

**§1.18.** `A = Z_p`: `Δ̄_{F_p[X]/Z_p}` has `H^0 = F_p[X]`, `H^1 = F_p[X]·β(X)`, nothing else. q-de Rham prism: for `R = Z_p[ζ_p]⟨X⟩` over `(Z_p[[q−1]],([p]_q))`, `H^1(Δ̄_{R/A})` is free of rank one over `R`. `p = 2`: `β_I(f)² = 0` for every `f`, which graded commutativity alone does not give.

**§1.19.** `η^1_R(f` dg) `= f·β_I(g)`. For `R = A/I` the map is the identity of `A/I` in degree `0`. For an étale map `R → S` the maps `η^`*_R and η^*`_S` are compatible with `Ω^i_R ⊗_R S` ≅ `Ω^i_S` and with §1.11.

**§1.20.** Smooth polynomial algebra: for `R = A/I⟨X_1,…,X_n⟩`, `H^i(Δ̄_{R/A})` is free over `R` on the classes `β_I(X_{j_1})` ⋯ `β_I(X_{j_i})`, `j_1 <` … `< j_i`, twisted by `{−i}`. Torus: `R = A/I⟨X^{±1}⟩` gives `H^1(Δ̄_{R/A}){1}` free over `R` on `η^1(dX/X) = X^{−1}β_I(X)`. `A_inf` prism and `R = O_C⟨X⟩`: `H^1(Δ̄)` ≅ `Ω^1_{R/O_C}{−1}`, the Breuil–Kisin–Fargues twist of BMS1.

**§1.21.** Crystalline base: for `(Z_p,(p)) → (W(k),(p))`, `Δ_{F_p[X]/Z_p} ⊗̂ W(k) ≃ Δ_{k[X]/W(k)}`. For the map of prisms α `= can∘φ` : `(A_inf, ker θ) → (A_crys,(p))` (Construction 6.1 with `d = ξ`) and `X` smooth, quasi-compact and quasi-separated over `O_C`: `RΓ_Δ(X/A_inf) ⊗̂^L_{A_inf,α} A_crys ≃ RΓ_Δ(Y/A_crys)` with `Y = X ×_{Spf O_C} Spf(A_crys/p) = (X_{O_C/p})^{(1)}`; by §1.14 for the PD ideal `ker(A_crys → O_C/p)` the right side is `RΓ_crys(X_{O_C/p}/A_crys)`, the `A_crys-comparison` of BMS1. Non-example: for `X` an infinite disjoint union of copies of `Spf(F_p)` over `(Z_p,(p))` and `B = Z_p⟨x⟩`, the map `(∏ Z_p) ⊗̂ Z_p⟨x⟩ → ∏ Z_p⟨x⟩` is not surjective.

**§1.22.** `A = Z_p[[u]]`, `I = (E(u))`, `A/I = O_K` p-torsion-free: `Δ_{X/A} ⊗^L_{A,φ} O_K ≃ Ω^*_{X/O_K}`. `A = W(k)`, `I = (p)`, `k` perfect: `Δ_{R/W(k)} ⊗^L_{W(k),φ} k ≃ Ω^*_{R/k}`; with the Cartier isomorphism this is consistent with `Δ̄_{R/W(k)}` having cohomology `Ω^i_{R/k}`. A hypothesis check: `W(F_p[x]/(x²))` has p-torsion, and for A a p-torsion-free δ-lift of `F_p[x]/(x²)` the theorem does not apply.

**§1.23.** For `X=P¹_(A/I)`, `RΓ_Δ` is a perfect A-complex of Tor-amplitude `[0,2]`; its Hodge–Tate reduction has `H⁰=A/I`, `H²=(A/I){−1}` and no other cohomology. A proper abelian formal scheme of relative dimension `g` has amplitude [0,2g], with `H¹` of rank 2g after field base change. Properness matters: over `(Z_p,(p))`, the affine line has `H⁰(Δ̄)=F_p[x]`, which is not finite over `F_p`, so its global `Δ` is not perfect.

**§1.26.** On the torus `R=(A/I)⟨X^±1⟩`, `H¹(Δ̄){1}=R·η¹(dX/X)`. The four calculations above detect the sign of the twist, the Bockstein and the base Frobenius.

**§1.27.** The Čech hypercover of a flat cover recovers Corollary 3.12. The zero prism has the empty covering family and zero derived module of sections.

### Dependencies

Layers `0`; DerivedDeRhamCohomology §§PD.6–PD.7, CrystallineCohomology §§CR.1.1–CR.1.3, CrystallineCohomology §§CR.2.1–CR.2.3, DerivedDeRhamCohomology §§3.4–3.6, DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§2.7–2.26, 5.8, DerivedDeRhamCohomology §§2.7–2.21, DerivedDeRhamCohomology §§3.1–3.6, DerivedDeRhamCohomology §3.4, DerivedDeRhamCohomology §§5.1–5.7, 5.17, EnhancedDerivedSheaves Layer E2, SchemeAndStackFoundations §§2.1–2.6, SchemeAndStackFoundations §§4.7–4.8. Exact inputs are given in the supplier contracts; internal construction dependencies are linked above.

## Layer 2: Animated inputs and perfectoidization

Extend the polynomial theory by completed left Kan extension, retaining the animated input and its conjugate filtration. Regular quotient and quasiregular semiperfectoid computations distinguish site cohomology from its derived extension. Frobenius perfection is a completed colimit, and perfectoidization is its derived reduction. Base independence and arc descriptions require the additional perfect-site inputs stated above.

<a id="s2-0"></a>
<a id="layer-2-local-arc-foundations"></a>

### 2.0 Arc descent for the comparisons

Use valuation rings from ordinary commutative algebra, the schemes and sheaves of SchemeAndStackFoundations §§1.1, 2.1–2.6, and the bounded formal geometry constructed in §1.0 from SchemeAndStackFoundations §§4.7–4.8. PerfectoidSpaces supplies perfectoid rings, André covers and the universal semiperfectoid quotient. This prefix constructs the topologies and descent statements used by the perfect-site, étale and logarithmic comparisons.

Define `Arc.VCover` for qcqs schemes by lifting maps from valuation rings of arbitrary rank after injective local extensions of valuation rings. Prove `Arc.VCover.finitePresentationRefinement`: a finitely presented v-cover `Y→X` of qcqs schemes has a refinement `Z→Y` over `X` factoring as `Z→X′→X`, with the first map a quasi-compact open covering and the second a proper finitely presented surjection. Prove stability of v-covers under composition and base change. (Rydh, [Submersions and effective descent of étale morphisms](https://arxiv.org/abs/0710.2488), Theorems 2.8, 3.12 and Remark 3.13; ARC Definition 1.1, p.2, and Proposition 5.2, p.37.)

*Needs for v-covers and refinement:* ordinary valuation rings; Mathlib scheme morphisms, `AlgebraicGeometry.IsProper` and `AlgebraicGeometry.LocallyOfFinitePresentation`; SchemeAndStackFoundations §0.9 (scheme limits and Noetherian approximation).

**Checks for v-covers and refinement.** The identity of `Spec Z_p` is a v-cover and admits the identity refinement. A proper finitely presented surjection, such as `P¹_X→X`, admits itself as the proper factor with identity open covering. A finite affine open covering admits itself as the open factor with identity proper factor. For a rank-two valuation ring `V` and height-one prime `q`, `Spec(V_q) ⊔ Spec(V/q)→Spec V` fails the v-cover predicate: the identity valuation test cannot lift through either piece after an injective local extension.

Define `Arc.Cover (f : Y → X)` for qcqs schemes by the following lifting condition. Given a rank-at-most-one valuation ring `V` and `Spec V → X`, there must be an injective local extension `V → W` of rank-at-most-one valuation rings and a compatible `Spec W → Y`. Define `Arc.Site` using finite affine refinements of covering families and Zariski localization. Prove closure under composition and base change and that the resulting covering families generate a Grothendieck topology. (Bhatt–Mathew, The arc-topology, Definition 1.2, pp.2–3; Proposition 2.1 and Remark 2.2, p.9.)

- `Arc.Cover`, `Arc.Site`: the lifting predicate and its associated site, with the universe of test valuation rings explicit.
- `Arc.Cover.baseChange`, `Arc.Cover.comp`, `Arc.Cover.ofVCover`: stability and the comparison with the v-topology.
- `Arc.Site.affineBasis`: the affine refinement equivalence, compatible with restriction to an open subscheme.

**Checks for the covering predicate.** The identity of `Spec Z_p` is a cover by choosing `W=V`. The empty scheme does not cover `Spec F_p`, as the identity map from `F_p` has no lift. The reduction `Spec F_p → Spec F_p[ε]/(ε²)` is a cover, because every map to a valuation ring annihilates `ε`; requiring faithful flatness of the displayed scheme map would reject it.

**Checks for the site.** A two-open affine Zariski covering is a covering family after the finite affine refinement. The empty family does not cover the nonempty scheme `Spec F_p`. For a rank-two valuation ring `V` with a height-one prime `q`, `Spec(V_q) ⊔ Spec(V/q)` covers `Spec V` in the arc-topology although it is not a v-cover; this distinguishes the rank-one testing convention (ARC Proposition 2.8 and Corollary 2.9, p.10).

Define `ArcPCover (R → S)` over `Z_p` by testing rank-one valuation rings `V` in which `p` is a pseudouniformizer, permitting an injective local extension of valuation rings before lifting. Define `ArcP.Equivalence` by bijectivity on maps to p-complete absolutely integrally closed valuation test rings. The topology generated by these covers is the algebraic `arc_p` topology. This is different from imposing an adic completeness condition on every algebra under consideration. (Bhatt–Mathew, The arc-topology, Definition 6.14, p.51; Definition 6.19 and Example 6.20, pp.53–54, with `t=p.`)

- `ArcPCover`, `ArcP.Site`, `ArcP.Equivalence`: the predicates and generated topology, with the pseudouniformizer condition in their signatures.
- `ArcPCover.baseChange`, `ArcPCover.comp`: the structural closure properties.
- `ArcP.Equivalence.complete`, `ArcP.Equivalence.killPowerTorsion`, `ArcP.Equivalence.integralClosure`: the three invariance inputs for generic-fibre cohomology.

**Checks for the topology.** The identity of `Z_p` is a cover. `Z_p → Q_p` is not a cover: a map to the test ring `Z_p` cannot extend across `p⁻¹`, even after a local extension. `Z_p → F_p` is not a cover, since the same test map cannot annihilate `p`. These exclude conventions allowing `p` to be a unit or zero in the test rings.

**Checks for arc_p equivalences.** `Z_p → Z_p` is an equivalence. `Z_p[ε]/(pε,ε²) → Z_p` is an equivalence because the target valuation rings have no p-torsion. `Z_p → Z_p⟨T⟩` is not an equivalence: evaluation at `T=0` and `T=1` give different lifts of the same map from `Z_p`. In particular an `arc_p` cover need not be an `arc_p` equivalence.

Define `FormalArc.Site` on p-adic formal schemes using Zariski covers and qcqs maps with the lifting property for p-complete rank-one valuation rings and faithfully flat, p-complete rank-one extensions. Give the full subcategory of locally perfectoid formal schemes the induced topology, denoted `FormalArc.PerfectoidBasis`. (Bhatt–Scholze BS22, Definition 8.7, Lemma 8.8, Remark 8.9, pp.67–68.)

- `FormalArc.Site`, `FormalArc.Cover`: the formal site and covering predicate, including continuity of the morphisms.
- `FormalArc.PerfectoidBasis`: the induced site on formal schemes locally of the form `Spf S` for perfectoid `S`.
- `FormalArc.coverByPerfectoids`, `FormalArc.coverByValuations`: covers by that basis and by products of p-complete rank-one valuation rings with algebraically closed fraction fields.
- `FormalArc.restrictToBasis`: the sheaf-category equivalence associated with the basis.

**Checks for the formal site.** `Spf Z_p → Spf Z_p` is a cover. `Spf F_p → Spf Z_p` is not a cover, as the `Z_p` valuation test cannot lift. A nilpotent reduction has the same valuation tests, so `Spf F_p → Spf F_p[ε]/(ε²)` is a cover; ordinary structure sections on all formal schemes consequently do not satisfy this topology's sheaf condition.

**Checks for the basis.** The p-completion of the ring of integers in an algebraic closure of `Q_p` supplies a perfectoid cover of `Spf Z_p`. A characteristic-p perfection supplies a cover of `Spf F_p[T]`. `Spf Z_p` itself is not a perfectoid basis object: it has no element whose p-th power generates an ideal containing `p` but smaller than the unit ideal. Thus being p-complete does not suffice for membership in this basis.

*Needs:* EtaleCohomologyFoundations §§0.5–0.6 (qcqs continuity), F.0.4 (`VanishingCycles.universalHomeomorphismEtaleEquivalence`), F.1 (`VanishingCycles.finiteCoefficientCohomology`) and F.2.1 (`VanishingCycles.properBaseChange`) for arbitrary torsion; EnhancedDerivedSheaves Layer E2 for cohomological descent; §1.0 for bounded formal schemes and their sites.

Prove v-descent first using `Arc.VCover.finitePresentationRefinement`, arbitrary-torsion proper base change and continuity, as in ARC Proposition 5.2. Then apply valuation excision to obtain ARC Theorem 5.4.

For a torsion étale sheaf `G` on a base, `X ↦ RΓ(X_ét,G)` satisfies arc descent and excision. For a finite coefficient ring Λ, the bounded constructible categories `Dᵇ_cons(X_ét,Λ)`, also with a fixed cohomological range, satisfy hypercomplete arc descent. For a formal-gluing datum `(A → B,I)`, with `I` finitely generated and `A/Iⁿ` ≅ `B/IⁿB` for every `n`, the square of torsion étale cohomology on `Spec A`, `Spec B` and their complements of `V(I)` is cartesian. If `(A,I)` is henselian, cohomology on `Spec A` \ `V(I)` agrees with that on `Spec Â_I` \ `V(IÂ_I)`. Finally, `R ↦ RΓ_ét(Spec R̂_p[1/p],G)` is an `arc_p` sheaf. Prove these as torsion statements first; the `Z_p` versions are derived inverse limits of the finite-level assertions. (Bhatt–Mathew ARC, Theorem 5.4, p.38; Theorem 5.13, pp.42–43; Theorem 6.4, pp.48–49; Theorem 6.11, p.50; Corollary 6.17, pp.51–52.)

On the perfectoid formal basis prove that the presheaf `O` is an arc sheaf with `RΓ_arc(Spf S,O)` ≅ `S` for perfectoid `S`. This is the structure-sheaf acyclicity needed by §2.30’s perfect-prismatic-site comparison, rather than an assertion about every p-complete ring. (Bhatt–Scholze BS22, Proposition 8.10, pp.67–68.) For the formal-gluing square check `I=A`, when both open complements are the whole spectra and its vertical maps are identities, and `I=0`, when both complements are empty. Do not apply the henselian theorem to `I=A` unless `A=0`, since a henselian ideal lies in the Jacobson radical. Check the nilpotent affine reduction above, where `O` on the entire formal site cannot have the acyclicity just proved on the perfectoid basis.

<a id="s2-1"></a>
<a id="layer-2-derived-prismatic-cohomology"></a>

### 2.1 Derived prismatic cohomology

Extend PerfectoidSpaces §P4.15.3 by orientation descent: left Kan extend the smooth affine functor to animated `A/I-algebras`, then `(p,I)-complete`. This agrees with extension from finite polynomial algebras and preserves sifted colimits in the complete category. The coherent `E∞-functor`, its Frobenius and Hodge–Tate reduction have the API below; for formal schemes use §2.4.

The two enhanced left Kan extensions, from smooth and from polynomial inputs, agree by Hodge–Tate; their coherence comes from §1.7, not an arbitrary resolution choice.

(BS22, Construction 7.6; p. 56; ALB23, Definition 3.1.9 (published: Definition 3.9); p. 18.)

*Needs:* [§1.4](#s1-4), [§1.7](#s1-7), [§1.9](#s1-9), [§1.20](#s1-20), [§1.5](#s1-5), [§0.72](#s0-72), EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, EnhancedDerivedSheaves §E5:animation.1, EnhancedDerivedSheaves Layer E3 (relative Kan extensions), EnhancedDerivedSheaves §E5:abstract.2, DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `DerivedCategory`, Mathlib `CategoryTheory.SimplicialObject`.

- `Prismatic.Derived.cohomology`: Completed left Kan value `Δ_(R/A)`.
- `Prismatic.Derived.map`: Functorial map on animated `A/I-algebras`.
- `Prismatic.Derived.map_id`: Identity law.
- `Prismatic.Derived.map_comp`: Composition law.
- `Prismatic.Derived.frobenius`: Semilinear `φ_R`.
- `Prismatic.Derived.frobenius_naturality`: `φ_SΔ(f)=φ_*Δ(f)φ_R`.
- `Prismatic.Derived.hodgeTate`: `Δ̄=Δ⊗^L_A A/I` in `D(R)`.
- `Prismatic.Derived.unit`: `A→Δ`.
- `Prismatic.Derived.constIso`: Constant simplicial and ordinary presentations agree, with site agreement only in §2.12’s range.
- `Prismatic.Derived.hodgeTateUnit`: Natural `R→Δ̄`, equal to `η⁰` on smooth inputs.
- `Prismatic.Derived.cohomology_realization`: `Δ` preserves geometric realization in the derived complete category, characterized by its polynomial values.
- `Prismatic.Derived.hodgeTate_const`: Polynomial-resolution computation of `Δ̄` on constant inputs, compatible with `R→Δ̄`, without singular-site identification.

**Checks.**

- `pr2_derived_base_ring`: `Δ_{(A/I)/A}` is A, in degree `0`.
- `pr2_derived_const_agrees`: The value of the simplicial functor on a constant simplicial algebra `R` is isomorphic to `Δ_{R/A}`.
- `pr2_derived_product`: `Δ_{(A/I × A/I)/A}` is A `× A`, in degree `0`.
- `pr2_derived_not_pi0_invariant`: When `A/I ≠ 0` there is a simplicial `A/I-algebra R` with `H^{−1}(Δ̄_{R/A}) ≠ 0`; so `Δ̄_{R/A}` is not the Hodge–Tate cohomology of the site of `π_0(R)`, which lies in `D^{≥0}`.
- `pr2_derived_frobenius_base_value`: For `R=A/I`, `Δ_(R/A)=A` and its semilinear Frobenius is `φ_A`. For the q-de Rham prism it sends `q` to `q^p`, so it is not the identity.

**Proof route.** Consume the oriented polynomial left Kan construction; Hodge–Tate descent glues orientations and identifies extension from smooth algebras (BS22 Construction 7.6, p.56).

<a id="s2-2"></a>
<a id="layer-2-conjugate-filtration"></a>

### 2.2 Conjugate filtration on derived Hodge–Tate cohomology

Descend the conjugate filtration of PerfectoidSpaces §P4.15.3 across orientations. It is the multiplicative, increasing N-filtration of `Δ̄` obtained by completed left Kan extension of `τ≤i` on smooth algebras, with `gr_i≃∧^iLhat_(R/(A/I)){−i}[−i]`. Its completed colimit is `Δ̄` and `Fil₀≃R`; the coherences and cup product are the API below.

Filtered objects use `(N,≤)→D(R)` with completed tensor and graded pieces (DerivedModuleAlgebra §§1.1–1.9 and DerivedDeRhamCohomology §§1.10–1.23).

(BS22, Construction 7.6; p. 56; ALB23, Proposition 3.1.10 (published: Proposition 3.10); p. 18.)

*Needs:* [§2.1](#s2-1), [§1.20](#s1-20), [§1.5](#s1-5), EnhancedDerivedSheaves Layer E3 (relative Kan extensions), EnhancedDerivedSheaves §E5:animation.1, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

- `Prismatic.Derived.conjFil`: `Fil_i^conj` for animated `R` and `i≥0`.
- `Prismatic.Derived.conjFilMap_refl`: Identity transition.
- `Prismatic.Derived.conjFilMap_trans`: Composition of transitions.
- `Prismatic.Derived.conjFilι`: `Fil_i→Δ̄`.
- `Prismatic.Derived.conjFilMap_ι`: Transitions commute with the inclusions.
- `Prismatic.Derived.conjFilZeroIso`: `Fil₀≃R`.
- `Prismatic.Derived.conjGr`: `gr_i=cofib(Fil_(i−1)→Fil_i)`.
- `Prismatic.Derived.conjFilMap`: Functorial filtered maps, with the induced cotangent exterior-power graded maps.
- `Prismatic.Derived.conjFil_cofiber`: Canonical cofibre sequence, `Fil_(−1)=0`.
- `Prismatic.Derived.conjFilCup`: Products `Fil_i⊗Fil_j→Fil_(i+j)`, compatible with unit, transitions and the cotangent exterior product.

**Checks.**

- `pr2_conj_fil_zero`: `Fil_0^conj Δ̄_{R/A} ≃` R[0].
- `pr2_conj_fil_base`: For `R = A/I` the map `Fil_i^conj → Δ̄_{R/A}` is an isomorphism for every `i`.
- `pr2_conj_fil_smooth_truncation`: For `R` smooth over `A/I`, `H^n(Fil_i^conj Δ̄_{R/A}) = 0` for `n > i`: the filtration is the canonical one.
- `pr2_conj_fil_not_postnikov`: For `f` a nonzerodivisor of `A/I`, put `R=(A/I)/(f)` and assume R nonzero with bounded p-power torsion. Then `Fil_i^conjΔ̄_(R/A)→Δ̄_(R/A)` is not an isomorphism for any `i`, although `Δ̄_(R/A)` is discrete. In contrast, for `(A,I)=(Z_p[[u]],(u−p))`, `f=p` and `R=A/I`, the base Check gives an isomorphism at every stage.

**Proof route.** Left Kan extend the smooth truncation filtration, then glue its canonical ideal twists (BS22 Construction 7.6, p.56).

<a id="s2-3"></a>
<a id="layer-2-derived-hodge-tate-comparison"></a>

### 2.3 Derived Hodge–Tate comparison

Descend PerfectoidSpaces §P4.15.3 with canonical twists: `gr_i^conjΔ̄≃(∧^iL_(R/(A/I))){−i}[−i]^∧`, multiplicatively and naturally; `i=0` gives `R` and smooth inputs recover Hodge–Tate. For discrete bounded-p-torsion `R` with `Lhat` amplitude `[−1,0]`, `gr_i` lies in [0,i] and `Δ,Δ̄` in `D≥0`. If `Lhat[−1]` is completely flat, `gr_i=Γ^i(Lhat[−1]){−i}` is discrete completely flat; `Δ̄` is discrete bounded-p-torsion, `R→Δ̄` completely faithfully flat, and `Δ` discrete I-regular. If `Lhat=0`, `R≃Δ̄`.

Derived `exterior/divided-power` décalage is DerivedModuleAlgebra §§0.1–0.17, 0.25; complete flatness and amplitude are BMS2 §4.1.

(BS22, Construction 7.6; p. 56; ALB23, Proposition 3.1.10 (published: Proposition 3.10); p. 18; BMS2, Lemmas 4.6 and 4.7; p. 19.)

*Needs:* [§2.2](#s2-2), [§2.1](#s2-1), [§1.20](#s1-20), [§1.19](#s1-19), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

**Proof route.** Apply the conjugate graded formula and exterior-power décalage to the completed cotangent complex (BS22 Construction 7.6, p.56).

<a id="s2-4"></a>
<a id="layer-2-derived-prismatic-etale-descent"></a>

### 2.4 Étale descent and derived prismatic cohomology of formal schemes

For completely étale animated `R→R′`, `Δ̄⊗̂^L_RR′≃Δ̄_(R′/A)`, preserving conjugate filtration. `Δ` with `φ` has completely étale Čech descent. Hence on bounded formal `X/A/I`, these affine values glue to a complete `E∞-sheaf` with semilinear `φ`; its reduction is `O_X-linear` with exhaustive multiplicative conjugate filtration `gr_i=(∧^iL_(X/(A/I))){−i}[−i]^∧`. The affine étale sections recover `Δ_(R/A)` with `φ`.

For every bounded p-complete `A/I`-algebra `B`, use §1.0's abstract adapter to construct the étale sheafification and formal gluing of the affine animated functor from §2.1. Its completely étale descent gives the stated affine recovery; no quasisyntomic hypothesis on these charts is required.

The bounded-torsion hypothesis on `X` in `(3)` is the one of the arXiv v4 text of ALB23 Proposition 3.1.11; BS22 state the globalisation for every p-adic formal scheme.

(BS22, Construction 7.6 (2); p. 56; ALB23, Proposition 3.1.11 (published: Proposition 3.11); p. 18.)

*Needs:* [§1.0](#s1-0) (formal-scheme carrier and site, abstract gluing), [§2.1](#s2-1), [§2.2](#s2-2), [§2.3](#s2-3), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§5.1–5.7, 5.17.

**Proof route.** Use polynomial étale descent and the affine-open limit with the stated bounded-torsion formal hypothesis (ALB23 Proposition 3.1.11, p.18).

<a id="s2-5"></a>
<a id="layer-2-first-conjugate-piece-cotangent"></a>

### 2.5 The first conjugate piece is the cotangent complex over the prism

Let `(A, I)` be a bounded prism and `R` a derived p-complete simplicial `A/I-algebra`. There is a canonical isomorphism in `D(R)`, natural in `R`, `α_R` : `(L_{R/A}{−1}[−1])^∧ ≃ Fil_1^conj Δ̄_{R/A}`, where `L_{R/A}` is the cotangent complex of `R` over A (not over `A/I`). It is an isomorphism of extensions: the transitivity triangle `R ≃ (R ⊗^L_{A/I} L_{(A/I)/A}{−1}[−1])^∧ → (L_{R/A}{−1}[−1])^∧ → (L_{R/(A/I)}{−1}[−1])^∧`, formed with `L_{(A/I)/A} ≃ I/I²[1]`, is carried to `Fil_0^conj → Fil_1^conj → gr_1^conj` with the identifications `gr_0^conj = R` and `gr_1^conj = (L_{R/(A/I)}{−1}[−1])^∧` of the derived Hodge–Tate comparison. For p-completely smooth `R` it reads `L_{R/A}^∧ ≃ (τ^{≤1}Δ̄_{R/A}){1}[1]`. For a p-adic formal scheme `X` over `A/I` that is locally the formal spectrum of a p-complete ring with bounded `p^∞-torsion` the isomorphisms glue to `α_X` : `(L_{X/Spf(A)}{−1}[−1])^∧ ≃ Fil_1^conj Δ̄_{X/A}` in `D(X)`.

All cotangent complexes are derived p-completed; the hypothesis on `X` is the one added in Proposition 3.1.11 of the arXiv v4 text of ALB23.

(ALB23, Proposition 3.2.1 (published: Proposition 3.12) and its proof; p. 18; BS22, Proposition 4.15; p. 41.)

*Needs:* [§2.2](#s2-2), [§2.3](#s2-3), [§2.4](#s2-4), [§1.19](#s1-19), [§1.2](#s1-2), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

**Proof route.** Identify the first conjugate extension with completed cotangent transitivity (ALB23 Proposition 3.2.1, p.18).

<a id="s2-6"></a>
<a id="layer-2-conjugate-splitting-and-lifting"></a>

### 2.6 Splitting of the first conjugate piece and liftings modulo I²

Let `(A, I)` be a bounded prism and `X` a p-completely flat p-adic formal scheme over `A/I`. The extension `Fil_0^conj Δ̄_{X/A} = O_X → Fil_1^conj Δ̄_{X/A} → gr_1^conj Δ̄_{X/A} = (L_{X/(A/I)}{−1}[−1])^∧` has a splitting in `D(X)` exactly when a p-completely flat lift of `X` across `A/I²→A/I` exists. More precisely, the class of this extension in `Ext^1_{O_X}(gr_1^conj, gr_0^conj) = Ext^2_{O_X}((L_{X/(A/I)})^∧{−1}, O_X)` is, up to sign, the obstruction class to lifting `X` over `A/I²`.

`X` is locally the formal spectrum of a p-complete ring with bounded `p^∞-torsion` (automatic for p-completely flat `X` over the bounded `A/I`). ALB23 phrase the splitting as "isomorphic in `D(X)` to a complex with zero differentials"; the target uses the precise form from their proof, the vanishing of the extension class.

(ALB23, Corollary 3.2.3 (published: Corollary 3.14) and Proposition 3.2.2; p. 20; ALB23, Proposition 3.2.2 (published: Proposition 3.13); p. 20; BS22, Remark 4.14; p. 40.)

*Needs:* [§2.5](#s2-5), [§2.2](#s2-2), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, SchemeAndStackFoundations §1.1.

`Prismatic.Deformation.globalObstruction`: for a ring `S`, an invertible ideal `I` and a flat `S/I-scheme Y`, the transitivity class in `Ext²(L_(Y/(S/I)),(I/I²)⊗O_Y)` is the obstruction to a flat `S/I²-lift`, up to the boundary sign. Its nullhomotopy groupoid is the lift groupoid, with differences `Ext¹` and automorphisms `Ext⁰` (ALB23 Proposition 3.2.2, p.20). The formal version uses continuous completed derivations; DerivedModuleAlgebra §§1.1–1.9 and DerivedDeRhamCohomology §§1.10–1.23 identifies their complexes with compatible derived p-power reductions. The square-zero flat criterion and bounded-torsion discreteness make affine lifts ordinary, and SchemeAndStackFoundations §§4.7–4.8 glues them. If `A/I` has p-torsion, use derived reductions of the extension, not ordinary reductions of its kernel.

**Checks.** For `X=Spf(A/I)`, the relative cotangent complex and the obstruction both vanish, and the base lift exists. For an étale `X` over `Spf(A/I)`, the completed relative cotangent complex vanishes, so the lift is unique up to unique isomorphism. For a smooth affine `X` the positive `Ext` groups of its finite projective cotangent module vanish, while global smooth schemes can have nonzero `Ext²` from sheaf cohomology; the construction must use the global derived `Hom` rather than a product of affine `Ext²` groups. If a lift exists, changing its chosen identification is detected by `Ext⁰` and changing the lift by `Ext¹`; replacing the groupoid by a bare existence predicate loses these tests.

**Proof route.** Glue the affine square-zero lifting groupoids along hypercovers; the total degree-two cocycle is the transitivity class, and its nullhomotopies are the flat lifts (ALB23 Proposition 3.2.2 and Corollary 3.2.3, p.20).

<a id="s2-7"></a>
<a id="layer-2-derived-prismatic-base-change"></a>

### 2.7 Base change for derived prismatic cohomology

Extend PerfectoidSpaces §P4.15.3 by orientation descent: for bounded-prism `A→B`, `J=IB` and animated `R/A/I`, completed scalar extension gives `Δ_(R/A)⊗̂^L_AB≃Δ_(R_B/B)`, with Frobenius. Here `R_B=R⊗̂^L_(A/I)B/J`. Modulo `J` it preserves the conjugate filtration and its cotangent graded identifications via `L_(R_B/(B/J))=L_(R/(A/I))⊗^L_RR_B`; no flatness is assumed.

No flatness of `A → B` is assumed; `R ⊗^L_A B` is computed in animated rings, and `A/I ⊗^L_A B = B/J` because `I` is invertible and `B` is I-torsion-free.

(BS22, Construction 7.6 (4); p. 56.)

*Needs:* [§2.1](#s2-1), [§2.2](#s2-2), [§1.21](#s1-21), [§0.79](#s0-79), [§0.73](#s0-73), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves §E5:animation.1.

**Proof route.** Consume oriented base change and descend its canonical invertible-ideal twists (BS22 Construction 7.6, p.56).

<a id="s2-8"></a>
<a id="layer-2-kunneth-formula"></a>

### 2.8 Colimit preservation and the Künneth formula

Descend colimit preservation from PerfectoidSpaces §P4.15.3: the `E∞` functor `R↦Δ_(R/A)` preserves all colimits in the complete categories, with `Δ_(A/I)=A`. In particular `Δ_(R₁)⊗̂^L_(Δ_(R₃))Δ_(R₂)≃Δ_(R₁⊗̂^L_(R₃)R₂)`, compatibly with `φ`; the left completion is `(p,I)`, the right `p`.

(BS22, Construction 7.6 (5); p. 56; ALB23, Proposition 3.5.1 (published: Proposition 3.30) and its proof; p. 25.)

*Needs:* [§2.1](#s2-1), [§2.3](#s2-3), [§1.20](#s1-20), EnhancedDerivedSheaves §E5:animation.1, EnhancedDerivedSheaves §E5:abstract.1, EnhancedDerivedSheaves §E5:abstract.2, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23.

**Proof route.** Completed left Kan extension preserves the stated colimits; orientation descent preserves the symmetric monoidal maps (BS22 Construction 7.6, p.56).

<a id="s2-9"></a>
<a id="layer-2-kunneth-formula-formal-schemes"></a>

### 2.9 Künneth formula for smooth formal schemes

Fix a bounded `(A,I)`. Require the formal schemes `X` and `Y` over `Spf(A/I)` to be quasi-compact, quasi-separated and p-completely smooth. Their prismatic complexes satisfy `RΓ(X ×_{Spf(A/I)} Y, Δ_{X ×_{Spf(A/I)} Y/A}) ≃ RΓ(X, Δ_{X/A}) ⊗̂^L_A RΓ(Y, Δ_{Y/A})`, an isomorphism of commutative algebras in `D_comp(A)` compatible with Frobenius, the completed tensor product being derived `(p, I)-adic`.

The hypothesis quasi-compact quasi-separated is part of the statement in the arXiv v4 text of ALB23.

(ALB23, Corollary 3.5.2 (published: Corollary 3.31); p. 26.)

*Needs:* [§2.8](#s2-8), [§2.4](#s2-4), [§1.20](#s1-20), [§1.4](#s1-4), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§5.1–5.7, 5.17.

**Proof route.** Apply completed Künneth on affines and qcqs descent (BS22 Construction 7.6, p.56).

<a id="s2-10"></a>
<a id="layer-2-comparison-to-prisms"></a>

### 2.10 The comparison map from derived prismatic cohomology to prisms and to site cohomology

For each prism `(B,J)` under `(A,I)` with `R→B/J`, construct the natural Frobenius-compatible evaluation `Δ_(R/A)→B`. Their coherent limit gives `toSite:Δ_(R/A)→RΓ((R/A)_Δ,O)`, compatible with augmentation on smooth algebras and then with completed left Kan extension; it is an equivalence in the smooth range. The Hodge–Tate evaluations and reduction square are part of the construction, not an inference that arbitrary singular site cohomology is left Kan extended.

The cohomology of `O_Δ` on the site of bounded prisms is the limit over the category, because `O_Δ` is a sheaf with vanishing higher Čech cohomology (Layer `1`, BS22 Corollary 3.12 and Remark 4.5). When `Δ_{R/A}` is discrete, `ev_{(B,J)}` is a map of δ-rings (§2.12).

(BS22, Proof of Lemma 7.7 (3); p. 57; BS22, §8.1, before Proposition 8.5; p. 64; ALB23, §3.4, before Proposition 3.4.1; p. 24.)

*Needs:* [§2.1](#s2-1), [§1.7](#s1-7), [§1.1](#s1-1), [§1.2](#s1-2), [§0.73](#s0-73), EnhancedDerivedSheaves Layer E3 (relative Kan extensions), EnhancedDerivedSheaves §E5:animation.1.

- `Prismatic.Derived.toPrism`: Evaluation `Δ_(R/A)→B`.
- `Prismatic.Derived.toPrism_frobenius`: Evaluation commutes with Frobenius.
- `Prismatic.Derived.toPrism_naturality`: Naturality in `R` and the prism object.
- `Prismatic.Derived.siteCohomology`: Limit of the structure sheaf over the relative site.
- `Prismatic.Derived.toSite`: Canonical `Δ→siteCohomology`.
- `Prismatic.Derived.toSite_isIso_of_smooth`: It is an equivalence for p-completely smooth `R`.

**Checks.**

- `pr2_to_prism_base`: For `R = A/I` and `(B, J) = (A, I)`, the map `Δ_{(A/I)/A} → A` is an isomorphism.
- `pr2_to_site_smooth`: For `R = A/I × A/I` the comparison map `c_R` is an isomorphism.
- `pr2_to_prism_frobenius_base`: For `R = A/I` and `(B, J) = (A, I)` the map ev commutes with `φ_A`.
- `pr2_evaluation_base_identity`: For `R=A/I` and the base-prism object (A,I,id), evaluation `ev:Δ_(R/A)→A` is the identity under `Δ_(R/A)=A`; the site and all-prism limit comparison maps have this same base value.

**Proof route.** Use the smooth Čech augmentations, then the universal property of completed left Kan extension (BS22 Construction 7.6, p.56).

<a id="s2-12"></a>
<a id="layer-2-derived-agrees-with-site"></a>

### 2.12 Agreement with site cohomology: smooth algebras and the discrete case

Consume smooth agreement and the QRSP prism of PerfectoidSpaces §P4.15.3. After orientation descent, if animated `R` has discrete `Δ̄`, then `Δ` is a discrete I-regular `δ-A-algebra`, its evaluation maps are δ-maps, and `(Δ,IΔ)` is a prism, bounded iff `Δ̄` has bounded p-torsion. Among all prisms over A receiving `R` it is weakly initial; the initial prism is its idempotent retract. It is not asserted initial in general. Sections 2.13 and 2.15 identify the retract with `Δ` in their ranges, giving site comparison there.

The prism category here includes unbounded prisms. Weak initiality must not be replaced by initiality for general inputs.

(BS22, Lemma 7.7 and its proof; p. 57; BS22, Construction 7.6 (1); p. 56.)

*Needs:* [§2.1](#s2-1), [§2.3](#s2-3), [§2.10](#s2-10), [§2.11](#s2-11), [§1.7](#s1-7), [§1.4](#s1-4), [§0.17](#s0-17), [§0.72](#s0-72), [§0.73](#s0-73), [§0.60](#s0-60), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, [§0.58](#s0-58).

**Proof route.** Consume smooth agreement and the retract argument, then descend orientations; discrete `Δ̄` makes `Δ` a weakly initial prism (BS22 Lemma 7.7, pp.57–58).

<a id="s2-13"></a>
<a id="layer-2-regular-quotient-prismatic-envelope"></a>

### 2.13 Prismatic cohomology of a regular quotient is the prismatic envelope

Consume the oriented regular envelope of PerfectoidSpaces §§P4.15.2–P4.15.3; retain the nonprincipal gluing and canonical graded formula. For finite Koszul-regular `f_i` mod `I`, `J=(I,f_i)`, bounded-p-torsion `R=A/J` has `gr_i^conjΔ̄=Γ^i_R(J/(J²+I)){−i}`, finite projective; `Δ̄` is discrete completely faithfully flat over `R`, `Δ` discrete I-regular and initial among all prisms over A receiving `R`. Locally `I=(d)`, `Δ=A{f_i/d}^∧`; under §0.86’s relative complete-regularity hypotheses it is that envelope. These identifications glue, without choosing a global orientation.

Put `L_R=(I/I²)⊗_(A/I)R`. For `r>0` regular relations, their conormal basis identifies `gr_i^conjΔ̄` with `binom(r+i−1,i)` copies of `L_R^(−i)`. Thus each piece is finite locally free of that rank. A trivialization of `L_R^(−i)`, in particular one induced by an orientation of `I`, gives a global basis. Its general module interface asserts `Module.Finite`, `Module.Projective` and this stalk rank (Stacks Tag 00NX, Lemma 10.78.2).

Regular means Koszul-regular; all δ-adjunctions and completions in the local formula are animated.

(BS22, Example 7.9; p. 59; BS22, Proposition 3.13; p. 33.)

*Needs:* [§2.3](#s2-3), [§2.12](#s2-12), [§2.7](#s2-7), [§2.10](#s2-10), [§0.86](#s0-86), [§0.60](#s0-60), [§0.55](#s0-55), [§0.63](#s0-63), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `RingTheory.Sequence.IsRegular`.

**Proof route.** Consume the oriented regular envelope and glue its divided-power graded pieces with canonical ideal twists (BS22 Lemma 7.7, pp.57–58).

**Checks.**

- For `r=0`, `Δ=A`; the graded rank is 1 at `i=0` and 0 otherwise.
- For an oriented prism and `r>0`, the relation basis and the orientation give a basis of `gr_i` of size `binom(r+i−1,i)`. The degree-zero piece is canonically `R` for every prism.
- A nonprincipal boundary occurs at `p=2`. Let `B=F₂[x,y]/(y²+xy+x³+1)`, `t=y+1` and `h=y+x²`. This is the smooth elliptic curve with its point at infinity `O` removed. The ideal `N=(x,t)` of `P=(0,1)` is invertible, `t²=xh`, and `N²=(x)`. It is nonprincipal: a generator would have divisor `P−O` on the projective curve and give a degree-one map to `P¹`.

  Put `C=W(B)^∧_2`, `X=[x]`, `T=[t]`, `H=[h]`. The ring `C` is 2-torsion-free. The opens `D(X),D(H)` cover, and `T²=XH`. The transition `G=X/T` lifts `N` to an invertible C-module `M` with local generators `d₁=Gd₂`; it remains nonfree after reduction to `B`. On `A₀=Sym_C(M)^∧_(2,I₀)`, where `I₀` is the augmentation ideal, the Witt Frobenius extends by `φ(d₁)=d₁²+2X`, `φ(d₂)=d₂²+2H`. These formulas agree because `F(G)=G²` and `G²H=X`. Both local generators are regular and distinguished, `A₀/I₀=C` is 2-torsion-free, and `(A₀,I₀)` is a bounded prism with conormal line `M`.

  For `A=(A₀[u])^∧_(2,I₀)` with `δ(u)=0` and the regular relation `u`, the quotient is `C` and `gr_1=M^∨` is nonfree. For the affine line over `A₀/I₀`, `H¹(Δ̄)=C⟨v⟩⊗_C M^∨` is likewise nonfree, as specialization at `v=0` shows.

<a id="s2-13a"></a>
<a id="layer-2-quasiregular-quotient-initiality"></a>

### 2.13a Relative initiality for quasiregular quotients

Let `(A,I)` be any bounded prism and `A/I→S` a surjection. Suppose `S` is derived p-complete with bounded p-power torsion and `(L_(S/(A/I))[−1])^∧_p` is p-completely flat over `S`. Then `Δ_(S/A)` is a discrete δ-A-algebra, its Hodge–Tate reduction is p-completely faithfully flat over `S` with bounded p-power torsion, and `(Δ_(S/A),IΔ_(S/A))` is initial among all prisms over `A` with an `A/I`-map `S→T/IT`. Target prisms may be unbounded. If `I=(d)`, identify it with the general envelope of `(A,ker(A→S))` from §0.93. Neither perfection of `A` nor a regular sequence generating the original kernel is required. ([KY](#ref-ky), Proposition 4.17 and Lemma 4.18 with proof, pp.39–40; [BL22](#ref-bl22), Corollary 4.1.17, Variant 4.1.19 and Remark 4.1.20, pp.81–82, Remark 4.3.9 and Lemma 4.3.10, p.87.)

Supply `Prismatic.quasiregularQuotient.initial`, the unique δ-A-lift to every such prism; `Prismatic.quasiregularQuotient.bounded`, including complete faithful flatness of its reduction; `Prismatic.quasiregularQuotient.envelopeEquiv`, compatible with δ, the A-map and the map from `S`; and `Prismatic.quasiregularQuotient.map`, functorial for maps of quotient diagrams satisfying these hypotheses. Functoriality does not assert equivalence under arbitrary changes of `A`.

**Proof route.** The conjugate graded pieces `Γ^i_S((L_(S/(A/I))[−1])^∧_p){−i}^∧_p` are discrete and p-completely flat. Their completed filtered assembly gives discreteness, complete faithful flatness and bounded torsion of the Hodge–Tate reduction. By §2.12 there is a natural idempotent `e_S` on the resulting prism with initial image. Choose generators `f_j` of the kernel and use the auxiliary quotient `S′=((A/I)⟨X_j^(1/p^∞)⟩/(X_j−f_j))^∧_p`, mapping to `S` by sending every root variable to zero. Its relation classes surject onto the shifted cotangent complex modulo `p`; divided powers and the conjugate filtration therefore give a surjection `Δ_(S′/A)→Δ_(S/A)`. Naturality reduces `e_S=id` to this auxiliary case. Completed filtered colimits reduce to finitely many variables. Replace `A` by `A′=(A[X_1^(1/p^∞),…,X_r^(1/p^∞)])^∧_(p,I)`, with δ zero on each root. The reduction is relatively p-completely formally étale, so the prismatic complex is unchanged. At each finite root level the relations `X_i−f_i` are successively monic, with free quotients over `A/I`; §2.13 applies after completion. Thus `e=id` and the prism is initial even for unbounded targets. In the orientable case §0.93 has the same mapping problem, giving the envelope comparison. ([BS22](#ref-bs22), Lemma 7.7, pp.57–58, Example 7.9 and Proposition 7.10, pp.59–60.)

An envelope of `ker(A→S)` induces a map `S→C/IC` by quotient factorization, and its mapping property gives unique lifts for the surjective quotient diagram. The identification with derived `Δ`, its boundedness and the functorial comparison retain all the cotangent and torsion hypotheses of this section.

**Checks.**

- `quasiregularQuotient_identity`: `S=A/I` gives the relative prism `A`, including bounded nonperfect bases.
- `quasiregularQuotient_fatPoint`: for `A=ℤ_p⟨x⟩`, `δ(x)=0`, `I=(p)` and `S=𝔽_p[x]/(x²)`, the shifted cotangent complex over `𝔽_p[x]` is free of rank one. The envelope adjoins `x²/p` with its δ-relations; this example does not require `S` to be semiperfectoid.
- `quasiregularQuotient_unboundedTargets`: the lift equivalence includes unbounded target prisms, beyond the bounded site.
- `quasiregularQuotient_nonsurjective`: `𝔽_p→𝔽_p[x]` is not surjective and its cotangent complex has the degree-zero generator `dx`. Its positive-degree Hodge–Tate cohomology precludes this discrete initiality conclusion.
- With `r>0` regular relations, `gr_i` is finite locally free of rank `binom(r+i−1,i)`, with its conormal twist retained; for `r=0` the rank is 1 at `i=0` and 0 otherwise. A trivialization of the inverse i-th power of the pulled-back conormal line gives global freeness; the nonprincipal Check of §2.13 has nonfree `gr_1`. For `(A,I)=(ℤ_p⟨x⟩,(p))` and the relation `x^p`, the envelope is the p-completed PD envelope of `(x)`; for `A_inf(O_C)` and the relation `p` it is `A_inf{p/ξ}^∧`.

*Needs:* [§2.12](#s2-12), [§2.13](#s2-13), [§0.93](#s0-93), [§2.3](#s2-3) and [§2.10](#s2-10) (derived Hodge–Tate comparison and conjugate filtration), DerivedModuleAlgebra §§0.1–0.17 (cotangent complexes) and §§1.1–1.9 (complete flatness and completion), [§0.58](#s0-58) (animated δ-algebras). A logarithmic application requires identification with this ordinary relative complex after exactification, together with the cotangent and torsion hypotheses above.

<a id="s2-14"></a>
<a id="layer-2-derived-input-higher-homotopy"></a>

### 2.14 A derived input with nonzero higher homotopy

Let `B=A/I≠0` for a bounded prism `(A,I)`, and put `R=B⊗̂ᴸ_{B⟨x⟩}B`, with `x↦0` on both sides. This is the free p-complete animated B-algebra on B[1]; its underlying B-complex is `B⊕B[1]`. The following statements hold.

1. `L_{R/B}≃R[1]`, and `gr_i^conj Δ̄_{R/A}≃R{−i}` for every `i≥0`.
2. `Δ̄_{R/A}` lies in `D^{[−1,0]}`. The inclusion `Fil_0^conj=R` has an R-linear retraction after forgetting the filtration, so `H^{−1}(Δ̄_{R/A})` contains `B` as a direct summand. The retraction is not asserted canonical.
3. `Δ_{R/A}≃A⊗̂ᴸ_{Δ_{B⟨x⟩/A}}A`. The comparison `c_R:Δ_{R/A}→Δ_{π₀R/A}=A` is not an equivalence: its reduction has nonzero negative cohomology, whereas `A⊗ᴸ_A B=B`.
4. Nondiscreteness of `R` does not imply nondiscreteness of `Δ_{R/A}`. For `(A,I)=(Z_p,(p))`, let `P=Γ_{Z_p}(Z_p·u)` be the divided power polynomial algebra, with basis `u^{[n]}`, and let P̂ be its derived p-completion. Then `Δ_{R/Z_p}` is represented by the two-term complex [P̂ `ε →` P̂] in degrees `[−1,0]`, with differential `εu^{[n]}↦(n+1)u^{[n+1]}`. This differential is injective. Consequently `Δ_{R/Z_p}` is the discrete ring `coker(u:P̂→P̂)`, with nonzero p-torsion. In particular the stronger assertion that this example always has nondiscrete unreduced cohomology is false.

Twists are tensor powers of the invertible B-module `I/I²`. Tensor products and the displayed completions are derived. No conclusion about discreteness before reduction is drawn from `(2)`. In `(4)`, P̂ consists of coefficient sequences tending to zero p-adically in the divided power basis; the quotient is the actual cokernel of the completed multiplication map. It is not replaced by a coefficientwise quotient or an unqualified ordinary completion of its uncompleted cokernel.

(BS22, Construction 7.6, p.56, and Theorem 5.2, pp.44–45; Bha12, Lemma 8.3(3)–(4), Theorem 8.4 and the proof of Proposition 8.5, pp.31–32; Warning 8.9, p.33. The two-term model is the derived base-change calculation in that proof with the parameter specialized to zero; the regular-quotient conclusion of Proposition 8.5 is not applied to a zero relation.)

*Needs:* [§2.1](#s2-1), [§2.3](#s2-3), [§2.8](#s2-8), [§2.10](#s2-10), [§1.14](#s1-14), EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§2.7–2.26, 5.8, CrystallineCohomology §§CR.2.1–CR.2.3.

**Argument.** For `(1)`, cotangent base change gives `L_{R/B}=R[1]`, and `exterior/divided-power` décalage gives `∧^i_R(R[1])[−i]=R`. For `(2)`, write `F_i=Fil_i^conj`. Inductively `F_i∈D^{[−1,0]}`; the extension `F_{i−1}→F_i→R{−i}` splits in `D(R)`, since `Hom_R(R{−i},F_{i−1}[1])=H¹(F_{i−1}{i})=0`. Choose each splitting to retain the preceding inclusion. Thus the uncompleted filtered colimit is a direct sum of twists of `R`, and its first summand `R` has a compatible retraction. Its two homology modules are sums of invertible B-modules and have the same uniform bound on p-power torsion as `B`. Derived p-completion therefore has no extra cohomology outside `[−1,0]`; completing the retraction preserves the complete summand `R`. This proves survival through completion, rather than presuming it from the finite stages. Part `(3)` is completed Künneth, followed by reduction.

For `(4)`, apply §2.8’s Künneth formula to the polynomial comparison of §1.14. The derived de Rham base-change calculation of Bha12 Lemma 8.3, for `Z_p[x]→Z_p`, `x↦0`, followed by base change along that same map, gives `P̂⊗̂ᴸ_{Z_p[x]}Z_p`, where `x` acts on P̂ by `u`. Resolve `Z_p` over `Z_p[x]` by `[Z_p[x]→Z_p[x]]`, multiplication by `x`; the resulting differential is multiplication by `u`. As `u·u^{[n]}=(n+1)u^{[n+1]}`, it has zero kernel even on restricted coefficient sequences. The class of `u^{[p]}` in the cokernel is nonzero (reduce its coefficient modulo `p`), while `p·u^{[p]}=u·u^{[p−1]}` vanishes. All steps use p-completion, with no Hodge completion.

**Checks.**

- `DerivedPrismatic.derivedInput_survives_completion`: `R` is a retract of `Δ̄` after completion; its nonzero `H^{−1}=B` cannot disappear at the completed colimit.
- `DerivedPrismatic.derivedInput_not_piZero`: The reduced comparison to `B` kills that negative direct summand, so `c_R` is not an equivalence.
- `DerivedPrismatic.crystalline_derivedInput_discrete`: In the crystalline example multiplication by `u` on P̂ is injective, although its reduction modulo `p` has kernel containing `u^{[p−1]}`. The unreduced complex is discrete and the reduced complex is not.
- `DerivedPrismatic.crystalline_derivedInput_torsion`: The nonzero class `u^{[p]}` is killed by `p`; at `p=2` this is `u^{[2]}`, with `u·u=2u^{[2]}`.
- `DerivedPrismatic.reduction_not_discreteness_test`: The discrete A-module `A/I` has `H^{−1}((A/I)⊗ᴸ_A A/I)=I/I²`. This independently rejects the same invalid inference without a prismatic calculation.

<a id="s2-16"></a>
<a id="layer-2-quasisyntomic-covers-lift-to-prisms"></a>

### 2.16 Lifting quasisyntomic covers to the prismatic site

Consume the oriented lifting input of PerfectoidSpaces §P4.15.4; descend it for invertible `I`. For relative quasisyntomic `R/A/I`, choose a polynomial surjection `(A/I)⟨x_j⟩→R` and put `S=(A/I)⟨x_j^(1/p^∞)⟩⊗̂^L_((A/I)⟨x_j⟩)R`. This root cover has `S/p` relatively semiperfect and `Lhat_(S/(A/I))[−1]` completely flat. Put `B=Δ_(S/A)`; then `R→S→B/IB` is completely faithfully flat. `A→B` is completely flat, faithfully so if `A/I→R` is. For perfect A the perfected prism map has the same flatness and faithful-flatness assertions.

Quasisyntomic is relative here, including complete flatness over `A/I`. The oriented André input is consumed, not reconstructed.

(BS22, Proposition 7.11 and its proof; p. 60; ALB23, Proposition 3.3.8 (published: Proposition 3.20); p. 22.)

*Needs:* [§2.3](#s2-3), [§2.12](#s2-12), [§0.73](#s0-73), [§0.83](#s0-83), [§0.81](#s0-81), [§1.2](#s1-2), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§5.1–5.7, 5.17.

**Proof route.** Descend the oriented André lifting cover along changes of local generator (BS22 Proposition 7.11, p.60).

<a id="s2-17"></a>
<a id="layer-2-quasisyntomic-descent"></a>

### 2.17 Quasisyntomic descent and unfolding

Let `C` consist of discrete bounded-p-torsion `A/I-algebras B` with `Lhat_(B/(A/I))` of amplitude `[−1,0]`, and quasisyntomic covers. `Δ` with `φ`, `Δ̄` and each conjugate step have Čech descent on `C`. If A is perfect, BMS2 Lemma 4.34 includes all quasisyntomic rings over `A/I`; a QRSP Čech cover then computes `Δ` as a limit of discrete δ-rings. This unfolding lies in `D≥0` and is independent of the perfect prism under `B`. No descent is asserted for flat maps lacking the cotangent bound.

For perfect `A` and formal schemes with quasisyntomic `A/I`-charts, construct `Prismatic.Formal.qsyn_rightKan` by applying §1.0's adapter and DerivedDeRhamCohomology §§5.5, 5.26 to this prismatic unfolding. Its QRSP limit on `Spf B` recovers the affine value, retaining `DerivedDeRham.formalEtaleRealization`, `formalEtaleAffine`, `formalEtaleCoverDescent`, `formalEtalePullback` and `formalEtaleFiltered` with their supplied hypotheses. (DerivedDeRhamCohomology §5.26; BMS2 Remark 10.4, p.75.)

**Checks for formal unfolding.** On a perfectoid chart `B`, the QRSP identity chart recovers `A_inf(B)`. On `B=O_C⟨x⟩` over its Fontaine prism, the compatible-root Čech nerve gives the same value as §2.4's formal restriction. Disjoint unions of two such charts give products, with the empty formal scheme giving the terminal value. A single proper principal open cannot replace a covering chart family.

BMS2 Lemma 4.34 supplies the extra transitivity flatness only over perfect bases. Unfolding and QRSP basis descent are DerivedDeRhamCohomology §§5.1–5.7.

(BS22, Construction 7.6 (3); p. 56; BMS2, Proposition 4.31 and Lemmas 4.28, 4.30; p. 25; BMS2, Lemma 4.34; p. 26; BMS2, Remark 4.9; p. 20.)

*Needs:* [§1.0](#s1-0), [§2.4](#s2-4), DerivedDeRhamCohomology §5.26 (the five formal realization laws), [§2.3](#s2-3), [§2.2](#s2-2), [§2.1](#s2-1), [§2.15](#s2-15), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§5.1–5.7, 5.17.

**Proof route.** Use the QRSP-basis equivalence and the lifted covers to unfold the coherent affine functor (BS22 Proposition 7.11, p.60).

<a id="s2-18"></a>
<a id="layer-2-singular-qrsp-example"></a>

### 2.18 a singular quasiregular semiperfectoid algebra

For a nonzero perfectoid `R` with perfect prism (A,(d)), put `B=R⟨x,y⟩/(xy)`, `S=R⟨x^(1/p^∞),y^(1/p^∞)⟩/(xy)`, all p-completed. `B` is quasisyntomic and not completely smooth; `B→S` is a quasisyntomic cover, `S` QRSP and not perfectoid, since `x^(1/p)y^(1/p)` is a nonzero nilpotent. For `A′=A_inf(R⟨x^(1/p^∞),y^(1/p^∞)⟩)`, `Δ_S=A′{[x♭][y♭]/d}^∧`, and `Δ̄_S` is completely faithfully flat over `S` with `gr_i=S{−i}`. Each completed Čech term `S^n` is QRSP, e.g. `S¹=R⟨x^(1/p^∞),y^(1/p^∞),x′^(1/p^∞),y′^(1/p^∞)⟩/(xy,x−x′,y−y′)`, and `Δ_B=Tot Δ_(S^•)`. Here `L_(B/R)=[B→B²]`, `1↦(y,x)`, in degrees `[−1,0]`. For `i≥2`, `∧^i L[−i]` is `Kos(B;y,x)` in degrees [0,2], with `H⁰=0`, `H²=R` and `H¹≠0`, giving infinitely many nonzero conjugate pieces. The zero-ring specialization has zero complexes instead. For any family `(f_j)`, `S′=R⟨X_j^(1/p^∞)⟩/(X_j−f_j)^∧` has prism the completed filtered colimit of finite-family envelopes. For `R=F_p`, infinitely many `j` and `f_j=0`, `S′` is nonzero QRSP with no presentation by a finite regular sequence in a perfectoid ring.

`R ≠ 0` in the non-vanishing assertions.

(BS22, Proposition 7.11 and Example 7.12; pp. 60, 61; BMS2, Lemma 4.30; p. 25.)

*Needs:* [§2.15](#s2-15), [§2.13](#s2-13), [§2.17](#s2-17), [§2.3](#s2-3), [§2.8](#s2-8), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedDeRhamCohomology §§5.1–5.7, 5.17.

**Proof route.** Compute the regular root quotient’s envelope and its conjugate divided powers (BS22 Proposition 7.10 and Example 7.12, pp.59–61).

<a id="s2-19"></a>
<a id="layer-2-derived-crystalline-comparison"></a>

### 2.19 Derived crystalline comparison

For perfect `F_p`-algebra `k`, `A=W(k)`, animate and p-complete the polynomial crystalline functor, denoted `RΓ_crys(S/A)`. It reduces to derived de Rham over `k`; for `k=F_p` it is `LWΩ`. This differs from completed derived de Rham of `S` over A (already at `S=k`). Then `φ_A*Δ_(S/A)≃Δ_(S¹/A)≃RΓ_crys(S/A)`, naturally as `E∞-algebras` with `φ`, `S¹=S⊗^L_(k,φ)k`. The scalar Frobenius twist is necessary.

For singular inputs the ordinary crystalline site is not identified merely by polynomial extension; only the QRSP comparison and the descent stated below are used.

(ALB23, Theorem 3.1.7 and Remark 3.1.8 (published: Theorem 3.7, Remark 3.8); p. 17; BS22, Theorem 5.2; p. 45.)

*Needs:* [§2.1](#s2-1), [§2.7](#s2-7), [§1.14](#s1-14), [§0.74](#s0-74), [§0.65](#s0-65), DerivedDeRhamCohomology §§2.7–2.26, 5.8, EnhancedDerivedSheaves §E5:animation.1, Mathlib `WittVector`, Mathlib `PerfectRing`, CrystallineCohomology §§CR.2.1–CR.2.3, CrystallineCohomology §§CR.DDR.4.5, CR.DDR.5.18–CR.DDR.5.22.

For `k=F_p`, consume `DerivedDeRham.derivedDeRhamWitt`, `qrspWittControl`, `qrspPdDerham` and `acrysStructure` from CrystallineCohomology §§CR.DDR.4.5, CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.21. The perfect-k extension and its scalar Frobenius transport use the polynomial comparison; no second derived de Rham–Witt functor is constructed. QRSP descent is DerivedDeRhamCohomology §5.5, and the regular crystalline Čech calculation is CrystallineCohomology §CR.DDR.5.22. (BMS2, Propositions 8.12–8.13, Theorem 8.14, Remark 8.15, pp.59–61; BL22, Proposition F.4, Construction F.5, Remark F.6, pp.237–238.)

**Checks.** On a perfect ring `k` the value is `W(k)`. For `F_p[x^(1/p^∞)]/(x)`, the value contains the nonzero divided powers of `x` and is not its reduced Witt ring. Its mod-p conjugate graded pieces are `Γ^j(J/J²)`, and higher cohomology vanishes. The Frobenius image of `x^[m]` is `x^(pm)/m!`, fixing the normalization. For a smooth polynomial ring the totalized root cover recovers its crystalline de Rham complex, rather than the single degree-zero value at its perfection.

**Proof route.** Left Kan extend the polynomial crystalline comparison; the QRSP PD calculation and semiperfect Čech descent identify the stated discrete values (BMS2 Propositions 8.12–8.13, Theorem 8.14, pp.59–61).

<a id="s2-20"></a>
<a id="layer-2-qrsp-char-p-acrys"></a>

### 2.20 In characteristic p the prism of a quasiregular semiperfect ring is A_crys

For quasiregular semiperfect `S`, let `k=Sflat` and `A=W(k)`. The initial complete PD thickening `A_crys(S)` identifies with `φ_A*Δ_(S/A)` as a `δ-A-algebra` with `φ`. Thus `Δ_S≃A_crys(S)` as δ-rings, semilinearly over `W(k)`; `S→Δ_S/p` corresponds to the factor of Frobenius on `A_crys(S)/p`. For `S=k/(x)`, `x` regular, the two presentations are `W(k){[x]/p}^∧` and `W(k){[x]^p/p}^∧`. QRSP Čech unfolding extends this comparison to all quasisyntomic `F_p-algebras`.

The argument uses polynomial crystalline comparison and `φ`, avoiding the later Nygaard `θ-map` used in ALB23 Lemma 3.4.2.

(ALB23, Lemma 3.4.2 (published: Lemma 3.27); p. 24; ALB23, Remark 3.4.3 (published: Remark 3.28); p. 25; ALB23, Remark 3.1.8 (2) (published: Remark 3.8); p. 17; BMS2, Proposition 8.12 and Theorem 8.14; pp. 59, 60.)

*Needs:* [§2.15](#s2-15), [§2.19](#s2-19), [§2.13](#s2-13), [§2.17](#s2-17), [§0.69](#s0-69), [§0.74](#s0-74), [§0.65](#s0-65), DerivedDeRhamCohomology §§PD.6–PD.7, CrystallineCohomology §§CR.DDR.4.5, CR.DDR.5.18–CR.DDR.5.22, DerivedDeRhamCohomology §§5.1–5.7, 5.17, Mathlib `WittVector`, Mathlib `PerfectRing`.

**Proof route.** Apply the preceding PD identification with its Frobenius coefficient transport; the root-quotient computation removes any Nygaard dependency (ALB23 Lemma 3.4.2, p.24).

<a id="s2-21"></a>
<a id="layer-2-regular-semiperfectoid-example"></a>

### 2.21 a regular semiperfectoid quotient

For perfectoid `R` with `(A,(d))=(A_inf(R),ker θ)`, put `R_∞=R⟨X₁^(1/p^∞),…,X_r^(1/p^∞)⟩` and `T=R_∞/(X_i−f_i)`, `f_i∈R`. The sequence is regular, `T` QRSP and p-completely free over `R` on monomials with exponents in `[0,1)∩Z[1/p]`. Put `A′=A_inf(R_∞)`, `g_i=[X_i♭]−f̃_i` for lifts `f̃_i` of `f_i`. Then `Δ_T=A′{g_i/d}^∧` is `(p,d)-completely` flat over A, but not over `A′` if `R≠0` and `r>0`; `Δ̄_T` is completely faithfully flat over `T`, with `gr_i=Γ^i_T(T^r){−i}`. For `R=F_p,r=1,f=0`, `Δ_T=Z_p[X^(1/p^∞)]^∧{X/p}^∧` is the p-completed PD envelope of `(X^(1/p))`, containing `(X^(1/p))^n/n!`. For algebraically closed complete `C/Q_p` and `S=O_C/p`, `Δ_S=A_inf{p/ξ}^∧=A_inf{ξ/p}^∧`; `(ξ)=(p)` there and `φ` identifies it with Fontaine `A_crys=A_inf{φ(ξ)/p}^∧`.

(BS22, Proof of Proposition 7.10; p. 59; ALB23, Remark 3.4.3 (published: Remark 3.28); p. 25.)

*Needs:* [§2.15](#s2-15), [§2.13](#s2-13), [§2.20](#s2-20), [§0.69](#s0-69), [§0.62](#s0-62), [§0.75](#s0-75), DerivedDeRhamCohomology §§5.1–5.7, 5.17.

**Proof route.** The restricted monomial basis proves complete freeness; compute the regular prismatic envelope and transport by Frobenius in characteristic `p` (BS22 Proposition 7.10, p.59).

<a id="s2-22"></a>
<a id="layer-2-perfection-of-prismatic-cohomology"></a>

### 2.22 Perfection of derived prismatic cohomology and perfectoidization

For an animated p-complete `A/I-algebra S` over a perfect prism `(A,I)`, define the perfected object and perfectoidization by the completed Frobenius colimit and reduction specified below. Here they remain relative to this base; §2.30 proves independence and dependence only on `π₀`. The semiperfectoid universal quotient is imported from PerfectoidSpaces §§P4.15.2–P4.15.3 and agrees when the animated perfectoidization is connective (§2.27).

All statements here are relative to the fixed perfect base. The general base-independence theorem is §2.30, distinct from the semiperfectoid quotient input.

(BS22, Definition 8.2 and the paragraph after it; p. 63; BS22, Notation 8.1; p. 63.)

*Needs:* [§2.1](#s2-1), [§0.83](#s0-83), [§0.84](#s0-84), [§0.75](#s0-75), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves §E5:abstract.2, PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, Mathlib `DerivedCategory`.

- `Prismatic.Perfection.perfection`: `Δ_perf=(colim_n φ_*^nΔ)^∧_(p,I)`.
- `Prismatic.Perfection.perfectoidization`: `S_perfd=Δ_perf⊗^L_A A/I`.
- `Prismatic.Perfection.toPerfection`: Canonical `can:Δ→Δ_perf`.
- `Prismatic.Perfection.perfectionFrobenius`: Semilinear automorphism `φ` of `Δ_perf`.
- `Prismatic.Perfection.toPerfection_frobenius`: `φ can=φ_*(can)φ_S`.
- `Prismatic.Perfection.isIso_toPerfection`: can is an equivalence when `φ_S` is.
- `Prismatic.Perfection.fromRing`: `S→S_perfd`.
- `Prismatic.Perfection.perfectionMap`: Functoriality of `Δ_perf`, respecting can and composition.
- `Prismatic.Perfection.perfectoidizationMap`: Functoriality of `S_perfd`, respecting the input map and composition.
- `Prismatic.Perfection.perfectoidization_reduction`: Natural `E∞` reduction equivalence above, without asserting connectivity of the result.

**Checks.**

- `pr2_perfection_base`: For a perfect prism and `S = A/I` the map can is an isomorphism.
- `pr2_perfectoidization_base`: For a perfect prism, `(A/I)_perfd` is `A/I` in degree `0`.
- `pr2_perfectoidization_char_p_discrete`: For a perfect crystalline prism `(A, (p))` and `S = (A/p)[x]`, `S_perfd` has no cohomology outside degree `0`; it is the perfection `(A/p)[x^{1/p^∞}]`.
- `pr2_perfection_not_prismatic`: For a perfect crystalline prism `(A, (p))` with `A/p ≠ 0` and `S = (A/p)[x]`, can : `Δ_{S/A} → Δ_{S/A,perf}` is not an isomorphism.

**Proof route.** Take the completed colimit of the Frobenius-semilinear system, then reduce by `I` (BS22 Definition 8.2, p.63).

<a id="s2-23"></a>
<a id="layer-2-perfection-comparison"></a>

### 2.23 Comparison of the perfected and the unperfected theory

For perfect A and animated `S/A/I`, `Δ→Δperf` is initial among maps of `E∞-algebras` with invertible Frobenius, and is an iso iff `φ` on `Δ` is. For perfectoid `S` it is `Ainf(S)`, `Δ̄=S`, `Lhat_(S/(A/I))=0` and `S_perfd=S`. Evaluation at perfect prisms factors uniquely through `Δperf`, giving a map to `lim_(S→R′ perfectoid)Ainf(R′)`. In characteristic `p`, Frobenius on conjugate `gr_i` is induced by Frobenius on `L` and vanishes for `i≠0`, giving `S_perfd=colim_φ S`. For `F_p[x]`, `Δ̄` retains nonzero `Ω¹` while `S_perfd=F_p[x^(1/p^∞)]` is discrete; perfection forgets these positive pieces.

That the map in `(3)` is an equivalence is BS22 Proposition 8.5; `(3)` only constructs it. In `(4)` the base is crystalline; for a perfect base of mixed characteristic and pS `= 0` the source reduces to the base `(Z_p, (p))` by independence of the base, which requires the same comparison.

(BS22, Example 8.3; p. 63; BS22, §8.1, before Proposition 8.5; p. 64; BS22, Remark 4.6; p. 38.)

*Needs:* EnhancedDerivedSheaves §E5:animation.2 (`frobenius_zero_on_positive_homotopy`, `perfection_isDiscrete`), [§2.22](#s2-22), [§2.3](#s2-3), [§2.10](#s2-10), [§2.2](#s2-2), [§0.84](#s0-84), [§0.65](#s0-65), [§1.20](#s1-20), DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedDeRhamCohomology §§5.1–5.7, 5.17, PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, [§1.25](#s1-25), Mathlib `PerfectRing`.

**Proof route.** Use the localization universal property of the colimit. After the characteristic-p conjugate-filtration comparison, apply the supplied generic animated-perfection theorems to identify the colimit with the discrete perfection of `π₀S` (BS22 Example 8.3, p.63).

<a id="s2-24"></a>
<a id="layer-2-perfectoidization-coconnective"></a>

### 2.24 Coconnectivity of perfectoidizations

For perfect (A,(d)) and animated `S/A/I`, `Δperf` and `S_perfd` lie in `D≥0`. `H⁰Δperf` is a p-regular p-complete perfect `δ-A-algebra`, with its unique Frobenius lift, `d` regular, and `H⁰Δperf/p` embedding in `H⁰(Δperf/p)`. This is coconnectiveness, not a claim that these outputs are animated.

The operation `P⁰` below is a natural map of underlying spectra; it is not asserted to be a map of `E_∞` rings or of modules over an arbitrary characteristic-p coefficient ring.

(BS22, Lemma 8.4 and its proof; p. 63; BS22, Proof of Lemma 8.4; p. 63.)

*Needs:* AInfCohomology §AI.7.2 (`AInf.Trace.tateFinite`, `AInf.Trace.tateDiagonal`), EnhancedDerivedSheaves §E5:presentability.2 (`spectra`) and §E5:spectra-comparison (`eilenbergMacLane`, `moduleSpectra_equiv_derived`), [§2.22](#s2-22), [§2.12](#s2-12), [§0.65](#s0-65), [§0.61](#s0-61), [§0.84](#s0-84), [§1.7](#s1-7), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves §E5:abstract.2, [§0.67](#s0-67).

Prerequisite API: `Prismatic.PowerOperation.pZero` is the natural underlying-spectrum `P⁰` operation on characteristic-p `E∞-algebras`; `pZero_positive` says it kills `π_n` for `n>0`, `pZero_discrete` is `x↦x^p`, and `pZero_totalization_realization` identifies it with termwise Frobenius on simplicial-cosimplicial ordinary algebras. It need not be an `E∞-ring` map or linear over an arbitrary coefficient ring (Lur11 Construction 2.2.6 and Warnings 2.2.8, 2.2.10, pp.34–35).

**Checks for P⁰.** On `F_p[t]`, it sends `t` to `t^p`. On the split square-zero `E_∞` algebra `F_p⊕F_p[1]`, it kills its nonzero `π₁` class, whereas an identity operation would retain it. Over `k=F_(p²)`, `P⁰` on `k` is Frobenius and is not k-linear, so linearity over a general `k` must not enter the construction. On the zero algebra all these maps are zero.

**Proof route.** Construct `P⁰` using the supplied Tate constructions and the class `1∈π₁(k^{tC_p})` for discrete characteristic-p k, following Lur11 Construction 2.2.6: it kills positive homotopy and is Frobenius on discrete inputs, so perfected totalizations are coconnective (Lur11 Construction 2.2.6, pp.34–35; BS22 Lemma 8.4, p.63).

<a id="s2-25"></a>
<a id="layer-2-perfectoidization-symmetric-monoidal"></a>

### 2.25 Perfectoidization is symmetric monoidal

Over perfect A, both `Δperf` and `S_perfd` preserve completed derived pushouts and the tensor unit. For `S₁←S₃→S₂` they identify the completed tensor product over their `S₃-value` with the value on `S₁⊗̂^L_(S₃)S₂`. A perfectoid base mapping to `S₃` suffices for the unbased statement; completions are `(p,I)` for `Δperf` and `p` for perfectoidization.

Independence of the perfect base prism, dependence on `π_0(S)` only, and the description through the perfect prismatic site are BS22 Proposition 8.5, which requires the perfect-site comparison below; every statement here is relative to the fixed perfect prism `(A, I)`.

(BS22, Proposition 8.13 and its proof; p. 69.)

*Needs:* [§2.8](#s2-8), [§2.22](#s2-22), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, EnhancedDerivedSheaves §E5:abstract.1.

**Proof route.** Commute the completed Frobenius colimit with derived pushouts (BS22 Proposition 8.13, p.69).

<a id="s2-26"></a>
<a id="layer-2-perfection-descendable"></a>

### 2.26 Strong descent for the passage to the perfection

For perfectoid `R=A/I`, `T=R⟨X₁,…,X_n⟩` and `T∞=R⟨X₁^(1/p^∞),…,X_n^(1/p^∞)⟩`, the induced maps on `Δ` and `Δperf` are descendable in the complete `E∞-category`. Thus for animated `S` under `T`, the derived p-completed Čech nerve of `S→S⊗̂^L_TT∞` computes both `Δ_(S/A)` and `Δ_(S/A),perf`.

Descendability, its stability under base change and tensor products, and the bound for colimits along compatible endomorphisms (Bhatt–Scholze, Projectivity of the Witt vector affine Grassmannian, Lemma 11.22) are required from EnhancedDerivedSheaves Layer E5:descent. The reduced auxiliary ring `A/(p, φ^{−1}(d))` ≅ `R/p` is semiperfect rather than necessarily perfect. The proof uses only its `F_p-algebra` structure; the stronger source description is a source correction.

(BS22, Lemma 8.6 and its proof; p. 66; BS22, Proof of Proposition 8.5; p. 64.)

*Needs:* [§2.8](#s2-8), [§2.22](#s2-22), [§2.1](#s2-1), [§2.3](#s2-3), [§1.22](#s1-22), DerivedDeRhamCohomology §3.4, EnhancedDerivedSheaves Layers E5:abstract and E5:descent, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, [§2.25](#s2-25).

**Proof route.** Use the finite polynomial root-cover descent bound and its stability under base change and Frobenius colimits (BS22 Lemma 8.6, p.66).

<a id="s2-27"></a>
<a id="layer-2-connective-perfectoidization-perfectoid"></a>

### 2.27 Connective perfectoidizations are perfectoid and universal

For perfect A and animated `S/A/I`, assume `S_perfd` connective (hence discrete by §2.24). Then `Δperf` is discrete perfect complete δ-A, its ideal gives a perfect prism, and `S_perfd` is perfectoid and universal among perfectoid rings receiving `π₀S`. It is consequently base-independent; on semiperfectoid inputs it agrees with PerfectoidSpaces’ universal quotient. Only this connectivity criterion extends the imported semiperfectoid result.

Connectivity of `S_perfd` is a hypothesis: for `S = O_C⟨x⟩` it fails (see its last Check). Connectivity for every semiperfectoid `π₀S` is proved in §2.30 from the universal quotient and André inputs; the present conditional criterion is used in that proof.

(BS22, Corollary 8.14 and its proof; p. 70.)

*Needs:* [§2.24](#s2-24), [§2.25](#s2-25), [§2.23](#s2-23), [§2.22](#s2-22), [§0.84](#s0-84), [§0.65](#s0-65), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25.

**Proof route.** Coconnectivity plus the assumed connectivity makes the perfected prism discrete; its perfect-prism universal property gives the conclusion (BS22 Corollary 8.14, p.70).

<a id="s2-28"></a>
<a id="layer-2-finite-projective-modules-p-complete"></a>

### 2.28 Finite projective modules over derived p-complete rings and their descent

For p-complete bounded-p-torsion `R`, finite projective R-modules are equivalent to compatible systems over `R/p^n`. Consequently they have effective descent along completely faithfully flat maps between such rings, with completed tensor-square and tensor-cube descent data.

a derived p-complete ring with bounded `p^∞-torsion` is classically p-adically complete (DerivedModuleAlgebra §§1.1–1.9 and DerivedDeRhamCohomology §§1.10–1.23). The completed tensor products are discrete with bounded `p^∞-torsion` (BMS2 Lemma 4.7 and Corollary 4.8).

(ALB23, Appendix A, Lemma A.1 (published: Lemma A.1) and its proof; p. 94; BMS2, Corollary 4.8; p. 20.)

*Needs:* DerivedModuleAlgebra §§1.1–1.9, 1.E.1; DerivedDeRhamCohomology §§1.10–1.23, SchemeAndStackFoundations §1.1, Mathlib `Module.Projective`, Mathlib `Module.Finite`, Mathlib `Module.FaithfullyFlat`, Mathlib `IsAdicComplete`.

`Prismatic.CompleteProjective.effectivity`: for any classically J-complete ring `T` with `J` finitely generated, `FinProj(T)≃lim_n FinProj(T/J^n)`, including morphisms and compositions (Stacks Tag [0D4B](https://stacks.math.columbia.edu/tag/0D4B), Lemma 15.13.4). The p-adic assertion is `J=(p)`. For completely faithfully flat `R→R′`, finite-level faithfully flat descent applies since `R/p^n→R′/p^n` is faithfully flat (BMS2 Lemma 4.7, Corollary 4.8, pp.19–20).

**Checks for complete-projective effectivity.** A compatible system `(Z/p^n)^r`, including `r=0`, has limit `Z_p^r` and its endomorphism ring is `M_r(Z_p)`, with all entries recovered from the tower. Compatible idempotents `diag(1,0)` over `(Z/p^n)^2` give `Z_p⊕0`, so taking the inverse limit of the ambient free modules alone gives the wrong rank. For the rank-one system, multiplication by compatible units `u_n` has limit multiplication by the unit `lim u_n`; a merely compatible sequence of objects without transition identifications is not descent data. Replacing the complete ring `Z_p` by `Z` makes full faithfulness fail already on `End(Z)`, since `lim Z/p^n=Z_p`.

**Proof route.** Choose compatible finite free presentations and splittings; their idempotent matrices converge entrywise, and the finite matrix description of `Hom` proves full faithfulness. Apply finite-level descent and take the category limit (Stacks Tag 0D4B, Lemma 15.13.4; ALB23 Lemma A.1, p.94).

<a id="s2-29"></a>
<a id="layer-2-finite-projective-descent-prisms"></a>

### 2.29 Descent of finite projective modules along faithfully flat maps of prisms

Finite projective modules on bounded prisms have effective completely faithfully flat descent: for `A→B` such a map, `Vect(A)≃Desc(Vect(B^•))`, `B^n` the `(n+1)-fold` derived `(p,I)-completed` tensor power. Each Čech term is a bounded prism; descent data are the two-pullback iso satisfying the cocycle on `B²`.

Faithfully flat includes faithfulness modulo `(p,I)`, omitted in ALB23’s appendix wording.

(ALB23, Appendix A, Proposition A.3 (published: Proposition A.3) and its proof; p. 94.)

*Needs:* [§2.28](#s2-28), [§0.81](#s0-81), [§0.73](#s0-73), [§0.79](#s0-79), [§1.1](#s1-1), DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, Mathlib `Module.Projective`, Mathlib `Module.Finite`.

**Proof route.** Apply finite-projective effectivity to the complete faithfully flat prism Čech nerve (ALB23 Proposition A.3, p.94).

<a id="s2-30"></a>
<a id="layer-2-perfect-site-arc-comparison"></a>

### 2.30 Perfect-site comparison, base independence and arc excision

Consume semiperfectoid perfectization from PerfectoidSpaces §§P4.15.2–P4.15.3 and André covers from §P4.15.4. The extension is base independence and arc excision for general animated inputs.

Prove `Prismatic.Perfection.perfectSite_equiv`: for a perfect prism `(A,I)`, `R=A/I` and a derived p-complete animated R-algebra `S`, the canonical map `Δ_(S/A),perf→RΓ((S/A)_Δ^perf,O_Δ)` is an equivalence for every topology between the flat and chaotic topologies. Consequently `S_perfd=lim_(S→T` perfectoid) `T` in derived p-complete `E_∞` rings, depends only on `π₀S`, and is independent of the perfect base. Prove `Prismatic.Perfectoidization.arc_sections` and `arc_excision`: this limit is `RΓ_arc(Spf(π₀S),O)`; if `S→S′` is an isomorphism on rank-one p-complete valuation points outside a derived p-complete ideal `J`, then the square with vertices `S_perfd`, `S′_perfd`, `(S/J)_perfd` and `(S′/J)_perfd` is cartesian. Here `S′/J` is the completed quotient by the image ideal, and the outside-J condition means existence and uniqueness of the extension of every valuation point not killing `J`. These are local prerequisites, not inputs from a later roadmap. (BS22, Proposition 8.5, pp.64–66; Corollaries 8.11–8.12, pp.68–69.)

*Needs:* [§2.26](#s2-26), [§2.24](#s2-24), [§2.27](#s2-27), [§2.15](#s2-15), [§2.0](#s2-0), PerfectoidSpaces §§P4.15.2–P4.15.3, PerfectoidSpaces §P4.15.5, EnhancedDerivedSheaves Layer E5:descent.

**Checks.** For `S` perfectoid, the limit is `S` and the unit is the identity. For `S=F_p[x]`, it is `F_p[x^(1/p^∞)]`; for `S=F_p[x^(1/p^∞)]/(x)`, it is `F_p`, so the unit need not be injective. An animated `S` and `π₀S` have identical perfectoidizations even when their unperfected `Δ` differ, as in §2.14. For `J=0` the excision square has identical vertical maps; for `J=S` the outside condition forces an equivalence on arc points and the lower row is zero. Neither control justifies arbitrary base change before perfection.

**Proof route.** Use descendable root Čech covers, the semiperfectoid universal quotient and André covers to identify the perfect-site limit; arc acyclicity then gives sections and excision (BS22 Proposition 8.5 and Corollaries 8.11–8.12, pp.64–69).

<a id="s2-31"></a>
<a id="layer-2-integral-perfectoidization"></a>

### 2.31 Integral perfectoidization and arbitrary-ideal almost purity

Prove `Prismatic.Perfectoidization.integral_discrete`: if `R` is perfectoid with perfect prism `(A,I)` and `S` is the p-completion of an integral R-algebra, then `Δ_(S/A),perf` is a discrete perfect p-complete `δ-A-algebra` and `S_perfd` is perfectoid. Prove `Prismatic.Perfectoidization.almostPurity`: for a finitely presented finite R-algebra `S` that is finite étale away from a finitely generated ideal `J`, `S→S_perfd` is an isomorphism there and `R/p^n→S_perfd/p^n` is almost finite projective and almost unramified for the ideal `J_perfd=ker(R→(R/J)_perfd)`, for every `n>0`. If a finite group `G` acts on `S` and `Spec S→Spec R` is a G-torsor outside `V(J)`, then `R→S_perfd` is a J-almost G-Galois cover. These targets extend the universal *semiperfectoid* quotient without using a later integral-perfectoidization roadmap as a prerequisite. (BS22, Propositions 10.2–10.4, Lemma 10.5, pp.78–79; Proposition 10.8, Theorems 10.9, 10.11, Lemma 10.12, pp.80–83.)

*Needs:* [§2.30](#s2-30), [§2.25](#s2-25), [§2.27](#s2-27), [§0.85](#s0-85), PerfectoidSpaces §§P0.1–P0.11, PerfectoidSpaces §§P4.15.2–P4.15.3, EnhancedDerivedSheaves Layers E5:abstract and E5:descent.

Local prerequisite `Prismatic.Integral.finiteStratification`: a finitely presented finite map of commutative `Z_(p)-algebras R→S` has a finite reduced locally closed stratification `R_i=(R/(g₁,…,g_(i−1)))_red[1/g_i]` and `S_i=(S/(g₁,…,g_(i−1))S)_red[1/g_i]`, `(g_i)=R`, on which the induced map `R_i→S_i` factors as finite étale `R_i→T_i` followed by a universal homeomorphism `T_i→S_i` that is an isomorphism after inverting `p`; `p` is zero or invertible on each stratum. Descend the finite data to a noetherian `Z_(p)-algebra` and use generic separability, spreading and noetherian induction; replacing `g_i` by `pg_i` followed by `g_i` separates the p-invertible and characteristic-p cases (BS22 Lemma 10.12, p.83).

Local API `Prismatic.Almost.ideal_tensor`: for `Q=(R/J)_perfd` and `K=ker(R→Q)`, `K⊗̂ᴸ_RK≃K` and `K⊗̂ᴸ_RQ=0`. `connectivityCriterion`: `M∈D_(p-comp)(R)` is connective exactly when `M⊗̂ᴸ_RQ` is connective and every `H^i(M)`, `i>0`, is K-annihilated; restriction `D_(p-comp)(Q)→D_(p-comp)(R)` is fully faithful with image those complexes whose cohomology is K-annihilated (BS22 Proposition 10.2, Lemma 10.3 and Proposition 10.4, p.78–79; Lemma 10.5, p.79). For a principal root-compatible `J`, `K/p^n` is the root-transition filtered colimit of `R/p^n` and hence flat; the general almost argument is tested on generators.

**Checks.** For finite stratification over `R=Q_p` with `S=Q_p[ε]/(ε²)`, reduction gives `S_red=Q_p` and both factors are identities; the unreduced algebra is not étale. An integral perfectoid `S` remains `S`. A finite étale product `R^r` remains `R^r` with its product idempotents. For perfect `R` of characteristic `p` and `S=R[z]/(z^p−a)`, perfectoidization kills the purely inseparable defect and is the reduced perfect quotient; it cannot retain its nilpotents. For `J=(1)` the almost statement is ordinary finite étale descent; for `J=0` it is vacuous and cannot prove connectivity by itself. For `R=O_C` and `S=R⟨x⟩` the integrality hypothesis fails, consistently with the nonconnective example of §2.27.

**Proof route.** Prove J-almost connectivity by arc excision and split Galois covers first; finite stratification then yields integral discreteness and the full almost-purity conclusion without a circular hypothesis (BS22 §§10.1–10.2, pp.78–83).

### Examples

The derived self-intersection `R=(A/I)⊗^L_((A/I)⟨x⟩)(A/I)`, `x↦0`, has `π₀=A/I` and `π₁=A/I`. Its cotangent complex is R[1], so the conjugate graded pieces are `R{−i}` in degree pattern prescribed below; replacing `R` by `π₀` loses its nonzero negative cohomology. For the crystalline perfect base and `S=F_p[x]`, `S_perfd=F_p[x^(1/p^∞)]` is discrete, whereas `Δ̄` has `H¹=F_p[x]dx`. The completed Frobenius perfection is therefore a genuine loss of positive conjugate pieces, rather than a substitution of notation.

**§2.1.** `Δ_{(A/I)/A} = A` with `φ = φ_A`, and `Δ̄_{(A/I)/A} = A/I`. For `R = (A/I)⟨x⟩` the value is Layer 1's complex: `H^0(Δ̄_{R/A}) = R`, `H^1(Δ̄_{R/A}) = Ω^1_{R/(A/I)}{−1}` finite locally free of rank `1`, with a global basis after trivializing the pulled-back conormal line, and no other cohomology. For `R = A/I × A/I` (p-completely étale over `A/I`) the value is A `× A`. For a discrete p-complete `R`, two polynomial simplicial resolutions give canonically equivalent values. A non-discrete input is computed in §2.14.

**§2.3.** Polynomial algebra: recovers `Ω^i{−i}` ≅ `H^i(Δ̄)`. `R = A/I`: `gr_i^conj = 0` for `i > 0`. `R = (A/I)/(f)`, `f` a nonzerodivisor, `R` of bounded `p^∞-torsion`: `gr_i^conj = Γ^i_R(R·f̄){−i}`, finite locally free of rank `1`, and globally free after trivializing the inverse i-th power of the pulled-back conormal line. `S` perfectoid over a perfect prism: `L^∧_{S/(A/I)} = 0`, so `Δ̄_{S/A} = S` and `Δ_{S/A} = A_inf(S)`. `R = A/I ⊗^L_{(A/I)⟨x⟩} A/I`: `gr_i^conj ≃ R{−i}` for all `i` (§2.14).

**§2.4.** For `X` smooth the object `Δ_{X/A}` is the one of Layer `1`. For `X = Spf(R)` affine, `RΓ(X, Δ_{X/A}) = Δ_{R/A}`. For a finite disjoint union the value is the product: `Δ_{(R_1 × R_2)/A} = Δ_{R_1/A} × Δ_{R_2/A}`.

**§2.5.** `R = A/I`: both sides are `A/I`. `R = (A/I)⟨x⟩`: `Fil_1^conj = τ^{≤1}Δ̄ = Δ̄` and the class of the extension of `Ω^1{−1}[−1]` by `R` vanishes, in accordance with the lift A⟨x⟩ over `A/I²`. `R = (A/I)/(f)` with `f` a nonzerodivisor: `Fil_1^conj` is the discrete module `(L_{R/A}{−1}[−1]) = J/J²{−1}` for `J = (I, f)`, an extension of `R·f̄{−1}` by `R`.

**§2.6.** If `X` lifts to a `(p, I)-completely` flat `δ-A-scheme`, the Higgs specialisation of BS22 Remark 4.13 splits `O_X → Δ̄_{X/A}`, in particular `Fil_1^conj`. For `(A, I) = (Z_p, (p))` the statement is the Deligne–Illusie criterion: `Fil_1^conj` splits exactly when `X` lifts to `Z/p²`. `X = Spf(A/I)`: the class lies in the zero group.

**§2.7.** `B = A`: the identity. Base change to the perfection `(A, I) → (A, I)_perf` and to an orientable cover `(A, I) → (B, (d))`. For a map of perfect prisms `A → A′` and `S` an `A/I-algebra`: `Δ_{S/A} ⊗̂^L_A A′ ≃ Δ_{(S ⊗̂^L A′/I)/A′}`, the formula used by PerfectoidSpaces §§P4.15.2–P4.15.5 to descend surjectivity of perfectoidization. The universal case of Example 7.9 is reached by base change from `Z_p{d, f_1,…,f_r}[δ(d)^{−1}]^∧`.

**§2.8.** `Δ_{(A/I)⟨x,y⟩/A} ≃ Δ_{(A/I)⟨x⟩/A} ⊗̂^L_A Δ_{(A/I)⟨y⟩/A}`. `R_1 = R_2 = A/I` over `R_3 = (A/I)⟨x⟩`: `Δ` of the derived self-intersection is `A ⊗̂^L_{Δ_{(A/I)⟨x⟩/A}} A` (§2.14). Filtered colimits: `Δ` of a completed filtered colimit is the completed filtered colimit, as used in BS22 Proposition 7.10. ALB23 apply the formula to the product of an abelian scheme with itself.

**§2.9.** `X = Y = Spf(A/I)⟨x⟩` recovers the affine formula. For `X`, `Y` proper smooth both sides are perfect complexes of A-modules (Layer `1`) and the completed tensor product is the ordinary derived tensor product. `X = Spf(A/I)`: the identity.

**§2.12.** `R = A/I`: the prism is `(A, I)`, which is initial. `R` p-completely smooth of positive relative dimension: `Δ̄_{R/A}` is not discrete and `(b)` does not apply. `R = (A/I)/(f)`: `(b)` applies and the idempotent is the identity (§2.13). `R` perfectoid over a perfect prism: `Δ_{R/A} = A_inf(R)` with its unique δ-structure.

**§2.13.** `r = 0`: `R = A/I` and `Δ_{R/A} = A`. `(A, I) = (Z_p⟨x⟩, (p))` with `δ(x) = 0` and `f = x^p`: `R = F_p[x]/(x^p)` and `Δ_{R/A} = Z_p⟨x⟩{x^p/p}^∧` is the p-completed PD envelope of `(x)` in `Z_p⟨x⟩` (Layer `0`, PD envelopes of regular sequences are δ-envelopes). `(A, I) = (A_inf(O_C), (ξ))` and `f = p`: `R = O_C/p` and `Δ_{R/A} = A_inf{p/ξ}^∧` (§2.21). For `r>0` the graded pieces `gr_i^conj` are finite locally free of rank `binom(r+i−1, i)`; these two oriented examples have global bases, while the nonprincipal Check in §2.13 has nonfree `gr_1`.

**§2.14.** the crystalline calculation gives negative reduced classes `εu^{[kp−1]}` for `k≥1` and degree-zero reduced classes `u^{[kp]}` for `k≥0`. These are direct sums over `F_p` after reduction, since restricted p-adic coefficients reduce to finite support. They agree with the conjugate-filtration calculation. Base change between bounded prisms carries the self-intersection and the Künneth formula to the corresponding example; no assertion of unreduced nondiscreteness accompanies that base change.

**§2.16.** `R = A/I`: `B = A`. `R = (A/I)⟨x⟩`: `S = (A/I)⟨x^{1/p^∞}⟩` and `B = Δ_{S/A}` is the `(p, I)-completed A[x^{1/p^∞}]` with `φ(x^{1/p^n}) = x^{1/p^{n−1}}`, a relatively perfect `δ-A-algebra` with `B/IB = S`. For a quasisyntomic cover `A/I → R` of a perfect prism the resulting perfect prism over `(A, I)` is faithfully flat: the step used in André's lemma. For `R = (A/I)⟨x⟩` the construction gives `B = Δ_{S/A}` with `B/IB = S = (A/I)⟨x^{1/p^∞}⟩ ≠ R`; the object `Δ_{R/A}` itself is not a prism (`Δ̄_{R/A}` has `H^1 ≠ 0`), although other objects with `B/IB = R` exist (A⟨x⟩ with `δ(x) = 0`).

**§2.17.** `B = S` quasiregular semiperfectoid: the constant cover gives `Δ_S`. `B =` R⟨x⟩ over a perfect prism with the cover `R⟨x^{1/p^∞}⟩`: `Δ_{B/A}` is the totalisation of the cosimplicial δ-ring `Δ` of the terms `R⟨x_0^{1/p^∞},…,x_n^{1/p^∞}⟩/(x_0 − x_i)`. The singular algebra R⟨x, `y⟩/(xy)`: §2.18 `(3)`. The étale topology is coarser, and §2.4 holds without any hypothesis on the cotangent complex.

**§2.18.** `gr_1^conj Δ̄_S` is free of rank `1` over `S`. `H^2(gr_i^conj Δ̄_{B/A}) = R{−i}` for every `i ≥ 2`. For `R = F_p`: `S = F_p[x^{1/p^∞}, y^{1/p^∞}]/(xy)` and `Δ_S` is the p-completed PD envelope of `((xy)^{1/p})` in `Z_p[x^{1/p^∞}, y^{1/p^∞}]^∧`. `S^1` is a quotient of a perfectoid ring by a regular sequence of length `3`.

**§2.19.** `S = k`: `Δ_{k/A} = W(k) = RΓ_crys(k/A)`. Put `P=Γ_(W(k))(W(k)·x)`, the PD polynomial algebra. Then `dR^∧_{k/W(k)} ≃ LΛ_p[P --(x−p)→ P]`, with the two terms in degrees `−1,0`. For `k=F_p`, the uncompleted complex is `Z_p ⊕ ⊕_(j>0) Z_p/j` in degree zero, whose derived p-completion retains the nonzero `Z_p/p` summand. Thus this derived de Rham theory cannot replace derived crystalline cohomology (Bha12, Proposition 8.5 and Corollary 8.6, pp.31–32; DerivedDeRhamCohomology §4.6). In contrast, for the ordinary completed polynomial algebra, evaluation gives `Z_p⟨x⟩/(x−p)≅Z_p`.

For `S=k[x]`, the right side is the p-completed de Rham complex of the ordinary completed polynomial algebra `W(k)⟨x⟩` and the left side is `Δ_{k[x]/W(k)}` twisted by `φ`. For `S` quasiregular semiperfect, the right side is `A_crys(S)` (§2.20). For `S=k/(x)`, `Δ_{S/A}=A{[x]/p}^∧` and `RΓ_crys(S/A)=A{[x]^p/p}^∧` are different subrings of `A[1/p]-algebras`; the twist cannot be removed.

**§2.20.** `S = k` perfect: both sides are `W(k)` and the isomorphism of `(2)` is `φ`. `S = F_p[x^{1/p^∞}]/(x)`: `Δ_S` is the p-completed PD envelope of `(x^{1/p})` in `Z_p[x^{1/p^∞}]^∧`, and `A_crys(S)` that of `(x)`. `S = O_C/p`: `Δ_S = A_inf{ξ/p}^∧ = φ^{−1}(A_crys)` and `A_crys(S) = A_inf{φ(ξ)/p}^∧` is Fontaine's `A_crys`. The identification is not `W(k)-linear`: for `S = k/(x)`, `[x]/p` lies in `Δ_S` but not in `A_crys(S) ⊂ W(k)[1/p]`.

**§2.21.** `r = 0`: `T = R` and `Δ_T = A_inf(R)`. In `(4)`, `x^{n/p}/n! ∈ Δ_T` for every `n ≥ 0` and `x/p ∈ Δ_T`. In `(5)`, `ξ/p ∈ Δ_{O_C/p}` but `ξ/p ∉ A_crys`. `gr_1^conj Δ̄_T` is free of rank `r` over `T`.

**§2.23.** `S = R`: both theories give A. `S = R⟨x^{1/p^∞}⟩`: perfectoid, so the two theories agree. `S = F_p[x]` over `Z_p`: they differ, as in `(5)`. `S = F_p[x]/(x²)` over `Z_p`: `S_perfd = (S)_perf = F_p`.

**§2.24.** `S` perfectoid: `S_perfd = S` in degree `0`. `S = F_p[x]` over `Z_p`: `S_perfd = F_p[x^{1/p^∞}]` in degree `0`. For `S = O_C⟨x⟩` the object `S_perfd` is coconnective and not discrete (last example of §2.27): the theorem gives no bound from above. The unperfected `Δ̄_{R/A}` of §2.14 has `H^{−1} ≠ 0`; its perfection lies in `D^{≥0}`.

**§2.25.** `S_3 = R`: `(S_1 ⊗̂^L_R S_2)_perfd = S_{1,perfd} ⊗̂^L_R S_{2,perfd}`. `S_1`, `S_2`, `S_3` perfectoid: the completed derived tensor product of perfectoid rings is perfectoid and discrete (Layer `0`, Tor-independence of perfectoid rings), in accordance with the formula. `S_1 = S_2 = S_perfd` over `S` when `S_perfd` is discrete: `(S_perfd ⊗̂^L_S S_perfd)_perfd = S_perfd`, the step used in §2.27. In characteristic `p` over `(Z_p, (p))`: perfection of `F_p-algebras` commutes with derived tensor products, which are discrete for perfect rings.

**§2.26.** `n = 0`: both maps are identities. After perfection the target is `Δ_{T_∞/A,perf} = A_inf(T_∞)`, the perfect prism of the perfectoid ring `T_∞`. In characteristic `p`, `(A, I) = (Z_p, (p))`: `Δ_{F_p[X]/Z_p,perf} = Z_p⟨X^{1/p^∞}⟩ = Δ_{F_p[X^{1/p^∞}]/Z_p,perf}`, and the second map is an isomorphism. The map `T → T_∞` is a quasisyntomic cover, so the limit formula for `Δ_{S/A}` is also an instance of §2.17 when `S` is quasisyntomic; descendability gives it for every `S`.

**§2.27.** `S` perfectoid: `S_perfd = S` with the identity. `S = F_p[x]` over `(Z_p, (p))`: `S_perfd = F_p[x^{1/p^∞}]` is the universal perfect `F_p[x]-algebra`. `S = F_p[x^{1/p^∞}]/(x)` over `(Z_p, (p))`: `S_perfd = F_p[x^{1/p^∞}]/(x^{1/p^n}` : `n ≥ 0) = F_p`, the quotient by the radical. `S = O_C⟨x⟩`, `C` complete and algebraically closed over `Q_p`: there is no universal perfectoid S-algebra `U`. Indeed the automorphisms `t^{1/p^n} ↦ ζ_{p^n} t^{1/p^n}` of `O_C⟨t^{1/p^∞}⟩` fix `t`, so the map `U → O_C⟨t^{1/p^∞}⟩` classifying `t` would land in the invariants `O_C⟨t⟩`; but the image of `x` is a p-th power modulo `p` in `U` and `t` is not one in `(O_C/p)[t]`. Hence `S_perfd` is not connective.

**§2.28.** For `R=Z_p`, finite free modules are compatible systems over `Z/p^n`. Along `R→R⟨x^(1/p^∞)⟩`, finite projectives with descent datum descend. Bounded p-power torsion controls the classical/derived completion comparison and flatness modulo `p^n`.

### Dependencies

Layers `0`, `1`; DerivedDeRhamCohomology §§PD.6–PD.7, CrystallineCohomology §§CR.2.1–CR.2.3, DerivedModuleAlgebra §§0.1–0.17, 0.25, DerivedModuleAlgebra §§1.1–1.9; DerivedDeRhamCohomology §§1.10–1.23, DerivedDeRhamCohomology §§2.7–2.26, 5.8, DerivedDeRhamCohomology §3.4, CrystallineCohomology §§CR.DDR.4.5, CR.DDR.5.18–CR.DDR.5.22, DerivedDeRhamCohomology §§5.1–5.7, 5.17, EnhancedDerivedSheaves Layer E3 (relative Kan extensions), EnhancedDerivedSheaves Layers E5:abstract and E5:descent, EnhancedDerivedSheaves §E5:abstract.2, EnhancedDerivedSheaves §E5:abstract.1, EnhancedDerivedSheaves §§E5:animation.1, E5:animation.4, EnhancedDerivedSheaves §E5:animation.1, PerfectoidSpaces §§P1.16–P1.18, P1.24–P1.25, SchemeAndStackFoundations §1.1. Exact inputs are given in the supplier contracts; internal construction dependencies are linked above.

## Downstream consumers

[PrismaticCohomologyPartII](../PrismaticCohomologyPartII/README.md) consumes Layers 0–2. PadicHodgeTheory and CohomologyComparisons consume the completed comparisons.

## References

<a id="ref-lur11"></a>

- **Lur11**: Jacob Lurie. [Derived Algebraic Geometry XIII: Rational and p-adic Homotopy Theory](https://www.math.ias.edu/~lurie/papers/DAG-XIII.pdf). 2011, §2.2.

<a id="ref-hes10"></a>

- **Hes10**: Lars Hesselholt. [The big de Rham–Witt complex](https://arxiv.org/abs/1006.3125v3). arXiv:1006.3125v3; the p-typical restrictions of Lemmas 1.1 and 1.18 are used here.

<a id="ref-bha12"></a>

- **Bha12**: Bhargav Bhatt. [p-adic derived de Rham cohomology](https://arxiv.org/abs/1204.6560v1). arXiv:1204.6560v1, 30 April 2012.

<a id="ref-bl22"></a>

- **BL22**: Bhargav Bhatt and Jacob Lurie. [Absolute prismatic cohomology](https://arxiv.org/abs/2201.06120v1). arXiv:2201.06120v1, 16 January 2022.

<a id="ref-bms2"></a>

- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze. [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/abs/1802.03261v2). arXiv:1802.03261v2, 9 April 2019.

<a id="ref-alb23"></a>

- **ALB23**: Johannes Anschütz and Arthur-César Le Bras. [Prismatic Dieudonné theory](https://arxiv.org/abs/1907.10525v4). arXiv:1907.10525v4, 11 October 2022; numbering of the arXiv version.

<a id="ref-bms1"></a>

- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze. [Integral p-adic Hodge theory](https://arxiv.org/abs/1602.03148v3). arXiv:1602.03148v3, 16 January 2019.

<a id="ref-ky"></a>

- **KY**: Teruhisa Koshikawa and Zijian Yao. [Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364v1). arXiv:2306.00364v1, 1 June 2023 (98 pp.).

<a id="ref-bs22"></a>

- **BS22**: Bhargav Bhatt and Peter Scholze. [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4). arXiv:1905.08229v4, 12 January 2022, 125 pages; author version.

<a id="ref-arc"></a>

- **ARC**: Bhargav Bhatt and Akhil Mathew. [The arc-topology](https://arxiv.org/pdf/1807.04725v4). Version 4; numbered statements and printed pages.

<a id="ref-ff"></a>

- **FF**: Laurent Fargues and Jean-Marc Fontaine. [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf). Astérisque 406 (2018); printed book pages.

<a id="ref-mathew"></a>

- **Mathew**: Akhil Mathew. [Faithfully flat descent of almost perfect complexes in rigid geometry](https://arxiv.org/abs/1912.10968). Theorem 7.8, p.28, Definition 7.1 and Propositions 7.3–7.7, pp.27–28; Theorem 5.8, p.18, treats universal descent.

<a id="ref-cs"></a>

- **CS**: Kęstutis Česnavičius and Peter Scholze. [Purity for flat cohomology](https://arxiv.org/pdf/1912.10932v3). Theorem 5.3.5, pp.59–61, and Lemma 5.4.2, pp.63–66.

<a id="ref-ac"></a>

- **AC**: Marco D'Addezio. [Affine crystalline cohomology and de Rham cohomology in Lean 4](https://github.com/daddeziomath/affine-crystalline). Version 1.0.0, DOI [10.5281/zenodo.23573534](https://doi.org/10.5281/zenodo.23573534), Apache-2.0. An existing Lean 4 formalisation at an older Mathlib pin. Without `sorry` it proves the affine comparison of crystalline and PD de Rham cohomology for `p` nilpotent on an infinitesimal site of bounded nilpotence exponent, and the Čech computation `Rⁿ lim F ≅ Ȟⁿ(F)` of derived limits for large index categories with Čech nerve data (`CechNerveData`, `rightDerivedLimIsoCech`, `hasEnoughInjectivesFunctorCategory`), cited at §§1.7–1.8.

- **Stacks**: [Tag 0D4B](https://stacks.math.columbia.edu/tag/0D4B), effectivity of finite projective modules for adic completion.

The Mathlib source links in the supplier contracts are the files at commit `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; the Tau Ceti baseline is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Code declarations, rather than page numbers, locate these algebraic interfaces.

<a id="ref-pin-square"></a>

- **PIN-square**: [Mathlib/Algebra/TrivSqZeroExt/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/Algebra/TrivSqZeroExt/Basic.lean).

<a id="ref-pin-adic-complete"></a>

- **PIN-adic-complete**: [Mathlib/RingTheory/AdicCompletion/Completeness.lean](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RingTheory/AdicCompletion/Completeness.lean).

<a id="ref-k1"></a>

- **K1**: Teruhisa Koshikawa. [Logarithmic prismatic cohomology I](https://arxiv.org/pdf/2007.14037v3). Propositions 3.1–3.2, p.13; Appendix B, Lemma B.4, pp.61–62.

<a id="ref-lecture-v"></a>

- **Lecture V**: Bhargav Bhatt. [The prismatic site](https://www.math.ias.edu/~bhatt/teaching/prismatic-columbia/lecture5-prismatic-site.pdf). Lemma 5.1, p.6, with bounded base as specified on p.1. Section 0.93 gives the solution-set argument for unbounded bases and targets.
