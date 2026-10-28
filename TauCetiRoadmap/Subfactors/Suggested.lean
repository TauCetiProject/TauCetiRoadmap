/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Subfactors: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti. None is, so the file
declares nothing. Jones's positivity theorem for the Temperley–Lieb closure trace, which the
index restriction consumes, is a headline of TemperleyLiebOperatorAlgebras A4 and is stated
there, not here.

Not statable at the pins, because the carrier named in parentheses is missing:

* Jones index restriction, `[M:N] ∈ {4cos²(π/m) : m ≥ 3} ∪ [4,∞]` for every II₁ subfactor,
  and the identification of the kernel of the Temperley–Lieb action in the Jones tower with
  the trace radical (Layer 3). Mathlib has `VonNeumannAlgebra`, but no II₁ factor, no faithful normal tracial
  state, no coupling dimension and no Jones index.
* Realisation of every allowed index in the hyperfinite II₁ factor (Layer 4). There is no
  hyperfinite II₁ factor and no Jones index.
* Connes fusion and its coherence, the basic construction, Pimsner–Popa bases, the minimal
  index and statistical dimension (Layers 1–2). There are no normal correspondences, no
  standard form and no conditional expectation onto a von Neumann subalgebra.
* The Pimsner–Popa entropy formula and its equality criteria (Layer 2). There is no normal
  trace on a von Neumann algebra and no trace-preserving conditional expectation.
* Ocneanu compactness and the principal-graph bounds (Layers 4–5). There are no commuting
  squares, no weak-closure tower and no standard invariant.
* Planar-algebra reconstruction, the Burns rigid–spherical correspondence and the embedding
  theorems (Layers 6–8). There is no shaded planar operad and no planar algebra.
* Popa's classification of finite-depth hyperfinite inclusions and the ADE list below
  index 4 (Layer 9). There is no standard invariant and no Popa standard model.
* Penneys's extended-cone tangle action and the Burns rotation theorems, and Burns's type III
  relative-commutant example (Layer 10). There is no extended positive cone and no Connes
  fusion of bimodules over a II₁ factor.
-/
